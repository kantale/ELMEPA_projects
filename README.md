# ELMEPA 2020 Lessons


### 27 April 2020 
* [Docker](docker.md)
* [Bash](bash.md)

### 4 May 2020 
* NGS + Projects https://www.dropbox.com/s/l6a1kjbsywo7yoa/673e35b0264d6fc59bc36417aa94d283.pptx?dl=0 

### 11 May 2020 
* Lesson 1 : https://gist.github.com/kantale/7e7c551cc2ee6c74e663bf7d70ba4773
* Lesson 2 : https://gist.github.com/kantale/11e473af6ee463b6153a25fdfe348131
* Lesson 3 : https://gist.github.com/kantale/9ccbc685551f81be3ca073623aa04f59 
* [Lesson 4](stat_test.ipynb) . Simple statistical test with chi square. 

### 18 May 2020
* [CWL Presentation](https://www.dropbox.com/s/ygydsequvuq887z/44e8879487672a12233120a426b69ec2.pptx?dl=0)
* Files are available here: https://github.com/kantale/ELMEPA_projects/tree/master/CWL 

### We provide Dockerfiles for the following tools:
* [AMOS Genome Assembly](http://amos.sourceforge.net/wiki/index.php/AMOS) [Dockerfile](tools/AMOS/Dockerfile)
* Also: [how to install R 4.0.0 from source with a single bash script](r.sh)

### Project 2,3,4
* Data : https://www.internationalgenome.org/data-portal/sample/NA12878 Download (fastq FTP)
* Figure: https://www.hindawi.com/journals/bmri/2015/456479/fig1/ 
* Paper: https://www.hindawi.com/journals/bmri/2015/456479/ 

### Project 9,10
* [Data](data_1.csv)

### Other resources 
* How to show a GUI running on Docker in Windows: https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde 
* [Linux Productivity Tools](https://www.usenix.org/sites/default/files/conference/protected-files/lisa19_maheshwari.pdf)

### What to deliver:
* Preferably, the report should be in **English**. 
* BASH Scripts. Scripts should run in a docker container. 
* **Important: Run your BASH scripts with this analysis tool: https://www.shellcheck.net/ before submitting!**. This tool can locate many quality/styling errors usually done from BASH newcomers!  
* The Dockerfile that configures the image where the scripts are running.
* Indicative, plot / figure / reports generated from your analysis. Do not add extremely large files. 
* A report, approximate 3 pages, that will contain:
   * The biology behind the task.
   * A list of the tools / data that you used
   * A diagram with the workflow. You can use any styling you want.. 
   * The computational requirements (how much time it requires, Memory, )
   * Describe shortly your experience of performing this analysis. What problems did you face? How did you resolve the,m? What advices would you give to anyone trying to perform the same task in the future? Imagine that this a blog post!
* A presentation (approximately 5 slides). With highlights of the above.

### Grading on projects
Grades will be based on the degree in which we will be able to perform the following:
* Install tools and download the data 2/10
* reproduce / run your scripts 3/10
* Generate your data / figures 3/10
* Can your script, pick up from the point that it stopped if we stop it abruptly? 1/10
* Quality of report / presentation 1/10



