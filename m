Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017F443D1B5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 21:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243692AbhJ0TeG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 15:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbhJ0TeD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 15:34:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17AFC061570
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 12:31:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c28so8321641lfv.13
        for <linux-usb@vger.kernel.org>; Wed, 27 Oct 2021 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Sn1WZ+HJPyaIv3voWrkSjduXy30KtBosMFrZAiPwj4U=;
        b=YmabGAGuKbS3PhZD6BLis/qbz99VKaredEdWDb8qIKMj9DD591z1QVjPJUoWN54bhE
         R31ifkmUhFN3vude+8jptzudjoVF/7N/+sAhQshM3sYLHJca4WDpMVfUvcH0kS1FQJnm
         GYOvlUzT5q/bFkCjrWcks95NdAcT9vI+J/smEMKXeuavL/F1T8Wl4gg/BkfXTv5miASY
         85YJR01eWnX/2IQKAci2YTqSEZBeBxu6MeIFFLDymn+0F+6mQJn21Uh830+5Br9DSaW1
         xf3EDWlx8CflIceCNoQ/pGhjY40d2/2cDDWmQW1yOB0Z+hCo8Ll5ouZQjI/4n8pthfaz
         ln0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Sn1WZ+HJPyaIv3voWrkSjduXy30KtBosMFrZAiPwj4U=;
        b=mKhuzOFW+fyteOOGusSojFzIdl42shozdI5E3M8LYPatVS2gEdHQ8zhZatOIBoWeHj
         IOYLmKMGouvV1MPWmabUlVnBMDOurqSoOVRyDOLPonxTdKB8tR4K021lOhi1qRSQE6d0
         otbbwBVczBCxUlC0eSfTcvG9jBRH7YE8I7PR+ZWmSCq4afO+VYNYp9Z204JGs8MHyunJ
         Ff016/LLdxR0RkfvDXjcqjyOGsAgi/JTYvIMt+tmyR2rrBomm5e4kxZz6N+QtRWC9jMN
         4WOIoADrzkoQdhyalAMScpBdKCADcsIhdSflxgJXFv//6S2zwZwaRRrUkPsWIfjEz+yU
         Udjw==
X-Gm-Message-State: AOAM530JhphAG7kGwSp6wfFI+o2eEPcLF1Yg8O5VxlzOgHK8ti9uMuL1
        zRXCyI/R0E1WUN8g4tEq5P2dZf2qz90=
X-Google-Smtp-Source: ABdhPJxjDH6oYH4gsrYohOYD0xkL2bu3POBj23k+YTxxZfEQhN/kYErARqmDI5+Z3m6Lpi/GuyeMzQ==
X-Received: by 2002:a05:6512:b1f:: with SMTP id w31mr31266239lfu.164.1635363095951;
        Wed, 27 Oct 2021 12:31:35 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id a16sm80041lfu.274.2021.10.27.12.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 12:31:35 -0700 (PDT)
Date:   Wed, 27 Oct 2021 21:31:34 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v3 2/3] tools/usbip: export USB devices on a given bus
 persistently
Message-ID: <20211027193134.GA16336@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch extends the command "usbip bind" with flag "-p|--persistent". When
this flag is used, devices on a given busid becomes exported when plugged in,
instead of returning an error if the device is not available. When the usb
device is unplugged, it will start monitor the bus again.

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v2: Change title, fix style warnings, improve feature description, refactor
    cmdline flag usage.
v3: Change title and description.

 Documentation/usb/usbip_protocol.rst |   5 ++
 tools/usb/usbip/src/usbip_bind.c     | 114 +++++++++++++++++++++------
 2 files changed, 94 insertions(+), 25 deletions(-)

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index 0b8541fda4d8..2ed7d97278e8 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -9,6 +9,11 @@ The USB/IP protocol follows a server/client architecture. The server exports the
 USB devices and the clients import them. The device driver for the exported
 USB device runs on the client machine.

