(require-package 'evil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump nil)
(setq evil-want-keybinding nil)

;; load evil
(require 'evil)
(evil-mode 1)
(setq debug-on-error t)

;; load evil-escape
(with-eval-after-load 'evil
  (require 'evil-escape)
  ;; Assign "jj" to also act as "Esc"
  (setq evil-escape-key-sequence "jj")
  (setq evil-escape-unordered-key-sequence t)
  (setq evil-escape-delay 0.2)
  (evil-escape-mode 1))

;; use evil-collection to enable evil for other major modes
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; use evil-org-agenda to provide evil for org-agenda
(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(provide 'init-evil)
