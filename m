Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62234424842
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 22:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbhJFUv7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 16:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhJFUv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Oct 2021 16:51:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4645FC061746
        for <linux-usb@vger.kernel.org>; Wed,  6 Oct 2021 13:50:06 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x27so15688273lfu.5
        for <linux-usb@vger.kernel.org>; Wed, 06 Oct 2021 13:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=pISy2GWDNyqa+tjlbnEKfUmdwYPalbwd9m7NKTlFCT8=;
        b=PPvYzd0qwo4KPkR+zDHaBYGUP9eWEYzFGkFpVLtYhpy9/vWZsTs2hYxFFHr1l9RLis
         zrIqHBzmrognMo/SZOhhUa2otMOjGzm0ow2Fr2shywYLgz8hjvG9cGRpyANkRK+gjdhT
         d9K8H7SwJavCTTfQlX3bY7u1v6YsRPclZqyDZHD3FU8UOwX0KCMtjYZp7C5LdJApXRa4
         mE4cGz4YRNeg7SU0sZfVA5UDdr4bgSc5JQWxt9pR3hx90myK8udcG8b+7fLuY2ZbRyvs
         uNKo9/kL26Ab3APYy4NDFpg4Q31RPIL41fwaUrmPeEdvU+fGDPsETAZjsLhKZkFwtqyA
         fomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=pISy2GWDNyqa+tjlbnEKfUmdwYPalbwd9m7NKTlFCT8=;
        b=YSqnpzGI15ZysWAlm+UoFrseCiYv+nytlp9CjKuqSLL+zxtQpr/B3o4NoHO/uIZNe4
         XqVkrMFjDCEo3Bn5nZ5EjUKoebrbP78iF7QjSpzKCqSRv24soLrIY8E9lqIIQQqDxQYG
         /c1YLSHQtbiQlWcs0jnTkXynZu67GF/mQGMV7j2IQ+wrIB7poAf5WhMNbBRogPgCqiZf
         DTZioRw3hPNH68uD/EL7RiEHmBFnYoX+Yf2kH+JhhH+93CipyDUt5WQSsZ1mPhFea8IJ
         sobxu2M2mXSfdWo+xc1QGIZoy6PDbHU+WLrXvHLnXSc6HwLGYBt4YqY5gVlRExvyK71v
         AdZA==
X-Gm-Message-State: AOAM5307NAzM/XVh9aAPAxLJJN6cQ8HlLZszOqMqpwVkpOOVtBifTE02
        paApiIBLLqkYk2GjwZbTAYQ=
X-Google-Smtp-Source: ABdhPJwqr6BbFRVljVJizXA+s1VwBBLYMfy5fbqTNsaaDjL914asSWhLmJH8FyNSAjmHfalU4r2hfA==
X-Received: by 2002:a2e:480a:: with SMTP id v10mr260677lja.268.1633553404683;
        Wed, 06 Oct 2021 13:50:04 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id t3sm328995ljd.41.2021.10.06.13.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:50:04 -0700 (PDT)
Date:   Wed, 6 Oct 2021 22:50:02 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v1 2/3] tools/usbip: support use case reconnect: command bind
Message-ID: <20211006205002.GA44214@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Extend command "usbip bind" with:

* flag "-c" to wait for busid to connect and then bind, instead of returning
  error.
* flag "-d", to wait for busid to disconnect before exit.

Today manual steps is required to re-export usb device when re-connected. With
above flags enabled, it's possible to permanently "export" usb devices with help
of example systemd or other process supervisors, or with a simple while-loop
in bash.

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
 tools/usb/usbip/src/usbip_bind.c | 62 +++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_bind.c b/tools/usb/usbip/src/usbip_bind.c
index f1cf9225a69c..907c81f2160c 100644
--- a/tools/usb/usbip/src/usbip_bind.c
+++ b/tools/usb/usbip/src/usbip_bind.c
@@ -14,6 +14,7 @@
 #include <getopt.h>
 
 #include "usbip_common.h"
