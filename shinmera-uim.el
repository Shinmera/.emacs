(provide 'shinmera-uim)

;;;;;;
;; Autoloading and setting.
(require 'uim)

(setq
 uim-default-im-engine "anthy-utf8"
 uim-lang-code-alist (cons '("Japanese" "Japanese" utf-8 "UTF-8")
                           (delete (assoc "Japanese" uim-lang-code-alist) uim-lang-code-alist))
 uim-candidate-display-inline t
 uim-default-im-prop '("action_anthy_utf8_hiragana"
                       "action_anthy_hiragana"
                       "action_google-cgiapi-jp_hiragana"
                       "action_mozc_hiragana"))

