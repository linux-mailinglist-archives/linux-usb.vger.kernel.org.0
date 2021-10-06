Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFA9424835
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 22:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbhJFUuO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 16:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbhJFUuO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Oct 2021 16:50:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775FEC061746
        for <linux-usb@vger.kernel.org>; Wed,  6 Oct 2021 13:48:21 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i24so14834005lfj.13
        for <linux-usb@vger.kernel.org>; Wed, 06 Oct 2021 13:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=VjMtzGOYYjQIwnMhJyK19VUVF7Q5R7cDJVjB8weQH1Q=;
        b=KKCM62tQVj07D4H/2nrpp8DBNte7Iabq5agkmtTpSeftrQH0by1El7XN98YLkzBmzW
         TC16pLm5IIxT++IrwgvIoGszEafO0AAhjxn1HXyO1CWYxJH+9TQ8osmyORPsdKjAjKtv
         gOAnn+shqQAVRCvzHEPyYXakuzmkiaeat2k5Zjfsltir4RAla8u0NzKUhWnHWuvis/BL
         oLrydsASJXRLkuETAb36yhfANos3Y5zvx57sQvdM89PCzDBN5FEooc3Jn8vkGbo5d3BT
         livde0FyT+sB1PMPOoLz25bwXDcctKwr0Ihu41B9npuaEl8ZWSpp3zPi3io/KjN37UwD
         ocCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=VjMtzGOYYjQIwnMhJyK19VUVF7Q5R7cDJVjB8weQH1Q=;
        b=PaPSPR6mz/ncEILCYZp1tCb+1shZvAZd+uiy6CCOC4LOzW+hU4d4391KVfhapDyY/P
         eCTXXO4Lt9ViOwcGH5FTDksE1lfz77bCFMhz/cTw7RKNWFt2/R+5N1P58H6IVvrHxu29
         ODvn98tJxFkcaaGk6a6sq0qWkWHenc3CJRJpvFzXciV4SknhBDzlX2/eaOUbzV47MOOt
         87nJSof70R/vCccz9pQgkaHxOpB6Jp/nqow1fsQdihS5bm+IAE+6otVbR0iyAZRWOAB4
         PcjTZlpgFF+n2cF8wwyAGC0fbNicCjnTawwekIJoJerQnBqx8wdxVRb8CYNGZ6zeSM3u
         kAhQ==
X-Gm-Message-State: AOAM530KH9trlXIDpaoQfENOrjAd/pziDlDLQ5j/6Kzd6l2szPOF85EI
        gYgeOpWr/zDc3C8yCBdAdig=
X-Google-Smtp-Source: ABdhPJxPj+tG5kWUqipYOUU4sqZB2/3T4LN+hUFKGd6yNw/aYGgN+BV0zsqwZvEPf3qq/mHg4X7dPw==
X-Received: by 2002:a2e:3907:: with SMTP id g7mr216477lja.285.1633553299728;
        Wed, 06 Oct 2021 13:48:19 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id m2sm2390570ljj.70.2021.10.06.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:48:19 -0700 (PDT)
