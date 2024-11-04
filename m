Return-Path: <linux-usb+bounces-17009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 117BD9BAFB7
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 10:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F6DA1F2220B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE69A1AD3E1;
	Mon,  4 Nov 2024 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/0O6qgu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29F96FC5
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730712840; cv=none; b=Vb/ngv9ZP8vuAcUk2xiXFvbOhHeTQpkRa+T4eG7Jaam2mNIw/jDy6UkKxtdA+/WRLW033B0ma71gwH06Bwd51qaH7kY76qNcvtX+3yuDjQIbXj3P/CLH2ZrN1LTiipix0fLQddRbmLnhziaa+F7E0BBJBYbHgJlrUm4GpXLfxWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730712840; c=relaxed/simple;
	bh=7gy2UshydHRIp1IWzckGJjEYIpKZqVXcPwL73r8hRQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGASHuiCHJBvyac45ayNUhKINMv/esjtxFeWVB19qQly1Nwy1ZULvKFLkPBYYYQnYOH5OqGyZfXf6qklO7LVycAVrhs3ap1XPKpXbZAoI5xOfRPkBJZFRewDb/isdm4+WWHly/jxsBtCOI/vjuQCcS810/oP40+eOKZ2jmaAFTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/0O6qgu; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so6016649e87.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 01:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730712837; x=1731317637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xOBLG3kSV0OpgvB1+z4iz5n0HRqbxwmvzGC6YunFdg=;
        b=B/0O6qguQATlyONt+MOM28Zq6UznrpssYUZgtX7fqHtexPFqM9jW286dwzZu0zDqzt
         Mf4raqWV54ZE1spzfA35q+KHufYNRP279G9hL7YCH74hjKcZ27dHlqho/XqfAcu0ODJB
         +vK4iv1ZL0pGPGONFZSK1sebHLuyk9UuYZlIjxJMYKWuo+PzStnIY9apUhSh2QFgKGYW
         linAIgXaXvmxJcx5766RtAPCkLJrJlPkKb0mqRefrqSLlk4Wrq4cR48wFUN8ydWMxVvA
         /t9MNRMW+4eXMgqkv+NsVPuFLByVveKEPQ1RbLvWGQjjGzA8jLTI+8W272bH9n3uxTBk
         EwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712837; x=1731317637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xOBLG3kSV0OpgvB1+z4iz5n0HRqbxwmvzGC6YunFdg=;
        b=d1mtC7m5ODz/1DJhUNExPpIzugDRsYscfVfsXLphnqAs4fFOydoOhsTPdy2EbkD/OO
         uLIMP61Q5jXD5oP8rZLjN5xxi8bHIjYrwga7kwq6dyrxWalagWYdy7DDSvdpzYEHDnW9
         lvAE2zwLRusDXTuFWFnsX4wO2NUktalC31DDTd1NnkCxmkiPbmgcRNBmSHo11ULVkUqA
         BxVoXgr5FH/gEGkGZQs/l02Joo79GZFI4wpidcv1s+96y0AQ0Y+NxvogDPuvAdFnAtp7
         BVflsnLaSZ3X0nQFy8KTY7fQtb3gH7AxlNnHiZVhm7JOV7UOOzdFMs+Cl+A2yNF3Qnu9
         MRzg==
X-Gm-Message-State: AOJu0YyVacLdpup5whrXALNIEmcfrbITrTZ8Q3NzUHv6xhNiKRQgq1oS
	i4g1LPEsuIvI5UYoS7y9qQOgA7P1rcGee3CFEyRv1lscVx+r3E3t
X-Google-Smtp-Source: AGHT+IG21533qzrsUbvlm/PvMq54d+MRB/3bMDzliQN4RQaFo5NgER2ZfAXq2smuuQJWABdMIM3gkg==
X-Received: by 2002:a05:6512:689:b0:536:a4f1:d214 with SMTP id 2adb3069b0e04-53d65de561cmr7909023e87.19.1730712836649;
        Mon, 04 Nov 2024 01:33:56 -0800 (PST)
