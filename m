Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38ADA1B4E46
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 22:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgDVUUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 16:20:20 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34884 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726087AbgDVUUU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 16:20:20 -0400
Received: (qmail 11323 invoked by uid 2102); 22 Apr 2020 16:20:19 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Apr 2020 16:20:19 -0400
Date:   Wed, 22 Apr 2020 16:20:19 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     NeilBrown <neilb@suse.de>, USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: core: Replace an empty statement with a debug message
Message-ID: <Pine.LNX.4.44L0.2004221618500.11262-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds a dev_dbg() message to usb_create_sysfs_intf_files().
The message is not expected ever to appear; it's real purpose is to
satisfy the __must_check attribute on device_create_file() without
triggering a compiler warning about an empty statement.

In fact we don't really care if the sysfs attribute file doesn't get
created.  The interface string descriptor is purely informational and
hardly ever present.

Suggested-by: NeilBrown <neilb@suse.de>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1936]


 drivers/usb/core/sysfs.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/core/sysfs.c
===================================================================
--- usb-devel.orig/drivers/usb/core/sysfs.c
+++ usb-devel/drivers/usb/core/sysfs.c
@@ -1262,8 +1262,10 @@ void usb_create_sysfs_intf_files(struct
 
 	if (!alt->string && !(udev->quirks & USB_QUIRK_CONFIG_INTF_STRINGS))
 		alt->string = usb_cache_string(udev, alt->desc.iInterface);
-	if (alt->string && device_create_file(&intf->dev, &dev_attr_interface))
-		;	/* We don't actually care if the function fails. */
+	if (alt->string && device_create_file(&intf->dev, &dev_attr_interface)) {
+		/* This is not a serious error */
+		dev_dbg(&intf->dev, "interface string descriptor file not created\n");
+	}
 	intf->sysfs_files_created = 1;
 }
 

