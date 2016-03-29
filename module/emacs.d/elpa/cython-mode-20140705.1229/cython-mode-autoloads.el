;;; cython-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "cython-mode" "../../../../../.emacs.d/elpa/cython-mode-20140705.1229/cython-mode.el"
;;;;;;  "53cbf3f6866428f897f9b74174b57d45")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/cython-mode-20140705.1229/cython-mode.el

(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))

(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))

(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

(let ((loads (get 'cython 'custom-loads))) (if (member '"cython-mode" loads) nil (put 'cython 'custom-loads (cons '"cython-mode" loads))))

(defvar cython-default-compile-format "cython -a %s" "\
Format for the default command to compile a Cython file.
It will be passed to `format' with `buffer-file-name' as the only other argument.")

(custom-autoload 'cython-default-compile-format "cython-mode" t)

(autoload 'cython-mode "cython-mode" "\
Major mode for Cython development, derived from Python mode.

\\{cython-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/cython-mode-20140705.1229/cython-mode-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/cython-mode-20140705.1229/cython-mode.el")
;;;;;;  (22264 47899 225845 205000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cython-mode-autoloads.el ends here
