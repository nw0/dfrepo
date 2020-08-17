;;; contrast-theme.el --- A subtle light theme.

;; Copyright (C) 2011-2019 Bozhidar Batsov
;; Copyright (C) 2020 Nicholas Sim

;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; Author: Thomas Frössman <thomasf@jossystem.se>
;; Author: Nicholas Sim <nsim@posteo.net>

;; X-URL: http://github.com/nw0/contrast-theme
;; URL: http://github.com/nw0/contrast-theme

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Package-Requires: ((autothemer "0.2"))

;;; Commentary:
;;
;; A minimalistic color theme to avoid distraction with
;; colors. Based on monochrome theme.

;;; Code:
(require 'autothemer)

(defmacro contrast-deftheme (name description palette &rest body)
  `(autothemer-deftheme
    ,name
    ,description
    ,palette
    ((default                           (:background base3 :foreground base01))
     (cursor                            (:background base00 :foreground base3 :inverse-video t))
     (error                             (:foreground orange :weight 'bold))
     (success                           (:foreground green))
     (warning                           (:foreground yellow :weight 'demibold))
     (button                            (:underline t))
     (fringe                            (:background margin :foreground base0))
     (header-line                       (:background base3 :foreground base00))
     (match                             (:background base2 :foreground base01 :weight 'demibold))
     (menu                              (:background base3 :foreground base00))
     (hl-line                           (:background base2))
     (region                            (:background base1))
     (secondary-selection               (:background base2))
     (minibuffer-prompt                 (:foreground base01 :weight 'demibold))
     (link                              (:foreground "RoyalBlue3" :underline t))
     (link                              (:inherit 'link))
     (shadow                            (:foreground base01))
     (trailing-whitespace               (:background red-l :foreground base3))
     (vertical-border                   (:foreground base00))

     (compilation-column-face           (:foreground cyan))
     (compilation-column-number         (:foreground cyan :inherit font-lock-doc-face))
     (compilation-enter-directory-face  (:foreground green))
     (compilation-leave-directory-face  (:foreground green))
     (compilation-error                 (:inherit 'error))
     (compilation-error-face            (:foreground red))
     (compilation-info                  (:inherit 'default))
     (compilation-info-face             (:foreground blue))
     (compilation-line-face             (:foreground green))
     (compilation-line-number           (:foreground green))
     (compilation-warning               (:inherit 'warning))
     (compilation-warning-face          (:foreground yellow))

     (compilation-mode-line-exit        (:weight 'bold))
     (compilation-mode-line-fail        (:inherit 'compilation-error))
     (compilation-mode-line-run         (:foreground yellow))

     (mode-line                         (:background base2 :foreground base01))
     (mode-line-inactive                (:background base3 :foreground base01))

     (font-lock-builtin-face            (:foreground base00 :weight 'demibold)) ;; fg3
     (font-lock-constant-face           (:foreground blue))
     (font-lock-comment-delimiter-face  (:foreground comment-delim))
     (font-lock-comment-face            (:foreground base01))
     (font-lock-doc-face                (:foreground cyan))
     (font-lock-function-name-face      (:foreground blue :weight 'bold))
     (font-lock-keyword-face            (:foreground green :weight 'demibold))
     (font-lock-negation-char-face      (:weight 'bold))
     (font-lock-string-face             (:foreground cyan))
     (font-lock-variable-name-face      (:foreground blue))
     (font-lock-type-face               (:foreground yellow :slant 'italic))
     (font-lock-warning-face            (:inherit 'error :weight 'bold))

     (highlight                         (:background base2))
     (highlight-symbol-face             (:background base2))
     (isearch                           (:background base2 :foreground orange :weight 'demibold))
     (lazy-highlight                    (:background base2 :foreground orange))
     (isearch-fail                      (:foreground red :weight 'bold))

     (ace-jump-face-foreground          (:foreground red :weight 'bold))
     (ace-jump-face-background          (:foreground base1 :background base3))

     (aw-background-face                (:inherit 'ace-jump-face-background))
     (aw-leading-char-face              (:inherit 'ace-jump-face-foreground))

     (company-echo-common               (:inherit 'trailing-whitespace))
     (company-preview                   (:background base2 :foreground base01))
     (company-preview-common            (:foreground base01))
     (company-preview-search            (:foreground magenta))
     (company-scrollbar-bg              (:background base2 :foreground cyan))
     (company-scrollbar-fg              (:foreground base3 :background base00))
     (company-template-field            (:background yellow :foreground base2))
     (company-tooltip                   (:background cyan-1bg :foreground base01))
     (company-tooltip-annotation        (:foreground cyan))
     (company-tooltip-common            (:foreground base00))
     (company-tooltip-common-selection  (:weight 'bold))
     (company-tooltip-mouse             (:background cyan-2bg :foreground cyan-2fg))
     (company-tooltip-search            (:foreground magenta))
     (company-tooltip-search-selection  (:weight 'bold :inherit 'company-tooltip-search))
     (company-tooltip-selection         (:weight 'bold))

     (dired-directory                   (:foreground blue :weight 'normal))
     (dired-perm-write                  (:foreground base00))

     (elfeed-search-date-face           (:foreground base00))
     (elfeed-search-feed-face           (:foreground base00))
     (elfeed-search-tag-face            (:foreground base01))
     (elfeed-search-title-face          (:foreground base01))

     (flycheck-error                    (:background red-1bg :foreground red-1fg :underline (:style 'wave :color red)))
     (flycheck-info                     (:background blue-1bg :foreground blue-1fg :underline (:style 'wave :color blue)))
     (flycheck-warning                  (:background yellow-1bg :foreground yellow-1fg :underline (:style 'wave :color yellow)))
     (flycheck-fringe-error             (:foreground red :weight 'bold))
     (flycheck-fringe-info              (:foreground blue :weight 'bold))
     (flycheck-fringe-warning           (:foreground yellow :weight 'bold))

     (flyspell-duplicate                (:underline (:style 'wave :color orange)))
     (flyspell-incorrect                (:underline (:style 'wave :color red)))

     (ivy-current-match                 (:background base2))
     (ivy-match-required-face           (:foreground red :weight 'bold))
     (ivy-minibuffer-match-face-1       (:foreground base01))
     (ivy-minibuffer-match-face-2       (:foreground yellow :weight 'demibold))
     (ivy-minibuffer-match-face-3       (:foreground yellow :weight 'demibold))
     (ivy-minibuffer-match-face-4       (:foreground yellow :weight 'demibold))
     (ivy-prompt-match                  (:background base2))

     (line-number                       (:background margin :foreground base0))
     (line-number-current-line          (:background "#e0dbca" :foreground base01 :weight 'demibold))

     (diff-hl-change                    (:background diff-C-bg :foreground diff-C-fg))
     (diff-hl-delete                    (:background diff-A-bg :foreground diff-A-fg))
     (diff-hl-insert                    (:background diff-B-bg :foreground diff-B-fg))

     (git-commit-comment-branch-local   (:inherit 'magit-branch-local))
     (git-commit-comment-file           (:inherit 'font-lock-variable-name-face))
     (git-commit-summary                (:weight 'demibold :inherit 'font-lock-variable-name-face))

     (lsp-ui-sideline-code-action       (:foreground "blue"))
     (lsp-ui-sideline-current-symbol    (:foreground "forest green" :weight 'bold))

     (magit-blame-highlight             (:background base2))
     (magit-branch-local                (:foreground blue :weight 'demibold))
     (magit-branch-remote               (:foreground green :weight 'demibold))
     (magit-cherry-equivalent           (:foreground magenta))
     (magit-cherry-unmatched            (:foreground cyan))
     (magit-diff-added                  (:background green-1bg :foreground green-1fg))
     (magit-diff-added-highlight        (:inherit 'magit-diff-added))
     (magit-diff-base                   (:background yellow-1bg :foreground yellow-1fg))
     (magit-diff-base-highlight         (:inherit 'magit-diff-base))
     (magit-diff-context                (:foreground base00))
     (magit-diff-context-highlight      (:background base2 :foreground base01))
     (magit-diff-file-heading           (:weight 'demibold))
     (magit-diff-file-heading-highlight (:background base2))
     (magit-diff-file-heading-selection (:background base2 :foreground orange))
     (magit-diff-hunk-heading           (:background yellow-1bg :foreground yellow-1fg))
     (magit-diff-hunk-heading-highlight (:background yellow-2bg :foreground yellow-2fg))
     (magit-diff-hunk-heading-selection (:background yellow-1bg :foreground orange :weight 'bold))
     (magit-diff-lines-heading          (:background orange :foreground base03))
     (magit-diff-removed                (:background red-1bg :foreground red-1fg))
     (magit-diff-removed-highlight      (:inherit 'magit-diff-removed))
     (magit-diff-whitespace-warning     (:inherit 'trailing-whitespace))
     (magit-diffstat-added              (:foreground green))
     (magit-diffstat-removed            (:foreground red))
     (magit-dimmed                      (:foreground base0))
     (magit-header-line-key             (:inherit 'which-key-key-face))
     (magit-hash                        (:inherit 'magit-dimmed))
     (magit-log-author                  (:foreground base00))
     (magit-log-date                    (:inherit 'magit-dimmed))
     (magit-log-graph                   (:inherit 'magit-dimmed))
     (magit-process-ok                  (:weight 'bold :inherit 'success))
     (magit-process-ng                  (:weight 'bold :inherit 'error))
     (magit-reflog-commit               (:foreground green))
     (magit-reflog-amend                (:foreground magenta))
     (magit-reflog-merge                (:foreground green))
     (magit-reflog-checkout             (:foreground blue))
     (magit-reflog-reset                (:foreground red))
     (magit-reflog-rebase               (:foreground magenta))
     (magit-reflog-cherry-pick          (:foreground green))
     (magit-reflog-remote               (:foreground cyan))
     (magit-reflog-other                (:foreground cyan))
     (magit-section-heading             (:foreground yellow :weight 'bold))
     (magit-section-heading-selection   (:foreground orange :weight 'bold))
     (magit-section-highlight           (:inherit 'hl-line))
     (magit-sequence-pick               (:foreground yellow-d))
     (magit-sequence-stop               (:foreground green))
     (magit-sequence-part               (:foreground yellow))
     (magit-sequence-head               (:foreground blue))
     (magit-sequence-drop               (:foreground red))
     (magit-sequence-done               (:foreground base01))
     (magit-sequence-onto               (:foreground base01))
     (magit-signature-good              (:foreground green))
     (magit-signature-bad               (:foreground red))
     (magit-signature-untrusted         (:foreground yellow))
     (magit-tag                         (:foreground cyan :weight 'demibold))

     (org-block                         (:background yellow-1bg :foreground yellow-1fg))
     (org-block-begin-line              (:inherit 'org-meta-line))
     (org-block-end-line                (:inherit 'org-meta-line))
     (org-date                          (:foreground blue :underline t))
     (org-document-info                 (:inherit 'default))
     (org-document-info-keyword         (:foreground comment))
     (org-document-title                (:inherit 'default :weight 'demibold))
     (org-hide                          (:foreground base3))
     (org-level-1                       (:weight 'bold :inherit 'outline-1))
     (org-level-2                       (:weight 'demibold :inherit 'outline-2))
     (org-level-3                       (:weight 'demibold :inherit 'outline-3))
     (org-level-4                       (:weight 'demibold :inherit 'outline-4))
     (org-level-5                       (:weight 'demibold :inherit 'outline-5))
     (org-level-6                       (:weight 'demibold :inherit 'outline-6))
     (org-level-7                       (:weight 'demibold :inherit 'outline-7))
     (org-level-8                       (:weight 'demibold :inherit 'outline-8))
     (org-link                          (:inherit 'link))
     (org-meta-line                     (:foreground comment))
     (org-table                         (:background cyan-1bg :foreground cyan-1fg))

     (org-roam-link                     (:foreground cyan :inherit 'link))
     (org-roam-link-current             (:inherit 'org-roam-link))

     (outline-1                         (:foreground orange))
     (outline-2                         (:foreground green))
     (outline-3                         (:foreground blue))
     (outline-4                         (:foreground yellow))
     (outline-5                         (:foreground cyan))
     (outline-6                         (:foreground red))
     (outline-7                         (:foreground green))
     (outline-8                         (:foreground blue))

     (powerline-active1                 (:background base3 :foreground base0))
     (powerline-active2                 (:background base2 :foreground base0))
     (powerline-inactive1               (:background base2 :foreground base1))
     (powerline-inactive2               (:background base3 :foreground base1))

     (show-paren-match                  (:background base2 :foreground magenta :weight 'demibold))
     (show-paren-mismatch               (:background red :foreground base1 :weight 'black))

     (sml/col-number                    (:foreground base00))
     (sml/filename                      (:foreground base01 :weight 'demibold))
     (sml/git                           (:foreground cyan-d))
     (sml/global                        (:foreground base01))
     (sml/line-number                   (:foreground base00))
     (sml/modes                         (:foreground base01))
     (sml/modified                      (:foreground orange :weight 'black))
     (sml/outside-modified              (:background red :foreground base3))
     (sml/numbers-separator             (:foreground base0))
     (sml/position-percentage           (:foreground base00))
     (sml/projectile                    (:foreground blue-d))
     (sml/prefix                        (:foreground yellow-d))
     (sml/read-only                     (:foreground orange :weight 'demibold))

     (swiper-line-face                  (:inherit 'hl-line))
     (swiper-match-face-1               (:inherit 'ivy-minibuffer-match-face-1))
     (swiper-match-face-2               (:inherit 'ivy-minibuffer-match-face-2))
     (swiper-match-face-3               (:inherit 'ivy-minibuffer-match-face-3))
     (swiper-match-face-4               (:inherit 'ivy-minibuffer-match-face-4))

     (which-key-command-description-face    (:foreground base02))
     (which-key-group-description-face      (:foreground cyan-d :slant 'italic))
     (which-key-key-face                    (:foreground base00))
     (which-key-separator-face              (:inherit 'font-lock-comment-delimiter-face))
     ),@body))

(contrast-deftheme
 contrast
 "A solarized variant"
 ((((class color) (min-colors #xFF)))
  (base03           "#002b36")
  (base02           "#073642")
  (base01           "#586e75")
  (base00           "#657b83")
  (base0            "#839496")
  (base1            "#d0ccb8")
  (base2            "#eee8d5")
  (base3            "#fdf6e3")
  (yellow           "#b58900")
  (orange           "#cb4b16")
  (red              "#dc322f")
  (magenta          "#d33682")
  (violet           "#6c71c4")
  (blue             "#268bd2")
  (cyan             "#2aa198")
  (green            "#859900")
  (yellow-1bg       "#f8e8c6")
  (yellow-1fg       "#876d26")
  (yellow-2bg       "#f1d49b")
  (yellow-2fg       "#766634")
  (yellow-d         "#866300")
  (yellow-l         "#e1af4b")
  (orange-1bg       "#fedfc5")
  (orange-1fg       "#974727")
  (orange-2bg       "#ffbd99")
  (orange-2fg       "#854a33")
  (orange-d         "#992700")
  (orange-l         "#fb7640")
  (red-1bg          "#ffdec8")
  (red-1fg          "#a33c35")
  (red-2bg          "#ffb9a1")
  (red-2fg          "#8e433d")
  (red-d            "#a7020a")
  (red-l            "#ff6849")
  (magenta-1bg      "#fdded7")
  (magenta-1fg      "#9a3f6c")
  (magenta-2bg      "#fdbac6")
  (magenta-2fg      "#854568")
  (magenta-d        "#a00559")
  (magenta-l        "#ff699e")
  (violet-1bg       "#ebe4e2")
  (violet-1fg       "#4f5e99")
  (violet-2bg       "#d1c9e3")
  (violet-2fg       "#475a8b")
  (violet-d         "#243e9b")
  (violet-l         "#8d85e7")
  (blue-1bg         "#e7e8e4")
  (blue-1fg         "#1e6fa2")
  (blue-2bg         "#c3d5e9")
  (blue-2fg         "#246792")
  (blue-d           "#0061a8")
  (blue-l           "#74adf5")
  (cyan-1bg         "#e4ecda")
  (cyan-1fg         "#207e7b")
  (cyan-2bg         "#bedfcf")
  (cyan-2fg         "#247374")
  (cyan-d           "#007d76")
  (cyan-l           "#6ccec0")
  (green-1bg        "#efeac7")
  (green-1fg        "#657827")
  (green-2bg        "#dbdb9c")
  (green-2fg        "#5b6e35")
  (green-d          "#5b7300")
  (green-l          "#b3c34d")

  (margin           base2)
  (comment          base0)
  (comment-delim    "#bab4b0")  ;; between base0 and base1

  ;; TODO make these a bit more subtle
  (diff-A-bg        red-2bg)
  (diff-A-fg        red-2fg)
  (diff-B-bg        green-2bg)
  (diff-B-fg        green-2fg)
  (diff-C-bg        blue-2bg)
  (diff-C-fg        blue-2fg)
  ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'contrast)
