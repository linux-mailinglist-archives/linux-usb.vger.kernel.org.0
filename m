Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B675460A39
	for <lists+linux-usb@lfdr.de>; Sun, 28 Nov 2021 22:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359466AbhK1VSp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Nov 2021 16:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359247AbhK1VQn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Nov 2021 16:16:43 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0AFC061758
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:13:27 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bu18so39407784lfb.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Nov 2021 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=sO/yNcwxYKazOm+pmt4qeADWKZA5vHEymy0nvyZGnC8=;
        b=avfKV8Orvs+yP7Rr+IQ4o+/O5rLeuA/J4ZhfFjsWZYwx/eHkTN98R8w/G/jsWuzJsu
         chHrknAmp2vtKyGPqb/y2QceqjjZVTE+0hJsppzn8q1/rr0MdNJU30lwB9YBn8hY+ive
         g0OBjjOse4ZhxlXJuZE+JSb16UZN6maMgSWOObhn5+ZLUJ+V/uu7ad2IEm6CRWd1g8iw
         b7irzO2OWG5ZXqZURNTXhRZHxDM/i57whTGLnAdgaBkRLcCOWx277y/9vqzTnmFJx0l0
         t/5J3rbp2MlDCdiVe6oXMqKMGcyOQFzZ1QkW5c+WBK4+0ZFYYZcsFpawnHUOH+faFPAz
         6Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=sO/yNcwxYKazOm+pmt4qeADWKZA5vHEymy0nvyZGnC8=;
        b=qIMJ1BVNGC1cC2qxX6oRqsjp1Wr6HneVa1ogITxTi4Rl/p/Jb48MkWVVl+Ls4jX32r
         JTomePZ0y/aqvs/FveEfBsG6ZLfV91f/azFCUCa+rw/iOOVYlVLi2cLwR3AAVPPiY0p0
         jocjlt+W9EvBjoY7r6NfRKnI3a6d8uq04i9v9zPsNdnB8Gtj3xs4ssy17rKrqrJ5zNXY
         AnrMQBUyf+0EVL7KIEteLiO9CvM+Mi1bDLtiPTXIpGxeUuTcT/MLSCMVrND0p4yHwqRZ
         icwKo57+uELo1tZYB76T5vItAAftu7Pa587PbjPlaCXG/Mguh20ZiM6TTKL0Go+QA8Ph
         e/kQ==
X-Gm-Message-State: AOAM530pXo7co6/j0zFRs7/+cNKnk5hoyFJpl6z7oNSZm5WL091scidg
        V9J+7aDHe2T3sGVj4rurXiiYC9nro3c=
X-Google-Smtp-Source: ABdhPJwcnyZMk6eNYuJuT2OpC7pV/C1hNSLMETq4moFalFdFJceYaf/HZhWEVCEksixbY/W/QF51Nw==
X-Received: by 2002:ac2:54ba:: with SMTP id w26mr44523905lfk.548.1638134005394;
        Sun, 28 Nov 2021 13:13:25 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id j20sm1107452lfu.84.2021.11.28.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:13:25 -0800 (PST)
Date:   Sun, 28 Nov 2021 22:13:23 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v5 4/5] tools/usbip: export USB devices on a given bus
 persistently
Message-ID: <20211128211323.GA37488@dell-precision-T3610>
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
v5: Fix typo in variable initialization.

 tools/usb/usbip/src/usbip_bind.c | 117 ++++++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 25 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_bind.c b/tools/usb/usbip/src/usbip_bind.c
index f1cf9225a69c..2895d1a3c6ee 100644
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
+	usbip_monitor_t *monitor = usbip_monitor_new();
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

