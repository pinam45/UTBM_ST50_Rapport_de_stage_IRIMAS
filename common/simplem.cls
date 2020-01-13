% MIT License
%
% Copyright (c) 2020 Maxime Pinard
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simplem}[2020/01/12]

%----------------------------------------
% Options
%----------------------------------------

\def\simplem@classoptions{a4paper,11pt,twoside}

\newif\ifsimplem@bookformat
\newif\ifsimplem@reportformat
\newif\ifsimplem@articleformat
\simplem@bookformattrue
\simplem@reportformatfalse
\simplem@articleformatfalse

\newif\ifsimplem@english
\newif\ifsimplem@french
\simplem@englishtrue
\simplem@frenchfalse

\DeclareOption{french}{%
	\simplem@frenchtrue
	\simplem@englishfalse
	\edef\simplem@classoptions{\simplem@classoptions,french}%
	\PassOptionsToPackage{french}{babel}
}
\DeclareOption{francais}{%
	\simplem@frenchtrue
	\simplem@englishfalse
	\edef\simplem@classoptions{\simplem@classoptions,french}%
	\PassOptionsToPackage{french}{babel}
}
\DeclareOption{english}{%
	\simplem@englishtrue
	\simplem@frenchfalse
	\edef\simplem@classoptions{\simplem@classoptions,english}%
	\PassOptionsToPackage{english}{babel}
}
\DeclareOption{book}{%
	\simplem@bookformattrue
	\simplem@reportformatfalse
	\simplem@articleformatfalse
}
\DeclareOption{report}{%
	\simplem@bookformatfalse
	\simplem@reportformattrue
	\simplem@articleformatfalse
}
\DeclareOption{article}{%
	\simplem@bookformatfalse
	\simplem@reportformatfalse
	\simplem@articleformattrue
}
\ProcessOptions

%----------------------------------------
% Base class
%----------------------------------------

\ifsimplem@bookformat
	\expandafter\LoadClass[\simplem@classoptions]{book}
\else
	\ifsimplem@reportformat
		\expandafter\LoadClass[\simplem@classoptions]{report}
	\else
		\ClassWarning{Not supported yet}
	\fi
\fi

%----------------------------------------
% Packages
%----------------------------------------

% General purpose
\RequirePackage{babel}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\PassOptionsToPackage{
	table,
	svgnames
}{xcolor}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{titlesec}
\RequirePackage{titlesec}
\RequirePackage{listings}
\PassOptionsToPackage{
	notindex,
	nottoc,
	notlot,
	notlof
}{tocbibind}
\RequirePackage{tocbibind}
\PassOptionsToPackage{
	justification=centering
}{caption}
\RequirePackage{caption}

% Bibliography
\PassOptionsToPackage{
	backend=biber,
	bibstyle=ieee,
	citestyle=numeric-comp,
	backref=true,
	date=iso
}{biblatex}
\RequirePackage{biblatex}

% Glossary
\PassOptionsToPackage{
	acronym,
	toc
}{glossaries}
\RequirePackage{glossaries}

%----------------------------------------
% Page geometry
%----------------------------------------

\geometry{
	includeheadfoot,
	margin=2.54cm
}

%----------------------------------------
% Pages headers and footers
%----------------------------------------

% Set chapter numbers style
%\renewcommand{\thechapter}{\arabic{chapter}}
%\addto\captionsfrench{\renewcommand{\chaptername}{}}

% Enable the custom headers and footers
\pagestyle{fancy}

% Clear default headers and footers
\fancyhf{}

% Styling for the page number in the header
%\fancyhead[LE,RO]{\sffamily\normalsize\thepage}

% Print the nearest section name on the left side of odd pages
\fancyhead[LO]{\nouppercase{\rightmark}}

% Print the current chapter name on the right side of even pages
\fancyhead[RE]{\nouppercase{\leftmark}}

% Print the page number in the footer
\fancyfoot[C]{\thepage}

% Thickness of the rule under the header
\renewcommand{\headrulewidth}{0.5pt}

