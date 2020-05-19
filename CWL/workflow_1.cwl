#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  w1: string
  
  w2:
    type: File
  
  w3: string

outputs:
  w3:
    type: File

steps:
  s1:
    run: tool_1.cwl
    in:
      value1: w1 
      file1: w3
    out: [extracted_file]

  s2:
    run: tool_2.cwl
    in:
      file_a: s1/extracted_file
      file_b: w3
    out: [extracted_file]


