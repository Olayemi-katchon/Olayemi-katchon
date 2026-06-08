import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

sns.set_theme()
np.random.seed(42)

# Paramètres
n_values = [50, 100, 500, 5000]  # Nombre d'échantillons
num_trials = 2000                 # Nombre de répétitions

fig, axes = plt.subplots(2, 2, figsize=(14, 10))
axes = axes.flatten()

for ax, n in zip(axes, n_values):
    # Génération des variables de Bernoulli
    X = np.random.binomial(1, 0.5, (num_trials, n))
    # Calcul des moyennes empiriques finales
    final_means = X.mean(axis=1)

    ax.hist(final_means, bins=30, density=True, alpha=0.6,
            color='steelblue', edgecolor='black')
    ax.axvline(0.5, color='red', linestyle='dashed',
               label=r'$\mathbb{E}[X] = 0.5$')
    ax.set_title(
        r"Distribution de $\overline{X}_n$" + f" pour $n={n}$",
        fontsize=11
    )
    ax.set_xlabel("Valeur de la moyenne empirique")
    ax.set_ylabel("Densité")
    ax.legend()

fig.suptitle(
    "Loi faible des grands nombres : distribution de la moyenne empirique",
    fontsize=13, fontweight='bold', y=1.01  # légèrement au-dessus pour éviter le chevauchement
)
plt.tight_layout()
plt.savefig("lln_distributions.png", dpi=150, bbox_inches='tight')
plt.show()
