Return-Path: <linux-usb+bounces-14901-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A0973605
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A13E1F22E67
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D9418EFD2;
	Tue, 10 Sep 2024 11:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+OI/Cca"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7741D14D280
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 11:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966976; cv=none; b=uOBQBeFHvpX1pQ8wGpwQwbComU4u6+KNN5IUFW5tguzZWUlLogbZVbIjTS6COv3LOnlOXQtO3EwUivGTex1WR83jos6a/vcxoI+N7ZCVjzYTJLvr9QTvOG892FrImGKV0o6+1VAL7VPqvw89655AOcvShgDLj+QihOcqFHh6VpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966976; c=relaxed/simple;
	bh=vWx3OsHZfTBLBj3M2yCnxaSLhWPE8rG3Cse+BVzr5YI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZP59hscJYTFZbROiYIHm5F02mSlDf+4FXKVTshrHIjApwwqt/NCWzlCWS9fO/xOjilFuvrTDAQtRu6E8PgAOMGX8Rf9NciobGhLTgD30Ote2v6/0/6PL+zoafzfTxnaK0EDhXI1oc1/YlBsoAYqmnRsqtzrsOuETAJI3XPzap24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+OI/Cca; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c26852af8fso7112699a12.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 04:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725966973; x=1726571773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx8FzSFe/guD7xX4NHI/4SGCYLDWs9mpc3tcoZkDLoQ=;
        b=K+OI/Ccak771J82d13UMXO2ob2EM9Z/kn93I+yY26VWfd0KFS3Liw2EdY3vB5UhZx7
         Z2snYr87xgfrtbfWomF+ptjHPleNZXQsGeRR9NYSpXZ525Ufrft2tRcfqbNnDlZyfooR
         /lx9kE+v052EQARt1iHni41nJkFsDV+wUcnbv4ZR/LBAQCbUzLmDrmYPQFIko3qtUCQ7
         V8xAd6aYs961Uoqj8RCsOIAfD0VIQ2TPpJ2TX77wtxxB8GLGOe7AqI7kbMYwmgPS+BWg
         m/Wj+2+MeOlazJoueMaS9pfMEL6PfS7E2NezazYrWPyxLdYrss0le5V43mFk7hacWJ6s
         tIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725966973; x=1726571773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rx8FzSFe/guD7xX4NHI/4SGCYLDWs9mpc3tcoZkDLoQ=;
        b=RSeZdDXt/fyx8d4t+pj6V3PMY2Wz6AknvRt/6i3W/aCai2cIjnfhZDdD5RVRWae6Yb
         DlKA2uixalql6FSIWU0nCNwQ/XbcmZaWOy8XGQCxnpu5zKcx21wDOVAJc2e3Pxyl8JpG
         exvVv4tZL0FDpxMc4J0Yrjm9iG2YiLaiBkJYtIB7FLzNIl13rdji0+yHde0W7O3gowXV
         zbBhakG2ZIjE44IaCQA7f5+w+8X98XJNqq/I8nAv0f5oJzzedA6TZAfGpdIfXkv8aOjD
         sby+cZRymg7eL3/WfXjpV8Ibq6LbWu6/n/HGtOIRcyUtls6IVz20+f6PJmIYSbI4X+zG
         fLrw==
X-Gm-Message-State: AOJu0YyvOa89ZhYJ4ylIHY05Y3RykPKCZovpGsPk7kyU1VIAA7qHVf5h
	wrEQdY1nCfq1a1Xu2+HF3aqKtND8FTxp11uJEE1bflyCB91xbIt5
X-Google-Smtp-Source: AGHT+IGzJXJMUiVsGF1jY0remwXMinymy6WutzcKLqheZ2eCIMmL+t1edReFyfHQMf+kqJ183am/Bw==
X-Received: by 2002:a17:907:9807:b0:a86:fa3d:e984 with SMTP id a640c23a62f3a-a8ffab290e1mr44306566b.20.1725966972752;
        Tue, 10 Sep 2024 04:16:12 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d258318aesm464073966b.45.2024.09.10.04.16.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 04:16:12 -0700 (PDT)
