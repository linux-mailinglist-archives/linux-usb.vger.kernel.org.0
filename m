Return-Path: <linux-usb+bounces-37294-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIyvATmcAmrxuwEAu9opvQ
	(envelope-from <linux-usb+bounces-37294-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:19:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B971E519379
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2479E301DF61
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7E62874FA;
	Tue, 12 May 2026 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Wfyxwnnu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E841A6832
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555958; cv=none; b=hIQHKmWM0iFvDH6bN4sKFfR/gjSTzrjHNycUX6OuCFA4KWgqiwNfuUsNyG8mpg/rVZoUQR/YKEczavOfbZwlfRLHkVEKFFgV6TtPCWNbSYgwBkZ/IaJCs05ggZhcRBGQVj5hy+7Z2PUoJuBxS+6Va1z8ov+ZRb9rmu6J+ebinMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555958; c=relaxed/simple;
	bh=eq2FvBbvhmSd7QwzwfGIyPFsjskYOPDThfCBo+nJOg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKwx0d69WTUZDPDnwxVf6ZNqYFqSxxE6XHPKfMxq/K5xVRAWtJRezJChU81EaXyzPIprMpO59p/HbDfZ+S/Qv+yyj/UC8D/jrw+8I5QZU7zDZJNLGkswgP5V2LOPNR3dMLzjm+g1Sfy23ka6QLR/hD+L26EWA5M2v8FUQtvjvBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Wfyxwnnu; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778555929;
	bh=mDltDVLKGrAb+1SpvGGszgAnBobNOwTagDHm139Z/Ks=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Wfyxwnnu2c6pVll2kOaMYPin3BaobJYVLs7L83F8K7TARGaQRKxfwq7LW88Kz90Gh
	 N3Npv1bwllLxhz3cq97gfOu8a+Wr2kwj712UgohwoyEQvfTs1iGrqHt0AlVjirDz3J
	 JbgrkKOVOpLZqo255iMqthsuLg8eH3VFo3KB42Hc=
X-QQ-mid: zesmtpip2t1778555914t6e969264
X-QQ-Originating-IP: SJ0U1cFuHruIJzzti5ZYZxPJfV0rOid1NWxdNdJs8p4=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 May 2026 11:18:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 474985158018961039
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH v2 2/4] usb: xhci: route MSI through interrupter context
Date: Tue, 12 May 2026 11:18:31 +0800
Message-ID: <6259E777DD31B061+20260512031831.3896314-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: N879q09ZcJuCos48MZk4cxpAeHrW5JrTVqLCfdRQn08k1k9v4v1ehvEH
	aqkC3i8Tw6rpAoEuEoC2t5KyOeMhzo24knOZb6UNrmfonVIHHFRUdVU8PX3XswpH0Xt2kVf
	RvIhCC0zZ55cEzLppXGjK8eEN434muqSjgqorRzSmk0lybKueQkgrwo7wyQuSOCqSmQM7mJ
	RR+0ovJ0+g8FClJJWC54U5qTfpE3Oa2ALgMka4yGN1BwhmQ5nmRkCKA3/EGRuyuc2AzBMAj
	tVcAFwlwhlw+6wHwVQRPN/EFX7GFFX+RShOsLv/Hql9E/+rB+sWJ0Z/EAIJP1dW9+Pbiktq
	6uBq5Aqvi7iL0MYN6D0kiPx85Q9n68aRc6SssDeH+dqAJapYoIEvwzhcCRtL/9ruaGj2yi7
	scVsEzE8U0Ftlfkl9yDLTezBEHR5OIvHImEnaX5fDK36SW7sw0CkdT2f0Krti7FYYwbdu6p
	mMjxpM2mNVSZvT+/YnRGqTH0azKqgJb1YwjnQa6x/EfTIQNF2IbEDcDcMT01f1hoZ2M+yC9
	HoLxYCG+SZGC55pvj2mO/WAil+Qr4x3TtVPJ/cPfdOryPBBgAOe5rAvhqiwoS2WD7/ic71q
	sb7AVHZ5rNEL6hoAcr7kAibRWSyL8uReCYiHaIWFsjNMRIQ2Rw+6wZVOTFRBCodXC8DnBX9
	0IzqVxNTgbDnazNudcGBFK0D0gHX6KQ9EcwmMDDWsYZATY1Ok/PUncExCdTRC0uln3p2+DL
	dMrr02o2Lq7snkG8ceol3/U/8tuhYTNyWTZDXvhpkONXydBCEuJoqRrXcPKHg7eCZc0hCDi
	1vazfL41U4Mf65ZJHeE/S9kQ76KNCkT+CodgS+75eh9uN4dWjxUFIQL3xbXCAvu1Qb1ljwR
	anhLkEQqnHG/0Mm2dTMe8YA+nC6Dq36mdIvdcWiSDoNwy6LDFfxgAyLFZt+8oXOWN83W2kg
	SbAjbD1HwDpwZqM+dD/y010jXJQZmnM10y5fJ9ytJaMVI20tz9TPXU+HNJJHPTRZR32M=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: B971E519379
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37294-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The event handler already processes one interrupter at a
time, but xhci_msi_irq() still enters through usb_hcd and
then selects interrupter 0.

Move the shared MSI logic into an internal handler that takes
xhci_interrupter directly. Keep xhci_irq() as the wrapper for
the primary interrupt path.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-ring.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e47e644b296e..63b97c393153 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3174,9 +3174,9 @@ void xhci_skip_sec_intr_events(struct xhci_hcd *xhci,
  * we might get bad data out of the event ring.  Section 4.10.2.7 has a list of
  * indicators of an event TRB error, but we check the status *first* to be safe.
  */
-irqreturn_t xhci_irq(struct usb_hcd *hcd)
+static irqreturn_t xhci_irq_handler(struct xhci_interrupter *ir)
 {
-	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_hcd *xhci = ir->xhci;
 	irqreturn_t ret = IRQ_HANDLED;
 	u32 status;
 
@@ -3212,17 +3212,25 @@ irqreturn_t xhci_irq(struct usb_hcd *hcd)
 	 */
 	writel(STS_EINT, &xhci->op_regs->status);
 
-	/* This is the handler of the primary interrupter */
-	xhci_handle_events(xhci, xhci->interrupters[0], false);
+	xhci_handle_events(xhci, ir, false);
 out:
 	spin_unlock(&xhci->lock);
 
 	return ret;
 }
 
-irqreturn_t xhci_msi_irq(int irq, void *hcd)
+irqreturn_t xhci_irq(struct usb_hcd *hcd)
 {
-	return xhci_irq(hcd);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+
+	return xhci_irq_handler(xhci->interrupters[0]);
+}
+
+irqreturn_t xhci_msi_irq(int irq, void *data)
+{
+	struct xhci_interrupter *ir = *(struct xhci_interrupter **)data;
+
+	return xhci_irq_handler(ir);
 }
 EXPORT_SYMBOL_GPL(xhci_msi_irq);
 
--
2.50.1

