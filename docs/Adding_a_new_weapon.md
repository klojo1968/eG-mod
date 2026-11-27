# Adding a Complete New Weapon to eG-mod

A practical checklist, based on the M97 shotgun and poison bomb ports. It describes **what to change and where**, in the order that causes the fewest build and runtime problems.

> **Scope and honesty note.** This was assembled from porting the M97 into your tree (ET:Legacy 2.86 base, table-driven weapons). File and symbol names are taken from that work. Always re-check a symbol against your current source before editing, since the tree moves. Items marked *(optional)* are only needed for the matching feature.

---

## 0. Overview: how a weapon is wired

A weapon in this codebase is mostly **data in tables**, plus a few places that need real code:

| Layer | What it holds | Mostly data or code? |
|---|---|---|
| `bg_public.h` / `bg_misc.c` | enum IDs, weapon table, MOD (kill cause) table, item table, stats table | data |
| `bg_classes.c` | which classes can use it | data |
| `g_weapon.c` | what happens when it fires (server) | **code** + one table row |
| `bg_pmove.c` | reload, fire timing, special states (shared server and client) | data-driven; **code** only for non-standard behaviour |
| `cgame/*` | weapon bank, effects, brass, sounds, HUD | mixed |
| `etmain/weapons/*.weap`, `models/…/weapon.cfg` | client media definition | data |
| `animations/*` | first-person (weapon.cfg) and third-person (script + anim) | data |
| `g_lua.c`, `tvg_lua.c` | Lua constants | data |

If your weapon behaves like an existing one (an SMG, a pistol, a grenade), **copy that weapon's table row and `.weap`** and change values. Only write new code for behaviour that doesn't exist yet (shotgun pellets, shell-by-shell reload, new projectile, etc.).

---

## 1. Master checklist

Tick these off in order.

- [ ] **1.** Enums: `WP_xxx`, `MOD_xxx`, `ITEM_WEAPON_xxx`, `WS_xxx` (`bg_public.h`)
- [ ] **2.** Weapon table row (`bg_misc.c`, `weaponTable`)
- [ ] **3.** MOD table row (`bg_misc.c`, `modTable`)
- [ ] **4.** Item list entry (`bg_misc.c`, `bg_itemlist`)
- [ ] **5.** Weapon-stat info row (`bg_misc.c`, `aWeaponInfo`) and ranking threshold (`g_cmds_ext.c`, `cQualifyingShots`)
- [ ] **6.** Class availability (`bg_classes.c`)
- [ ] **7.** Fire function and dispatch row (`g_weapon.c`)
- [ ] **8.** Special pmove behaviour *(optional)* (`bg_pmove.c`)
- [ ] **9.** Weapon bank slot (`cg_weapons.c`, `cg_local.h`)
- [ ] **10.** `.weap` file, `weapon.cfg`, skins, shader, models, sounds, icons
- [ ] **11.** Animations: first-person (`weapon.cfg`), third-person (`human_base.script`, `human_base.anim`)
- [ ] **12.** Client effects *(optional)*: events, brass, scale, muzzle flash (`cg_event.c`, `cg_weapons.c`, `cg_weapon_io.c`)
- [ ] **13.** Lua constants (`g_lua.c`, `tvg_lua.c`)
- [ ] **14.** Bots *(optional)* (`src/game/etbot/g_etbot_interface.cpp`)
- [ ] **15.** Cvars / restrictions *(optional)* (`g_cvars.c`, `g_cvars.h`, `g_client.c`)
- [ ] **16.** Build **both** the game and cgame modules (and tvgame if you use it), pack assets, test

---

## 2. Step-by-step

### 2.1 Enums: `src/game/bg_public.h`

Add one entry to each of these. Keep the order consistent with the tables, because several tables are indexed **positionally**.

```c
// weapon_t: add BEFORE WP_NUM_WEAPONS
WP_M97,                 // 61
WP_NUM_WEAPONS

// meansOfDeath_t: add BEFORE MOD_NUM_MODS
MOD_M97,

// item enum: add BEFORE ITEM_MAX_ITEMS
ITEM_WEAPON_M97,

// extWeaponStats_t: add BEFORE WS_MAX (only if you want real stats, see 2.5)
WS_M97,
```

**Hard limits to respect**

