Return-Path: <linux-usb+bounces-35725-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMwHLj+0y2kpKAYAu9opvQ
	(envelope-from <linux-usb+bounces-35725-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 13:47:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E137369081
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A14F33029B5C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2026 11:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380563BF680;
	Tue, 31 Mar 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPHtohbE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A4E2BB13
	for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957628; cv=none; b=o8ZoaEw1xzSRf1TxFGoK+fj/ncVhg2HgOlL6/Tgbhsamb3mBCQNQpSPuB78kenGLTcIaqUoPiYA9mDScJvNcL1rPm6wXZOYbcxMQlMoohTVWdLj9EnecD/8uF/gCTrAMbi0MSSGW6F7HbcRBAO8UNLVu0tKchd97IYxlVUO5xZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957628; c=relaxed/simple;
	bh=B1XiFObHruD/1SSfmxkemBr9uv7B4jTvj9Vz+3awB4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WCuoyvEPLMaI23UIF6IAHc1AuoTPGg57Oay9Ca3OM5AHNhVa8PEZZ2Luq4NPPTXsFXH3koV5VYfV3mPP6okG7W0ZGaLv7eHk/rJjOgEYyM2WRHsp9v2VJwhnJpIPpkBVnMuU6eaVCCK97kuXE049BgyUSvIi1U3ZwIL5dLP2XtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPHtohbE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb14227cso73894895e9.3
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774957625; x=1775562425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdUhszXhZ6IzGMCxLmF4j6pE7gwmRTsAAEhI8NhFNh0=;
        b=SPHtohbEIS/htUquBwqaxeZSNWBzhTLgemwMr/J4m8kRDkz0IMKhIM/pOmzPBJS7ac
         fjRdEVB6QWyCoPqeBK9APphQuZZD8E0nkew+66a6yvhYKh2uzyo1nifAkdIZ11UxWEB/
         AKYuPgL8sV3uzd1tF8j+3V4JjAUdSOeQGhoayIp+7dsEa2glAawdh3tP+QldFXK+LVNg
         MSp9DVrmgbVlfK8fTif8WaBG0NQ4Ytmlq+HIzXauVGmmJk78deva24Q+frf0g5S/DjTK
         vbgXdj+pkAArN886IFCMMW42Q4YilNjhOLRwhJvpoLjCLHd8otRg/dh95uvOp7mi/Xo4
         HLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774957625; x=1775562425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdUhszXhZ6IzGMCxLmF4j6pE7gwmRTsAAEhI8NhFNh0=;
        b=d66mlw3sIzZnrw/uFc8P36OTrMoxDu/tvUs/Guf1OyiI9zNXueQFBMnl8/xU3uFmVa
         Qwh2k0IePToV/YMMeqoBEpDHDnQjUv0qbVuPVoIAgfT6LcqVV+uFjzQI6nPQv2DFSqT+
         qK05PeUDop2PuXj9xuWdGwgfDYJlUBMMbyNBDPQmmWrMSRfeQUAbDnlR8hlUlQQevNrO
         w4spznLbyvknHJ2ZzY4KYMSHUdgO11SC+XKNta5uZD9nV3OXRFT7tQhjROTMPwE74Iwx
         lSca3ENEOAnqHN6F2Polo9P1nORudEw2zuKNHH/sVd+kJ6IIBNhbOTgiSXnW/mGrR+sL
         9dGA==
X-Forwarded-Encrypted: i=1; AJvYcCVM5zRopNvembOYMjfgV7kJOVcpSs6xz/CtcGsDOa+0Jcl3tQPM+7G1tVXmP7oxrc/qqx0Ki53YldE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKXT6B2gEvGKi2fP0MSDo8ywYXuOgfHeU/tFcWPQYcZHTV1tt
	zy/BrSBfeDipO4c7PcXID4FMdUhPlcCi8VhXxYoS/1Psq8xIsF1eEzAiC+JHhQ==
X-Gm-Gg: ATEYQzz7r8E82eJpO3KLpZlJJvBGIGl8T/9jjLsiYam3JKQs+cnKsdOwiKIN3tAUquY
	WnKGTwRrVjesKCpPBftnBJs+gf1CW+9CCeUarZgIk9aejiC7hALISgz1WfSRIwoba7zZ5cx7XrS
	wA8ksn4uJvTB1vivwJgiT4bklb1GzkzPWxCr72EtABZ5T0gJnLD/z6Vf1zUk9ZPhrlbEJ/8sMx2
	jcSp+9DA2MAoJ6PCd2VPjeawPae+JaP1oVNmybimxOPdMIfH72BHEjtZ1aClyP0oUPgii1L1otv
	LjmCY9tNEKcoVZP6H2yNtbJAzDLWM8EEt92uyccdyo4x1B9zTvn4yqi2x6/4Rndj65gNPINVCgv
	GK9b19ia5Yn3UpDGVtcwR0kiVycwC3kGqS2/CO44kUkG5CqNulY4BbU09d9ls3aPcKOgbOSwi4K
	GZmC+/wDLWxI247xN6Oh9L6q7WknYj0qmu
X-Received: by 2002:a05:600c:800f:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-48727f4e9d3mr268829525e9.31.1774957625073;
        Tue, 31 Mar 2026 04:47:05 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c769841sm18072205e9.7.2026.03.31.04.47.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 31 Mar 2026 04:47:04 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:46:57 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: [PATCH RFC] xhci: fix Command Aborting, diffferently
Message-ID: <20260331134657.1aea50b3.michal.pecio@gmail.com>
In-Reply-To: <20260316142720.1471906-2-niklas.neronin@linux.intel.com>
References: <20260316142720.1471906-1-niklas.neronin@linux.intel.com>
	<20260316142720.1471906-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35725-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E137369081
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

OK, so here's the alternative approach I suggested: don't try to avoid
CRCR corruption but simply fix it later.

Motivation:

1. Inserting udelay() between low and high DWORD write reliably
   corrupts internal CR Dequeue pointer on some HW.

2. It's unclear if such corruption happens in the field, but surely
   nobody will prove that it can't.

3. Low DWORD gets corrupted even if both DWORDs are written with
   their proper values on some HW.

4. It is indeed a violation of 5.1 to write high DWORD without writing
   the low DWORD immediately prior. The earlier abort doesn't count.

5. Delaying high DWORD until we are sure low DWORD wasn't enough slows
   us down on some HW (and currently disables IRQs for a long time).

6. Need to support 64 bit HCs on systems without writeq() somehow.

Solution:

We can't just write arbitrary deq pointer to CRCR, but we can create
a single-TRB segment which links to our arbitrary command.

TODO:

Make sure new deq and cycle are correct under all circumstances.
Don't panic if we get an event on the trampoline TRB (can it happen?)
Be sure nothing weird happens due to unexpected preexisting bugs -
that whole command management logic is a little scary.

Potential other use:

Avoid the need for wiping the command ring on suspend/resume. Allow
commands to survive the cycle and execute later. Unsure if useful.

Regards,
Michal

---

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 98ef014c8dee..2dabf295a8bc 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -486,6 +486,28 @@ static void xhci_handle_stopped_cmd_ring(struct xhci_hcd *xhci,
 	}
 }
 
