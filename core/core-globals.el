;;; core-globals.el --- Spacemacs Core File
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: timor <timor.dd@googlemail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; This file contains global variable definitions that are referenced by several
;; core spacemacs emacs lisp files, but would result in mutual dependencies.
;; This is only an alternative to forward-declaring all the variables.
;; Eventually, a proper core library hierarchy should be defined, and all the
;; variables should "return" to their respective libraries.

(defmacro spacemacs|expect-bound-variables (var-list &rest body)
  "Test if the variables in VAR-LIST are boundp. If not, issue a
warning. Then body. Intended for compilation of core elisp code
that can be expected to run in an environment where these
variables are present."
  (declare (indent defun) (debug body))
  `(progn
    ,@(loop for var in var-list collect
            `(if (boundp ',var) nil
               (warn "Variable %s not bound.  This is probably an error." ',var)))
    ,@body))


;; from init.el
(defconst emacs-start-time (current-time))

;; from configuration-layer.el
(defconst configuration-layer-template-directory
  (expand-file-name (concat spacemacs-core-directory "templates/"))
  "Configuration layer templates directory.")

(provide 'core-globals)
