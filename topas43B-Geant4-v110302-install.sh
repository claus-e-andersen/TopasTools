#!/bin/bash

echo $HOME

echo "Install topas 4.3 with GEANT4 11.3.2"
echo "Everything (Geant4 + Topas) will be put in the folder Applications43B"

echo "Consider to call as: ./topas43-install.sh | tee topas43-install.log"

echo "IMPORTANT NOTE that you will need an old version of cmake to complete step 8.3 (gdcm). "

echo "# Delete the (large) folder Applications43B if it exists (sudo rm -rf <dir>"
echo "Be carefull with this command! r= recursive f = force "
echo "Claus E. Andersen, October 11, 2026"

read -p "Make sure you ALSO have cmake 3.28.1  (test with: /opt/cmake-3.28.1/bin/cmake -- version) <press enter>" JUNKVAR
sleep 1

if false; then
echo "FALSE BLOCK (start)"
# Use this block to only run specific parts of the script
fi


read -p "Entering step 5 <press enter>" JUNKVAR

echo "Step 5"
mkdir $HOME/Applications43B
mkdir $HOME/Applications43B/GEANT4
cd $HOME/Applications43B/GEANT4
wget https://gitlab.cern.ch/geant4/geant4/-/archive/v11.3.2/geant4-v11.3.2.tar.gz
tar -zxf geant4-v11.3.2.tar.gz
echo "DONE (Step 5)"
sleep 5


read -p "Entering step 6 <press enter>" JUNKVAR
echo "Step 6"
mkdir $HOME/Applications43B/GEANT4/G4DATA
cd $HOME/Applications43B/GEANT4/G4DATA/

wget https://cern.ch/geant4-data/datasets/G4NDL.4.7.1.tar.gz
wget https://cern.ch/geant4-data/datasets/G4EMLOW.8.6.1.tar.gz
wget https://cern.ch/geant4-data/datasets/G4PhotonEvaporation.6.1.tar.gz
wget https://cern.ch/geant4-data/datasets/G4RadioactiveDecay.6.1.2.tar.gz
wget https://cern.ch/geant4-data/datasets/G4PARTICLEXS.4.1.tar.gz

wget https://cern.ch/geant4-data/datasets/G4PII.1.3.tar.gz
wget https://cern.ch/geant4-data/datasets/G4RealSurface.2.2.tar.gz
wget https://cern.ch/geant4-data/datasets/G4SAIDDATA.2.0.tar.gz
wget https://cern.ch/geant4-data/datasets/G4ABLA.3.3.tar.gz
wget https://cern.ch/geant4-data/datasets/G4INCL.1.2.tar.gz

wget https://cern.ch/geant4-data/datasets/G4ENSDFSTATE.3.0.tar.gz
wget https://cern.ch/geant4-data/datasets/G4CHANNELING.1.0.tar.gz
wget https://cern.ch/geant4-data/datasets/G4TENDL.1.4.tar.gz
wget https://cern.ch/geant4-data/datasets/G4NUDEXLIB.1.0.tar.gz
wget https://cern.ch/geant4-data/datasets/G4URRPT.1.1.tar.gz

wget https://cern.ch/geant4-data/datasets/LEND_GNDS2.0_ENDF.BVII.1.tar.gz

tar zxf G4NDL.4.7.1.tar.gz
tar zxf G4EMLOW.8.6.1.tar.gz
tar zxf G4PhotonEvaporation.6.1.tar.gz
tar zxf G4RadioactiveDecay.6.1.2.tar.gz
tar zxf G4PARTICLEXS.4.1.tar.gz

tar zxf G4PII.1.3.tar.gz
tar zxf G4RealSurface.2.2.tar.gz
tar zxf G4SAIDDATA.2.0.tar.gz
tar zxf G4ABLA.3.3.tar.gz
tar zxf G4INCL.1.2.tar.gz

tar zxf G4ENSDFSTATE.3.0.tar.gz
tar zxf G4CHANNELING.1.0.tar.gz
tar zxf G4TENDL.1.4.tar.gz
tar zxf G4NUDEXLIB.1.0.tar.gz
tar zxf G4URRPT.1.1.tar.gz
tar zxf LEND_GNDS2.0_ENDF.BVII.1.tar.gz
echo "DONE (Step 6)"
sleep 6



