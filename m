Return-Path: <linux-usb+bounces-14525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E26969602
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 09:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2AD8281C4A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 07:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2941320011A;
	Tue,  3 Sep 2024 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9Olyl99"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA6220010E
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349711; cv=none; b=BxG+VeTD038lIECzrLBwSqEUIvw92AcQ8ZrMVu2qj6TuyGmgLiBYhQF7fQVKCCD9goAtu0gtvmgPEfTe4khZl7rdT7TomcTYYZD2Y2b0mG5uoTMjvm0ijbkj9WAfiHle24F41sUCEv+78XyQmhsO2FH9OMXfyVjXHVYZBMh1nZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349711; c=relaxed/simple;
	bh=OzAAloQkVD+rs+4rsitm3SRVAe1ZtNLTsnKUzGhnlSU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=iE+OsLk7UkO1P4PPHwkl9WHqG3vWV6Dg+V8sGQypuRl8RlA868nXxwkLM4Tg8d78EOqNfnQr13p27FvLZQc1bNu5Z+dfHxEQlkfC/BFNpZwmUC9W2uC/6j3qLtwaMJile9kKz5jrbUv4mlHVe4lkLrTg+aZJkoIkVClZ8sT+hH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9Olyl99; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f401c20b56so49540261fa.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725349708; x=1725954508; darn=vger.kernel.org;
        h=mime-version:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/7j6ikRhorFjHb5RRdadJwTGvQU9QmnobyoOq5Zmkeg=;
        b=P9Olyl99ndsA3fD0Q4M3qNvJkliGaF3cFSMuaPl+Y3XdepMYdiwfoYT2HFV8LaeVm7
         V+0Ae/HSCtLFSAT128LKvcnazz9DvLPGE8Pe7+FLdZvnaxtAcnpjp4xYg89yDu8HMXWr
         Oz4u8DI3t8wVNNVpDmKUmWK2AH5GH5DL7LBfHl7J7NVXarmhnhqUDs9a9AXJB27dvZXX
         HN4KoCea1TkIXHxt360MezdmK7tMTNUnXftWWMspIEEii+4M2XVFm0Trw2DsVB5ASMwl
         IoV92jdO5vZ3e6mc74sh1s4uIaoHO2JJxcWkyKhqgB7RsLDjrnDQI41tZhCaRlgg8GS/
         9cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349708; x=1725954508;
        h=mime-version:in-reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7j6ikRhorFjHb5RRdadJwTGvQU9QmnobyoOq5Zmkeg=;
        b=acnsWNqzxDiJ8Y6kChHj7Rtj4Mi1onMkipXaDafI1aogntWknQHWIFGBeCHia5k4pZ
         8gtf/zIUmOsVtMTy8or/e0F0qEOvBADZS/4fMrLmZn2qWeGaQ2kX0z/+kBW4tX1LH7Ou
         NRVDMeSxR/ZDVmNKkGVOeMmmI4CzoJD1Qt5wSuRhWoVu4s7A1frOjODpggsh4Qlr5tX8
         eR3dKFiqu/OVeK+vv6SQ9ZOhiGrbV8BXVskCnmkaJKj4s010gHMKxM6pxvaakx9JX5IT
         S7w32aUsoO9j3aJga1+dc3pG1VFjjTgxljUd2cgHxscQvxldBRrha+Hij/QjL4w68e34
         i1hQ==
X-Gm-Message-State: AOJu0YzeJGLxe38k0B36ROkIIhMf27GKnRNogcvgRvwUPo4tuDNg0fsY
	/msFT4nVF9yX0WXyWjmRoxqtl7wh1Zs5W6UkLLDpvWu6l17IPg6p
X-Google-Smtp-Source: AGHT+IFGEs0SMf9dB+zJAEYitydPbZwWlv6hgpSy2L6+drwnJV0MS5h7Gn7jGVyx8P4tcoUDjwou2Q==
X-Received: by 2002:a2e:b88a:0:b0:2f5:cd0:9e0c with SMTP id 38308e7fff4ca-2f612b1cadfmr48129951fa.21.1725349707262;
        Tue, 03 Sep 2024 00:48:27 -0700 (PDT)
