DESTDIR ?=
PREFIX ?=

PO_FILES = $(shell find locale-langpack/bo_CN/LC_MESSAGES -type f -name "*.po")
MO_FILES = $(PO_FILES:.po=.mo)
TS_FILES = $(shell find . -type f -name "*bo_CN.ts")
QM_FILES = $(TS_FILES:.ts=.qm)

.PHONY: all clean install install-mo install-qm

$(MO_FILES): 
	python3 bin/fmt.py locale-langpack/bo_CN/LC_MESSAGES/

kylin-assistant/translations/kylin-assistant_bo_CN.qm: kylin-assistant/translations/kylin-assistant_bo_CN.ts
	lconvert -i $< -o $@

kylin-ipmsg/translations/kylin-ipmsg_bo_CN.qm: kylin-ipmsg/translations/kylin-ipmsg_bo_CN.ts
	lconvert -i $< -o $@

ukui-biometric-manager/translations/ukui-biometric-manager_bo_CN.qm: ukui-biometric-manager/translations/ukui-biometric-manager_bo_CN.ts
	lconvert -i $< -o $@

kylin-video/translations/kylin-video_bo_CN.qm: kylin-video/translations/kylin-video_bo_CN.ts
	lconvert -i $< -o $@

yhkylin-backup-tools/translations/yhkylin-backup-tools_bo_CN.qm: yhkylin-backup-tools/translations/yhkylin-backup-tools_bo_CN.ts
	lconvert -i $< -o $@

all: $(MO_FILES) $(QM_FILES)

clean:
	rm $(MO_FILES) $(QM_FILES)

install-mo: $(MO_FILES)
	install -d $(DESTDIR)$(PREFIX)/share/locale-langpack/bo_CN/LC_MESSAGES/
	install -m 644 $(MO_FILES) $(DESTDIR)$(PREFIX)/share/locale-langpack/bo_CN/LC_MESSAGES/

install-qm: $(QM_FILES)
	install -d $(DESTDIR)$(PREFIX)/share/kylin-assistant/translations/
	install -m 644 kylin-assistant/translations/kylin-assistant_bo_CN.qm $(DESTDIR)$(PREFIX)/share/kylin-assistant/translations/
	install -d $(DESTDIR)$(PREFIX)/share/kylin-ipmsg/translations/
	install -m 644 kylin-ipmsg/translations/kylin-ipmsg_bo_CN.qm $(DESTDIR)$(PREFIX)/share/kylin-ipmsg/translations/
	install -d $(DESTDIR)$(PREFIX)/share/ukui-biometric-manager/translations/
	install -m 644 ukui-biometric-manager/translations/ukui-biometric-manager_bo_CN.qm $(DESTDIR)$(PREFIX)/share/ukui-biometric-manager/translations/
	install -d $(DESTDIR)$(PREFIX)/share/kylin-video/translations/
	install -m 644 kylin-video/translations/kylin-video_bo_CN.qm $(DESTDIR)$(PREFIX)/share/kylin-video/translations/
	install -d $(DESTDIR)$(PREFIX)/yhkylin-backup-tools/translations/
	install -m 644 yhkylin-backup-tools/translations/yhkylin-backup-tools_bo_CN.qm $(DESTDIR)$(PREFIX)/share/yhkylin-backup-tools/translations/

install: install-mo install-qm
