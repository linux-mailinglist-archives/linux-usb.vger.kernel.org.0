Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB651B4E44
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 22:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgDVUTv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 16:19:51 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34882 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726087AbgDVUTv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 16:19:51 -0400
Received: (qmail 11295 invoked by uid 2102); 22 Apr 2020 16:13:08 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Apr 2020 16:13:08 -0400
Date:   Wed, 22 Apr 2020 16:13:08 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     William Bader <williambader@hotmail.com>,
        Zeng Tao <prime.zeng@hisilicon.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: hub: Revert commit bd0e6c9614b9 ("usb: hub: try old
 enumeration scheme first for high speed devices")
Message-ID: <Pine.LNX.4.44L0.2004221611230.11262-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit bd0e6c9614b9 ("usb: hub: try old enumeration scheme first for
high speed devices") changed the way the hub driver enumerates
high-speed devices.  Instead of using the "new" enumeration scheme
first and switching to the "old" scheme if that doesn't work, we start
with the "old" scheme.  In theory this is better because the "old"
scheme is slightly faster -- it involves resetting the device only
once instead of twice.

However, for a long time Windows used only the "new" scheme.  Zeng Tao
said that Windows 8 and later use the "old" scheme for high-speed
devices, but apparently there are some devices that don't like it.
William Bader reports that the Ricoh webcam built into his Sony Vaio
laptop not only doesn't enumerate under the "old" scheme, it gets hung
up so badly that it won't then enumerate under the "new" scheme!  Only
a cold reset will fix it.

Therefore we will revert the commit and go back to trying the "new"
scheme first for high-speed devices.

Reported-and-tested-by: William Bader <williambader@hotmail.com>
Ref: https://bugzilla.kernel.org/show_bug.cgi?id=207219
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reverts: bd0e6c9614b9 ("usb: hub: try old enumeration scheme first for high speed devices")
CC: Zeng Tao <prime.zeng@hisilicon.com>
CC: <stable@vger.kernel.org>

---


[as1933]


 Documentation/admin-guide/kernel-parameters.txt |    3 +--
 drivers/usb/core/hub.c                          |    4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

Index: usb-devel/Documentation/admin-guide/kernel-parameters.txt
===================================================================
--- usb-devel.orig/Documentation/admin-guide/kernel-parameters.txt
+++ usb-devel/Documentation/admin-guide/kernel-parameters.txt
@@ -5081,8 +5081,7 @@
 
 	usbcore.old_scheme_first=
 			[USB] Start with the old device initialization
-			scheme,  applies only to low and full-speed devices
-			 (default 0 = off).
+			scheme (default 0 = off).
 
 	usbcore.usbfs_memory_mb=
 			[USB] Memory limit (in MB) for buffers allocated by
Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -2724,13 +2724,11 @@ static bool use_new_scheme(struct usb_de
 {
 	int old_scheme_first_port =
 		port_dev->quirks & USB_PORT_QUIRK_OLD_SCHEME;
-	int quick_enumeration = (udev->speed == USB_SPEED_HIGH);
 
 	if (udev->speed >= USB_SPEED_SUPER)
 		return false;
 
-	return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first
-			      || quick_enumeration);
+	return USE_NEW_SCHEME(retry, old_scheme_first_port || old_scheme_first);
 }
 
 /* Is a USB 3.0 port in the Inactive or Compliance Mode state?

