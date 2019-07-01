Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F47465A0
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 19:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfFNRXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 13:23:16 -0400
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:50801 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbfFNRXQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Jun 2019 13:23:16 -0400
X-Greylist: delayed 2129 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Jun 2019 13:23:05 EDT
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id x5EGl5ZD020147;
        Fri, 14 Jun 2019 19:47:10 +0300
Received: from oak.local (unknown [92.243.181.209])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 10EF4433F0;
        Fri, 14 Jun 2019 19:47:06 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     b-liu@ti.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     matwey.kornilov@gmail.com,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] usb: musb: Introduce musb_qh_empty() helper function
Date:   Fri, 14 Jun 2019 19:45:50 +0300
Message-Id: <20190614164554.27679-3-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190614164554.27679-1-matwey@sai.msu.ru>
References: <20190403185310.8437-1-matwey@sai.msu.ru>
 <20190614164554.27679-1-matwey@sai.msu.ru>
In-Reply-To: <20190403185310.8437-1-matwey@sai.msu.ru>
References: <20190403185310.8437-1-matwey@sai.msu.ru>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use musb_qh_empty() instead of &qh->hep->urb_list to avoid code
duplicating.

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/usb/musb/musb_host.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 3ffea6a5e022..37aa9f6155d9 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -80,6 +80,11 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
 			struct urb *urb, int is_out,
 			u8 *buf, u32 offset, u32 len);
 
+static bool musb_qh_empty(struct musb_qh *qh)
+{
+	return list_empty(&qh->hep->urb_list);
+}
+
 /*
  * Clear TX fifo. Needed to avoid BABBLE errors.
  */
@@ -342,7 +347,7 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 	/* reclaim resources (and bandwidth) ASAP; deschedule it, and
 	 * invalidate qh as soon as list_empty(&hep->urb_list)
 	 */
-	if (list_empty(&qh->hep->urb_list)) {
+	if (musb_qh_empty(qh)) {
 		struct list_head	*head;
 		struct dma_controller	*dma = musb->dma_controller;
 
@@ -2430,7 +2435,7 @@ static int musb_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 		/* If nothing else (usually musb_giveback) is using it
 		 * and its URB list has emptied, recycle this qh.
 		 */
-		if (ready && list_empty(&qh->hep->urb_list)) {
+		if (ready && musb_qh_empty(qh)) {
 			qh->hep->hcpriv = NULL;
 			list_del(&qh->ring);
 			kfree(qh);
@@ -2475,7 +2480,7 @@ musb_h_disable(struct usb_hcd *hcd, struct usb_host_endpoint *hep)
 		/* Then nuke all the others ... and advance the
 		 * queue on hw_ep (e.g. bulk ring) when we're done.
 		 */
-		while (!list_empty(&hep->urb_list)) {
+		while (!musb_qh_empty(qh)) {
 			urb = next_urb(qh);
 			urb->status = -ESHUTDOWN;
 			musb_advance_schedule(musb, urb, qh->hw_ep, is_in);
@@ -2485,7 +2490,7 @@ musb_h_disable(struct usb_hcd *hcd, struct usb_host_endpoint *hep)
 		 * other transfers, and since !qh->is_ready nothing
 		 * will activate any of these as it advances.
 		 */
-		while (!list_empty(&hep->urb_list))
+		while (!musb_qh_empty(qh))
 			musb_giveback(musb, next_urb(qh), -ESHUTDOWN);
 
 		hep->hcpriv = NULL;
-- 
2.16.4

