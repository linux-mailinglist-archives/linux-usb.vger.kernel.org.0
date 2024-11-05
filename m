Return-Path: <linux-usb+bounces-17116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00A9BCC84
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 13:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442261F23309
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 12:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02B01D516D;
	Tue,  5 Nov 2024 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg5p78nH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6653C1D3199
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730809103; cv=none; b=G1cqhAxe8e7pNGTvOCTpZVAFfuD0BLPGnLnk+PfsZ78g2DsNILtJLx4P5IPyaWlgIE0SLsxpOZguJB0sKvWfmDtfdmHGHEsNDfTLRP9zn+60nLxwEYz5Os45yn30QwCWsaFoN6M1QJJy/4tkhoPRiD9a5Hv77mmiYX3vqaPMb0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730809103; c=relaxed/simple;
	bh=nNgd3UcD8D8VkVUx+x3RAZrXEceRV3FqqnscXKZr/hw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a7RENfWXGFSZOoLMO8RxsLlvKrLHYOSxxhbGEPy9o7XddwYeIWyMYc5MtfTHc1l/mR35tmht8SnqkLgmqXkzLeTLUiboM/xB50uxsw8nkkFw9dPVTi6kDMWvx+j2z1KpC4BFOtmX4A9kIAc2btAuD2NQw0Q/RqH76jD7TiaN2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg5p78nH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e8607c2aso5857969e87.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2024 04:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730809099; x=1731413899; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BdDLcMFY2mG2Phc+zx4HvMYHNxMj1KFZ+AdfDb2wysQ=;
        b=Qg5p78nH6L1EmiyP8T0zyY81MBMMf3WzV22paUihKLGpC9RRT1NXFAuqrKIDF+CIoR
         FKF6ghyEnR+F8t3RU98U6GCTbSg4WOunuVBQDCtCD+enMmnvEZjdGwKv/B3B4w5O92C9
         O+/IrYSt5e4c/hAJfJD0Kh0bhBcNTGADsO0kjYneK2VtpLXZh0xQLQALq96fsOOLWGKL
         EwDE9rkhARa7vG8Tx1PIElyTkRlYY5vD5FmnL4A4Iw/wXctw4QUtf8aVHUKAAHjvxHaJ
         eqjDlGXtsHVgShSsigH7vbIc6gxeMVqZKzunRdav6P0klVdSTsUCzkWeWU7ZLwQoizrf
         jPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730809099; x=1731413899;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdDLcMFY2mG2Phc+zx4HvMYHNxMj1KFZ+AdfDb2wysQ=;
        b=e2H2ZG0hebEXtflrgEZqUqQIEFAgVM01zttuNnjUfrJsxKsrv6wLLhH7uHJ5WMDGqu
         8LKaVhOgYIrlG8YvQ05zKkJFYQ/tP/HwAqkT4QzNhqCo4BxEpkVFWXaeeG0zUkoaW7gy
         AIgk/6ModiFFCouJYdTA1X0LB/lWKqzv6RBAWN2JZ+YrwzQpwh9lAOuyTCIQ2Y0tVefY
         sSMsuW7s9MlkXdDe00mXMEghvQet/5Nagr3AslECz6Lx9u7wi8RUveeks5Vr8TagOJss
         kRGLwiJVKdqHb+MrY/5dBBwvWPXPuySqAN3kdGusP3DXS76FdeoqUnnSuAFDR3yrq4j3
         i7/w==
X-Forwarded-Encrypted: i=1; AJvYcCVJSoS8CQs0rHltf/t4iHuym7ZD9W7XhfEP+B7FToxOHJKdwJlhYa27JLqSZY9Ji+2wZcXEaqr+o6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY5ITqFIhKBEwh6rc6AbrPYJWVbX+LYQvqi0eYxXtsmkWtNj1r
	GmuEQJs6ucL3nA9LhjWJFyD7tytjiI+VNkBL00bKvPVvsFPYUGnK
X-Google-Smtp-Source: AGHT+IHwwO949+p/oXFvlVivM+KW4M4wBfEdeOadcr4qLs3agbs5aAeWZpSqD8Xeq7nmQG2+bAC2hQ==
X-Received: by 2002:a05:6512:ba2:b0:539:968a:9196 with SMTP id 2adb3069b0e04-53b34a2d6e3mr20132389e87.48.1730809099171;
        Tue, 05 Nov 2024 04:18:19 -0800 (PST)
Received: from foxbook (bhf124.neoplus.adsl.tpnet.pl. [83.28.95.124])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde0c76sm2096927e87.265.2024.11.05.04.18.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 05 Nov 2024 04:18:17 -0800 (PST)
Date: Tue, 5 Nov 2024 13:18:12 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4 0/3] xhci: Fix Stop Endpoint problems
Message-ID: <20241105131812.79c0dbf9@foxbook>
In-Reply-To: <25bf5ad8-e0fd-4d4b-8288-021321f54d30@linux.intel.com>
References: <20241104103200.533fe1fb@foxbook>
	<25bf5ad8-e0fd-4d4b-8288-021321f54d30@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/iw5lsjaib6aD2lQC3+fxrkg"

