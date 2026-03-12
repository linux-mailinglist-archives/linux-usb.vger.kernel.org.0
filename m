Return-Path: <linux-usb+bounces-34658-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNdTOZ11sml/MwAAu9opvQ
	(envelope-from <linux-usb+bounces-34658-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:13:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9669D26EB76
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E8698301BDD6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6CD30F7EF;
	Thu, 12 Mar 2026 08:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="m8pRwJRH"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F35832692B;
	Thu, 12 Mar 2026 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303192; cv=none; b=Jvag6Vj7IrPp5sVYzB5j3Hdw4qtpPfaF/hP4zyOcMO2WvfiFaWLMs1ghiINNG4PXZKmtW3DOs4JNTkQAa81SX25osGH/BMEtlT0t3JkLQSsF6Y0E+ZgFU+nPcDR1gXRN3WAB9Ak1JK88zN4CrQLebSKmlscciwji/qP2k4LI34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303192; c=relaxed/simple;
	bh=b86a8sLZEOQYLEx7byTpkMkIl4jXNQEsONzX1I+2XIM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=kcdg3KllvIr3Km6ylizWiLgMaujQ3YxNoFj9A4th5u98OTGhVOBoHl9L14OEr/i2FRGYC89j6sNrlKTlK7aLqvdTtVqcZ8hOjzYNsD7XXmaO30q8SkSvkG+ZMKGfzuwbkgNvXrZ8C/BhJa9VzrKolucBdFeASpEJDhodTC2QxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=m8pRwJRH; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773303186; bh=rbd4M/LzQg3ubtyebl7laGpK/PLq5vFdEU8W4Lizk7M=;
	h=From:To:Cc:Subject:Date;
	b=m8pRwJRHSqTdeqJyeVVcpRcvPWQ5YOCSTy04lOb+7/nqBkNetwuKvhHONAfdw6KtO
	 TUjS3t16a28ogKg2KSu0dB7XqzNNg9gUr9MfLxTH2jS8VPlrSc4A3jNEFRXw4vxqjL
	 iZVkMhKH0fEWV7ce89qzBJL0qrmQNhvs/4Z23nWA=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 34226827; Thu, 12 Mar 2026 16:13:02 +0800
X-QQ-mid: xmsmtpt1773303182ts20g8e4w
Message-ID: <tencent_5A29C4DF52ADAAD8B128CF6B43FD156F6308@qq.com>
X-QQ-XMAILINFO: M5g+bqkaOkZDxXvDFex3nTxrIi7CD+WJD5PNBeb0vxxl1LTIxchXUGDLUYrpTd
	 3aDvoBfsSp+d9HW8D7JoMyBfvIVNLWgewD8FI0GWn9RwXKSYfU8H5ZW7x1BgZU1Y2aWZQkTA7MZT
	 LoM4KI3nHQJ07afH1NEcf6W/zxIfXgPXxhbSxaQmQYyMuh7Ulad3II8MyF4Lj/TB7Y22iTbk4kSe
	 5W+MI2rI1xTjmFIrV6T7wu/DI5fVkXxeSxzyfgK1bNFhcpeUQYCbDF495QBslJYNJHyv7yuZQphw
	 v4KHreYOW+rZN69+PP7QhoFqjMxjTDAfOt50My0Xp0HWzF4RWmNuHiQCAvgZYAo6u5bKZ1ET8PUp
	 gSBaNA5B7WE7C7WsZEblR969rBDIdKCTWlFqAW4ZKMDwLzLdHk8DHXTALy6BpDKnRTfNP/s0Zj3/
	 yd7lLl3Y3uQGNlPgmJ/dmohpCORlPqeoc1lZ9hiucBWIty3UB1Mmsz2KbDSP9VJ6C9o8tOkR0+Dz
	 kubWIA5wozDXMkFZ5F6E7Zi6AEZa6t0Ddta4elIF+L2uBDnBNuAtFOOTdMQG1MIIku91KwDJO+eW
	 y39kDijwpdE4EYWwa3U57c1nLbxf68hYHf4seHVRo7EiaNBYmZUeqFXuihr25ufOkk5+dxFdWP1b
	 h443aNaL+Uetthg7LTz4FeimCzJjFXyzWVqpAMNcRxmjM2HbOvc5hyiIH0qGJReVv6/CGhR8v8s0
	 1yz21Aj0LhnCkaSJHA8/fhNKokKEGkIxypFWBMyOEFmct/KEOz+VhBT3HwNDz87bdnQQBmhL+4kz
	 cPp/PiW2U3+w7rnpoLSxhlOP9Cl86ml1g3xxS/u+WKyStbGDcASElQDYOmwTsIa3UiwcW2FfPTJ+
	 8GktMDWv3sOsN8Gst+Fwx/bkvVnh4kDwKrWBWKaTI8Vxo5u2sRBeOA8p1CZxEOMi+Pa4j9/MuX3S
	 vAhlDJFVnLlInXDqtbmYL9Dn5oiLS00cyQWc/njWF0FEztuTkyPSJO4z1hE3V6F/76Mh4UQoyvmR
	 rLXMCT/qARD3iYXdWZpOCpJfOhMJ8DKfxSmpspEd+kyfk95JEoAZFVJzbGb64=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Zhaoyang Yu <2426767509@qq.com>
To: gregkh@linuxfoundation.org
Cc: sergei.shtylyov@gmail.com,
	daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhaoyang Yu <2426767509@qq.com>
Subject: [PATCH v4] USB: pxa27x_udc: check return value of clk_enable
Date: Thu, 12 Mar 2026 08:13:00 +0000
X-OQ-MSGID: <20260312081300.286449-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34658-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,zonque.org,free.fr,lists.infradead.org,vger.kernel.org,qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2426767509@qq.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9669D26EB76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

clk_enable() may fail according to the API contract.
Previously, udc_enable() ignored its return value.
This patch checks the return value and logs an error
without continuing initialization if clk_enable fails.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
Changes in v4:
- Added missing state rollbacks in pxa_udc_pullup(), pxa_udc_vbus_session(),
  and pxa_udc_resume() when udc_enable() fails, per Greg KH's review.

Changes in v3:
- Changed udc_enable() return type from void to int.
- Propagated the error to all caller functions and added proper
  error handling/rollback per Greg KH's review.

Changes in v2:
- Fixed a formatting issue by moving the 'int ret' declaration to
  the beginning of the function block.

 drivers/usb/gadget/udc/pxa27x_udc.c | 66 +++++++++++++++++++++++------
 1 file changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..348af4d29c4d 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1462,7 +1462,7 @@ static int pxa_udc_wakeup(struct usb_gadget *_gadget)
 	return 0;
 }
 
