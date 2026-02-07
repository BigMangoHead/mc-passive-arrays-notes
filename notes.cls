\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2025/07/14 LaTeX class for my notes]

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

% Define styles for theorems and other adjacent objects
% 
% Establish defaults for all styles
\mdfsetup{
    skipabove=12pt, 
    skipbelow=10pt, % Not sure this can be configured for individual styles
    linewidth=1pt, 
    nobreak=true,
    innerbottommargin=10pt,
    innertopmargin=10pt,
    roundcorner=4pt,
    shadow=true,
}
% Extra comment on end is for recommended color of title
\mdfdefinestyle{purplebox}{
    linecolor=DarkViolet,
    backgroundcolor=Plum!20,
}% Purple
\mdfdefinestyle{khakibox}{
    linecolor=DarkKhaki,
    backgroundcolor=Ivory,
}% Brown
\mdfdefinestyle{greenbox}{
    linecolor=Green,
    backgroundcolor=LawnGreen!20,
}% Green
\mdfdefinestyle{greenbox-alt}{
    roundcorner=0pt,
    linewidth=4pt,
    topline=false,
    bottomline=false,
    rightline=false,
    linecolor=Green,
    backgroundcolor=LawnGreen!20,
}% Green
\mdfdefinestyle{redbox}{
    linecolor=FireBrick,
    backgroundcolor=DarkOrange!20,%LightSalmon!30
}% FireBrick
\mdfdefinestyle{orangebox}{
    roundcorner=0pt,
    linecolor=Sienna,
    backgroundcolor=PeachPuff!50,
}% Black
\mdfdefinestyle{bluebox}{
    linecolor=Blue,
    backgroundcolor=DeepSkyBlue!15,
}% Blue
\mdfdefinestyle{blackbox}{
    linecolor=DimGray,
    backgroundcolor=VioletRed!10!LightGray!20,
}% Black
\mdfdefinestyle{blackbox-alt}{
    roundcorner=0pt,
    linewidth=4pt,
    topline=false,
    bottomline=false,
    rightline=false,
    linecolor=DimGray,
    backgroundcolor=VioletRed!10!LightGray!20,
}% Black

% Define theorem-esque environments
% Keeping these unnumbered for now.
\newenvironment{note}{
    \begin{mdframed}[style=blackbox-alt]
        \textbf{Note --}%
}{
    \end{mdframed}
}
\newenvironment{remark}{
    \begin{mdframed}[style=blackbox-alt]
        \textbf{Remark --}%
}{
    \end{mdframed}
}
\newenvironment{fact}{
    \begin{mdframed}[style=blackbox-alt]
        \textbf{Fact:}%
}{
    \end{mdframed}
}
\newenvironment{claim*}{
    \begin{mdframed}[style=greenbox-alt]
        \textcolor{Green}{\textbf{Claim}} ---%
}{
    \end{mdframed}
}
\newenvironment{claim}{
    \begin{mdframed}[style=greenbox-alt,frametitle=\color{Green} Claim]
}{
    \end{mdframed}
}
\NewDocumentEnvironment{definition}{o}{
    \begin{mdframed}[style=blackbox,frametitle={\color{Black}\IfNoValueTF{#1}
            {Definition}
            {Definition (#1)}}]
}{
    \end{mdframed}
}
\NewDocumentEnvironment{theorem}{o}{
    \begin{mdframed}[style=orangebox,frametitle={\color{Black}\IfNoValueTF{#1}
            {Theorem}
            {Theorem (#1)}}]
}{
    \end{mdframed}
}
\NewDocumentEnvironment{proposition}{o}{
    \begin{mdframed}[style=orangebox,frametitle={\color{Black}\IfNoValueTF{#1}
            {Proposition}
            {Proposition (#1)}}]
}{
    \end{mdframed}
}
\NewDocumentEnvironment{lemma}{o}{
    \begin{mdframed}[style=bluebox,frametitle={\color{Blue}\IfNoValueTF{#1}
            {Lemma}
            {Lemma (#1)}}]
}{
    \end{mdframed}
}
\NewDocumentEnvironment{corollary}{o}{
    \begin{mdframed}[style=bluebox,frametitle={\color{Blue}\IfNoValueTF{#1}
            {Corollary}
            {Corollary (#1)}}]
}{
    \end{mdframed}
}
\NewDocumentEnvironment{conjecture}{o}{
    \begin{mdframed}[style=purplebox,frametitle={\color{Purple}\IfNoValueTF{#1}
            {Conjecture}
            {Conjecture (#1)}}]
}{
    \end{mdframed}
}
\newenvironment{exercise}[1][]{
    \begin{mdframed}[style=redbox,frametitle=\color{FireBrick} Exercise #1]
}{
    \end{mdframed}
}
\newenvironment{exercise*}[1][]{
    \begin{mdframed}[style=redbox,frametitle=\color{FireBrick} #1]
}{
    \end{mdframed}
}
\newenvironment{problem}[1][]{
    \begin{mdframed}[style=redbox,frametitle=\color{FireBrick} Problem #1]
}{
    \end{mdframed}
}

%
% Define custom LaTeX commands for certain operators
% I generally prefer using snippets but some notational 
% things are so clunky that I have shorter things to make
% the LaTeX more readable
%
\DeclareMathOperator{\im}{Im} % Imaginary part
\DeclareMathOperator{\re}{Re} % Real part
\DeclareMathOperator{\ord}{ord}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator*{\res}{Res} % Residue (complex analysis)
\DeclareMathOperator{\SL}{SL} % Special linear group
\newcommand{\legendre}[2]{\left(\frac{#1}{#2}\right)} % Legendre symbol
