CC = gcc
CFLAGS = -Wall -Wextra -I../include
BINDIR = ../bin

SRCS = mystrfunctions.c myfilefunctions.c main.c

.PHONY: all clean

all: $(BINDIR)/client

$(BINDIR):
	mkdir -p $(BINDIR)

$(BINDIR)/client: $(SRCS) | $(BINDIR)
	$(CC) $(CFLAGS) $(SRCS) -o $@

clean:
	rm -f $(BINDIR)/client
