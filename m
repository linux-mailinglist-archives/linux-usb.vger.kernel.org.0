Return-Path: <linux-usb+bounces-33968-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHHlIdYMqGn2nQAAu9opvQ
	(envelope-from <linux-usb+bounces-33968-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 11:43:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E42EB1FE804
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 11:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1EC730137AC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 10:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99998342535;
	Wed,  4 Mar 2026 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TA6dExYi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A743A4503
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772620954; cv=none; b=a8Lt4CQhorUlQGy5CSJejxq9kxtXFZM3IwCWDV9qs0feOe52nai9m4PVkCpobtRvbeJ2GOUKh4iMAKXqeInnqrM+Tos+phQOTgAiWgmiBzyiK1pZ01gxYtGC8kLWmvJtvTa8s6nwEoE4bgSdwaDjIMc4saCwdtxDyssML5sisdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772620954; c=relaxed/simple;
	bh=mMg1rCSkUwY7XL7w1tKvA0P+tLMHXkCeJgJ1pW+tHiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wg38dFd8sY7aB9C1Dl/135+DXohbcI9zD/lOz7j5zD7UxI8d6eCpMsfL8sbuU73XzKfDyTeHn1w6D/pElLXjE2eUrkd3HKwYUmVI/IlVNNdjHhlMV8omYaVNfo+8BVYvuNs/1LDB3DD2Ln0VLcTGrFjnfDSIVndqmWGvxFTFczw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TA6dExYi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-660ea8bcb96so804177a12.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 02:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772620949; x=1773225749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03zCocnfrXD6k4qoUuAhCdgG8FRUbWjHeBzvTe0yhw4=;
        b=TA6dExYiPEWtrnXi2qLR26NJOrmG8zT/gK7BXzKMqSCchV51nCVH2gU9QMMvR4ROoq
         Y1igxAHe52gCmBqL9B5vntrycjkK/RJM7lGxFEDhZm+t0uSYqdjOz1je1AB8q0XtTezj
         PGNIJHTJm0RJQmJnA2OLFzWydNkmy2ILx6YV+j6kHqt8oho6JtKi2/ef/9/5ZT2Y4BC1
         OLkdxuLDd7gjU9swfDM0Ffv37CsvMKCUVsni1El/PsLTz1I2dfh7GKGfK+DtUYz0xS42
         YbjzE/g6dWrsLC6+7JGgfDGxrJBC2YGibPZieKeLWntUvL4DGuqtCAPwcJBHWcIOAR4A
         TxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772620949; x=1773225749;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03zCocnfrXD6k4qoUuAhCdgG8FRUbWjHeBzvTe0yhw4=;
        b=LgO9ain6QFMEfZLV0MZV8J3OlFCs/zsDDq4/Ztu/NoLwyGXlVo7/K0Oj1QD8hMUBf2
         LCEA95HQxkVforU9JgsfjOuKHeFoVDpvQIOvqDgdAi+tciWo+UdOMzs2UsBw6gnbEoaV
         JJ7xm7StatD1s7Ch/AEOePk2X7OoDzgjsFCvmKgFE+hEg4I2ztGOg9jv36Pq7DFiCg3o
         Ql7GLgYfrrTKQBf1RGvEWBOkM2svxMMPk2cxOcu08OPzblMVN8FA7VoiO3wohUEafg1l
         naqT4bm4tHLjdXyI2kTLjeSKWdEJIT2I0zN+5FqZgv5Ylxe8EZZmYy+rvfBiJtFyrWOz
         CN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJsR194IM6EbNYlNe3xI6wsWklL42I5mSiTsdQU9sGGT7QCOdal42hfeGpYkAMmsXxACoSMQGyWQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzab+VGSeUuJzmODb90PFbQnKekCRo0p/wtFDLQU2z5/WOgl3aV
	OMsKDoLleluF9obVe4IAWBZnKx/8H9IgFliOvBkS39/gqe/WepJzNYljfBbIGg==
X-Gm-Gg: ATEYQzywiP21vF0bLt+wwM2k8I5e/QqitsoGDDDigOG7hGcaE+/ldmV8NkMRrDvhPdu
	gQC82uGyvIvo6xnXwud+zyaMJwSKDPgJcuvwXQM2G1pvAeO9v1CJ6a5/3pnQgkW0PtRtmIVJUvs
	BMUzh+Q8cskTmQ6UKRGPW/d+So5EVdupaVE7er11A26JzVkiixn7Nsh/9pB1URcBnHetSlFg/nF
	Su+5B9Iqd8VJULU4ULZ4rPfh4MtjTgxJzPA+uvE3tQnkKFO5KTka8HsPCNsX3wKLcuREEuWvE2C
	YGAKwohVUg6CwlD3Rn/IuOVCaTORsIjbPXwx0Xc2anc4iiM2nKrSHM34Vgb90RHsbIWPvtJ7bYJ
	7ORsF2G+LtPRaV3FY47TY7f1DrKA7kQRO+EiA2ANngdu2rfUWgcUBLT5B+y2OjdeR7+kmPvQyiq
	NKRWAsRvf90enA5qxDocagJZqCAQslYfkYT/iEDKVDn38=
X-Received: by 2002:a17:907:1caa:b0:b76:f57f:a2c3 with SMTP id a640c23a62f3a-b93f1168e7emr95524066b.12.1772620949215;
        Wed, 04 Mar 2026 02:42:29 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935a597d02sm727227366b.0.2026.03.04.02.42.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Mar 2026 02:42:28 -0800 (PST)
Date: Wed, 4 Mar 2026 11:42:24 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Simplify clearing the Event Interrupt bit
Message-ID: <20260304114224.62814449.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E42EB1FE804
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33968-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

USBSTS is mostly RW1C, so to clear EINT we should write just this
one bit. Remove pointless code which ORs the bit with current value
of the register, even though the bit is already known to be set,
and writes the result back, which clears all active RW1C flags.

We used to inadvertently clear PCD and SRE in this way. PCD isn't
used by the driver and SRE is only used at resume, so clearing them
should make no difference. Don't clear them anymore.

Tested by connecting and mounting a storage device on a few HCs.

Before: xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000000
        xhci_irq USBSTS 0x00000008 EINT -> 0x00000000
After:  xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000010 PCD
        xhci_irq USBSTS 0x00000018 EINT PCD -> 0x00000010 PCD

Some flags are RsvdZ - should be written as zero regardless of the
value read, so technically it was a bug. But no problems are known.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 246a2b1573ff..0338daba5f9a 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3209,10 +3209,9 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	/*
 	 * Clear the op reg interrupt status first,
 	 * so we can receive interrupts from other MSI-X interrupters.
-	 * Write 1 to clear the interrupt status.
+	 * USBSTS bits are write 1 to clear.
 	 */
-	status |= STS_EINT;
-	writel(status, &xhci->op_regs->status);
+	writel(STS_EINT, &xhci->op_regs->status);
 
 	/* This is the handler of the primary interrupter */
 	xhci_handle_events(xhci, xhci->interrupters[0], false);
-- 
2.48.1