Date: Tue, 10 Sep 2024 13:16:09 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 4/5] usb: xhci: Simplify the TD skipping loop further
Message-ID: <20240910131609.20434c3c@foxbook>
In-Reply-To: <20240910131233.409c6481@foxbook>
References: <20240910131233.409c6481@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Now that everything not related to skipping has been removed from the
loop, its role becomes more clear. It repeatedly skips the first TD on
the ring, as long as one exists, doesn't match the event, and is isoc.

Rewrite this logic more succintly and unify the various exit paths.
The skip flag is always cleared, so do it only once (nitpick: it used
not to be cleared on non-isoc exit, no big deal). Print one universal
debug message too, and count how many TDs were skipped.

Note: the test for non-isoc URB is valuable because skip_isoc_td()
writes to URB fields which don't exist on non-isoc URBs. This avoids
memory corruption in the unlucky event of a severe HW or SW bug.

Add a helper function for getting the first TD from the ring's queue
to make the code less of an eyesore.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 61 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 56b0c0e85293..db9bc7db5aac 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2591,6 +2591,15 @@ static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_
 	return 0;
 }
 
+/*
+ * Return the first TD pending on a transfer ring, or NULL if none.
+ */
+static struct xhci_td *xhci_ring_pending_td(struct xhci_ring *ring)
+{
+	return list_first_entry_or_null(&ring->td_list,
+					struct xhci_td, td_list);
+}
+
 /*
  * If this function returns an error condition, it means it got a Transfer
  * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
@@ -2777,8 +2786,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 * We wait for the final IOC event, but if we get an event
 	 * anywhere outside this TD, just give it back already.
 	 */
-	td = list_first_entry_or_null(&ep_ring->td_list,
-						struct xhci_td, td_list);
+	td = xhci_ring_pending_td(ep_ring);
 
 	if (td && td->error_mid_td && !trb_in_td(xhci, td, ep_trb_dma, false)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
@@ -2786,48 +2794,35 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		ep_ring->deq_seg = td->last_trb_seg;
 		inc_deq(xhci, ep_ring);
 		xhci_td_cleanup(xhci, td, ep_ring, td->status);
+
+		td = xhci_ring_pending_td(ep_ring);
 	}
 
-	do {
-		/* This TRB should be in the TD at the head of this ring's
-		 * TD list.
-		 */
-		if (list_empty(&ep_ring->td_list)) {
-			if (ep->skip) {
-				ep->skip = false;
-				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
-					 slot_id, ep_index);
-			}
-			break;
-		}
-
-		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
-				      td_list);
-
-		/* Is this a TRB in the currently executing TD? */
+	/* Is this a TRB in the currently executing TD? */
+	if (td)
 		ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
 
+	if (ep->skip) {
+		int skipped = 0;
 		/*
 		 * If ep->skip is set, it means there are missed tds on the
 		 * endpoint ring need to take care of.
 		 * Process them as short transfer until reach the td pointed by
 		 * the event.
 		 */
-		if (ep->skip) {
-			if (ep_seg) {
-				xhci_dbg(xhci,
-					 "Found td. Clear skip flag for slot %u ep %u.\n",
-					 slot_id, ep_index);
-				ep->skip = false;
-			} else {
-				if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
-					skip_isoc_td(xhci, td, ep, status);
-				else
-					break;
-			}
-		}
 
-	} while (ep->skip);
+		while (td && !ep_seg &&
+				usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
+			skip_isoc_td(xhci, td, ep, status);
+			td = xhci_ring_pending_td(ep_ring);
+			if (td)
+				ep_seg = trb_in_td(xhci, td, ep_trb_dma, false);
+			skipped++;
+		}
+		ep->skip = false;
+		xhci_dbg(xhci, "Skipped %d isoc TDs, TD %sfound, clear skip flag for slot %u ep %u\n",
+				skipped, td ? "":"not ", slot_id, ep_index);
+	}
 
 	if (!ep_seg) {
 
-- 
2.43.0


