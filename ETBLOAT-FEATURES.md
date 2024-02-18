# etbloat features

This is a list of new features. All features are configurable.

Please note that stability is **not** guaranteed.

## New features

* Custom dynamite counter duration
* Double jump
* Weapon table customization

## New cvars

### *g_doubleJump*

Controls double jump.

Values:
* 0: disable (default)
* 1: Jaymod style (recommended): prevent double jump after a short period
* 2: Nitmod style: double jump not prevented
* 3: ETPub style: prevent double jump based on velocity

### *g_doubleJumpHeight*

Height multiplier for the second jump.

Default value: 1.4

Values must be greater than 0

### *g_dynamiteCounter*

Dynamite counter duration.

Default value: 30

## Weapon table customization

It is possible to modify some values in the weapon table. To do that, some files need to
be created and placed in a `.pk3` zip archive, in the `etbloat` mod directory on the
server. This archive needs to be available for download to the clients connecting to the
server.

The files in the archive need to be placed in a directory named `weapontable`. The files
need to be named `weapFile.weapontable` where `weapFile` is the value for the attribute
`weapFile` defined for the weapon in the weapon table. The same names are used for the
weapon files in the `pak0.pk3` archive (in `etmain`), as `weapons/weapFile.weap`. For
example, to modify the Thompson weapon, create a file named
`weapontable/thompson.weapontable`.

You can check the source code for the file
[src/game/bg_misc.c](https://gitlab.com/Exagone313/etbloat/-/blob/etbloat/src/game/bg_misc.c)
to read the full weapon table content (`weaponTable`).

These attributes can be edited for each weapon:
* `skillBased`
* `damage`
* `maxAmmo`
* `reloadTime`
* `fireDelayTime`
* `nextShotTime`
* `maxHeat`
* `coolRate`
* `heatRecoveryTime`

Note: More attributes may be editable in the future.

The file uses the same format as *source* files used elsewhere in the game. The root token
is named `weaponTable`, child tokens are a key value store of an attribute mentioned above
and its new value. If an attribute is not defined, its default value will be used.

```
weaponTable
{
    attribute1Name attribute1Value
    attribute2Name attribute2Value
}
```

Here is an example of an archive tree structure:
```
weapontable/
├── mp40.weapontable
├── sten.weapontable
└── thompson.weapontable
```

It contains these files:
* `weapontable/mp40.weapontable`
    ```
    weaponTable
    {
        nextShotTime 110
        maxAmmo 150
    }
    ```
* `weapontable/sten.weapontable`
    ```
    weaponTable
    {
        nextShotTime 110
        maxAmmo 150
        maxHeat 1400
        coolRate 300
        heatRecoveryTime 1800
    }
    ```
* `weapontable/thompson.weapontable`
    ```
    weaponTable
    {
        nextShotTime 110
        maxAmmo 150
    }
    ```

In this configuration, the MP 40, Thompson and Sten weapons will be over powered compared
to the original weapons.
