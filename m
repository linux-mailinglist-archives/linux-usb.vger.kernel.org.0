Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3004E7401
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 15:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390340AbfJ1Owg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 10:52:36 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:37416 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730792AbfJ1Owg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 10:52:36 -0400
Received: (qmail 3397 invoked by uid 2102); 28 Oct 2019 10:52:35 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Oct 2019 10:52:35 -0400
Date:   Mon, 28 Oct 2019 10:52:35 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Jacky.Cao@sony.com, <andreyknvl@google.com>, <balbi@kernel.org>,
        <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] USB: Skip endpoints with 0 maxpacket length
In-Reply-To: <00000000000030af530595acdd8b@google.com>
Message-ID: <Pine.LNX.4.44L0.1910281050420.1485-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Endpoints with a maxpacket length of 0 are probably useless.  They
can't transfer any data, and it's not at all unlikely that an HCD will
crash or hang when trying to handle an URB for such an endpoint.

Currently the USB core does not check for endpoints having a maxpacket
value of 0.  This patch adds a check, printing a warning and skipping
over any endpoints it catches.

Now, the USB spec does not rule out endpoints having maxpacket = 0.
But since they wouldn't have any practical use, there doesn't seem to
be any good reason for us to accept them.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---


[as1924]


 drivers/usb/core/config.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: usb-devel/drivers/usb/core/config.c
===================================================================
--- usb-devel.orig/drivers/usb/core/config.c
+++ usb-devel/drivers/usb/core/config.c
@@ -348,6 +348,11 @@ static int usb_parse_endpoint(struct dev
 
 	/* Validate the wMaxPacketSize field */
 	maxp = usb_endpoint_maxp(&endpoint->desc);
+	if (maxp == 0) {
+		dev_warn(ddev, "config %d interface %d altsetting %d endpoint 0x%X has wMaxPacketSize 0, skipping\n",
+		    cfgno, inum, asnum, d->bEndpointAddress);
+		goto skip_to_next_endpoint_or_interface_descriptor;
+	}
 
 	/* Find the highest legal maxpacket size for this endpoint */
 	i = 0;		/* additional transactions per microframe */

