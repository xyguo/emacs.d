;; add ac-sources for latex mode
(require-package 'ac-math)
(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)
(defun ac-latex-mode-setup ()
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources))
  )
(add-hook 'latex-mode-hook 'ac-latex-mode-setup)
(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

;; Use Emacs 31's built-in completion UI and Eglot/clangd for C-family modes.
;; `auto-complete-clang' has not been maintained since 2014 and still calls the
;; obsolete pre-0.8 Yasnippet API.
(require 'completion-preview)
(require 'eglot)

(defun xyguo/c-family-completion-setup ()
  "Use clangd-backed completion in the current C-family buffer."
  (auto-complete-mode -1)
  (completion-preview-mode 1)
  (eglot-ensure))

(dolist (hook '(c-mode-hook c++-mode-hook objc-mode-hook
                c-ts-mode-hook c++-ts-mode-hook))
  (add-hook hook #'xyguo/c-family-completion-setup))

(provide 'init-ac-source)