--MP_/iw5lsjaib6aD2lQC3+fxrkg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, 5 Nov 2024 13:05:19 +0200, Mathias Nyman wrote:
> Out of curiosity, what was the longest needed 'stop endpoint' retry
> time you saw which still had a successful outcome?

On NEC, periodic endpoints appear to take up to one ESIT. It's one or
two retries on fast isochronous EPs, but interrupt may take a while.

The longest I have seen was 24ms on a SuperSpeed EP with bInterval 11,
so it looks like this may be the chip's limit (bInterval 11 = 128ms),
but admittedly, I haven't tested this thoroughly with many devices.

No problems ever seen with bulk or control on NEC.

On ASM3142 it seems that one retry tends to be enough, and IIRC all
endpoint types can misbehave.


I attached a patch, based on the earlier "redundant" patch, which tries
to detect these bugs by looping until it sees EP Context state change.
Looping under spinlock sure is dodgy, but with these timeout values it
doesn't seem to completely break the driver and it finds these HC bugs.

And yes, I have seen the "absolutely fubar" case on ASM1042 with bad
cable (repeated halts, resets and stops). Some time later it "died".

Regards,
Michal

--MP_/iw5lsjaib6aD2lQC3+fxrkg
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=xhci-detect-stop-bugs.patch

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b6eb928e260f..85289f09ca18 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -487,6 +487,27 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	return 0;
 }
 
+static bool busywait(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int timeout_ms)
+{
+	struct xhci_ep_ctx *ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep->ep_index);
+	u64 t2, t1 = ktime_get_ns();
+
+	do {
+		t2 = ktime_get_ns();
+		if (GET_EP_CTX_STATE(READ_ONCE(ep_ctx)) == EP_STATE_RUNNING) {
+			xhci_info(xhci, "slot %d ep %d busy wait found ctx_state RUNNING after %lldus\n",
+					ep->vdev->slot_id, ep->ep_index,
+					(t2 - t1) / 1000);
+			return true;
+		}
+	} while (t2 < t1 + timeout_ms * 1000000);
+
+	xhci_info(xhci, "slot %d ep %d busy wait gave up after %lldus\n",
+			ep->vdev->slot_id, ep->ep_index,
+			(t2 - t1) / 1000);
+	return false;
+}
+
 void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
 		unsigned int slot_id,
 		unsigned int ep_index,
@@ -1114,6 +1135,20 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 		return;
 
 	ep_ctx = xhci_get_ep_ctx(xhci, ep->vdev->out_ctx, ep_index);
+	int ctx_state = GET_EP_CTX_STATE(READ_ONCE(ep_ctx));
+
+	if (ep->stop_retry)
+		xhci_info(xhci, comp_code == COMP_SUCCESS ?
+				"it worked!\n" : "it failed %d\n", comp_code);
+	ep->stop_retry = false;
+
+	if (comp_code != COMP_SUCCESS && comp_code != COMP_CONTEXT_STATE_ERROR)
+		xhci_err(xhci, "slot %d ep %d WTF BUG in ep_state 0x%x\n",
+				slot_id, ep_index, ep->ep_state);
+
+	if (comp_code == COMP_SUCCESS && busywait(xhci, ep, 3))
+		xhci_err(xhci, "slot %d ep %d ABSOLUTELY FUBAR BUG in ep_state 0x%x ctx_state %d\n",
+				slot_id, ep_index, ep->ep_state, ctx_state);
 
 	trace_xhci_handle_cmd_stop_ep(ep_ctx);
 
@@ -1132,7 +1167,7 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 	 * next transfer, which then will return -EPIPE, and device side stall is
 	 * noted and cleared by class driver.
 	 */
