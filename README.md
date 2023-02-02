# TopasTools
Tools related to the use of Topasmc (Topas Monte-Carlo) modelling of ionizing radiation transport, radiation physics and dosimetry.

## Teaching material
The pdf entitled Topas-guide... contains teachning material (MSc level) regarding simple techniques and tricks etc.  

## Varian medical linac photon spectra
The use of the Varian linac photon spectra in the file Topas-VarianBeamAR.txt is described in the Topas-Guide presentation.
These spectra are useful for simple modelliong of medical megavoltage x-ray beams. 

## R package for reading Topas output
An R package for reading Topas output is in the repository 
https://github.com/claus-e-andersen/clanTopas

## Topas Go (topasgo.sh)
Bash script that can manage topas jobs with large numbers of output files.
Data files, parameter files, and console output etc. are put in a timestamped output folder.
This means that we have a clear link between parameter files and output. 
Sample call:
'''
 ./topasgo.sh space10016.txt
'''