+Initially the server may choose to export any of its available USB devices,
+based on the busid. The device will remain exported until it's unplugged or
+unbound from the usbip driver. It is also possible to persistently export
+devices on a given bus by monitor when they are plugged in.
+
 The client may ask for the list of the exported USB devices. To get the list the
 client opens a TCP/IP connection to the server, and sends an OP_REQ_DEVLIST
 packet on top of the TCP/IP connection (so the actual OP_REQ_DEVLIST may be sent
diff --git a/tools/usb/usbip/src/usbip_bind.c b/tools/usb/usbip/src/usbip_bind.c
index f1cf9225a69c..fd4ccbfce6c6 100644
--- a/tools/usb/usbip/src/usbip_bind.c
+++ b/tools/usb/usbip/src/usbip_bind.c
@@ -8,12 +8,14 @@

 #include <errno.h>
 #include <stdio.h>
+#include <stdbool.h>
 #include <stdlib.h>
 #include <string.h>

 #include <getopt.h>

 #include "usbip_common.h"
+#include "usbip_monitor.h"
 #include "utils.h"
 #include "usbip.h"
 #include "sysfs_utils.h"
@@ -24,10 +26,17 @@ enum unbind_status {
 	UNBIND_ST_FAILED
 };

+struct bind_options {
+	char *busid;
+	bool is_persistent;
+};
+
 static const char usbip_bind_usage_string[] =
 	"usbip bind <args>\n"
-	"    -b, --busid=<busid>    Bind " USBIP_HOST_DRV_NAME ".ko to device "
-	"on <busid>\n";
+	"    -b, --busid=<busid>        Bind " USBIP_HOST_DRV_NAME ".ko to device\n"
+	"                               on <busid>\n"
+	"    -p, --persistent           Persistently monitor the given bus and\n"
+	"                               export USB devices plugged in\n";

 void usbip_bind_usage(void)
 {
@@ -127,29 +136,26 @@ static int unbind_other(char *busid)
 	return status;
 }

-static int bind_device(char *busid)
+static const char *get_device_devpath(char *busid)
 {
-	int rc;
-	struct udev *udev;
-	struct udev_device *dev;
-	const char *devpath;
+	struct udev *udev = udev_new();
+	const char *devpath = NULL;
+	struct udev_device *dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);

-	/* Check whether the device with this bus ID exists. */
-	udev = udev_new();
-	dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);
-	if (!dev) {
-		err("device with the specified bus ID does not exist");
-		return -1;
-	}
-	devpath = udev_device_get_devpath(dev);
+	if (dev)
+		devpath = udev_device_get_devpath(dev);
 	udev_unref(udev);
+	return devpath;
+}

-	/* If the device is already attached to vhci_hcd - bail out */
-	if (strstr(devpath, USBIP_VHCI_DRV_NAME)) {
-		err("bind loop detected: device: %s is attached to %s\n",
-		    devpath, USBIP_VHCI_DRV_NAME);
-		return -1;
-	}
+static bool is_usb_connected(char *busid)
+{
+	return get_device_devpath(busid) != NULL;
+}
+
+static int bind_available_device(char *busid)
+{
+	int rc;

 	rc = unbind_other(busid);
 	if (rc == UNBIND_ST_FAILED) {
@@ -174,36 +180,94 @@ static int bind_device(char *busid)
 		return -1;
 	}

-	info("bind device on busid %s: complete", busid);
+	info("device on busid %s: bind complete", busid);

 	return 0;
 }

+static int bind_device(char *busid)
+{
+	const char *devpath = get_device_devpath(busid);
+
+	/* Check whether the device with this bus ID exists. */
+	if (!devpath) {
+		err("device with the specified bus ID does not exist");
+		return -1;
+	}
+
+	/* If the device is already attached to vhci_hcd - bail out */
+	if (strstr(devpath, USBIP_VHCI_DRV_NAME)) {
+		err("bind loop detected: device: %s is attached to %s\n",
+		    devpath, USBIP_VHCI_DRV_NAME);
+		return -1;
+	}
+
+	return bind_available_device(busid);
+}
+
+static int bind_device_persistently(char *busid)
+{
+	int rc = 0;
+	bool already_connected = is_usb_connected(busid);
+	usbip_monitor_t *monitor = monitor = usbip_monitor_new();
+
+	usbip_monitor_set_busid(monitor, busid);
+	while (rc == 0) {
+		if (!already_connected) {
+			info("device on busid %s: monitor connect", busid);
+			usbip_monitor_await_usb_bind(monitor, USBIP_USB_DRV_NAME);
+		}
+		rc = bind_available_device(busid);
+		if (rc == 0) {
+			info("device on busid %s: monitor disconnect", busid);
+			usbip_monitor_await_usb_bind(monitor, USBIP_HOST_DRV_NAME);
+			usbip_monitor_await_usb_unbind(monitor);
+		}
+		already_connected = false;
+	}
+	usbip_monitor_delete(monitor);
+	return rc;
+}
+
 int usbip_bind(int argc, char *argv[])
 {
 	static const struct option opts[] = {
 		{ "busid", required_argument, NULL, 'b' },
+		{ "persistent",  no_argument, NULL, 'p' },
 		{ NULL,    0,                 NULL,  0  }
 	};

+	struct bind_options options = {};
 	int opt;
 	int ret = -1;

 	for (;;) {
-		opt = getopt_long(argc, argv, "b:", opts, NULL);
+		opt = getopt_long(argc, argv, "b:p", opts, NULL);

 		if (opt == -1)
 			break;

 		switch (opt) {
 		case 'b':
-			ret = bind_device(optarg);
-			goto out;
+			options.busid = optarg;
+			break;
+		case 'p':
+			options.is_persistent = true;
+			break;
 		default:
 			goto err_out;
 		}
 	}

+	if (!options.busid)
+		goto err_out;
+
+	if (options.is_persistent)
+		ret = bind_device_persistently(options.busid);
+	else
+		ret = bind_device(options.busid);
+	goto out;
+
 err_out:
 	usbip_bind_usage();
 out:
--
2.25.1

