# My linux environment for programming
## Debian based systems

### The script installs these programs
- Anaconda 3
- Android Studio*
- Arduino
- Discord
- Docker
- Firefox Developer
- Genymotion for fun*
- Git
- Google Chrome*
- insomnia
- IntelliJ
- Lua language*
- MongoDb Compass*
- Node.js
- NVM
- Packet Tracer
- PostBird
- Reactotron*
- Snap
- Spotify
- Steam
- VLC
- VS Code
- Yarn

`* Not yet` 

## My Vs Code config

### VS Code plugin
- Better Comments
- Bracket Pair Colorizer
- Color Highlight
- Color Picker
- Docker
- DotENV
- EditorConfig for VS Code
- ESLint
- GitLens
- Markdown All in One
- Material Icon Theme
- Material Theme
- Prettier - Code formatter
- SynthWave '84
- vscode-database
- vscode-styled-components

### VS Code settings (JSON)

```json
{
  "workbench.iconTheme": "material-icon-theme",
  "workbench.colorTheme": "Material Theme Palenight High Contrast",

  "editor.fontFamily": "Fira Code, monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 18,
  "editor.lineHeight": 26,

  "editor.renderLineHighlight": "gutter",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.rulers": [80, 120],
  "editor.tabSize": 2,
  "terminal.integrated.fontSize": 16,

  "terminal.integrated.shell.osx": "/bin/zsh",

  "eslint.autoFixOnSave": true,
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    {
      "language": "typescript",
      "autoFix": true
    },
    {
      "language": "typescripttreact",
      "autoFix": true
    }
  ],

  "prettier.endOfLine": "lf",
  "prettier.eslintIntegration": true,
  "files.eol": "\n",

  "git.autofetch": true,
  "git.enableSmartCommit": true,

  "typescript.updateImportsOnFileMove.enabled": "always",
  "javascript.updateImportsOnFileMove.enabled": "always"
}
```
