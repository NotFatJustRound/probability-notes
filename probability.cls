\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{probability}[2026/11/09 Probability theory lecture notes class]

% 中文默认，加 english 选项切成英文版
\newif\ifprob@chinese
\prob@chinesetrue
\DeclareOption{chinese}{\prob@chinesetrue}
\DeclareOption{english}{\prob@chinesefalse}
\ProcessOptions\relax

\ifprob@chinese
  \LoadClass[fontset=fandol,a4paper,11pt]{ctexart}
\else
  \LoadClass[a4paper,11pt]{article}
\fi

\RequirePackage{geometry}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[dvipsnames,svgnames]{xcolor}
\RequirePackage[strict]{changepage}
\RequirePackage{framed}
\RequirePackage{etoolbox}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{hyperref}

\geometry{a4paper,centering,scale=0.8}
\setlist{itemsep=2pt,topsep=3pt,parsep=0pt}

% ---------------- 配色 ----------------
\definecolor{defshade}{rgb}{1.0, 0.95, 0.85}
\definecolor{defborder}{rgb}{0.9, 0.5, 0.1}
\definecolor{thmshade}{rgb}{0.93, 0.88, 0.98}
\definecolor{thmborder}{rgb}{0.55, 0.25, 0.75}
\definecolor{propshade}{rgb}{0.85, 0.95, 1.0}
\definecolor{propborder}{rgb}{0.1, 0.5, 0.9}
\definecolor{exmpshade}{rgb}{0.9, 1.0, 0.9}
\definecolor{exmpborder}{rgb}{0.2, 0.7, 0.2}
\definecolor{sepline}{rgb}{0.6, 0.2, 0.8}

\hypersetup{
  colorlinks=true,
  linkcolor=sepline,
  urlcolor=blue,
  citecolor=green,
  bookmarksnumbered=true
}

% ---------------- 环境名 ----------------
\ifprob@chinese
  \newcommand{\probdefinitionname}{定义}
  \newcommand{\probtheoremname}{定理}
  \newcommand{\probpropositionname}{命题}
  \newcommand{\probexamplename}{例题}
  \newcommand{\probcontentsname}{目录}
  \newcommand{\probcolon}{：}
\else
  \newcommand{\probdefinitionname}{Definition}
  \newcommand{\probtheoremname}{Theorem}
  \newcommand{\probpropositionname}{Proposition}
  \newcommand{\probexamplename}{Example}
  \newcommand{\probcontentsname}{Contents}
  \newcommand{\probcolon}{:}
\fi
\renewcommand{\contentsname}{\probcontentsname}

% ---------------- 通用框 ----------------
\newcommand{\prob@framestyle}[2]{%
  \def\FrameCommand{%
    \hspace{1pt}%
    {\color{#2}\vrule width 2pt}%
    {\color{#1}\vrule width 4pt}%
    \colorbox{#1}}%
  \MakeFramed{\advance\hsize-\width\FrameRestore}%
  \noindent\hspace{-4.55pt}%
  \begin{adjustwidth}{}{7pt}%
  \vspace{2pt}%
}

\newcounter{defncount}[subsection]
\newcounter{thmcount}[subsection]
\newcounter{propcount}[subsection]
\newcounter{exmpcount}[subsection]

\renewcommand{\thedefncount}{\thesection.\arabic{subsection}.\arabic{defncount}}
\renewcommand{\thethmcount}{\thesection.\arabic{subsection}.\arabic{thmcount}}
\renewcommand{\thepropcount}{\thesection.\arabic{subsection}.\arabic{propcount}}
\renewcommand{\theexmpcount}{\thesection.\arabic{subsection}.\arabic{exmpcount}}

\newenvironment{definition}[1][]{%
  \stepcounter{defncount}%
  \prob@framestyle{defshade}{defborder}%
  \textbf{\probdefinitionname\ \thedefncount\probcolon\ \ifstrempty{#1}{}{#1}}%
  \vspace{4pt}%
  \color{sepline}\hrule height 0.5pt width \linewidth
  \vspace{6pt}%
}{%
  \vspace{2pt}%
  \end{adjustwidth}\endMakeFramed
}

\newenvironment{theorem}[1][]{%
  \stepcounter{thmcount}%
  \prob@framestyle{thmshade}{thmborder}%
  \textbf{\probtheoremname\ \thethmcount\probcolon\ \ifstrempty{#1}{}{#1}}%
  \vspace{4pt}%
  \color{sepline}\hrule height 0.5pt width \linewidth
  \vspace{6pt}%
}{%
  \vspace{2pt}%
  \end{adjustwidth}\endMakeFramed
}

\newenvironment{proposition}[1][]{%
  \stepcounter{propcount}%
  \prob@framestyle{propshade}{propborder}%
  \textbf{\probpropositionname\ \thepropcount\probcolon\ \ifstrempty{#1}{}{#1}}%
  \vspace{4pt}%
  \color{sepline}\hrule height 0.5pt width \linewidth
  \vspace{6pt}%
}{%
  \vspace{2pt}%
  \end{adjustwidth}\endMakeFramed
}

\newenvironment{example}[1][]{%
  \stepcounter{exmpcount}%
  \prob@framestyle{exmpshade}{exmpborder}%
  \textbf{\probexamplename\ \theexmpcount\probcolon\ \ifstrempty{#1}{}{#1}}%
  \vspace{4pt}%
  \color{sepline}\hrule height 0.5pt width \linewidth
  \vspace{6pt}%
}{%
  \vspace{2pt}%
  \end{adjustwidth}\endMakeFramed
}

\endinput
