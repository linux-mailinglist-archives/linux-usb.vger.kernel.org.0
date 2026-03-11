Return-Path: <linux-usb+bounces-34565-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOS4JWN1sWnovQIAu9opvQ
	(envelope-from <linux-usb+bounces-34565-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:00:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E343E264F60
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4196A300681A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E9E31E838;
	Wed, 11 Mar 2026 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uUP2v0zq"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335062C21E8;
	Wed, 11 Mar 2026 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237596; cv=none; b=SOshKBr6kvUuqzRBGeWaewaVe87uV2CkZyud/YlA3+ns3WD1QDKSLSduQF9cE88Dq7LicUxmorRqWNnylodyfZ1VZQ9PwjpJ6DsFLJC2o7PHRONFwiHLpfLB3yJ0eKaCdnsqj1SHKJ4YOZV7c6N5l25Rx3OfupVEjRgYy53BTM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237596; c=relaxed/simple;
	bh=ImoRRmYpDR8Cr/M4ylbzMKAjZz3cYU9M/Su3D3cb47w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ro4WjzaGTkBhE4kwFkQnhXk3ADz4nUoZO6Q6TtaoRbFPTTljp8q1hwAR5hao7vtifQ9VtgscOR0c4ONMgqPUy8t59uOZSY2QpaSb+9rn/kPd0AZ64dYlwZhD/vUcP9LAWIFjgz4qPy3Ag/AxaQ3ZpncNvP4Cpivjpy3mqZfDNqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uUP2v0zq; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773237583; bh=aF2WmMKwRgaVIE/I3i48O1DlYAeIZM+SRboymF2C9J4=;
	h=From:To:Cc:Subject:Date;
	b=uUP2v0zqWqjxcQq9YMyMzKggdmcH/+FFNm8bHJsQNwGjFvvPYBjZ8Czdj3qSjp0Nn
	 VMX/JbFuiepQJEwknsX88q0vQo+Z+0/ZTo349DNegIsCfVNtqH5/OkJzUmjVA75Yiv
	 RO5o4Fpb5PmuAeeQv2P7ndXMPgEETuOmtn+5Ud5E=
Received: from admin.. ([2001:da8:205:20a0:6eeb:b6ff:fe15:94a7])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id E111DE10; Wed, 11 Mar 2026 21:56:17 +0800
X-QQ-mid: xmsmtpt1773237377ty1o3sjo7
Message-ID: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUAP2RiU7AszV5h0akRExrROY4HWo3RaWpE+EdEdLqCeOv4CgAzpK
	 KmNPva4/tt+XkNcm45EhU93CDu/bSFtM5MazeyJijsIITdBULuWjKxefOruB/DpZGoay/efiMCC7
	 cjWwZNmc3n2VEQU3uQx1l/DcReyzTjZYvQ67JituoIM6UeTHZo7SAVXpEAJV2dkEme3DQJ/F1faH
	 n3TJW2skzcg/1kdUcBiZrRLIPgTZK2ofxWJSxNnZUDsFn4elcndNSkGJlPhMgUKxvu1w7FJp+f/P
	 7JgEqvpnuleaP6KTFLi6aW24lLJIml1ypz9QZXsahNzZKqcClbnhscXSooln5SJCY7Z5TTtar4KM
	 uI2S8rJn8/mZAG5Gpr1wMXjfdlDXwQwpK1qZqmB0cnB2v5oRUK/afAMfCQmdsafgxPgIFqe3D7yE
	 9ANCGf61M2VHHovgN2U37rdQFuVJKTsExVwCHdatr8GFXHeeR2n/9c4rq6CXc4wYTaO3EYiswO56
	 jL7guT6yZn9B1H3xfNZ8riHUj93EAYe652ear57WGY+GlpE2afWFth6xRn9Ro6aYNsqmUDFx9EcN
	 ehNSl4eTZd/pITf8YzidUqhQmDtASo1fLVDo0Cz4kG49jBdByvfXd+TvgRq1R8afO99lwKwpi6wH
	 HFZg9XK9IP/+GbayUtK9p5BDvFdt/JlOBlpL6dCOxkQhv2MbZ/+VLkGoFks7rR8SBilyBjq7Xk6j
	 OeXoWd8S+86FrYxTCdpmt5HjN6HysNyKuQYWG+I9hTZX/Kn2HtP4wOp0AjFgoqYA0wiUQSK9LM4E
	 H3Wy3oL6iD/L7anoMl9KrfRQS5wcqozIvftOGAm5ixj0Se0w/GaO8RrsZSt6/oOPBcOVKSlB0unF
	 aGOQuYIuCoh7J8c2njbNRkDv9MRNKy45JWnUyNcE+fUt0+2+D4hjMZuj5Muf2smkh5Nsb+DN9T7M
	 Tca/HlKS320nmcMlgIW0HuEVsJozd2H3OdbcbPBad+4rx8Vx9z0naNCG2nFUyeNzYHBVvG/EJQrw
	 UkWmPAacVzwwrZFQYVEjvW4k89CLpI5Z3x6mrt+/8yjDUgI/MRmuzUKZroxNw=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
Subject: [PATCH v3] USB: pxa27x_udc: check return value of clk_enable
Date: Wed, 11 Mar 2026 13:56:14 +0000
X-OQ-MSGID: <20260311135614.283723-1-2426767509@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E343E264F60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34565-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,zonque.org,free.fr,lists.infradead.org,vger.kernel.org,qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Action: no action

clk_enable() may fail according to the API contract.
Previously, udc_enable() ignored its return value and returned void.

Modify udc_enable() to return the error code. Additionally, update
all of its callers (pxa_udc_pullup, pxa_udc_vbus_session,
pxa27x_udc_start, pxa_udc_probe, and pxa_udc_resume) to check
this return value and handle the failure properly with necessary
cleanups or rollbacks.

Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
---
Changes in v3:
- Changed udc_enable() return type from void to int.
- Propagated the error to all caller functions and added proper
  error handling/rollback per Greg KH's review.

Changes in v2:
- Fixed a formatting issue by moving the 'int ret' declaration to
  the beginning of the function block.

 drivers/usb/gadget/udc/pxa27x_udc.c | 60 ++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 897f53601b5b..0a5f05f8e73c 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -1462,7 +1462,7 @@ static int pxa_udc_wakeup(struct usb_gadget *_gadget)
 	return 0;
 }
 
