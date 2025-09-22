CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
BINDIR = bin
LIBDIR = lib
OBJDIR = obj
SRCDIR = src

SRCS = $(wildcard $(SRCDIR)/*.c)
LIB_SRCS = $(filter-out $(SRCDIR)/main.c,$(SRCS))
LIB_OBJS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(LIB_SRCS))
MAIN_OBJ = $(OBJDIR)/main.o

.PHONY: all clean static dynamic

all: $(BINDIR)/client

# Old build (direct executable)
$(BINDIR)/client: $(SRCS) | $(BINDIR)
	$(CC) $(CFLAGS) $(SRCS) -o $@

# Static build (from Feature-3)
static: $(BINDIR)/client_static

$(LIBDIR)/libmyutils.a: $(LIB_OBJS) | $(LIBDIR)
	ar rcs $@ $(LIB_OBJS)
	ranlib $@

$(BINDIR)/client_static: $(MAIN_OBJ) $(LIBDIR)/libmyutils.a | $(BINDIR)
	$(CC) $(CFLAGS) $(MAIN_OBJ) -L$(LIBDIR) -lmyutils -o $@

# Dynamic build (Feature-4)
dynamic: $(BINDIR)/client_dynamic

$(LIBDIR)/libmyutils.so: $(LIB_OBJS) | $(LIBDIR)
	$(CC) -shared -fPIC -o $@ $(LIB_OBJS)

$(BINDIR)/client_dynamic: $(MAIN_OBJ) $(LIBDIR)/libmyutils.so | $(BINDIR)
	$(CC) $(CFLAGS) $(MAIN_OBJ) -L$(LIBDIR) -lmyutils -o $@

# Compile any src/*.c into obj/*.o
$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

$(BINDIR) $(LIBDIR) $(OBJDIR):
	mkdir -p $@

clean:
	rm -rf $(BINDIR)/* $(LIBDIR)/* $(OBJDIR)/*

