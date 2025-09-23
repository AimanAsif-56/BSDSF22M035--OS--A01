# Operating Systems Assignment – BSDSF22M035  
**Author:** Aiman Asif  
**Final Version:** v0.4.1-final  

This report explains all features implemented in the OS assignment, from multi-file builds to installation with manual pages.

---

## Feature-1: Multi-File Build

**Q1. Why split code into multiple source files?**  
- Improves **organization** by separating reusable utility functions from the main client program.  
- Enables **independent compilation**—only changed files need to be recompiled, saving time.  
- Promotes **modularity and reuse** in larger projects.

**Q2. How was it built?**  
- Created separate source files (e.g., `src/myutils.c`, `src/client.c`) and header files.  
- Used a Makefile to compile each `.c` into object files and then link them:  
  ```bash
  gcc -c src/myutils.c -o build/myutils.o
  gcc -c src/client.c  -o build/client.o
  gcc build/*.o -o bin/client

                  --------------------------------------------------------------
*******Feature-2: Static Library Build

Q1. What is a static library?

A .a (archive) file containing pre-compiled object code.

During linking, the entire required code is copied into the final executable.

Q2. Key advantage/disadvantage

Advantage: Final executable has no external runtime dependency on the library.

Disadvantage: Executable size increases and updating the library requires recompilation of the executable.

Q3. How was it built?

Compiled source to object files and created a static library:

    ar rcs lib/libmyutils.a build/myutils.o
    gcc src/client.c lib/libmyutils.a -o bin/client_static

             --------------------------------------------------------------


Feature-3: Dynamic Library Build

Q1. What is a dynamic library?

A shared object (.so) file loaded at runtime instead of being copied into the executable.

Q2. Advantages

Smaller executable size.

Library updates do not require recompiling dependent programs.

Multiple programs can share the same library in memory.

Q3. Role of LD_LIBRARY_PATH

Environment variable that tells the loader where to search for shared libraries at runtime.

Example usage:

     LD_LIBRARY_PATH=lib ./bin/client_dynamic


Q4. Compilation flags

Used   -fPIC to generate position-independent code and -shared to create the .so library.


             -----------------------------------------------------------------



Feature-4: Dynamic Build & Client

Q1. How does dynamic linking differ from static linking?

Static linking: All library code is copied into the final executable at build time.

Dynamic linking: The executable only contains references to the shared library and loads it during execution.

Q2. What is the purpose of LD_LIBRARY_PATH in Linux?

Specifies additional directories where the runtime linker searches for shared libraries that are not in standard paths like /usr/lib.

Q3. Why are dynamic libraries useful in real projects?

Easier updates: Update the library without recompiling the main program.

Memory efficiency: One library in memory can serve multiple programs.

Modular design: Encourages clean separation of functionality


            -----------------------------------------------------------------


Feature-5: Manual Pages and Installation

Q1. Purpose of man pages

Provide standardized, searchable documentation directly accessible with the man command.

Allows users to read about functions (man 3 mystrlen) or the client without opening source code.

Q2. Steps performed

Wrote man/man3/*.3 files using groff format (.TH, .SH, etc.) for:

     mystrlen

     wordCount

    mygrep

Added install and uninstall targets in the Makefile to:

Copy the client binary to /usr/local/bin/client.

Copy and compress man pages to /usr/local/share/man/man3/.

Update the man database using mandb.

Verified installation by running:

     client
     man mystrlen
     man wordCount
     man mygrep


Q3. How does make install work?

The Makefile automates system-wide installation:

install -Dm755 places the client binary in /usr/local/bin/.

install -m644 copies man pages and compresses them (.3.gz).

mandb refreshes the manual page index.

Q4. Uninstallation

sudo make uninstall removes the installed binary and man pages, then updates the database.

Final Notes

Tags pushed:

v0.1.1-multifile – Multi-file build

v0.2.1-static – Static library build

v0.3.1-dynamic – Dynamic library build

v0.4.1-final – Final build with man pages and installation target

Final Release: Contains the client executable, dynamic library, and man pages.

Commands work system-wide after installation:

     client
     man mystrlen
     man wordCount
     man mygrep
