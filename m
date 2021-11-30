Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94DC446413B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 23:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbhK3W1j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 17:27:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbhK3W1i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 17:27:38 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58C4C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:24:18 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bi37so57581232lfb.5
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=1H/x1jtS428DpQJ3lNVu6wlNyGJDFqXHOdzCh0Gbpms=;
        b=Fpv7rRggkxsO5BV/buNVMk6jM27hpEQ5BVV6PnEs/0qm9Vay5myLzodAw8eGHBudLx
         V2y05GHGgCAFoakW5fGKjN4G3zqi5/xjPgpq70QYe2P06ucPgJOV84aOO+N3BKGTCr34
         55or8KOJIjxjPUFyuLqpz1rW4aYP6V8UDiwPwej2VqxAdjoppdeVSl9e7SSIPQZUJxKL
         Ymj4ke6OvdRLxMKHz5LdWxJsG7q/waaepbzLIImGs2Qcmvf0J48i7en2nMytGcx3ORXc
         VNaqtJBKXgsHbFUbu2mLeMU+HtNkW1wzJ5bFlvjtCG7BdH2Czk5Gy0b/CccI4w59Mmb/
         rtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=1H/x1jtS428DpQJ3lNVu6wlNyGJDFqXHOdzCh0Gbpms=;
        b=P279XIbv5dmHeWeZyiKtlnxn9CJw4fF97/WfLx9a/q0PC6WphuSRKkWlecfu7iUN2d
         5zH3gmwaM99s8qdVsWxJV9ivvlSr7eOp/O7MPgOxYqEpKkLiSxBal6MLciqJkvyVRyBK
         knp6NGS2pmbyX80tcyXGSHtDw89H8+MlYgUTwvEs0XMWfed8gJck1nw2tXquUE0zU5he
         BQPlOY6CRxDmLEZvu0WF2S8eDrbbk6rqyFgVrZ7lKFyDt+f+sMmI0lqPS98xt5GwqtEg
         3Zk+JBbQloSmpOljaMv9jWw3zIK0vuIVZ7zYyPZ+b8XxtdcgHMCcBn0cYXBNpASlIIns
         FnUg==
X-Gm-Message-State: AOAM531lj5r9mzH+v8s11eqLebnLoxQmFWQ/UbSwqTW19dTIW0U1y3bh
        FiiRZvvYDoi7UYowa+v4SwMmoviWGhY=
X-Google-Smtp-Source: ABdhPJzWSPzgPaKa7U2lKkm0AXlmDIeIqsmXzkX4x1/dFbQYTrWmwptwoFZPtU4XrWowxByD/RSUuw==
X-Received: by 2002:a19:c308:: with SMTP id t8mr1908253lff.621.1638311056775;
        Tue, 30 Nov 2021 14:24:16 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id o1sm1675468ljj.33.2021.11.30.14.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:24:16 -0800 (PST)
Date:   Tue, 30 Nov 2021 23:24:14 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v4 3/5] tools/usbip: add usb event monitor into libusbip
Message-ID: <20211130222414.GA16520@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch implements an usb monitor into libusbip to synchronously wait
for usb events, which is used in coming patches. By hooking this api into
"usb bind" before exporting a device, allows the command to wait for a
device to be plugged in. By hooking this api in after a successful export
allows the command to know when to restart bus monitoring again.

By hooking this api into usbipd at the beginning of an import request,
allows the command "usbip attach" to wait for a device to become exported.
By hooking this api into "usbip attach" right after a successful import,
allows the command to know when to restart remote bus monitoring again.

Example of api usage:

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
v3: Change title and description.
v4: Change description and fix review comments.

Justifications of remaining warnings from "scripts/checkpatch.pl":

* Exception according to Linux kernel coding style 5.a where
  "usbip_monitor_t" is a totally opaque object:

  WARNING: do not add new typedefs
  #199: FILE: tools/usb/usbip/libsrc/usbip_monitor.h:8:
  +typedef struct usbip_monitor usbip_monitor_t;

 tools/usb/usbip/.gitignore             |   1 +
 tools/usb/usbip/libsrc/Makefile.am     |   3 +-
 tools/usb/usbip/libsrc/usbip_common.h  |   1 +
 tools/usb/usbip/libsrc/usbip_monitor.c | 161 +++++++++++++++++++++++++
 tools/usb/usbip/libsrc/usbip_monitor.h |  36 ++++++
 5 files changed, 201 insertions(+), 1 deletion(-)
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
index 000000000000..9facf6aff294
--- /dev/null
+++ b/tools/usb/usbip/libsrc/usbip_monitor.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * Copyright (C) 2021 Lars Gunnarsson <gunnarsson.lars@gmail.com>
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
+			udev_monitor, "usb", "usb_device");
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
+
+	if (monitor) {
+		int fd = udev_monitor_get_fd(monitor->udev_monitor);
+		const int nfds = 1;
+		struct pollfd pollfd[] = { { fd, POLLIN, 0 } };
+		int nfd = poll(pollfd, nfds, monitor->timeout_ms);
+
+		if (nfd)
+			dev = udev_monitor_receive_device(
+				monitor->udev_monitor);
+	}
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
index 000000000000..209bc722529c
--- /dev/null
+++ b/tools/usb/usbip/libsrc/usbip_monitor.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Copyright (C) 2021 Lars Gunnarsson <gunnarsson.lars@gmail.com>
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

