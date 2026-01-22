Return-Path: <linux-usb+bounces-32628-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COTzC3s/cmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32628-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:17:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7869A688EE
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2429A7A43E3
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 13:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537C631985D;
	Thu, 22 Jan 2026 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="m8Z5GM2X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E02257848
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089024; cv=none; b=rxQhJYjZksXW7b58xcUKL7E9dFHv1i74bp57jRgzY3DYF55zvUGuqgYXLIlnq2FMpTMheqDeNdQikOyIDs+hTriRsBksQ1r/roLcPT+xVqURp3F9Teb58mhTv3uQsEHpAl8EV8wks311pW7DCJHCUJ/NxklCTPFISwitxv6qhas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089024; c=relaxed/simple;
	bh=xstBY1otCmpNmF5nX3oerdAAwnWRr2bAQHwksL5A0tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPLGe5QMJdmcwJDnNJ0032Iu6pSiwA7ERHNIXWm6gpOBJFMMwqQ8nXOw0Gaq0ItbpQE9LWJc7kgDqaPW5OJviWfo6B6sr/Rhd3MOmBghBYwo1bMOP/MDF99hKNtr+GfWeMk5pWgw9n5mSAr2YCPsPv2pSvb4HOHtdeDchd1oiN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=m8Z5GM2X; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769088938;
	bh=fYX2PrjP1GH3ll7FQe+xXCX5oJ0K7YizCyoXkSA4KqM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=m8Z5GM2XYzfBr8nqeOq/0t9FcGUYkTPimci9CX2FlR3ZUb7DbLB1VjeQod/rS6EW3
	 s+qVbQXfU6VjROmrN1DbsR/PbuSbiNN+6kP823ICuxMe0JNXStjzbJCoafcPkB7eL5
	 IUbtiydFOb6DFBcTztsv4cgRPLCTlDJ35vPCjQXA=
X-QQ-mid: zesmtpip4t1769088931tf8dd6171
X-QQ-Originating-IP: FUUUgp7zKRo5qOgJXuSVGqbhqOPK4A2BVA2aEDObpUk=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 22 Jan 2026 21:35:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5040734372046046051
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: niklas.neronin@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	kenny@panix.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: [PATCH v9] usb:xhci:route device to secondary interrupters
Date: Thu, 22 Jan 2026 21:35:29 +0800
Message-ID: <D1E5DA225382C9DF+20260122133529.3365410-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <6b32133b-35ef-4ee5-89a8-5d4cd9e3ab68@linux.intel.com>
References: <6b32133b-35ef-4ee5-89a8-5d4cd9e3ab68@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NlEYm++f8aeKasi/R/dcxGfqmA4KuTPTWhcASoWQH0TGY4E1ahUDd7aS
	Uwis2uhAwQrHrSjKxdEhkk+pj87YjGkwCdRXkKacr96Lxjj9ysBbGQ3l4Y9VZJsqAhsGEX6
	T+Od0VIJqUohkoSWS0LOPlz7i7jgY1zgZMbgMibABdkk94YO2RxeQxprd2BLwRdPa1oeNU3
	XxzhYSeHJQwCxUzX6hAcowSab1HXAjcEUxlb4d/w1tm0OixI2JhDYQj/AJ1Fc1XFvUsUpXq
	avRimLOhb2ImlFCySP7uRHI7/sfC0Fm1+gd8j1nMVX7InYHKpEzfRaG7Qzq36HSewBJUmAA
	hmaJ3YpQL5qVpOfnGh4xFUF1iLJ2XovYxnIbykKVAYuEW80YR0ES6BjQWjfU7JYgmgg5Ghc
	cLw+5GJYUZEWLNceomIYv1VgqhghTyDHZIBKUBek3idhIxF2sLev9i11hVnNbNet+6y/DIT
	K/XIM46pm8JgxV/LjDB2ASh0ZDIw3UwtpFrnBH3/9HRBhiGV9Ze9fZlx2uuxaam8enfYhbK
	L7Scpg9XfEiZNBHGSojeSsTd1EK+qx2dAFeEnI+lHdsXHQXeLveyznPtA2vgbQQTJfI3ZHz
	9YHO5SzfzDCrFqNc2+gP11Aa8GIEXEcfktDLkqVfMH29fUwpBHmjVW9Ds/yvfM4UU/njUyS
	J60hmzF/5WMq5H9ggDwF4dn1wWKXK3qkKVKP2RI/hjIZy4a/mH1HrUCj67HI0M1ZXZZyzw7
	bFhnqTMQZTQOtM6Wkb5k6rpBUpEQHseWTySpPv5ctjj30sJdlc2GpHiaSllc9xJB1wNc8gq
	pfIYxoyikZSGDBnCgKEFG4isDmsTfeJdvIRz/BSW2Su+vKmFioo7pDDGf+F/f9XNwO+9iLU
	AbBskmuciEbAULD5JFOkuo4ords6yD+ShkjXrdRv8NceWGHc3bB/ZFDnkpIVyQ64GkwmBzD
	fmgPitkBpNXS9ghB1mvHK3UiQWaRMMhDItrlgUkMeY2i+iq/9lIieZNMKWF1zBhD6ChOtVH
	7OzAAnTVUoBand0XKk7vnPUJ5tdx1x0VoNa6DmlYCUykJqoRXRGo0nzqyckBMlVxNwaRQPm
	9z+wSGfpWWqsPU6he/f28vURhMmQvjP8gEeIA2s5hUs4Elj/F5sNX0=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32628-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	DMARC_POLICY_ALLOW(0.00)[uniontech.com,none];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Queue-Id: 7869A688EE
