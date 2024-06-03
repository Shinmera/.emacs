(require 'shinmera-straight)

(use-package irony
  :commands (irony-mode)
  :hook
  (c-mode . irony-mode)
  (c++-mode . irony-mode))

(use-package company-irony
  :demand t
  :after (company irony)
  :hook
  (c-mode . company-mode)
  (c++-mode . company-mode)
  (objc-mode . company-mode)
  :config
  (add-to-list 'company-backends 'company-irony))

(use-package company-irony-c-headers
  :demand t
  :after (company-irony)
  :config
  (add-to-list 'company-backends 'company-irony-c-headers))

(use-package company-c-headers
  :demand t
  :after (company))

(use-package cmake-ide
  :commands (cmake-ide-compile cmake-ide-run-cmake))

(use-package cmake-mode
  :commands (cmake-mode)
  :mode ("\\'CMakeLists.txt\\'" . cmake-mode))

(use-package realgud
  :commands (realgud:pdb))

(use-package realgud-lldb
  :demand t
  :after realgud
  :commands (realgud:lldb))

(defun etags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "find '%s' -type f -regex '.*\.[ch]\(pp\|xx\)?' | etags -" dir-name)))

(provide 'shinmera-c)
