---
layout: page
title: likelihood and Bayesian approaches in Biology
permalink: /like-bayes-bio/
---

This site will have links to notes, slides, code and data sets used
in the "likelihood and Bayesian approaches in biology" hosted by
[Hellenic Centre for Marine Research](http://www.hcmr.gr) 15-18 June, 2015.

| Session | Link/Content |
|:------- |:-------------|
|Mon., lecture: Intro, Probability, Likelihood | [posted-day-1.zip](../posted-day-1.zip)|
|Tues., lecture: Model testing | [posted-day-2.zip](../posted-day-2.zip) |
|Wed., lecture: Bayesian, MCMC | [posted-day-3.zip](../posted-day-3.zip)|
|Thurs., lecture Model averaging MCMC | [posted-day-4.zip](../posted-day-4.zip)|

More examples can be found at [the site for the KU version of the course](https://phylo.bio.ku.edu/courses/likelihood).

The source code for the slides and examples is at [https://github.com/mtholder/like-bayes-bio-4-day-workshop](https://github.com/mtholder/like-bayes-bio-4-day-workshop)

## Workshop goals
In the workshop we will cover the basics of using maximum likelihood and
Bayesian methods for inference. Basing inference on a likelihood function
is an extremely flexible and powerful framework for statistics.
Many of the "canned" statistical estimators and test statistics that are
taught in introductory statistics courses can be justified from the
perspective of maximum likelihood. But likelihood-based approaches can be 
tweaked to fit the specifics of complex experimental designs. So learning
the basic tools in the "likelihood toolbox" can be a very valuable research
skill.

We will have some lectures and walk through programming examples.

Ready-to-use algorithms for many portions of a likelihood or Bayesian program
are available. So, it can be surprisingly easy to get a simple estimation
program working.

Template scripts will be provided in Python and R, so
experience with programming is not a prerequisite. We won't have time to
really teach programming in any depth, but we will walk through some example 
programs.


To be honest, there won't be much biology here. The examples are all toys
cases with made up data that are designed to explain the core concepts. 
However, I am a biologist, and I would be very happy to
discuss how to apply the concepts covered (and others that we won't have
time to cover) to real-world problems in biology.

## Preparation for the computer demos

### Text editors
When reading or editing computer programs, you need to use a text editor,
*not* a word processor.

For Windows I recommend: [Notepad++](https://notepad-plus-plus.org/download/v6.4.2.html)

For Mac, I recommend: [TextWrangler](http://www.barebones.com/products/textwrangler/).

[jEdit](http://www.jedit.org/) is another free, cross-platform option.
[SublimeText](http://www.sublimetext.com/) is nice, but is only free during a trial period.

### Terminals and your shell
The programs that we write, will be run through a "command-line interface".
That means that, instead of double clicking on an application to run it, we will
type the command to be run and supply it with extra information in the form of
command-line arguments.

When I refer to the "terminal", I mean the clickable application that you run
to start session in which you can execute commands (technically speaking
"[terminal emulator](http://en.wikipedia.org/wiki/Terminal_emulator)" 
would be the better phrase to use for the application, because 
"terminal" originally referred to [hardware](http://en.wikipedia.org/wiki/Computer_terminal))

On Windows the terminal application is usually the "Command Prompt"
(also called the "cmd.exe") program.
On Mac it is typically the "/Applications/Utilities/Terminal" application.

The terminal passes the text that you type to a "shell" to be interpreted.
Each shell has its own language that describes how text you type will be interpreted.
On Windows, the shell uses DOS language. On other operating systems, the 
user has a choice with `bash` and the `C-shell` being the most popular.

For our purposes, the shells are similar enough that the same set of commands
should work across any of the shells.

The most common stumbling block for new users is the fact that a shell
will break your commands into a series of words.
A space (or tab character) is the signal to end a word. 
So if you are trying to refer to a file on your computer and the file name (or
the name of one of the directories that it is under) has a space in it, you
will have to add quotes around the file name so that the shell will read it as
one word.

### Python
We will use version 2.7 of [Python](https://www.python.org/). 
Python is a fantastic, general purpose programming language.
Much of the code for scientific calcuations are available as add-on "packages"
that you need to install.
The most challenging of the packages that we will need are numpy and scipy
(because they both contain C-language code that has to be compiled).

#### Python + scipy installation: the easy way
The easiest way to install the "scipy stack" of tools is to follow the instructions at [www.scipy.org/install.html](http://www.scipy.org/install.html).

From your terminal (`bash` or `csh` on linux/Mac or your `CMD.exe` on Windows),
you should verify that the command:

    pip

shows the help message for the python installer `pip`. If it does not, 
you will probably want to download and install `pip` from [here](https://pypi.python.org/pypi/pip).

#### Python + scipy installation: the possibly painful way
This manual way (which is probably only useful if you will be using python
for many other projects and you want to isolate the effects of installing
scipy to just the code in the workshop). At a bash terminal issue the following
commands.

    virtualenv sci
    source sci/bin/activate
    pip install numpy
    pip install scipy

If you have a modern C and fortran compiler, this should be slow, but straightforward.
If you don't you'll need to install them (and that is where this route can
become a bit painful).

### R
[The R programming language](http://www.r-project.org/) is an environment
for automating statistical analyses.
The functions that we need for programming in R are part of its standard library,
so you will not need to install them separately.


## Links
  * The longer version of this course is co-taught with Dr. John Kelly
at the University of Kansas. The course website is: 
[https://phylo.bio.ku.edu/courses/likelihood](https://phylo.bio.ku.edu/courses/likelihood),
but that site will be down for maintenance for some of portion of the 
time of the Crete workshop.



