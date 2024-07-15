Return-Path: <linux-usb+bounces-12212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC7E930CE4
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 04:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22272281379
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 02:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB35C138;
	Mon, 15 Jul 2024 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mlSoUAFM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B52847A
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 02:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721012333; cv=none; b=bZ8Df18c2F+i/wngGl77bqHypYlqIMcei14NgDk1GM3pT9btyFowEszQ7l79Fn0YcrTqj1VZRl1/2r1vgFT++ouIzERsbl/+xAkiNZ0KzsG6HD4J0Aga5EJdZOePbWbzy5CmIaC3xa1NgJVug/auVK84X+Vsq1Hylcn3OiaSKUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721012333; c=relaxed/simple;
	bh=KF8l2h/GrUQnQ0eHMCYrJFiN4LDzhTvBEiBndZsaNAo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ptt1x+ipOrvHWVDi6D3bLoTdaIqkqrrEDq6piyESMNL/3ASgGSu3VVxMWSaupVHHs+kcCX3pO+V1D4LvP7msedMvDR7SGDXcNaHFeAkctoKyGuSZ33neTjdEjHcLWz0zUT5jsNNnv7J3bc0+D4pjAaYLeRPNZEPaJt92G2Kk9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mlSoUAFM; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e05b6cc9275so792250276.0
        for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 19:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721012331; x=1721617131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l9iRN9tyg2Ah/12TCH+6DWgzr6OQh5TsD/9/hu4zUUM=;
        b=mlSoUAFM63IAqE5dXLdLcxwJyQnCS6unfFC6kQcorCot57f9mTA/bOcTuoQ1LhU5ci
         eRmD7iVFdBlXS9DlzK4+meVFrj2EnPO5obPgrfuiubVHVp6upRBDtt3uDK3vF02XiuPl
         xYyt6mG+ZVMdzeuPWwIOkXeE3vvPFV486OZbza/ByqOrVS0qCruAjhWGhiShTH/y0uTy
         XhNJr8Is9jw+EvdTaXQedy9nLBEzYgE5o1kysfRht/Dh+3aZAxhzojJ/J9XXH0W1p+xW
         +Lg2vnixGOwuJx7Vj+eT8DWJfP8SluJlWJULQxXBNGagGE61tABwo0zS55e1TXZkLX1C
         bAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721012331; x=1721617131;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9iRN9tyg2Ah/12TCH+6DWgzr6OQh5TsD/9/hu4zUUM=;
        b=jJ2gwcVW9SReL5kM/P3b0sXWuaYmhny5VTup0vwV2xn1Tzylt2R581jq9cChc7auaF
         gObtg2JGkI6HUJZnZzNnA7PeRd0MFiqMBkJhjiA+TCobTybLEZbnDzN8KazuemTybNns
         QnB02ad720RsCCGaG4w9gMBT9v2s07Mgli9dSgZbIiJ++7oIP/l1irseFPwmMjpkx+S3
         wkbxkAvH+zGnti4zj6ZWeLP7s4IClNM+cR7D36KwNiHzdMFey4TNGMoF83+tMYJoGUQm
         DyM7Wbk2JspBbc1ulgT2fCT/+91mTGH0UYcUXEkRgwO5Z4uJMUGdWWoAVegX4lR2o3OD
         Qhaw==
X-Forwarded-Encrypted: i=1; AJvYcCVUFhsRczdRmcRW9lpHdYLEfGd0B4xMDqAgr50Bi66iLfl3L/8MWJlx+5s4SmbuLEK0Bn+aMGQh3I0yHKaXBsBlq9ZqPkPO+Cur
X-Gm-Message-State: AOJu0YyUrrpnfiA1f2s9RMxaTSugV5aHEHSINw5CwGU3qwlru7hw4LtR
	Zsi52k5xXqH4puTOl64ACW9AfdXk3fmOgd3wqdCQw1mTRHMypSpf7BtZytPXoa0T8BhShXdhczy
	ejRmTjA==
X-Google-Smtp-Source: AGHT+IG41R17PIhFanq46nM/cn4uF1bXHxLFiyZobEJOoUojYLHpl+dfgdfv4dT5UhCbD8OSz+wp2yF0QGiZ
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:a7:c:d8dc:1c82:c8b9:bf19])
 (user=kyletso job=sendgmr) by 2002:a05:6902:100f:b0:e03:52c8:ad30 with SMTP
 id 3f1490d57ef6-e058a8c5ebcmr541144276.3.1721012331177; Sun, 14 Jul 2024
 19:58:51 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:58:27 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715025827.3092761-1-kyletso@google.com>
