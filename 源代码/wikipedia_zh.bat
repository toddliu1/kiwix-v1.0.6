@echo off
title ά���ٿ�
color 0A

:: ����ȫ�ֱ����ӳ���չ
setlocal enabledelayedexpansion

:: ������ǰ�ļ����µ�.zim�ļ�����zim�ļ�������zim����
for  /F %%a in ('dir /b *.zim') do set zim=!zim! %%a

:: ��ʾ����IP��ַ���Ա����ͨ���õ�ַ����ά���ٿ�
for /F "tokens=15 delims=: " %%i in ('ipconfig ^| findstr IPv4') do @echo ���IP��ַ�ǣ�%%i

echo.
echo ����رմ˴��ڣ�����

echo.
echo �ر���������ں󣬴˴����Զ��رա�
echo.

:: ����Ĭ�������
start http://localhost

:: �ж��û������
for %%b in (360chrome,chrome,msedge,360se,firefox,iexplore) do (

:: �����һ�����������������PID
	for /F "tokens=2" %%p in ('tasklist /FI "imagename  EQ %%b.exe" /NH ^| findstr %%b') do (
		echo %%p | findstr "[0-9]" >nul && set pid=%%p
		goto START
	)
)

:START
:: ����ά���ٿƷ��񣬰󶨵�ǰ���ȡ����PID
kiwix-serve.exe -a %pid% %zim% > kiwix.log.txt
