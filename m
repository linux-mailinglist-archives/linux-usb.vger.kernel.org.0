Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0C610FAF3
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 10:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfLCJls convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 3 Dec 2019 04:41:48 -0500
Received: from smtp.qindel.com ([89.140.90.34]:33731 "EHLO thor.qindel.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725829AbfLCJls (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Dec 2019 04:41:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 285E6602A6;
        Tue,  3 Dec 2019 10:41:46 +0100 (CET)
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kVlBlWNXaw3j; Tue,  3 Dec 2019 10:41:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id A93CC602A7;
        Tue,  3 Dec 2019 10:41:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at thor.qindel.com
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id qvIGBs8lwA5s; Tue,  3 Dec 2019 10:41:45 +0100 (CET)
Received: from gverdu.qindel.com (unknown [172.26.9.239])
        by thor.qindel.com (Postfix) with ESMTPSA id 1D625602A8;
        Tue,  3 Dec 2019 10:41:42 +0100 (CET)
From:   Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbip tools from 5.4 fail to build due to unaligned pointer value warning
Date:   Tue, 03 Dec 2019 10:41:41 +0100
Message-ID: <6347931.BevlSF32Fy@gverdu.qindel.com>
In-Reply-To: <20191129141713.GA3706703@kroah.com>
References: <6296180.lmSoKh01SJ@gverdu.qindel.com> <2248932.DWrUWtNFSA@gverdu.qindel.com> <20191129141713.GA3706703@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

В письме от пятница, 29 ноября 2019 г. 15:17:13 CET пользователь Greg KH написал:
> On Fri, Nov 29, 2019 at 02:49:45PM +0100, Vadim Troshchinskiy wrote:
> > В письме от пятница, 29 ноября 2019 г. 14:33:27 CET пользователь Greg KH
> > 
> > написал:
> > > On Fri, Nov 29, 2019 at 01:24:30PM +0100, Vadim Troshchinskiy wrote:
> > > > Hello,
> > > > 
> > > > Building the usbip tools from 4.15 is failing under Fedora 30, gcc
> > > > version
> > > 
> > > > 9.2.1:
> > > When 4.15 was released, there was no such gcc version :)
> > > 
> > > 4.15 is long end-of-life, please use a more modern kernel release with
> > > newer versions of gcc.
> > 
> > Ah, my apologies, had a bit of a mix-up here. This compilation problem was
> > on v5.4 as it says in the title, I'm working on porting something from
> > 4.15 and accidentally put that there.
> 
> Ah, sorry about that.
> 
> Send patches on, odds are no one has tried this yet.

Okay, how does this look?


From db04ae3c88f605f900cf4e9d7a27a849bf6222a3 Mon Sep 17 00:00:00 2001
From: Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
Date: Tue, 3 Dec 2019 10:31:25 +0100
Subject: [PATCH] Remove unaligned pointer usage from usbip tools.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The usbip tools use packed structs for network communication. Taking the
address of a packed member of a struct can crash the program with SIGBUS
on architectures with strict alignment requirements.

Also, recent versions of GCC detect this situation and emit a warning that
is fatal due to -Werror being used.

error: taking address of packed member of ‘struct
usbip_usb_device’ may result in an unaligned pointer value [-Werror=address-
of-packed-member]

Fix this by copying the data to an aligned location and operating there.
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







