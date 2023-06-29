;;; hlsl-mode.el --- major mode for Open HLSL shader files

;; Copyright (C) 1999, 2000, 2001 Free Software Foundation, Inc.
;;
;; Author: gbuffer
;; Keywords: languages HLSL shader
;; Version: 1.0

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; Major mode for editing HLSL grammar files, usually files ending
;; with '(.fx|.hlsl)'.  Is is based on c-mode plus some features
;; and pre-specified fontifications.

;;; Installation:

;; This file requires Emacs-20.3 or higher and package cc-mode.

;; If hlsl-mode is not part of your distribution, put this file into your
;; load-path and the following into your ~/.emacs:
;;   (autoload 'hlsl-mode "hlsl-mode" nil t)
;;   (add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
''   (add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))
;;; Code:

(provide 'hlsl-mode)

(eval-when-compile			; required and optional libraries
  (require 'cc-mode)
  (require 'find-file))

(defconst hlsls-version "1.0"
  "HLSL major mode version number.")

(defvar hlsl-mode-hook nil)

(defvar hlsl-mode-map
  (let ((hlsl-mode-map (make-sparse-keymap)))
    (define-key hlsl-mode-map [S-iso-lefttab] 'ff-find-other-file)    
    hlsl-mode-map)
  "Keymap for HLSL major mode")

(add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))

(defconst hlsl-font-lock-keywords-1
  (list
   '("\\<\\(b\\(?:ool\\|vec[1-4]\\)\\|float\\|struct\\|i\\(?:nt\\|vec[1-4]\\)\\|mat[234]\\|int[234]\\|float[234]\\|sampler\\(?:1D\\(?:Shadow\\)?\\|2D\\(?:Shadow\\)?\\|3D\\|Cube\\)\\|v\\(?:ec[1-4]\\|oid\\)auto\\|c\\(?:a\\(?:se\\|tch\\)\\|har\\|lass\\|onst_cast\\)\\|d\\(?:e\\(?:fault\\|lete\\)\\|ynamic_cast\\)\\|e\\(?:num\\|xplicit\\)\\|friend\\|goto\\|long\\|mutable\\|new\\|operator\\|p\\(?:r\\(?:ivate\\|otected\\)\\|ublic\\)\\|reinterpret_cast\\|s\\(?:hort\\|i\\(?:gned\\|zeof\\)\\|tatic_cast\\)\\|t\\(?:emplate\\|h\\(?:is\\|row\\)\\|ry\\|ypename\\)\\|u\\(?:n\\(?:ion\\|signed\\)\\|sing\\)\\|virtual\\)\\>" . font-lock-type-face)
   '("\\<\\(b\\(?:lendstate\\|ool\\|reak\\|uffer\\)\\|c\\(?:buffer\\|lass\\|o\\(?:mpile\\|n\\(?:st\\|tinue\\)\\)\\)\\|d\\(?:epthstencil\\(?:state\\|view\\)\\|iscard\\|o\\(?:uble\\)?\\)\\|e\\(?:lse\\|xtern\\)\\|f\\(?:alse\\|loat\\|or\\)\\|geometryshader\\|half\\|i\\(?:n\\(?:line\\|out\\|t\\(?:erface\\)?\\)\\|[fn]\\)\\|matrix\\|n\\(?:amespace\\|ointerpolation\\)\\|out\\|p\\(?:ass\\|ixelshader\\|recise\\)\\|r\\(?:asterizerstate\\|e\\(?:gister\\|ndertargetview\\|turn\\)\\)\\|s\\(?:ampler\\(?:1d\\|2d\\|3d\\|\\(?:_stat\\|c\\(?:omparisonstat\\|ub\\)\\)e\\)?\\|hared\\|norm\\|t\\(?:at\\(?:eblock\\(?:_state\\)?\\|ic\\)\\|r\\(?:ing\\|uct\\)\\)\\|witch\\)\\|t\\(?:buffer\\|e\\(?:chnique\\(?:10\\)?\\|xture\\(?:1\\(?:d\\(?:array\\)?\\)?\\|2d\\(?:array\\|ms\\(?:array\\)?\\)?\\|3d\\|cube\\(?:array\\)?\\)\\)\\|rue\\|ypedef\\)\\|un\\(?:\\(?:if\\)?orm\\)\\|v\\(?:e\\(?:\\(?:cto\\|rtexshade\\)r\\)\\|o\\(?:id\\|latile\\)\\)\\|while\\)\\>" . font-lock-keyword-face)
   '("\\<\\(AllMemoryBarrier\\(?:WithGroupSync\\)?\\|D\\(?:3DCOLORtoUBYTE4\\|eviceMemoryBarrier\\(?:WithGroupSync\\)?\\)\\|EvaluateAttribute\\(?:At\\(?:Centroid\\|Sample\\)\\|Snapped\\)\\|G\\(?:etRenderTargetSample\\(?:Count\\|Position\\)\\|roupMemoryBarrier\\(?:WithGroupSync\\)?\\)\\|Interlocked\\(?:A\\(?:[dn]d\\)\\|Compare\\(?:\\(?:Exchang\\|Stor\\)e\\)\\|Exchange\\|M\\(?:ax\\|in\\)\\|\\(?:O\\|Xo\\)r\\)\\|Process\\(?:2DQuadTessFactors\\(?:Avg\\|M\\(?:ax\\|in\\)\\)\\|IsolineTessFactors\\|QuadTessFactors\\(?:Avg\\|M\\(?:ax\\|in\\)\\)\\|TriTessFactors\\(?:Avg\\|M\\(?:ax\\|in\\)\\)\\)\\|Rcp\\|a\\(?:b\\(?:ort\\|s\\)\\|cos\\|ll\\|ny\\|s\\(?:double\\|float\\|int?\\|uint\\)\\|tan2?\\)\\|c\\(?:eil\\|l\\(?:\\(?:am\\|i\\)p\\)\\|o\\(?:sh?\\|untbits\\)\\|ross\\)\\|d\\(?:d\\(?:\\(?:x_\\(?:coars\\|fin\\)\\|y_\\(?:coars\\|fin\\)\\)e\\|[xy]\\)\\|e\\(?:grees\\|terminant\\)\\|istance\\|[os]t\\)\\|e\\(?:rrorf\\|xp2?\\)\\|f\\(?:16tof32\\|32tof16\\|aceforward\\|irstbit\\(?:high\\|low\\)\\|loor\\|mod\\|r\\(?:ac\\|exp\\)\\|width\\)\\|is\\(?:finite\\|inf\\|nan\\)\\|l\\(?:dexp\\|e\\(?:ngth\\|rp\\)\\|it\\|og\\(?:10\\|2\\)?\\)\\|m\\(?:a[dx]\\|in\\|odf\\|ul\\)\\|no\\(?:\\(?:is\\|rmaliz\\)e\\)\\|p\\(?:ow\\|rintf\\)\\|r\\(?:adians\\|e\\(?:f\\(?:\\(?:le\\|ra\\)ct\\)\\|versebits\\)\\|ound\\|sqrt\\)\\|s\\(?:aturate\\|i\\(?:gn\\|n\\(?:cos\\|h\\)?\\)\\|moothstep\\|qrt\\|tep\\)\\|t\\(?:anh?\\|ex\\(?:1D\\(?:bias\\|grad\\|lod\\|proj\\)?\\|2D\\(?:bias\\|grad\\|lod\\|proj\\)?\\|3D\\(?:bias\\|grad\\|lod\\|proj\\)?\\|CUBE\\(?:bias\\|grad\\|lod\\|proj\\)?\\)\\|r\\(?:anspose\\|unc\\)\\)\\)\\>" . font-lock-builtin-face)
   '("\\<\\(gl_\\(?:Back\\(?:Color\\|Light\\(?:\\(?:Model\\)?Product\\)\\|Material\\|SecondaryColor\\)\\|C\\(?:lipVertex\\|olor\\(?:\\)?\\)\\|DepthRange\\(?:\\)?\\|EyePlane[Q-T]\\|F\\(?:og\\(?:Coord\\)?\\|r\\(?:ag\\(?:Co\\(?:lor\\|ord\\)\\|D\\(?:ata\\|epth\\)\\)\\|ont\\(?:Color\\|Facing\\|Light\\(?:\\(?:Model\\)?Product\\)\\|Material\\|SecondaryColor\\)\\)\\)\\|LightSource\\|M\\(?:ax\\(?:\\(?:C\\(?:lipPlane\\|ombinedTextureImageUnit\\)\\|DrawBuffer\\|FragmentUniformComponent\\|Light\\|Texture\\(?:Coord\\|\\(?:Image\\)?Unit\\)\\|V\\(?:aryingFloat\\|ertex\\(?:Attrib\\|\\(?:TextureImageUni\\|UniformComponen\\)t\\)\\)\\)s\\)\\|odelView\\(?:Matrix\\(?:\\(?:Inver\\(?:seTranspo\\)?\\|Transpo\\)se\\)?\\|ProjectionMatrix\\(?:\\(?:Inver\\(?:seTranspo\\)?\\|Transpo\\)se\\)?\\)\\|ultiTexCoord[0-7]\\)\\|Normal\\(?:Matrix\\|Scale\\)?\\|ObjectPlane[Q-T]\\|P\\(?:o\\(?:int\\(?:Size\\)??\\|sition\\)\\|rojectionMatrix\\(?:\\(?:Inver\\(?:seTranspo\\)?\\|Transpo\\)se\\)?\\)\\|SecondaryColor\\(?:\\)?\\|Tex\\(?:Coord\\|ture\\(?:EnvColor\\|Matrix\\(?:\\(?:Inver\\(?:seTranspo\\)?\\|Transpo\\)se\\)?\\)\\)\\|Vertex\\)\\)\\>" . font-lock-variable-name-face)
   '("\\<\\(#\\(?:define\\|e\\(?:l\\(?:if\\|se\\)\\|ndif\\|rror\\)\\|i\\(?:f\\(?:n?def\\)?\\|nclude\\)\\|line\\|pragma\\|undef\\)\\)\\>" . font-lock-preprocessor-face)
   '("\\<\\(B\\(?:\\(?:INORMAL\\|LEND\\(?:INDICES\\|WEIGHT\\)\\)[0-9]?\\)\\|COLOR[0-9]?\\|DEPTH[0-9]?\\|FOG\\|NORMAL[0-9]?\\|P\\(?:OSITION\\(?:T\\|[0-9]?\\)\\|SIZE\\(?:[0-9]?\\)?\\)\\|SV_\\(?:C\\(?:LIPDISTANCE[0-9]?\\|OVERAGEOUTPUT\\|ULLDISTANCE[0-9]?\\)\\|D\\(?:EPTHDEPTH\\|ISPATCHTHREADID\\|OMAINLOCATION\\)\\|G\\(?:ROUP\\(?:I\\(?:D\\|NDEX\\)\\|THREADID\\)\\|SINSTANCEID\\)\\|I\\(?:NS\\(?:IDETESSFACTOR\\|TANCEID\\)\\|SFRONTFACE\\)\\|OUTPUTCONTROLPOINTID\\|P\\(?:OSITION\\|RIMITIVEID\\)\\|RENDERTARGETARRAYINDEX\\|SAMPLEINDEX\\|T\\(?:ARGET[0-9]?\\|ESSFACTOR\\)\\|V\\(?:ERTEXID\\|IEWPORTARRAYINDEX\\)\\)\\|T\\(?:\\(?:ANGENT\\|E\\(?:SSFACTOR\\|XCOORD\\)\\)[0-9]?\\)\\|V\\(?:FACE\\|POS\\)\\)\\>" . font-lock-constant-face)
   )
  "Minimal highlighting expressions for HLSL mode")

(defvar hlsl-font-lock-keywords hlsl-font-lock-keywords-1
  "Default highlighting expressions for HLSL mode")

(defvar hlsl-mode-syntax-table
  (let ((hlsl-mode-syntax-table (make-syntax-table)))
    (modify-syntax-entry ?/ ". 124b" hlsl-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" hlsl-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" hlsl-mode-syntax-table)
    hlsl-mode-syntax-table)
  "Syntax table for hlsl-mode")

(define-derived-mode hlsl-mode c-mode "HLSL"
  "Major mode for editing HLSL shader files."
  (set (make-local-variable 'font-lock-defaults) '(hlsl-font-lock-keywords))
  )

;;; hlsls-mode.el ends here
