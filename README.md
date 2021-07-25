# Nextflow doesn't mount `$moduleDir`: minimal reproducible example

## Usage

```
# use sudo for docker
sudo ./run_tests.sh
```

## Test cases

The example contains 3 test cases: 

1. execute the pipeline from the workflow directory
2. execute the pipeline from a different directory (`run_dir`)
3. symlink the pipeline to a different directory (`workflow_symlink`), and execute the symlinked
   pipeline from yet another directory (`run_dir`). This is what happens when using
   `pytest-workflow`.

## Workarounds

Adding

```
docker.runOptions = "-v /home/sturm/projects/2021/nextflow-issue-1798/workflow:/home/sturm/projects/2021/nextflow-issue-1798/workflow"
```

to `nextflow.config` solves the problem for test cases 1 and 2. For test case 3
the `workflow_symlink` needs to be added instead.

## Proposed solution

Add `$moduleDir` (or even the entire `$projectDir` (?)) to the docker mount
paths. 