read -p "Entering step 7 <press enter>" JUNKVAR
echo "Step 7"
cd $HOME/Applications43B/GEANT4/
rm -rf geant4-install geant4-build
mkdir geant4-{build,install}
cd geant4-build
cmake ../geant4-v11.3.2 -DGEANT4_INSTALL_DATA=OFF -DGEANT4_BUILD_MULTITHREADED=ON -DCMAKE_INSTALL_PREFIX=../geant4-install -DCMAKE_PREFIX_PATH=/usr/lib/qt6 -DGEANT4_USE_QT=ON -DGEANT4_USE_QT_QT6=ON
sudo make -j20 install
echo "DONE (Step 7)"
sleep 6




echo "Step 8"

read -p "Entering step 8.1 <press enter>" JUNKVAR
mkdir $HOME/Applications43B/TOPAS
cd $HOME/Applications43B/TOPAS
git clone https://github.com/OpenTOPAS/OpenTOPAS.git
cd OpenTOPAS
git checkout v4.3.0
cd ..
echo "Step 8.1 was completed"

read -p "Entering step 8.2 <press enter>" JUNKVAR
mkdir $HOME/Applications43B/GDCM
cd $HOME/Applications43B/TOPAS/OpenTOPAS
mv gdcm-2.6.8.tar.gz ../../GDCM
cd ../../GDCM
tar -zxf gdcm-2.6.8.tar.gz
echo "Step 8.2 was completed"


read -p "Entering step 8.3 <press enter>" JUNKVAR
rm -rf gdcm-install gdcm-build
mkdir gdcm-{build,install}
cd gdcm-build

read -p "YOU NEED cmake version < 3.5 (e.g. 3.28.1)!" JUNKVAR
read -p "Make sure you have cmake 3.28.1  (test with: /opt/cmake-3.28.1/bin/cmake -- version) <press enter>" JUNKVAR
/opt/cmake-3.28.1/bin/cmake ../gdcm-2.6.8 -DGDCM_BUILD_SHARED_LIBS=ON -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=OFF  -DCMAKE_INSTALL_PREFIX=../gdcm-install 
sudo make -j20 install
echo "Step 8.3 was completed"



read -p "Entering step 8.4 <press enter>" JUNKVAR
cd $HOME/Applications43B/TOPAS
rm -rf OpenTOPAS-install OpenTOPAS-build
mkdir OpenTOPAS-{build,install}
cd OpenTOPAS-build
export Geant4_DIR=$HOME/Applications43B/GEANT4/geant4-install
export GDCM_DIR=$HOME/Applications43B/GDCM/gdcm-install
cmake ../OpenTOPAS -DCMAKE_INSTALL_PREFIX=../OpenTOPAS-install -DTOPAS_USE_QT=ON -DTOPAS_USE_QT6=ON
sudo make -j20 install
echo "Step 8.4 was completed"

echo "DONE (Step 8)"
sleep 6




read -p "Entering step 9 <press enter>" JUNKVAR
echo "Step 9"
mkdir ~/shellScripts
cd ~/shellScripts
echo '#!/bin/bash' > topasB
echo '' >> topasB
echo 'export QT_QPA_PLATFORM_PLUGIN_PATH=$HOME/Applications43B/TOPAS/OpenTOPAS-install/Frameworks' >> topasB
echo 'export TOPAS_G4_DATA_DIR=$HOME/Applications43B/GEANT4/G4DATA' >> topasB
echo 'export LD_LIBRARY_PATH=$HOME/Applications43B/TOPAS/OpenTOPAS-install/lib:$LD_LIBRARY_PATH' >> topasB
echo 'export LD_LIBRARY_PATH=$HOME/Applications43B/GEANT4/geant4-install/lib:$LD_LIBRARY_PATH' >> topasB
echo '$HOME/Applications43B/TOPAS/OpenTOPAS-install/bin/topas $1' >> topasB
chmod +x topasB

echo "DONE (Step 9)"

echo "You may need to add  the following line to your .bashrc-file:"
echo "export PATH=~/shellScripts:$ PATH' >> .bashrc"

echo "All DONE. ByeBye"

