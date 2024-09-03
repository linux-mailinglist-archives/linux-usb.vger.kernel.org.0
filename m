Return-Path: <linux-usb+bounces-14563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 42973969EF0
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 15:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67CD31C23EEE
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 13:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F221A726D;
	Tue,  3 Sep 2024 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVk+/5f0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CA71CA6AF
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369747; cv=none; b=ie+P1xP9TjIRGtKvtjgxizpJ/ycvaNOhmDubhFdkHH/Gv32Cb/b3HcOmr49jchHOWUgBAHaG60bgt/jzHLMSWl0IlYof0NEVbDxXNXigYInD1xP/uX3tGgDUboDECB1dcF6hT41q76l/P9Onzp0PrDIz8H67ZG9r0Lrz7bjd2l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369747; c=relaxed/simple;
	bh=3ab5um3xIElkjYwxoiRaFVwzbhLTn8H2jwajO1BYXmY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgZ9BCqANYdI6egobbqVN7smYF8W6mfaV+SN8Jzb/x0101WFJNgmFea7k9G5kroE0Zp4l8G/txIjHqyUrvKnHVcUyOtJ7hR949d3bxM/MGop8VbV41SnNHOmmDrz+jOA3+9JbHUiKym6nXWcucz3C276ZBSF4kNTjJaXQta55eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVk+/5f0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5334a8a1b07so6552103e87.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Sep 2024 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725369744; x=1725974544; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wlJ48hqR7fHbUqM61ECu36rSVrWIcIhjUSseINHwsJY=;
        b=cVk+/5f0ySmwILCl3ILsYw3CnjUcKl0GktkDLNmQcw4t+G5GqS/fLPjFcMlBUIIoto
         4ecsWUUEsDjMumGJXKh9ax4Sw+F/D6CavfUzC5vCtsqU9WjR5iUTq9lT0BogzEISKueB
         sZw1ZnEyBdnT/QsV9JJhQvTIrK7tJs/anpWVGzRV9V1YVhHNZTdaVTLPKBju+mz5XhRw
         ESbTO8oQODeT7NfVeZ1LCz/QG8KdP54q/DZomWIdb0mqD1CO+KyUr4F3fF0WjNCQqJd2
         eEj+FblF8Pi6virMyDeh1UNGwIMh7q0M7OO134X71L/VbudjML/LaoRA7GOVxkMsRIC/
         82Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725369744; x=1725974544;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlJ48hqR7fHbUqM61ECu36rSVrWIcIhjUSseINHwsJY=;
        b=WrQvHy4CQBCgts3y1n8idU6peeWs0j+ZSTwo6VGv1RptUIb+cNT/lRV2b1Yj6Gk45+
         ZRNCPj8VOm6BXRATUjamADbd+NPRcoxo1iXscpW3pLXCh0Gqfd24Hh9sBDVJTL3Dmudb
         jfrR3NX8Un2+tU11Cg0QZ6hVayULUM2Jx7wnhL44R9q9cSeu1sYG+0241hIgCUBW6NAP
         TTcCVKyGKF+xauiWnQ10Xqr3IAGUqOER3VUoqAAq0191fRI8VMTo6cQUwjr/7vz7+BWa
         hKi/5cTNVpsN3k8TvYZQDnetQh27YO1r9aERW729cdOtTtMyKOtxkyf+E/yZbHLpdC6e
         Ph8Q==
X-Gm-Message-State: AOJu0Ywfnzl7HpykgU4cmGOSbVUxCr783rwZ/d4B9XTS599jRTSF4LZN
	/lY3wfbMKXO6vTWC+YOcZNMCSVS+AhXuoNlikfzt5gHT8SaTbo6b
X-Google-Smtp-Source: AGHT+IFKf193UbHl4Qu2toXRtyLM4nrqmpzfgHk9eKNP4wxMbWmcxEDIrj4XxKfZNtTH43gi5+tYKQ==
X-Received: by 2002:a05:6512:2309:b0:52e:98f6:c21f with SMTP id 2adb3069b0e04-53546b0b111mr9405740e87.16.1725369743468;
        Tue, 03 Sep 2024 06:22:23 -0700 (PDT)
Received: from foxbook (bfh247.neoplus.adsl.tpnet.pl. [83.28.45.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084024fsm2034636e87.182.2024.09.03.06.22.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 03 Sep 2024 06:22:23 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:22:18 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Marc SCHAEFER <schaefer@alphanet.ch>
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <20240903152218.74393a9e@foxbook>
In-Reply-To: <ZtcHOlqlQMMD4LzY@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
	<20240903094822.3ae297cb@foxbook>
	<ZtcHOlqlQMMD4LzY@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/rjoMU8AAJ3O=K_+v4/hXzep"

--MP_/rjoMU8AAJ3O=K_+v4/hXzep
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> I hope it now works like you want it.
Yes, that was it.

> Thank you, I applied + recompiled.  After a while (~1 hour), I got a
> lot of messages in dmesg, slowing down the md raidcheck to a crawl.
Sorry about that, this was not intended. It looks like your controller
doesn't tolerate the NEC workaround.

Here's a fixed patch which shouldn't have this effect. It only prints
a warning that something fishy is going on and lets it happen. We will
see if it's correlated with the other problems or not.


If using the patch utility, you will need to undo the original change
with -R flag before applying this new one.

Regards,
Michal

--MP_/rjoMU8AAJ3O=K_+v4/hXzep
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=strange-debug-2.patch

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4ea2c3e072a9..0a055737ec33 100644
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
@@ -1155,12 +1162,14 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 			 * Context Error while continuing to process TRBs.
 			 * Be conservative and trust EP_CTX_STATE on other chips.
 			 */
+			xhci_info(xhci, "Stop Endpoint Context Error & Stopped on slot %d ep %d\n",
+					slot_id, ep_index);
 			if (!(xhci->quirks & XHCI_NEC_HOST))
 				break;
 			fallthrough;
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
-			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
+			xhci_info(xhci, "Stop ep completion ctx error, ep is running\n");
 
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 			if (!command) {
@@ -1176,6 +1185,11 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
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
@@ -2636,6 +2650,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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
@@ -2863,6 +2882,11 @@ static int handle_tx_event(struct xhci_hcd *xhci,
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

--MP_/rjoMU8AAJ3O=K_+v4/hXzep--

