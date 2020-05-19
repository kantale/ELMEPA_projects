#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - class: File
        location: tool_2.sh

baseCommand: ['bash', 'tool_2.sh']
inputs:
  file_a:
    type: File
    inputBinding:
      position: 1
  file_b:
    type: string
    inputBinding:
      position: 2

outputs:
  extracted_file:
    type: File
    outputBinding:
      glob: $(inputs.file_b)

