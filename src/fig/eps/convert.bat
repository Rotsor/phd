FOR %%i IN (*.svg) DO inkscape --file=%%i --without-gui --export-eps=%%i.eps
