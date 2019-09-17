Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0FBB5351
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 18:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfIQQrY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 12:47:24 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:38888 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725847AbfIQQrY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 12:47:24 -0400
Received: (qmail 5432 invoked by uid 2102); 17 Sep 2019 12:47:23 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Sep 2019 12:47:23 -0400
Date:   Tue, 17 Sep 2019 12:47:23 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Tomoki Sekiyama <tomoki.sekiyama@gmail.com>,
        <andreyknvl@google.com>, <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: [PATCH] USB: yurex: Don't retry on unexpected errors
In-Reply-To: <0000000000001603470592b13bfc@google.com>
Message-ID: <Pine.LNX.4.44L0.1909171245410.1590-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to Greg KH, it has been generally agreed that when a USB
driver encounters an unknown error (or one it can't handle directly),
it should just give up instead of going into a potentially infinite
retry loop.

The three codes -EPROTO, -EILSEQ, and -ETIME fall into this category.
They can be caused by bus errors such as packet loss or corruption,
attempting to communicate with a disconnected device, or by malicious
firmware.  Nowadays the extent of packet loss or corruption is
negligible, so it should be safe for a driver to give up whenever one
of these errors occurs.

Although the yurex driver handles -EILSEQ errors in this way, it
doesn't do the same for -EPROTO (as discovered by the syzbot fuzzer)
or other unrecognized errors.  This patch adjusts the driver so that
it doesn't log an error message for -EPROTO or -ETIME, and it doesn't
retry after any errors.

Reported-and-tested-by: syzbot+b24d736f18a1541ad550@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
CC: <stable@vger.kernel.org>

---


[as1918]


 drivers/usb/misc/yurex.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/misc/yurex.c
===================================================================
--- usb-devel.orig/drivers/usb/misc/yurex.c
+++ usb-devel/drivers/usb/misc/yurex.c
@@ -132,6 +132,7 @@ static void yurex_interrupt(struct urb *
 	switch (status) {
 	case 0: /*success*/
 		break;
+	/* The device is terminated or messed up, give up */
 	case -EOVERFLOW:
 		dev_err(&dev->interface->dev,
 			"%s - overflow with length %d, actual length is %d\n",
@@ -140,12 +141,13 @@ static void yurex_interrupt(struct urb *
 	case -ENOENT:
 	case -ESHUTDOWN:
 	case -EILSEQ:
-		/* The device is terminated, clean up */
+	case -EPROTO:
+	case -ETIME:
 		return;
 	default:
 		dev_err(&dev->interface->dev,
 			"%s - unknown status received: %d\n", __func__, status);
-		goto exit;
+		return;
 	}
 
 	/* handle received message */
@@ -177,7 +179,6 @@ static void yurex_interrupt(struct urb *
 		break;
 	}
 
-exit:
 	retval = usb_submit_urb(dev->urb, GFP_ATOMIC);
 	if (retval) {
 		dev_err(&dev->interface->dev, "%s - usb_submit_urb failed: %d\n",

