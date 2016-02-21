;;----------------------------------------------------------------------------
;; Add spell-checking in comments for all programming language modes
;;----------------------------------------------------------------------------
(if (fboundp 'prog-mode)
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (dolist (hook '(lisp-mode-hook
                  emacs-lisp-mode-hook
                  scheme-mode-hook
                  python-mode-hook
                  shell-mode-hook
                  haskell-mode-hook))
    (add-hook hook 'flyspell-prog-mode)))

;; on OSX the mouse 2 is tricky
(when *is-a-mac*
  (eval-after-load "flyspell"
    '(progn
       (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
       (define-key flyspell-mouse-map [mouse-3] #'undefined)
       (global-set-key (kbd "<f9>") 'ispell-word)
       (global-set-key (kbd "C-S-<f9>") 'flyspell-mode)
       (global-set-key (kbd "C-M-<f9>") 'flyspell-buffer)
       (global-set-key (kbd "C-<f9>") 'flyspell-check-previous-highlighted-word)
       (defun flyspell-check-next-highlighted-word ()
         "Custom function to spell check next highlighted word"
         (interactive)
         (flyspell-goto-next-error)
         (ispell-word))
       (global-set-key (kbd "M-<f9>") 'flyspell-check-next-highlighted-word))))

(provide 'init-flyspell)
