Return-Path: <linux-usb+bounces-19336-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B2BA108E6
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 15:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D15FC162A99
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 14:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D901442F6;
	Tue, 14 Jan 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gxnZXrpw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DCA232448
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864198; cv=none; b=JtK3Bo9dmCjMbSJmDEeC+bXuuCSlktPJS/y38pvt2pocAj+eBur0wF8Wfi/ZI33Grz332OuoD3OlokZcRIsSVRljEdLjLBJJbfqmCT1QC6yb4/fElvpVX+QT0uOoEUocTA+xUUGJZVxGr2XXIxgPFxt6rBWPU9tyYBORbN975Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864198; c=relaxed/simple;
	bh=2E3qbaOE73Jk7sbI6FLKhD7qbg28oP2KAGipqvlhwsI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qfVGGcX5hbWCSMqgvlnvzLwbH03MJD6bQ7gIa/SSZ4H68HhHRFKuOfHn8kZRSGlP5CnDJzAxiWq6N/Uaz4rWVukM00gfp9uvH6azlZpSP6u2y8oTw4m1RDlZjRS8+n3aMVEOQOH+qONzdpL+sLKKDZrD9/L3z3QGmO7HCOiWeS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gxnZXrpw; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-218cf85639eso151064035ad.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 06:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736864197; x=1737468997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=avmnJeP52XhrbIUiTpoZxNrqy28miD97Nfy+XqLUs0Q=;
        b=gxnZXrpwuGXQJvM72L+oQzDrMxwlEeLnXZ4OHz9GjkvYZ/cBtXNg5QPdlyz6g/7FxQ
         Zo5uwSxzRxygJS2/NylNUMNJ0RrOH90BGIXrkEFPS000kHmHh2i8iD/GvZEqJFC8cune
         sBB8geFdcp0p9fOsu8I2b/DYaB08/gf0bVGiD+T/IdmTV2m+pbnEesQIHehwst7C2oVF
         TUY5X1Rg1NPI3f7Ol8RK/XB0tIbHVRV26m8C/t18SLj0COFhcJpyV0d451DBZaAcbcW7
         WknH54Z2Lsu8zpuPvRnB6Ysf6Im1mamvUGX+hWEGa31wHUdLpeYp3QEuAp3A+sucawt0
         0x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864197; x=1737468997;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=avmnJeP52XhrbIUiTpoZxNrqy28miD97Nfy+XqLUs0Q=;
        b=GqyTYF4ovnwGKs5u/PE6pLD6bi6Cwv0CUYRVuri7ILUoMJPuDddTdRYFPsJFivrt5J
         Eh/Qkod0M/nqqhG40p8l887bqGASWHMU8r/zt4ljuTQxx+dDDepEMrvCeGvsr2lkruv9
         O2Oz8ha0Le5yhyphGMOjic7jO8ASzb0V0RbliaPX8lep0wAedLoVAURFHwSm37upvIRw
         igQIenJmAQ+Aa5qDZtMHhWj+WNoVsoZLtFl8x2PII3LAfPBlfh8tZw2FfrEb3D7Ld833
         laPxWo+FX82xVWrWoS/P2Q8EWDqPxJxPu2gZrDDWXsjsCLAYhZiUhKUUhpHK642Is00R
         WpQA==
X-Forwarded-Encrypted: i=1; AJvYcCU1istqO4rVTbh9Ag6szEv73krNYrOFqI2hmFGirTfkZCI6F9gaCVc40Li+U4U0co/hvbECyZtFKf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEFGcUVxKbQLe+QAlkcCVoQrr7hdwcydGIvENamgKI1xFTdRt
	2ke2lauPPV+piSRaDt9Pnqjkj9J+H3CNurJIQOjeE0KcaYTCKtT/i/KlGW1DaUbxmFBK4O0Nkh8
	wOGxBBA==
X-Google-Smtp-Source: AGHT+IHuhPge/LAKQx8gD9Y76v9vi2x2c/fi/iGzC8d1cvWEsELlR4g/XA0QMzvawNsKc5h+NkXx0WCqBUMc
X-Received: from plrf18.prod.google.com ([2002:a17:902:ab92:b0:216:61ba:610])
 (user=kyletso job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:230b:b0:20c:6399:d637
 with SMTP id d9443c01a7336-21a83ffbea3mr435808695ad.40.1736864196856; Tue, 14
 Jan 2025 06:16:36 -0800 (PST)
Date: Tue, 14 Jan 2025 22:16:07 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250114141607.2091154-1-kyletso@google.com>
Subject: [PATCH v1] usb: dwc3: core: Defer the probe until USB power supply ready
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
Note: This is a follow-up of https://lore.kernel.org/all/20240804084612.2561230-1-kyletso@google.com/
---
 drivers/usb/dwc3/core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7578c5133568..1550c39e792a 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1669,7 +1669,7 @@ static void dwc3_get_software_properties(struct dwc3 *dwc)
 	}
 }
 
-static void dwc3_get_properties(struct dwc3 *dwc)
+static int dwc3_get_properties(struct dwc3 *dwc)
 {
 	struct device		*dev = dwc->dev;
 	u8			lpm_nyet_threshold;
@@ -1724,7 +1724,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	if (ret >= 0) {
 		dwc->usb_psy = power_supply_get_by_name(usb_psy_name);
 		if (!dwc->usb_psy)
-			dev_err(dev, "couldn't get usb power supply\n");
+			return dev_err_probe(dev, -EPROBE_DEFER, "couldn't get usb power supply\n");
 	}
 
 	dwc->has_lpm_erratum = device_property_read_bool(dev,
@@ -1847,6 +1847,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->imod_interval = 0;
 
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
+
+	return 0;
 }
 
 /* check whether the core supports IMOD */
@@ -2181,7 +2183,9 @@ static int dwc3_probe(struct platform_device *pdev)
 	dwc->regs	= regs;
 	dwc->regs_size	= resource_size(&dwc_res);
 
-	dwc3_get_properties(dwc);
+	ret = dwc3_get_properties(dwc);
+	if (ret)
+		return ret;
 
 	dwc3_get_software_properties(dwc);
 
-- 
2.47.1.688.g23fc6f90ad-goog


