Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876EE424851
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 22:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhJFUxD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 16:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhJFUxC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Oct 2021 16:53:02 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FDCC061746
        for <linux-usb@vger.kernel.org>; Wed,  6 Oct 2021 13:51:09 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r19so14642375lfe.10
        for <linux-usb@vger.kernel.org>; Wed, 06 Oct 2021 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=iN3Xedi8bWugA3CJsP0JVEoyHMRwJRHu8+qvF/2ldm4=;
        b=FQ0v67EFotytSwLMcgdZTbkqyTmmYTU6KVywMEV08+/vOgIklXnIqV+wfDdRBfwpFO
         ZqRvA3vBd96p8HnJDWiJcNrFIWrZAMoNaY467c5qzfD91w8UfXgjvs+ORZ9bFx3ne14i
         hoQEEw9nhfTWKvJJzUSF6Py9R9kjJGexDexcj/uGp2XG/EMt+LwYPwrwB69wDhWBEhPb
         zYVqgpujxjPUp60v4ehc1YoVkMgblwr1pnYX3yypPxCxnUzL6bBDThL8vILJfqBR6jLY
         OFeU7miXJZ/QYAwQ/hmkSj924UEJGCo9uIrzDTS7eNNrhRKxgTUiGkChTfj+nG6A6kOW
         DyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=iN3Xedi8bWugA3CJsP0JVEoyHMRwJRHu8+qvF/2ldm4=;
        b=Zq/PQjfNZ0CZaLo9C5b/Z0DpznYs1zz7aQqn7DRfVlC0iwxETP5BeyZ9YKsEbNM1Us
         NRvA8TvG1JWAw6on5OAIIsFrCEc/M3AbTq/942ltsMDicC9bOKXRyUt/uHUlL0/kHo9I
         ZyD2NJFuH3r4oHe+f44rQ1FAs7vVNCuevZULH/InpGS9rd5cs7EsXYrQKlKgTatSYXiG
         dnv3sfHRpP97LgoCsMZ+NW93D2pr7FPu0Zy1n2JloqGSGlOUhrwxyM/TtFVbEFb6gIqO
         hOx5divT+VXVvjRhaTRqRKXH+Akm+fBSjulnuWmPuiDOi0rO9YOev2viFnpImbTHLBZI
         YzEg==
X-Gm-Message-State: AOAM532RUKrI15dFa1Ab+olDYVR6ZK/PEN6FZ9+kZYxeNA5j/TREzP+f
        55Rmv0JKB59FQcrh2wOTJY8=
X-Google-Smtp-Source: ABdhPJwYPmxiwqRJiRSVtf8v+eC+Fbsu45eNmolKaasAYGR0R4jdDgD5DTx0XUabKKgXZGZYQ78fTw==
X-Received: by 2002:ac2:4a81:: with SMTP id l1mr203623lfp.393.1633553468122;
        Wed, 06 Oct 2021 13:51:08 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id c1sm1547352ljr.111.2021.10.06.13.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:51:07 -0700 (PDT)
Date:   Wed, 6 Oct 2021 22:51:06 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v1 3/3] tools/usbip: support use case reconnect: command
 attach
Message-ID: <20211006205106.GA44412@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Extend command "usbip attach" with:

* flag "-c" to wait for busid to become exported on remote end, and then
  attach, instead of returning error.
* flag "-d", to wait for busid to disconnect before exit.

Today manual steps is required to re-import usb device when re-connected. With
above flags enabled, it's possible to permanently "import" usb devices with help
of example systemd or other process supervisors, or with a simple while-loop
in bash. With patch [1/3] and [2/3] it is possible to fully support usb devices
to be reconnected over both ends.

Note:

* Reclaimed flag "-d" which was superflous and no different to "-b".
* This patch affects both ends: usbipd (server) and command "usbip attach"
  (client). Usbip must preferably have both ends of the new versions.

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
 tools/usb/usbip/libsrc/vhci_driver.c | 16 ++++++
 tools/usb/usbip/libsrc/vhci_driver.h |  1 +
 tools/usb/usbip/src/usbip_attach.c   | 80 ++++++++++++++++++++++------
 tools/usb/usbip/src/usbip_network.h  |  1 +
 tools/usb/usbip/src/usbipd.c         | 42 +++++++++++----
 5 files changed, 114 insertions(+), 26 deletions(-)

diff --git a/tools/usb/usbip/libsrc/vhci_driver.c b/tools/usb/usbip/libsrc/vhci_driver.c
index 8159fd98680b..4fc75e8bad66 100644
--- a/tools/usb/usbip/libsrc/vhci_driver.c
+++ b/tools/usb/usbip/libsrc/vhci_driver.c
@@ -465,3 +465,19 @@ int usbip_vhci_imported_device_dump(struct usbip_imported_device *idev)
 
 	return 0;
 }
