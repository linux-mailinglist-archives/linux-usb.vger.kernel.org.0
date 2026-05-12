Return-Path: <linux-usb+bounces-37295-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJvsKEicAmrxuwEAu9opvQ
	(envelope-from <linux-usb+bounces-37295-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:19:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D6519380
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 05:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA9AF302617C
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 03:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5312874FA;
	Tue, 12 May 2026 03:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="j59G4sUX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7173224AF2
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555973; cv=none; b=q0Ovtn1qhdnNbUeT9sObbPWz06jQ24/j9gR2UFoLs0kuUw/ZULk2mS5kt3331F+VxP1wjbl5qkwd8+DufdiEfYBw0Ntr+VmcJ7wsKw2cEoLiQkTL3/smmR44E0LuaiKHPa9TTxPk8slRJe5kOnRXAzzOws1nmmIJ4Jtvjf2Ijb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555973; c=relaxed/simple;
	bh=QajuMiCdutXt++kcuBhangrce01isrP+RxymTT3Dylg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vjru2WCIQ4l90++e+evFy9HkRxlJ3CLNsIP2y2jMW310MByt5Ve2Lm4N7aFhwcrKMRrGzwDEvuFnOOiY/6WEJsaBc2EUrKpjdMEQxhyfmj6+1oFVi1Lneh1Lebx8knIOpze50SKyjM3BnCsDmNadlLGIw4VE1WC75UUKR9IciDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=j59G4sUX; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1778555945;
	bh=Eeh7VPl+f9yE9XI+Z4iTj0eE38AqXP0QGBzNVTib98k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=j59G4sUX32n8Ui2Eow+Ayvfy4LufZwZsLqYYKn7yFXph5D6YQOnJPxsboJ8fquhGM
	 eErjlM2iaeORJ1GDUeJttQPmakLZ2tEwvApOejbUHEZz+q9JN8CjTHH4MRIQy9ShlD
	 XU/VMn0XG6c47ChsvmeAlcVFtfeRIeiKYOzD5DO8=
X-QQ-mid: zesmtpip2t1778555930tdf112b49
X-QQ-Originating-IP: EYWk92cQkEX4rKGBe6cDVBuDFasshJkBFxQlAH40INY=
Received: from PEN202512010004 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 May 2026 11:18:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15095326466575891345
EX-QQ-RecipientCnt: 6
From: Xu Rao <raoxu@uniontech.com>
To: raoxu@uniontech.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com
Subject: [PATCH v2 3/4] usb: xhci-pci: use the interrupter entry as MSI dev_id
Date: Tue, 12 May 2026 11:18:46 +0800
Message-ID: <52AFC6B650902DEA+20260512031846.3896629-1-raoxu@uniontech.com>
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
X-QQ-XMAILINFO: MLbAtvpy5B1PBUEzIsVyP2AVIhkUHapt8JKO6wzyzolhmkIYTENVj6RV
	uCdny1RFq1udBnthTtmw9fhcbD0QhtyaZ0Dcn/eiAl2G2sovQlmCVKo+cZ6OaA6G7/+owWK
	tnXs5+F5EpsGGTRuPRz+Es6hxzU7laGyc8uDPzphbyZVvvYOrvHh+YLqhfkqpgUQ5AclITx
	3SUjV7WZsgifTz1PvkZTAgL7j53BLrVvfqunCCYb6VVhADWESgDtZC2sCbyAYW7+uTGQn03
	ZXg1d+7En7PwMB5fJwikc58GSe+SMfibecm7Za0ONrGOGgIJiOBqKvPT0TjaJ9rF5Big7nb
	EgO54wixirN73LsuKoj3CJfKYqqlg9BZaM3B1t2rU8uMN2qihh8X9u5v6RATw+ibZ8Tfx43
	4rUXLld7zuBBSq+14oZAeVvJzaFAjSO5KjtMHz/qrZ7bhUIHOvLxIx/kc83F2PtZ1kgef8b
	fNidKQBsYvaE0AIIu/vBZQDbvBLuwfJYUAO3ui6JLJCNQexUgjJ8SQJK7LkKhD0Oqaz50qT
	8/XJFwMVvMPB0/tvt9G0pdKaFJwQts3xisnl07scL7NSmhHo74m7oU9Dw0JcQHvaEVDp3i8
	3yhuMA1fq4bRwtNVAw33cNoGv6lOb6HIUo5wfFbkYY1lynDRLEIhD7ZXzP7zCWGOKprB41s
	E6l/Y1M7b5xP38ucxyRFA3TZp/imY7lBZVe/B2D4DoOVoewn6ysBp7mWUshxcn5pVfixcSG
	999HimvFUVcSrSkbPetdX794v2APOt7ZCzVcVyh7XMVpO16+KK1NHP/3R4b7Z8pnlK3gRtn
	KRsO2RvMGtNj1el0231gPcAlxRtnTd58Y8dQS6QFjfpSs68phcwZFaiHy8NkmQu1vGoyNNh
	ARaOebj0QdZADL8Nc9t7o1lQIepGCM2sCDpA98x5/Bj4/F4pB/ywTYfXfOKZrtpe0kowfjt
	wLoZ2TG5TNI0/qBw5l8+n6FB7E8YG7gzovzPQ1ppvY4BsuIByJVcirScOh64PO18DZms=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 113D6519380
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
	TAGGED_FROM(0.00)[bounces-37295-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,uniontech.com:email,uniontech.com:mid,uniontech.com:dkim]
X-Rspamd-Action: no action

After routing xhci_msi_irq() through xhci_interrupter, PCI
MSI setup still registers the primary vector with usb_hcd as
the request_irq() dev_id.

Use &xhci->interrupters[0] instead, pass the same dev_id to
free_irq(), and release the IRQ before xhci_stop() tears
down the interrupter array. Disable the primary interrupter
before free_irq() so the interrupt source is quiesced before
the MSI vector is released. Export xhci_disable_interrupter()
for xhci-pci when built as a separate module.

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/host/xhci-pci.c | 9 +++++----
 drivers/usb/host/xhci.c     | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..9a9c17232b02 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -134,7 +134,8 @@ static void xhci_cleanup_msix(struct xhci_hcd *xhci)
 	if (hcd->irq > 0)
 		return;
 
-	free_irq(pci_irq_vector(pdev, 0), xhci_to_hcd(xhci));
+	xhci_disable_interrupter(xhci, xhci->interrupters[0]);
+	free_irq(pci_irq_vector(pdev, 0), &xhci->interrupters[0]);
 	pci_free_irq_vectors(pdev);
 	hcd->msix_enabled = 0;
 }
@@ -175,7 +176,7 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
 	}
 
 	ret = request_irq(pci_irq_vector(pdev, 0), xhci_msi_irq, 0, "xhci_hcd",
-			  xhci_to_hcd(xhci));
+			  &xhci->interrupters[0]);
 	if (ret)
 		goto free_irq_vectors;
 
@@ -225,10 +226,10 @@ static void xhci_pci_stop(struct usb_hcd *hcd)
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
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a54f5b57f205..4edb2ce6715a 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -345,6 +345,7 @@ int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(xhci_disable_interrupter);
 
 /* interrupt moderation interval imod_interval in nanoseconds */
 int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
--
2.50.1