-static void udc_enable(struct pxa_udc *udc);
+static int udc_enable(struct pxa_udc *udc);
 static void udc_disable(struct pxa_udc *udc);
 
 /**
@@ -1519,14 +1519,20 @@ static int should_disable_udc(struct pxa_udc *udc)
 static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
+	int ret;
 
 	if (!udc->gpiod && !udc->udc_command)
 		return -EOPNOTSUPP;
 
 	dplus_pullup(udc, is_active);
 
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret) {
+			dplus_pullup(udc, !is_active);
+			return ret;
+		}
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 	return 0;
@@ -1545,10 +1551,16 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 static int pxa_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
+	int ret;
 
 	udc->vbus_sensed = is_active;
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret) {
+			udc->vbus_sensed = !is_active;
+			return ret;
+		}
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 
@@ -1691,12 +1703,18 @@ static void udc_init_data(struct pxa_udc *dev)
  * Enables the udc device : enables clocks, udc interrupts, control endpoint
  * interrupts, sets usb as UDC client and setups endpoints.
  */
-static void udc_enable(struct pxa_udc *udc)
+static int udc_enable(struct pxa_udc *udc)
 {
+	int ret;
+
 	if (udc->enabled)
-		return;
+		return 0;
 
-	clk_enable(udc->clk);
+	ret = clk_enable(udc->clk);
+	if (ret) {
+		dev_err(udc->dev, "clk_enable failed: %d\n", ret);
+		return ret;
+	}
 	udc_writel(udc, UDCICR0, 0);
 	udc_writel(udc, UDCICR1, 0);
 	udc_clear_mask_UDCCR(udc, UDCCR_UDE);
@@ -1726,6 +1744,8 @@ static void udc_enable(struct pxa_udc *udc)
 	pio_irq_enable(&udc->pxa_ep[0]);
 
 	udc->enabled = 1;
+
+	return 0;
 }
 
 /**
@@ -1761,10 +1781,16 @@ static int pxa27x_udc_start(struct usb_gadget *g,
 		}
 	}
 
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		retval = udc_enable(udc);
+		if (retval)
+			goto fail_enable;
+	}
 	return 0;
 
+fail_enable:
+	if (!IS_ERR_OR_NULL(udc->transceiver))
+		otg_set_peripheral(udc->transceiver->otg, NULL);
 fail:
 	udc->driver = NULL;
 	return retval;
@@ -2430,10 +2456,16 @@ static int pxa_udc_probe(struct platform_device *pdev)
 		goto err_add_gadget;
 
 	pxa_init_debugfs(udc);
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		retval = udc_enable(udc);
+		if (retval)
+			goto err_enable;
+	}
 	return 0;
 
+err_enable:
+	usb_del_gadget_udc(&udc->gadget);
+	pxa_cleanup_debugfs(udc);
 err_add_gadget:
 	if (!IS_ERR_OR_NULL(udc->transceiver))
 		usb_unregister_notifier(udc->transceiver, &pxa27x_udc_phy);
@@ -2509,13 +2541,19 @@ static int pxa_udc_resume(struct platform_device *_dev)
 {
 	struct pxa_udc *udc = platform_get_drvdata(_dev);
 	struct pxa_ep *ep;
+	int ret;
 
 	ep = &udc->pxa_ep[0];
 	udc_ep_writel(ep, UDCCSR, udc->udccsr0 & (UDCCSR0_FST | UDCCSR0_DME));
 
 	dplus_pullup(udc, udc->pullup_resume);
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret) {
+			dplus_pullup(udc, !udc->pullup_resume);
+			return ret;
+		}
+	}
 	/*
 	 * We do not handle OTG yet.
 	 *
-- 
2.34.1