| Limit | Value | Where it bites |
|---|---|---|
| Total weapons | `MAX_WEAPONS` = **64** | `ps->weapons`, `ammo[]`, `ammoclip[]` are sized by it |
| Weapon-stat slots | **31 or fewer** in practice | the stats masks are 32-bit (`1 << i`); slot 31 would overflow an `int` |
| Weapon-bank row width | `MAX_WEAPS_IN_BANK_MP` | the primary row was full at 18 entries; raise the macro if you add one |
| Weapon parts (models) | `W_MAX_PARTS` | 7 by default; the M97 needs 8 (see 2.10) |

If the weapon needs per-player state that survives between frames (like the shotgun reload step), add fields to `pmoveExt_t` in the same header.

### 2.2 Weapon table: `src/game/bg_misc.c`

Add **one row at the end** of `weaponTable` (order must match the enum). Copy the closest existing weapon and edit it. Column order, as used in this tree (verify against `weaponTable_t` in `bg_public.h`):

```
weapon, item, team, skillBased, weapAlts, weapEquiv, akimboSideArm,
ammoIndex, clipIndex, damage, spread, spreadScale, splashDamage, splashRadius,
type, firingMode, attributes, zoomOut, zoomIn, desc, indexWeaponStat,
useAmmo, useClip, maxAmmo, uses, maxClip, reloadTime, fireDelayTime, nextShotTime,
grenadeTime, aimSpreadScaleAdd, maxHeat, coolRate, heatRecoveryTime,
switchTimeBegin, switchTimeFinish, altSwitchTimeFrom, altSwitchTimeTo, knockback,
muzzlePointOffset, weapRecoilDuration, weapRecoilPitch[2], weapRecoilYaw[2],
className, weapFile, chargeTimeSkill, chargeTimeCoeff[2], mod, splashMod
```

Fields that matter most:

| Field | Meaning | Gotcha |
|---|---|---|
| `type` | `WEAPON_TYPE_SMG / RIFLE / PISTOL / GRENADE …` | It drives many hard-coded behaviours (extra-ammo rules, scoping, silencers). **`RIFLE` has a lot of coupling**; the M97 uses `SMG` for this reason. |
| `firingMode` | automatic, semi-auto, throwable, one-shot … | Semi-auto weapons only auto-reload if the player's `bAutoReload` is on. |
| `attributes` | `FALL_OFF`, `FAST_RELOAD`, `CHARGE_TIME`, `FIRE_UNDERWATER` … | `FAST_RELOAD` is applied by the standard reload only; custom reloads must handle it themselves. |
| `indexWeaponStat` | which `WS_` slot tracks it | `WS_MAX` means "no stats" (used by poison bomb); see 2.5. |
| `weapFile` | name of the `.weap` file, e.g. `"m97"` | must match `etmain/weapons/m97.weap` |
| `damage` / `spread` | per-bullet damage; spread cone size | For multi-pellet weapons, `damage` is **per pellet**. |
| `mod` / `splashMod` | `MOD_xxx` | must exist in `modTable` |

### 2.3 MOD (kill cause) table: `bg_misc.c`, `modTable`

Add a row in the **same position as the enum**. It controls the obituary text, headshot capability, skill XP and which stat slot the kill is credited to.

```c
{ MOD_M97, WP_M97, qfalse /*headshot capable*/, qfalse, WEAPON_CLASS_FOR_MOD_NO, qfalse,
  "was killed by", "'s M97", "killed himself", NULL, "MOD_M97",
  SK_LIGHT_WEAPONS, 3.f, 0.f, {5.f, 3.f, 3.f, 3.f}, qfalse, "", 2, WS_M97 },
```

Set the last column (stat index) to your `WS_` slot, or `WS_MAX` for no stats.

### 2.4 Item list: `bg_misc.c`, `bg_itemlist`

Add an entry so the weapon can be picked up and given. The weapon's pickup **name** (e.g. `"M97"`) is also what the **animation script** uses to match the weapon (see 2.11).

```c
{ ITEM_WEAPON_M97, "weapon_m97", "sound/misc/w_pkup.wav",
  { "models/weapons2/m97/m97_pickup.md3", "models/weapons2/m97/v_m97.md3", 0 },
  "icons/iconw_thompson_1", "icons/ammo2", "M97", 30, IT_WEAPON, WP_M97, PW_NONE, … },
```

