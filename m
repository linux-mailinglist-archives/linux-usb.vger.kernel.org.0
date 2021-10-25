Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90BE43A467
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 22:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238302AbhJYUY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 16:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234784AbhJYUYw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 16:24:52 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E36DC061235
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 13:06:19 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s19so11389172ljj.11
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Ig1GCYbIg39Pd8FwpsqdMUZmIWBhojlLu+bmwd2SsfA=;
        b=PsU7mXvgw3EchF9dJ/XGiBtJjcJbmYTkAS/nutgztb1QkyyK5aHdNlFe91tIZhlbuT
         aytE4ooggt9aMGHUW9mxABHvDYaLOAXQYOO35jSdE80IKqir9Qb2ok9bOsU/fNQURpNv
         e9dwBOytLWD5VqVXxtUNaHyxWLUJG2wuolrklgFgoL0jhhCXUNszV+FgyhuzKpU8d1aj
         BYhu9n0itpvGB4w7n9qYeVtTsehIZ6kf1yR/hBfCofoo1r6i0E2rN0SYXIdWhoLox4C/
         bRKVpnZeKTxS090Zx273x4e+YHhpgWdyrP7R4QgrD15W825zLgdhXWusW2XUuM5S2dLL
         dJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Ig1GCYbIg39Pd8FwpsqdMUZmIWBhojlLu+bmwd2SsfA=;
        b=Mb7Dywmn9y7EUizm5DYYdMlmE3WSSbUbX2JONmGaNTr8rw3jofFc7ZYKeAm5UA37GS
         +OwLZEtpcq+9/PrTh7CitJ+DnDxxuYSnZGoXNYLK8aijCnleyZXY5lKp9Tin3GkP5miO
         HktVasPmjsjSW20OWFmVFavwkUOTJXli+ZzGRQFg5fPH01TzTth3vnQpTeIwgAG+HlNu
         LzxGa6UY5UoDvwgzaLKexlwcBI3DkOuhOWSq6EE6wrv4SQ7AeaecoCuDCD6SZNKQd4y8
         56U6QF4XFmMrGvsyn8Pp5+Y455ILxWy4sVOBHRX9TwoxwIjXLTubkHVxK6phevcKSuJ9
         NLjQ==
X-Gm-Message-State: AOAM530TUHDN14nxMeZSua8HjcrN+KcLkyEeeczF8+fR1GsB3/4lvLPD
        XSfK778pU2GyBNdRtT1HOWf/Zlun7tA=
X-Google-Smtp-Source: ABdhPJx1AGPBdStlzEQu3SmppAWXuTNBfPVeCMNrfWHWyt8ezwCX8OoMxm3QBCVZLhT42jnelFvsIQ==
X-Received: by 2002:a2e:a5c9:: with SMTP id n9mr20863996ljp.512.1635192377931;
        Mon, 25 Oct 2021 13:06:17 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id i10sm1730465lfu.272.2021.10.25.13.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 13:06:17 -0700 (PDT)
Date:   Mon, 25 Oct 2021 22:06:15 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/3] tools/usbip: persistently forward USB devices on a
 given bus
Message-ID: <20211025200615.GA14140@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To forward a remote usb device over usbip the following steps is required:

1. Execute "usbip bind" on remote end.
2. Execute "usbip attach" on local end.

These steps must be perfomed in above order and after usb device is plugged in.
If the usb device is unplugged on the remote end the steps above needs to be
performed again to establish the connection. This patch set implements a feature
to persistently forward devices on a given bus. When using flag "-p|--persistent"
on remot end, the USB device becomes exported when plugged in. When using flag
"-p|--persistent" on local end, the USB device becomes imported when available
on remote end. Thus it is only required to run the usbip command once on each
end, in any order, to persistently forward usb devices on a given bus.

This patch implements an usb monitor into libusbip to synchronously wait for usb
events. This api is used in coming patches to implement the feature decribed
above. Example:

// wait for an usb divce to be plugged in:
usbip_monitor_t *monitor = usbip_monitor_new();
usbip_monitor_set_busid(monitor, "3-3.1.2.3");
usbip_monitor_await_usb_bind(monitor, "usb");  // this is a blocking call
// usb device with busid 3-3.1.2.3 is now bound to driver "usb".
usbip_monitor_delete(monitor);

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v2: Change title, fix style warnings, improve feature description, add timeout
    into usbip_monitor.

Justifications of remaining warnings from "scripts/checkpatch.pl":

