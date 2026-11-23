# eG-mod Header File and src/cgame C Source Guide

This document explains the purpose of the repository's C/C++ header files and header templates, plus every C source file in `src/cgame`.

Repository: [`klojo1968/eG-mod`](https://github.com/klojo1968/eG-mod)

## Core Engine Headers

| Header | Purpose |
|---|---|
| [`src/qcommon/q_shared.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/q_shared.h) | Central shared types, constants, networking structures, player/entity state, and compatibility definitions used throughout the engine and mods. |
| [`src/qcommon/qcommon.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/qcommon.h) | Public common-engine API for commands, virtual machines, file access, networking, console variables, and system services. |
| [`src/qcommon/q_platform.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/q_platform.h) | Platform-specific compiler, operating-system, architecture, and portability definitions. |
| [`src/qcommon/q_primitives.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/q_primitives.h) | Basic scalar types, inline helpers, and primitive declarations shared by engine modules. |
| [`src/qcommon/q_math.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/q_math.h) | Vector, matrix, angle, plane, and collision mathematics declarations. |
| [`src/qcommon/q_oss.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/q_oss.h) | Operating-system abstraction definitions for paths and platform services. |
| [`src/qcommon/q_unicode.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/q_unicode.h) | Unicode and UTF-8 conversion and validation utilities. |
| [`src/qcommon/qfiles.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/qfiles.h) | Definitions for engine map, model, animation, and other binary file formats. |
| [`src/qcommon/keycodes.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/keycodes.h) | Keyboard and input key-code constants. |
| [`src/qcommon/cm_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/cm_local.h) | Internal collision-map structures and routines for loading and testing BSP collision data. |
| [`src/qcommon/cm_patch.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/cm_patch.h) | Internal declarations for curved-patch tessellation used by collision processing. |
| [`src/qcommon/cm_polylib.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/cm_polylib.h) | Polygon splitting, clipping, and winding helpers for BSP construction. |
| [`src/qcommon/cm_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/cm_public.h) | Public collision-model API for loading maps and testing traces and contents. |
| [`src/qcommon/dl_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/dl_public.h) | Public download-manager API for HTTP, cURL, and platform-specific downloads. |
| [`src/qcommon/i18n_findlocale.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/i18n_findlocale.h) | Locale discovery and system-language detection declarations. |
| [`src/qcommon/puff.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/puff.h) | DEFLATE decompression interface used for compressed data. |
| [`src/qcommon/version.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/version.h) | Generated and configured product, build, and protocol version constants. |
| [`src/qcommon/vm_ext.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/vm_ext.h) | Virtual-machine extension interfaces and additional VM syscall definitions. |
| [`src/qcommon/vm_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/vm_local.h) | Internal virtual-machine structures for bytecode and native VM execution. |
| [`src/qcommon/json/json.h`](https://github.com/klojo1968/eG-mod/blob/master/src/qcommon/json/json.h) | Lightweight JSON parser and serializer used by engine subsystems. |

## Client Headers

| Header | Purpose |
|---|---|
| [`src/client/client.h`](https://github.com/klojo1968/eG-mod/blob/master/src/client/client.h) | Central client state, console, networking, snapshot, menu, and subsystem declarations. |
| [`src/client/keys.h`](https://github.com/klojo1968/eG-mod/blob/master/src/client/keys.h) | Client key bindings, key state, and key-name definitions. |
| [`src/client/cl_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/client/cl_cvars.h) | Client console-variable declarations and defaults. |
| [`src/client/qal.h`](https://github.com/klojo1968/eG-mod/blob/master/src/client/qal.h) | OpenAL API-loading wrapper and function pointers. |
| [`src/client/snd_codec.h`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_codec.h) | Audio-codec plugin interface shared by WAV, Ogg, and other decoders. |
| [`src/client/snd_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_local.h) | Internal sound mixing, streaming, memory, and backend structures. |
| [`src/client/snd_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/client/snd_public.h) | Public client sound API. |

## Server Headers

| Header | Purpose |
|---|---|
| [`src/server/server.h`](https://github.com/klojo1968/eG-mod/blob/master/src/server/server.h) | Dedicated and listen-server state, client, snapshot, demo, and world-management declarations. |
| [`src/server/sv_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/server/sv_cvars.h) | Server console-variable declarations and defaults. |
| [`src/server/sv_tracker.h`](https://github.com/klojo1968/eG-mod/blob/master/src/server/sv_tracker.h) | Extended server-statistics and tracking structures. |

## Shared Game/Mod Headers

| Header | Purpose |
|---|---|
| [`src/game/bg_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_public.h) | Shared server-game/client-game content: weapons, classes, entities, movement, animation, items, objectives, and combat definitions. |
| [`src/game/bg_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_local.h) | Internal shared-game-module structures and helper declarations. |
| [`src/game/bg_b64.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_b64.h) | Base64 encoding and decoding API. |
| [`src/game/bg_ebs.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/bg_ebs.h) | Entity bitstream and state-compression declarations shared with TV/game code. |
| [`src/game/g_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_local.h) | Main server-side game-module implementation structures and function declarations. |
| [`src/game/g_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_public.h) | Public server-game API exported by the mod DLL or VM. |
| [`src/game/g_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_cvars.h) | Server-game console-variable declarations and defaults. |
| [`src/game/g_lua.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_lua.h) | Lua scripting integration declarations for the server game. |
| [`src/game/g_mdx.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_mdx.h) | MDX skeletal-model loading and animation declarations. |
| [`src/game/g_mdx_lut.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_mdx_lut.h) | Large lookup-table data used by MDX model handling. |
| [`src/game/g_strparse.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_strparse.h) | String parsing helpers for game configuration and scripts. |
| [`src/game/g_etbot_interface.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/g_etbot_interface.h) | Interface between the server game and bot integrations. |
| [`src/game/luajit_compat.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/luajit_compat.h) | Compatibility macros and declarations for LuaJIT support. |
| [`src/game/surfaceflags.h`](https://github.com/klojo1968/eG-mod/blob/master/src/game/surfaceflags.h) | Surface and content flag constants used by collision, rendering, and map code. |

## Client Game and UI Headers

| Header | Purpose |
|---|---|
| [`src/cgame/cg_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_local.h) | Central client-game state, HUD, weapon, entity, rendering, and local prediction declarations. |
| [`src/cgame/cg_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_public.h) | Client-game import/export API and snapshot interfaces to the engine. |
| [`src/cgame/cg_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_cvars.h) | Client-game console-variable declarations. |
| [`src/ui/ui_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/ui/ui_local.h) | Internal user-interface module state and menu implementation declarations. |
| [`src/ui/ui_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/ui/ui_public.h) | Public UI-module API exported to the engine. |
| [`src/ui/ui_shared.h`](https://github.com/klojo1968/eG-mod/blob/master/src/ui/ui_shared.h) | Menu parsing and UI structures shared by the UI module and client game. |
| [`src/ui/ui_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/ui/ui_cvars.h) | UI-module console-variable declarations. |
| [`etmain/ui/menudef.h`](https://github.com/klojo1968/eG-mod/blob/master/etmain/ui/menudef.h) | Main menu-system constants and item/property definitions. |
| [`etmain/ui/menumacros.h`](https://github.com/klojo1968/eG-mod/blob/master/etmain/ui/menumacros.h) | Reusable menu-definition macros for ET: Legacy menu files. |

## Bot, IRC, Database, and TV Headers

| Header | Purpose |
|---|---|
| [`src/botlib/be_interface.h`](https://github.com/klojo1968/eG-mod/blob/master/src/botlib/be_interface.h) | Bot-engine interface used to connect the game server to bot logic. |
| [`src/botlib/botlib.h`](https://github.com/klojo1968/eG-mod/blob/master/src/botlib/botlib.h) | Public bot-library API for navigation, goals, memory, and script execution. |
| [`src/botlib/l_memory.h`](https://github.com/klojo1968/eG-mod/blob/master/src/botlib/l_memory.h) | Memory-allocation structures used by bot preprocessor and script code. |
| [`src/botlib/l_precomp.h`](https://github.com/klojo1968/eG-mod/blob/master/src/botlib/l_precomp.h) | Bot-script tokenizer and preprocessor declarations. |
| [`src/botlib/l_script.h`](https://github.com/klojo1968/eG-mod/blob/master/src/botlib/l_script.h) | Bot script parsing and execution declarations. |
| [`src/irc/htable.h`](https://github.com/klojo1968/eG-mod/blob/master/src/irc/htable.h) | Hash-table implementation used by the built-in IRC client. |
| [`src/irc/irc_client.h`](https://github.com/klojo1968/eG-mod/blob/master/src/irc/irc_client.h) | IRC connection, channel, message, and command declarations. |
| [`src/db/db_sql.h`](https://github.com/klojo1968/eG-mod/blob/master/src/db/db_sql.h) | SQL database abstraction API used for server records and SQLite. |
| [`src/tvgame/tvg_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/tvgame/tvg_local.h) | Internal TV-game/spectator-server implementation structures. |
| [`src/tvgame/tvg_lua.h`](https://github.com/klojo1968/eG-mod/blob/master/src/tvgame/tvg_lua.h) | Lua scripting integration for TV-game/spectator modules. |
| [`src/tvgame/tvg_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/tvgame/tvg_public.h) | Public TV-game export API and spectator-game interface. |

## Renderer Headers

| Header | Purpose |
|---|---|
| [`src/renderer/tr_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer/tr_local.h) | Internal classic/OpenGL renderer state and implementation declarations. |
| [`src/renderer/tr_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer/tr_cvars.h) | Classic renderer console-variable declarations. |
| [`src/rendererGLES/tr_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/rendererGLES/tr_local.h) | Internal OpenGL ES renderer state and implementation declarations. |
| [`src/renderer2/tr_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer2/tr_local.h) | Internal extended OpenGL renderer state, GLSL, framebuffer, model, and shadow declarations. |
| [`src/renderer2/tr_extra.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer2/tr_extra.h) | Additional renderer2 helper types and experimental rendering declarations. |
| [`src/renderer2/tr_glsldef.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer2/tr_glsldef.h) | GLSL shader definitions and generated shader metadata. |
| [`src/renderer2/tr_model_skel.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer2/tr_model_skel.h) | Skeletal-model structures and animation helpers for renderer2. |
| [`src/renderer2/tr_shader.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer2/tr_shader.h) | Renderer2 shader parsing and shader-state declarations. |
| [`src/renderer_vk/tr_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer_vk/tr_local.h) | Internal Vulkan renderer state and implementation declarations. |
| [`src/renderer_vk/tr_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer_vk/tr_cvars.h) | Vulkan renderer console-variable declarations. |
| [`src/renderer_vk/vk_gl_compat.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer_vk/vk_gl_compat.h) | Compatibility glue for shared OpenGL/Vulkan renderer behavior. |
| [`src/renderer_vk/vulkan/vk.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer_vk/vulkan/vk.h) | Vulkan wrapper API and backend state. |
| [`src/renderer_vk/vulkan/vk_funcs.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer_vk/vulkan/vk_funcs.h) | Dynamically loaded Vulkan function declarations. |
| [`src/renderer_vk/vulkan/vk_shaders.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderer_vk/vulkan/vk_shaders.h) | Generated Vulkan shader declarations and data. |

## Shared Renderer Headers

| Header | Purpose |
|---|---|
| [`src/renderercommon/anorms256.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderercommon/anorms256.h) | Lookup table for compressed vertex normals. |
| [`src/renderercommon/iqm.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderercommon/iqm.h) | IQM interchange-format model structures. |
| [`src/renderercommon/tr_common.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderercommon/tr_common.h) | Shared renderer initialization and utility declarations. |
| [`src/renderercommon/tr_common_cvars.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderercommon/tr_common_cvars.h) | Console variables shared across renderer implementations. |
| [`src/renderercommon/tr_local_proxy.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderercommon/tr_local_proxy.h) | Compatibility proxy for renderer-internal symbols. |
| [`src/renderercommon/tr_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderercommon/tr_public.h) | Public renderer API used by the main engine. |
| [`src/renderercommon/tr_types.h`](https://github.com/klojo1968/eG-mod/blob/master/src/renderercommon/tr_types.h) | Shared renderer types for models, shaders, textures, and scene data. |

## Platform Headers

| Header | Purpose |
|---|---|
| [`src/sdl/sdl_defs.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sdl/sdl_defs.h) | SDL setup constants and platform compatibility definitions. |
| [`src/sdl/sdl_icon.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sdl/sdl_icon.h) | Embedded SDL application icon data. |
| [`src/sdl/sdl_splash.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sdl/sdl_splash.h) | Embedded SDL splash-screen image data. |
| [`src/sys/sys_loadlib.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sys/sys_loadlib.h) | Dynamic-library loading declarations for Unix and Windows. |
| [`src/sys/sys_local.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sys/sys_local.h) | Internal operating-system and application bootstrap declarations. |
| [`src/sys/sys_win32.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sys/sys_win32.h) | Windows-specific system implementation declarations. |
| [`src/sys/sys_win32_dpi.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sys/sys_win32_dpi.h) | Windows DPI-awareness and scaling declarations. |
| [`src/sys/win_resource.h`](https://github.com/klojo1968/eG-mod/blob/master/src/sys/win_resource.h) | Windows executable resource identifiers. |

## Vendored Headers

| Header | Purpose |
|---|---|
| [`vendor/tinydir.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/tinydir.h) | Small cross-platform directory traversal library. |
| [`vendor/luasql/luasql.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/luasql/luasql.h) | LuaSQL public database-connector interface. |
| [`vendor/sha-1/sha1.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/sha-1/sha1.h) | SHA-1 hashing API from the bundled SHA-1 implementation. |
| [`vendor/Omnibot/Common/Base_Messages.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Base_Messages.h) | Base Omni-bot message identifiers shared between engine and bots. |
| [`vendor/Omnibot/Common/BotExports.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/BotExports.h) | Exported Omni-bot library entry points. |
| [`vendor/Omnibot/Common/Functions_Bot.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Functions_Bot.h) | Omni-bot function dispatch declarations. |
| [`vendor/Omnibot/Common/IEngineInterface.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/IEngineInterface.h) | Interface exposed by the game engine to Omni-bot. |
| [`vendor/Omnibot/Common/MessageHelper.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/MessageHelper.h) | Helpers for constructing and processing Omni-bot messages. |
| [`vendor/Omnibot/Common/Omni-Bot.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Omni-Bot.h) | Central Omni-bot public API and type umbrella header. |
| [`vendor/Omnibot/Common/Omni-Bot_BasicTypes.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Omni-Bot_BasicTypes.h) | Basic Omni-bot primitive types. |
| [`vendor/Omnibot/Common/Omni-Bot_BitFlags.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Omni-Bot_BitFlags.h) | Omni-bot bitflag helpers and constants. |
| [`vendor/Omnibot/Common/Omni-Bot_Color.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Omni-Bot_Color.h) | Omni-bot color types and operations. |
| [`vendor/Omnibot/Common/Omni-Bot_Events.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Omni-Bot_Events.h) | Omni-bot event identifiers and event structures. |
| [`vendor/Omnibot/Common/Omni-Bot_Types.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/Common/Omni-Bot_Types.h) | General Omni-bot data types and enums. |
| [`vendor/Omnibot/ET/ET_Config.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/ET/ET_Config.h) | Enemy Territory-specific Omni-bot configuration. |
| [`vendor/Omnibot/ET/ET_Messages.h`](https://github.com/klojo1968/eG-mod/blob/master/vendor/Omnibot/ET/ET_Messages.h) | Enemy Territory-specific Omni-bot message definitions. |

## Header Templates

| Header/template | Purpose |
|---|---|
| [`cmake/git_version.h.in`](https://github.com/klojo1968/eG-mod/blob/master/cmake/git_version.h.in) | Template used to generate build-identifying Git version information. |
| [`cmake/version_generated.h.in`](https://github.com/klojo1968/eG-mod/blob/master/cmake/version_generated.h.in) | Template used to generate the final version header. |

## `src/cgame` C Source Files

| C file | Purpose |
|---|---|
| [`src/cgame/cg_atmospheric.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_atmospheric.c) | Atmospheric effects such atmospheric rain/snow and their environmental behavior. |
| [`src/cgame/cg_camera.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_camera.c) | Demo/cinematic camera playback and camera animation support. |
| [`src/cgame/cg_character.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_character.c) | Client-side player character model registration and character lookup. |
| [`src/cgame/cg_commandmap.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_commandmap.c) | Tactical command map display, markers, filtering, objectives, and map interaction. |
| [`src/cgame/cg_consolecmds.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_consolecmds.c) | Registers and implements client-game console commands and argument completion. |
| [`src/cgame/cg_customcrosshair.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_customcrosshair.c) | Custom crosshair rendering and configuration. |
| [`src/cgame/cg_cvars.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_cvars.c) | Client-game console-variable registration and update handling. |
| [`src/cgame/cg_debriefing.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_debriefing.c) | End-of-match debriefing screen, stats, rankings, objectives, and replay presentation. |
| [`src/cgame/cg_draw.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_draw.c) | Main active-frame HUD rendering: crosshairs, text, menus, reticles, fade effects, and 2D UI. |
| [`src/cgame/cg_draw_hud.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_draw_hud.c) | Configurable HUD component drawing and HUD layout behavior. |
| [`src/cgame/cg_drawtools.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_drawtools.c) | Shared low-level 2D drawing helpers for rectangles, pictures, borders, text, and colored primitives. |
| [`src/cgame/cg_edv.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_edv.c) | Extended demo viewer controls and demo playback camera behavior. |
| [`src/cgame/cg_effects.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_effects.c) | Client-side visual effects, explosions, decals, dust, smoke, and impact events. |
| [`src/cgame/cg_ents.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_ents.c) | Translates server entity states into client/render entities and interpolation. |
| [`src/cgame/cg_event.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_event.c) | Processes server entity events into sounds, particles, weapon effects, damage, and animations. |
| [`src/cgame/cg_fireteamoverlay.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_fireteamoverlay.c) | In-game fireteam member overlay and status display. |
| [`src/cgame/cg_fireteams.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_fireteams.c) | Fireteam UI setup, menu interaction, joining, invitations, and member rendering. |
| [`src/cgame/cg_flamethrower.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_flamethrower.c) | Flamethrower flame chunks, trails, particles, and firing effects. |
| [`src/cgame/cg_hud_editor.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_hud_editor.c) | Interactive custom HUD editor and component manipulation. |
| [`src/cgame/cg_hud_iconfeed.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_hud_iconfeed.c) | Short-lived HUD icon feeds and icon notification presentation. |
| [`src/cgame/cg_hud_io.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_hud_io.c) | Loading, saving, parsing, and applying custom HUD configuration files. |
| [`src/cgame/cg_info.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_info.c) | Loading-screen information and server/map status display. |
| [`src/cgame/cg_limbopanel.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_limbopanel.c) | Limbo/team/class/spawn selection menu implementation. |
| [`src/cgame/cg_loadpanel.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_loadpanel.c) | Loading panel graphics and progress text. |
| [`src/cgame/cg_localents.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_localents.c) | Manages client-only effects such as particles, debris, gibs, brass, blood, sparks, and tracers. |
| [`src/cgame/cg_locations.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_locations.c) | Map location names and location-label lookup for HUD/map display. |
| [`src/cgame/cg_main.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_main.c) | Client-game VM entry point, initialization, media precaching, shutdown, and shared setup. |
| [`src/cgame/cg_marks.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_marks.c) | Adds wall marks, decals, shadows, and impact splats to the scene. |
| [`src/cgame/cg_missionbriefing.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_missionbriefing.c) | Mission briefing presentation and objective text. |
| [`src/cgame/cg_multiview.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_multiview.c) | Multiple-spectator view handling and multiview camera selection. |
| [`src/cgame/cg_newDraw.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_newDraw.c) | New/extended HUD drawing and owner-draw integration. |
| [`src/cgame/cg_particles.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_particles.c) | Particle-system data structures and particle effect spawning/rendering. |
| [`src/cgame/cg_players.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_players.c) | Client-side player rendering, poses, animations, skins, heads, names, and weapons. |
| [`src/cgame/cg_playerstate.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_playerstate.c) | Interprets player-state changes and derives client-side damage/status state. |
| [`src/cgame/cg_polybus.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_polybus.c) | Dynamic polygon-buffer allocation and rendering queue support. |
| [`src/cgame/cg_popupmessages.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_popupmessages.c) | Popup notification, XP gain, objective, and other transient message display. |
| [`src/cgame/cg_predict.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_predict.c) | Local player movement prediction and correction against server snapshots. |
| [`src/cgame/cg_public.h`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_public.h) | Client-game public import/export API and engine-facing event types. |
| [`src/cgame/cg_scoreboard.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_scoreboard.c) | Scoreboard, match results, player names, teams, and ranks. |
| [`src/cgame/cg_servercmds.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_servercmds.c) | Processes server-to-client command strings and updates client-game state. |
| [`src/cgame/cg_shoutcastoverlay.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_shoutcastoverlay.c) | Shoutcaster-specific overlays, labels, feeds, and match information. |
| [`src/cgame/cg_snapshot.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_snapshot.c) | Snapshot interpolation, player-state transitions, and entity snapshot processing. |
| [`src/cgame/cg_sound.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_sound.c) | Client sound scripts, event sounds, voice packets, footstep audio, and sound precaching. |
| [`src/cgame/cg_spawn.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_spawn.c) | Parsing and creating client-visible entities from map/entity definitions. |
| [`src/cgame/cg_spawnpoints.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_spawnpoints.c) | Spawn-point selection UI and spawn marker display. |
| [`src/cgame/cg_statsranksmedals.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_statsranksmedals.c) | Player statistics, rank progression, medals, and debriefing ranks. |
| [`src/cgame/cg_syscalls.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_syscalls.c) | Client-game VM syscall wrappers for engine services. |
| [`src/cgame/cg_trails.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_trails.c) | Trail junction creation and rendering for smoke, blood, missiles, sparks, and debris. |
| [`src/cgame/cg_view.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_view.c) | First-person camera, bobbing, recoil, damage, zoom, and view shake logic. |
| [`src/cgame/cg_weapon_io.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_weapon_io.c) | Loads weapon configuration files and exposes weapon model/media data. |
| [`src/cgame/cg_weapons.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_weapons.c) | Weapon model registration, view/world rendering, animations, muzzle flashes, brass, trails, and switching. |
| [`src/cgame/cg_window.c`](https://github.com/klojo1968/eG-mod/blob/master/src/cgame/cg_window.c) | Small client-game window system for menus, overlays, and interactive UI panels. |
