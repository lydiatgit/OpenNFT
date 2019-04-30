@echo off
rem create the virtual environment and install dependencies

rem get current path and set as rootpath
set rootpath=%cd%
set env_name="OpenNFT_venv"

set /p matlabPath="Enter matlab path (e.g. C:\Program Files\MATLAB\R2016b): "

echo %matlabPath%
echo setup venv 

powershell -Command "python -m venv %env_name%"
cd /d %env_name%
cd /d Scripts
call activate.bat

rem connect to matlab engine
echo connect to matlab engine...
cd %matlabPath%\extern\engines\python
powershell -Command "python setup.py build --build-base='%rootpath%\OpenNFT_venv\Lib\site-packages\MatlabEngineBuild' install"
echo Successfully connected to matlab engine
cd %rootpath%

echo install dependencies...
pip install -U pip setuptools
pip install -r requirements.txt"

rem get python version 
IF defined PYTHONPATH (
	set py=%PYTHONPATH:~-1%
) ELSE (
		IF defined PYTHONHOME (
			set py=%PYTHONPATH:~-1%
		) ELSE (
			set /p py="Enter python version (must be  Python 3, so only imput one number, e.g. 5): "
		)
	)
set windowsSystem=%PROCESSOR_ARCHITECTURE:~-2%

echo you have python version 3.%py% on Windows x%windowsSystem%

rem INSTALL CORRECT VERSION OF npy+mkl
rem IF "%py%"=="5" (
rem 	pip install http://www.silx.org/pub/wheelhouse/numpy-1.11.3+mkl-cp35-cp35m-win_amd64.whl
rem ) ELSE (
pip install http://www.silx.org/pub/wheelhouse/numpy-1.11.3+mkl-cp3%py%-cp3%py%m-win_amd%windowsSystem%.whl

echo SETUP FINISHED

pause