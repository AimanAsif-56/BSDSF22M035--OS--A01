.PHONY: install uninstall

install:
	@echo "Installing client and man pages..."
	sudo install -Dm755 bin/client_dynamic /usr/local/bin/client
	sudo mkdir -p /usr/local/share/man/man3
	sudo install -m644 man/man3/* /usr/local/share/man/man3/
	sudo gzip -f /usr/local/share/man/man3/*.3
	sudo mandb
	@echo "Installation complete. Run 'client' or 'man mystrlen'."

uninstall:
	@echo "Uninstalling client and man pages..."
	sudo rm -f /usr/local/bin/client
	sudo rm -f /usr/local/share/man/man3/*.3.gz
	sudo mandb
	@echo "Uninstall complete."


