Return-Path: <linux-usb+bounces-37296-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI41KlqcAmrxuwEAu9opvQ
	(envelope-from <linux-usb+bounces-37296-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:19:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 163B451938F
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0DC03025E5E
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5852D0C97;
	Tue, 12 May 2026 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="oKBtP2j3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEF4287268
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555991; cv=none; b=dMhfZ+5Z+7IRSMT53efAS33Gc7nrQ9c9OX56jhelptbWi7Z+EDF/az2qJNkPCzdoqLNN+r5LqHjtnCevFYYklGymhEfxOB2GVDSeSf7zpiMaLx1J/mgmCxktaAhy1U3Dz0wR+2fxMsbgvhLGuF06RTmZ7Be/e/12ZNM+lofwsK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555991; c=relaxed/simple;
	bh=kcnMuDVY1ZZE+pnC+1EJv2h6qT0K2LwUx5xguXBZV1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFdn26k66ww2WPB06eeMucjc3ylAccyb34QvP+nmU0JMlH09iQbqUG5C2miBEvNTXyLwDO71qYMpGYo5zJ88ldQDr3WYFtZABXD9aADhKtwDGENn2an7efg5cG2j9gabilSvmsI1qfPJ0QfuwLU58Kioz7F7ZXi4IbV273g7I98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=oKBtP2j3; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778555961;
	bh=NutQztTMIOXwonu4mnLmsepzYdxV2p3P6veQR2kYXtU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=oKBtP2j3VlRQSvX2kYGrgRIgK48Q9kLJExi2/El9MlKHfJQ/oOncNF98OO8jVJ/XQ
	 cEu4eKI953kJsFNj5V59Vv4IOyFUn6bLGd5qbLYbvkMnUvI39VoK15C0hRdLL9C8Bh
	 ZkciVAXtOn20Y7HCq1CV7lKsRs6Ip6p4w9XnppLQ=
X-QQ-mid: zesmtpip2t1778555945t267b8119
X-QQ-Originating-IP: bFTgQ3D7FRKYPEWBOqvkVkLGP4b4vBUtcsG5rsuzLAI=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 May 2026 11:19:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11231562530094168782
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH v2 4/4] usb: xhci: clear USBSTS EINT only for interrupter 0
Date: Tue, 12 May 2026 11:19:01 +0800
Message-ID: <F05602A037AD8477+20260512031901.3896932-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <4EB0C0803AAAF502+20260512031454.3892011-1-raoxu@uniontech.com>
References: <4EB0C0803AAAF502+20260512031454.3892011-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NMMSTmykDl9bgEGgFJOxAt6mI/885bqwN6547IqFHcrPfuNLzRVR2Vep
	YIY5+/QjlFSgXqMYh6i1XfStRpQGLJlnEKWdGihx00x6pVWV9y0u6U3xhQ2I7Fd9VndOMAN
	TPdLAryClCtWm78PWH4oaBRrlYgxsbHo+o/X6pavV3Wuq0Ij8nr6xvd5NNyV2UUPRkz7xXP
	Bx53SUvzX0LsRvaqg04BhyxGygqLD9Iab7HRILjJx6ByxeoD/yTb2ILvVtHagz473oJazIO
	GuiYobJZhG3cNYfWHfEmeVfOK6hfxIXLVaz5bQRz2gGTIubBoFFlEagSwlETPlp6hlFl735
	gdyHInblIFQhVuyXohQpyevfyaeEm9xbOEseJv/lTl36fP5wKcEu1CcVfrk4LNzuqbIdh+a
	HDFtO+YSPpfygmH/zVb5MI51260jqXE2B71F387GHR0Du1OXSco7gTmGKKRrO6vvislVktN
	Ot4/lA8BegwcWA4LZ7ujYhjvdLoxayRer5aZauA1olMWImgzH241mHlC2d1SBm4NVBeE0Eo
	248CuwpmxgEtG4cbgNps2lV00h9RFIEZGmGzokXkvAyDhBxePcq55llptwjCw0AEk9vGJZE
	zvro05TPYb0snLZzk1JQNLHxyY8QIOAb5s0rwSBs7TzAe4eZ1Bib6ZYjNTyJiipqCHj8jA1
	IdunI7bp1MBEm7jd5F/bsC8Xh9xWjSJjiZKKiHzF8tcrS0N0am9zSXZ5vRWyu6+a5doAK5V
	f6WnJe3z6SZ88BHvGmIdkueHioMq/t+DvhAxDfpVEwE9GCamocXVJ+ivUrTIXtoWa785eY/
	4CC25953Fs/CUzLWQgsMY4YWLQzPmJxJU2RuBAZ73kgCNLa7O1/yclebnVKSQIBc/AuB+5/
	eXKsdP6uhvliLxCighRcRcG9I4NbDkVuB5xtmTs/fgfaix3kcPz4GdFBYsdLR2DhiUbYpPU
	lxLOdoeRDOmzbD2jq11dEjzbGhOr0omtHSRyXJYEWpE6mVF+5v2afpr1iF7rlre3l24U=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 163B451938F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37296-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:email,uniontech.com:mid,uniontech.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

USBSTS.EINT is controller-wide, while IMAN.IP is tracked per
interrupter.

If primary interrupter 0 and secondary interrupter 1 both
have pending events, xHC can set USBSTS.EINT, IR0.IMAN.IP,
and IR1.IMAN.IP at the same time. If the secondary handler
clears USBSTS.EINT first, the primary handler can return
IRQ_NONE without servicing the primary event ring.

Limit the USBSTS.EINT test and clear to interrupter 0. Only
interrupter 0 has an IRQ today, so this does not change the
current primary interrupt path.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-ring.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 63b97c393153..9aa5cd63febb 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3188,7 +3188,7 @@ static irqreturn_t xhci_irq_handler(struct xhci_interrupter *ir)
 		goto out;
 	}
 
-	if (!(status & STS_EINT)) {
+	if (ir->intr_num == 0 && !(status & STS_EINT)) {
 		ret = IRQ_NONE;
 		goto out;
 	}
@@ -3209,8 +3209,10 @@ static irqreturn_t xhci_irq_handler(struct xhci_interrupter *ir)
 	 * Clear the op reg interrupt status first,
 	 * so we can receive interrupts from other MSI-X interrupters.
 	 * USBSTS bits are write 1 to clear.
+	 * USBSTS.EINT is controller-wide, so only interrupter 0 clears it.
 	 */
-	writel(STS_EINT, &xhci->op_regs->status);
+	if (ir->intr_num == 0)
+		writel(STS_EINT, &xhci->op_regs->status);
 
 	xhci_handle_events(xhci, ir, false);
 out:
--
2.50.1

