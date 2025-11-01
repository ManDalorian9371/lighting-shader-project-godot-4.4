🌙 Godot 4 Custom 2D Lighting Shader

Full Control – Lightweight – Retro Friendly

This project includes a fully functional custom 2D lighting shader made for Godot 4.4.
It provides complete control over lighting, supports the day and night cycle, and works perfectly in full screen with different camera zoom levels — no built-in Godot lights required.

🎮 Features

🌀 Full-screen dynamic lighting that adapts to camera zoom

☀️ Day & Night system controllable through color modulation

🔥 Multiple light sources (player, torches, etc.)

🎨 Retro-style lighting using radius, strength, and falloff parameters

🪶 Simple, reusable light scene with a Marker2D light node

⚡ Optimized and easy to integrate into any 2D project

🧩 Scene Structure

The main project includes four simple scenes:

Main – basic environment and setup

Player – your controllable character

day_and_night_ – manages the global brightness and color

light – contains a single Marker2D with parameters for:

active (on/off)

radius

strength

falloff

🔧 How It Works

The CanvasLayer controls the overall day/night cycle.

A ColorRect with the custom shader covers the screen.

The Light Manager collects all nodes in the "lights" group and sends their parameters to the shader, adapting to screen size.

By adjusting the modulation_color of the ColorRect’s shader material, you can smoothly control global brightness and atmosphere.

💡 Retro Lighting Tips

For a pixel-art or retro vibe:

Set a low falloff value.

Increase the light strength.

Combine different radii for variety.

Attach a light scene to your player or fire sprites to achieve smooth and natural light effects — including flicker and automatic day/night behavior.

🧠 Example Project

The sample scene includes:

Simple background and objects

A moving player

Fire with animated lighting

Working day/night transition

📜 License

This project is free to use and modify.
Feel free to use it in your own games, edit it, or expand it in any way you like.
Just don’t forget to leave a ⭐ on the repo if it helps you!
