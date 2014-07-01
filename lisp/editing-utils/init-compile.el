;; supply some shortcut for compilation

;; the compilation commands alist : (FILETYPE COMMAND-LIST)
(setq my-compilation-commands
      '((("c") . ("clang -Wall" "gcc -Wall"))
        (("cpp" "c++" "CPP" "C" "cc") . ("clang++ -Wall -std=c++11" "g++ -Wall -std=c++11"))))

;; get the right command according to the file type
(defun get-compile-cmd ()
  "decide the compilation command according to the file's type"
  (interactive)
  (let* ((file-type (file-name-extension (buffer-name)))
         (command-name (assoc-default file-type
                                      my-compilation-commands
                                      (lambda (x k)
                                        (member k x))
                                      '("make -k")))
         (full-name (buffer-name)))
    (if command-name
        (setq command-name (car command-name))
      (setq command-name "make -k"))
    (setq compile-command
          (concat command-name " " full-name))))

;; set shortcut to F5
(global-set-key
 [f5]
 '(lambda ()
    (interactive)
    (save-some-buffers)
    (get-compile-cmd)
    (compile
     (compilation-read-command compile-command))))

(provide 'init-compile)