Received: from foxbook (bhf124.neoplus.adsl.tpnet.pl. [83.28.95.124])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c7c4sm1584776e87.115.2024.11.04.01.33.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 Nov 2024 01:33:56 -0800 (PST)
Date: Mon, 4 Nov 2024 10:33:53 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH v4 2/3] usb: xhci: Fix TD invalidation under pending Set TR
 Dequeue
Message-ID: <20241104103353.33ff4d98@foxbook>
In-Reply-To: <20241104103200.533fe1fb@foxbook>
References: <20241104103200.533fe1fb@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xhci_invalidate_cancelled_tds() may not work correctly if the hardware
is modifying endpoint or stream contexts at the same time by executing
a Set TR Dequeue command. And even if it worked, it would be unable to
queue Set TR Dequeue for the next stream, failing to clear xHC cache.

On stream endpoints, a chain of Set TR Dequeue commands may take some
time to execute and we may want to cancel more TDs during this time.
Currently this leads to Stop Endpoint completion handler calling this
function without testing for SET_DEQ_PENDING, which will trigger the
aforementioned problems when it happens.

On all endpoints, a halt condition causes Reset Endpoint to be queued
and an error status given to the class driver, which may unlink more
URBs in response. Stop Endpoint is queued and its handler may execute
concurrently with Set TR Dequeue queued by Reset Endpoint handler.

(Reset Endpoint handler calls this function too, but there seems to
be no possibility of it running concurrently with Set TR Dequeue).

Fix xhci_invalidate_cancelled_tds() to work correctly under a pending
Set TR Dequeue. Bail out of the function when SET_DEQ_PENDING is set,
then make the completion handler call the function again and also call
xhci_giveback_invalidated_tds(), which needs to be called next.

This seems to fix another potential bug, where the handler would call
xhci_invalidate_cancelled_tds(), which may clear some deferred TDs if
a sanity check fails, and the TDs wouldn't be given back promptly.

Said sanity check seems to be wrong and prone to false positives when
the endpoint halts, but fixing it is beyond the scope of this change,
besides ensuring that cleared TDs are given back properly.

Fixes: 5ceac4402f5d ("xhci: Handle TD clearing for multiple streams case")
CC: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 98e12267bbf6..30b392715f1e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
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
@@ -1359,7 +1366,6 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	struct xhci_ep_ctx *ep_ctx;
 	struct xhci_slot_ctx *slot_ctx;
 	struct xhci_td *td, *tmp_td;
-	bool deferred = false;
 
 	ep_index = TRB_TO_EP_INDEX(le32_to_cpu(trb->generic.field[3]));
 	stream_id = TRB_TO_STREAM_ID(le32_to_cpu(trb->generic.field[2]));
@@ -1460,8 +1466,6 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			xhci_dbg(ep->xhci, "%s: Giveback cancelled URB %p TD\n",
 				 __func__, td->urb);
 			xhci_td_cleanup(ep->xhci, td, ep_ring, td->status);
-		} else if (td->cancel_status == TD_CLEARING_CACHE_DEFERRED) {
-			deferred = true;
 		} else {
 			xhci_dbg(ep->xhci, "%s: Keep cancelled URB %p TD as cancel_status is %d\n",
 				 __func__, td->urb, td->cancel_status);
@@ -1472,11 +1476,15 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 	ep->queued_deq_seg = NULL;
 	ep->queued_deq_ptr = NULL;
 
-	if (deferred) {
-		/* We have more streams to clear */
+	/* Check for deferred or newly cancelled TDs */
+	if (!list_empty(&ep->cancelled_td_list)) {
 		xhci_dbg(ep->xhci, "%s: Pending TDs to clear, continuing with invalidation\n",
 			 __func__);
 		xhci_invalidate_cancelled_tds(ep);
+		/* Try to restart the endpoint if all is done */
+		ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
+		/* Start giving back any TDs invalidated above */
+		xhci_giveback_invalidated_tds(ep);
 	} else {
 		/* Restart any rings with pending URBs */
 		xhci_dbg(ep->xhci, "%s: All TDs cleared, ring doorbell\n", __func__);
-- 
2.43.0


