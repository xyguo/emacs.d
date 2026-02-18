(require-package 'evil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump nil)
(require 'evil)
(evil-mode 1)
(setq debug-on-error t)

(with-eval-after-load 'evil
  (require 'evil-escape)
  ;; Assign "fj" and "jf" to also act as "Esc"
  (setq evil-escape-key-sequence "fj")
  (setq evil-escape-unordered-key-sequence t)
  (setq evil-escape-delay 0.2)
  (evil-escape-mode 1))

(provide 'init-evil)
