#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { CUSTOM_SCRIPT } from "./modules/custom_script/main.nf"

workflow { 

    CUSTOM_SCRIPT()

}
