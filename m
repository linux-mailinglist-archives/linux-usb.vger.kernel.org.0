Return-Path: <linux-usb+bounces-27395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 552B9B3CB04
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 15:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DBC45E589E
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 13:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BC4222599;
	Sat, 30 Aug 2025 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SbrIFGXe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ADB12CD96
	for <linux-usb@vger.kernel.org>; Sat, 30 Aug 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756558869; cv=none; b=gSOLPKhtw1mwQg2oKOxXVpUitoOSP7dcsExDLlFzV5UqzMpxbvQhXL3twuKUXvyVUWfpVGk0X6Ea0+fDvlcuPkL+t9GFLvi1oKfxA5y3QWxhxMlP+poPDxJbMEZvr+9CDuaqC7hs8ukvkiCOAtcLRzNZlBXRBUg7bQqOdpaV2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756558869; c=relaxed/simple;
	bh=F10VaVS5/ArpOG9M7zzfIdLqM2KBJPmJ/FtgIA4jIL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCssoAuO322mqs6Siyap0ooHcL5sTe9M4C9Dny7DSAR6nrpRxWSDgqGhQ8vrK7Hc1xoXzX3B+oDBKousuF/W1kedkHqF+OfF5Vwdod5mnYavop1Tgh3Btl338PG2DslRDXTxsnUh0Z4Lp/bnFMhSV/XsTkjvmxi5pITsgOcx+9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SbrIFGXe; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3cd99b4bb72so254651f8f.0
        for <linux-usb@vger.kernel.org>; Sat, 30 Aug 2025 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756558866; x=1757163666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7M3vCsJMZ43cEz62AGJknDQN7G2hxsKCz1yzLKeGQk=;
        b=SbrIFGXePBnm4ICz+wmEWvcM56ZZyeCdnkQI10ScMMvYKD4rv5/61GdSMq6aHXYiWJ
         Kx3F+SaM1CLbffCi+D85MaftaBTSfhmQ29SxDQzkwqD/Fcz3+IVqfL0vskCuCd1dpEy2
         mU0NSq+eWM8PRCT63z29ytL6s+PebozdxDCQEoM1c2lPGXHZJPY0xwAfYiL9zhC/x8gM
         u/SRCaEjpcmqVRTy9n4b/OtI2wEGUkR4dk4cBZuRJZG0Jin6ITDQqGGuHY2RDkciUCoE
         42zf5KITdfq0K9JsouSuR8vM8ppwfwnc6zotECq71QjZ9MP9U+x8v+JrI7DgiXRLT8vf
         thxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756558866; x=1757163666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7M3vCsJMZ43cEz62AGJknDQN7G2hxsKCz1yzLKeGQk=;
        b=sfKwYEAwVkaIIyT3ZMu23VMGvXYz+q2iLffWf3S+3bc7RH/1OdltmFsmmM8g5KNqqH
         /Q9t2kEznBFVOCTopFBWipyLLQPA9piyo2TLuZz11/HdnfQT7gHz7hPnLJcSqwULv6GE
         PGGgsRNWYOkviv6ado+/GsEG3JMRy4WcaGWwoSOPd2jxnOvEmgDSL5nuhuMeKFwmXPPM
         xneowJGJhA3Dj+TETGjmic+npJJfWe3xJ8eOQDtQY2o0283Tyl/IfsIhaRlcF1Yt0jpo
         aRCiuiIIg2T/DHSBPTMtuRyygZ69KQSqVIaVuk1qsNg9CcGeltOafQCojUWxwQvOFf/m
         TBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCEeApy53Yt714ZFgDcFCbu/bDSOCZj/ypzRU8FWGJXYB85iVMmmcpoQRjE4ttBeuYxOMWiwdsMtU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt5j1gu294EIh4RxOU2CvbRlCykDGG6NFNpZtejg+JvW3/83Sc
	vCAhPl7KkKjdENNYGmjn5hcDbU5IvRwkRZCTYYVUJRx7x8fkrqmZyulU6DnRMnOg0PU=
