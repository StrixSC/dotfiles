TARGET_NAME=xkbmon

xkb-layout-mon:
	$(CC) -Wall -Wextra -O2 -std=c11 -D_POSIX_C_SOURCE=200112L -D_XOPEN_SOURCE=600 -lutil `pkg-config --libs --cflags x11` -o $(TARGET_NAME) xkbmon.c

clean:
	rm -f $(TARGET_NAME)

install:
	cp $(TARGET_NAME) /usr/local/bin/$(TARGET_NAME)

uninstall:
	rm /usr/local/bin/$(TARGET_NAME)
