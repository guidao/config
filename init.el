;; (defun gen-index-html (plist filename pub-dir)
;;   "主要根据当前目录下的html文件产生index.html"
;;   (let* ((temp-string (get-string-from-file (plist-get plist :temp-index-file)))
;;          (dir-files (directory-files (plist-get plist :base-directory)))
;;          (tp "<li><a href=\"%s\">%s</a></li>\n")
;;          (content-string "")
;;          )
;;     (loop for file in dir-files do
;;           (if (and (not (string-equal file "index.html")) (string-equal "html" (file-name-extension file))) 
;;             (setq content-string (concat content-string
;;                   (format tp file (file-name-base file))))))
;;     (with-temp-file (concat (plist-get plist :base-directory) "index.html")
;;       (insert
;;        (replace-regexp-in-string "{content}" content-string temp-string)))))

;; (defun get-string-from-file (filename)
;;   "返回文件内容"
;;   (with-temp-buffer
;;     (insert-file-contents filename)
;;     (buffer-string)))


(defun fengche-comment (arg)
  "符合个人风格的注释行为"
  (interactive "*P")
  (comment-normalize-vars)
  ;; 如果不是选中区域则注释行
  (if (not (region-active-p))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

;;自定义注释行为
(global-set-key "\M-;" 'fengche-comment)

;;定义goto char快捷键
(spacemacs/set-leader-keys "g" 'evil-avy-goto-char)

;; 设置TODO状态序列
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)" "CANCELED(c)")))

;(set-variable 'ycmd-server-command '("python" "/usr/lib/ycmd/ycmd"))
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(require 'golint)

 ;开启自动打开org-agenda
(org-agenda-list t)
(delete-other-windows)

(require 'ox-publish)

 ;去掉validation显示
(setq org-html-validation-link nil)
(setq org-html-link-home "index.html")
(setq org-html-link-up "index.html")
(setq org-publish-project-alist
      '(("org-notes"
          :base-directory "~/guidao.github.io/org/"
          :base-extension "org"
          :publishing-directory "~/guidao.github.io/"
          :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/org-css.css\"/>"
          :recursive t
          :publishing-function org-html-publish-to-html
          :headline-levels 4             ; Just the default for this project.
          :auto-preamble t
          :timestamp nil
          :author nil
          )
         ("org" :components ("org-notes"))))