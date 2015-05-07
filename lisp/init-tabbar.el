(require-package 'tabbar)
;; (require 'tabbar)
(tabbar-mode 't)
(global-set-key (kbd "C-c n") 'tabbar-forward)
(global-set-key (kbd "C-c p") 'tabbar-backward)

(provide 'init-tabbar)