### 2.5 Weapon stats (accuracy, kills, rankings)

You have two options:

**A. No stats (simple, safe)**: set `indexWeaponStat = WS_MAX` in the weapon row and `WS_MAX` in the MOD row. The poison bomb does this.

**B. Real stats**:

1. `bg_public.h`: add `WS_xxx` before `WS_MAX`.
2. `bg_misc.c`: add a row to `aWeaponInfo[]` in the same position (`{ hasHeadshots, "CODE", "Display name" }`). Mind the trailing comma on the previous last row.
3. `g_cmds_ext.c`: add a value to `cQualifyingShots[]` (shots needed to appear in rankings).
4. Set `indexWeaponStat` in the weapon row and the MOD row to the new `WS_`.
5. If one trigger pull fires many traces (shotgun), **collapse the hits to one per shot** in the fire function, otherwise accuracy can exceed 100% (see the `hitsBefore` pattern in `Weapon_M97`).

Everything else (sessions, debriefing, limbo, `/wstats`) loops over `WS_MAX` and needs no change, as long as you stay inside the 32-bit mask limit.

### 2.6 Class availability: `src/game/bg_classes.c`

Add the weapon to each class's **primary** (or secondary) list, for both teams:

```c
{ WP_M97, SK_LIGHT_WEAPONS, 0 /*skill level required*/, 12 /*start ammo*/, 6 /*start clip*/ },
```

- A class holds up to 8 primary weapons. **Append at the end** so each class's default weapon (index 0) stays the same.
- Grenades, tools and explosives are separate lists in the same file (look at how the poison bomb or tripmine were added).
- To restrict to one class, only add it to that class entry.

### 2.7 Fire function: `src/game/g_weapon.c`

Every weapon needs a row in `weapFireTable` (same position as the enum), pointing at a fire function. Existing generic functions cover most cases (`Bullet_Fire` for hitscan, `weapon_grenadelauncher_fire` for thrown items, etc.).

For a new behaviour, write a function with this shape and add it **before** the table:

```c
gentity_t *Weapon_M97(gentity_t *ent)
{
    // set up traces
    G_HistoricalTraceBegin(ent);
    G_TempTraceIgnoreBodies();

    for (i = 0; i < M97_COUNT; i++)
    {
        // compute an end point, then
        Bullet_Fire_Extended(ent, ent, muzzleTrace, end, forward, damage, falloff, mod);
    }

    G_ResetTempTraceIgnoreEnts();
    G_HistoricalTraceEnd(ent);
    return NULL;          // return the projectile entity for missile weapons
}
```

and the table row:

```c
{ WP_M97, Weapon_M97, NULL, NULL, ET_GENERAL, EF_NONE, SVF_NONE, CONTENTS_NONE, TR_LINEAR, … },
```

For missile weapons, copy the row of a similar projectile (grenade, rocket) and set its think/explode function.

> Shots fired are already counted centrally in `FireWeapon` (`atts++` once per trigger pull). Do not count them again in your function.

### 2.8 Special reload / firing behaviour: `src/game/bg_pmove.c`

Standard weapons need **no code** here: reload time, clip size, fire delay and recoil come from the weapon table. Write pmove code only for non-standard behaviour. The M97 shell-by-shell reload is the worked example:

1. Hook into `PM_BeginWeaponReload` (after the "full clip" and "leaning" checks) and branch to your own begin function.
2. Override `PM_ReloadClip` if you move a different number of rounds.
3. Hook into `PM_FinishWeaponReload` to run your step logic each time `weaponTime` expires.
4. Allow interrupts in `PM_CheckForReload` (the M97 stops after the current shell when fire is pressed).
5. Keep multi-step state in a `pmoveExt_t` field (declare it in `bg_public.h`).
6. Define timings next to the weapon constants in `bg_public.h`. They must match the animation lengths in `weapon.cfg`.

**Pitfall that cost a debugging round:** in `PM_Weapon`, after the `case WEAPON_RELOADING: PM_FinishWeaponReload();` the function falls through to a "fire button not pressed" check that forces `weaponstate = WEAPON_READY` and clears `weaponTime`. A multi-step reload must `return` early while it is still in `WEAPON_RELOADING`, or it is cancelled after the first step.

