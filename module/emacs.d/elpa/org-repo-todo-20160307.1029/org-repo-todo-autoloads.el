;;; org-repo-todo-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "org-repo-todo" "../../../../../.emacs.d/elpa/org-repo-todo-20160307.1029/org-repo-todo.el"
;;;;;;  "5c48fef7bd345208a22d13fa9ba4ee8c")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/org-repo-todo-20160307.1029/org-repo-todo.el

(autoload 'ort/goto-todos "org-repo-todo" "\
Visit the current repo's TODO.org file.
With the argument ARG-DIRECTORY, visit `ort/prefix-arg-directory''s
TODO.org file.

\(fn &optional ARG-DIRECTORY)" t nil)

(autoload 'ort/capture-todo "org-repo-todo" "\
Capture an org todo for the current repo in an `org-capture' popup window.
Items will be captured into the project root.
If ARG-DIRECTORY is supplied, capture into `ort/prefix-arg-directory'.

\(fn &optional ARG-DIRECTORY)" t nil)

(autoload 'ort/capture-checkitem "org-repo-todo" "\
Capture a checkitem for the current repo in an `org-capture' popup window.
Items will be captured into the project root.
If ARG-DIRECTORY is supplied, capture into `ort/prefix-arg-directory'.

\(fn &optional ARG-DIRECTORY)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/org-repo-todo-20160307.1029/org-repo-todo-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/org-repo-todo-20160307.1029/org-repo-todo.el")
;;;;;;  (22296 32218 924988 791000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; org-repo-todo-autoloads.el ends here
