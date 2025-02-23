;;;; This file was created automatically by the Quicklisp library
;;;; "quicklisp-slime-helper" from the "quicklisp" dist.

(unless (boundp 'quicklisp-slime-helper-dist)
  (setq quicklisp-slime-helper-dist "quicklisp"))

(setq quicklisp-slime-helper-base
      (if load-file-name
          (file-name-directory load-file-name)
        (expand-file-name "~/quicklisp/")))

(defun quicklisp-slime-helper-file-contents (file)
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(defun quicklisp-slime-helper-system-directory (system)
  (let ((location-file (concat quicklisp-slime-helper-base
                               "dists/"
                               quicklisp-slime-helper-dist
                               "/installed/systems/"
                               system
                               ".txt")))
    (when (file-exists-p location-file)
      (let ((relative (quicklisp-slime-helper-file-contents location-file)))
        (file-name-directory (concat quicklisp-slime-helper-base
                                     relative))))))

(defun quicklisp-slime-helper-slime-directory ()
  (quicklisp-slime-helper-system-directory "swank"))

(let* ((installed-slime (locate-library "slime"))
       (quicklisp-slime-directory (if installed-slime
                                      (file-name-directory (locate-library "slime"))
                                    (quicklisp-slime-helper-slime-directory))))
  (if (not installed-slime)
      (add-to-list 'load-path quicklisp-slime-directory))
(require 'slime-autoloads)
(setq slime-backend (expand-file-name "swank-loader.lisp"
                                      quicklisp-slime-directory))
(setq slime-path quicklisp-slime-directory)
(slime-setup '(slime-fancy))
