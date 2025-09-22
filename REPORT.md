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
## Feature-3: Static Library

**Q1. Compare the Makefile from Part 2 and Part 3. What are the key differences in the variables and rules that enable the creation of a static library?**  
- In Part 2 the Makefile compiles all `.c` files and links the resulting `.o` files directly into an executable using a rule like `$(TARGET): $(OBJECTS)`.  
- In Part 3 the build separates the code into a library and the main program: library sources are compiled into `obj/*.o`, then combined into `lib/libmyutils.a` with `ar`. The final executable links against this library with `-Llib -lmyutils`.  
- Key differences: new variables (`LIB_SRCS`, `LIB_OBJS`, `OBJDIR`, `LIBDIR`), an `ar` + `ranlib` step to create `.a`, and modified linking rules that reference `-lmyutils` instead of listing many object files.

**Q2. What is the purpose of the `ar` command? Why is `ranlib` often used immediately after it?**  
- `ar` bundles object files into a static archive (`.a`) that the linker can use. The common usage is `ar rcs libname.a obj1.o obj2.o`.  
- `ranlib` writes an index to the archive (symbol table) so the linker can quickly locate symbols. Many `ar` implementations create the index automatically with `-s`, but running `ranlib` is portable and recommended.

**Q3. When you run `nm` on your `client_static` executable, are the symbols for functions like `mystrlen` present? What does this tell you about how static linking works?**  
- Yes — `nm` should show symbols like `mystrlen` in the final executable. This indicates that the library object code was copied into the executable at link time. Static linking merges required library object code into the final binary so the executable can run without the `.a` file at runtime.

## Feature-4: Dynamic Library Project

**Q1. What is Position-Independent Code (-fPIC) and why is it required?**  
- Position-Independent Code is code that can run correctly regardless of where it is loaded in memory.  
- Shared libraries must be relocatable because the operating system’s loader may place them at different addresses.  
- Compiling with `-fPIC` ensures the code uses relative addressing so the library can be reused safely by multiple processes.

**Q2. Why is the dynamic client smaller than the static client?**  
- Static linking copies all the library code into the executable, so the binary becomes large.  
- Dynamic linking only stores references to the library; the `.so` file is loaded at runtime.  
- Therefore, the dynamic client is significantly smaller in size.

**Q3. What is LD_LIBRARY_PATH and why was it necessary to set it?**  
- `LD_LIBRARY_PATH` is an environment variable that tells Linux where to search for shared libraries at runtime.  
- Since `libmyutils.so` is stored in our project’s `lib/` folder (not in a standard system directory like `/usr/lib`), we had to set:  
  ```bash
  export LD_LIBRARY_PATH=$PWD/lib
  ./bin/client_dynamic

