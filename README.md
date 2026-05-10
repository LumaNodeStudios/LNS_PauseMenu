# LNS Pause Menu
A modern, high-performance and fully customizable pause menu for FiveM built with **Svelte 5**. Designed by **LumaNode Studios** with inspiration from **GGWPx** to provide an immersive and sleek interface for your roleplay community.

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/LumaNodeStudios/LNS_PauseMenu)
[![Framework](https://img.shields.io/badge/framework-ESX%20%7C%20QBCore%20%7C%20Qbox-orange.svg)]()
[![Dependency](https://img.shields.io/badge/dependency-ox__lib-green.svg)](https://github.com/overextended/ox_lib)

---

## Preview
![Pause Menu Preview](https://r2.fivemanage.com/ikenZGXRwE4faTVyko8MZ/image_2026-05-11_004334673.png)

---

## Features
- **Svelte 5 & Vite**: Extremely fast and lightweight UI with smooth transitions.
- **Multi-Framework Support**: Out-of-the-box support for **ESX**, **QBCore**, and **Qbox** via a robust bridge system.
- **Dynamic Theming**: Easily customize primary colors and UI elements to match your server's brand.
- **Announcement System**: Keep your players informed with a built-in news feed featuring authors, dates, and times.
- **Information Center**:
    - **Modal Popups**: Clean overlays for Rules, About Us, and Support.
    - **Discord Integration**: Built-in Discord invite widget support.
- **Custom Keybinds**: Fully configurable keybind (Default: `ESCAPE`).
- **Built with ox_lib**: Leverages the power of `ox_lib` for optimized performance and standard features.

---

## Requirements
To ensure the pause menu functions correctly, you must have the following dependencies:
- [ox_lib](https://github.com/overextended/ox_lib)
- One of the following frameworks:
    - [ESX Legacy](https://github.com/esx-framework/esx_core)
    - [QBCore](https://github.com/qbcore-framework/qb-core)
    - [Qbox](https://github.com/Qbox-Project/qbx_core)

---

## Installation
1. **Download** the resource.
2. **Extract** the `LNS_PauseMenu` folder into your `resources` directory.
3. **Configure** the menu in `shared/settings.lua` (see below).
4. **Add** `ensure LNS_PauseMenu` to your `server.cfg`.

---

## Building for Production
If you wish to modify the UI:
1. Navigate to the `web` folder.
2. Run `npm install` to install dependencies.
3. Run `npm run build` to generate the production build.
4. The files will be placed in `web/dist`.

---

## Credits
- Developed by **[LumaNode Studios](https://discord.gg/cuY5HtEQyJ)**.
- Inspired by **GGWPx**.

---

## License
This project is licensed under the GPL-3.0 License. See the `LICENSE` file for details.