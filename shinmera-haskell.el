(require 'shinmera-package)
(require 'shinmera-functions)

(when (featurep 'shinmera-package)
  (ensure-installed 'haskell-mode 'ghc 'ghci-completion 'flycheck-ghcmod))

(setq
 haskell-process-suggest-remove-import-lines t
 haskell-process-auto-import-loaded-modules  t
 haskell-process-log                         t
 haskell-process-type                        'cabal-repl
 haskell-tags-on-save                        t)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook 'ghc-init)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)

(eval-after-load 'haskell-mode '(progn
                                 (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
                                 (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                 (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
                                 (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
                                 (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
                                 (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
                                 (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)))
(eval-after-load 'haskell-cabal '(progn
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
                                  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
                                  (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile)))

(add-to-path (expand-file-name "~/.cabal/bin"))

(provide 'shinmera-haskell)
