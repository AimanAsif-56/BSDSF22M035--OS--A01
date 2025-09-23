# Operating Systems Assignment – BSDSF22M035  
**Author:** Aiman Asif  
**Final Version:** v0.4.1-final  

## 📋 Overview
This project demonstrates advanced Linux build and packaging techniques as part of an Operating Systems course.  
It includes:
- Modular multi-file C programming
- Static and dynamic library builds
- Custom manual (man) pages
- System-wide installation using a Makefile
- A complete Git workflow with branches, merges, tags, and releases

The final release is fully functional and documented, showing a professional software-development process.

---

## ✨ Features Implemented
1. **Multi-File Build**  
   - Source code split into multiple `.c` and `.h` files for modularity.  
   - Compiled using a Makefile to create a single executable.

2. **Static Library Build**  
   - Created `libmyutils.a` and linked it with the client program.  
   - Produces a standalone executable with all library code embedded.

3. **Dynamic Library Build**  
   - Created `libmyutils.so` shared library.  
   - The client program dynamically links at runtime, reducing executable size.

4. **Dynamic Client Build**  
   - Built a client (`client_dynamic`) that loads the shared library using the runtime linker.  
   - Supports `LD_LIBRARY_PATH` for non-standard library locations.

5. **Man Pages & Installation**  
   - Custom man pages (`mystrlen`, `wordCount`, `mygrep`) provide user documentation.  
   - `make install` copies the client to `/usr/local/bin/` and man pages to `/usr/local/share/man/man3/`.  
   - `make uninstall` removes them cleanly.

---

## 🛠️ Installation
Clone the repository and install system-wide:
```bash
sudo make install
This will:

Install the client executable as client

Install and compress all man pages

Update the man database (mandb)

To uninstall:

bash
Copy code
sudo make uninstall
🚀 Usage
Run the client program from anywhere:

bash
Copy code
client
View the manual pages:

bash
Copy code
man mystrlen
man wordCount
man mygrep
To run the dynamic build directly from the repository (if not installed):

bash
Copy code
LD_LIBRARY_PATH=lib ./bin/client_dynamic
🔑 Key Commands Used in Development
Compilation and linking examples:

bash
Copy code
gcc -c src/myutils.c -o build/myutils.o
gcc -c src/client.c -o build/client.o
ar rcs lib/libmyutils.a build/myutils.o
gcc src/client.c lib/libmyutils.a -o bin/client_static
gcc -fPIC -c src/myutils.c -o build/myutils.o
gcc -shared build/myutils.o -o lib/libmyutils.so
gcc src/client.c -Llib -lmyutils -o bin/client_dynamic
Git workflow:

bash
Copy code
git checkout -b feature-branch
git add .
git commit -m "Feature commit message"
git push origin feature-branch
git tag -a v0.4.1-final -m "Final build"
git push origin v0.4.1-final
📁 Repository Structure
bash
Copy code
BSDSF22M035--OS--A01/
├── bin/        # Compiled executables
├── build/      # Object files
├── lib/        # Static (.a) and dynamic (.so) libraries
├── man/man3/   # Manual pages (.3 files)
├── src/        # Source code (.c and .h files)
├── Makefile    # Build, install, and uninstall rules
└── REPORT.md   # Detailed answers for all 5 features
🏷️ Git Tags & Releases
v0.1.1-multifile – Multi-file build

v0.2.1-static – Static library build

v0.3.1-dynamic – Dynamic library build

v0.4.1-final – Final build with man pages and install target

Each tag corresponds to a milestone in the development process.

📜 Documentation
Detailed explanations of each feature and build process are available in REPORT.md.
This includes answers to all assignment questions and step-by-step instructions.

👤 Author
Aiman Asif
BSDSF22M035 – Operating Systems
Email:aimanasif1230@gmail.com
Aiman Asif
BSDSF22M035 – Operating Systems
Email: aaimanasif1230@gmail.com
