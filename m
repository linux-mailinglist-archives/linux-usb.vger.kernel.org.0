Return-Path: <linux-usb+bounces-16891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2682E9B77C4
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 10:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A4471C21023
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 09:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE018196450;
	Thu, 31 Oct 2024 09:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PW4VWVIU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4082194C8F
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367850; cv=none; b=kvbOcQqqEbvKaWuy7t8TDBo4VD1MI8Ew8SxwmXtR669mOOODJQchOHz6d5TiUpBG3XYjR+Kx+ChW35Rum+YNyrgxpi38ebgcVayhq0N+3Uj86kwrUZqzuS1IahjXMqH92agMKbegJUlG1TUv9aPJFVPsWIKMo7Q3kDX7VJXEJhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367850; c=relaxed/simple;
	bh=nJqeqVFIORHTjM8jepMIV646vUUWTZkmi01il8W04F4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qj83r1RsvF+cdhnTwu4cSHfrzWaGOBP9vuZ3AWXRzv3ldKWcwF05SvYezRlehTG/RwZuX4r4tvMJ9c0I+GI4gE4LI0akh8uE20EDSFMT3BZbScPiq2p55dg5DXpIjAsME7tu1/93uHs0SWjEA6xfj38Eiea1dZF5mpxTpVIX2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PW4VWVIU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f8490856so742415e87.2
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 02:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730367846; x=1730972646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4mVf7CRw66+FEOJmtEGI+h7+Iv2YLHTEZ7B64Dw5CA=;
        b=PW4VWVIUQMl6JnkZrX2wM8R/h6vPUTitca/9HUxMmZIirrsOTViRG82LAxPqSQIeEP
         FMtRsDcTmus7nwu2aPH7S17PXBAga/rq5AokSjsRDygDyGBJ78x5tpprkYAywURBSmVx
         KWOxe+O9uxDC28Trlrlmu/c2v3b8j/rM2eBKTFb1eBtr71HgN2yZF6P/7efoBlb9X8K+
         uJAKqBZiXukPPA40iN/W9zeJEtwX3FBVTXD5KZG0sw/981V7wR2N8lAYMd0/H8aPFvMm
         zhePmldi1+uiNOGFU+X6Ksx+BWxNaaJMq7JUBi7YIkDdlF73bhL8zGthL9bF92wjnOzD
         xxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367846; x=1730972646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4mVf7CRw66+FEOJmtEGI+h7+Iv2YLHTEZ7B64Dw5CA=;
        b=rVP7rxPK2alc0Fw9kBkgX+T1nR/pQCKQVAjMoEjSSKXELjhhjM+vUUbMd9eFjF3GjM
         N7VHOY3UbF41r17eoK8t2BKYxnIkTNPzdYorOj4Xhy2p+u9a1AJf0ivblTFf3sZb5y2F
         NsRYocUABDiwybqYOV8q5TNcQy1oH9EvyYEvtvSBeaGJKsLnnW6Jz+eJfiiNA0X8uXZx
         T18kjCNhoWJdzDYVrvYSZ9oxLKDAEEPlu0ZqfgsTYjDaXHKd6LguTIwSbYndtm2C5qJq
         bCgsMKv8JzBT4ezc0MyT16w1Tx2kLwwimdzvN16myZZLJYE5AZciE0rnKndLX+yfPgre
         xFYw==
X-Gm-Message-State: AOJu0YxdFX7tvTTYMLYJOQ4U6UXYJblTec0EiVNwAopGAimOdixhll0F
	0kjX9jWc5uu7QHnl6/rOuDXN2XWHhe0PH+/ZZnDiMt6zVPVGVHzESlJa6A==
X-Google-Smtp-Source: AGHT+IE0XJLc7I+AAm4dsFFKI0RvPkNXqWSxmNKhpRi5MCk0mrzzujL6p0Uj7DPK/bJjisqYAMttPg==
X-Received: by 2002:a05:6512:1302:b0:536:553f:3ef9 with SMTP id 2adb3069b0e04-53c79e4c5c4mr1281395e87.27.1730367845766;
        Thu, 31 Oct 2024 02:44:05 -0700 (PDT)
