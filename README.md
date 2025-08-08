# Game Boilerplate in lua and love2d


## Project Structure
```
game_boilerplate/
├── main.lua
├── conf.lua
├── assets/
│   ├── images/
│   ├── sounds/
│   └── fonts/
├── modules/
│   ├── player.lua
│   ├── enemy.lua
│   └── gameState.lua
├── libs/         <-- Third-party libraries (e.g. anim8, hump, STI)
└── utils/
    └── helper.lua
```

Clone an existing GitHub repo (e.g., game_boilerplate)

Push it as a new repository with a different name (e.g., my-platformer)

✅ Step-by-Step Instructions

🧱 1. Clone the original repository

```
git clone https://github.com/ramses2099/game_boilerplate.git
cd game_boilerplate
```
✂️ 2. Remove the existing GitHub remote

```
git remote remove origin
```
This ensures you're no longer linked to the original repo.

🆕 3. Create a new repository on GitHub

Go to GitHub → click “+” → New Repository

    Name: my-platformer

    Do NOT initialize with README, license, or .gitignore (since your local repo already has these)

🔗 4. Link your local project to the new GitHub repo
```
git remote add origin https://github.com/your-username/my-platformer.git

```

🚀 5. Push to the new repo
```
git push -u origin main
```

🎉 Done!

Your new repository on GitHub now has the contents of the original, but under a new name and your ownership.

📝 Optional: Rename the local folder

If you want to rename the local directory too:

```
cd ..
mv game_boilerplate my-platformer
cd my-platformer
```