@echo off
for %%f in (*.pde) do (
    mkdir "%%~nf"
    move "%%f" "%%~nf\"
)
pause