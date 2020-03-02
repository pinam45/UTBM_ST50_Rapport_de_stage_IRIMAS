# Rapport de stage IRIMAS

Ce dépôt contient les sources LaTeX de mon projet et rapport de stage ST50/8INF859 ainsi que des slides de ma présentation UTBM.

Ce stage a été réalisé dans le cadre de mes études à l'Université de technologie de Belfort Montbéliard (UTBM) et à l'Université du Québec à Chicoutimi, il a eu lieu à l'Institut de Recherche en Informatique, Mathématiques, Automatique et Signal (IRIMAS) sur le campus Illberg de l'Université de Haute Alsace (UHA) à Mulhouse du 02/09/2019 au 07/02/2020.

Pour plus d'informations voir le rapport en lui-même. Une version déjà compilée en PDF des documents est disponible [ici](https://github.com/pinam45/UTBM_ST50_Rapport_de_stage_IRIMAS/releases/latest).

Autres dépôts en rapport avec ce stage:
 - [USCP](https://github.com/pinam45/USCP)
 - [USCP_results](https://github.com/pinam45/USCP_results)
 - [USCP_instances](https://github.com/pinam45/USCP_instances)

# Documents

## Rapport de stage

*Sous-dossier: Rapport_de_stage*

Rapport de stage rendu à l'UTBM et à l'UQAC, partie intégrante de l'évaluation du stage.

## Projet de stage UQAC

*Sous-dossier: Projet_de_stage_UQAC*

Projet de stage rendu à l'UQAC, partie intégrante de l'évaluation du stage.

## Soutenance de stage UTBM

*Sous-dossier: Soutenanace_de_stage_UTBM*

Slides de la soutenance orale réalisée à l'UTBM le 28/02/2020, partie intégrante de l'évaluation du stage.

# Compilation des documents

## Prérequis

- Une distribution LaTeX avec ``lualatex`` telle que [TeX Live](http://tug.org/texlive) ou [MiKTeX](https://miktex.org/)
- La police de caractères Tahoma installée sur votre système (par défaut sous Windows)

## Dépendances

Les packages suivant sont nécessaires pour compiler les documents:

```
algorithm2e, amsmath, amssymb, amsthm, array, babel, biblatex, blkarray, booktabs, braket, caption, chngcntr, dsfont, enumitem, etoolbox, fancyvrb, float, fontenc, fontspec, footmisc, hyperref, ifluatex, ifxetex, import, inputenc, longtable, makecell, mathrsfs, multirow, pdflscape, pgf-umlsd, pgfgantt, pgfplots, pgf, relsize, standalone, stmaryrd, tabularx, tabu, tcolorbox, tikzpeople, tikz, translator, xcolor
```
Disponibles sur [CTAN](https://ctan.org/), en général installés avec la distribution LaTeX.

```
beamercolorthemeutbm beamerinnerthemeutbm beamerouterthemeutbm beamerthemeutbm
```
Disponible ici: [utbm-latex-internship-report-covers](https://github.com/pinam45/utbm-latex-internship-report-covers), installation manuelle nécessaire

## Compilation

Des ``.latexmkrc`` sont inclus dans le dossier racine et les sous-dossiers des documents pour compiler simplement avec latexmk:
```
$ latexmk -silent
```
