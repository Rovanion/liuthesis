%%% liuthesis.cls --- 
%% 
%% Filename: liuthesis.cls
%% Description: 
%% Author: Ola Leifler
%% Maintainer: 
%% Created: Fri Mar 20 08:25:23 2009 (CET)
%% Version: 
%% Last-Updated: Thu Dec 17 16:32:01 2015 (+0100)
%%           By: Ola Leifler
%%     Update #: 947
%% URL: 
%% Keywords: 
%% Compatibility: 
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%%% Commentary: 
%% 
%% Read the README instead...
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%%% Change log:
%% 
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%% This program is free software; you can redistribute it and/or
%% modify it under the terms of the GNU General Public License as
%% published by the Free Software Foundation; either version 3, or
%% (at your option) any later version.
%% 
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% General Public License for more details.
%% 
%% You should have received a copy of the GNU General Public License
%% along with this program; see the file COPYING.  If not, write to
%% the Free Software Foundation, Inc., 51 Franklin Street, Fifth
%% Floor, Boston, MA 02110-1301, USA.

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%%% Code:
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{liuthesis} [2010/10/19 PHD Thesis class for LiU]
\typeout{PHD Thesis class for LiU by Ola Leifler - v 1.02}
\def\createvariable#1{%
  \expandafter\def\csname #1\endcsname{\expandafter\gdef\csname @#1\endcsname}
  \csname #1\endcsname{\texttt{\textbackslash #1}}
}
\RequirePackage{xkeyval}
\RequirePackage{ifxetex}

\ifxetex
\else
\RequirePackage[utf8]{inputenc}
\fi

\createvariable{thesislanguage}
\createvariable{faculty}
\createvariable{issn}
\createvariable{degreeprefix}
\createvariable{exhibittext}
\createvariable{opponent}
\createvariable{thesisnumber}
\createvariable{currentyearthesisnumber}
\createvariable{supportedby}
\createvariable{publicationyear}
\createvariable{publicationmonth}
\createvariable{isbn}
\createvariable{supervisor}
\createvariable{examiner}
\createvariable{titleenglish}
\createvariable{titleswedish}
\createvariable{keywords}
\createvariable{department}
\createvariable{departmentenglish}
\createvariable{departmentshort}
\createvariable{division}
\createvariable{divisionshort}
\createvariable{dateofpublication}
\createvariable{publicationseries}
% Undergrad specific
\createvariable{area}
\createvariable{level}

\newif\ifdedication
\dedicationfalse
\def\dedication#1{\dedicationtrue\gdef\@dedication{#1}}
\createvariable{divanumber}
% Include the abstract
\gdef\@abstract{\input{abstract}}
\gdef\@acknowledgments{\input{acknowledgments.tex}}

\newif\iflith
\lithtrue

\newif\ifhu
\newif\iffilfak
\newif\ifphd
% \phdtrue
\newif\iflic
\licfalse
\newif\ifmsc
\msctrue

\DeclareOption{hu}{%
  \hutrue
  \lithfalse
  \filfakfalse
  \faculty{Faculty of Health Sciences}
  \gdef\@facultyshort{HU}
  \gdef\@facultyshortlogo{hu}
 \publicationseries{Linköping University Medical Dissertations}
  \degreeprefix{medicine}
}

\DeclareOption{lith}{%
  \lithtrue
  \hufalse
  \filfakfalse
  \faculty{Institute of Technology}
  \publicationseries{Linköping Studies in Science and Technology}
  \degreeprefix{teknologie}
  \gdef\@facultyshort{Tek}
  \gdef\@facultyshortlogo{lith}
  \gdef\@area{LITH}
}

\DeclareOption{filfak}{%
  \filfaktrue
  \lithfalse
  \hufalse
  \faculty{Philosophical faculty}
  \gdef\@facultyshort{FilFak}
  \gdef\@facultyshortlogo{filfak}
  \publicationseries{Linköping Studies in Arts and Science}
  \degreeprefix{filosofie}
%  \gdef\@area{FFK-UP}
}

\DeclareOption{msc}{%
  \msctrue
  \phdfalse
  \PassOptionsToClass{oneside}{memoir}
}

\DeclareOption{lic}{%
  \lictrue
  \phdfalse
}

\DeclareOption{phd}{%
  \licfalse
  \phdtrue
}

\DeclareOption{swedish}{%
 \thesislanguage{swedish}
  \gdef\@thepaper{Artikel}
}