+
+int usbip_vhci_get_local_busid_from(int port, char *local_busid)
+{
+	int rc = -1;
+
+	for (int i = 0; i < vhci_driver->nports; ++i) {
+		struct usbip_imported_device *idev = &vhci_driver->idev[i];
+
+		if (idev->port == port && strnlen(idev->udev.busid, SYSFS_BUS_ID_SIZE)) {
+			memcpy(local_busid, idev->udev.busid, SYSFS_BUS_ID_SIZE);
+			rc = 0;
+			break;
+		}
+	}
+	return rc;
+}
diff --git a/tools/usb/usbip/libsrc/vhci_driver.h b/tools/usb/usbip/libsrc/vhci_driver.h
index 6c9aca216705..4aecd4013cbe 100644
--- a/tools/usb/usbip/libsrc/vhci_driver.h
+++ b/tools/usb/usbip/libsrc/vhci_driver.h
@@ -63,5 +63,6 @@ int usbip_vhci_attach_device(uint8_t port, int sockfd, uint8_t busnum,
 int usbip_vhci_detach_device(uint8_t port);
 
 int usbip_vhci_imported_device_dump(struct usbip_imported_device *idev);
+int usbip_vhci_get_local_busid_from(int port, char *local_busid);
 
 #endif /* __VHCI_DRIVER_H */
diff --git a/tools/usb/usbip/src/usbip_attach.c b/tools/usb/usbip/src/usbip_attach.c
index b4aeb9f1f493..13388bf9800f 100644
--- a/tools/usb/usbip/src/usbip_attach.c
+++ b/tools/usb/usbip/src/usbip_attach.c
@@ -21,14 +21,23 @@
 
 #include "vhci_driver.h"
 #include "usbip_common.h"
+#include "usbip_monitor.h"
 #include "usbip_network.h"
 #include "usbip.h"
 
+typedef struct {
+	char *busid;
+	char monitor_connect;
+	char monitor_disconnect;
+} attach_options;
+
 static const char usbip_attach_usage_string[] =
 	"usbip attach <args>\n"
 	"    -r, --remote=<host>      The machine with exported USB devices\n"
-	"    -b, --busid=<busid>    Busid of the device on <host>\n"
-	"    -d, --device=<devid>    Id of the virtual UDC on <host>\n";
+	"    -b, --busid=<busid>      Busid of the device on <host>\n"
+	"                             or id of the virtual UDC on <host>\n"
+	"    -c, --monitor-connect    Wait until bus is available before binding\n"
+	"    -d, --monitor-disconnect Wait until bus is disconnected before exit\n";
 
 void usbip_attach_usage(void)
 {
@@ -117,7 +126,7 @@ static int import_device(int sockfd, struct usbip_usb_device *udev)
 	return -1;
 }
 
-static int query_import_device(int sockfd, char *busid)
+static int query_import_device(int sockfd, char *busid, char monitor_connect)
 {
 	int rc;
 	struct op_import_request request;
@@ -135,9 +144,14 @@ static int query_import_device(int sockfd, char *busid)
 		return -1;
 	}
 
+	if (monitor_connect) {
+		info("remote device on busid %s: awaiting connect", busid);
+		request.monitor_connect = 1;
+	}
+
 	strncpy(request.busid, busid, SYSFS_BUS_ID_SIZE-1);
 
-	PACK_OP_IMPORT_REQUEST(0, &request);
+	PACK_OP_IMPORT_REQUEST(1, &request);
 
 	rc = usbip_net_send(sockfd, (void *) &request, sizeof(request));
 	if (rc < 0) {
@@ -171,11 +185,27 @@ static int query_import_device(int sockfd, char *busid)
 	return import_device(sockfd, &reply.udev);
 }
 
-static int attach_device(char *host, char *busid)
+static int get_local_busid_from(int port, char *local_busid)
+{
+	int rc = usbip_vhci_driver_open();
+
+	if (rc == 0) {
+		rc = usbip_vhci_get_local_busid_from(port, local_busid);
+	}
+	usbip_vhci_driver_close();
+	return rc;
+}
+
+static int attach_device(char *host, attach_options opt)
 {
 	int sockfd;
 	int rc;
 	int rhport;
+	usbip_monitor_t *monitor = NULL;
+
+	if (opt.monitor_disconnect) {
+		monitor = usbip_monitor_new();
+	}
 
 	sockfd = usbip_net_tcp_connect(host, usbip_port_string);
 	if (sockfd < 0) {
@@ -183,19 +213,33 @@ static int attach_device(char *host, char *busid)
 		return -1;
 	}
 
-	rhport = query_import_device(sockfd, busid);
+	rhport = query_import_device(sockfd, opt.busid, opt.monitor_connect);
 	if (rhport < 0)
 		return -1;
 
 	close(sockfd);
 
-	rc = record_connection(host, usbip_port_string, busid, rhport);
+	rc = record_connection(host, usbip_port_string, opt.busid, rhport);
 	if (rc < 0) {
 		err("record connection");
 		return -1;
 	}
 
-	return 0;
+	if (opt.monitor_disconnect) {
+		// local busid is needed to monitor events, which is unknown at this moment.
+		// Thus monitor bind events for any usb device until the busid is
+		// available for current port.
+		char local_busid[SYSFS_BUS_ID_SIZE] = {};
+
+		while (get_local_busid_from(rhport, local_busid)) {
+			usbip_monitor_await_usb_bind(monitor, USBIP_USB_DRV_NAME);
+		}
+		info("remote device on busid %s: awaiting disconnect", opt.busid);
+		usbip_monitor_set_busid(monitor, local_busid);
+		usbip_monitor_await_usb_unbind(monitor);
+		usbip_monitor_delete(monitor);
+	}
+	return rc;
 }
 
 int usbip_attach(int argc, char *argv[])
@@ -203,16 +247,17 @@ int usbip_attach(int argc, char *argv[])
 	static const struct option opts[] = {
 		{ "remote", required_argument, NULL, 'r' },
 		{ "busid",  required_argument, NULL, 'b' },
-		{ "device",  required_argument, NULL, 'd' },
+		{ "monitor-connect",  no_argument, NULL, 'c' },
+		{ "monitor-disconnect",  no_argument, NULL, 'd' },
 		{ NULL, 0,  NULL, 0 }
 	};
 	char *host = NULL;
-	char *busid = NULL;
+	attach_options options = {};
 	int opt;
 	int ret = -1;
 
 	for (;;) {
-		opt = getopt_long(argc, argv, "d:r:b:", opts, NULL);
+		opt = getopt_long(argc, argv, "r:b:cd", opts, NULL);
 
 		if (opt == -1)
 			break;
@@ -221,19 +266,24 @@ int usbip_attach(int argc, char *argv[])
 		case 'r':
 			host = optarg;
 			break;
-		case 'd':
 		case 'b':
-			busid = optarg;
+			options.busid = optarg;
+			break;
+		case 'c':
+			options.monitor_connect = 1;
+			break;
+		case 'd':
+			options.monitor_disconnect = 1;
 			break;
 		default:
 			goto err_out;
 		}
 	}
 
