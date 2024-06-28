.PHONY: build install clean

build:
	wget https://www.hdsentinel.com/hdslin/hdsentinel_gui64bit.tar.xz -P ./
	tar -xf ./hdsentinel_gui64bit.tar.xz -C ./
	unzip ./HDSentinel_GUI/HDSentinel_GUI.zip -d ./

install:
	mkdir -p $(DESTDIR)/usr/bin $(DESTDIR)/usr/share/icons $(DESTDIR)/usr/share/applications
	cp ./HDSentinel_GUI/HDSentinel_GUI.ico $(DESTDIR)/usr/share/icons
	chmod 444 $(DESTDIR)/usr/share/icons/HDSentinel_GUI.ico
	cp ./HDSentinel_GUI/HDSentinel_GUI $(DESTDIR)/usr/bin
	cp ./HDSentinel_GUI/HDSentinel $(DESTDIR)/usr/bin
	chmod a+rwx $(DESTDIR)/usr/bin/HDSentinel_GUI
	chmod a+rwx $(DESTDIR)/usr/bin/HDSentinel
	sed -i 's|Exec=/usr/share/bin/HDSentinel_GUI|Exec=/usr/bin/HDSentinel_GUI|' ./HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop
	sed -i 's|Icon=/usr/share/icons/HDSentinel_GUI.ico|Icon=/usr/share/icons/HDSentinel_GUI.ico|' ./HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop
	sed -i 's|Path=/usr/share/bin/|Path=/usr/bin/|' ./HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop
	cp ./HDSentinel_GUI/Hard_Disk_Sentinel_GUI.desktop $(DESTDIR)/usr/share/applications
	chmod a+rwx $(DESTDIR)/usr/share/applications/Hard_Disk_Sentinel_GUI.desktop

clean:
	-if [ -f ./hdsentinel_gui64bit.tar.xz ]; then rm ./hdsentinel_gui64bit.tar.xz; fi
	-if [ -d ./HDSentinel_GUI ]; then rm -r ./HDSentinel_GUI; fi
	-if [ -f $(DESTDIR)/usr/share/icons/HDSentinel_GUI.ico ]; then rm $(DESTDIR)/usr/share/icons/HDSentinel_GUI.ico; fi
	-if [ -f $(DESTDIR)/usr/bin/HDSentinel_GUI ]; then rm $(DESTDIR)/usr/bin/HDSentinel_GUI; fi
	-if [ -f $(DESTDIR)/usr/bin/HDSentinel ]; then rm $(DESTDIR)/usr/bin/HDSentinel; fi
	-if [ -f $(DESTDIR)/usr/bin/report.xml ]; then rm $(DESTDIR)/usr/bin/report.xml; fi
	-if [ -f $(DESTDIR)/usr/bin/report.html ]; then rm $(DESTDIR)/usr/bin/report.html; fi
	-if [ -f $(DESTDIR)/usr/bin/report.xml.bak ]; then rm $(DESTDIR)/usr/bin/report.xml.bak; fi
	-if [ -f $(DESTDIR)/usr/share/applications/Hard_Disk_Sentinel_GUI.desktop ]; then rm $(DESTDIR)/usr/share/applications/Hard_Disk_Sentinel_GUI.desktop; fi
