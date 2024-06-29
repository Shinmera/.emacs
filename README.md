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

# Modules
Each module is made with a specific goal:

- arduino  
  Support for editing and running Arduino projects
- c  
  Support for C/C++/ObjectiveC projects including cmake and debugging.
- company  
  The company completions system.
- elixir  
  Support for editing Elixir projects.
- flycheck  
  A linter system.
- general  
  General editing and look-and-feel changes to emacs.
  `C-q` To expand the region  
  `C-S-f/b/a` To mark with another multiple cursor  
  `C-M-S-f/b` To unmark a cusor  
  `C-c p` Projectile prefix  
  `C-c k` Delete file and buffer  
  `C-c r` Rename file and buffer  
  `C-c o` Open file with external program
- glsl  
  Support for GLSL and HLSL shader language editing.
- go  
  Support for editing Go source files.
- java  
  Support for editing Java source files.
- js  
  Support for editing JavaScript source files.
- lisp  
  Support for Common Lisp projects using SLIME and some extra features for Elisp.
- magit  
  The best GIT UI ever made.
  `C-x g` Open Magit
- mail  
  Some changes to customise email sending.
- misc  
  Miscellaneous major modes for various file types.
- native  
  Customisations to make Emacs behave more like more recent editors, including major keybind changes.
- paredit  
  The Paredit structured editing system for lisp languages.
- pass  
  Integration with the Unix Pass system for authentication.
- perspective  
  Provides ways to keep "workspaces" for different projects.  
  `C-x C-b` List buffers in project  
  `C-c M-p` Perspective prefix
- python  
  Support for editing Python source files.
- lua  
  Support for editing Lua source files.
- rust  
  Support for editing Rust projects.
- shell  
  Enhancements for Emacs' built-in shells.
- spell  
  Improvements to Emacs' spellcheck systems, and on-the-fly spellchecking.
- tex  
  Support for LaTeX and BibTeX source files.
- treemacs  
  A tree-based file browser plugin.  
  `C-x d` Toggle Treemacs
- vim  
  Changes to make Emacs behave more like Vim.
- web  
  Support for editing HTML, CTML, CSS, LASS files.
