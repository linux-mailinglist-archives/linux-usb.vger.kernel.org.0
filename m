Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DEA43A46A
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 22:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237946AbhJYUZC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 16:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232995AbhJYUY4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 16:24:56 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08445C061236
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 13:08:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id u21so16120319lff.8
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 13:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=IEokq79iOfPk82jyYBC3YQ/nTX3a8jOG6inmVQFzCSM=;
        b=cWWSjyUVEZhxjuBcOrucLyHnzHms7UgHgNIzeNQwg4xVaEsmYqEUt7gSlocLyyf6/f
         OEYJRYPdGgi6Oxe+vomJef34oA8/PHKM1SowdEY+gZ99eYcieCK5MLqx4qb/yvKpp7kl
         PFFEcNjtJjI2fy0LRd0omTRWsFzEOFwRdJZBuEJnY9/UON50aEkm7hRBydV6TqYBEXPU
         gPwmSHUlVf05H4EMhYqCP8BhxnsauoCYxc/Uu29ZD0Kwxq4zgZyhYZC6P3F8V8GfAb3d
         NDC67vcss09V/pUoIonPb1V5qcTBU2e9QsKLc2MhT60BGvMix9q+V63KZd1DHD57kpR9
         FIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=IEokq79iOfPk82jyYBC3YQ/nTX3a8jOG6inmVQFzCSM=;
        b=Wlg3AnvSJeXZXBMU42MdCtVe/R1pX7SywzQMWhnaiSeo5GhVlfT1xBjFwU0grn4fqW
         WzifSOblBuhSwdMWyyxBBrr7BN0YeGQcTHNmCYXJ1JBiPeMn0Gdb3oNgM3hPqsLgrIQD
         jFKFcwmQUnyiU7NENcx+SCYm0lflr0VSyxr5H8k5QS4Rn5YHn/YDNHoEJMrWlLfZgyoO
         UgjfboB/fTpbnDtrlNVC39rOrPFgQKo+J79oie322DDvu2Jl9fHzeLdDMVAkj9jURAAb
         AhKysKF61poLqyz6R+vnJcbw5EWefyXwv14eKWLEOnlWoBIzXqze6/7hvSpLy7mIDx9r
         T80Q==
X-Gm-Message-State: AOAM532yUwrPVUQuVzTgWJViBPxXybA5Fz3paNLl53nSb4v0t2GZHXWR
        TaSs7OXoFIb3vvCikFkF1iQ=
X-Google-Smtp-Source: ABdhPJzJpLIfmmoPAHjST3u5k5Nr38QHT2Z2sciNac3bm6AVFpt7adR3BKoQHdAyw0j4EXv+aJg/Qw==
X-Received: by 2002:a05:6512:3f1a:: with SMTP id y26mr18203354lfa.372.1635192485994;
        Mon, 25 Oct 2021 13:08:05 -0700 (PDT)
Received: from dell-precision-T3610 (h-155-4-132-193.NA.cust.bahnhof.se. [155.4.132.193])
        by smtp.gmail.com with ESMTPSA id k37sm1728864lfv.304.2021.10.25.13.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 13:08:05 -0700 (PDT)
Date:   Mon, 25 Oct 2021 22:08:04 +0200
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] tools/usbip: persistently forward USB devices on a
 given bus
Message-ID: <20211025200804.GA14619@dell-precision-T3610>
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

This patch extends the command "usbip attach" with flag "-p|--persistent" to
poll and import a devices on given remote busid when available, instead of
returning an error if the device is not exported. When the usb device is
unplugged, it will start monitor the given remote bus again. Increment protocol
version to 1.1.2 (0x112) since this patch affects both ends: usbipd (server)
and command "usbip attach" (client).

Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
---
v2: Change title, fix style warnings, improve feature description, refactor
    cmdline flag usage.

 Documentation/usb/usbip_protocol.rst  |  56 +++++++++--
 tools/usb/usbip/configure.ac          |   2 +-
 tools/usb/usbip/libsrc/usbip_common.c |   1 +
 tools/usb/usbip/libsrc/usbip_common.h |   1 +
 tools/usb/usbip/libsrc/vhci_driver.c  |  16 ++++
 tools/usb/usbip/libsrc/vhci_driver.h  |   1 +
 tools/usb/usbip/src/usbip_attach.c    | 132 +++++++++++++++++++-------
 tools/usb/usbip/src/usbip_network.h   |   2 +
 tools/usb/usbip/src/usbipd.c          |  92 ++++++++++++++++--
 9 files changed, 251 insertions(+), 52 deletions(-)

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index 2ed7d97278e8..1afe6d297efc 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -36,12 +36,7 @@ TCP/IP connection is closed.
 
 Once the client knows the list of exported USB devices it may decide to use one
 of them. First the client opens a TCP/IP connection to the server and
-sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT. If the
-import was successful the TCP/IP connection remains open and will be used
-to transfer the URB traffic between the client and the server. The client may
-send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
-USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
-server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
+sends an OP_REQ_IMPORT packet. The server replies with OP_REP_IMPORT.
 
 ::
 
@@ -55,6 +50,47 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
           |                  OP_REP_IMPORT                  |
           | <---------------------------------------------- |
           |                                                 |
+
+The client may also request to poll for devices to become exported on a given
+busid, instead of immediately receive an error. If no device becomes exported
+within the chosen time, the server replies with timeout. The TCP/IP connection
+remains open and subsequent poll requests can be sent.
+
+::
+
+ virtual host controller                                 usb host
+      "client"                                           "server"
+  (imports USB devices)                             (exports USB devices)
+          |                                                 |
+          |                  OP_REQ_IMPORT                  |
+          | ----------------------------------------------> |
+          |                        .                        |
+          |                        :                        |
+          |                                                 |
+          |                  OP_REP_IMPORT                  |
+          | <---------------------------------------------- |
+          |                                                 |
+          |                  OP_REQ_IMPORT                  |
+          | ----------------------------------------------> |
+          |                        .                        |
+          |                        :                        |
+          |                                                 |
+          |                  OP_REP_IMPORT                  |
+          | <---------------------------------------------- |
+          |                        .                        |
+          |                        :                        |
+
+If the import was successful the TCP/IP connection remains open and will be used
+to transfer the URB traffic between the client and the server. The client may
+send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
+USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
+server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
+
+::
+
+ virtual host controller                                 usb host
+      "client"                                           "server"
+  (imports USB devices)                             (exports USB devices)
           |                                                 |
           |            USBIP_CMD_SUBMIT(seqnum = n)         |
           | ----------------------------------------------> |
@@ -137,8 +173,8 @@ byte (MSB) is stored at the lowest address.
 Protocol Version
 ================
 
-The documented USBIP version is v1.1.1. The binary representation of this
-version in message headers is 0x0111.
+The documented USBIP version is v1.1.2. The binary representation of this
+version in message headers is 0x0112.
 
 This is defined in tools/usb/usbip/configure.ac
 
@@ -248,6 +284,10 @@ OP_REQ_IMPORT:
 |           |        |            | A string closed with zero, the unused bytes       |
 |           |        |            | shall be filled with zeros.                       |
 +-----------+--------+------------+---------------------------------------------------+
+| 40        | 4      |            | poll timeout: instead of returning immediately if |
+|           |        |            | device is not available, wait until usb device    |
+|           |        |            | becomes exported or a timeout occurs.             |
++-----------+--------+------------+---------------------------------------------------+
 
 OP_REP_IMPORT:
 	Reply to import (attach) a remote USB device.
diff --git a/tools/usb/usbip/configure.ac b/tools/usb/usbip/configure.ac
index 607d05c5ccfd..156e42456423 100644
--- a/tools/usb/usbip/configure.ac
+++ b/tools/usb/usbip/configure.ac
@@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
 
 AC_PREREQ(2.59)
 AC_INIT([usbip-utils], [2.0], [linux-usb@vger.kernel.org])
-AC_DEFINE([USBIP_VERSION], [0x00000111], [binary-coded decimal version number])
+AC_DEFINE([USBIP_VERSION], [0x00000112], [binary-coded decimal version number])
 
 CURRENT=0
 REVISION=1
diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
index b8d7d480595a..30efb6a9f76d 100644
--- a/tools/usb/usbip/libsrc/usbip_common.c
+++ b/tools/usb/usbip/libsrc/usbip_common.c
@@ -78,6 +78,7 @@ static struct op_common_status_string op_common_status_strings[] = {
 	{ ST_DEV_ERR,	"Device in error state" },
 	{ ST_NODEV,	"Device not found" },
 	{ ST_ERROR,	"Unexpected response" },
+	{ ST_POLL_TIMEOUT,	"Poll timeout" },
 	{ 0, NULL}
 };
 
