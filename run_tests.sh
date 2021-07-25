#!/bin/bash 

CWD=$(pwd)
mkdir -p $CWD/run_dir

# test case 1: run from the workflow directory
cd $CWD/workflow && PROFILE=docker nextflow run main.nf

# test case 2: run from a different directory
cd $CWD/run_dir && PROFILE=docker nextflow run ../workflow/main.nf

# test case 3: run from a different directory, but use a workflow that is in a symlinked directory (the pytest-workflow case)
cd $CWD/run_dir && PROFILE=docker nextflow run ../workflow_symlink/main.nf