Received: from foxbook (bfh123.neoplus.adsl.tpnet.pl. [83.28.45.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde32fesm140530e87.282.2024.10.31.02.44.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Oct 2024 02:44:04 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:44:01 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v3 2/3] usb: xhci: Fix TD invalidation under pending Set TR
 Dequeue
Message-ID: <20241031104401.22a80b14@foxbook>
In-Reply-To: <20241031104159.25f9ff70@foxbook>
References: <20241031104159.25f9ff70@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xhci_invalidate_cancelled_tds() may work incorrectly if the hardware
is modifying some Endpoint or Stream Context by executing a Set TR
Dequeue command at the same time. And even if it worked, it couldn't
queue another Set TR Dequeue if required, failing to clear xHC cache.

Yet this function is called by completion handlers of commands like Stop
Endpoint and Reset Endpoint without any testing for SET_DEQ_PENDING. The
problem remained undetected for long time because the UAS driver rarely
cancels URBs, but it does cancel them sometimes, e.g. on I/O errors.

Make it legal to call xhci_invalidate_cancelled_tds() under a pending
Set TR Dequeue. Bail out of the function when SET_DEQ_PENDING is set,
then make the completion handler call the function again and also call
xhci_giveback_invalidated_tds(), which typically must be called next.

Clean up some code which duplicates functionality of these functions.

Fixes: 5ceac4402f5d ("xhci: Handle TD clearing for multiple streams case")
CC: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 45 ++++++++++++------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 98e12267bbf6..52eb3ee1d7bf 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -959,7 +959,7 @@ static int xhci_handle_halted_endpoint(struct xhci_hcd *xhci,
  * We're also in the event handler, so we can't get re-interrupted if another
  * Stop Endpoint command completes.
  *
- * only call this when ring is not in a running state
+ * only call this on a ring in Stopped state (we may need to queue Set TR Deq)
  */
 
 static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
@@ -973,6 +973,13 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 	unsigned int		slot_id = ep->vdev->slot_id;
 	int			err;
 
+	/*
+	 * This is not going to work if the hardware is changing its dequeue
+	 * pointers as we look at them. Completion handler will call us later.
+	 */
+	if (ep->ep_state & SET_DEQ_PENDING)
+		return 0;
+
 	xhci = ep->xhci;
 
 	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list, cancelled_td_list) {
@@ -1001,7 +1008,9 @@ static int xhci_invalidate_cancelled_tds(struct xhci_virt_ep *ep)
 		if (td->cancel_status == TD_HALTED || trb_in_td(xhci, td, hw_deq, false)) {
 			switch (td->cancel_status) {
 			case TD_CLEARED: /* TD is already no-op */
-			case TD_CLEARING_CACHE: /* set TR deq command already queued */
+				break;
+			case TD_CLEARING_CACHE: /* set TR deq command completed */
+				td->cancel_status = TD_CLEARED;
 				break;
 			case TD_DIRTY: /* TD is cached, clear it */
 			case TD_HALTED:
@@ -1358,8 +1367,6 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	struct xhci_virt_ep *ep;
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_slot_ctx *slot_ctx;
-	struct xhci_td *td, *tmp_td;
-	bool deferred = false;
 
 	ep_index = TRB_TO_EP_INDEX(le32_to_cpu(trb->generic.field[3]));
 	stream_id = TRB_TO_STREAM_ID(le32_to_cpu(trb->generic.field[2]));
@@ -1451,37 +1458,15 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 				  ep->queued_deq_seg, ep->queued_deq_ptr);
 		}
 	}
-	/* HW cached TDs cleared from cache, give them back */
-	list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
-				 cancelled_td_list) {
-		ep_ring = xhci_urb_to_transfer_ring(ep->xhci, td->urb);
-		if (td->cancel_status == TD_CLEARING_CACHE) {
-			td->cancel_status = TD_CLEARED;
-			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
-				 __func__, td->urb);
-			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
-		} else if (td->cancel_status == TD_CLEARING_CACHE_DEFERRED) {
-			deferred = true;
-		} else {
-			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
-				 __func__, td->urb, td->cancel_status);
-		}
-	}
 cleanup:
 	ep->ep_state &= ~SET_DEQ_PENDING;
 	ep->queued_deq_seg = NULL;
 	ep->queued_deq_ptr = NULL;
 
-	if (deferred) {
-		/* We have more streams to clear */
-		xhci_dbg(ep->xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
-			 __func__);
-		xhci_invalidate_cancelled_tds(ep);
-	} else {
-		/* Restart any rings with pending URBs */
-		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
-		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
-	}
+	/* Continue cancellations or restart the ring if done */
+	xhci_invalidate_cancelled_tds(ep);
+	ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+	xhci_giveback_invalidated_tds(ep);
 }
 
 static void xhci_handle_cmd_reset_ep(struct xhci_hcd *xhci, int slot_id,
-- 
2.43.0


