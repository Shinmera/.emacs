# Installing
1. You need at least emacs 24 or higher.
2. Clone the repository:
   * Unix:
     `mkdir -p ~/.emacs.d/shinmera`
     `git clone https://github.com/Shinmera/.emacs.git ~/.emacs.d/shinmera`
   * Windows:
     `mkdir -p ~/AppData/Roaming/.emacs.d/shinmera`
     `git clone https://github.com/Shinmera/.emacs.git ~/AppData/Roaming/.emacs.d/shinmera`
3. Register it with emacs:
   * Unix:
     `echo "(add-to-list 'load-path \"~/.emacs.d/shinmera/\")" >> ~/.emacs`
     `echo "(require 'shinmera)" >> ~/.emacs`
   * Windows:
     `echo "(add-to-list 'load-path \"~/.emacs.d/shinmera/\")" >> ~/AppData/Roaming/.emacs`
     `echo "(require 'shinmera)" >> ~/AppData/Roaming/.emacs`
4. Launch emacs and wait for it to download and install all packages. It'll take a while the first time around.
5. If you'd like to change which parts of the config are actually used, you can customize that behaviour with `M-x customize-group shinmera`.
