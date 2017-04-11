(provide 'shinmera-spell)

(setq used-spelling-dictionaries '("en_GB" "en_US" "de_CH"))
(setq ispell-dictionary (first used-spelling-dictionaries))

(add-hook 'slime-mode-hook #'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook #'flyspell-prog-mode)
(add-hook 'TeX-mode-hook #'flyspell-mode)
(add-hook 'text-mode-hook #'flyspell-mode)

(defun switch-dictionary ()
  (interactive)
  (let* ((old ispell-current-dictionary)
    	 (new (nth (mod (1+ (cl-position old used-spelling-dictionaries))
                        (length used-spelling-dictionaries))
                   used-spelling-dictionaries)))
    (ispell-change-dictionary new)
    (message "Dictionary switched from %s to %s" old new)))
