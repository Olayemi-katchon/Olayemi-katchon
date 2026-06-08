- 👋 Hi, I'm Cerveau KATCHON, i'm male
- 👀 I'm interested in Data science
- 🌱 I'm currently PhD student at École Polytechnique de Montréal
- 💞️ I'm looking to collaborate on my different projects

---

## 📁 Contenu du dépôt

### 🔢 Analyse de Régression — Devoir (calcul matriciel)

| Fichier | Description |
|---------|-------------|
| [`devoir_regression.tex`](./devoir_regression.tex) | **Code LaTeX** — Démonstrations mathématiques (gradients et hessiennes) pour le devoir d'analyse de régression. Compilez avec `pdflatex devoir_regression.tex`. |
| [`q1.jpg`](./q1.jpg) | Image manuscrite — Question 1 : gradient de la forme quadratique |
| [`q2 et q3.jpg`](./q2%20et%20q3.jpg) | Images manuscrites — Q2 (hessienne) et Q3 (gradient exponentiel) |
| [`q4.jpg`](./q4.jpg) | Image manuscrite — Question 4 : hessienne exponentielle |
| [`q5.jpg`](./q5.jpg), [`q6.jpg`](./q6.jpg) | Images manuscrites — Question 5 : gradient de la norme au carré |
| [`5687.jpg`](./5687.jpg) | Image manuscrite — Question 6 : hessienne de ‖Ax‖² |
| [`5694.jpg`](./5694.jpg) | Image manuscrite — Question 7 (a)(b) : gradient + hessienne avec barrière log |
| [`5722.jpg`](./5722.jpg) | Image manuscrite — Question 7 fonction + méthode de Newton (contexte) |
| [`5723.jpg`](./5723.jpg) | Image manuscrite — Question 8 : dérivation de la direction de Newton Hp*=−g |

**Résultats clés :**

| Question | Fonction | Résultat |
|----------|----------|---------|
| Q1 | `f(x) = ½ xᵀAx + bᵀx + c` | `∇f = Ax + b` |
| Q2 | même | `∇²f = A` |
| Q3 | `f(x) = exp(xᵀAx)` | `∇f = 2 exp(xᵀAx) Ax` |
| Q4 | même | `∇²f = exp(xᵀAx)(4 Axxᵀ A + 2A)` |
| Q5 | `f(x) = ‖Ax‖²` | `∇f = 2 AᵀAx` |
| Q6 | `f(x) = ‖Ax‖²` | `∇²f = 2 AᵀA` |
| Q7(a) | `f(x) = ½xᵀAx − bᵀx − μ₁log x₁ − μ₂log x₂` | `∇f = Ax − b − [μ₁/x₁; μ₂/x₂]` |
| Q7(b) | même | `∇²f = A + diag(μ₁/x₁², μ₂/x₂²)` |
| Q8 | `min_p [gᵀp + ½pᵀHp]` | `Hp* = −g  →  x_{k+1} = xₖ − H⁻¹∇f(xₖ)` |

---

### 📊 Évaluation du PSIE (Programme d'Insertion Spécial dans l'Emploi — Bénin)

| Fichier | Description |
|---------|-------------|
| [`PSIE_Evaluation_Benin.md`](./PSIE_Evaluation_Benin.md) | Rapport d'évaluation Phase I — Pertinence, Cohérence, Efficacité (critères OCDE/CAD 2019) |

---

### 🤖 Deep Learning / Segmentation d'images

| Fichier | Description |
|---------|-------------|
| [`Deep_learning.ipynb`](./Deep_learning.ipynb) | Notebook Deep Learning |
| [`simple_multi_unet_model.ipynb`](./simple_multi_unet_model.ipynb) | Modèle U-Net multi-classes pour segmentation d'images |
| [`base1.xlsx`](./base1.xlsx) | Base de données |

---

<!---
Olayemi-katchon/Olayemi-katchon is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
