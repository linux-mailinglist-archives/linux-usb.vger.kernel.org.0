Return-Path: <linux-usb+bounces-14900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76F973602
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A549A1C24393
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF18418C03E;
	Tue, 10 Sep 2024 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcCg5L+i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9C1862B3
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725966924; cv=none; b=p8sMB703u8PEwu5Qd7ZChlmtOEhHLuh0ppAdzG8NI6iI7DzKvlQYm19VQdPoqfmkbWFOgZbOYDp7rCAFN0gkZw3HuBKORDzb2DPW+b1vxwuDWUp6+2+vJ1fAZMdI+x10P08oLmNzZEc6NZDazEBNFdZTQPPW5XmzbGibGJCz5TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725966924; c=relaxed/simple;
	bh=hVmQaTKIEnC6MB1zf/naZVpx7ELe/9fGYtK2/R53pR0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hQjAGyy1OPTusCYEUyIMC15syPARGNDCA3+Bb091HfOP68D6GEuEePb68XjlQ0NiH49fmwEU7EE+YGCML6D3nOwh1aKSLXi+MmnPN5vgH7rIDeuGLIxyqWw4BWO7R6fhmY8thmxNB/lFNghQiJIjBn9gEQduD/HyZZM1vK6AtOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcCg5L+i; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so86140266b.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 04:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725966921; x=1726571721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yLxqMhD0synWgyzLhpvt1FtY/fRTgGMWh9h9uRXwIU=;
        b=YcCg5L+iddp4x/VUvrSY56ztBeDoOG6TxvGXHcvRpyiaRn/nJZNUwx2odYzikC870p
         7r4rW2mYnzk+z0+f6SuZORA9b9nY5T5puxbatMn8fU/m9FChnxzWahw5ku4KBf8sJZkA
         qtTMalEdbUMGtONrLELner/D2Tifl6FaVbosMAa0MSpQ1Oft5DmeakDFtVkdjmnn5h9Q
         N/vjelBppnlo/dNvT2EIkSKUuG2KzO3NnvJNMNPTRvnSNZOZUCRX9gTyT0EgblJjhUTz
         79jnUgSjkD5wo6016E4kwcnt83DSpiwE0a5yQSOIJacJt25h2XXKShnizvueFz0TzGS3
         UMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725966921; x=1726571721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yLxqMhD0synWgyzLhpvt1FtY/fRTgGMWh9h9uRXwIU=;
        b=Ttc9xppRiXFXRxiwePJu8xEojyesOjBDL8nsCYYFHoVjNEAcAsm4aFRYFUnLASWJWh
         ZsSQabDEI72FgICwbui+UzZnDSz8xLvTEdUFR0Q4JjHWEeZi6NdCq+2yZLjVhRwN+zD9
         7hyv26r/b1wMCFvPoi8ZT8i7HZJU4p4SUoqhRFCF9moiaRbS3DOaEykZc3XpRBmHeClN
         Dpag/MXW3XarQbsowMwUZaGcolhopnDVo1um/2KhQdM8NFfEzUZGbqi88OCNvUFS04k4
         oVRe/X8MWV+wdhkkhvnVOE2go4fdRmWMmDafPT5uvXkm+o1KK5h9UG4vNd1GtHyFBqac
         4Pxw==
X-Gm-Message-State: AOJu0Yx0aHEN04gtqQINyPv2sNhqs6/YjcS/77nfoa9YHUQwsAqYhGWC
	mwRR88NGdZIwr61eXnTX+/0Um2e8DJUI9sWpfXoH1nONaoLw0mL1wU6vnA==
X-Google-Smtp-Source: AGHT+IHv3K289g79QfhdrSxc3MmAteHoactj4GG0c45jkD/qQY516DC6zP+KwWW1ZIcowgIvFl2SUw==
X-Received: by 2002:a17:907:9813:b0:a86:ac9e:45fd with SMTP id a640c23a62f3a-a8ffae2f33amr38861366b.62.1725966920846;
        Tue, 10 Sep 2024 04:15:20 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25952761sm467218566b.59.2024.09.10.04.15.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 04:15:20 -0700 (PDT)
Date: Tue, 10 Sep 2024 13:15:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 3/5] usb: xhci: Unify event handler's 'empty list' and 'no
 match' cases
Message-ID: <20240910131517.2bc8a403@foxbook>
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

Sometimes handle_tx_event() gets an event which doesn't match any
pending TD. Or it may be that there are simply no pending TDs at all.

These two cases are hardly different, but they are handled by two
separate blocks of code. Some logic is pointlessly duplicated, some
logic is missing or buggy in one branch or in the other.

Reduce the 'empty list' case in the searching loop to a minimum and
merge the code removed from there with almost identical code after
the loop, which deals with the 'no match' case.