-	if (!host || !busid)
+	if (!host || !options.busid)
 		goto err_out;
 
-	ret = attach_device(host, busid);
+	ret = attach_device(host, options);
 	goto out;
 
 err_out:
diff --git a/tools/usb/usbip/src/usbip_network.h b/tools/usb/usbip/src/usbip_network.h
index 83b4c5344f72..b9b80d24e68d 100644
--- a/tools/usb/usbip/src/usbip_network.h
+++ b/tools/usb/usbip/src/usbip_network.h
@@ -61,6 +61,7 @@ struct op_devinfo_reply {
 
 struct op_import_request {
 	char busid[SYSFS_BUS_ID_SIZE];
+	char monitor_connect;
 } __attribute__((packed));
 
 struct op_import_reply {
diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 48398a78e88a..612758922fc1 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -35,6 +35,7 @@
 #include "usbip_host_common.h"
 #include "usbip_device_driver.h"
 #include "usbip_common.h"
+#include "usbip_monitor.h"
 #include "usbip_network.h"
 #include "list.h"
 
@@ -88,13 +89,27 @@ static void usbipd_help(void)
 	printf("%s\n", usbipd_help_string);
 }
 
+static struct usbip_exported_device *get_exported_device(const char *busid)
+{
+	struct usbip_exported_device *exported_dev = NULL;
+	struct usbip_exported_device *edev = NULL;
+	struct list_head *i;
+
+	list_for_each(i, &driver->edev_list) {
+		edev = list_entry(i, struct usbip_exported_device, node);
+		if (!strncmp(busid, edev->udev.busid, SYSFS_BUS_ID_SIZE)) {
+			exported_dev = edev;
+			break;
+		}
+	}
+	return exported_dev;
+}
+
 static int recv_request_import(int sockfd)
 {
 	struct op_import_request req;
-	struct usbip_exported_device *edev;
+	struct usbip_exported_device *edev = NULL;
 	struct usbip_usb_device pdu_udev;
-	struct list_head *i;
-	int found = 0;
 	int status = ST_OK;
 	int rc;
 
@@ -107,16 +122,21 @@ static int recv_request_import(int sockfd)
 	}
 	PACK_OP_IMPORT_REQUEST(0, &req);
 
-	list_for_each(i, &driver->edev_list) {
-		edev = list_entry(i, struct usbip_exported_device, node);
-		if (!strncmp(req.busid, edev->udev.busid, SYSFS_BUS_ID_SIZE)) {
-			info("found requested device: %s", req.busid);
-			found = 1;
-			break;
-		}
+	edev = get_exported_device(req.busid);
+
+	if (!edev && req.monitor_connect) {
+		info("Client waiting on busid: %s to be exported", req.busid);
+		usbip_monitor_t *monitor = usbip_monitor_new();
+
+		usbip_monitor_set_busid(monitor, req.busid);
+		usbip_monitor_await_usb_bind(monitor, "usbip-host");
+		usbip_monitor_delete(monitor);
+		usbip_refresh_device_list(driver);
+		edev = get_exported_device(req.busid);
 	}
 
-	if (found) {
+	if (edev) {
+		info("found requested device: %s", req.busid);
 		/* should set TCP_NODELAY for usbip */
 		usbip_net_set_nodelay(sockfd);
 
-- 
2.25.1

