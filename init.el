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

;;设置TODO状态颜色
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

;(set-variable 'ycmd-server-command '("python" "/usr/lib/ycmd/ycmd"))
;(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
;(require 'golint)


;;设置日程管理目录
(setq org-agenda-files '("~/org"))


 ;开启自动打开org-agenda
(org-agenda-list)
(delete-other-windows)

(require 'ox-publish)
 ;去掉validation显示
(setq org-html-validation-link nil)
(setq org-html-link-home "index.html")
(setq org-html-link-up "index.html")

(setq org-publish-project-alist
      '(("org-notes"
          :base-directory "~/code/github/guidao.github.io/org/"
          :base-extension "org"
          :publishing-directory "~/code/github/guidao.github.io/"
          :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/org-css.css\"/>"
          :recursive t
          :publishing-function org-html-publish-to-html
          :headline-levels 4
          :auto-preamble t
          :timestamp nil
          :author nil
          )
         ("org" :components ("org-notes"))))


;; 不起作用??
(setq org-export-with-timestamps nil)
(setq org-export-with-date nil)

;;设置使用eww浏览网页
(setq helm-dash-browser-func 'eww)

;自动换行
(toggle-truncate-lines 1)

;;设置命令重复
;; (spacemacs/set-leader-keys "." 'repeat)
;; (define-key evil-motion-state-map "." 'repeat)

;;复制shell中的环境变量
(exec-path-from-shell-copy-env "GOROOT")

;;设置go tab为2个空格
(setq go-tab-width 2)

;;启动开启行号
(global-linum-mode)

;;自动换行
(toggle-truncate-lines)

;;打开org显示图片
(org-toggle-inline-images)

;;org中能执行dot命令
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)
   (emacs-lisp . t)
   (ruby . t)
   ))



;;设置ruby mode
(setq ruby-enable-enh-ruby-mode t)

;;设置yasnippet新建，插入快捷键
(spacemacs/set-leader-keys "yi" 'yas-insert-snippet)
(spacemacs/set-leader-keys "yn" 'yas-new-snippet)