Date:   Wed, 6 Oct 2021 22:48:17 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v1 1/3] tools/usbip: support use case reconnect: prepare
Message-ID: <20211006204817.GA43927@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch implements an usb monitor into libusbip to await usb events,
example connect and disconnect.

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
 tools/usb/usbip/.gitignore             |   1 +
 tools/usb/usbip/libsrc/Makefile.am     |   3 +-
 tools/usb/usbip/libsrc/usbip_common.h  |   1 +
 tools/usb/usbip/libsrc/usbip_monitor.c | 147 +++++++++++++++++++++++++
 tools/usb/usbip/libsrc/usbip_monitor.h |  21 ++++
 5 files changed, 172 insertions(+), 1 deletion(-)
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
index 000000000000..731d344f2965
--- /dev/null
+++ b/tools/usb/usbip/libsrc/usbip_monitor.c
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+static const size_t MAX_STRLEN = 32;
+
+struct usbip_monitor {
+	const char *busid;
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
+static struct udev_device *await_udev_event(const usbip_monitor_t *monitor)
+{
+	struct udev_device *dev = NULL;
+	int fd = udev_monitor_get_fd(monitor->udev_monitor);
+	const int timeout = -1;
+	const int nfds = 1; // number of file descriptors
+	struct pollfd pollfd[] = { { fd, POLLIN, 0 } };
+	int nfd = poll(pollfd, nfds, timeout);
+
+	if (nfd) {
+		dev = udev_monitor_receive_device(monitor->udev_monitor);
+	}
+	return dev;
+}
+
+static int optional_filter_busid(const char *busid, const char *udev_busid)
+{
+	int filter_match = 0;
+
+	if (busid) {
+		if (strncmp(busid, udev_busid, MAX_STRLEN) == 0) {
+			filter_match = 1;
+		}
+	} else {
+		filter_match = 1;
+	}
+	return filter_match;
+}
+
+static void await_usb_with_driver(const usbip_monitor_t *monitor,
+				  const char *driver, const char *action)
+{
+	while (1) {
+		struct udev_device *dev = await_udev_event(monitor);
+
+		if (dev) {
+			const char *udev_action = udev_device_get_action(dev);
+			const char *udev_driver = udev_device_get_driver(dev);
+			const char *udev_busid = udev_device_get_sysname(dev);
+
+			if (strncmp(udev_action, action, MAX_STRLEN) == 0 &&
+			    strncmp(udev_driver, driver, MAX_STRLEN) == 0) {
+				if (optional_filter_busid(monitor->busid,
+							  udev_busid)) {
+					break;
+				}
+			}
+			udev_device_unref(dev);
+		}
+	}
+}
+
+void usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
+				 const char *driver)
+{
+	await_usb_with_driver(monitor, driver, "add");
+}
+
+void usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
+				  const char *driver)
+{
+	await_usb_with_driver(monitor, driver, "bind");
+}
+
+static void await_usb(const usbip_monitor_t *monitor, const char *action)
+{
+	while (1) {
+		struct udev_device *dev = await_udev_event(monitor);
+
+		if (dev) {
+			const char *udev_action = udev_device_get_action(dev);
+			const char *udev_busid = udev_device_get_sysname(dev);
+
+			if (strncmp(udev_action, action, MAX_STRLEN) == 0) {
+				if (optional_filter_busid(monitor->busid,
+							  udev_busid)) {
+					break;
+				}
+			}
+			udev_device_unref(dev);
+		}
+	}
+}
+
+void usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor)
+{
+	await_usb(monitor, "unbind");
+}
+
+void usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor)
+{
+	await_usb(monitor, "delete");
+}
diff --git a/tools/usb/usbip/libsrc/usbip_monitor.h b/tools/usb/usbip/libsrc/usbip_monitor.h
new file mode 100644
index 000000000000..474b95c80452
--- /dev/null
+++ b/tools/usb/usbip/libsrc/usbip_monitor.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Copyright (C) 2021 Lars Gunnarsson
+ */
+#ifndef __USBIP_MONITOR_H
+#define __USBIP_MONITOR_H
+
+typedef struct usbip_monitor usbip_monitor_t;
+
+usbip_monitor_t *usbip_monitor_new(void);
+void usbip_monitor_delete(usbip_monitor_t *monitor);
+
+void usbip_monitor_set_busid(usbip_monitor_t *monitor, const char *busid);
+void usbip_monitor_await_usb_add(const usbip_monitor_t *monitor,
+				 const char *driver);
+void usbip_monitor_await_usb_bind(const usbip_monitor_t *monitor,
+				  const char *driver);
+void usbip_monitor_await_usb_unbind(const usbip_monitor_t *monitor);
+void usbip_monitor_await_usb_delete(const usbip_monitor_t *monitor);
+
+#endif /* __USBIP_MONITOR_H */
-- 
2.25.1

