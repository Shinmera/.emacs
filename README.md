Installing
----------
1. You need at least emacs 24 or higher.
2. Clone the repository:
   * Unix: `mkdir -p ~/.emacs.d/shinmera && git clone https://github.com/Shinmera/.emacs.git ~/.emacs.d/shinmera`
   * Windows: `mkdir -p ~/AppData/Roaming/.emacs.d/shinmera && git clone https://github.com/Shinmera/.emacs.git ~/AppData/Roaming/.emacs.d/shinmera`
3. Register it with emacs:
   * Unix: `echo "(add-to-list 'load-path \"~/.emacs.d/shinmera/\")" >> ~/.emacs`
   * Windows: `echo "(add-to-list 'load-path \"~/.emacs.d/shinmera/\")" >> ~/AppData/Roaming/.emacs`

Using the Files Standalone
--------------------------
1. Tell emacs to load it:
   * Unix: `echo "(require 'shinmera)" >> ~/.emacs`
   * Windows: `echo "(require 'shinmera)" >> ~/AppData/Roaming/.emacs`
2. Launch emacs and wait for it to download and install all packages. It'll take some time and pop up warnings during compilation most likely. You can safely ignore them. Once it's done, restart emacs again and you should be set to go. On some systems/platforms you might have to restart emacs a couple of times after it pops up an error or some screen until it finally pushes through and completes installing all packages.

Using Just Parts
----------------
Each file has its own `provide`, so you may `require` what you need separately. Have a look at `shinmera.el`.
