Return-Path: <linux-usb+bounces-36733-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ab3G/D58mnxwAEAu9opvQ
	(envelope-from <linux-usb+bounces-36733-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:42:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C949E2F6
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F8C93026A80
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 06:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7199B377555;
	Thu, 30 Apr 2026 06:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PCF6Sjzn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB79443
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 06:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531373; cv=none; b=EVLtWB79x9WaxGbbKwv5DMEGcTUGtmHcMMq8l4abNHJYPbDOdhtYxHg2Qkqlci1xx2eSUSpL6qG6X8isHVNRRkPLRyF1HNnwFicgSXtYXBmT6P+DR1cuZccg00iAGFXRK8kcYPs/W2Xz1JagCKCPkf/U3cx+9kQgRTGUetbQkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531373; c=relaxed/simple;
	bh=T8ug1BRwVjBSe5pyg4eS5q5qpntdY4QJJxw6h6TXjU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbZyDUPwp1yeRYIxuspwj03e25MzT7addEz1Xq15gKl53UAnp8n4VbfOn0kZZABMWiTmZT1F2yqEYnvnYcEvPrCv9G2uIFThHDPRLbYUyeKBvjSGBNM82Qz4atD6yyTuVZpTmYQLWZSzcyCR7biTxeTxoV7bhqyEoo1uXd/fypI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PCF6Sjzn; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777531347;
	bh=F1WVIJ7HbaF2eOvbVzaA28LrB/mfnPFVUoHBF0xnHl0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PCF6Sjzn4PNDcbYpKLWTwMJzHi52XZ50D8ixk/EWgmIEiZptahTj2WDJud4j/CTsO
	 vK5tIN0+tT5WMwI41MbtFoDycg+f4gl/Jln9quvIvAL7b9R0cJY8L7o7CllJK70qPI
	 SiOFXvVlbS44vjAJrcP9C3aepibIYvk3+e7V+DAo=
X-QQ-mid: zesmtpip4t1777531331t1c612aa8
X-QQ-Originating-IP: NYojwb8nz4+34hSOYZrSx7JX64l57MsSPG6dBKWSOBc=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 14:42:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16597926817817289979
EX-QQ-RecipientCnt: 6
From: raoxu <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH 3/4] usb: xhci-pci: use the interrupter entry as MSI dev_id
Date: Thu, 30 Apr 2026 14:42:08 +0800
Message-ID: <85CC13362072C2B0+20260430064208.1725201-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MP9Cvol/R4C0mVhrVlnGZ7w/SQtVZrGZlm7EWxEzTCQ4Eq/tlAI4++1M
	YuiTpCc2JEQZVtGV2dAPGFVJAyan8qQqWJ1r+DSn65E8xZHq2tQOjLxvzkO5Y4/w9W7INtZ
	PutZ1OMKSlYipmCvXP007A0B7GeCyFfpTLSiU3kPzEGmPVIFTdnGPpvsp5b/ckWw1xRsEKp
	C3/CbOfQ2u0rIbF6VqeGJJ+25bcDdaSwRZaQnD5OjFQoJox3cP1VRg0jGhnqRWN1u2Os89K
	2R8pda/w2gM1nhaDUI2+r96q2gLrKi3l1zx3vSHYElOVZKOSKYmSTeq48pPPbzoi+0PxA1f
	x6UR2VHmQAgFx1+2z+HjxKGCS7zACEPzK027G+8H74OLP44ADhKpn9Kygz8WeHv9TmncVQ+
	LuBhKliCnMFmwlUHROnIwSbwNE+F7Cut0uXsduLVNwqgADex4K371JTQE9AtKm/KevijcOL
	MJf10AxUo6QuuwoNbv4yrPsFJBIpt//KLALR/9jiEbyTHPN7pc08qL81Ac3/XzG9b7CYAvk
	jjqe4vW/a272mUHjpJqipcn36QTdEgRyJ/b6InQLbmWnRR9j47YPFNy4Yom0b1lxlAq+WcQ
	pExU/D5cTcqX3fIdnUmzi7Vl7/qdtJqOJ8s/AcJo+NumVHzBglR/Y4cR7Lg71A80ltdVO3M
	Rt2JBZSvILHYNApbXf4oUjUF+iPEKLTBAF3mcbalBttriToBCBZXuuePRDwgycDT+RXwobZ
	bop0sOlCl7NCHtE75+g9X1m16on80DZxfkgfeTPt8q8KOaihiBR5RjLWg61Co4OUjhh1Rmz
	q4nbJjJ5LBd9hvasM72uXOO3/XUgyoKLS3yIwjpP7oQQ/3VDtCBKlAOwmjtuP/x6FDaBUdU
	jSp1W1vSmPH5tmLDk7mffJWiqBTmLag6welFpPvtqJcOj1HOmehbEnXx5s+CUrDIWTmqQBf
	FijzbtJKS3e0bsPD2UhCgif7a3IkcLcAYy29LS8N1/Fo+oA0SGwV55mr6yRChIgOuxvv0xm
	JiwJyTnVJU/pgMu9Atg/Zbd1EqUJWbmMu/60xLvg==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: D16C949E2F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36733-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Xu Rao <raoxu@uniontech.com>

After routing xhci_msi_irq() through xhci_interrupter, PCI
MSI setup still registers the primary vector with usb_hcd as
the request_irq() dev_id.

Use &xhci->interrupters[0] instead, pass the same dev_id to
free_irq(), and release the IRQ before xhci_stop() tears
down the interrupter array.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..6df2fe78ab47 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -134,7 +134,7 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	if (hcd->irq > 0)
 		return;

-	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+	free_irq(pci_irq_vector(pdev, 0), &xhci->interrupters[0]);
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
@@ -175,7 +175,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	}

 	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
-			  xhci_to_hcd(xhci));
+			  &xhci->interrupters[0]);
 	if (ret)
 		goto free_irq_vectors;

@@ -225,10 +225,10 @@ static void xhci_pci_stop(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);

-	xhci_stop(hcd);
-
 	if (usb_hcd_is_primary_hcd(hcd))
 		xhci_cleanup_msix(xhci);
+
+	xhci_stop(hcd);
 }

 /* called after powerup, by probe or system-pm "wakeup" */
--
2.50.1


