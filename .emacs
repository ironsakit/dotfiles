;;; -*- lexical-binding: t -*-

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(leuven-dark))
 '(package-selected-packages
   '(## company flycheck highlight-indent-guides highlight-symbol)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ==========================================
;;   GESTIONE PACCHETTI (Download automatico)
;; ==========================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Aggiorna la lista dei pacchetti da internet se è la prima volta
(unless package-archive-contents
  (package-refresh-contents))

;; Installa automaticamente tutti i plugin necessari se mancano!
(dolist (pacchetto '(company flycheck highlight-indent-guides highlight-symbol))
  (unless (package-installed-p pacchetto)
    (package-install pacchetto)))

;; ==========================================
;;     CONFIGURAZIONE PACCHETTI ESTERNI
;; ==========================================

;; --- Autocompletamento codice (Company) ---
(require 'company)
(global-company-mode 1)

;; --- Controllo errori di sintassi al volo (Flycheck) ---
(require 'flycheck)
(global-flycheck-mode 1)

;; --- Evidenziazione di tutte le occorrenze di una variabile (Highlight-symbol) ---
(require 'highlight-symbol)
(defun highlight-symbol-mode-on () (highlight-symbol-mode 1))
(define-global-minor-mode
  global-highlight-symbol-mode
  highlight-symbol-mode
  highlight-symbol-mode-on)
(global-highlight-symbol-mode 1)

;; --- Linee guida verticali per l'indentazione ---
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; ==========================================
;;     IMPOSTAZIONI DI BASE DI EMACS
;; ==========================================

(semantic-mode 1)

;; Chiude le parentesi e le virgolette automaticamente
(electric-pair-mode 1)

;; Silenzia il fastidioso suono del campanello di errore
(setq visible-bell t)

;; Mostra il nome della funzione corrente nella barra in basso
(which-function-mode 1)

;; Evidenzia la riga dove si trova il cursore
(global-hl-line-mode 1)

;; Mostra i numeri di riga a sinistra
(global-display-line-numbers-mode 1)

;; Migliora la ricerca e l'apertura dei file (Ido)
(require 'ido)
(ido-mode t)

;; ==========================================
;;  FUNZIONI PERSONALIZZATE (Esecuzione C)
;; ==========================================

(defun compila-ed-esegui-c-veloce ()
  "Salva, compila e lancia il programma in una vera finestra nativa di Windows."
  (interactive)
  (when (eq major-mode 'c-mode)
    (save-buffer)
    (let* ((sorgente (file-name-nondirectory (buffer-file-name)))
           (eseguibile (file-name-sans-extension sorgente))
           ;; Compila e se va a buon fine (&&) apre il CMD nero di Windows
           (comando (format "gcc %s -o %s && start cmd /c \"%s.exe & pause\""  ;; Inserisco anche la pausa alla fine del programma almeno posso vedere il risultato
                            sorgente eseguibile eseguibile)))
      (compile comando))))

;; Associa la funzione al tasto F5
(global-set-key (kbd "<f5>") 'compila-ed-esegui-c-veloce)

;; ==========================================
;;      FORMATTAZIONE AUTOMATICA
;; ==========================================
(defun formatta-codice-c ()
  "Sistema automaticamente l'indentazione di tutto il file."
  (interactive)
  (indent-region (point-min) (point-max))
  (message "Tranquillo ho formattato io il codice per te."))

;; Associa la funzione al tasto F6
(global-set-key (kbd "<f6>") 'formatta-codice-c)