-static void udc_enable(struct pxa_udc *udc);
+static int udc_enable(struct pxa_udc *udc);
 static void udc_disable(struct pxa_udc *udc);
 
 /**
@@ -1519,14 +1519,18 @@ static int should_disable_udc(struct pxa_udc *udc)
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
+		if (ret)
+			return ret;
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 	return 0;
@@ -1545,10 +1549,14 @@ static int pxa_udc_pullup(struct usb_gadget *_gadget, int is_active)
 static int pxa_udc_vbus_session(struct usb_gadget *_gadget, int is_active)
 {
 	struct pxa_udc *udc = to_gadget_udc(_gadget);
+	int ret;
 
 	udc->vbus_sensed = is_active;
-	if (should_enable_udc(udc))
-		udc_enable(udc);
+	if (should_enable_udc(udc)) {
+		ret = udc_enable(udc);
+		if (ret)
+			return ret;
+	}
 	if (should_disable_udc(udc))
 		udc_disable(udc);
 
@@ -1691,12 +1699,18 @@ static void udc_init_data(struct pxa_udc *dev)
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
@@ -1726,6 +1740,8 @@ static void udc_enable(struct pxa_udc *udc)
 	pio_irq_enable(&udc->pxa_ep[0]);
 
 	udc->enabled = 1;
+
+	return 0;
 }
 
 /**
@@ -1761,10 +1777,16 @@ static int pxa27x_udc_start(struct usb_gadget *g,
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
@@ -2430,10 +2452,16 @@ static int pxa_udc_probe(struct platform_device *pdev)
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
@@ -2509,13 +2537,17 @@ static int pxa_udc_resume(struct platform_device *_dev)
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
+		if (ret)
+			return ret;
+	}
 	/*
 	 * We do not handle OTG yet.
 	 *
-- 
2.34.1


