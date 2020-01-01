Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81D2312DFB6
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2020 18:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgAARWy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 12:22:54 -0500
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:35309 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727318AbgAARWx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jan 2020 12:22:53 -0500
X-Greylist: delayed 3350 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Jan 2020 12:22:39 EST
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id 001GQJMZ001785;
        Wed, 1 Jan 2020 19:26:24 +0300
Received: from oak.local (unknown [188.123.231.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id EEB09106D64;
        Wed,  1 Jan 2020 19:26:20 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     b-liu@ti.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     matwey.kornilov@gmail.com,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2 3/6] usb: musb: Introduce musb_qh_free() helper function
Date:   Wed,  1 Jan 2020 19:26:07 +0300
Message-Id: <20200101162610.15819-4-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200101162610.15819-1-matwey@sai.msu.ru>
References: <20200101162610.15819-1-matwey@sai.msu.ru>
In-Reply-To: <20190403185310.8437-1-matwey@sai.msu.ru>
References: <20190403185310.8437-1-matwey@sai.msu.ru>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reduce the following similar snippets by using musb_qh_free().

    qh->hep->hcpriv = NULL;
    list_del(&qh->ring);
    kfree(qh);

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/usb/musb/musb_host.c | 66 +++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 37aa9f6155d9..5d23c950a21b 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -85,6 +85,21 @@ static bool musb_qh_empty(struct musb_qh *qh)
 	return list_empty(&qh->hep->urb_list);
 }
 
+static void musb_qh_unlink_hep(struct musb_qh *qh)
+{
+	if (!qh->hep)
+		return;
+
+	qh->hep->hcpriv = NULL;
+}
+
+static void musb_qh_free(struct musb_qh *qh)
+{
+	musb_qh_unlink_hep(qh);
+	list_del(&qh->ring);
+	kfree(qh);
+}
+
 /*
  * Clear TX fifo. Needed to avoid BABBLE errors.
  */
@@ -348,7 +363,7 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 	 * invalidate qh as soon as list_empty(&hep->urb_list)
 	 */
 	if (musb_qh_empty(qh)) {
-		struct list_head	*head;
+		struct list_head	*head = NULL;
 		struct dma_controller	*dma = musb->dma_controller;
 
 		if (is_in) {
@@ -367,34 +382,22 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 
 		/* Clobber old pointers to this qh */
 		musb_ep_set_qh(ep, is_in, NULL);
-		qh->hep->hcpriv = NULL;
 
-		switch (qh->type) {
+		/* USB_ENDPOINT_XFER_CONTROL and USB_ENDPOINT_XFER_BULK: fifo
+		 * policy for these lists, except that NAKing should rotate
+		 * a qh to the end (for fairness).
+		 * USB_ENDPOINT_XFER_ISOC and USB_ENDPOINT_XFER_INT: this is
+		 * where periodic bandwidth should be de-allocated if it's
+		 * tracked and allocated; and where we'd update the schedule
+		 * tree...
+		 */
+		if (qh->mux == 1
+		    && (qh->type == USB_ENDPOINT_XFER_CONTROL || qh->type == USB_ENDPOINT_XFER_BULK))
+			head = qh->ring.prev;
 
-		case USB_ENDPOINT_XFER_CONTROL:
-		case USB_ENDPOINT_XFER_BULK:
-			/* fifo policy for these lists, except that NAKing
-			 * should rotate a qh to the end (for fairness).
-			 */
-			if (qh->mux == 1) {
-				head = qh->ring.prev;
-				list_del(&qh->ring);
-				kfree(qh);
-				qh = first_qh(head);
-				break;
-			}
-			/* fall through */
+		musb_qh_free(qh);
 
-		case USB_ENDPOINT_XFER_ISOC:
-		case USB_ENDPOINT_XFER_INT:
-			/* this is where periodic bandwidth should be
-			 * de-allocated if it's tracked and allocated;
-			 * and where we'd update the schedule tree...
-			 */
-			kfree(qh);
-			qh = NULL;
-			break;
-		}
+		qh = head ? first_qh(head) : NULL;
 	}
 
 	if (qh != NULL && qh->is_ready) {
@@ -2435,11 +2438,8 @@ static int musb_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* If nothing else (usually musb_giveback) is using it
 		 * and its URB list has emptied, recycle this qh.
 		 */
-		if (ready && musb_qh_empty(qh)) {
-			qh->hep->hcpriv = NULL;
-			list_del(&qh->ring);
-			kfree(qh);
-		}
+		if (ready && musb_qh_empty(qh))
+			musb_qh_free(qh);
 	} else
 		ret = musb_cleanup_urb(urb, qh);
 done:
@@ -2493,9 +2493,7 @@ musb_h_disable(struct usb_hcd *hcd, struct usb_host_endpoint *hep)
 		while (!musb_qh_empty(qh))
 			musb_giveback(musb, next_urb(qh), -ESHUTDOWN);
 
-		hep->hcpriv = NULL;
-		list_del(&qh->ring);
-		kfree(qh);
+		musb_qh_free(qh);
 	}
 exit:
 	spin_unlock_irqrestore(&musb->lock, flags);
-- 
2.16.4

