
;; Security configurations
;; The function `setup-tls-programs' should be invoked before installing
;; any packages from remote repositories. Here I use the `certifi' python module
;; to retrieve valid certificates. 
;; You can install the `certifi' module via `pip install certifi'.
;; For detailed description, see "https://glyph.twistedmatrix.com/2015/11/editor-malware.html"
(defun setup-tls-programs ()
  "Turn on TLS support"
  (let* ((python-interpreter
         (if (file-exists-p "/usr/local/bin/python")
             "/usr/local/bin/python"
           "python"))
        (read-certifi
         (concat python-interpreter " -m certifi"))
        (trustfile
         (replace-regexp-in-string
          "\\\\" "/"
          (replace-regexp-in-string
           "\n" ""
           (shell-command-to-string read-certifi)))))
    (setq tls-checktrust (quote ask))
    (setq tls-program
          (list
           (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                   (if (eq window-system 'w32) ".exe" "") trustfile)))
    (setq gnutls-verify-error t)
    (setq gnutls-trustfiles (list trustfile))))
(setup-tls-programs)

;; (after-load 'init-exec-path
;;  (setup-tls-programs))

(provide 'init-security)