+/*
+ * CRCR doesn't support setting arbitrary Dequeue, so write it
+ * to a suitably aligned Link TRB and point the ring there.
+ * The ring must be stopped and not restarted until this returns.
+ */
+static void xhci_set_cr_deq(struct xhci_hcd *xhci, dma_addr_t deq, u32 cycle)
+{
+	u64 cr;
+	dma_addr_t trampoline_dma = xhci->dcbaa->dma +
+			offsetof(struct xhci_device_context_array, cr_trampoline);
+
+	xhci->dcbaa->cr_trampoline.segment_ptr = deq;
+	xhci->dcbaa->cr_trampoline.control = cpu_to_le32(TRB_TYPE(TRB_LINK) | cycle);
+
+	cr = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
+	cr &= CMD_RING_RSVDP;
+	cr |= trampoline_dma | cycle;
+	xhci_write_64(xhci, cr, &xhci->op_regs->cmd_ring);
+
+	xhci_info(xhci, "xhci_set_cr_deq deq %llx\n", deq);
+}
+
 /* Must be called with xhci->lock held, releases and acquires lock back */
 static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 {
@@ -493,6 +515,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	union xhci_trb *new_deq		= xhci->cmd_ring->dequeue;
 	u64 crcr;
 	int ret;
+	u64 ns1, ns2;
 
 	xhci_dbg(xhci, "Abort command ring\n");
 
@@ -502,16 +525,15 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * The control bits like command stop, abort are located in lower
 	 * dword of the command ring control register.
 	 * Some controllers require all 64 bits to be written to abort the ring.
-	 * Make sure the upper dword is valid, pointing to the next command,
-	 * avoiding corrupting the command ring pointer in case the command ring
-	 * is stopped by the time the upper dword is written.
+	 * This may corrupt *both* DWORDS of Dequeue if high DWORD write is seen
+	 * after CRR=0 by some other controllers. We will fix it up.
 	 */
 	next_trb(&new_seg, &new_deq);
 	if (trb_is_link(new_deq))
 		next_trb(&new_seg, &new_deq);
-
 	crcr = xhci_trb_virt_to_dma(new_seg, new_deq);
-	xhci_write_64(xhci, crcr | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);
+
+	xhci_write_64(xhci, CMD_RING_ABORT, &xhci->op_regs->cmd_ring);
 
 	/* Section 4.6.1.2 of xHCI 1.0 spec says software should also time the
 	 * completion of the Command Abort operation. If CRR is not negated in 5
@@ -519,14 +541,21 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
 	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
 	 * and try to recover a -ETIMEDOUT with a host controller reset.
 	 */
+	ns1 = ktime_get_ns();
 	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
 			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
+	ns2 = ktime_get_ns();
+	xhci_info(xhci, "abort took %lldns\n", ns2 - ns1);
 	if (ret < 0) {
 		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
 		xhci_halt(xhci);
 		xhci_hc_died(xhci);
 		return ret;
 	}
+
+	/* fixme: cycle may be wrong, not sure about crcr */
+	xhci_set_cr_deq(xhci, crcr, xhci->cmd_ring->cycle_state);
+
 	/*
 	 * Writing the CMD_RING_ABORT bit should cause a cmd completion event,
 	 * however on some host hw the CMD_RING_RUNNING bit is correctly cleared
@@ -1817,6 +1846,7 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
 	trace_xhci_handle_command(xhci->cmd_ring, &cmd_trb->generic, cmd_dma);
 
 	cmd_comp_code = GET_COMP_CODE(le32_to_cpu(event->status));
+	xhci_info(xhci, "handle_cmd_completion cmd_dma %llx cmd_comp_code %d\n", cmd_dma, cmd_comp_code);
 
 	/* If CMD ring stopped we own the trbs between enqueue and dequeue */
 	if (cmd_comp_code == COMP_COMMAND_RING_STOPPED) {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 32617dc155ac..40069a2c7bf9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -193,6 +193,7 @@ struct xhci_op_regs {
 #define CMD_RING_ABORT		(1 << 2)
 /* true: command ring is running */
 #define CMD_RING_RUNNING	(1 << 3)
+#define CMD_RING_RSVDP		GENMASK_ULL(5, 4)
 /* bits 63:6 - Command Ring pointer */
 #define CMD_RING_PTR_MASK	GENMASK_ULL(63, 6)
 
@@ -789,22 +790,6 @@ struct xhci_tt_bw_info {
 };
 
 
-/**
- * struct xhci_device_context_array
- * @dev_context_ptr	array of 64-bit DMA addresses for device contexts
- */
-struct xhci_device_context_array {
-	/* 64-bit device addresses; we only write 32-bit addresses */
-	__le64			dev_context_ptrs[MAX_HC_SLOTS];
-	/* private xHCD pointers */
-	dma_addr_t	dma;
-};
-/*
- * TODO: change this to be dynamically sized at HC mem init time since the HC
- * might not be able to handle the maximum number of devices possible.
- */
-
-
 struct xhci_transfer_event {
 	/* 64-bit buffer address, or immediate data */
 	__le64	buffer;
@@ -956,6 +941,24 @@ struct xhci_link_trb {
 /* control bitfields */
 #define LINK_TOGGLE	(0x1<<1)
 
+/**
+ * struct xhci_device_context_array
+ * @dev_context_ptr	array of 64-bit DMA addresses for device contexts
+ */
+struct xhci_device_context_array {
+	/* 64-bit device addresses; we only write 32-bit addresses */
+	__le64			dev_context_ptrs[MAX_HC_SLOTS];
+	/* a Link TRB to jump into arbitrary command ring slot */
+	struct xhci_link_trb	cr_trampoline	__aligned(sizeof(64));
+	/* private xHCD pointers */
+	dma_addr_t	dma;
+};
+/*
+ * TODO: change this to be dynamically sized at HC mem init time since the HC
+ * might not be able to handle the maximum number of devices possible.
+ */
+
+
 /* Command completion event TRB */
 struct xhci_event_cmd {
 	/* Pointer to command TRB, or the value passed by the event data trb */

