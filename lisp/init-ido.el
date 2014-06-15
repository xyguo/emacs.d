;; enable ido-mode, flexible-matching, virtual-buffer
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

;; use ido-ubiquitous
(require-package 'ido-ubiquitous)
(ido-ubiquitous-mode t)

;; use smex to handle M-x
(require-package 'smex)
(smex-initialize)
(global-set-key "\M-x" 'smex)

(provide 'init-ido)
