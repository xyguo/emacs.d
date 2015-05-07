;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
(require-package 'auctex)
;; (require 'auctex-autoloads)
(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list ;; 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'TeX-fold-mode
            'linum-mode
            'auto-complete-mode
            'autopair-mode
            'outline-minor-mode))

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq ;;TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation nil) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            ;;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            ))

;; configuration for TeX-fold-mode
;; add entries you want to be fold, or comment that needn't to be fold.
(setq TeX-fold-env-spec-list
      (quote (("[figure]" ("figure"))
              ("[table]" ("table"))
              ("[itemize]" ("itemize"))
              ("[description]" ("description"))
              ("[tabular]" ("tabular"))
              ("[frame]" ("frame"))
              ("[array]" ("array"))
              ("[code]" ("lstlisting"))
;;              ("[eqnarray]" ("eqnarray"))
              )))

;; configuration for reftex

;; make the toc displayed on the left
(setq reftex-toc-split-windows-horizontally t)
;; adjust the fraction
(setq reftex-toc-split-windows-fraction 0.3)

(provide 'init-auctex)
