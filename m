Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEFB118D01
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 16:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfLJPuv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 10 Dec 2019 10:50:51 -0500
Received: from smtp.qindel.com ([89.140.90.34]:59140 "EHLO thor.qindel.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727178AbfLJPuv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 10:50:51 -0500
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 6AB106055F;
        Tue, 10 Dec 2019 16:50:49 +0100 (CET)
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id Q4OGcQ4Ho6eB; Tue, 10 Dec 2019 16:50:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 30B47605C1;
        Tue, 10 Dec 2019 16:50:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at thor.qindel.com
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 2uWwDMPfPC9A; Tue, 10 Dec 2019 16:50:49 +0100 (CET)
Received: from gverdu.qindel.com (gverdu.qindel.com [172.26.8.99])
        by thor.qindel.com (Postfix) with ESMTPSA id BB6856055F;
        Tue, 10 Dec 2019 16:50:45 +0100 (CET)
From:   Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Subject: [PATCH] usbip: Remove unaligned pointer usage from usbip tools
Date:   Tue, 10 Dec 2019 16:50:45 +0100
Message-ID: <5176009.64u6Zm7RkX@gverdu.qindel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The usbip tools use packed structs for network communication. Taking the
address of a packed member of a struct can crash the program with SIGBUS
on architectures with strict alignment requirements.

Also, recent versions of GCC detect this situation and emit a warning that
is fatal due to -Werror being used.

error: taking address of packed member of ‘struct
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]

Fix this by copying the data to an aligned location and operating there.

Signed-off-by: Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
---
 tools/usb/usbip/src/usbip_network.c | 30 +++++++++++++++--------------
 tools/usb/usbip/src/usbip_network.h | 12 ++++++------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_network.c b/tools/usb/usbip/src/usbip_network.c
index d595d72693fb..1c0038ee0abd 100644
--- a/tools/usb/usbip/src/usbip_network.c
+++ b/tools/usb/usbip/src/usbip_network.c
@@ -50,39 +50,41 @@ void usbip_setup_port_number(char *arg)
 	info("using port %d (\"%s\")", usbip_port, usbip_port_string);
 }
 
-void usbip_net_pack_uint32_t(int pack, uint32_t *num)
+void usbip_net_pack_uint32_t(int pack, uint8_t *num)
 {
 	uint32_t i;
+	memcpy(&i, num, sizeof(i));
 
 	if (pack)
-		i = htonl(*num);
+		i = htonl(i);
 	else
-		i = ntohl(*num);
+		i = ntohl(i);
 
-	*num = i;
+	memcpy(num, &i, sizeof(i));
 }
 
-void usbip_net_pack_uint16_t(int pack, uint16_t *num)
+void usbip_net_pack_uint16_t(int pack, uint8_t *num)
 {
 	uint16_t i;
+	memcpy(&i, num, sizeof(i));
 
 	if (pack)
-		i = htons(*num);
+		i = htons(i);
 	else
-		i = ntohs(*num);
+		i = ntohs(i);
 
-	*num = i;
+	memcpy(num, &i, sizeof(i));
 }
 
 void usbip_net_pack_usb_device(int pack, struct usbip_usb_device *udev)
 {
-	usbip_net_pack_uint32_t(pack, &udev->busnum);
-	usbip_net_pack_uint32_t(pack, &udev->devnum);
-	usbip_net_pack_uint32_t(pack, &udev->speed);
+	usbip_net_pack_uint32_t(pack, (uint8_t*)&udev->busnum);
+	usbip_net_pack_uint32_t(pack, (uint8_t*)&udev->devnum);
+	usbip_net_pack_uint32_t(pack, (uint8_t*)&udev->speed);
 
-	usbip_net_pack_uint16_t(pack, &udev->idVendor);
-	usbip_net_pack_uint16_t(pack, &udev->idProduct);
-	usbip_net_pack_uint16_t(pack, &udev->bcdDevice);
+	usbip_net_pack_uint16_t(pack, (uint8_t*)&udev->idVendor);
+	usbip_net_pack_uint16_t(pack, (uint8_t*)&udev->idProduct);
+	usbip_net_pack_uint16_t(pack, (uint8_t*)&udev->bcdDevice);
 }
 
 void usbip_net_pack_usb_interface(int pack __attribute__((unused)),
diff --git a/tools/usb/usbip/src/usbip_network.h b/tools/usb/usbip/src/usbip_network.h
index 555215eae43e..821dd65877cc 100644
--- a/tools/usb/usbip/src/usbip_network.h
+++ b/tools/usb/usbip/src/usbip_network.h
@@ -33,9 +33,9 @@ struct op_common {
 } __attribute__((packed));
 
 #define PACK_OP_COMMON(pack, op_common)  do {\
-	usbip_net_pack_uint16_t(pack, &(op_common)->version);\
-	usbip_net_pack_uint16_t(pack, &(op_common)->code);\
-	usbip_net_pack_uint32_t(pack, &(op_common)->status);\
+	usbip_net_pack_uint16_t(pack, (uint8_t*)&(op_common)->version);\
+	usbip_net_pack_uint16_t(pack, (uint8_t*)&(op_common)->code);\
+	usbip_net_pack_uint32_t(pack, (uint8_t*)&(op_common)->status);\
 } while (0)
 
 /* ---------------------------------------------------------------------- */
@@ -163,11 +163,11 @@ struct op_devlist_reply_extra {
 } while (0)
 
 #define PACK_OP_DEVLIST_REPLY(pack, reply)  do {\
-	usbip_net_pack_uint32_t(pack, &(reply)->ndev);\
+	usbip_net_pack_uint32_t(pack, (uint8_t*)&(reply)->ndev);\
 } while (0)
 
-void usbip_net_pack_uint32_t(int pack, uint32_t *num);
-void usbip_net_pack_uint16_t(int pack, uint16_t *num);
+void usbip_net_pack_uint32_t(int pack, uint8_t *num);
+void usbip_net_pack_uint16_t(int pack, uint8_t *num);
 void usbip_net_pack_usb_device(int pack, struct usbip_usb_device *udev);
 void usbip_net_pack_usb_interface(int pack, struct usbip_usb_interface *uinf);
 
-- 
2.21.0




