Return-Path: <linux-usb+bounces-1600-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D500E7C887E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 17:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16BC51C20F2E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 15:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE5F1B283;
	Fri, 13 Oct 2023 15:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCFD1B27C
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 15:22:14 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 017EC95
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 08:22:12 -0700 (PDT)
Received: (qmail 43260 invoked by uid 1000); 13 Oct 2023 11:22:12 -0400
Date: Fri, 13 Oct 2023 11:22:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Douglas Gilbert <dgilbert@interlog.com>,
  USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] usbutils: lsusb-t: print entries for devices with no
 interfaces
Message-ID: <feeb9f88-b72c-4a37-88ac-4bb28f4bfd3a@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Not all USB devices have interfaces.  This is true in particular of
the STMicroelectronics STEVAL-USBC2DP Type-C to DisplayPort adapter,
as well as possibly other USB-C devices.

As a result these devices do not show up in the output from "lsusb -t",
because the logic in print_tree_dev_interface() lists interfaces, not
devices (as implied by the function's name).  This means that the
output from "lsusb -t" can be inconsistent with the output from
"lsusb", since some devices are omitted.

To fix the problem, we make the subroutine call print_usbdevice() at
least once even if the device has no interfaces, and make the latter
routine print a minimal description of such devices (anything that does
not require access to the interface descriptor).

Reported-and-tested-by: Douglas Gilbert <dgilbert@interlog.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/linux-usb/70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com/

---

 lsusb-t.c |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

Index: usbutils-master/lsusb-t.c
===================================================================
--- usbutils-master.orig/lsusb-t.c
+++ usbutils-master/lsusb-t.c
@@ -183,9 +183,12 @@ static void print_usbdevice(struct usbde
 	char lanes[32];
 
 	lanes_to_str(lanes, d->tx_lanes, d->rx_lanes);
-	get_class_string(subcls, sizeof(subcls), i->bInterfaceClass);
+	if (i)
+		get_class_string(subcls, sizeof(subcls), i->bInterfaceClass);
 
-	if (i->bInterfaceClass == 9)
+	if (!i)
+		printf("Port %03u: Dev %03u, %sM%s\n", d->portnum, d->devnum, d->speed, lanes);
+	else if (i->bInterfaceClass == 9)
 		printf("Port %03u: Dev %03u, If %u, Class=%s, Driver=%s/%up, %sM%s\n", d->portnum, d->devnum, i->ifnum, subcls,
 		       i->driver, d->maxchild, d->speed, lanes);
 	else
@@ -690,11 +693,12 @@ static void sort_busses(void)
 static void print_tree_dev_interface(struct usbdevice *d, struct usbinterface *i)
 {
 	indent += 3;
-	while (i) {
+	do {
 		printf(" %*s", indent, "|__ ");
 		print_usbdevice(d, i);
-		i = i->next;
-	}
+		if (i)
+			i = i->next;
+	} while (i);
 	indent -= 3;
 }
 static void print_tree_dev_children(struct usbdevice *d)

