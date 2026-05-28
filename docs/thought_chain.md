# Thought chain

Not specifically every single thought, but will represent the process of thinking and understanding in each stage:
1. **Initial:** from **knowing nothing** to understand the **problem statement and the solution**
2. **Analyzing:** from undestanding the solution to **able to vaguely explain the solution approach and methodology**
3. **Evaluating:** from **scattering ideas** to **able to structurize the report and making extension** 
4. **Misc:** side thoughts other than the categories above
5. **Resources:** collect resource that used in the process
## Initial


## Analyzing


## Evaluating


## Misc

### Execution process revising (Section 5.2)
1. **pwn** was chosen due to familiarity with low-level concepts and containerization usage and **redact** specifically due to initial deep level of understanding C++. The 
2. Creating a clean env can be easily archive by clone the current repo and use make to run/debug the faulty/safe binary.
3. Please refer to [Initial](#initial)
4. Please refer to [Analyzing](#analyzing) and [Evaluating](#evaluating)
5. Since I kinda dive before reading the instruction, the process evidence/logbook (refer to [History of thesis execution](#history-of-thesis-execution)) is written base on memory
6. The extension is simply a fix for the exploitation, plus a traditional way of calling system("/bin/sh")

### History of thesis execution

#### 1. The blind dive jump

The first time I read the practice thesis description is at **May 8th**, I was quite panic due to late recognition of what I need to do, also that was in the time when schedule was so busy due to upcoming exams.

Gemini was given my personal context and knowing my career direction, recommended **pwn** due to it's low-level understanding of C++ requirements and `gdb` usage, what im currently need to know for career but having no idea how to use. 

I asked Copilot to find a CTF in lactf-archive that used C++. Redact was found and I start digging.

I'm not sure what's the direction of the challenge, of course to get the flag.txt content, but how exactly? 

#### 2. Initial environment setup

After download all the files in the archive to a folder, I quickly realise that the libc.so.6 is causing problems due to my host system is Linux. So putting things into a seperate folder will be necessary.

## Resources

(WARNING: This reference is not displayed in any standard)

1. [GDB Tutorial](https://youtu.be/svG6OPyKsrw?si=QejImeR0fTvur6jk) and [GDB Cheat Sheet](https://darkdust.net/files/GDB%20Cheat%20Sheet.pdf)
2. [LA-CTF 2023 Archive Redact](https://github.com/uclaacm/lactf-archive/tree/main/2023/pwn/redact)
3. [AMD's x86_64 ABI Parameter Passing](https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf#page=22): Section 3.2.3 Parameter Passing, Figure 3.4: Register Usage
4. [Small String Optimization libstdc++ Implementation](https://github.com/gcc-mirror/gcc/blob/master/libstdc++-v3/src/c++11/sso_string.cc) 
5. 