Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5CF447475
	for <lists+linux-usb@lfdr.de>; Sun,  7 Nov 2021 18:16:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbhKGRTg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Nov 2021 12:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235968AbhKGRTe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Nov 2021 12:19:34 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E385AC061570
        for <linux-usb@vger.kernel.org>; Sun,  7 Nov 2021 09:16:50 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id t11so24889730ljh.6
        for <linux-usb@vger.kernel.org>; Sun, 07 Nov 2021 09:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=nNUKVNy8vOuHc8wD6tyPbuUT/IFxVm1KtXxpJlI7LIw=;
        b=F55V9d0YJNLhdCu1/4ADkG9EQaa0TmU6eGzKET2zR/vZ4WQ43E6UaoTjL2vLMds8zh
         fBJzxCANgOOD6vSUn3NexMMM0oxEfQ9kkAicG4iUl9DO5+0ymafQ+0gREsAXuwqWcInD
         gME5ORMEKYW0/O74hh3lF8l2o7F1M6dHK2bA+K64lMa5NfBu1EUchDJ3BkFvfb31s8ju
         spHIYkfVmvgTOADTtQSOGoA1heTM3vFip5uNtiZ2/HfzqJxIyQUHHQMRzANRjcXtRNf/
         42loW5XP1cektWOoICKQvTxD6hpP/lbmkVb0solt6nx1UNVGBJAgdQV4qjElxkg6mBC8
         q5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=nNUKVNy8vOuHc8wD6tyPbuUT/IFxVm1KtXxpJlI7LIw=;
        b=pIO2CF2bvXrBSXwbWSwx0iVGjoszaYHYehyzUm1cNt1bcCCnZRPxlVS6doHSyhfvlW
         lGeINgfZRqyYT7k+rENpXe1MVfSU75Kw+Dm4qwk/RUh06RWxA1Jyy/ibuaP6S1irvSgR
         l0riDErtJ0KYs+4AUAbeWODbfY8ncPecImi/BqLYMs8A9wOumCP/Au2TxwQ2mkSScnOe
         qkEoXWUdbM9zSoh1eslZFY62CYtlAggrn3cc+XLWoe+k+k52PnKd4AiT1vjnVbFzClKg
         8+OgYM3WoJMCMe2k10V1Q0jVmsikyRz5+rD/VlTGP3rXTurYZurBSl6kLty5i5fMIwMP
         Vong==
X-Gm-Message-State: AOAM5311iAdEIb55bPQyrXQQMc62heH4w/NVJr8O17aDBCsGoFaMqZQ2
        KmMDVPDyvKUcN3xPJV7TRQv3zTN4YbM=
X-Google-Smtp-Source: ABdhPJwlLOmsG8Qllu1RiQYjbQVvVsF/l0HxbZcaOh/QVwZjrDDKVOMiXIW0I8BT9qFVjxcSte6NhQ==
X-Received: by 2002:a2e:a4b6:: with SMTP id g22mr3748138ljm.447.1636305409304;
        Sun, 07 Nov 2021 09:16:49 -0800 (PST)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id v15sm108154lfo.301.2021.11.07.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 09:16:49 -0800 (PST)
Date:   Sun, 7 Nov 2021 18:16:47 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v4 3/4] tools/usbip: export USB devices on a given bus
 persistently
Message-ID: <20211107171647.GA14872@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch extends the command "usbip bind" with flag "-p|--persistent".
When this flag is used, devices on a given busid becomes exported when
plugged in, instead of returning an error if the device is not available.
When the usb device is unplugged, it will start monitor the bus again.

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v2: Change title, fix style warnings, improve feature description, refactor
    cmdline flag usage.
v3: Change title and description.
v4: Fix review comments.

 tools/usb/usbip/src/usbip_bind.c | 117 ++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 25 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_bind.c b/tools/usb/usbip/src/usbip_bind.c
index f1cf9225a69c..c1c267614411 100644
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
@@ -127,29 +136,29 @@ static int unbind_other(char *busid)
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
+	if (get_device_devpath(busid))
+		return true;
+	else
+		return false;
+}
+
+static int bind_available_device(char *busid)
+{
+	int rc;
 
 	rc = unbind_other(busid);
 	if (rc == UNBIND_ST_FAILED) {
@@ -174,36 +183,94 @@ static int bind_device(char *busid)
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