Pmove code runs on **both** server and client (prediction), so anything you add must be deterministic and compile in both `GAMEDLL` and `CGAMEDLL`.

### 2.9 Weapon bank (HUD weapon selection): `src/cgame/cg_weapons.c`, `cg_local.h`

`weapBanksMultiPlayer[][]` decides which number-key bank the weapon appears in. If the bank row is full, raise `MAX_WEAPS_IN_BANK_MP` in `cg_local.h`.

### 2.10 Client media definition

**`etmain/weapons/<name>.weap`**: the main client file. Easiest method: copy a working `.weap` of a similar weapon and replace paths. Contents: models and weapon parts, sounds (fire, far, last shot, reload, no-ammo), muzzle flash, brass ejection, icons, weapon card, impact sounds and marks, recoil, `ejectBrassOffset`, optional `scaleFirstPerson`.

**Important:** eG-mod's parser rejects tokens it doesn't know. Jaymod-only tokens in imported files cause errors such as `unknown token`. To verify a `.weap` before testing, check each token against the parser in `src/cgame/cg_weapon_io.c`.

**Weapon parts limit:** `W_MAX_PARTS` caps how many `part N` entries a weapon can have. The M97 needed 8, so `W_PART_8` was added in `cg_local.h`, and the "animated weapon" flag in `cg_weapon_io.c` was pinned to bit 7 so it doesn't collide with the part-hide bits (`partid + 8`).

**Other files per weapon**

| File | Purpose |
|---|---|
| `models/weapons2/<w>/weapon.cfg` | first-person animation frames and timings |
| `models/weapons2/<w>/*_axis.skin`, `*_allied.skin` | team skins |
| `scripts/<w>.shader` | shaders for the model |
| `icons / simpleicons / weaponcard` | HUD, selection and limbo card art |
| `sound/weapons/<w>/*.wav` | fire, far fire, reload, pump, etc. |
| models (`.md3/.mdc`) | stand, pickup, first-person, hand, parts, shell/brass |

Binary assets (models, sounds, textures) must be placed in your pk3. They are not part of a source diff.

### 2.11 Animations

**First-person** is defined in `weapon.cfg`. Frame counts × frame time must equal the timing constants you use in pmove (reload step lengths and so on).

**Third-person** (what other players see):

1. `src/game/bg_public.h`: add new animation event enums if you need new actions (for example `ANIM_ET_RELOAD_SG1/2/3`).
2. `src/game/bg_animation.c`: add matching names to the event-name table, **in the same order as the enum**.
3. `etmain/animations/human_base.anim`: add frame definitions (name, first frame, frame count, loop frames, fps …). Re-using the rifle reload frames is fine.
4. `etmain/animations/scripts/human_base.script`:
   - add the weapon's **pickup name** to the weapon groups (`set weapons rifles … AND M97`, plus `two_handed_weapons`, `all`, `all_two_handed_weapons`),
   - add event blocks that map the new events to the new animations.

If the new weapon behaves like an existing one, just adding it to the right weapon groups is enough and no new animations are needed.

### 2.12 Client effects *(optional)*

| Effect | Where |
|---|---|
| New sound/visual event | add `EV_xxx` before `EV_MAX_EVENTS` in `bg_public.h`; add its name to the event-name table in `bg_misc.c`; handle it in `cg_event.c`; emit it with `PM_AddEvent(EV_xxx)` (pmove) or a temp entity (game) |
| Shell/brass model | register in `cg_main.c` (`cgs.media`), select it in the eject-brass function in `cg_weapons.c`, choose a bounce sound type |
| First-person scale | `scaleFirstPerson` (parser in `cg_weapon_io.c`, applied in `cg_weapons.c`) |
| Muzzle flash, tracers, impacts | `.weap` file |
| Recoil | weapon table (`weapRecoil*`) and `fireRecoil` in `.weap` |

Prefer standard events and `.weap` options. They avoid prediction desync. Custom events are only worth it when no existing hook fits.

### 2.13 Lua constants: `src/game/g_lua.c`, `src/tvgame/tvg_lua.c`

Register the new constants in **both** files:

```c
lua_regconstinteger(vm->L, WP_M97);
lua_regconstinteger(vm->L, MOD_M97);
```