* Exception according to Linux kernel coding style 5.a where
  "usbip_monitor_t" is a totally opaque object:

  WARNING: do not add new typedefs
  #199: FILE: tools/usb/usbip/libsrc/usbip_monitor.h:8:
  +typedef struct usbip_monitor usbip_monitor_t;

 tools/usb/usbip/.gitignore             |   1 +
 tools/usb/usbip/libsrc/Makefile.am     |   3 +-
 tools/usb/usbip/libsrc/usbip_common.h  |   1 +
 tools/usb/usbip/libsrc/usbip_monitor.c | 159 +++++++++++++++++++++++++
 tools/usb/usbip/libsrc/usbip_monitor.h |  36 ++++++
 5 files changed, 199 insertions(+), 1 deletion(-)
 create mode 100644 tools/usb/usbip/libsrc/usbip_monitor.c
 create mode 100644 tools/usb/usbip/libsrc/usbip_monitor.h

diff --git a/tools/usb/usbip/.gitignore b/tools/usb/usbip/.gitignore
index 597361a96dbb..6304adefb5e1 100644
--- a/tools/usb/usbip/.gitignore
+++ b/tools/usb/usbip/.gitignore
@@ -28,6 +28,7 @@ libsrc/libusbip_la-usbip_common.lo
 libsrc/libusbip_la-usbip_device_driver.lo
 libsrc/libusbip_la-usbip_host_common.lo
 libsrc/libusbip_la-usbip_host_driver.lo
+libsrc/libusbip_la-usbip_monitor.lo
 libsrc/libusbip_la-vhci_driver.lo
 src/usbip
 src/usbipd
diff --git a/tools/usb/usbip/libsrc/Makefile.am b/tools/usb/usbip/libsrc/Makefile.am
index dabd2c91d311..3e31e33729cf 100644
--- a/tools/usb/usbip/libsrc/Makefile.am
+++ b/tools/usb/usbip/libsrc/Makefile.am
@@ -8,4 +8,5 @@ libusbip_la_SOURCES := names.c names.h usbip_host_driver.c usbip_host_driver.h \
 		       usbip_device_driver.c usbip_device_driver.h \
 		       usbip_common.c usbip_common.h usbip_host_common.h \
 		       usbip_host_common.c vhci_driver.c vhci_driver.h \
-		       sysfs_utils.c sysfs_utils.h
+		       sysfs_utils.c sysfs_utils.h \
+		       usbip_monitor.c
diff --git a/tools/usb/usbip/libsrc/usbip_common.h b/tools/usb/usbip/libsrc/usbip_common.h
index 73a367a7fa10..13f1d4ca47c5 100644
--- a/tools/usb/usbip/libsrc/usbip_common.h
+++ b/tools/usb/usbip/libsrc/usbip_common.h
@@ -30,6 +30,7 @@
 
 /* kernel module names */
 #define USBIP_CORE_MOD_NAME	"usbip-core"
+#define USBIP_USB_DRV_NAME	"usb"
 #define USBIP_HOST_DRV_NAME	"usbip-host"
 #define USBIP_DEVICE_DRV_NAME	"usbip-vudc"
 #define USBIP_VHCI_DRV_NAME	"vhci_hcd"
