(require-package 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)

;; (setq window-system-default-frame-alist
;;       '((x (font . "文泉驿等宽微米黑 11")) ;; if frame created on x display
;;         (nil))) ;; if on term

(provide 'init-fonts)
