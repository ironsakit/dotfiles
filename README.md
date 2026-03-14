# 💻 I Miei Dotfiles per Emacs 

![Emacs](https://img.shields.io/badge/Emacs-Customized-blueviolet?style=for-the-badge&logo=gnuemacs)
![C](https://img.shields.io/badge/C-Programming-blue?style=for-the-badge&logo=c)
![Windows](https://img.shields.io/badge/Windows-Compatible-informational?style=for-the-badge&logo=windows)

Benvenuto! Questo repository contiene la mia configurazione personale di **Emacs**, ottimizzata specificamente per la programmazione in **C** su ambiente Windows.

Non ho messo un granchè ma volevo condividere con gli altri utenti la mia configurazione, magari per aiutarmi a migliorarla, grazie mille a tutti.

---

## ✨ Funzionalità Principali

*  **Gestione Pacchetti:** Download e installazione automatica (tramite MELPA) al primo avvio. Non serve scaricare nulla a mano!
*  **Company-mode:** Autocompletamento del codice intelligente in tempo reale.
*  **Flycheck:** Controllo degli errori di sintassi istantaneo (ti avvisa prima ancora di compilare).
*  **UI Pulita:** Tema *Leuven-dark*, numeri di riga attivi, evidenziazione della riga corrente e parentesi automatiche.

---

## Scorciatoie Personalizzate

Ho scritto alcune funzioni in *Emacs Lisp* per velocizzare il lavoro:

| Tasto | Azione | Descrizione |
| :---: | :--- | :--- |
| **`F5`** | **Compila ed Esegui** | Salva il file `.c` corrente, lo compila con `gcc` e lo lancia in una **vera finestra CMD nativa** di Windows. |
| **`F6`** | **Auto-Format** | Riordina e indenta automaticamente tutto il codice del file corrente. |

---

## Come usarlo (Installazione)

Se vuoi provare questa configurazione sul tuo PC, ti basta avere Git ed Emacs installati, e poi lanciare questo comando dal terminale:

```bash
git clone [https://github.com/ironsakit/dotfiles.git](https://github.com/ironsakit/dotfiles.git)