### 2.14 Bots *(optional)*: `src/game/etbot/g_etbot_interface.cpp`

Bot weapon mapping lives here (it references `WP_MP34`, for example). Without an entry bots will not use the weapon, which is fine unless you want them to.

### 2.15 Restrictions and cvars *(optional)*

The poison mine added a `g_poisonmine` cvar plus a class check in `g_client.c`. To make a weapon toggleable or class-limited at runtime, follow that pattern: declare the cvar in `g_cvars.c` and `g_cvars.h`, then gate the weapon grant or `AddWeaponToPlayer` logic in `g_client.c`. Per-team limits (like `team_maxPanzers`) live in the same area of the code.

---

## 3. Where each kind of change goes (quick reference)

| I want to change… | File(s) |
|---|---|
| Damage, spread, clip size, ammo, fire rate | `bg_misc.c` weapon table |
| Who can carry it | `bg_classes.c` |
| What the shot does | `g_weapon.c` |
| Reload / fire-state behaviour | `bg_pmove.c` (+ `bg_public.h` for state and timings) |
| Kill message, XP, headshots | `bg_misc.c` MOD table |
| Accuracy / rankings | `WS_` enum, `aWeaponInfo`, `cQualifyingShots`, hit counting in the fire function |
| Models, sounds, flash, brass, icons | `.weap`, `weapon.cfg`, skins, shaders |
| What other players see | `human_base.script`, `human_base.anim`, `bg_animation.c` |
| Number-key bank slot | `cg_weapons.c`, `cg_local.h` |
| Lua scripts | `g_lua.c`, `tvg_lua.c` |
| Bots | `etbot/g_etbot_interface.cpp` |

---

## 4. Common pitfalls (all encountered while porting the M97)

1. **Tables are positional.** Enum order and table order must match. Append at the end.
2. **`unknown token` in a `.weap`**: the parser is stricter than other mods. Check tokens against `cg_weapon_io.c`.
3. **`part index out of bounds`**: more `part N` entries than `W_MAX_PARTS`. Raise it and mind the bit-flag layout.
4. **Multi-step reload cancelled after one step**: the `PM_Weapon` fall-through described in 2.8.
5. **Accuracy above 100%** on multi-trace weapons: collapse hits to one per shot.
6. **Stats mask overflow**: more than 31 weapon-stat slots overflows the 32-bit masks.
7. **Weapon bank row full**: raise `MAX_WEAPS_IN_BANK_MP`.
8. **`type` side effects**: `WEAPON_TYPE_RIFLE` pulls in scope/silencer/rifle-grenade logic. Choose the type deliberately.
9. **Client/server mismatch**: pmove code runs on both. A change in only one module (or a non-networked state field such as a `pmoveExt_t` member) can cause prediction glitches. **Rebuild and deploy the game and cgame modules together.**
10. **Missing assets** show up as invisible models or silent weapons, not as compile errors. Check the console for failed registrations.
11. **Forgetting tvgame/Lua** compiles fine but breaks scripts or TV builds.

---

## 5. Build and test checklist

1. Compile game, cgame and tvgame (`-DGAMEDLL`, `-DCGAMEDLL` variants).
2. Pack assets into a pk3 under `etmain/`, keeping the paths used in the `.weap`.
3. Start a local server, then check the console for `ERROR:` / `failed to register media` lines.
4. In game, test: pickup or class loadout, firing (damage, spread, falloff), sounds, muzzle flash, brass, reload (empty and partial, standing and prone), reload interrupt, weapon switching mid-reload, ammo refills (supply/medic), kill message, stats screen, and third-person animations as seen from a second client.
5. Test with prediction under latency (`cl_timenudge`, or a remote server) to catch pmove desync.

---

## 6. Minimal recipe for a *simple* clone weapon

If the new weapon is just a rebalanced variant of an existing gun (no new behaviour):

1. Enums (2.1) → weapon row (2.2, copy a similar row) → MOD row (2.3) → item entry (2.4).
2. `bg_classes.c` (2.6).
3. Fire table row pointing at the **existing** fire function (2.7).
4. Weapon bank (2.9).
5. A copied-and-edited `.weap` (2.10).
6. Add its pickup name to the animation script weapon groups (2.11).
7. Lua constants (2.13).

No pmove or new-animation code needed.
