# BSDSF22M035–OS–A01  
### Operating Systems – C Project with Libraries, Builds & Documentation

This assignment demonstrates how to design, build, and document a **C software project** using  
**Makefiles**, **static and dynamic libraries**, **man pages**, and a professional **Git workflow**.  
Each development stage introduces a new concept and builds on the previous one.

---

## 🧩 Project Milestones

### 🟢 Phase 1 – Modular Multi-File Build
- Application code separated into multiple source and header files.
- Compiled into a single executable using a Makefile to manage dependencies.

### 🟡 Phase 2 – Static Library (`libmyutils.a`)
- Utility functions archived into a static library.
- A client program (`client_static`) links with this `.a` file to produce a fully self-contained binary.

### 🟠 Phase 3 – Dynamic Library (`libmyutils.so`)
- Code compiled into a shared object (`.so`) using **`-fPIC`** and **`-shared`** flags.
- A dynamic client (`client_dynamic`) links at runtime, demonstrating memory savings and easy updates.

### 🟣 Phase 4 – Installation & Man Pages
- Created **man pages** for key library functions (`mystrlen`, `wordCount`, `mygrep`).
- Added **install** and **uninstall** targets to the Makefile to:
  - Copy executables to `/usr/local/bin`
  - Copy & compress man pages to `/usr/local/share/man/man3`
  - Update the system man database (`mandb`).

---

## ⚙️ Build & Run

Clone the repository and navigate into the project folder.

### Build Everything
```bash
make
Build Static Client Only
bash
Copy code
make client_static
Build Dynamic Client Only
bash
Copy code
make client_dynamic
Clean Object Files and Binaries
bash
Copy code
make clean
Install System-Wide (requires sudo)
bash
Copy code
sudo make install
After installation:

bash
Copy code
client          # Run from anywhere
man mystrlen    # Open manual page for library function
Uninstall
bash
Copy code
sudo make uninstall
📁 Repository Layout
makefile
Copy code
BSDSF22M035--OS--A01/
├── src/             # C source files
├── include/         # Header files
├── build/           # Object files
├── bin/             # Compiled executables
├── lib/             # Static (.a) and dynamic (.so) libraries
├── man/
│   └── man3/        # Manual pages for library functions
├── Makefile         # Build/clean/install instructions
└── REPORT.md        # Detailed answers for all features
🔗 Git Development Workflow
Each phase was developed in a separate branch
(multifile-build, static-build, dynamic-build, man-pages).

Branches were merged into main after testing.

Annotated tags mark every release:

v0.1.1-multifile – Modular multi-file build

v0.2.1-static – Static library and client

v0.3.1-dynamic – Dynamic library and client

v0.4.1-final – Installation and man pages

A final GitHub Release contains binaries and source for submission.

📦 Key Deliverables
Release Tag	Highlights
v0.1.1	First modular executable build
v0.2.1	Static library (libmyutils.a) + client
v0.3.1	Dynamic library (libmyutils.so) + client
v0.4.1	Final system installation + man pages

🧪 Testing Checklist
After installation, test from any directory:

bash
Copy code
client
man mystrlen
man wordCount
man mygrep
For dynamic linking details:

bash
Copy code
ldd bin/client_dynamic   # Shows linkage to libmyutils.so
💡 Learning Outcomes
Through this assignment, I practiced:

Modular C programming with Makefiles

Creating and linking static and shared libraries

Writing and installing man pages

Using Git branches, merges, tags, and releases to manage development

👤 Author
Aiman Asif
BSDSF22M035 – Operating Systems
📧 aimanasif1230@gmail.com
