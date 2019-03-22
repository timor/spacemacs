;;; core-release-management-ftest.el --- Spacemacs Functional Test File
;;
;; Copyright (c) 2012-2020 Sylvain Benner & Contributors
;;
;; Author: Alberto Zaccagni <me@lazywithclass.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(require 'core-spacemacs)

;; ---------------------------------------------------------------------------
;; spacemacs//git-has-remote
;; ---------------------------------------------------------------------------

(ert-deftest test-git-has-remote--command-is-working ()
  (should (numberp (spacemacs//git-has-remote "origin"))))

(ert-deftest test-git-has-remote--input-is-not-a-remote ()
  (should (equal (spacemacs//git-has-remote "clearly-not-a-R3M0T3!") nil)))

;; ---------------------------------------------------------------------------
;; spacemacs//git-fetch-tags
;; ---------------------------------------------------------------------------
(defun test-git-fetch-check-online-helper ()
  (= 0
     (call-process-shell-command "git fetch --dry-run")))

(ert-deftest test-git-fetch-tags--command-is-working ()
  (skip-unless test-git-fetch-check-online-helper)
  (should (equal t (spacemacs//git-fetch-tags "origin" "master"))))

(ert-deftest test-git-fetch-tags--input-is-not-a-remote ()
  (skip-unless test-git-fetch-check-online-helper)
  (should (equal nil (spacemacs//git-fetch-tags "qwerty" "master"))))
