Return-Path: <linux-usb+bounces-38154-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPfkNSVZGWqtvggAu9opvQ
	(envelope-from <linux-usb+bounces-38154-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:15:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CCB5FFC43
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7126305027E
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892FF3BC673;
	Fri, 29 May 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbMpvXTk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABC33BBA04
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045918; cv=none; b=Ye2DNCE3x3v2r0zPVk9W1TyEgx2QnhjE8jUB7t7eCHkMYZ7a3eibMboAnxu2uteODufZRg65DbZHHNHUZqElE6c/0lGh0s7d75l6JAUCRftLs2RXmakGfNpbnJ2IYdgBo8SczNQwtleJEBmZxsKM1gR2fo7oIlv+oQ754iXh0Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045918; c=relaxed/simple;
	bh=kduMQMEuEfr+wqAKGR4y+slgP4W5W7GDFBAeNV/zTKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hJIwk213m8KC6L6PNpMlxPO6nYAvr1pPehnp0oWXph4eIIgtsFEUDOwvrBwJbyGbUqfgMFsOscrRpkzPogDufYNT++qoFWHS19PvxDHQjIvHFpMigdLLb+pi2bc0plz318ldSSIgPkgMvbmDDJ9Bhltr2f+BitZvEdCvFCAHp0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbMpvXTk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso59387255e9.1
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 02:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780045915; x=1780650715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QKMOZZqY8qXuWzcol5aT0Qr0Wy5iVaDJuahhZblfGNo=;
        b=CbMpvXTkpoBxIiQCn27nehA9/XuOLstuns67Y+zC0ioBIc9vuQg0Gwvme/38UhU+qU
         ynHSsrcGO4lB3nW9Ri4P2Fp38tzxnVxdsNrg2wVtaI90O4aQP+4AoYvG4c7feudM03Bi
         UPZoiCHzAl/8O1A6Qj4hGVXb3u8E39zhQUIApooUWDc9UHeL8SLkBys0mOZYbqvWp8fR
         591W6cCYFzOhA2L6ztrsp2WuGkI/AYoAh8SwLJX344eT8j5GuBpF8LnpAFjmgCzMf0a0
         5hKtkmOUlP3o1WD+u9gFXeUdE+3t032Bn9jefKN2RANPuDV+3QoFfNY0nvS/+XyTCMhe
         +oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045915; x=1780650715;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKMOZZqY8qXuWzcol5aT0Qr0Wy5iVaDJuahhZblfGNo=;
        b=L1AB88mnRCmGed3/Cjrv9xmbe09+P4Bcp98m5BGi4RUWn0XTZzbqypDHdL0Dt4y8EX
         bgh4RGOdPNfhL82ox91EBJf0savuMy1fQ12kmWQvnQBeQKMybAgPWCyg8Kw6pC5WvaQi
         de4+2dQsdkmdhaLRLpwHcTBWrDZ5e9n5uwBjEHms2C+CVQ1MKwEdDyMdhpmLP+bvo7A+
         rXoFaJgXfQZHBf2vTGN2Dcl67GYBxSojHq8O3GSM0a1nat+MlyhkmY1b5roOl+ncp47M
         v5a+fy7b2X/pfiH+FL1u3ENrauvPTD4Q8qiD1f2I2YSTKHVLiCxg0aocMKtSslrNBrhO
         FjEA==
X-Forwarded-Encrypted: i=1; AFNElJ/7a+RwUingN5n38K+6qE9cfMZRBWuFVmY2NcpF0qA1TGt+/cV9DtRYrmMvRASmG6D1+d7rFalZsys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ZmA1qPr1fPqw3CA7c/7VW94px3oN7wrLpFq5WrcwRksWjNlG
	weK1s4DHYjuG1t+v17nIi5s5Pt1qhKkN+6YRNQjIJ9OAdbIPYzewsa7Iid5qXg==
X-Gm-Gg: Acq92OEQGm3DwDVew+1de8HlbuT6hnn+3wkfxpd1tRoxj3gssLk/8AiZW8I9WfO8X/k
	KtpgQNfF2r87/3163CC3wQj8pL3EJnr2wigqQoVwJS+0/0fqTB1Ui3AaGoHLKSCd/UP5kB0nxAA
	m0sMDrtKwgbDalDPQZOdz34azKob0kPRYRctwSWz0tixoNgJMe0CUA/F9EjLfffEMpX9qCD+FAZ
	vF/W7fK5P4ii6ySvQD1DV71W5/sWM2/rTEAWYr6mN4DUZ/k5tYGrxFKmre2cKmJK43UkklrapqH
	wPkxa6Df6AMPvFjmrn1pZ1wMuICxDlvGEqxUqmGR7mY6/+wz00A7e43Rx6QDUlBbqSx//15xyWZ
	uz+BI0XftWtCRpE2MmkQUfNguRk1E5DQJMKxTNfzkt5ZRR8wjWvZMWsLvoH00tQrqK8Xq7Q+f89
	utuEiIGe9L816lXRBtDFI3iQJZaN3gbd9wxW3F9lMovB754Q==
X-Received: by 2002:a05:600c:818f:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-4909c0b9344mr37332445e9.28.1780045915380;
        Fri, 29 May 2026 02:11:55 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c123406sm12603625e9.5.2026.05.29.02.11.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 May 2026 02:11:55 -0700 (PDT)
Date: Fri, 29 May 2026 11:11:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Remove isochronous URB_SHORT_NOT_OK handling
Message-ID: <20260529111151.17375c5d.michal.pecio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38154-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 54CCB5FFC43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This URB flag was never supposed to have any effect on isoc endpoints.

No kernel code uses the flag except usb_sg_init(), on non-isoc only.
USBFS can't use it on isoc because proc_do_submiturb() rejects it.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a6c2f2373849..54fe0fc3dd8f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2400,7 +2400,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	u32 trb_comp_code;
 	bool sum_trbs_for_length = false;
 	u32 remaining, requested, ep_trb_len;
-	int short_framestatus;
 
 	trb_comp_code = GET_COMP_CODE(le32_to_cpu(event->transfer_len));
 	urb_priv = td->urb->hcpriv;
@@ -2409,8 +2408,6 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 	requested = frame->length;
 	remaining = EVENT_TRB_LEN(le32_to_cpu(event->transfer_len));
 	ep_trb_len = TRB_LEN(le32_to_cpu(ep_trb->generic.field[2]));
-	short_framestatus = td->urb->transfer_flags & URB_SHORT_NOT_OK ?
-		-EREMOTEIO : 0;
 
 	/* handle completion code */
 	switch (trb_comp_code) {
@@ -2418,15 +2415,12 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		/* Don't overwrite status if TD had an error, see xHCI 4.9.1 */
 		if (td->error_mid_td)
 			break;
-		if (remaining) {
-			frame->status = short_framestatus;
+		if (remaining)
 			sum_trbs_for_length = true;
-			break;
-		}
 		frame->status = 0;
 		break;
 	case COMP_SHORT_PACKET:
-		frame->status = short_framestatus;
+		frame->status = 0;
 		sum_trbs_for_length = true;
 		break;
 	case COMP_BANDWIDTH_OVERRUN_ERROR:
@@ -2461,7 +2455,7 @@ static void process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		break;
 	case COMP_STOPPED_SHORT_PACKET:
 		/* field normally containing residue now contains transferred */
-		frame->status = short_framestatus;
+		frame->status = 0;
 		requested = remaining;
 		break;
 	case COMP_STOPPED_LENGTH_INVALID:
-- 
2.48.1