This fixes the "spurious success" check in the 'empty list' case not
verifying if the host actually has the quirk, and the lack of halted
endpoint recovery in the 'no match' case.

Remove an obsolete attempt at stall recovery. This code relied on a
bug which has been fixed earlier this year, and it was never really
fully effective because not all cancelled TDs get No-Op'ed.

Make the empty list warning print event completion code, like the
'no match' case does.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 68 ++++++++++++------------------------
 1 file changed, 23 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0eef7cd2f20a..56b0c0e85293 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2606,7 +2606,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	int ep_index;
 	struct xhci_td *td = NULL;
 	dma_addr_t ep_trb_dma;
-	struct xhci_segment *ep_seg;
+	struct xhci_segment *ep_seg = NULL;
 	union xhci_trb *ep_trb;
 	int status = -EINPROGRESS;
 	struct xhci_ep_ctx *ep_ctx;
@@ -2793,28 +2793,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * TD list.
 		 */
 		if (list_empty(&ep_ring->td_list)) {
-			/*
-			 * Don't print wanings if it's due to a stopped endpoint
-			 * generating an extra completion event if the device
-			 * was suspended. Or, a event for the last TRB of a
-			 * short TD we already got a short event for.
-			 * The short TD is already removed from the TD list.
-			 */
-
-			if (!(trb_comp_code == COMP_STOPPED ||
-			      trb_comp_code == COMP_STOPPED_LENGTH_INVALID ||
-			      ep_ring->last_td_was_short)) {
-				xhci_warn(xhci, "WARN Event TRB for slot %u ep %d with no TDs queued?\n",
-					  slot_id, ep_index);
-			}
 			if (ep->skip) {
 				ep->skip = false;
 				xhci_dbg(xhci, "td_list is empty while skip flag set. Clear skip flag for slot %u ep %u.\n",
 					 slot_id, ep_index);
 			}
-
-			td = NULL;
-			goto check_endpoint_halted;
+			break;
 		}
 
 		td = list_first_entry(&ep_ring->td_list, struct xhci_td,
@@ -2848,11 +2832,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (!ep_seg) {
 
 		/*
-		 * Skip the Force Stopped Event. The 'ep_trb' of FSE is not in the current
-		 * TD pointed by 'ep_ring->dequeue' because that the hardware dequeue
-		 * pointer still at the previous TRB of the current TD. The previous TRB
-		 * maybe a Link TD or the last TRB of the previous TD. The command
-		 * completion handle will take care the rest.
+		 * Ignore the Force Stopped Event. The endpoint may stop on
+		 * some Link or No-Op TRB outside our TDs. We don't care.
 		 */
 		if (trb_comp_code == COMP_STOPPED ||
 		    trb_comp_code == COMP_STOPPED_LENGTH_INVALID) {
@@ -2870,13 +2851,25 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		}
 
 		/* HC is busted, give up! */
-		xhci_err(xhci,
-			"ERROR Transfer event TRB DMA ptr not "
-			"part of current TD ep_index %d "
-			"comp_code %u\n", ep_index,
-			trb_comp_code);
-		trb_in_td(xhci, td, ep_trb_dma, true);
-		return -ESHUTDOWN;
+		if (list_empty(&ep_ring->td_list)) {
+			xhci_warn(xhci, "WARN Event TRB for slot %u ep %d comp_code %u with no TDs queued?\n",
+					slot_id, ep_index, trb_comp_code);
+		} else {
+			xhci_err(xhci, "ERROR Transfer event TRB DMA ptr not part of current TD ep_index %d comp_code %u\n",
+					ep_index, trb_comp_code);
+			trb_in_td(xhci, td, ep_trb_dma, true);
+		}
+
+		/*
+		 * Bugs (in HW or SW) may cause the xHC to execute transfers as
+		 * they are being cancelled and forgotten about. Then we get some
+		 * event and have no idea which transfer caused it. If the event
+		 * indicates that the EP halted, try to fix that at least.
+		 */
+		if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
+			xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
+
+		return 0;
 	}
 
 	if (trb_comp_code == COMP_SHORT_PACKET)
@@ -2887,16 +2880,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
 	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb);
 
-	/*
-	 * No-op TRB could trigger interrupts in a case where a URB was killed
-	 * and a STALL_ERROR happens right after the endpoint ring stopped.
-	 * Reset the halted endpoint. Otherwise, the endpoint remains stalled
-	 * indefinitely.
-	 */
-
-	if (trb_is_noop(ep_trb))
-		goto check_endpoint_halted;
-
 	td->status = status;
 
 	/* update the urb's actual_length and give back to the core */
@@ -2906,11 +2889,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
 	else
 		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
-	return 0;
-
-check_endpoint_halted:
-	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
-		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
 
 	return 0;
 
-- 
2.43.0