+#include "usbip_monitor.h"
 #include "utils.h"
 #include "usbip.h"
 #include "sysfs_utils.h"
@@ -24,10 +25,18 @@ enum unbind_status {
 	UNBIND_ST_FAILED
 };
 
+typedef struct {
+	char *busid;
+	char monitor_connect;
+	char monitor_disconnect;
+} bind_options;
+
 static const char usbip_bind_usage_string[] =
 	"usbip bind <args>\n"
-	"    -b, --busid=<busid>    Bind " USBIP_HOST_DRV_NAME ".ko to device "
-	"on <busid>\n";
+	"    -b, --busid=<busid>        Bind " USBIP_HOST_DRV_NAME ".ko to device\n"
+	"                               on <busid>\n"
+	"    -c, --monitor-connect      Wait until bus is available before binding\n"
+	"    -d, --monitor-disconnect   Wait until bus is disconnected before exit\n";
 
 void usbip_bind_usage(void)
 {
@@ -127,19 +136,32 @@ static int unbind_other(char *busid)
 	return status;
 }
 
-static int bind_device(char *busid)
+static int bind_device(bind_options options)
 {
 	int rc;
 	struct udev *udev;
 	struct udev_device *dev;
 	const char *devpath;
+	usbip_monitor_t *monitor = NULL;
+	char *busid = options.busid;
+
+	if (options.monitor_disconnect || options.monitor_connect) {
+		monitor = usbip_monitor_new();
+		usbip_monitor_set_busid(monitor, options.busid);
+	}
 
 	/* Check whether the device with this bus ID exists. */
 	udev = udev_new();
 	dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);
 	if (!dev) {
-		err("device with the specified bus ID does not exist");
-		return -1;
+		if (options.monitor_connect) {
+			info("device on busid %s: awaiting connect", busid);
+			usbip_monitor_await_usb_bind(monitor, USBIP_USB_DRV_NAME);
+			dev = udev_device_new_from_subsystem_sysname(udev, "usb", busid);
+		} else {
+			err("device with the specified bus ID does not exist");
+			return -1;
+		}
 	}
 	devpath = udev_device_get_devpath(dev);
 	udev_unref(udev);
@@ -174,7 +196,14 @@ static int bind_device(char *busid)
 		return -1;
 	}
 
-	info("bind device on busid %s: complete", busid);
+	info("device on busid %s: bind complete", busid);
+
+	if (options.monitor_disconnect) {
+		info("device on busid %s: await disconnect", busid);
+		usbip_monitor_await_usb_bind(monitor, USBIP_HOST_DRV_NAME);
+		usbip_monitor_await_usb_unbind(monitor);
+		usbip_monitor_delete(monitor);
+	}
 
 	return 0;
 }
@@ -183,27 +212,42 @@ int usbip_bind(int argc, char *argv[])
 {
 	static const struct option opts[] = {
 		{ "busid", required_argument, NULL, 'b' },
+		{ "monitor-connect",  no_argument, NULL, 'c' },
+		{ "monitor-disconnect",  no_argument, NULL, 'd' },
 		{ NULL,    0,                 NULL,  0  }
 	};
 
+	bind_options options = {};
 	int opt;
 	int ret = -1;
 
 	for (;;) {
-		opt = getopt_long(argc, argv, "b:", opts, NULL);
+		opt = getopt_long(argc, argv, "b:cd", opts, NULL);
 
 		if (opt == -1)
 			break;
 
 		switch (opt) {
 		case 'b':
-			ret = bind_device(optarg);
-			goto out;
+			options.busid = optarg;
+			break;
+		case 'c':
+			options.monitor_connect = 1;
+			break;
+		case 'd':
+			options.monitor_disconnect = 1;
+			break;
 		default:
 			goto err_out;
 		}
 	}
 
+	if (!options.busid)
+		goto err_out;
+
+	ret = bind_device(options);
+	goto out;
+
 err_out:
 	usbip_bind_usage();
 out:
-- 
2.25.1

