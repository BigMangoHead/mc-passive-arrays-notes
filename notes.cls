\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2026/02/07 LaTeX class for my notes]

\RequirePackage{amsmath} % Used all over the place, align env, DeclareMathOperator, etc
\RequirePackage{amsthm} % Used for theorem environments
\RequirePackage{amssymb} % Used for many niche symbols
\RequirePackage{graphicx} % For \includegraphics
\RequirePackage{fancyhdr} % For nice headers and footers
\RequirePackage[framemethod=TikZ]{mdframed} % For environment frames
\RequirePackage[svgnames]{xcolor} % Provides nicely named colors
\RequirePackage{xparse} % Provides if statements for optional parameters
\RequirePackage{enumerate} % Easy way for alphanumeric enumeration + other features

\usetikzlibrary{shadows} % Allow shadows in TikZ frames for mdframed

\LoadClass{article}

% Override \author, \title, \date commands so we can access them at the correct time.
% Probably scuffed but it seems to work
\newcommand{\theauthor}{}
\renewcommand{\author}[1]{%
  \gdef\@author{#1}%
  \gdef\theauthor{#1}%
}
\newcommand{\thetitle}{}
\renewcommand{\title}[1]{%
  \gdef\@title{#1}%
  \gdef\thetitle{#1}%
}
\newcommand{\thedate}{}
\renewcommand{\date}[1]{%
  \gdef\@date{#1}%
  \gdef\thedate{#1}%
}

% Convenient command to access the month, inspired by luchonacho on StackExchange
\newcommand{\themonth}{\ifcase \month \or January\or February\or March\or %
April\or May \or June\or July\or August\or September\or October\or November\or %
December\fi}

% Some page settings
\linespread{1.5}
\hoffset = -35pt % Deafult is 0
\textwidth = 415pt % Default is 345
\voffset = -10pt % Default is 0
\textheight = 570pt % Default is 550

% Make sections default to not being numbered, allowing 
% them to be in the table of contents without extra work
\setcounter{secnumdepth}{0}

% Change header
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0.5pt}
\fancyhead[R]{\theauthor, \thedate}
\fancyhead[L]{\thetitle}