-		switch (GET_EP_CTX_STATE(ep_ctx)) {
+		switch (ctx_state) {
 		case EP_STATE_HALTED:
 			xhci_dbg(xhci, "Stop ep completion raced with stall, reset ep\n");
 			if (ep->ep_state & EP_HAS_STREAMS) {
@@ -1149,19 +1184,55 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
 				break;
 			ep->ep_state &= ~EP_STOP_CMD_PENDING;
 			return;
+
 		case EP_STATE_STOPPED:
+			bool predicted = true;
 			/*
-			 * NEC uPD720200 sometimes sets this state and fails with
-			 * Context Error while continuing to process TRBs.
-			 * Be conservative and trust EP_CTX_STATE on other chips.
+			 * Per xHCI 4.6.9, Stop Endpoint command on a Stopped
+			 * EP is a Context State Error, and EP stays Stopped.
+			 * This outcome is valid if the command was redundant.
 			 */
-			if (!(xhci->quirks & XHCI_NEC_HOST))
-				break;
-			fallthrough;
+			if (ep->ep_state & EP_STOP_CMD_REDUNDANT)
+				predicted = false;
+			/*
+			 * Or it really failed on Halted, but somebody ran Reset
+			 * Endpoint later. EP state is now Stopped and EP_HALTED
+			 * still set because Reset EP handler will run after us.
+			 */
+			if (ep->ep_state & EP_HALTED)
+				predicted = false;
+			/*
+			 * On some HCs EP state remains Stopped for some tens of
+			 * us to a few ms or more after a doorbell ring, and any
+			 * new Stop Endpoint fails without aborting the restart.
+			 * This handler may run quickly enough to still see this
+			 * Stopped state, but it will soon change to Running.
+			 *
+			 * Assume this bug on unexpected Stop Endpoint failures.
+			 * Keep retrying until the EP starts and stops again, on
+			 * chips known to have the bug and to react positively.
+			 */
+			if (busywait(xhci, ep, predicted? 30: 3)) {
+				xhci_err(xhci, "slot %d ep %d %sSTOPPED BUG in ep_state 0x%x\n",
+						slot_id, ep_index, predicted? "": "UNPREDICTED ",
+						ep->ep_state);
+				goto retry;
+			}
+			if (predicted)
+				xhci_err(xhci, "slot %d ep %d MISPREDICTED STOPPED BUG in ep_state 0x%x (busywait too short?)\n",
+						slot_id, ep_index, ep->ep_state);
+			else
+				xhci_info(xhci, "slot %d ep %d not a bug predicted in ep_state 0x%x\n",
+						slot_id, ep_index, ep->ep_state);
+			break;
+
 		case EP_STATE_RUNNING:
 			/* Race, HW handled stop ep cmd before ep was running */
-			xhci_dbg(xhci, "Stop ep completion ctx error, ep is running\n");
-
+			xhci_err(xhci, "slot %d ep %d RUNNING BUG in ep_state %d\n",
+					slot_id, ep_index, ep->ep_state);
+retry:
+			xhci_info(xhci, "stop again and see what happens...\n");
+			ep->stop_retry = true;
 			command = xhci_alloc_command(xhci, false, GFP_ATOMIC);
 			if (!command) {
 				ep->ep_state &= ~EP_STOP_CMD_PENDING;
@@ -4375,11 +4446,31 @@ int xhci_queue_evaluate_context(struct xhci_hcd *xhci, struct xhci_command *cmd,
 int xhci_queue_stop_endpoint(struct xhci_hcd *xhci, struct xhci_command *cmd,
 			     int slot_id, unsigned int ep_index, int suspend)
 {
+	struct xhci_virt_ep *ep;
 	u32 trb_slot_id = SLOT_ID_FOR_TRB(slot_id);
 	u32 trb_ep_index = EP_INDEX_FOR_TRB(ep_index);
 	u32 type = TRB_TYPE(TRB_STOP_RING);
 	u32 trb_suspend = SUSPEND_PORT_FOR_TRB(suspend);
 
+	/*
+	 * Any of that means the EP is or will be Stopped by the time this
+	 * command runs. Queue it anyway for its side effects like calling
+	 * our default handler or complete(). But our handler must know if
+	 * the command is redundant, so check it now. The handler can't do
+	 * it later because those operations may finish before it runs.
+	 */
+	ep = xhci_get_virt_ep(xhci, slot_id, ep_index);
+	if (ep) {
+		if (ep->ep_state & (SET_DEQ_PENDING | EP_HALTED | EP_CLEARING_TT))
+			ep->ep_state |= EP_STOP_CMD_REDUNDANT;
+		else
+			ep->ep_state &= ~EP_STOP_CMD_REDUNDANT;
+		if (ep->ep_state & EP_STOP_CMD_REDUNDANT)
+			xhci_info(xhci, "slot %d ep %d queuing a redundant Stop Endpoint in ep_state 0x%x\n",
+					slot_id, ep_index, ep->ep_state);
+	}
+	/* else: don't care, the handler will do nothing anyway */
+
 	return queue_command(xhci, cmd, 0, 0, 0,
 			trb_slot_id | trb_ep_index | type | trb_suspend, false);
 }
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f0fb696d5619..05555ca4f38a 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -670,6 +670,8 @@ struct xhci_virt_ep {
 #define EP_SOFT_CLEAR_TOGGLE	(1 << 7)
 /* usb_hub_clear_tt_buffer is in progress */
 #define EP_CLEARING_TT		(1 << 8)
+/* queued Stop Endpoint is expected to fail */
+#define EP_STOP_CMD_REDUNDANT	(1 << 9)
 	/* ----  Related to URB cancellation ---- */
 	struct list_head	cancelled_td_list;
 	struct xhci_hcd		*xhci;
@@ -694,6 +696,8 @@ struct xhci_virt_ep {
 	int			next_frame_id;
 	/* Use new Isoch TRB layout needed for extended TBC support */
 	bool			use_extended_tbc;
+
+	bool			stop_retry;
 };
 
 enum xhci_overhead_type {

--MP_/iw5lsjaib6aD2lQC3+fxrkg--

