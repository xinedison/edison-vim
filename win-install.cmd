REM    Copyright 2014 Steve Francia
REM 
REM    Licensed under the Apache License, Version 2.0 (the "License");
REM    you may not use this file except in compliance with the License.
REM    You may obtain a copy of the License at
REM 
REM        http://www.apache.org/licenses/LICENSE-2.0
REM 
REM    Unless required by applicable law or agreed to in writing, software
REM    distributed under the License is distributed on an "AS IS" BASIS,
REM    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM    See the License for the specific language governing permissions and
REM    limitations under the License.
REM    changed by edison


@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set APP_DIR=%HOME%\.vim
IF NOT EXIST "%APP_DIR%" (
  call git clone https://github.com/xinedison/edison-vim.git "%APP_DIR%"
) ELSE (
	@set ORIGINAL_DIR=%CD%
    echo updating edison-vim
    chdir /d "%APP_DIR%" 
	call git pull
    chdir /d "%ORIGINAL_DIR%"
	call cd "%APP_DIR%" 
)

call mklink "%HOME%\.vimrc" "%APP_DIR%\.vimrc"
call mklink "%HOME%\_vimrc" "%APP_DIR%\.vimrc"
call mklink /J "%HOME%\.vim" "%APP_DIR%\.vim"

IF NOT EXIST "%APP_DIR%\bundle" (
	call mkdir "%APP_DIR%\bundle"
)

IF NOT EXIST "%HOME%/.vim/bundle/Vundle.vim" (
	call git clone https://github.com/gmarik/Vundle.vim.git "%HOME%/.vim/bundle/Vundle.vim"
) ELSE (
  call cd "%HOME%/.vim/bundle/Vundle.vim"
  call git pull
  call cd %HOME%
)

call vim +PluginInstall +qall