Subject: [PATCH] usb: dwc3: Runtime get and put usb power_supply handle
From: Kyle Tso <kyletso@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, raychi@google.com
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	royluo@google.com, Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It is possible that the usb power_supply is registered after the probe
of dwc3. In this case, trying to get the usb power_supply during the
probe will fail and there is no chance to try again. Also the usb
power_supply might be unregistered at anytime so that the handle of it
in dwc3 would become invalid. To fix this, get the handle right before
calling to power_supply functions and put it afterward.

Fixes: 6f0764b5adea ("usb: dwc3: add a power supply for current control")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/dwc3/core.c   | 25 +++++--------------------
 drivers/usb/dwc3/core.h   |  4 ++--
 drivers/usb/dwc3/gadget.c | 19 ++++++++++++++-----
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 734de2a8bd21..ab563edd9b4c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1631,8 +1631,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
-	const char		*usb_psy_name;
-	int			ret;
 
 	/* default to highest possible threshold */
 	lpm_nyet_threshold = 0xf;
@@ -1667,12 +1665,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->sys_wakeup = device_may_wakeup(dwc->sysdev);
 
-	ret = device_property_read_string(dev, "usb-psy-name", &usb_psy_name);
-	if (ret >= 0) {
-		dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
-		if (!dwc->usb_psy)
-			dev_err(dev, "couldn't get usb power supply\n");
-	}
+	device_property_read_string(dev, "usb-psy-name", &dwc->usb_psy_name);
 
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
 				"snps,has-lpm-erratum");
@@ -2133,18 +2126,16 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc3_get_software_properties(dwc);
 
 	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
-	if (IS_ERR(dwc->reset)) {
-		ret = PTR_ERR(dwc->reset);
-		goto err_put_psy;
-	}
+	if (IS_ERR(dwc->reset))
+		return PTR_ERR(dwc->reset);
 
 	ret = dwc3_get_clocks(dwc);
 	if (ret)
-		goto err_put_psy;
+		return ret;
 
 	ret = reset_control_deassert(dwc->reset);
 	if (ret)
-		goto err_put_psy;
+		return ret;
 
 	ret = dwc3_clk_enable(dwc);
 	if (ret)
@@ -2245,9 +2236,6 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc3_clk_disable(dwc);
 err_assert_reset:
 	reset_control_assert(dwc->reset);
-err_put_psy:
-	if (dwc->usb_psy)
-		power_supply_put(dwc->usb_psy);
 
 	return ret;
 }
@@ -2276,9 +2264,6 @@ static void dwc3_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 
 	dwc3_free_event_buffers(dwc);
-
-	if (dwc->usb_psy)
-		power_supply_put(dwc->usb_psy);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1e561fd8b86e..ecfe2cc224f7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1045,7 +1045,7 @@ struct dwc3_scratchpad_array {
  * @role_sw: usb_role_switch handle
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
- * @usb_psy: pointer to power supply interface.
+ * @usb_psy_name: name of the usb power supply interface.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to array of USB2 PHYs
@@ -1223,7 +1223,7 @@ struct dwc3 {
 	struct usb_role_switch	*role_sw;
 	enum usb_dr_mode	role_switch_default_mode;
 
-	struct power_supply	*usb_psy;
+	const char		*usb_psy_name;
 
 	u32			fladj;
 	u32			ref_clk_per;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89fc690fdf34..c89b5b5a64cf 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3049,20 +3049,29 @@ static void dwc3_gadget_set_ssp_rate(struct usb_gadget *g,
 
 static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
 {
-	struct dwc3		*dwc = gadget_to_dwc(g);
+	struct dwc3			*dwc = gadget_to_dwc(g);
+	struct power_supply		*usb_psy;
 	union power_supply_propval	val = {0};
 	int				ret;
 
 	if (dwc->usb2_phy)
 		return usb_phy_set_power(dwc->usb2_phy, mA);
 
-	if (!dwc->usb_psy)
+	if (!dwc->usb_psy_name)
 		return -EOPNOTSUPP;
 
-	val.intval = 1000 * mA;
-	ret = power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT, &val);
+	usb_psy = power_supply_get_by_name(dwc->usb_psy_name);
+	if (usb_psy) {
+		val.intval = 1000 * mA;
+		ret = power_supply_set_property(usb_psy, POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
+						&val);
+		power_supply_put(usb_psy);
+		return ret;
+	}
 
-	return ret;
+	dev_err(dwc->dev, "couldn't get usb power supply\n");
+
+	return -EOPNOTSUPP;
 }
 
 /**
-- 
2.45.2.993.g49e7a77208-goog


