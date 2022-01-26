Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6754649CAAE
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 14:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238875AbiAZNXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 08:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238940AbiAZNXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 08:23:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E01C06173B
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 05:23:00 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nCiGJ-0001gV-0u; Wed, 26 Jan 2022 14:22:59 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nCiGI-0091lD-2X; Wed, 26 Jan 2022 14:22:58 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     kieran.bingham@ideasonboard.com, linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca
Subject: [PATCH] dummy_hcd: add isoc support
Date:   Wed, 26 Jan 2022 14:22:49 +0100
Message-Id: <20220126132249.2133168-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <164154749753.1224575.16682991529695492259@Monstersaurus>
References: <164154749753.1224575.16682991529695492259@Monstersaurus>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With this patch, the dummy_hcd gains first support for isoc transfers.
It will complete the whole urb with all packages. Even if the gadget
side did not enqueue any request, the urb will be handled.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---

With this patch it is possible to test the series [1] on any device
using the uvc-gadget code [2].

I added some patches on top of uvc-gadget to prove that it is now
possible to completely remove the configfs parsing and DATA/SETUP event
handling from userspace [3].

To test the gadget, just fill the uvc configfs setup with some script
[4] or even use the modern (but optional) way with gt (gadget-tool) [5]
including libusbgx (uvc/configfs) [6] support and a scheme file
describing the gadget.

[1] https://lore.kernel.org/linux-usb/20220105115527.3592860-1-m.grzeschik@pengutronix.de/

[2] https://git.ideasonboard.org/uvc-gadget.git

[3] https://git.pengutronix.de/cgit/mgr/uvc-gadget/log/?h=ml

[4] https://git.ideasonboard.org/uvc-gadget.git/blob/HEAD:/scripts/uvc-gadget.sh

[5] https://github.com/linux-usb-gadgets/libusbgx

[6] https://github.com/linux-usb-gadgets/gt

 drivers/usb/gadget/udc/dummy_hcd.c | 34 +++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index a2d956af42a23c..aff5f1fa4feef9 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -147,36 +147,30 @@ static const struct {
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep2out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
-/*
 	EP_INFO("ep3in-iso",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep4out-iso",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
 	EP_INFO("ep5in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep6in-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep7out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
-/*
 	EP_INFO("ep8in-iso",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep9out-iso",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
 	EP_INFO("ep10in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep11in-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep12out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
-/*
 	EP_INFO("ep13in-iso",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep14out-iso",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
 	EP_INFO("ep15in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 
@@ -1402,6 +1396,7 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 	struct dummy		*dum = dum_hcd->dum;
 	struct dummy_request	*req;
 	int			sent = 0;
+	int			count = 0;
 
 top:
 	/* if there's no request queued, the device is NAKing; return */
@@ -1459,6 +1454,13 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 				sent += len;
 				urb->actual_length += len;
 				req->req.actual += len;
+				if (usb_pipetype(urb->pipe) == PIPE_ISOCHRONOUS) {
+					if (count <= urb->number_of_packets) {
+						urb->iso_frame_desc[count].actual_length = len;
+						urb->iso_frame_desc[count].status = 0;
+						count++;
+					}
+				}
 			}
 		}
 
@@ -1527,6 +1529,17 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
 		if (rescan)
 			goto top;
 	}
+
+	if (usb_pipetype(urb->pipe) == PIPE_ISOCHRONOUS) {
+		int i;
+
+		for (i = count; i < urb->number_of_packets; ++i) {
+			urb->iso_frame_desc[i].actual_length = 0;
+			urb->iso_frame_desc[i].status = 0;
+		}
+		*status = 0;
+	}
+
 	return sent;
 }
 
@@ -1950,13 +1963,14 @@ static void dummy_timer(struct timer_list *t)
 			 * here are some of the issues we'd have to face:
 			 *
 			 * Is it urb->interval since the last xfer?
-			 * Use urb->iso_frame_desc[i].
-			 * Complete whether or not ep has requests queued.
 			 * Report random errors, to debug drivers.
 			 */
 			limit = max(limit, periodic_bytes(dum, ep));
-			status = -EINVAL;	/* fail all xfers */
-			break;
+			ep->last_io = jiffies;
+			total -= transfer(dum_hcd, urb, ep, limit, &status);
+			if (status == -EINPROGRESS)
+				continue;
+			goto return_urb;
 
 		case PIPE_INTERRUPT:
 			/* FIXME is it urb->interval since the last xfer?
-- 
2.30.2