diff --git a/tools/usb/usbip/libsrc/usbip_monitor.c b/tools/usb/usbip/libsrc/usbip_monitor.c
new file mode 100644
index 000000000000..ce60069d86ca
--- /dev/null
+++ b/tools/usb/usbip/libsrc/usbip_monitor.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Copyright (C) 2021 Lars Gunnarsson
+ */
+#include <libudev.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/poll.h>
+
+#include "usbip_monitor.h"
+
+struct usbip_monitor {
+	const char *busid;
+	int timeout_ms;
+	struct udev *udev;
+	struct udev_monitor *udev_monitor;
+};
+
+usbip_monitor_t *usbip_monitor_new(void)
+{
+	usbip_monitor_t *monitor = NULL;
+	struct udev *udev = udev_new();
+
+	if (udev) {
+		struct udev_monitor *udev_monitor =
+			udev_monitor_new_from_netlink(udev, "udev");
+		udev_monitor_filter_add_match_subsystem_devtype(
+			udev_monitor,
+			/*subsystem=*/"usb",
+			/*devtype=*/"usb_device");
+		udev_monitor_enable_receiving(udev_monitor);
+		monitor = malloc(sizeof(struct usbip_monitor));
+		monitor->busid = NULL;
+		monitor->timeout_ms = -1;
+		monitor->udev = udev;
+		monitor->udev_monitor = udev_monitor;
+	}
+	return monitor;
+}
+
+void usbip_monitor_delete(usbip_monitor_t *monitor)
+{
+	if (monitor) {
+		udev_monitor_unref(monitor->udev_monitor);
+		udev_unref(monitor->udev);
+		free(monitor);
+	}
+}
+
+void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid)
+{
+	monitor->busid = busid;
+}
+
+void usbip_monitor_set_timeout(usbip_monitor_t *monitor, int milliseconds)
+{
+	monitor->timeout_ms = milliseconds;
+}
+
+static struct udev_device *await_udev_event(const usbip_monitor_t *monitor)
+{
+	struct udev_device *dev = NULL;
+	int fd = udev_monitor_get_fd(monitor->udev_monitor);
+	const int nfds = 1;
+	struct pollfd pollfd[] = { { fd, POLLIN, 0 } };
+	int nfd = poll(pollfd, nfds, monitor->timeout_ms);
+
+	if (nfd)
+		dev = udev_monitor_receive_device(monitor->udev_monitor);
+	return dev;
+}
+
+static int optional_filter_busid(const char *busid, const char *udev_busid)
+{
+	int filter_match = 0;
+
+	if (busid) {
+		if (strcmp(busid, udev_busid) == 0)
+			filter_match = 1;
+	} else {
+		filter_match = 1;
+	}
+	return filter_match;
+}
+
+static bool await_usb_with_driver(const usbip_monitor_t *monitor,
+				  const char *driver, const char *action)
+{
+	bool event_occured = false;
+
+	while (!event_occured) {
+		struct udev_device *dev = await_udev_event(monitor);
+
+		if (dev) {
+			const char *udev_action = udev_device_get_action(dev);
+			const char *udev_driver = udev_device_get_driver(dev);
+			const char *udev_busid = udev_device_get_sysname(dev);
+
+			if (strcmp(udev_action, action) == 0 &&
+			    strcmp(udev_driver, driver) == 0) {
+				if (optional_filter_busid(monitor->busid,
+							  udev_busid)) {
+					event_occured = true;
+				}
+			}
+			udev_device_unref(dev);
+		} else {
+			break;
+		}
+	}
+	return event_occured;
+}
+
+bool usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
+				 const char *driver)
+{
+	return await_usb_with_driver(monitor, driver, "add");
+}
+
+bool usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
+				  const char *driver)
+{
+	return await_usb_with_driver(monitor, driver, "bind");
+}
+
+static bool await_usb(const usbip_monitor_t *monitor, const char *action)
+{
+	bool event_occured = false;
+
+	while (!event_occured) {
+		struct udev_device *dev = await_udev_event(monitor);
+
+		if (dev) {
+			const char *udev_action = udev_device_get_action(dev);
+			const char *udev_busid = udev_device_get_sysname(dev);
+
+			if (strcmp(udev_action, action) == 0) {
+				if (optional_filter_busid(monitor->busid,
+							  udev_busid)) {
+					event_occured = true;
+				}
+			}
+			udev_device_unref(dev);
+		} else {
+			break;
+		}
+	}
+	return event_occured;
+}
+
+bool usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor)
+{
+	return await_usb(monitor, "unbind");
+}
+
+bool usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor)
+{
+	return await_usb(monitor, "delete");
+}
diff --git a/tools/usb/usbip/libsrc/usbip_monitor.h b/tools/usb/usbip/libsrc/usbip_monitor.h
new file mode 100644
index 000000000000..750abb6b79e0
--- /dev/null
+++ b/tools/usb/usbip/libsrc/usbip_monitor.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Copyright (C) 2021 Lars Gunnarsson
+ */
+#ifndef __USBIP_MONITOR_H
+#define __USBIP_MONITOR_H
+
+#include <stdbool.h>
+
+typedef struct usbip_monitor usbip_monitor_t;
+
+usbip_monitor_t *usbip_monitor_new(void);
+void usbip_monitor_delete(usbip_monitor_t *monitor);
+
+/**
+ * Set busid to await events on. If unset, any busid will be matched.
+ */
+void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid);
+
+/**
+ * Set timeout for await calls in milliseconds, default is no timeout (-1).
+ */
+void usbip_monitor_set_timeout(usbip_monitor_t *monitor, int milliseconds);
+
+/**
+ * Functions below is blocking. Returns true if event occurred, or false on
+ * timeouts.
+ */
+bool usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
+				 const char *driver);
+bool usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
+				  const char *driver);
+bool usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor);
+bool usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor);
+
+#endif /* __USBIP_MONITOR_H */
-- 
2.25.1