Received: from foxbook (bfh247.neoplus.adsl.tpnet.pl. [83.28.45.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615181c46sm20970171fa.103.2024.09.03.00.48.26
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 03 Sep 2024 00:48:26 -0700 (PDT)
Date: Tue, 3 Sep 2024 09:48:22 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: schaefer@alphanet.ch
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <20240903094822.3ae297cb@foxbook>
In-Reply-To: <ZswP0+cLIqkTF0D/@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/h9t487cNKtjtBgvVTZr6klO"

--MP_/h9t487cNKtjtBgvVTZr6klO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

[ I changed the title a little. And please use "reply to all" when
responding to the list, so that everybody involved in the thread gets
the response directly, regardless of linux-usb subscription status. ]

This 6.11-rc5 result is still not looking great, and neither is the
non-UAS 5.10.223 for that matter. These xHCI errors shouldn't be there;
it looks like there are still some bugs in URB cancellation code or in
the hardware maybe.

I'm not very familiar with streams stuff, but I remember having similar
symptoms on isochronous devices due to a particular hardware bug (not
on ASMedia though) and due to some event processing bugs.

I can offer this patch for testing (on 6.11-rc5), which tries to:
1. work around (hypothetical) similar HW bugs on non-NEC controllers
2. generally add more error checking in this area
3. log all transfer completion events and print the log on errors

This may shed more light on what's going on and why things are failing.
Knowing xHCI driver, in each of those cases it probably gets completely
stuck, until SCSI layer loses patience 30 seconds later and requests a
reset of the storage device.

Regards,
Michal

--MP_/h9t487cNKtjtBgvVTZr6klO
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=strange-debug.patch

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4ea2c3e072a9..0acdcf4d28db 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -814,11 +814,16 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 	seg->bounce_offs = 0;
 }
 
-static int xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
-			   struct xhci_ring *ep_ring, int status)
+static int __xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
+			   struct xhci_ring *ep_ring, int status, const char *from)
 {
 	struct urb *urb = NULL;
 
+	ep_ring->cleanup_first_dma = xhci_trb_virt_to_dma(td->start_seg, td->first_trb);
+	ep_ring->cleanup_last_dma = xhci_trb_virt_to_dma(td->last_trb_seg, td->last_trb);
+	ep_ring->cleanup_status = status;
+	ep_ring->cleanup_from = from;
+
 	/* Clean up the endpoint's TD list */
 	urb = td->urb;
 
@@ -862,6 +867,8 @@ static int xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 	return 0;
 }
 
+#define xhci_td_cleanup(xhci, td, ep_ring, status) __xhci_td_cleanup(xhci, td, ep_ring, status, __func__)
+
 
 /* Complete the cancelled URBs we unlinked from td_list. */
 static void xhci_giveback_invalidated_tds(struct xhci_virt_ep *ep)
@@ -1153,14 +1160,13 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			/*
 			 * NEC uPD720200 sometimes sets this state and fails with
 			 * Context Error while continuing to process TRBs.
-			 * Be conservative and trust EP_CTX_STATE on other chips.
 			 */
-			if (!(xhci->quirks & XHCI_NEC_HOST))
-				break;
+			xhci_info(xhci, "Stop Endpoint Context Error & Stopped on slot %d ep %d\n",
+					slot_id, ep_index);
 			fallthrough;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
-			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
+			xhci_info(xhci, "Stop ep completion ctx error, ep is running\n");
 
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 			if (!command) {
@@ -1176,6 +1182,11 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 		}
 	}
 
+	int state = GET_EP_CTX_STATE(ep_ctx);
+	if (comp_code != COMP_SUCCESS || state != EP_STATE_STOPPED)
+		xhci_err(xhci, "Stop Endpoint on slot %d ep %d failed with comp %d ctx_state %d\n",
+				slot_id, ep_index, comp_code, state);
+
 	/* will queue a set TR deq if stopped on a cancelled, uncleared TD */
 	xhci_invalidate_cancelled_tds(ep);
 	ep->ep_state &= ~EP_STOP_CMD_PENDING;
@@ -2636,6 +2647,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (!ep_ring)
 		return handle_transferless_tx_event(xhci, ep, trb_comp_code);
 
+	snprintf(&ep_ring->log_b[ep_ring->log_i++][0], 100,
+			"event %px ep_trb_dma %llx comp_code %d len %d slot %d ep %d",
+			event, ep_trb_dma, trb_comp_code, EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)), slot_id, ep_index);
+	ep_ring->log_i %= 5;
+
 	/* Look for common error cases */
 	switch (trb_comp_code) {
 	/* Skip codes that require special handling depending on
@@ -2863,6 +2879,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 					"comp_code %u\n", ep_index,
 					trb_comp_code);
 				trb_in_td(xhci, td, ep_trb_dma, true);
+				xhci_info(xhci, "last xhci_td_cleanup: first_dma %llx last_dma %llx status %d from %s\n",
+						ep_ring->cleanup_first_dma, ep_ring->cleanup_last_dma,
+						ep_ring->cleanup_status, ep_ring->cleanup_from);
+				for (int i = 0; i < 5; i++)
+					xhci_info(xhci, "handle_tx_event log %2d: %s\n", i-4, &ep_ring->log_b[(ep_ring->log_i + i) % 5][0]);
 
 				return -ESHUTDOWN;
 			}
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index ebd0afd59a60..cec743d86a3b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1361,6 +1361,14 @@ struct xhci_ring {
 	enum xhci_ring_type	type;
 	bool			last_td_was_short;
 	struct radix_tree_root	*trb_address_map;
+
+	dma_addr_t		cleanup_first_dma;
+	dma_addr_t		cleanup_last_dma;
+	const char		*cleanup_from;
+	int			cleanup_status;
+
+	int			log_i;
+	char			log_b[5][100];
 };
 
 struct xhci_erst_entry {

--MP_/h9t487cNKtjtBgvVTZr6klO--

