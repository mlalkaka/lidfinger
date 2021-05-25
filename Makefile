
install:
	mkdir -p /etc/acpi/events
	cp acpi-lid-event /etc/acpi/events/lid
	mkdir -p /etc/acpi/actions
	cp toggle-fprint-auth.sh /etc/acpi/actions
	chmod +x /etc/acpi/actions/toggle-fprint-auth.sh
	pkill --signal SIGHUP --full /usr/sbin/acpid

uninstall:
	rm -f /etc/acpi/events/lid
	rm -f /etc/acpi/actions/toggle-fprint-auth.sh
	rmdir /etc/acpi/actions --ignore-fail-on-non-empty
	pkill --signal SIGHUP --full /usr/sbin/acpid
