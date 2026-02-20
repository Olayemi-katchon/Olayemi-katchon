# 📤 Comment partager vos documents pour l'évaluation du PSIE

Ce guide vous explique **3 méthodes** pour déposer vos documents dans ce dépôt GitHub, du plus simple au plus avancé.

---

## ✅ Méthode 1 — Upload direct sur GitHub (recommandée, sans installation)

C'est la méthode la plus simple. Elle ne nécessite aucune installation.

### Étape 1 — Aller dans le bon dossier

Naviguez vers le dossier correspondant à votre document :

| Votre document | Dossier de destination |
|---|---|
| 📄 Document de projet / conception du PSIE | [`docs/psie/01_document_projet/`](docs/psie/01_document_projet/) |
| 📊 Rapport de mise en œuvre / rapport d'activités | [`docs/psie/02_rapport_mise_en_oeuvre/`](docs/psie/02_rapport_mise_en_oeuvre/) |
| 🗂️ Cadre logique / théorie du changement | [`docs/psie/03_cadre_logique/`](docs/psie/03_cadre_logique/) |
| 📈 Données statistiques sur l'emploi (INSAE, etc.) | [`docs/psie/04_donnees_statistiques/`](docs/psie/04_donnees_statistiques/) |
| 📋 Politiques nationales (PAG, PNE, etc.) | [`docs/psie/05_politiques_nationales/`](docs/psie/05_politiques_nationales/) |

### Étape 2 — Cliquer sur "Add file" → "Upload files"

Dans la page du dossier GitHub, cliquez sur le bouton **"Add file"** (en haut à droite), puis sélectionnez **"Upload files"**.

```
┌────────────────────────────────────────────┐
│  docs/psie/01_document_projet/             │
│                                            │
│  [Go to file]  [Add file ▼]  [Code ▼]     │
│                 ├── Create new file        │
│                 └── Upload files  ← ICI   │
└────────────────────────────────────────────┘
```

### Étape 3 — Glisser-déposer votre fichier

Faites glisser votre fichier (PDF, Word, Excel) dans la zone d'upload, ou cliquez sur **"choose your files"**.

### Étape 4 — Valider le dépôt ("Commit changes")

En bas de la page :
1. Laissez le message de commit par défaut ou écrivez : `Ajout document projet PSIE`
2. Sélectionnez **"Commit directly to the current evaluation branch"**
3. Cliquez sur **"Commit changes"**

> 🎉 Votre document est maintenant dans le dépôt et sera utilisé pour compléter l'évaluation !

---

## ✅ Méthode 2 — Partager le contenu textuel directement dans la conversation

Si vos documents sont en **format Word (.docx)** ou **texte**, vous pouvez :

1. **Ouvrir le document** dans Word ou un éditeur de texte
2. **Copier le contenu** (Ctrl+A → Ctrl+C)
3. **Le coller directement** dans un nouveau message de la conversation GitHub

Cela permet une analyse immédiate sans avoir à uploader le fichier.

### Exemple de message à envoyer :
```
Voici le contenu du document de projet PSIE :

[Collez ici le texte intégral du document]
```

---

## ✅ Méthode 3 — Partager un lien vers un document en ligne

Si vos documents sont déjà hébergés en ligne (Google Drive, OneDrive, portail gouvernemental béninois, etc.) :

1. Générez un **lien de partage** (avec accès "Tout le monde peut voir")
2. Partagez le lien dans un message de la conversation

### Exemple de message à envoyer :
```
Voici les liens vers mes documents :
- Document de projet : https://drive.google.com/...
- Rapport de mise en œuvre : https://drive.google.com/...
- Cadre logique : https://drive.google.com/...
```

---

## 📋 Récapitulatif des 3 documents que vous avez mentionnés

| Document | Dossier cible | Informations clés à extraire |
|---|---|---|
| **Document de projet PSIE** | `docs/psie/01_document_projet/` | Objectifs, bénéficiaires, composantes, budget, zones |
| **Rapport de mise en œuvre** | `docs/psie/02_rapport_mise_en_oeuvre/` | Extrants produits, taux d'exécution, facteurs |
| **Cadre logique** | `docs/psie/03_cadre_logique/` | Chaîne de résultats, indicateurs, cibles, hypothèses |

---

## ❓ Questions fréquentes

**Q : Quels formats de fichiers sont acceptés ?**
> PDF (.pdf), Word (.docx, .doc), Excel (.xlsx, .xls), images (.png, .jpg). La taille maximale par fichier sur GitHub est de **25 MB**.

**Q : Et si mon fichier est confidentiel ?**
> Ce dépôt GitHub est public. Si vos documents sont confidentiels ou ne doivent pas être publiés, utilisez la **Méthode 2** (copier-coller du texte dans la conversation) ou la **Méthode 3** avec un lien Google Drive en accès restreint.

**Q : Que faire si le fichier dépasse 25 MB ?**
> Compressez le PDF (via [ilovepdf.com](https://ilovepdf.com/compress_pdf)) ou extrayez les pages les plus pertinentes.

**Q : Dans quelle branche dois-je uploader ?**
> Uploadez dans la **branche active de l'évaluation** (celle sur laquelle vous travaillez actuellement avec votre collaborateur). Elle est indiquée en haut de chaque page du dépôt dans le menu déroulant des branches.

---

*Une fois les documents partagés, l'évaluation `PSIE_Evaluation.md` sera complétée avec les informations réelles du programme.*