X-Rspamd-Action: no action

Hi Niklas,

Thanks for the detailed review and the concrete suggestions.

I'll go through each of your comments and rework the patch accordingly,
including aligning secondary interrupter allocation/initialization with
the primary path and tightening the IRQ handling loops and naming.

I also have an idea I'd like to discuss with you before sending patch v10.
It's related to secondary event timing around S4 on some systems, and how
to ensure we handle late events at the right boundary. I'll describe the
approach in a follow-up and would appreciate your feedback.

Phenomenon:
With v9 (routing devices to secondary interrupters), some machines show
intermittent warnings during S4 such as:
 xhci_hcd 0000:03:00.3: Event dma 0x00000000ffe3e810 for ep 2 status 13
 not part of TD at 00000000ffe3ea20 - 00000000ffe3ea20
 xhci_hcd 0000:00:14.0: Event TRB for slot 17 ep 1 with no TDs queued
In our testing these messages do not impact device functionality.

Analysis:
My hypothesis is that slot/endpoint teardown can complete (TD lists are
removed and the endpoint/slot transitions are finished), while the
secondary event ring still contains late transfer events for the same
slot. When those events are processed after the software TD state has
been reclaimed, xHCI reports completions that no longer match any queued
TD, triggering the warnings.

Idea (xhci_drain_slot_secondary_events):
The intent of xhci_drain_slot_secondary_events is to proactively consume
and handle any remaining secondary-ring events for a given Slot ID at a
well-defined boundary (e.g., right after a slot/endpoint-affecting
command completion, before tearing down TD bookkeeping). It handles the
secondary event ring so that late completions for that slot are handled
while the slot context/TD tracking is still coherent, avoiding residual
events being processed after teardown.

The example code is as follows, and it can also be submitted as another patch.

@@ -1860,6 +1863,10 @@ static void handle_cmd_completion(struct xhci_hcd *xhci,
        }

        cmd_type = TRB_FIELD_TO_TYPE(le32_to_cpu(cmd_trb->generic.field[3]));
+
+       /* Drain slot secondary events before command-specific teardown logic */
+       xhci_drain_slot_secondary_events(xhci, cmd_trb);
+
        switch (cmd_type) {
        case TRB_ENABLE_SLOT:
                xhci_handle_cmd_enable_slot(slot_id, cmd, cmd_comp_code);
@@ -3138,6 +3145,72 @@ static int xhci_handle_events(struct xhci_hcd *xhci, struct xhci_interrupter *ir
        return 0;
 }

+/*
+ * Handle a slot's secondary event ring at command completion boundaries.
+ *
+ * With secondary interrupters, transfer events may lag behind command
+ * completions (handled on interrupter 0). Commands that stop/reset/disable
+ * endpoints/slots can reclaim TD state before those transfer events are
+ * processed, leading to "Spurious event dma" reports. Call this from
+ * handle_cmd_completion() before command-specific completion handling.
+ */
+static void xhci_drain_slot_secondary_events(struct xhci_hcd *xhci,
+               union xhci_trb *cmd_trb)
+{
+       u32 field3, cmd_type, slot_id;
+       struct xhci_virt_device *vdev;
+       struct xhci_interrupter *sec_ir;
+       unsigned int intr;
+
+       /* No secondary routing -> nothing to do */
+       if (!xhci->secondary_irqs_enabled)
+               return;
+
+       field3   = le32_to_cpu(cmd_trb->generic.field[3]);
+       cmd_type = TRB_FIELD_TO_TYPE(field3);
+       slot_id  = TRB_TO_SLOT_ID(field3);
+
+       if (!slot_id)
+               return;
+
+       /*
+        * Drain only for commands that can stop/reset/disable endpoints/slots
+        * and/or cause the driver to reclaim TD ownership.
+        */
+       switch (cmd_type) {
+       case TRB_STOP_RING:
+       case TRB_SET_DEQ:
+       case TRB_RESET_EP:
+       case TRB_RESET_DEV:
+       case TRB_DISABLE_SLOT:
+               break;
+       case TRB_CONFIG_EP:
+               /* Only needed for deconfigure (drop endpoints) */
+               if (!(field3 & TRB_DC))
+                       return;
+               break;
+       default:
+               return;
+       }
+       intr = vdev->interrupter->intr_num;
+       if (!intr)
+               return; /* slot is on primary interrupter */
+
+       sec_ir = xhci->interrupters[intr];
+       if (!sec_ir || !sec_ir->event_ring)
+               return;
+
+       lockdep_assert_held(&xhci->lock);
+
+       /* Handle pending events normally to complete URB/TD bookkeeping. */
+       xhci_handle_events(xhci, sec_ir, false);
+}
+

