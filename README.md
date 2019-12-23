# My linux environment for programming
## Debian based systems

### The script installs these programs
- Arduino
- Discord
- Docker
- Genymotion for fun*
- Git
- Gnome Tweak*
- insomnia
- IntelliJ
- MongoDb Compass
- Node.js
- NVM
- PostBird
- Reactotron*
- Snap
- Spotify
- Virtual Box
- VLC
- VS Code
- Yarn

`* Not yet` 

## [My Vs Code config](https://gist.github.com/henry-ns/94ef383da4e55a67a17a8d29adcdf6cd)

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
- vscode-database
- vscode-styled-components

### VS Code settings (JSON)

```json
{
  "workbench.iconTheme": "material-icon-theme",
  "workbench.colorTheme": "Material Theme Palenight",

  "editor.fontFamily": "Fira Code, monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 18,
  "editor.lineHeight": 26,

  "editor.minimap.renderCharacters": false,
  "editor.minimap.showSlider": "always",

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
