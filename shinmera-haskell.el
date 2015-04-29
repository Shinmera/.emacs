(provide 'shinmera-haskell)
(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'haskell-mode))

(setq
 haskell-process-suggest-remove-import-lines t
 haskell-process-auto-import-loaded-modules  t
 haskell-process-log                         t
 haskell-process-type                        'cabal-repl
 haskell-tags-on-save                        t)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'haskell-mode-stylish-buffer)

(eval-after-load 'haskell-mode '(progn
                                 (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
                                 (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                 (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
                                 (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
                                 (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
                                 (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
                                 (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
                                 (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)
                                 (define-key haskell-mode-map (kbd "C-x C-s") 'haskell-mode-save-buffer)))
(eval-after-load 'haskell-cabal '(progn
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
                                  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile)))

(let ((cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path cabal-path))
