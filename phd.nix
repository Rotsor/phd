let pkgs = import <nixpkgs> {}; in
{ phd = pkgs.stdenv.mkDerivation {
  name = "phd";
  src = ./src;
  breaker_hs = ./breaker.hs;
  buildInputs = with pkgs; [inkscape texLiveFull ghostscript (haskellPackages.ghcWithPackages (self : with self; [haskellPlatform lhs2tex self.shake]))];
  phases = [ "unpackPhase" "buildPhase" ];
  buildPhase = ''
	set -e
#	runhaskell ${./inkscaper.hs}
	export BuildDir=`pwd`
	lhs2TeX --agda agda.tex > agda-processed.tex
	runhaskell $breaker_hs -o1 agda-preamble.tex -o2 agda-processed-body.tex < agda-processed.tex
	export TEXINPUTS=$BuildDir/styles:$BuildDir/DATE10_Balsa:$BuildDir/par_comp:
	export BIBINPUTS=$BuildDir/par_comp:
	echo RRR Latex 1
	latex main
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
