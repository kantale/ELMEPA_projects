#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: echo
arguments: ["hello_again", $(runtime.outdir)]
inputs:
  message:
    type: string
    inputBinding:
      position: 1
outputs: []

