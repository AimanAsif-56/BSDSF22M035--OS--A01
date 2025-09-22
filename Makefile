CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
BINDIR = bin
LIBDIR = lib
OBJDIR = obj
SRCDIR = src

# all source files in src/
SRCS = $(wildcard $(SRCDIR)/*.c)
# library sources = all except main.c
LIB_SRCS = $(filter-out $(SRCDIR)/main.c,$(SRCS))
LIB_OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(LIB_SRCS))
MAIN_OBJ = $(OBJDIR)/main.o

.PHONY: all clean static

all: $(BINDIR)/client

# original directly-compiled client (keeps previous behaviour)
$(BINDIR)/client: $(SRCS) | $(BINDIR)
	$(CC) $(CFLAGS) $(SRCS) -o $@

# Static workflow
static: $(BINDIR)/client_static

# Create static archive from library object files
$(LIBDIR)/libmyutils.a: $(LIB_OBJS) | $(LIBDIR)
	ar rcs $@ $(LIB_OBJS)
	ranlib $@

# Build client_static by linking main.o with the static library
$(BINDIR)/client_static: $(MAIN_OBJ) $(LIBDIR)/libmyutils.a | $(BINDIR)
	$(CC) $(CFLAGS) $(MAIN_OBJ) -L$(LIBDIR) -lmyutils -o $@

# Compile any src/*.c into obj/*.o
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Ensure directories exist
$(BINDIR) $(LIBDIR) $(OBJDIR):
	mkdir -p $@

clean:
	rm -rf $(BINDIR)/* $(LIBDIR)/* $(OBJDIR)/*
