Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A52243D1B3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 21:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240789AbhJ0TdY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 15:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhJ0TdX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 15:33:23 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2BCC061570
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 12:30:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id l13so8418518lfg.6
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 12:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Ao/3W5L0Kp625vnVTa+dOtsZauku62ya2EAxHId3dD8=;
        b=fNhjoLCo9b4+W7XYlv6le/GjAbppUo34CONvUkVIFMFjaCq67sHDXAEj/AFpD72MDm
         iZowtBB1S+eYG5acOn4wFSoEsRSwIS5JmdZYskD7M5SSnodF5M2eCPRJThr7t9COqFZT
         Q/+QtFmumekVJKg5dCKZg4yKKdeur/037STlFGAj0CfbSS618+DJ8BahY4U/ijDOE9Y/
         za9M9zpwqeFwmiG9Yqi9P7DN9eKo+wRHb5PNW2L2k/Gh0ixtphzQ+N2bdIEfQbVAUzWj
         gXiIacJ7Xq+c2egvHXAm6pW0R4iKmhIT+l7du+GhlpjEosk7tamT19Yn+dcjJkJIm//i
         nVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Ao/3W5L0Kp625vnVTa+dOtsZauku62ya2EAxHId3dD8=;
        b=7sCrF7MoxmaUmEAmnW3hX0XFJu9oPEX95Xs+PPPdJKalVe5x4mEjqAzsVc6E0C4QgO
         tqdgyQcpK7eBwdA3mHakAS9+ENu269IznKgugu3WFblAQ6LHW5WQI5k5rFXVDRVPyvDE
         qrhGY/qY2wokl69htbsOZakuPwWXPO5YkiAgBAmVCcyvipEV3LSDRCXboaUviN+4j0Eg
         b3fwNtv4e97KvaItKSn2H3pZJd8HNysS1+ZRn3mKD6DY3Xij1DjOD0oooYl0cwwBpdp5
         3WJab3HdDZ3x94H7rSf3owy93EmmvMw+9lINP1TpuQsq5NLgg3meBSxQ+zBBrhwoDjzS
         SOUw==
X-Gm-Message-State: AOAM531xETwpLNfTVlrf8GrPShFp7uErTpMTuKStJNSwEkI/hzt2bJAG
        pN2M/0h1O049GXsGFsCrPFkFp1EQ3RU=
X-Google-Smtp-Source: ABdhPJyjMYWxpHKNELELzOsqIyeN2NS2I9xP2e4XCnoH6BwaOFVwiRTjeikUoS+awo3IozAiASCmBg==
X-Received: by 2002:a19:f806:: with SMTP id a6mr26697593lff.49.1635363055950;
        Wed, 27 Oct 2021 12:30:55 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id m20sm81526lfg.176.2021.10.27.12.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 12:30:55 -0700 (PDT)
Date:   Wed, 27 Oct 2021 21:30:54 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v3 1/3] tools/usbip: add usb event monitor into libusbip
Message-ID: <20211027193054.GA16215@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch implements an usb monitor into libusbip to synchronously wait for usb
events. The api is used in coming patches to allow "usbip bind" to export
device and "usbip attach" to import device, based on udev evens. Example of
api usage:

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

