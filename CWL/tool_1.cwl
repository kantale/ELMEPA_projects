#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - class: File
        location: tool_1.sh

baseCommand: ['bash', 'tool_1.sh']
inputs:
  value1:
    type: string
    inputBinding:
      position: 1
  file1:
    type: string
    inputBinding:
      position: 2

outputs:
  extracted_file:
    type: File
    outputBinding:
      glob: $(inputs.file1)

