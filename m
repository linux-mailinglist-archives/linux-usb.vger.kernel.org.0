Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6DE1B4E39
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 22:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgDVUO6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 16:14:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34856 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726109AbgDVUO6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 16:14:58 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Apr 2020 16:14:58 EDT
Received: (qmail 11303 invoked by uid 2102); 22 Apr 2020 16:14:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Apr 2020 16:14:57 -0400
Date:   Wed, 22 Apr 2020 16:14:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Cyril Roelandt <tipecaml@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: [PATCH] usb-storage: Add unusual_devs entry for JMicron JMS566
Message-ID: <Pine.LNX.4.44L0.2004221613110.11262-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Cyril Roelandt reports that his JMicron JMS566 USB-SATA bridge fails
to handle WRITE commands with the FUA bit set, even though it claims
to support FUA.  (Oddly enough, a later version of the same bridge,
version 2.03 as opposed to 1.14, doesn't claim to support FUA.  Also
oddly, the bridge _does_ support FUA when using the UAS transport
instead of the Bulk-Only transport -- but this device was blacklisted
for uas in commit bc3bdb12bbb3 ("usb-storage: Disable UAS on JMicron
SATA enclosure") for apparently unrelated reasons.)

This patch adds a usb-storage unusual_devs entry with the BROKEN_FUA
flag.  This allows the bridge to work properly with usb-storage.

Reported-and-tested-by: Cyril Roelandt <tipecaml@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---


[as1934]


 drivers/usb/storage/unusual_devs.h |    7 +++++++
 1 file changed, 7 insertions(+)

Index: usb-devel/drivers/usb/storage/unusual_devs.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_devs.h
+++ usb-devel/drivers/usb/storage/unusual_devs.h
@@ -2317,6 +2317,13 @@ UNUSUAL_DEV(  0x3340, 0xffff, 0x0000, 0x
 		USB_SC_DEVICE,USB_PR_DEVICE,NULL,
 		US_FL_MAX_SECTORS_64 ),
 
+/* Reported by Cyril Roelandt <tipecaml@gmail.com> */
+UNUSUAL_DEV(  0x357d, 0x7788, 0x0114, 0x0114,
+		"JMicron",
+		"USB to ATA/ATAPI Bridge",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_BROKEN_FUA ),
+
 /* Reported by Andrey Rahmatullin <wrar@altlinux.org> */
 UNUSUAL_DEV(  0x4102, 0x1020, 0x0100,  0x0100,
 		"iRiver",

