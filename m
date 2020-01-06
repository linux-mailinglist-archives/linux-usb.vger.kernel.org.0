Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1048131505
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 16:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgAFPnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 10:43:43 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:53246 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726296AbgAFPnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 10:43:43 -0500
Received: (qmail 2560 invoked by uid 2102); 6 Jan 2020 10:43:42 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Jan 2020 10:43:42 -0500
Date:   Mon, 6 Jan 2020 10:43:42 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Roger Whittaker <Roger.Whittaker@suse.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: Fix: Don't skip endpoint descriptors with maxpacket=0
In-Reply-To: <20200105122846.GA6776@suse.com>
Message-ID: <Pine.LNX.4.44L0.2001061040270.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It turns out that even though endpoints with a maxpacket length of 0
aren't useful for data transfer, the descriptors do serve other
purposes.  In particular, skipping them will also skip over other
class-specific descriptors for classes such as UVC.  This unexpected
side effect has caused some UVC cameras to stop working.

In addition, the USB spec requires that when isochronous endpoint
descriptors are present in an interface's altsetting 0 (which is true
on some devices), the maxpacket size _must_ be set to 0.  Warning
about such things seems like a bad idea.

This patch updates an earlier commit which would log a warning and
skip these endpoint descriptors.  Now we only log a warning, and we
don't even do that for isochronous endpoints in altsetting 0.

We don't need to worry about preventing endpoints with maxpacket = 0
from ever being used for data transfers; usb_submit_urb() already
checks for this.

Reported-and-tested-by: Roger Whittaker <Roger.Whittaker@suse.com>
Fixes: d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length")
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://marc.info/?l=linux-usb&m=157790377329882&w=2

---


[as1928]


 drivers/usb/core/config.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -346,12 +346,16 @@ static int usb_parse_endpoint(struct dev
 			endpoint->desc.wMaxPacketSize = cpu_to_le16(8);
 	}
 
-	/* Validate the wMaxPacketSize field */
+	/*
+	 * Validate the wMaxPacketSize field.
+	 * Some devices have isochronous endpoints in altsetting 0;
+	 * the USB-2 spec requires such endpoints to have wMaxPacketSize = 0
+	 * (see the end of section 5.6.3), so don't warn about them.
+	 */
 	maxp = usb_endpoint_maxp(&endpoint->desc);
-	if (maxp == 0) {
-		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has wMaxPacketSize 0, skipping\n",
+	if (maxp == 0 && !(usb_endpoint_xfer_isoc(d) && asnum == 0)) {
+		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has invalid wMaxPacketSize 0\n",
 		    cfgno, inum, asnum, d->bEndpointAddress);
-		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
 
 	/* Find the highest legal maxpacket size for this endpoint */

