# TopasTools
Tools related to the use of Topasmc (Topas Monte-Carlo) modelling of ionizing radiation transport, radiation physics and dosimetry.

## Teaching material
The pdf entitled Topas-guide... contains teachning material (MSc level) regarding simple techniques and tricks etc.  

## Varian medical linac photon spectra
The use of the Varian linac photon spectra in the file Topas-VarianBeamAR.txt is described in the pdf Topas-Guide presentation (see above).
These spectra are useful for simple modelliong of medical megavoltage x-ray beams. Of course it is better to have a proper 
phase space file, but these simple spectra will get you far, and they are supported by the Ali and Rogers paper. 

## R package for reading Topas output
An R package for reading Topas output is in the repository 
https://github.com/claus-e-andersen/clanTopas

## R package for reading ENDF files
An R package for reading nuclear data in ENDF format. 
I have used this to obtain high-quality data in order to valide my use of TOPAS with respect to 
photonuclear reactions (gamma,n).
https://github.com/claus-e-andersen/clanENDF

## Topas Go (topasgo.sh)
Bash script that can manage topas jobs with large numbers of output files.
Data files, parameter files, and console output etc. are put in a timestamped output folder.
This means that we have a clear link between parameter files and output. 
Sample call:
```
 ./topasgo.sh space10016.txt
```