diff --git a/tools/usb/usbip/libsrc/usbip_common.h b/tools/usb/usbip/libsrc/usbip_common.h
index 13f1d4ca47c5..3df351877a33 100644
--- a/tools/usb/usbip/libsrc/usbip_common.h
+++ b/tools/usb/usbip/libsrc/usbip_common.h
@@ -53,6 +53,7 @@
 #define ST_DEV_ERR	0x03
 #define ST_NODEV	0x04
 #define ST_ERROR	0x05
+#define ST_POLL_TIMEOUT 0x06
 
 extern int usbip_use_syslog;
 extern int usbip_use_stderr;
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
index b4aeb9f1f493..231c3896864b 100644
--- a/tools/usb/usbip/src/usbip_attach.c
+++ b/tools/usb/usbip/src/usbip_attach.c
@@ -12,6 +12,7 @@
 #include <limits.h>
 #include <stdint.h>
 #include <stdio.h>
+#include <stdbool.h>
 #include <string.h>
 
 #include <fcntl.h>
@@ -21,14 +22,23 @@
 
 #include "vhci_driver.h"
 #include "usbip_common.h"
+#include "usbip_monitor.h"
 #include "usbip_network.h"
 #include "usbip.h"
 
+struct attach_options {
+	char *busid;
+	bool is_persistent;
+};
+
 static const char usbip_attach_usage_string[] =
 	"usbip attach <args>\n"
 	"    -r, --remote=<host>      The machine with exported USB devices\n"
-	"    -b, --busid=<busid>    Busid of the device on <host>\n"
-	"    -d, --device=<devid>    Id of the virtual UDC on <host>\n";
+	"    -b, --busid=<busid>      Busid of the device on <host>\n"
+	"    -d, --device=<devid>     Id of the virtual UDC on <host>\n"
+	"    -p, --persistent         Persistently monitor the given bus and import\n"
+	"                             USB devices when available on the remote end\n";
+
 
 void usbip_attach_usage(void)
 {
@@ -117,7 +127,7 @@ static int import_device(int sockfd, struct usbip_usb_device *udev)
 	return -1;
 }
 
-static int query_import_device(int sockfd, char *busid)
+static int query_import_device(int sockfd, char *busid, bool is_persistent)
 {
 	int rc;
 	struct op_import_request request;
@@ -127,31 +137,35 @@ static int query_import_device(int sockfd, char *busid)
 
 	memset(&request, 0, sizeof(request));
 	memset(&reply, 0, sizeof(reply));
-
-	/* send a request */
-	rc = usbip_net_send_op_common(sockfd, OP_REQ_IMPORT, 0);
-	if (rc < 0) {
-		err("send op_common");
-		return -1;
-	}
-
 	strncpy(request.busid, busid, SYSFS_BUS_ID_SIZE-1);
+	if (is_persistent) {
+		request.poll_timeout_ms = 5000;
+		info("remote device on busid %s: polling", busid);
+	}
+	PACK_OP_IMPORT_REQUEST(1, &request);
 
-	PACK_OP_IMPORT_REQUEST(0, &request);
+	do {
+		/* send a request */
+		rc = usbip_net_send_op_common(sockfd, OP_REQ_IMPORT, 0);
+		if (rc < 0) {
+			err("send op_common");
+			return -1;
+		}
 
-	rc = usbip_net_send(sockfd, (void *) &request, sizeof(request));
-	if (rc < 0) {
-		err("send op_import_request");
-		return -1;
-	}
+		rc = usbip_net_send(sockfd, (void *) &request, sizeof(request));
+		if (rc < 0) {
+			err("send op_import_request");
+			return -1;
+		}
 
-	/* receive a reply */
-	rc = usbip_net_recv_op_common(sockfd, &code, &status);
-	if (rc < 0) {
-		err("Attach Request for %s failed - %s\n",
-		    busid, usbip_op_common_status_string(status));
-		return -1;
-	}
+		/* receive a reply */
+		rc = usbip_net_recv_op_common(sockfd, &code, &status);
+		if (status != ST_POLL_TIMEOUT && rc < 0) {
+			err("Attach Request for %s failed - %s\n",
+					busid, usbip_op_common_status_string(status));
+			return -1;
+		}
+	} while (status == ST_POLL_TIMEOUT);
 
 	rc = usbip_net_recv(sockfd, (void *) &reply, sizeof(reply));
 	if (rc < 0) {
@@ -171,7 +185,17 @@ static int query_import_device(int sockfd, char *busid)
 	return import_device(sockfd, &reply.udev);
 }
 
-static int attach_device(char *host, char *busid)
+static int get_local_busid_from(int port, char *local_busid)
+{
+	int rc = usbip_vhci_driver_open();
+
+	if (rc == 0)
+		rc = usbip_vhci_get_local_busid_from(port, local_busid);
+	usbip_vhci_driver_close();
+	return rc;
+}
+
+static int attach_device(char *host, struct attach_options opt)
 {
 	int sockfd;
 	int rc;
@@ -183,19 +207,53 @@ static int attach_device(char *host, char *busid)
 		return -1;
 	}
 
-	rhport = query_import_device(sockfd, busid);
+	rhport = query_import_device(sockfd, opt.busid, opt.is_persistent);
 	if (rhport < 0)
 		return -1;
 
 	close(sockfd);
 
-	rc = record_connection(host, usbip_port_string, busid, rhport);
+	rc = record_connection(host, usbip_port_string, opt.busid, rhport);
 	if (rc < 0) {
 		err("record connection");
 		return -1;
 	}
+	info("remote device on busid %s: attach complete", opt.busid);
+	return rhport;
+}
 