% Style for when a plain pagestyle is specified
\fancypagestyle{plain}{
	\fancyhead{}\renewcommand{\headrulewidth}{0pt}%
}

%----------------------------------------
% Chapters style
%----------------------------------------

% \renewcommand{\@makechapterhead}[1]{%
%   \thechapter #1\\\rule[0.1ex]{1.5\columnwidth}{4pt}
% }

\def\@makechapterhead#1{%
{\parindent \z@ \raggedright \normalfont
	{\huge\bfseries\thechapter{} #1}\\\rule[0.1ex]{1.5\columnwidth}{4pt}
\par\vspace*{30\p@}}}

\def\@makeschapterhead#1{%
{\parindent \z@ \raggedright \normalfont
	{\huge\bfseries#1}\\\rule[0.1ex]{1.5\columnwidth}{4pt}
\par\vspace*{30\p@}}}

%----------------------------------------
% Page breaks
%----------------------------------------

% Prevent page breaks in paragraphs
\predisplaypenalty=1000
\postdisplaypenalty=1000
\clubpenalty=1000

% Minimal space required in the bottom margin not to move the title on the next page
\renewcommand{\bottomtitlespace}{.1\textheight}

%----------------------------------------
% Links
%----------------------------------------

% Links config, especialy for the table of contents
\hypersetup{
	breaklinks,
	bookmarks=true,
	bookmarksopen=true,
	bookmarksnumbered=true,
	colorlinks=true,
	linkcolor=black,
	urlcolor=blue,
	linktoc=all,
	citecolor=black
}

%----------------------------------------
% Listings
%----------------------------------------

\lstset{
	%language=C,
	extendedchars=true,
	inputencoding=utf8,
	showlines=false,
	tabsize=4,
	showtabs=false,
	showspaces=false,
	showstringspaces=false,
	breaklines=true,
	breakatwhitespace=false,
	basicstyle=\footnotesize\ttfamily,
	frame=single,
	columns=[c]fixed,
	keepspaces=true,
}

%----------------------------------------
% Language
%----------------------------------------

% French language configuration
\frenchbsetup{
	StandardLayout=true,
	ReduceListSpacing=false,
	CompactItemize=false
}

%----------------------------------------
% Copiright page command
%----------------------------------------

\newcommand{\makecopirightpage}[1]{
	\newpage
	\thispagestyle{empty}
	{#1}
	~\vfill
	\noindent Ce document a été réalisé avec \LaTeX{}.\TeX{} et \LaTeX{} sont des marques de la Société Américaine de Mathématiques. Les noms et marques cités ainsi que les logos correspondants sont la propriété de leurs auteurs ou de leurs ayant-droits.
	~\vfill

	\noindent Copyright \copyright\ \@date\ \@author\\

	%\noindent \textsc{Publié par PUB}\\

	%\noindent \textsc{PUB.com}\\

	%\noindent Licensed under the Creative Commons Attribution 4.0 International License (the ``License''). You may not use this file except in compliance with the License. You may obtain a copy of the License at \url{https://creativecommons.org/licenses/by/4.0/}. Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \textsc{``as is'' basis, without warranties or conditions of any kind}, either express or implied. See the License for the specific language governing permissions and limitations under the License.\\

	\par Le Code de la propri\'et\'e intellectuelle n'autorisant, aux termes de l'article L.122-5, 2\textdegree et 3\textdegree a), d'une part, que les ``copies ou reproductions strictement r\'eserv\'ees \`a l'usage priv\'e du copiste et non destin\'ees \`a une utilisation collective'' et, d'autre part, que les analyses et les courtes citations dans un but d'exemple et d'illustation, ``toute repr\'esentation ou reproduction int\'egrale ou partielle faite sans le consentement de l'auteur ou de ses ayants droit ou ayants cause est illicite'' (art. L.122-4).\\

	\par Cette repr\'esentation ou reproduction, par quelque proc\'ed\'e que ce soit, constiturait donc une contrefa\c{c}on sanctionn\'ee par les articles L.335-2 et suivants du Code de la propri\'et\'e intellectuelle.

	%\noindent \textit{Première impression: Janvier 2020}
}
