%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% UCB CBBA
% DEPARTAMENTO DE CIENCIAS EXACTAS Y INGENIERIA
% PLANTILLA PARA DOCUMENTOS ACADEMICOS
% Juan P. Sandoval
%-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{ucbcba}[2012/06/18 v1.2 Clase LaTeX para estandarizacion de Documentos UCB - CBBA]


\newif\if@swapnum
\newif\if@contnum
\@swapnumfalse
\@contnumtrue


\DeclareOption{leftnum}{\@swapnumtrue}
\DeclareOption{rightnum}{\@swapnumfalse}
\DeclareOption{contnum}{\@contnumtrue}
\DeclareOption{nocontnum}{\@contnumfalse}
\DeclareOption{uprightd}{\AtEndOfPackage{\DeclareMathSymbol{d}{\mathalpha}{operators}{`d}}}
\DeclareOption{uprighte}{\AtEndOfPackage{\DeclareMathSymbol{e}{\mathalpha}{operators}{`e}}}
\DeclareOption{uprighti}{\AtEndOfPackage{\DeclareMathSymbol{i}{\mathalpha}{operators}{`i}}}
\DeclareOption{upright}{\ExecuteOptions{uprightd,uprighte,uprighti}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[12pt,oneside]{book}


\RequirePackage[top=3cm, left=3.5cm, bottom=3cm, right=3cm, paper=letterpaper]{geometry} %%Margenes
\RequirePackage{amsmath, amssymb, amsthm, graphicx} %%Varios
\RequirePackage[english]{babel} %%Lenguaje
\RequirePackage[pdfpagelabels]{hyperref} %%Links y numeracion del PDF
\RequirePackage{mathptmx}


\addto\captionsspanish{\renewcommand\tablename{Tabla}}
\addto\captionsspanish{\renewcommand\listtablename{Indice de Tablas}}


\RequirePackage{parskip}
\setlength{\parskip}{1em}
\setlength{\parindent}{0cm}


\let\oldenum\enumerate
\let\oldendenum\endenumerate
\renewenvironment{enumerate}{\oldenum\setlength{\parskip}{\smallskipamount}}{\oldendenum}
\let\olditem\itemize
\let\oldenditem\enditemize
\renewenvironment{itemize}{\olditem\setlength{\parskip}{\smallskipamount}}{\oldenditem}


\newenvironment{dedicatoria}{\clearpage\null\vspace{\stretch{1}}\begin{flushright}\itshape}{\end{flushright}\vspace{\stretch{2}}\null}
\let\thanks\undefined
\newenvironment{agradecimientos}{\chapter*{Agradecimientos}}{\vfill\null}
\newenvironment{intro}{\addcontentsline{toc}{chapter}{\protect\numberline{}INTRODUCCI\'ON}\chapter*{INTRODUCCI\'ON}}{\vfill\null}
\newenvironment{conclusions}{\addcontentsline{toc}{chapter}{\protect\numberline{}CONCLUSIONES}\chapter*{CONCLUSIONES}}{\vfill\null}


\renewenvironment{proof}[1][\proofname] {\par\pushQED{\qed}\normalfont\topsep6\p@\@plus6\p@\relax\trivlist\item[\hskip\labelsep\scshape\footnotesize#1\@addpunct{.}]\ignorespaces}{\popQED\endtrivlist\@endpefalse}

\newtheoremstyle{miestilo}{\baselineskip}{3pt}{\itshape}{}{\bfseries}{}{.5em}{}
\newtheoremstyle{miobs}{\baselineskip}{3pt}{}{}{\bfseries}{}{.5em}{}
\if@swapnum
	\swapnumbers
\fi
\theoremstyle{miestilo}
\newtheorem{defn}{Definition}[chapter]
\if@contnum
\newtheorem{teo}[defn]{Theorem}
\newtheorem{cor}[defn]{Corollary}
\newtheorem{lema}[defn]{Lemma}
\newtheorem{prop}[defn]{Proposition}
\else
\newtheorem{teo}{Theorem}[chapter]
\newtheorem{cor}{Corollary}[chapter]
\newtheorem{lema}{Lemma}[chapter]
\newtheorem{prop}{Proposition}[chapter]
\fi
\theoremstyle{miobs}
\newtheorem*{ej}{Example}
\newtheorem*{obs}{Observation}


    
%% labeles
\global\let\@carrera\@empty
\newcommand{\setcarrera}[1]{\def\@carrera{#1}}
\let\carrera\setcarrera
\let\setcarrera\relax

\global\let\@tipo\@empty
\newcommand{\settipo}[1]{\def\@tipo{#1}}
\let\tipo\settipo
\let\settipo\relax

\global\let\@depto\@empty
\newcommand{\setdepto}[1]{\def\@depto{#1}}
\let\depto\setdepto
\let\setdepto\relax





%%Portada
\renewcommand{\maketitle}{
	\pagenumbering{roman}
	\begin{titlepage}
		
		\begin{minipage}[c]{\textwidth}
			\centering{\fontsize{15}{15}\selectfont \bfseries{UNIVERSIDAD CAT\'OLICA BOLIVIANA  ``SAN PABLO''}} \\
			\centering{\fontsize{14}{14}\selectfont \bfseries{UNIDAD ACAD\'EMICA REGIONAL COCHABAMBA}} \\
			\centering{\fontsize{13}{13}\selectfont \bfseries{\@depto}} \\
			\centering{\fontsize{13}{13}\selectfont \bfseries{Carrera de \@carrera}}
		\end{minipage}
		\vspace{2cm}
		\begin{figure}[h]
			\includegraphics[width=4.5cm]{imagenes/UCB-Escudo.pdf}
			\centering
		\end{figure}
		%\begin{minipage}{5cm}
		%	\includegraphics[width=4.5cm]{imagenes/UCB-Escudo.pdf}
%		\end{minipage}
		
		\vspace{2cm}
		\centering \@title

		\vspace{1cm}
		\raggedleft \textit{Perfil de \@tipo  de Licenciatura en \@carrera}
		\\
		\vspace{2cm}
			\centering{\fontsize{14}{14}\selectfont \bfseries{\@author}}
		\vfill
			Cochabamba - Bolivia\\ \@date
       \setcounter{footnote}{0}

	\end{titlepage}
}

%%Estilo del frontmatter
\newcommand{\ps@front}{
	\renewcommand{\thepage}{\roman{page}}
	\renewcommand{\@oddhead}{}
	\renewcommand{\@evenhead}{}
	\renewcommand{\@oddfoot}{\hfill\thepage\hfill}
	\renewcommand{\@evenfoot}{\hfill\thepage\hfill}
}

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
	\pagestyle{front}
	\oldfrontmatter
}
\let\oldfrontmatter\relax

%% Miscelaneos
\newcommand{\A}{\mathcal{A}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\D}{\mathbb{D}}
\newcommand{\E}{\mathbb{E}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\G}{\mathcal{G}}
\renewcommand{\H}{\mathcal{H}}
\newcommand{\K}{\mathcal{K}}
\renewcommand{\L}{\mathcal{L}}
\newcommand{\M}{\mathcal{M}}
\newcommand{\N}{\mathbb{N}}
\renewcommand{\M}{\mathcal{M}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\renewcommand{\S}{\mathcal{S}}
\newcommand{\T}{\mathcal{T}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\1}{\mathbf{1}}
\let\epsilon\varepsilon

\newenvironment{abstract}
{
  \newpage
  \thispagestyle{plain}
  \chapter*{Abstract}
  \addcontentsline{toc}{section}{Abstract}
}
{}

\newenvironment{resumen}
{
  \newpage
  \thispagestyle{plain}
  \chapter*{Resumen}
  \addcontentsline{toc}{section}{Resumen}
}
{}


\newenvironment{startarabicpagination}
{
	\setcounter{page}{1}
	\pagenumbering{arabic}
}
{}