-	return 0;
+static void monitor_disconnect(usbip_monitor_t *monitor, char *busid, int rhport)
+{
+	// To monitor unbind we must first ensure to be at a bound state. To
+	// monitor bound state a local busid is needed, which is unknown at this
+	// moment. Local busid is not available until it's already bound to the usbip
+	// driver. Thus monitor bind events for any usb device until the busid is
+	// available for the port.
+	char local_busid[SYSFS_BUS_ID_SIZE] = {};
+
+	while (get_local_busid_from(rhport, local_busid))
+		usbip_monitor_await_usb_bind(monitor, USBIP_USB_DRV_NAME);
+	info("remote device on busid %s: monitor disconnect", busid);
+	usbip_monitor_set_busid(monitor, local_busid);
+	usbip_monitor_await_usb_unbind(monitor);
+	usbip_monitor_set_busid(monitor, NULL);
+}
+
+static int attach_device_persistently(char *host, struct attach_options opt)
+{
+	int rc = 0;
+	usbip_monitor_t *monitor = usbip_monitor_new();
+
+	while (rc == 0) {
+		int rhport = attach_device(host, opt);
+
+		if (rhport < 0)
+			rc = -1;
+		else
+			monitor_disconnect(monitor, opt.busid, rhport);
+	}
+	usbip_monitor_delete(monitor);
+	return rc;
 }
 
 int usbip_attach(int argc, char *argv[])
@@ -204,15 +262,16 @@ int usbip_attach(int argc, char *argv[])
 		{ "remote", required_argument, NULL, 'r' },
 		{ "busid",  required_argument, NULL, 'b' },
 		{ "device",  required_argument, NULL, 'd' },
+		{ "persistent",  no_argument, NULL, 'p' },
 		{ NULL, 0,  NULL, 0 }
 	};
 	char *host = NULL;
-	char *busid = NULL;
+	struct attach_options options = {};
 	int opt;
 	int ret = -1;
 
 	for (;;) {
-		opt = getopt_long(argc, argv, "d:r:b:", opts, NULL);
+		opt = getopt_long(argc, argv, "d:r:b:p", opts, NULL);
 
 		if (opt == -1)
 			break;
@@ -223,17 +282,24 @@ int usbip_attach(int argc, char *argv[])
 			break;
 		case 'd':
 		case 'b':
-			busid = optarg;
+			options.busid = optarg;
+			break;
+		case 'p':
+			options.is_persistent = true;
 			break;
 		default:
 			goto err_out;
 		}
 	}
 
-	if (!host || !busid)
+	if (!host || !options.busid)
 		goto err_out;
 
-	ret = attach_device(host, busid);
+	if (options.is_persistent)
+		ret = attach_device_persistently(host, options);
+	else
+		ret = attach_device(host, options);
+
 	goto out;
 
 err_out:
