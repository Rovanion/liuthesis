# LaTeX class for LiU Thesis

This is a modern class for writing PhD/Lic/Master/Bachelor and other theses at
Linköping University (LiU).

## Authors

Ola Leifler, ola.leifler@liu.se, 2011-2017

## Package options

The following options are recognized by the liuthesis document class

- `phd` - For doctoral dissertations 
- `lic` - For licentiate theses
- `msc` - For Masters' theses (default)
- `bachelor` - For Bachelors' theses
- `hu`     - For the medical sciences (experimental)
- `filfak` - For the Faculty of Arts and Sciences
- `lith`   - For LiTH (default)
- `exhibitpage` - Produce an exhibit page (spikblad) and no thesis. Use
	      this option to produce an exhibit page only for Licentiate/PhD
	      dissertations.
- `printerfriendly` - ensure chapters begin on recto pages
- `swedish` - use Swedish as the main language, English as the secondary language
- `english` - use English as the main language

... plus all the options recognized by the
[memoir](https://www.ctan.org/pkg/memoir) package, which liuthesis extends.

## Requirements

For correct typesetting of the front matter, _XeTeX must be used_ as a
typesettings engine on a platform where the proprietary fonts
KorolevLiU or Calibri/Carlito are available. Carlito is used as a
fallback option if Calibri is not installed. KorolevLiU is only used
for exhibit pages for the philosophical faculty.

## Packages included

The `liuthesis` package includes a number of packages for convenient,
contemporary TeX typesetting. While the standard `pdfTeX` engine can be used for
building, `XeTeX` is recommended in order to get the corrects fonts
(KorolevLiU/Calibri/Carlito) used in the LiU style manual. When `XeTeX`
is used, the polyglossia, mathspec, fontspec, xunicode and, xltxtra packages are
loaded. When `pdfTeX` is used, babel, palatino, and mathpazo packages are used
instead.

The [BibLaTeX](https://www.ctan.org/pkg/biblatex) package is used for
managing references. Currently, there is no way to specify the
load-time options to biblatex as document class options together with
other options, so the biblatex package _has to be loaded manually_ in
settings.tex (see Usage below).

## System Requirements
`liuthesis` uses one of the following two build environments:
* `XeLaTeX` (recommended)
* `pdfLaTeX`
* `biber` for setting and compiling the reference list.

`liuthesis` also uses many modern LaTeX packages, so a fairly modern
distribution of LaTeX is required. 

For correct font typesetting according to the LiU style manual, the proprietary
fonts  KorolevLiU or Calibri are required. Carlito may be used as a
fallback for Calibri on systems that do not have Calibri
installed. KorolevLiU is only used for exhibit pages (spikblad) on the
philosophical faculty.

## Usage

This package contains a style file for theses (`liuthesis.cls`) and a file
`settings.tex` which must at least include the lines

```
\usepackage{biblatex}
\addbibresource{<my bibliography file>}
```

and possibly other settings. In the directory figures/, you should
place all graphics for your thesis. Logos are included for LiU,
please add other logotypes as appropriate.

In your thesis file, you need to specify where the bibliography
should be typeset using the command `\printbibliography`.

All files must be typeset using UTF-8 in order for non-latin characters such as
åäö to work.

There are a number of demo thesis files (`demo*.tex`) that provide
examples of how the template works.

`Abstract.tex` is a mandatory file with your abstract,
`sammanfattning.tex` is included for dissertations that must include
popular science descriptions. Other files can
be included at will from your main thesis file.

For further usage instructions, please refer to `demo*.tex` that
provide minimal examples that should get you started.

## Makefile

If you are on a platform where you can use `make` for building your PDF,
we have a Makefile ready for you. Edit the name of the main file that
you wish to process (`TEXMAINFILE`) and run `make`. This will run
xelatex and biber as many times as needed to produce a PDF. To clean
all auxiliary files, run `make clean`. To typeset the demos, run `make
demos`, which will update the pdf files in the `demo` directory.

## Including articles

```
\includearticle{<citekey>}
```

With the `\includearticle` command, you can include pdf articles and
refer to them in your thesis. demothesis.tex provides an example of
this. `<citekey>` should be the same as the key in your bibliography
which describes your article, and the file name of the pdf file. You
can refer to your articles in your thesis using the reference key
`art:<citekey>`.

```
\includearticletex{<citekey>}
```

With the `\includearticletex` command, you can include TeX articles
and refer to them in your thesis. The files `demo*{lic,phd}.tex` provide examples
of this. `<citekey>` should be the same as the key in your bibliography
which describes your article, and the file name of the TeX manuscipt
in the papers/ directory. Please refer to the scigen.tex example for
hints how you format your manuscript for inclusion. You can refer to
your articles in your thesis using the reference key `art:<citekey>`.

There are a number of commands with one parameter which should be used
to specify thesis metadata, and they are all typeset using the command
names as they appear in the PDF. For instance, using the command
`\opponent{Your opponent}`, you can specify the opponent. If you do not,
the pdf will contain the verbatim text `\opponent` on all locations
where the argument supplied to that command will substitute
`\opponent`.

## File headers

To use and update the file headers appropriately, you will need Emacs
with the header2 package. Put this information in an Emacs init file:

```
(require 'package)
;; Marmalade
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; The original ELPA archive still has some useful
;; stuff.
 (add-to-list 'package-archives
              '("elpa" . "http://tromey.com/elpa/"))
(package-initialize)

(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)
(add-hook 'latex-mode-hook   'auto-make-header)
```

## Complete list of parameters

This is a complete list of parameters that can be modified as part of
the template. Some of them are set by specifying a document class
option, but all are available in the main manuscript and can be
overwritten if necessary. Here is a description of them.

All parameters are accessible through eponymous commands that render
the name of the command, so that it will be obvious (hopefully) which
commands to use for parameterizing the thesis.

Thus, `\createvariable{edition}` creates a command `\edition{}` which
accepts a single parameter and sets the global variable `\@edition`,
which is given the initial value `\texttt{\textbackslash edition}`.


```
%% The edition of the PhD thesis (at the philosophical faculty)
\createvariable{edition}

%% Parameters for the exhibit page (spikblad)
\createvariable{presentationroom}
\createvariable{presentationbuilding}
\createvariable{presentationcampus}
\createvariable{presentationdate}
\createvariable{presentationdateenglish}
\createvariable{presentationtime}

\createvariable{thesislanguage}
\createvariable{faculty}
\createvariable{issn}

\createvariable{degreeprefix}
\createvariable{degreesuffix}
\createvariable{exhibittext}
\createvariable{exhibittextswedish}
\createvariable{opponenttitle}
\createvariable{opponentname}
\createvariable{opponentuniversity}
\createvariable{opponentcountry}
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
\createvariable{keywordsswedish}
\createvariable{department}
\createvariable{departmentenglish}
\createvariable{departmentshort}
\createvariable{division}
\createvariable{divisionshort}
\createvariable{dateofpublication}
\createvariable{publicationseries}

%% Undergrad specific

% faculty abbreviation, for the publication number
\createvariable{area}

% First-cycle/Second-cycle
\createvariable{level}
\createvariable{thesistypenameswedish}
\createvariable{thesistypenameenglish}

% 15/16/30 credit thesis
\createvariable{thesiscredits}

\createvariable{thesissubject}
\createvariable{thesissubjectenglish}
```