\DeclareOption{english}{%
  \thesislanguage{english}
  \gdef\@thepaper{Paper}
}

\newif\ifexhibitpage
\exhibitpagefalse

\DeclareOption{exhibitpage}{%
  \exhibitpagetrue
}

% % % Add the necessary biblatex options to the class options 

% \DeclareOptionX{biblatexoptions}{%
%  \gdef\@biblatexoptions{#1}
% \PassOptionsToPackage{\@biblatexoptions}{biblatex}
% }

% \DeclareOptionX{memoiroptions}{%
% \PassOptionsToClass{#1}{memoir}
% }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}} 

\ExecuteOptions{english,phd,lith,a4paper}

\ProcessOptions*
\LoadClass{memoir}

\RequirePackage{color}
\RequirePackage[svgnames]{xcolor}
\RequirePackage{pdfpages}
\RequirePackage{tikz}
\RequirePackage{pbox}
\RequirePackage{ifthen}
\RequirePackage{geometry}
\RequirePackage[pdfusetitle]{hyperref}

% Set up input encoding and font handling
\ifxetex
\RequirePackage[MnSymbol]{mathspec}
\RequirePackage{xltxtra}
\defaultfontfeatures{Mapping=tex-text}
\else
\RequirePackage{graphicx}
\RequirePackage{palatino}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{mathabx}
\RequirePackage{mathpazo}
\RequirePackage[T1]{fontenc}
\fi

% Define the \emptybox command depending on the available symbols
% (from MnSymbol or mathabx, respectively)

\ifxetex
\newcommand{\emptybox}{\Box}
\else
\newcommand{\emptybox}{\boxvoid}
\fi


\ifphd
\gdef\@degreetype{\@degreeprefix {} doktorsexamen}
\else
\iflic
\gdef\@degreetype{\@degreeprefix {} licentiatexamen}
\fi
\fi

\iflith
\iflic
\issn{0280-7971}
\fi
\ifphd
\issn{0345-7524}
\fi
\fi

\ifhu
\ifphd
\issn{0345-0082}  
\fi
\iflic
\typeout{Please define the ISSN by issuing a \textbackslash issn command}
\issn{\textbackslash\texttt{issn}}
\fi
\fi

\iffilfak
\ifphd
\issn{0282-9800}
\fi
\iflic
\typeout{Please define the ISSN by issuing a \textbackslash issn command}
\issn{\textbackslash\texttt{issn}}
\fi
\fi

