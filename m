Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64166460A38
	for <lists+linux-usb@lfdr.de>; Sun, 28 Nov 2021 22:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358940AbhK1VST (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Nov 2021 16:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359245AbhK1VQR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Nov 2021 16:16:17 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90764C061748
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:13:00 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id l7so30595050lja.2
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=ilqwspEvSwBZfbneVV2WpbR9vZpMTbWiiZ7iEJyGkzE=;
        b=HVree9edYt7HhNPLWcJ8bnFq4nBRtxq4yHyT4Mj8MT6vrVi9SACmi/SdExcyFLBC+z
         o4W4zPLywfpnalhxnDwpsJxPSTw/Cb7HPH9nOP0kvXfh3ycQOJkAtIIi2toX8yZnSImf
         e4SFmlsxHqT4hzyVqA6f59evtdDw1rj/ACxdcmTKz7UxhiMml/+UjxQPlWREHgoslcWG
         IiJKdxwXajRNkcCh78GhjZQq7vK65anVbqYGIH4XlQa3nSQoNvhX0dnQd7l8xWYjL6oy
         rkNv2azrgsz262J1rigDXTxY+psN4DNwx//OMDaWqpFzOUt3xVuWXB+7qdXw0ENNrNdE
         5Kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=ilqwspEvSwBZfbneVV2WpbR9vZpMTbWiiZ7iEJyGkzE=;
        b=fuzciTKIsWUl2NM52ICD0WCHpOoGZLEUmWWOHng+cDlCUbungXEQbSr88pYGHhIA84
         uhjWRfAvGJXfp81D4I2f+wdSmT1r/FmK/QpUKTfHX0iSpj+NLIZLpihT/NbibGit6Ou2
         SZZ2MtrnCUo28arDZX89jG68u+lMwtFI5Wimf5JOT5IHnDAWXWUrfWmok3g2EhjKf9hS
         tEsfjo9QuvXuyH1THKMhD9TJCGSAEUsIVeEBfLzQsXKAIHi6KLCzIfpMCfwmQjWbzqp4
         BtxXBLSDCegz6W3KmwU1lNcvrw3DD74RRgVRHf9Xl6CAqbTd1SwjBXCJliPoFqJyOWJP
         qEAA==
X-Gm-Message-State: AOAM531mGoYNTxIcNEuRHsyh1W+U7MukBl3IWlWo2l+BeKWJfzk2p41L
        eg0eCEdBiQ/omyR00y3keww=
X-Google-Smtp-Source: ABdhPJyUSFp8qxsSMhfnii1LnaEXWzXiVCU9u1ubocMR1Kv/2dh5WKnyV+1LnY1egSqWS7826WSEfA==
X-Received: by 2002:a2e:5816:: with SMTP id m22mr36975216ljb.347.1638133978873;
        Sun, 28 Nov 2021 13:12:58 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id r3sm1110150lfc.169.2021.11.28.13.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:12:58 -0800 (PST)
Date:   Sun, 28 Nov 2021 22:12:57 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v4 3/5] tools/usbip: add usb event monitor into libusbip
Message-ID: <20211128211257.GA37401@dell-precision-T3610>
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

