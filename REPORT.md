nano REPORT.md
# REPORT.md

## Feature-2: Multi-file Project

**Q1. Explain the linking rule in this part's Makefile: `$(TARGET): $(OBJECTS)`. How does it differ from a Makefile rule that links against a library?**  
- This rule means: *to build the target program, first build all the object files*.  
- The compiler then links all `.o` files directly into one executable.  
- In this method, every `.c` file is compiled separately, and then all `.o` files are linked together.  
- If we were linking against a library, the rule would look different:  
  ```make
  $(TARGET): main.o
      $(CC) main.o -L../lib -lmyutils -o $(TARGET)
Q2. What is a git tag and why is it useful in a project? What is the difference between a simple tag and an annotated tag?

A git tag is like a label that marks a specific commit as an important version (e.g., v1.0).

It is useful for version control because it allows developers to easily return to or share a stable snapshot of the project.

Simple tag: just points to a commit (like a lightweight bookmark).

Annotated tag: includes extra information such as a message, the author, and the date.

In real projects, annotated tags are preferred because they give proper versioning information.

Q3. What is the purpose of creating a "Release" on GitHub? What is the significance of attaching binaries (like your client executable) to it?

A GitHub Release is used to share a stable version of your project with others.

It is linked to a git tag and makes it easier for others to download and use a tested build.

Purpose: mark milestones (v1.0, v2.0, etc.), and provide documentation of what changed.

Attaching binaries (like bin/client) lets users download and run the program without compiling source code themselves.

This is how real-world software is distributed on GitHub.
