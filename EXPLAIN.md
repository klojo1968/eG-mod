# eG-mod Header and Source File Guide

This document describes the repository's C/C++ headers and every C source file in `src/cgame`, `src/game`, and `src/client`.

Repository: [`klojo1968/eG-mod`](https://github.com/klojo1968/eG-mod)

## `src/cgame` C Source Files

| C file | Purpose |
|---|---|
| [`cg_atmospheric.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_atmospheric.c) | Rain, snow, fog, particles, and other atmospheric world effects. |
| [`cg_camera.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_camera.c) | Demo/cinematic camera playback and camera control. |
| [`cg_character.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_character.c) | Registers and retrieves client-side player character models. |
| [`cg_commandmap.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_commandmap.c) | Tactical command-map rendering, markers, filtering, objectives, and interaction. |
| [`cg_consolecmds.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_consolecmds.c) | Registers client-game console commands and argument completion. |
| [`cg_customcrosshair.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_customcrosshair.c) | Custom crosshair generation and rendering. |
| [`cg_cvars.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_cvars.c) | Client-game console-variable registration and updates. |
| [`cg_debriefing.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_debriefing.c) | End-of-match debriefing, stats, objectives, rankings, and medals. |
| [`cg_draw.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_draw.c) | Main 2D frame rendering, HUDs, crosshairs, text, reticles, fades, and active screen UI. |
| [`cg_draw_hud.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_draw_hud.c) | Configurable HUD component setup and drawing. |
| [`cg_drawtools.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_drawtools.c) | Low-level 2D primitives, rectangles, pictures, borders, and text layout. |
| [`cg_edv.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_edv.c) | Extended demo viewer controls and playback features. |
| [`cg_effects.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_effects.c) | Client-side visual effects, impacts, explosions, smoke, decals, and particles. |
| [`cg_ents.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_ents.c) | Converts server entity states into interpolated render entities. |
| [`cg_event.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_event.c) | Processes entity events into sounds, effects, weapon actions, damage, and animations. |
| [`cg_fireteamoverlay.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_fireteamoverlay.c) | Fireteam-member HUD overlay and status display. |
| [`cg_fireteams.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_fireteams.c) | Fireteam UI, joining, invitations, and member management. |
| [`cg_flamethrower.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_flamethrower.c) | Flamethrower flame chunks, trails, particles, and firing effects. |
| [`cg_hud_editor.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_hud_editor.c) | Interactive custom HUD editor and component controls. |
| [`cg_hud_iconfeed.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_hud_iconfeed.c) | Short-lived HUD icon feeds and notifications. |
| [`cg_hud_io.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_hud_io.c) | Loads, saves, parses, and applies custom HUD files. |
| [`cg_info.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_info.c) | Loading-screen and server/map information display. |
| [`cg_limbopanel.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_limbopanel.c) | Limbo/team/class/spawn selection menu. |
| [`cg_loadpanel.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_loadpanel.c) | Loading panel graphics and progress text. |
| [`cg_localents.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_localents.c) | Manages client-only effects such as particles, debris, gibs, brass, blood, sparks, and tracers. |
| [`cg_locations.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_locations.c) | Map location names and location-label lookup. |
| [`cg_main.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_main.c) | Client-game VM entry point, initialization, media precaching, shutdown, and shared setup. |
| [`cg_marks.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_marks.c) | Wall marks, decals, shadows, and impact splats. |
| [`cg_missionbriefing.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_missionbriefing.c) | Mission briefing and objective presentation. |
| [`cg_multiview.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_multiview.c) | Multiple-spectator view handling and camera selection. |
| [`cg_newDraw.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_newDraw.c) | Extended HUD owner-draw and new UI drawing integration. |
| [`cg_particles.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_particles.c) | Particle-system data and particle effect spawning/rendering. |
| [`cg_players.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_players.c) | Player models, poses, animations, skins, heads, names, and weapon rendering. |
| [`cg_playerstate.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_playerstate.c) | Interprets player-state changes and derives client-side status values. |
| [`cg_polybus.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_polybus.c) | Dynamic polygon-buffer allocation and rendering queue support. |
| [`cg_popupmessages.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_popupmessages.c) | Popup notifications for XP, objectives, deaths, pickups, votes, and team events. |
| [`cg_predict.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_predict.c) | Local movement prediction and correction against server snapshots. |
| [`cg_scoreboard.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_scoreboard.c) | Scoreboard, match results, player stats, teams, and ranks. |
| [`cg_servercmds.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_servercmds.c) | Processes reliable/unreliable server commands and updates client-game state. |
| [`cg_shoutcastoverlay.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_shoutcastoverlay.c) | Shoutcaster overlays, labels, feeds, and match information. |
| [`cg_snapshot.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_snapshot.c) | Snapshot interpolation, player-state transitions, and entity processing. |
| [`cg_sound.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_sound.c) | Voice chat, event sounds, footsteps, sound scripts, and sound precaching. |
| [`cg_spawn.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_spawn.c) | Parses and creates client-visible entities from map/entity definitions. |
| [`cg_spawnpoints.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_spawnpoints.c) | Spawn-point selection UI and spawn marker display. |
| [`cg_statsranksmedals.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_statsranksmedals.c) | Player statistics, rank progression, medals, and debriefing ranks. |
| [`cg_syscalls.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_syscalls.c) | Client-game VM syscall wrappers for engine services. |
| [`cg_trails.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_trails.c) | Trail junction creation for smoke, blood, missiles, sparks, and debris. |
| [`cg_view.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_view.c) | Camera bobbing, recoil, damage, zoom, and view shake logic. |
| [`cg_weapon_io.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_weapon_io.c) | Loads weapon configuration files and weapon model/media data. |
| [`cg_weapons.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_weapons.c) | Weapon registration, view/world rendering, animations, muzzle flashes, brass, trails, and switching. |
| [`cg_window.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_window.c) | Small client-game window system for menus, overlays, and interactive panels. |

## `src/game` C Source Files

| C file | Purpose |
|---|---|
| [`bg_animation.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_animation.c) | Shared player and model animation-state evaluation and scripting. |
| [`bg_animgroup.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_animgroup.c) | Loads and indexes animation-group definitions. |
| [`bg_b64.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_b64.c) | Base64 encode/decode helpers used by game and TV-game code. |
| [`bg_character.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_character.c) | Parses character definitions and manages shared character data. |
| [`bg_classes.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_classes.c) | Player-class definitions, weapons, skills, and class helpers. |
| [`bg_ebs.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_ebs.c) | Entity bitstream/compression helpers shared with TV-game code. |
| [`bg_misc.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_misc.c) | Shared item, model, animation, weapon, combat, and utility tables. |
| [`bg_pmove.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_pmove.c) | Shared player movement, collision, jumping, crouching, prone, and weapon movement logic. |
| [`bg_slidemove.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_slidemove.c) | Sliding collision and wall-interaction helpers for pmove. |
| [`bg_sscript.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_sscript.c) | Loads and manages speaker/scripted sound entities. |
| [`bg_tracemap.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_tracemap.c) | Generates/loads tracemap data for AI, locations, and movement. |
| [`et-antiwarp.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/et-antiwarp.c) | Server-side antiwarp and player-movement validation logic. |
| [`g_active.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_active.c) | Per-frame active entity and client thinking. |
| [`g_alarm.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_alarm.c) | Alarm entity behavior and state transitions. |
| [`g_antilag.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_antilag.c) | Server antilag hit processing and history replay. |
| [`g_buddy_list.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_buddy_list.c) | Buddy-list state helpers. |
| [`g_character.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_character.c) | Server-side character definitions and player-character lookup. |
| [`g_client.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_client.c) | Client connection, spawn, respawn, userinfo, and persistence. |
| [`g_cmds.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_cmds.c) | Server-game player console commands, chat, weapons, emotes, and actions. |
| [`g_cmds_ext.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_cmds_ext.c) | Extended/referee/utility server-game commands. |
| [`g_combat.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_combat.c) | Damage, death, team damage, gibs, revive, and means-of-death handling. |
| [`g_config.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_config.c) | Server match/configuration loading and config tracking. |
| [`g_cvars.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_cvars.c) | Server-game console-variable registration and initialization. |
| [`g_db.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_db.c) | Server-game database interface wrappers. |
| [`g_demo_legacy.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_demo_legacy.c) | Legacy demo compatibility helpers. |
| [`g_fireteams.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_fireteams.c) | Server-side fireteam creation, membership, and updates. |
| [`g_geoip.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_geoip.c) | GeoIP country lookup and client-location metadata. |
| [`g_items.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_items.c) | Item spawning, pickup, ammo, health, objectives, and item effects. |
| [`g_lua.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_lua.c) | Lua scripting integration and Lua API exposure for server-game mods. |
| [`g_main.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_main.c) | Main server-game DLL entry point, initialization, shutdown, and level lifecycle. |
| [`g_match.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_match.c) | Match warmups, round control, scoring, limits, and match completion. |
| [`g_match_tokens.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_match_tokens.c) | Match-token parsing and match-message helpers. |
| [`g_mdx.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_mdx.c) | Server-side MDX model animation and skeletal handling. |
| [`g_mem.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_mem.c) | Small server-game memory allocation helpers. |
| [`g_misc.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_misc.c) | Miscellaneous entities and map-object behavior. |
| [`g_missile.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_missile.c) | Projectile creation, movement, collision, and impact. |
| [`g_mover.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_mover.c) | Doors, platforms, trains, movers, and scripted movement. |
| [`g_multiview.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_multiview.c) | Server-side multiview/spectator support. |
| [`g_props.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_props.c) | Server-side map prop entities and prop behavior. |
| [`g_referee.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_referee.c) | Referee commands, match control, and administrative actions. |
| [`g_script.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_script.c) | Map/script parsing and script execution framework. |
| [`g_script_actions.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_script_actions.c) | Implementation of map-script actions. |
| [`g_session.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_session.c) | Per-client session state, spawn state, and disconnect handling. |
| [`g_sha1.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_sha1.c) | Game-module SHA-1 wrapper. |
| [`g_skillrating.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_skillrating.c) | XP/skill/rating calculation and persistence. |
| [`g_spawn.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_spawn.c) | Entity-class registration and map entity spawning. |
| [`g_stats.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_stats.c) | Player and weapon match statistics and logging. |
| [`g_strparse.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_strparse.c) | Server-game string parsing helpers. |
| [`g_svcmds.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_svcmds.c) | Server-console commands implemented by the game module. |
| [`g_syscalls.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_syscalls.c) | Game VM syscall wrapper definitions. |
| [`g_systemmsg.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_systemmsg.c) | Global system messages and team notification text. |
| [`g_target.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_target.c) | Target entities and target-trigger behavior. |
| [`g_team.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_team.c) | Team assignment, objectives, flags, reinforcement, and team communication. |
| [`g_teammapdata.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_teammapdata.c) | Team map/objective data and map-state synchronization. |
| [`g_trigger.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_trigger.c) | Trigger entities, touch, objective, damage, and map-event handling. |
| [`g_utils.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_utils.c) | General server-game utility functions and entity helpers. |
| [`g_vote.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_vote.c) | Vote initiation, counting, execution, and vote UI state. |
| [`g_weapon.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_weapon.c) | Weapon firing, damage, ammo, projectile, and inventory behavior. |
| [`g_xpsave.c`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_xpsave.c) | XP save/load persistence in SQLite-backed server data. |

## `src/client` C Source Files

| C file | Purpose |
|---|---|
| [`cl_avi.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_avi.c) | AVI-like video capture/output support. |
| [`cl_cgame.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_cgame.c) | Loads and dispatches the client-game module. |
| [`cl_cinematic.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_cinematic.c) | Cinematic playback and client rendering integration. |
| [`cl_console.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_console.c) | Client console rendering, history, input, and command display. |
| [`cl_cvars.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_cvars.c) | Registers client console variables. |
| [`cl_db.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_db.c) | Client-side database access and profile/statistics support. |
| [`cl_demo.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_demo.c) | Demo recording, playback, seek, rewind, and demo state. |
| [`cl_input.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_input.c) | Keyboard/mouse/controller input, commands, and usercmd creation. |
| [`cl_keys.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_keys.c) | Key binding, key catcher, binding completion, and key event handling. |
| [`cl_main.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_main.c) | Main client lifecycle, connection, gamestate, frames, and shutdown. |
| [`cl_net_chan.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_net_chan.c) | Client network channel packet send/receive helpers. |
| [`cl_ogv.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_ogv.c) | OGV/Theora cinematic decoding support. |
| [`cl_parse.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_parse.c) | Parses server messages, snapshots, configstrings, and entity updates. |
| [`cl_roq.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_roq.c) | Legacy RoQ/Id cinematic playback support. |
| [`cl_scrn.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_scrn.c) | Client screen, framebuffer updates, loading screen, and renderer scene setup. |
| [`cl_ui.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_ui.c) | Loads and dispatches UI module calls. |
| [`qal.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/qal.c) | OpenAL API function loading and compatibility wrapper. |
| [`snd_adpcm.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_adpcm.c) | ADPCM audio decode support. |
| [`snd_codec.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_codec.c) | Registers and dispatches audio codec implementations. |
| [`snd_codec_ogg.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_codec_ogg.c) | Ogg/Vorbis audio decoding. |
| [`snd_codec_wav.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_codec_wav.c) | WAV audio loading and decoding. |
| [`snd_dma.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_dma.c) | Sound DMA buffers, mixing setup, channels, and output streaming. |
| [`snd_main.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_main.c) | Main sound-subsystem initialization and public sound calls. |
| [`snd_mem.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_mem.c) | Sound sample caching and memory ownership. |
| [`snd_mix.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_mix.c) | Mixing, attenuation, looping, fading, and spatial sound mixing. |
| [`snd_openal.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_openal.c) | OpenAL backend implementation and audio-device control. |
| [`snd_wavelet.c`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_wavelet.c) | Wavelet audio decompression support. |
