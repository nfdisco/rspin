%% Computer printout class.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{printout}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,10pt]{article}

\RequirePackage{geometry}
\geometry{hmargin=2cm,vmargin=2cm}

\RequirePackage{datetime}
\def\dateseparator{-}
\yyyymmdddate

\def\@title{}
\def\@date{\today\ \currenttime}
\newif\iftitle
\def\maketitle{%
  \titlefalse
  \ifx\@title\empty\else\titletrue\fi
  \ifx\@date\empty\else\titletrue\fi
  \iftitle
  {\bfseries
    \hfil\@title
    \ifx\@title\empty\else
      \ifx\@date\empty\else
        \quad
      \fi
    \fi
    \@date
    \hfil\par}%
  \vspace*{2\bigskipamount}%
  \fi
}
\let\author\undefined
\let\thanks\undefined
\let\and\undefined

\let\familydefault\ttdefault
\parindent=0pt%

\AtBeginDocument{\maketitle}

\endinput
