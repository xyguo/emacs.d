(require-package 'yasnippet)
(require 'yasnippet)
;; make Ctrl-c k the only trigger key for yas
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

(yas-global-mode t)

(provide 'init-yasnippet)



