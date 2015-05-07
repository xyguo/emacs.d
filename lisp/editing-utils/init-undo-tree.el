(require-package 'undo-tree)
;; (require 'undo-tree-autoloads)
(global-set-key "\C-xu" 'undo-tree-visualize)
(global-undo-tree-mode t)

(provide 'init-undo-tree)
