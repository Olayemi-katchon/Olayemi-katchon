## ============================================================
## Devoir 5 – Séries temporelles (MTH8304)
## Script R complet : Partie A + Partie B (éléments 1 à 4)
## Librairie : fpp3
## ============================================================

library(fpp3)
library(readr)
library(lubridate)

## ------------------------------------------------------------
## 0. Lecture et mise en forme des données CET mensuelles
## ------------------------------------------------------------
cet_raw <- read.table("~/Data/meantemp_monthly_totals.txt",
                      header = TRUE, skip = 4)

ts_cet <- cet_raw %>%
  select(-Annual) %>%
  pivot_longer(Jan:Dec, names_to = "Month", values_to = "Tmean") %>%
  mutate(date = yearmonth(paste(Year, Month), "%Y %b")) %>%
  filter(Tmean != -99.9) %>%
  as_tsibble(index = date)

## Série d'entraînement : 1659-1996
cet.train <- ts_cet |> filter(Year <= 1996) |> as_tsibble(index = date)

## Série de test : 1997-2026
cet.test  <- ts_cet |> filter(Year >= 1997) |> as_tsibble(index = date)

## ============================================================
## PARTIE A – Analyses préliminaires
## ============================================================

## ------------------------------------------------------------
## Élément (1) : Analyses graphiques
## ------------------------------------------------------------

## Graphique 1 – Évolution de la température moyenne (vue d'ensemble)
autoplot(cet.train, Tmean, linewidth = 0.8) +
  labs(y = "Température (°C)", x = "Mois",
       title = "CET mensuelle (1659–1996)") +
  theme(text = element_text(size = 20))

## Graphique 2 – Season plot (saisonnalité)
cet.train |>
  gg_season(Tmean, labels = "both", linewidth = 0.8) +
  labs(y = "Température (°C)", x = "Mois") +
  theme(text = element_text(size = 20))

## Graphique 3 – Lag plots (retards 1, 6 et 12)
cet.train |>
  gg_lag(Tmean, geom = "point", lags = c(1, 6, 12)) +
  theme(text = element_text(size = 20), legend.title = element_blank())

## Graphique 4 – Facettes par mois (gg_subseries)
cet.train |>
  gg_subseries(Tmean) +
  theme(text = element_text(size = 20))

## ACF globale jusqu'à lag 36
cet.train |>
  ACF(Tmean, lag_max = 36) |>
  autoplot() +
  theme(text = element_text(size = 20))

## ------------------------------------------------------------
## Élément (2) : Décomposition STL et évaluation de l'ACF des résidus
## ------------------------------------------------------------

## --- Configuration 1 : trend=24, season='periodic'
cet.stl.periodic <- cet.train |>
  model(STL(Tmean ~ trend(window = 24) + season(window = "periodic"))) |>
  components()

autoplot(cet.stl.periodic)                          # Graphique 5

cet.stl.periodic |>
  ACF(remainder, lag_max = 36) |> autoplot()        # Graphique 6 (lag 36)

cet.stl.periodic |>
  ACF(remainder, lag_max = 24) |> autoplot()        # Graphique 7 (lag 24)

## --- Configuration 2 : trend=24, season=11
cet.stl.s11 <- cet.train |>
  model(STL(Tmean ~ trend(window = 24) + season(window = 11))) |>
  components()

cet.stl.s11 |>
  ACF(remainder, lag_max = 24) |> autoplot()        # Graphique 8 (afc11)

## --- Configuration 3 : trend=50, season=15
cet.stl.s15 <- cet.train |>
  model(STL(Tmean ~ trend(window = 51) + season(window = 15))) |>
  components()

cet.stl.s15 |>
  ACF(remainder, lag_max = 24) |> autoplot()        # Graphique 9 (acf15)

## --- Configuration 4 : trend=13, season=19 (paramétrage retenu)
cet.stl.s19 <- cet.train |>
  model(STL(Tmean ~ trend(window = 13) + season(window = 19))) |>
  components()

cet.stl.s19 |>
  ACF(remainder, lag_max = 24) |> autoplot()        # Graphique 10 (acf19)

## ------------------------------------------------------------
## Élément (3) : Modèle de référence – méthode saisonnière naïve
## ------------------------------------------------------------
cet.benchmark <- cet.train |>
  model("Naive saison." = SNAIVE(Tmean))

cet.benchmark.fc <- cet.benchmark |> forecast(h = 12)

cet.benchmark.fc |>
  autoplot(cet.train |> filter(Year >= 1994),
           level = 95, linewidth = 1.2) +
  autolayer(cet.test |> filter(Year <= 1997),
            Tmean, linewidth = 1.2, linetype = 2) +
  labs(y = "degrés C", x = "mois") +
  theme(text = element_text(size = 20))