\newcommand{\swedishenglish}[2]{
\ifthenelse{\equal{\@thesislanguage}{swedish}}{#1}{#2}
}
\RequirePackage{csquotes}
\ifxetex
\swedishenglish{
  \RequirePackage[swedish,english]{polyglossia}
  \setmainlanguage{swedish}
  \setotherlanguages{english}
}{
  \RequirePackage{polyglossia}
  \setmainlanguage{english}
}
\else
\swedishenglish{
  \RequirePackage[swedish,english]{babel}
}{
  \RequirePackage[english]{babel}
}
\fi
%% Include articles
\RequirePackage{calc}
\RequirePackage{ragged2e}

\newlength{\marginboxlength} 
\setlength{\marginboxlength}{\paperwidth} 
\addtolength{\marginboxlength}{-\textwidth}
\addtolength{\marginboxlength}{-\spinemargin}
\addtolength{\marginboxlength}{-2mm}

\definecolor{nicered}{rgb}{.647,.129,.149} 
\newsavebox{\feline@article} 
\newcommand\feline@article@marker[1][4cm]{%
  \sbox\feline@article{% 
    \resizebox{!}{#1}{\fboxsep=1pt%
      \colorbox{nicered}{\color{white}\bfseries\thearticle\phantom{.}}%
    }}%
  \rotatebox{90}{% 
    \resizebox{%
      \heightof{\usebox{\feline@article}}+\depthof{\usebox{\feline@article}}}% 
    {!}{{\scshape \MakeUppercase\@thepaper}}}\quad%
  \raisebox{\depthof{\usebox{\feline@article}}}{\usebox{\feline@article}}%
} 
\newcommand\feline@chm[1][4cm]{%
  \sbox\feline@article{\feline@article@marker[#1]}% 
  \makebox[0pt][l]{% aka \rlap
    \makebox[\spinemargin][r]{
      \usebox\feline@article
    }
  }
}

\newcounter{article}
\setcounter{article}{0}
\renewcommand{\thearticle}{\Roman{article}}
\includepdfset{pages=-}
\RequirePackage[absolute]{textpos}
\setlength{\TPVertModule}{2cm}
\setlength{\TPHorizModule}{\paperwidth - 4.3cm}
\newcommand{\papermark}{\@thepaper{} \thearticle}

\newcommand{\includearticle}[2][pages=-]{%
  \@twosidetrue
  \refstepcounter{article}%
  \cleartorecto%
  \thispagestyle{empty}
  \mbox{}%
%  \addtolength{\TPVertModule}{4cm}
%  \begin{textblock}{1}(1,1)
%    \feline@chm[1cm]
%  \end{textblock}
  \vspace*{\fill}
   \begin{center}%
     {\hfill \feline@chm[2.5cm]\\[2\baselineskip]}
     {\fullcite{#2}}
  \end{center}%
  \vspace*{\fill}%
  \cleartorecto%
  \label{art:#2}%
  \addcontentsline{toc}{chapter}{\papermark}%
  \includepdf[#1]{#2}%
}
\newenvironment{papers}{
  % \makepagestyle{papersstyle}
  \makeevenhead{ruled}{\papermark}{}{}
  % \makeevenfoot{papersstyle}{\thepage}{}{}
  % \makeoddhead{papersstyle}{}{}{\rightmark}
  % \makeoddfoot{papersstyle}{}{}{\thepage}
  % \pagestyle{papersstyle}
  \renewcommand*{\thechapter}{\thearticle}
  \newlength{\numberheight} 
 \makechapterstyle{paperstyle}{%
    \setlength{\afterchapskip}{40pt} 
    \setlength{\numberheight}{10mm} 
  \renewcommand*{\chapterheadstart}{\vspace*{40pt}} 
    \renewcommand*{\afterchapternum}{\par\nobreak\vskip 25pt} 
    \renewcommand*{\chapnamefont}{\normalfont\LARGE\flushright} 
    \renewcommand*{\chapnumfont}{\normalfont\HUGE} 
    \renewcommand*{\chaptitlefont}{\normalfont\Huge\bfseries\flushright} 
    \renewcommand*{\printchaptername}{%
      %\chapnamefont\MakeUppercase{\@thepaper}
    } 
    \renewcommand*{\chapternamenum}{} 
    
    \renewcommand*{\printchapternum}{%
      % \makebox[0.5\marginboxlength][l]{\hspace{.8em}% 
      % \resizebox{!}{\numberheight}{\chapnumfont \thearticle}% 
      % \hspace{.8em}% 
      % \rule{\marginboxlength}{\numberheight}%
      % }
    }% 
    \makeoddfoot{plain}{}{}{\thepage}}
    \renewcommand{\@chapapp}{\papermark}
    \chapterstyle{paperstyle}
  % \setcounter{chapter}{0}
}{}
\newcommand{\includearticletex}[1]{%
%  \@twosidetrue
 \stepcounter{article}%
  \cleartorecto%
  \thispagestyle{empty}
  \mbox{}%
%  \addtolength{\TPVertModule}{4cm}
%  \begin{textblock}{1}(1,1)
%    \feline@chm[1cm]
%  \end{textblock}
  \vspace*{\fill}
   \begin{center}%
     {\hfill \feline@chm[2.5cm]\\[2\baselineskip]}
     {\fullcite{#1}}
  \end{center}%
  \vspace*{\fill}%
  %\renewcommand*{\papermark}{}
  \clearpage{}
  %\renewcommand*{\papermark}{\@thepaper{} \thearticle}
  %\addcontentsline{toc}{chapter}{\papermark}%
  \chapter[\papermark][\papermark]{\citetitle{#1}}
  \label{art:#1}
  % \cleartorecto%
  % \thispagestyle{empty}
  % \vspace{3\baselineskip}
  % {\centering\Huge\textbf{\textsf{\papermark\\ \citetitle{#1}}}}
  % \vspace{3\baselineskip}
  %\setcounter{section}{0}
  %\renewcommand*{\thesection}{\arabic{section}}
 \input{papers/#1}%
}

\ifx\pdfoutput\undefined
\else
\pdfoutput=1
\DeclareGraphicsExtensions{.pdf,.jpg,.png}
\fi

\graphicspath{{figures/}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                    %
%                     The exhibit page                               %
%                                                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\exhibitpage}{%
  {\ifxetex\fontspec{Times}\fi
    \copypagestyle{exhibitpagestyle}{plain}
    \makeevenfoot{exhibitpagestyle}{\ifxetex\fontspec{Times}\fi ISBN \@isbn}{}{\ifxetex\fontspec{Times}\fi ISSN \@issn}
    \makeoddfoot{exhibitpagestyle}{\ifxetex\fontspec{Times}\fi ISBN \@isbn}{}{\ifxetex\fontspec{Times}\fi ISSN \@issn}
    \thispagestyle{exhibitpagestyle}
  \begin{center}
   {\footnotesize \@publicationseries}\\
    {\footnotesize Dissertation No. \@thesisnumber}\\[15mm]
    {\Large\bfseries\swedishenglish{\@titleswedish}{\@titleenglish}}\\[5mm]
    by\\[5mm]
    {\Large\bfseries\@author}
    \vfill
    %% \\[6mm]{\today}\\[105mm]
    {\small
    \textbf{Akademisk avhandling}\\
     \@ifundefined{@exhibittext}{\@abstract}{\@exhibittext}\\[6mm]
    \textbf{Fakultetsopponent}\\
    \@opponent
    \\[15mm]
    \swedishenglish{\gdef\@langlogo{sv}}{\gdef\@langlogo{en}}
    \includegraphics[width=35mm]{\@facultyshortlogo _\@langlogo _vert_blk}
    
    \vfill
    \@ifundefined{@supportedby}{}{\emph{\@supportedby}\\[3mm]}
 {\footnotesize URL
   \texttt{http://urn.kb.se/resolve?urn=urn:nbn:se:liu:diva-\@divanumber/}\\[3mm] 
   Linköping University\\
  %\@faculty\\
  \@department\\
  \@division\\
    SE--581\,85 Linköping\\[5mm]
    Linköping \@publicationyear}}\\
    \vspace*{1mm}
  \end{center}
  \clearpage{}
  \clearpage{}
  {\ifxetex\fontspec{Times}\fi
    \begin{abstract}
      {\footnotesize \@abstract}
    \end{abstract}
 }
}
}

\newcommand{\gettitle}{\swedishenglish{\@titleswedish}{\@titleenglish}}

\iflic
\newcommand{\isrn}{LIU-\@facultyshort{}-Lic-{}-\@publicationyear:\@currentyearthesisnumber}
\fi
\ifmsc
\newcommand{\isrn}{LIU-\@departmentshort{}/\@area{}-EX-\@level{}-{}-\@publicationyear/\@currentyearthesisnumber-{}-SE}
\fi


\ifmsc
\renewcommand{\maketitle}{
   \copypagestyle{titlestyle}{plain}
   \makeevenfoot{titlestyle}{\ifxetex\fontspec{Times}\fi Linköpings
     universitet\\
   SE-581 83 Linköping, Sweden
   }{}{\ifxetex\fontspec{Times}\fi Linköpings universitet\\
   581 83 Linköping}
   \makeoddfoot{titlestyle}{\ifxetex\fontspec{Times}\fi Linköpings
     universitet\\
   SE-581 83 Linköping, Sweden
   }{}{\ifxetex\fontspec{Times}\fi Linköpings universitet\\
   581 83 Linköping}
   \thispagestyle{titlestyle}
    {\centering
      \ifxetex\fontspec{Times}\fi
      \fontsize{27pt}{27pt}\selectfont
      \@department\\
      \fontsize{18pt}{18pt}\selectfont
      \@departmentenglish\\[2\baselineskip]
      Examensarbete
      \\[\baselineskip]
      \fontsize{24pt}{24pt}\selectfont{\bfseries\swedishenglish{\@titleswedish}{\@titleenglish}}
      \\[\baselineskip]
      \fontsize{12pt}{12pt}\selectfont\swedishenglish{av}{by}
      \\[1.5\baselineskip]
      \fontsize{24pt}{24pt}\selectfont{\bfseries\@author}
      \vfill
      \fontsize{18pt}{18pt}\selectfont\isrn
      \vfill
      \@dateofpublication
      \vfill
      \centering{\includegraphics[width=1.1\textwidth]{titelsid-sv}}
      \\[.5\baselineskip]
    }
}
\else
\renewcommand{\maketitle}{
  {\center
    {\footnotesize\centerline\@publicationseries{}%\\
      Dissertation No. \@thesisnumber}\\[25mm] 
     {\LARGE\bfseries\gettitle}\\[20mm]
% \swedishenglish{av}{by}
     {\Large\bfseries\@author}\\
     \vfill
% \\[6mm]{\today}\\[105mm]
    \swedishenglish{\gdef\@langlogo{sv}}{\gdef\@langlogo{en}}
    \includegraphics[width=35mm]{\@facultyshortlogo _\@langlogo _vert_blk}
   \\[12mm]
     {\footnotesize
     \swedishenglish{%
     \iflic
     Framlagd vid \@faculty{} vid Linköpings universitet%\\
     som del av fordringarna för \@degreetype%\\[6mm]
     \fi
     \@department%\\
     Linköping universitet%\\
     581\,85 Linköping%
     }{%
       \iflic
       Submitted to \@faculty{} at Linköping University in partial\\
       fulfilment of the requirements for the degree of \@degreetype\\[6mm]
       \fi
       Linköping University\\
       \@department\\
       \@division\\
       SE-581\,85 Linköping, Sweden\\
     }
    \vspace*{5mm}
     Linköping \@publicationyear\\
   }
   }
}
\fi

% \newcommand{\abstractpage}{%
% %  \enlargethispage{8mm}
%   \vspace*{6mm}
%   \begin{center}
%     \Large\textbf{\swedishenglish{\@titleswedish}{\@titleenglish}}
%   \end{center}
%   { \setlength{\parindent}{0mm}
%     \footnotesize
%     \centerline{\swedishenglish{av}{by}}
%     \vspace{3mm}
%     \centerline{\@author}
%     \vspace{5mm}
%     \centerline{\@publicationmonth{} \@publicationyear}
%     \centerline{ISBN \@isbn}

%     \centerline{\@publicationseries}
%     \centerline{Thesis No. \@thesisnumber}
%     \centerline{ISSN \@issn}
%    % \centerline{LiU--Tek--Lic--\@publicationyear:\@currentyearthesisnumber}
%     \vspace{5mm}
%     \setlength\parskip{8pt}\centerline{\swedishenglish{SAMMANFATTNING}{ABSTRACT}}
%     \vspace{3mm}
%     \footnotesize{\@abstract}
    
%   %  \textit{\swedishenglish{Studien har finansierats av}{This work has been supported by} \@supportedby.}
%  %   \vfill
%  %   \centerline{\@department}
%  %   \centerline{Faculty of Health Sciences, Link\"opings universitet}
%  %   \centerline{\swedishenglish{581\,83 Link\"oping}{SE-581\,85 Link\"oping, Sweden}}
%   }
% }

\newcommand{\makepermissionpage}{
  \mbox{}
  \vfill
  \begin{flushleft}
    \copyright{} \@author, \@publicationyear\\
    ISBN \@isbn\\
    ISSN \@issn\\
    {\footnotesize URL \texttt{http://urn.kb.se/resolve?urn=urn:nbn:se:liu:diva-\@divanumber/}}\\[1cm]
    Published articles have been reprinted with permission from the
    respective
    copyright holder.\\
%    Paper III \copyright{} XXX\\
    Typeset using \ifxetex\XeTeX\else\LaTeX\fi\\[1cm]
    Printed by LiU-Tryck, Linköping \@publicationyear
  \end{flushleft}
  \clearpage}

% Intro page for MSC theses
\ifmsc
\newcommand{\makeinsidepage}{
  \thispagestyle{empty}
  {\ifxetex\fontspec{Times}\fi\selectfont
  \setlength{\unitlength}{1mm}
  \begin{picture}(170,20)(20,-20)
    \put(0,5){Linköpings universitet}
    \put(0,0){\@department}
  \end{picture}
  {\centering\fontsize{18pt}{18pt}\selectfont
 
Examensarbete
\vfill
\fontsize{24pt}{24pt}\selectfont{\bfseries\swedishenglish{\@titleswedish}{\@titleenglish}}
\\[\baselineskip]
\fontsize{12pt}{12pt}\selectfont\swedishenglish{av}{by}
\\[1.5\baselineskip]
\fontsize{24pt}{24pt}\selectfont{\bfseries\@author}
\vfill
\fontsize{18pt}{18pt}\selectfont\isrn
\vfill
\hfill\@dateofpublication\hfill
}
\vfill
{\setlength{\parindent}{0pt}Handledare: \@supervisor\hfill\\
Examinator: \@examiner}
\vfill
}
}
\fi

\newcommand{\makededicationpage}{
\mbox{}
\vfill
\begin{center}
\@dedication\\
\end{center}
\vfill
}

%%%%%%%%%%%%%%%%%
%
% Page size and layout
%
%%%%%%%%%%%%%%%%%
\clubpenalty=10000 
\widowpenalty=10000 
\raggedbottom 
\midsloppy

\newlength{\mylen}	% a length 
\newcommand{\alphabet}{abcdefghijklmnopqrstuvwxyzåäö} % the lowercase
                                % alphabet 
\begingroup	
% keep font change local 
% font specification e.g.,
% \Large\sffamily 
\settowidth{\mylen}{\alphabet} 
% The length of this alphabet is
% \the\mylen. 
\typeout{The length of the alphabet is \the\mylen}	
% put in log file 
% end the grouping
\endgroup

% Tryckmaterialets storlek
\setstocksize{297mm}{210mm}
\settrimmedsize{290mm}{205mm}{*}
\settypeblocksize{*}{34pc}{1.618} % golden ratio

\newcommand{\resetlayout}{
  \setlength{\trimtop}{\stockheight} % \trimtop = \stockheight  - \paperheight
  \addtolength{\trimtop}{-\paperheight} %
  \setlength{\trimedge}{\stockwidth} % \trimedge = \stockwidth - \paperwidth
  \addtolength{\trimedge}{-\paperwidth} %
  % Beskär endast höger- och nederkanten på respektive papper
  % \settrims{0pt}{0pt}
  % Beskär runt om: Centrera tryckytan på pappret
  \settrims{0.5\trimtop}{0.5\trimedge}
  % Inner margin 2cm
\ifmsc
  \setlrmargins{*}{*}{1}
\else
  \setlrmargins{*}{55pt}{*}
\fi
  % Övre marginal 2cm, den undre automatiskt beräknad
  \setulmargins{*}{*}{1.618}
  % Avståndet till sidhuvud och sidfot
  \setheadfoot{\baselineskip}{1.5\baselineskip}
  \setheaderspaces{*}{*}{1.618}
}
\resetlayout
%
% Common layout settings



% Variables and page layout
\linespread{1.05} 

\typeout{******** LiU thesis layout ********}
\typeoutlayout
\typeout{******** Standard memoir layout ********}
\typeoutstandardlayout

%% Load user settings from the file settings.tex

\AtBeginDocument{%
  % \newcommand{\makeintropages}{%
 \checkandfixthelayout
  \pagestyle{empty}
  \ifexhibitpage
  \exhibitpage%
\end{document}%
\endinput%
\fi
  \pagenumbering{roman}
\begin{adjustwidth}{-1cm}{-1cm}
 \maketitle
  \newpage
\end{adjustwidth}

  \ifmsc
  \makeinsidepage
  \else
  \pagestyle{plain}
  \makepermissionpage
  \fi
  \ifdedication
  \makededicationpage
  \fi
  \cleartorecto%
 \addcontentsline{toc}{chapter}{Abstract}
 \begin{abstract}
   \@abstract
 \end{abstract}
  \newpage
  \chapter*{Acknowledgments}
  \addcontentsline{toc}{chapter}{Acknowledgments}
  \@acknowledgments
  \clearpage
  \tableofcontents
  \clearpage{}
  \listoffigures
  \clearpage{}
  \listoftables
  \cleartorecto%
  \pagenumbering{arabic}
  \pagestyle{ruled}
}

\def\librarypage{
%%% Biblioteksblad som används för licentiatavhandlingar
%%% -------------------------
  \enlargethispage{30mm}
  \thispagestyle{empty}
  \scriptsize
  \setlength{\unitlength}{1mm}
  \begin{picture}(126,212)(6,-5)
    \fontsize{7}{8pt}\selectfont
%% Universitetslogon:
    \put(1,191){\includegraphics[width=20mm]{LinkUniv_staende_sv}}
%% Rutor:
    \put(0,190){\framebox(92,22)}  % dept, division etc
    \put(93,190){\framebox(33,22)} % date
    \put(0,157){\framebox(32,32)}  % language
    \put(33,157){\framebox(33,32)} % report category
    \put(67,143){\framebox(59,46)} % isbn etc
    \put(0,143){\framebox(66,13)}  % url
    \put(0,108){\framebox(126,34)} % title
    \put(0,12){\framebox(126,95)}   % abstract
    \put(0,0){\framebox(126,11)}    % keywords
%% Rubriker:
    \put(27,209){{\bfseries Avdelning, Institution}}
    \put(27,206){Division, Department}
    \put(94,209){{\bfseries Datum}}
    \put(94,206){Date}
    \put(1,186){{\bfseries Språk}}
    \put(1,182){Language}
    \put(1,178){$\emptybox$ Svenska/Swedish}
    \put(1,174){$\emptybox$ Engelska/English}
    \put(1,162){$\emptybox$}
    \put(5,162){\line(1,0){20}}

    \put(34,186){{\bfseries Rapporttyp}}
    \put(34,183){Report category}
    \put(34,178){$\emptybox$ Licentiatavhandling}
    \put(34,174){$\emptybox$ Examensarbete}
    \put(34,170){$\emptybox$ C-uppsats}
    \put(34,166){$\emptybox$ D-uppsats}
    \put(34,162){$\emptybox$ Övrig rapport}
    \put(34,158){$\emptybox$}
    \put(37,158){\line(1,0){20}}
    \put(1,153){{\bfseries URL för elektronisk version}}
    \put(68,186){{\bfseries ISBN}}
    \put(68,181){\line(1,0){57}}
    \put(68,178){{\bfseries ISRN}}
    \put(68,171){\line(1,0){57}}
    \put(68,168){{\bfseries Serietitel och serienummer}}
    \put(68,165){Title of series, numbering}
    \put(107,168){{\bfseries ISSN}}
    \put(107,163){\line(1,0){18}}
    \put(69,155){\@publicationseries}
    \put(69,150){Thesis No. \@thesisnumber}
    \put(1,138){{\bfseries Titel}}
    \put(1,135){Title}
    \put(1,122){{\bfseries Författare}}
    \put(1,119){Author}
    \put(1,104){{\bfseries Sammanfattning}}
    \put(1,101){Abstract}
    \put(1,8){{\bfseries Nyckelord}}
    \put(1,5){Keywords}
%%% Här fylls aktuella uppgifter i
%%% -------------------------------
    \fontsize{9}{10pt}\selectfont
%%% Sammanfattning:
    \put(7,96){\pbox[t]{110mm}{\setlength{\parindent}{3mm}
        \@abstract}}
    \put(27,201){\@divisionshort,}
    \put(27,198){\@department}
    \put(27,194){581 83 Linköping}
%%% Datum:
    \put(95,197){
      \@dateofpublication
      }
%%% ISBN:
    \put(70,183){\@isbn}
%%% ISRN:
    \put(70,173){\isrn}
%%% ISSN:
    \put(108,164){\@issn}
%%% URL:

    \put(1,148){\pbox{58mm}{\footnotesize{\texttt{http://urn.kb.se/resolve?
            urn=urn:nbn:se:liu:diva-\@divanumber/}}}}
%%% Datum:
    \put(131,261){
      \@dateofpublication
      }
%%% Svensk och engelsk titel:
   %% \put(7,130){\pbox[t]{100mm}{\@titlebibpage}}
      \put(7,130){\pbox[t]{100mm}{\swedishenglish{\@titleswedish}{\@titleenglish}}}
%%% Författare:
    \put(7,114){\@author}
%%% Enbart för lic
    \iflic{\put(34,178){\scriptsize $\times$}}\fi
    \ifmsc{\put(34,174){\scriptsize $\times$}}\fi

%%% Språk
    \swedishenglish{\put(0.98,178.25){\scriptsize $\times$}}{\put(1,174){\scriptsize $\times$}}
%%% Nyckelord:
    \put(17,5){\pbox{100mm}{\@keywords}}
  \end{picture}
  \pagestyle{plain}
}

\ifmsc
\AtEndDocument{\cleartorecto%
\thispagestyle{empty}
\includepdf[pagecommand={\begin{tikzpicture}[remember picture,overlay]
    \begin{scope}[shift={(current page.south west)},every node/.style={anchor=base west}]
        % Grid to help find the positions (remove in final version)
        %
        \node at (32mm,34mm) {\ifxetex\fontspec{Times}\fi\fontsize{12pt}{12pt}\selectfont\@author};
    \end{scope}
\end{tikzpicture}}]{copyright_exjobbsrapport}
%  \includepdf{rygg-sv}
}
\fi

\iflic
\AtEndDocument{\cleartorecto%
  \librarypage\cleartorecto%
}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% liuthesis.cls ends here
