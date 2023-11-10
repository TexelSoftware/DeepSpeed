@echo off

set DS_BUILD_AIO=0
set DS_BUILD_SPARSE_ATTN=0
set DISTUTILS_USE_SDK=1
set TORCH_CUDA_ARCH_LIST=5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.7;8.9;9.0

echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
) else (
    echo Failure: Current permissions inadequate.
    goto end
)

python setup.py bdist_wheel --py-limited-api=cp310

:end