X-Gm-Gg: ASbGncvpUNTP3WtA1wW7rPQWTcYIzORiQ8T62M82Ny6Fu3PlXch9UgeudadFPmZYtbD
	ajXNMAX+DFq6schW/b+HSUBtqULQhVZkm6W67j1pr0/ue4eWsHEoAWPUDJbvCLuLVYpAhk41f3o
	vR+NDAKdi0yZzWbknMU/GU3H+asu70bWpj3sIXwEsJ70B2BL+Vu62VMBxTo7A1mKBqBAesVDI5c
	hFb4Mqnn81eS7muMze2Y8IeFDcKmzHiFMUpawnLLWiXjhlj1IGbOy7wjdTFSdTA8kQShFwWK5Qg
	Asm8G/WmBGbG1LkvCoIRrJ8YfMyGzVaUa87MWkck7cF0TujaayV2qoiObDaN8iA7wmW5KtvKaN3
	O6/XWL1s+JYhiK4/lps20EwSTpG2GrLCKvw==
X-Google-Smtp-Source: AGHT+IEu1+x+u0FHULlv7GGaPuC8Ffe2R8NvXXiJsVVqoIZf6exP5Hg/aAeQyEtK81AZG0NwYJM3IQ==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr20236235e9.0.1756558866091;
        Sat, 30 Aug 2025 06:01:06 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm80211125e9.0.2025.08.30.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:01:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] usb: ohci: s3c2410: Drop support for S3C2410
Date: Sat, 30 Aug 2025 15:01:02 +0200
Message-ID: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=F10VaVS5/ArpOG9M7zzfIdLqM2KBJPmJ/FtgIA4jIL4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvYNA0wmJK+pguYnQUpTK/ASBvUxQPhgV540P
 UE+4CLZevWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL2DQAKCRDBN2bmhouD
 142PD/9p3DrAcMRMNNzkSIXpDhHq3HZY4MvCuwRl1jcGO+FbxdaCH5lhrs0RvCDhX4y/ZEmisPb
 8hpB4RYc5hKwsc5QGrvl62wUN8ExpxyvulPKkLmLbJpRTdLVYFb+ndZWgKoWoPq9h+0AFRo0xYh
 4xdou3tnK7wqOhJLyCP9f1m26m2bkl8/A1r7z/Szy9GE/bVYtWyLEgmQ6A5a+Zw3c5xGcYX/sHL
 OJArL5NO5P2AaZBqncFRTXKxqP8IYqBSlxyOJxRp736IRjhyHAZ3e2CBXUaDAKFiT4aSvMFOcDA
 xwEatA/oE9jpSrViZyxCx/m7rlviYzRLOhMuJC2KbCLYy/4N5SXNaQG5v5QwwMDjJl+wgMPBOI1
 VOA21of9u4DNS6qIXDvEOGFdHw0Bb43GMU9GAXuU19IcjLarXeLKmqBMMH/LXOKD5DExjceCUYX
 X/HAG0mwVTV8QS0Et0voXOAXUP/pg6ns1cyeEv9F0x3L4qu8ENUw72ntwyYoIUBq0QB0G9iVR/V
 B7vkd+qHlS1RBWoX2H0lBulDw1mqzctrH+mnNXXFDAUuIFayz6hos9RQ3oliud+K7Pcm7hKdAGg
 7f7vXiXAbuhabPtJ2b9zgLF9isy8sTINNfrSrCxdGEf1oshN6POaKyXEsQob2MQgQPsoSSbVmYK VZ/+HBRX0zAaqMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

The driver is still being used via platform code for S3C64xx platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/host/ohci-s3c2410.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 66d970854357..e623e24d3f8e 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -448,13 +448,6 @@ static const struct dev_pm_ops ohci_hcd_s3c2410_pm_ops = {
 	.resume		= ohci_hcd_s3c2410_drv_resume,
 };
 
-static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
-	{ .compatible = "samsung,s3c2410-ohci" },
-	{ /* sentinel */ }
-};
-
-MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
-
 static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.probe		= ohci_hcd_s3c2410_probe,
 	.remove		= ohci_hcd_s3c2410_remove,
@@ -462,7 +455,6 @@ static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.driver		= {
 		.name	= "s3c2410-ohci",
 		.pm	= &ohci_hcd_s3c2410_pm_ops,
-		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
 	},
 };
 
-- 
2.48.1


