Return-Path: <linux-usb+bounces-19365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A95A11890
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 05:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA0C3A4EAE
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 04:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D603B22E407;
	Wed, 15 Jan 2025 04:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5D7hgXe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE40918952C
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 04:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736916357; cv=none; b=Ew0fRq/m08dpasoDDAvH3O2HFESmBLTzptMBAjSr0IwOjNXRTcGPlggc9Mws34alBp3LtHSRpyg4N12LBTQrng3+XVPqEBxuPtIwPofwz+ly193ZkeKQenaWo3YLk2c1czuy/7CbQSLyWFi+47L00gXojOzGAI05bVWSo/0CkoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736916357; c=relaxed/simple;
	bh=Rs3iU75BPjBxdbiw5HZnrXaDjajAgcAfQrjJFAg8Srg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=okipt+eBuX1so3AycluYJJuW9i1sDA5M1WUFsoFfZQX1BLquljujdVRLLVJa3iBFH6cZFtXNBsCZH0YdpVZxLvcvYgggH7Gn+kusC90Triu7R9UPpK0GTetEoB7TE0hOppa6fyox1zug6+4/plla6/JR6hqp6DvvpqCdi6mstFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5D7hgXe; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2163dc0f5dbso122850425ad.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 20:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736916355; x=1737521155; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uzJUS+TBGgIy8wVOHUCLoOBsCy49bT0VT2xYdEdiljY=;
        b=P5D7hgXeaPQ3ppPuYRbJlJmJOIhid/GY3kOUfElhh0lx03Xs2oxOQTVwjS5UizkBlG
         k9McnpK7YAU6oDHN+Clgvj2ouAAi/UqISy0onfHEtkLvP4hpo2JJgfYm53moEMwFcE+c
         kZxglAVs48UPYh+jUDzcIA1i3CBC0da/iP2q1tvVycaG4R5PYF2PfWBQbiX5Pw+Hacsk
         TSVSWEXpMuSVFbajVXqsAg47YFN81UBfEIAszxYXPXgRAIEn4kQ2YnJr0sdbL0htzGRa
         auGxQ1AjdUCeXH8lGspWKSiH9sauJeINfcGa+5d3tjser613xrwn44BVRJCzXxJixKMh
         rt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736916355; x=1737521155;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzJUS+TBGgIy8wVOHUCLoOBsCy49bT0VT2xYdEdiljY=;
        b=YTlzLHBn7r3FltISZTG90ZnTnEx8DH9IXiqX/ZDua79ZUuXVNu+HpfipkRB30vaMyV
         geDK4DqNG9iU0vupuHcTKmQqCYjsjlWTaB6dUNRzRFgEg0oG/N4CmTmP8/Q3h2M4S1ls
         fGcgqxyUwJAQ5cDaM2KfoxIKkgnQoWEt6nF0upInTxDuzRReAm4dWdgcVcKPDDy8DiOs
         7EriInE9KpB4bJe8tphGrFNmuwCCZcXzwcy2xsfLxYKKzBVjSkhqJSnWSYumixR09vDe
         KBLvyjrT9IIwcwzvaiNmnoEJoUP0HK+0DEEDPnDjH8oTtWU0GmMUx0teYEXThTO8el7L
         c3LA==
X-Forwarded-Encrypted: i=1; AJvYcCUZtNwhONugq/+KSYbnWUeuE0NqtXRuaOFFGrofHFktRDGj99g//FsZoLF5iVKs7Bn6fGL5o0jwj3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5q7XJLjuzJcfntJUBuf0WPelG04JuODxszvqTcNF+BuPxW6O4
	FylILQs6jj2QKdbKj8qXDXr7om1pgwWp5intC4kR/tYDdQj0TFUytsKkmIZt3wYve3BQqJ1YuSV
	kdtaDyA==
X-Google-Smtp-Source: AGHT+IH+6g5AYVxZ4+GIsTrLIh8vINC6goLc5AwIWvkIO0MYDuXuHUHdA5IzdZb0nDr+V2ZRBE4yDoW7REMO
X-Received: from pgll188.prod.google.com ([2002:a63:25c5:0:b0:7fd:4c8f:e6a1])
 (user=kyletso job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:12cc:b0:1e1:e2d8:fd1d
 with SMTP id adf61e73a8af0-1e88d0a2b46mr41166358637.33.1736916355337; Tue, 14
 Jan 2025 20:45:55 -0800 (PST)
Date: Wed, 15 Jan 2025 12:45:48 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250115044548.2701138-1-kyletso@google.com>
Subject: [PATCH v2] usb: dwc3: core: Defer the probe until USB power supply ready
From: Kyle Tso <kyletso@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, raychi@google.com
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	royluo@google.com, bvanassche@acm.org, Kyle Tso <kyletso@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently, DWC3 driver attempts to acquire the USB power supply only
once during the probe. If the USB power supply is not ready at that
time, the driver simply ignores the failure and continues the probe,
leading to permanent non-functioning of the gadget vbus_draw callback.

Address this problem by delaying the dwc3 driver initialization until
the USB power supply is registered.

Fixes: 6f0764b5adea ("usb: dwc3: add a power supply for current control")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
v1 -> v2:
- get the power supply in a dedicated function

---
 drivers/usb/dwc3/core.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7578c5133568..dfa1b5fe48dc 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1684,8 +1684,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	u8			tx_thr_num_pkt_prd = 0;
 	u8			tx_max_burst_prd = 0;
 	u8			tx_fifo_resize_max_num;
-	const char		*usb_psy_name;
-	int			ret;
 
 	/* default to highest possible threshold */
 	lpm_nyet_threshold = 0xf;
@@ -1720,13 +1718,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->sys_wakeup = device_may_wakeup(dwc->sysdev);
 
-	ret = device_property_read_string(dev, "usb-psy-name", &usb_psy_name);
-	if (ret >= 0) {
-		dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
-		if (!dwc->usb_psy)
-			dev_err(dev, "couldn't get usb power supply\n");
-	}
-
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
 				"snps,has-lpm-erratum");
 	device_property_read_u8(dev, "snps,lpm-nyet-threshold",
@@ -2129,6 +2120,23 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
 	return 0;
 }
 
+static struct power_supply *dwc3_get_usb_power_supply(struct dwc3 *dwc)
+{
+	struct power_supply *usb_psy;
+	const char *usb_psy_name;
+	int ret;
+
+	ret = device_property_read_string(dwc->dev, "usb-psy-name", &usb_psy_name);
+	if (ret < 0)
+		return NULL;
+
+	usb_psy = power_supply_get_by_name(usb_psy_name);
+	if (!usb_psy)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return usb_psy;
+}
+
 static int dwc3_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
@@ -2185,6 +2193,10 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	dwc3_get_software_properties(dwc);
 
+	dwc->usb_psy = dwc3_get_usb_power_supply(dwc);
+	if (IS_ERR(dwc->usb_psy))
+		return dev_err_probe(dev, PTR_ERR(dwc->usb_psy), "couldn't get usb power supply\n");
+
 	dwc->reset = devm_reset_control_array_get_optional_shared(dev);
 	if (IS_ERR(dwc->reset)) {
 		ret = PTR_ERR(dwc->reset);
-- 
2.48.0.rc2.279.g1de40edade-goog