diff --git a/tools/usb/usbip/src/usbip_network.h b/tools/usb/usbip/src/usbip_network.h
index 83b4c5344f72..1c25d06ab688 100644
--- a/tools/usb/usbip/src/usbip_network.h
+++ b/tools/usb/usbip/src/usbip_network.h
@@ -61,6 +61,7 @@ struct op_devinfo_reply {
 
 struct op_import_request {
 	char busid[SYSFS_BUS_ID_SIZE];
+	uint32_t poll_timeout_ms;
 } __attribute__((packed));
 
 struct op_import_reply {
@@ -69,6 +70,7 @@ struct op_import_reply {
 } __attribute__((packed));
 
 #define PACK_OP_IMPORT_REQUEST(pack, request)  do {\
+	(request)->poll_timeout_ms = usbip_net_pack_uint32_t(pack, (request)->poll_timeout_ms);\
 } while (0)
 
 #define PACK_OP_IMPORT_REPLY(pack, reply)  do {\
diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
index 48398a78e88a..42ebe073b966 100644
--- a/tools/usb/usbip/src/usbipd.c
+++ b/tools/usb/usbip/src/usbipd.c
@@ -22,6 +22,7 @@
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <netinet/in.h>
+#include <stdbool.h>
 
 #ifdef HAVE_LIBWRAP
 #include <tcpd.h>
@@ -35,6 +36,7 @@
 #include "usbip_host_common.h"
 #include "usbip_device_driver.h"
 #include "usbip_common.h"
+#include "usbip_monitor.h"
 #include "usbip_network.h"
 #include "list.h"
 
@@ -88,13 +90,78 @@ static void usbipd_help(void)
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
+static bool await_requested_device(usbip_monitor_t *monitor,
+				   struct op_import_request *req)
+{
+	usbip_monitor_set_busid(monitor, req->busid);
+	usbip_monitor_set_timeout(monitor, req->poll_timeout_ms);
+	return usbip_monitor_await_usb_bind(monitor, "usbip-host");
+}
+
+static int recv_subsequent_poll_request(int sockfd, struct op_import_request *req)
+{
+	uint16_t code = OP_UNSPEC;
+	int status;
+	int rc = 0;
+
+	rc = usbip_net_recv_op_common(sockfd, &code, &status);
+	if (rc < 0) {
+		dbg("could not receive opcode: %#0x", code);
+		return -1;
+	}
+	if (code != OP_REQ_IMPORT) {
+		dbg("Only subsequent OP_REQ_IMPORT allowed when polling");
+		return -1;
+	}
+	rc = usbip_net_recv(sockfd, req, sizeof(struct op_import_request));
+	if (rc < 0) {
+		dbg("usbip_net_recv failed: subsequent OP_REQ_IMPORT request");
+		return -1;
+	}
+	PACK_OP_IMPORT_REQUEST(0, req);
+	return rc;
+}
+
+static int monitor_requested_busid(int sockfd, struct op_import_request *req)
+{
+	int rc = 0;
+	usbip_monitor_t *monitor = usbip_monitor_new();
+
+	while (!await_requested_device(monitor, req)) {
+		int status = ST_POLL_TIMEOUT;
+
+		rc = usbip_net_send_op_common(sockfd, OP_REP_IMPORT, status);
+		if (rc < 0) {
+			dbg("usbip_net_send_op_common failed: %#0x", OP_REP_IMPORT);
+			break;
+		}
+		rc = recv_subsequent_poll_request(sockfd, req);
+	}
+	usbip_monitor_delete(monitor);
+	return rc;
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
 
@@ -107,16 +174,21 @@ static int recv_request_import(int sockfd)
 	}
 	PACK_OP_IMPORT_REQUEST(0, &req);
 
-	list_for_each(i, &driver->edev_list) {
-		edev = list_entry(i, struct usbip_exported_device, node);
-		if (!strncmp(req.busid, edev->udev.busid, SYSFS_BUS_ID_SIZE)) {
-			info("found requested device: %s", req.busid);
-			found = 1;
-			break;
+	edev = get_exported_device(req.busid);
+
+	if (!edev && req.poll_timeout_ms) {
+		info("Client polling for devices on busid: %s", req.busid);
+		rc = monitor_requested_busid(sockfd, &req);
+		if (rc < 0) {
+			dbg("monitor_requested_busid failed");
+			return -1;
 		}
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