## ============================================================
## PARTIE B – Modélisation, prévision et comparaison
## ============================================================

## ------------------------------------------------------------
## Élément (1) : Entraînement des trois modèles candidats
## ------------------------------------------------------------

## Modèle 1 : ETS (sélection automatique)
cet.fit.ets <- cet.train |>
  model(ETS = ETS(Tmean))
report(cet.fit.ets)

## Modèle 2 : SARIMA (sélection automatique des ordres)
cet.fit.arima <- cet.train |>
  model(SARIMA = ARIMA(Tmean))
report(cet.fit.arima)

## Modèle 3 : STL + ARIMA (paramétrage retenu : trend=13, season=19)
cet.fit.stlarima <- cet.train |>
  model(STL_ARIMA = decomposition_model(
    STL(Tmean ~ trend(window = 13) + season(window = 19)),
    ARIMA(season_adjust)
  ))
report(cet.fit.stlarima)

## ------------------------------------------------------------
## Élément (2) : Analyse des résidus pour chaque modèle
## ------------------------------------------------------------

## --- ETS
cet.fit.ets |> gg_tsresiduals()                              # Fig residu1
cet.fit.ets |> augment() |>
  features(.innov, ljung_box, lag = 10)                      # Fig pormant1

## --- SARIMA
cet.fit.arima |> gg_tsresiduals()                            # Fig residu2
cet.fit.arima |> augment() |>
  features(.innov, ljung_box, lag = 10)                      # Fig pormant2

## --- STL + ARIMA
cet.fit.stlarima |> gg_tsresiduals()                         # Fig residu3
cet.fit.stlarima |> augment() |>
  features(.innov, ljung_box, lag = 10)                      # Fig pormant3

## ============================================================
## Élément (3) : Validation séquentielle par entraînement incrémental
##               (expanding window – fenêtre croissante)
## ============================================================
## Justification du choix :
##   - La série CET couvre 337 ans d'entraînement : toute l'information
##     historique est pertinente (patterns saisonniers stables).
##   - L'entraînement incrémental conserve l'ensemble des données passées
##     à chaque itération, ce qui stabilise les estimations des paramètres.
##   - La fenêtre glissante (sliding) serait moins appropriée car elle
##     éliminerait des observations historiques précieuses.
##   - Pas de réentraînement : 12 mois (annuel) sur ~30 ans de test = 30 it.

## Taille initiale = toute la série d'entraînement (1659-1996)
init_size <- nrow(cet.train)

## Création des fenêtres croissantes (stretch_tsibble)
## .step = 12 : on avance d'un an à chaque itération
## .init  = init_size : la première fenêtre est la série d'entraînement complète
cet_stretch <- ts_cet |>
  filter(Year <= 2025) |>
  stretch_tsibble(.init = init_size, .step = 12)

## Entraînement des modèles retenus + modèle de référence
## (ETS écarté pour résidus insuffisants, mais inclus ici pour comparaison)
cet_cv_fit <- cet_stretch |>
  model(
    SNAIVE    = SNAIVE(Tmean),
    SARIMA    = ARIMA(Tmean),
    STL_ARIMA = decomposition_model(
      STL(Tmean ~ trend(window = 13) + season(window = 19)),
      ARIMA(season_adjust)
    )
  )

## Prévisions sur 12 mois à chaque itération
cet_cv_fc <- cet_cv_fit |> forecast(h = 12)

## ============================================================
## Élément (4) : Comparaison des performances de prévision
## ============================================================

## Mesures de performance sur la série de test complète
perf <- cet_cv_fc |> accuracy(ts_cet)
print(perf)

## Tableau synthétique des métriques clés
perf |>
  select(.model, RMSE, MAE, MAPE, MASE) |>
  arrange(MASE)

## Graphique comparatif des prévisions (horizon : 1997)
## (Reproduit le graphique du benchmark avec tous les modèles)
cet_cv_fc |>
  filter(.id == 1) |>                        # première itération (prévision 1997)
  autoplot(cet.train |> filter(Year >= 1994),
           level = 95, linewidth = 1.0) +
  autolayer(cet.test |> filter(Year <= 1997),
            Tmean, linewidth = 1.2, linetype = 2, colour = "black") +
  labs(y = "Température (°C)", x = "Mois",
       title = "Prévisions 1997 – comparaison des modèles") +
  theme(text = element_text(size = 16))

## Graphique des erreurs quadratiques moyennes par horizon de prévision
cet_cv_fc |>
  accuracy(ts_cet, by = c(".model", "h")) |>
  ggplot(aes(x = h, y = RMSE, colour = .model)) +
  geom_line(linewidth = 1) +
  labs(x = "Horizon de prévision (mois)", y = "RMSE",
       title = "RMSE par horizon – validation séquentielle") +
  theme(text = element_text(size = 16))
