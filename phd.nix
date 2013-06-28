let pkgs = import <nixpkgs> {}; in
{ phd = pkgs.stdenv.mkDerivation {
  name = "phd";
  src = ./src;
  breaker_hs = ./breaker.hs;
  buildInputs = with pkgs; [inkscape texLiveFull ghostscript (haskellPackages.ghcWithPackages (self : with self; [haskellPlatform lhs2tex shake]))];
  phases = [ "unpackPhase" "buildPhase" ];
  buildPhase = ''
	set -e
#	runhaskell ${./inkscaper.hs}
	export BuildDir=`pwd`

	cat listingPrefix >> listing.tex
	cat PG/*.agda >> listing.tex
	cat listingSuffix >> listing.tex

	lhs2TeX --agda listing.tex > listing-processed.tex

	lhs2TeX --agda agda.tex > agda-processed.tex
	runhaskell $breaker_hs -o1 agda-preamble.tex -o2 agda-processed-body.tex < agda-processed.tex
	runhaskell $breaker_hs -o1 /dev/null -o2 agda-listing-body.tex < listing-processed.tex
	ls
	cat agda-processed-body.tex
	export TEXINPUTS=$BuildDir/styles:$BuildDir/DATE10_Balsa:$BuildDir/par_comp:
	export BIBINPUTS=$BuildDir/par_comp:
	echo RRR Latex 1
	latex main > /dev/null
	echo RRR Bibtex
	bibtex main
	echo RRR Latex 2
	latex main
	echo RRR Latex 3
	latex main
	echo RRR DVIPDF
	dvipdf main.dvi
	cp $BuildDir/main.pdf $out
'';
};
}
