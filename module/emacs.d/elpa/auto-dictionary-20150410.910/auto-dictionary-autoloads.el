;;; auto-dictionary-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "auto-dictionary" "../../../../../.emacs.d/elpa/auto-dictionary-20150410.910/auto-dictionary.el"
;;;;;;  "991cbcd84bfe3d89d6c9a86b28ca63d3")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/auto-dictionary-20150410.910/auto-dictionary.el

(autoload 'auto-dictionary-mode "auto-dictionary" "\
A minor mode that automatically sets `ispell-dictionary`.

\(fn &optional ARG)" t nil)

(autoload 'adict-guess-dictionary "auto-dictionary" "\
Automatically change ispell dictionary based on buffer language.
Calls `ispell-change-dictionary' and runs `adict-change-dictionary-hook'.  If
BUFFER is nil, the current buffer is used.  If IDLE-ONLY is set, abort
when an input event occurs.

\(fn &optional IDLE-ONLY)" t nil)

(autoload 'adict-change-dictionary "auto-dictionary" "\
Set buffer language to LANG and stop detecting it automatically.

\(fn &optional LANG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/auto-dictionary-20150410.910/auto-dictionary-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/auto-dictionary-20150410.910/auto-dictionary.el")
;;;;;;  (22296 31952 438555 554000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; auto-dictionary-autoloads.el ends here
