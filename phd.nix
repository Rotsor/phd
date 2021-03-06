let pkgs = import <nixpkgs> {}; in
{
 phd = pkgs.stdenv.mkDerivation {
  name = "phd";
  src = ./src;
  breaker_hs = ./breaker.hs;
  buildInputs = with pkgs; [sed inkscape texLiveFull ghostscript (haskellPackages.ghcWithPackages (self : with self; [lhs2tex shake split]))];
  phases = [ "unpackPhase" "buildPhase" ];
  buildPhase = ''
	set -e
	set -v
#	runhaskell ${./inkscaper.hs}
	export BuildDir=`pwd`

#	echo "\begin{verbatim}" >> listing.tex
#	cat PG/*.agda >> listing.tex
#	echo "\end{verbatim}" >> listing.tex

	(cd PG; sed 's_-__g' -i *.agda)
	cat listingPrefix >> listing.tex
	cat PG/*.agda >> listing.tex
	cat listingSuffix >> listing.tex

	lhs2TeX --agda listing.tex > listing-processed.tex
	lhs2TeX --agda agda.tex > agda-processed.tex
	lhs2TeX --agda background/agda.tex > agda-background-processed.tex

	runhaskell $breaker_hs -o1 agda-preamble.tex -o2 agda-processed-body.tex < agda-processed.tex
	runhaskell $breaker_hs -o1 /dev/null -o2 agda-background-body.tex < agda-background-processed.tex
	runhaskell $breaker_hs -o1 /dev/null -o2 agda-listing-body.tex < listing-processed.tex
	export TEXINPUTS=$BuildDir/styles:$BuildDir/DATE10_Balsa:$BuildDir/par_comp:
	export BIBINPUTS=$BuildDir/par_comp:
	echo RRR Latex 1
	latex main > latex.log || (cat latex.log && false)
	echo RRR Bibtex
	bibtex main
	echo RRR Latex 2
	latex main > /dev/null 2&>1
	echo RRR Latex 3
	latex main > /dev/null 2&>1
	echo RRR Latex 4
	latex main
	echo RRR DVIPDF
	dvipdf main.dvi

	latex collaboration
	bibtex collaboration
	latex collaboration
	latex collaboration
	dvipdf collaboration.dvi

	mkdir $out
	cp $BuildDir/main.pdf $out/thesis.pdf
	cp $BuildDir/collaboration.pdf $out/
'';
};
}
