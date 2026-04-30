Return-Path: <linux-usb+bounces-36731-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NAGBtr58mnxwAEAu9opvQ
	(envelope-from <linux-usb+bounces-36731-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:42:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5949E2E7
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D30CF30265BC
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 06:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E67377560;
	Thu, 30 Apr 2026 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OQ3hpBz2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB1B4207A
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 06:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531349; cv=none; b=f05EoVrom4Q0YlPOP/mI+UWLIaM96PBa2SqEBZNBslWejIS4FZ8/wf2sVWdLzuktntX31tbPTNc4P32lvZBzH/bMHtF0XhTE7AqaXaa1c13LL+kQDcgFIJKml4yFHdoyYTwWPEm7N7iYaeJLjsGKWkaDmOkWA15LlxA/54BqbmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531349; c=relaxed/simple;
	bh=XtS8DZysS8DXsfNOihskLCvQFJAYXk8rVNv2xDsh6ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XzXEZE2VwrgQBZxjzMmfxc2pP/eQ7Fo/alXht74ezfKXDchSe/Ud9NuvDhkYNeQBJbwmFcUEbKuwZeyk0zRtfk+OA1pulgjb0m1V9rsUoe5jZN1d8HZI5bp3jUBotcJk8o6Qk0FbucnuF8sYpxpWfH5Dnt4ObxDQOmzZZA86eXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OQ3hpBz2; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777531331;
	bh=5tDXhmi5jdsZRsrR3/aZYhWD521E3V6ov4HshNZtJDc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OQ3hpBz2+FFnFH0X3LfELhUkLIMtD3jc1rPGWm33/YA/9cdmhCGdXQbSc4lqEWzrV
	 EKUWeG6DgIOpSZ/zyaKOEu6q2A7GKA+m7kpWTgtngW4qy7L2a+72hSh6fWHbewyj9a
	 Z9kG9Rcw00y2533wEaiH5jkzKtXaMn1oJq4m1wnY=
X-QQ-mid: zesmtpip4t1777531316t7c5bb5b6
X-QQ-Originating-IP: DenTXxw1BWTt3BJ7XIc7x2yude/eq1SO2KtyEbBnvnY=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 14:41:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17542097716977656240
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH 2/4] usb: xhci: route MSI through interrupter context
Date: Thu, 30 Apr 2026 14:41:53 +0800
Message-ID: <05858ACADB810E33+20260430064153.1724880-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
References: <30A1A28C68CF9D88+20260430063849.1721157-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MLtv/SBKWfQ6hqdBkZG+zCEJMT69IAoxEQHjCLHK3ZxLVrzLNO0JEn7l
	04EOTt1vpm0pprmgNXBebpk97yRZkSS7NStArGHxPFVo2P8wrIVYQGh4Z83e0waHjvXgiAs
	CaQ65dkOY+4XC3lpJh7GBw+tGJFD170wOVWIctIaR+wg/Kttpt9ihogG6GUmDTOo1mEI9eG
	DuMiyAfeRZip4+BWDjoPgaZmBpGWDUkI1275eHX16IU+M/VDSfIuDuMhdt5l5FDlHPn2VJ+
	xLkcAjsRsHtJW6Y2dxUff8L8HCyDp4WaGtHTgEZhWahodzBXmYJBYuOVhurasb85vjz0nQx
	mt2cLPIDWPnIoZRiVeVYxgp5D+RI2m5j9ei4WN0pOKh+rkZURcyAxqS6bjQTKdXwybByXtQ
	NQianlhQWP9da6cMo/5OgoE5RhvWmcXo2DODRGwwAP1m+Xi6sHTn6tV6PyqSyFVcP9J4ReD
	zvK5hTk2j/MxF+UQIqS9ki7e71PM6ciKFeR87aeMZTFrKXhByEH1Xu5DHDdIX/DFwSiqmcp
	jVjmxiw1qxdEKNtWaf8Zv3DKLXLgwgXkW+s7pMbFsWTh3Bv7/k60L54NBI/dQ4sJhOh4qpH
	HFbmgnoDkneaI1ca7KGfbqRkR+SadME7bnG2Tvfh+exHK8OpTqpQB2woB/8F92tnxeQoclE
	oPe7geucAfQ+sxUgQSJcfvNw7HspRUXzNiBkOsw4KfpBwHC4HGa92DG+ciNKusZ+1Oi69G5
	KJqwMnxtXPMgU1f+MsVQSq0h9ioFcPIoZb0YfmIYDX3mkb7FOrT3kghHgni32MutBxVtiFO
	5jB+by4aRBgI/MiELw4IzjAej5A063PG5XUm2pYXfW9vHr2TVPpDoksM+5pFApQLCIe3/QE
	ZBbRDqfTG3SfSTfIAi0a4+Y1TcrrYh+C/Azfob0wLgBOyffb6yGuzJRUQCyRK4DFpww6J62
	ss465yY9goa4cULfk0PHMqGosKJODODNXP9G97ToozMxwjfEcogvzyyDpqiv3WhRMqGp0Uy
	KZofcPVsayNDoi5cobFbsoyd671G+rVwRzNqtSf2Bu0S6P6FHQfvESGhPdUGD4lTxWLI6Ci
	g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 8CE5949E2E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36731-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Xu Rao <raoxu@uniontech.com>

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


