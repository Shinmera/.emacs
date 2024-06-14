![preview](https://filebox.tymoon.eu//file/TWpjNE5BPT0=)

# Installing
1. Clone the repository into your emacs.d:
   * Unix:  
     `mkdir -p ~/.emacs.d/shinmera`  
     `git clone https://github.com/Shinmera/.emacs.git ~/.emacs.d/shinmera`
   * Windows:  
     `mkdir -p ~/AppData/Roaming/.emacs.d/shinmera`  
     `git clone https://github.com/Shinmera/.emacs.git ~/AppData/Roaming/.emacs.d/shinmera`
2. Make emacs load the package:
   * Unix:  
     `echo "(add-to-list 'load-path \"~/.emacs.d/shinmera/\")" >> ~/.emacs`  
     `echo "(require 'shinmera)" >> ~/.emacs`
   * Windows:  
     `echo "(add-to-list 'load-path \"~/.emacs.d/shinmera/\")" >> ~/AppData/Roaming/.emacs`  
     `echo "(require 'shinmera)" >> ~/AppData/Roaming/.emacs`
3. Launch emacs and wait for it to download and install everything. It'll take a while the first time around.
4. If you'd like to change which parts of the config are actually used, you can customize that behaviour with `M-x customize-group shinmera`.
