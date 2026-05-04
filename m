Return-Path: <linux-usb+bounces-36906-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNTTB1Mt+Wkq6QIAu9opvQ
	(envelope-from <linux-usb+bounces-36906-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:35:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9834C4DEF
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 01:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 217063044F38
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 23:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AC23DDDAA;
	Mon,  4 May 2026 23:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSR0uRjZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC08B3DD532
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 23:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937613; cv=none; b=RxDe0nHzr+ed4l/wWgL/8tkwz7yugcnGUVnvKlx6CmDOG88SDKbfFGcTN4n1USaJP4NWu871VWp8GhYk6pc+SK5w6qxWiYzW8TaEwxSolsfAKfQ9lqVSgNVEDB0iSJ5PaOcfWgg2bgg+kP6ElIQ/IBAcfsx9w1k5/YUkKW0Kcuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937613; c=relaxed/simple;
	bh=bqRrm3879Svv52QqYWelCIlsClvl8DNCQvOp2/0bjWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvUABmeLjGAdrnAC0XxCuUA0yAK+U9sBRTICC7wXHOSEw8FLSPCOHyzQg1f+PLesW3mZgJM5xivDRTCbEOsV83KvGNxd/e86MedsLLVVnJelTJMaIQpBymVDpMnFLdNS0WsOJ6WLV+GHxQudCRffS6zxlIgPUZZKMFNOFpQ6av8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSR0uRjZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bc1f0830f44so262812566b.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777937610; x=1778542410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/yyOFGwhnkUdJViXV/uZtVhX9EjoCfTIEWlX83FbgY=;
        b=LSR0uRjZFUCH5m/JCJFDxatLaXXOBPnyJ55EylZ2AKKdY8d3ZEu9T0eHlxSKKWQ+By
         PIgvo28z4IKF9f9mV8RFkTVJ3k/xs8TM6vp+bjQTG+lExAmTH5jlfOuW0/+EaGFvIRt4
         Wt4B8Hdj4QumJh/MikjGDvr7oGcwv49WzJByB/bxXbCCpcOF9fb5iw77YFER8Lkan7S8
         iinMIFGpViI6jvaINp1U242YmoiUJAWmaR7EKnY5byILp4np2bHJvMfJEn1RpwVasqzh
         6XZUwMozIFpDngQchq4p4RQMX3/7lXOAVIgyjyp/77hPNm4c8nfgY+dfcF6dyomme7e9
         vONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937610; x=1778542410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/yyOFGwhnkUdJViXV/uZtVhX9EjoCfTIEWlX83FbgY=;
        b=lkchoFa0jVaqEPIS8MR76xDT5mbfBoiMv+H+XCBoD/37bwK/NYAufKmERanT/vss4n
         /YnTB33mFcKRTzLY9UGN05Z6N8ri7uOjTdxngVImClpq7rSgV5XGtYY5ZtquqP9Lgjdj
         9x4ZjttS6b+4wTWrNFJPkZyGrypV1NZkLJpEU5l2qW7PrXxmA0MIu+/GdBbaShzSxS72
         /MbD50Wxvlf9OdInsX6U9bluGXzqBY3bDoqeKNYzsgnaqTVuREIMjIU6TbwZj1oWQjbx
         PZqd7NK7e2G/92iTNGcI+zGfSbSn+j33fIzjeFdUSz01JRRSAkVMVfAWfptWHJk+JaVL
         YQog==
X-Gm-Message-State: AOJu0YyCwk34nlbC1YARrnS976tp0L3ODtO5S7m7Vo/3e5TA79BoiRQv
	QxpWzYNbbJOzYsvWg2Rtdnakmz2k6TWfyxFAaXAQGGrYE2iC0ZOuhyZp
X-Gm-Gg: AeBDieuWeAGIzCU53rCdqUVYmEDOazlWUQeYf9dSe6cejgEAV8i0+XfHllwViCjt56q
	SvixKg5WvZveSs0e/mENJvJlhCmIlbqdlqRiqbINC23LEEyjSZ9TyYN6LZzX8cti4fAABz1c66x
	XVw6haIi5ZorLtjTdxi+RlSzMBUj/2s9M+4CzNtfZATdV+UAHc22lulOIVgsVaU+cTMBtUCGLqQ
	6HT0z1yOQXKWfiif36eZ91nN/8YOio8VIYiZUjhjFn6a0vnMbXcoHmZaDngSahPz0IGCiR4kZ5a
	fOeNpOxhewafLqgiE4CtWF+0YPmf2h3B9A3boOYA9qZtqZyOgraGd24KhS0xFD1jHUkga5htxFr
	6D+TT/FqxJMRt+LBEu+HrIFx5j7KP8lX77QL/aye7TYJ7cUCp1jGkrCSBli9471alKXrcBQSpwJ
	sAS28cEbtT9zVrGZikIt58PmA/5BxH+2HL73tZcrESNWrGQdiEa2ePV9knUKSgy29U1THqfMVrL
	Mkd4bAmAfpYRXH0IfdMN0EA8nnJchHsqNmVGFjABxjN8ZFro0PMVsd+xsNH2N2ySegX
X-Received: by 2002:a17:907:6b89:b0:ba6:79c0:c743 with SMTP id a640c23a62f3a-bc3d1338a8amr86860966b.11.1777937610178;
        Mon, 04 May 2026 16:33:30 -0700 (PDT)
Received: from nick-GTR-Pro.arnhem.chello.nl (2001-1c00-3281-1680-7a55-36ff-fe02-cdba.cable.dynamic.v6.ziggo.nl. [2001:1c00:3281:1680:7a55:36ff:fe02:cdba])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6aa4d524sm445224366b.26.2026.05.04.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:33:28 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: mathias.nyman@intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [PATCH 2/2] usb: xhci: fix CFC sequential scheduling lost on ring drain race
Date: Tue,  5 May 2026 01:31:44 +0200
Message-ID: <20260504233143.10242-4-nick83ola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260504233143.10242-2-nick83ola@gmail.com>
References: <20260504233143.10242-2-nick83ola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A9834C4DEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36906-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,gmail.com,linux.intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nick83ola@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On CFC-capable xHCI controllers, xhci_queue_isoc_tx_prepare() uses
next_frame_id for sequential isochronous scheduling only when the
endpoint ring is non-empty and the endpoint is running. If all TDs are
returned before the next URB is submitted (a ring drain race made more
likely by fast TD-skip on xHCI 1.1+ controllers), the condition fails
and the URB is scheduled ASAP — potentially many frames ahead of where
the stream should continue, creating a gap.

Extend the condition to also use next_frame_id when a periodic
completion is in progress for the endpoint, covering the transient
window where the ring is empty but the stream has not actually stopped.
Guard with URB_ISO_ASAP to preserve explicit ASAP scheduling.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220748
Assisted-by: Claude:claude-sonnet-4-6 sparse checkpatch
Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 03e47db82092..116a2dcd0bb2 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4308,14 +4308,24 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 */
 	check_interval(urb, ep_ctx);
 
-	/* Calculate the start frame and put it in urb->start_frame. */
-	if ((xhci->hcc_params & HCC_CFC) && !list_empty(&ep_ring->td_list)) {
-		if (GET_EP_CTX_STATE(ep_ctx) ==	EP_STATE_RUNNING) {
-			urb->start_frame = xep->next_frame_id;
-			goto skip_start_over;
-		}
+	/*
+	 * Calculate the start frame and put it in urb->start_frame.
+	 * On CFC-capable controllers, use sequential scheduling from
+	 * next_frame_id whenever the stream is running or a completion
+	 * is in progress (ring transiently empty due to drain race).
+	 * Skip this for explicit URB_ISO_ASAP requests.
+	 */
+	if ((xhci->hcc_params & HCC_CFC) &&
+	    !(urb->transfer_flags & URB_ISO_ASAP) &&
+	    (!list_empty(&ep_ring->td_list) ||
+	     hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep))) {
+		urb->start_frame = xep->next_frame_id;
+		goto skip_start_over;
 	}
 
+	xhci_dbg(xhci, "isoc: CFC sequential skipped for slot %u ep %u (ring_empty=%d), using ASAP\n",
+		 slot_id, ep_index, list_empty(&ep_ring->td_list));
+
 	start_frame = readl(&xhci->run_regs->microframe_index);
 	start_frame &= 0x3fff;
 	/*
-- 
2.51.0


