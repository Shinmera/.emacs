(require 'shinmera-straight)

(use-package wakib-keys
  :hook
  (after-change-major-mode-hook . wakib-update-major-mode-map)
  (menu-bar-update-hook . wakib-update-minor-mode-maps)
  :config
  (wakib-keys 1)
  (cua-selection-mode 1))

(use-package undo-tree
  :diminish undo-tree-mode
  :defer 2
  :custom
  (undo-tree-auto-save-history nil)
  :bind
  ("C-S-z" . undo-tree-redo)
  (:map undo-tree-visualizer-mode-map
        ([remap left-char] . undo-tree-visualize-switch-branch-left)
        ([remap right-char] . undo-tree-visualize-switch-branch-right))
  :config
  (global-undo-tree-mode))

(provide 'shinmera-native)
