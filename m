Return-Path: <linux-usb+bounces-20561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F3A330D7
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2025 21:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34D227A3C33
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2025 20:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129D420125B;
	Wed, 12 Feb 2025 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZwKHqBt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64F0200B99
	for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 20:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739392168; cv=none; b=lNxQYXfgqizyN+ddjlhPzlmJpVG3v5gY0wGCp4kZKESwkQSI7T8VGNtQS7e2g+54B/jxjAO3t+tfb+xuf1HZZlfwxeFj5/qrdpUp/ugZzc/WX17ds3SgR5uKvw4ZWvJsO0UidGKzPr7rqhtGWujbPVsrf3ezxtPLOhlcjrE2pRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739392168; c=relaxed/simple;
	bh=fMzZBQwz2zarejgNGL4Eghd7LeFJHEGwlkIQxCyakHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+FoukvKGLfnh0YgXcN9Iy7RfnknvwF2GzVicYoXyNNXhy3/ks/0+ZTe2nMPayeQxjsletKHPFysR2HzLnvCmp7JBFx7PK/6hO28iNzURpbK2yoC8+QZRRBZZlFmoUmLH0gmUg3bHsj+JMZV25qSCyh85wDYTHvU6ykB69FC6Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZwKHqBt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc10e479cso19754f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 12:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739392165; x=1739996965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4Xly9Z4ajTEnrRhuPY7JmSmoF3/UWXiSM6R6mhlLyA=;
        b=pZwKHqBt58QGRlSwPZ1jlpmJZljAA1vRhplovav1qTgBp8PCam6l50AmQ4tvA+Z9Hi
         3mR+IL3Ru8VBt4GrZJ/1tglzvEg1TksiefXvwt6zmZGP6+hZn1vYG9gvOzcpNjrSle+d
         cW4xfKT7nX0N5PkQOZ/AxcP1/KCxQYf867RXtV0Y7qApyr/5plWm47TfRnfPyW16RxXv
         jGLS2c2c+w91bk1+s3hPYn0160jxHqIZ305KLZLJLx3Fim9iPwxkvFl8VK0NOkWacjg/
         J6e7tJtyQ2gdnezZtkjAtssgaqJJEcEthTSzaZ9zta+g0gFxPAEfm7wSRRkSR78+cWga
         NTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739392165; x=1739996965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4Xly9Z4ajTEnrRhuPY7JmSmoF3/UWXiSM6R6mhlLyA=;
        b=qKfHuLo8/f9EXV7ElX+sL/Eeqby96XMxDv7aIBZCEkuFTMZlzW1nWI45MNqoxB1FNc
         yLP/ZfY9gMl9YOD949FnJx0+wR55k0qPT1gOBWMi7S6nrZ84JgSRMG9yDfN3NNF7utBQ
         w0rnw3+6KTfqN4RK58q/JATskv9Qo+TPgwEWd0OR+ljO8TxB8TanxHMXvYtv1jBdIDrN
         NqOGJuce718bNUVdkZkT3I9/3ApFnEw6SN4qqvprb4X0AxHLPcb3pAogKAKqZLPeq2Qe
         T6ssl/xXLjyyyu7OdN7RRwNFuAo4vsSIw97SXdUD7DpJ/GdJg7ktb3oAn3ZhCugjA43y
         pBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjXXuaUZBMIi8vABZ64FkLVHJgbyBS/tfbJ3MOvIQ9S5tsEttbHRCkCnX4X778ZoZweVAW9WD+PJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbyfsmAhXjcBrIxlludeo3mdbqfVZgN3AtD8k4E37lQDM89rB2
	vW56UaRh+0ZvGI7E2uqzE4wg0h+iJrjdEfUkdbhEcW+/wVgRc9YnMbDFhDRmUCU=
X-Gm-Gg: ASbGncvVdMZF8pbIuCAsPc2VCLpqZ8fUBlML300Ws4iIB7ZkQNJOBPCpifwbgir15eZ
	4TrBOub1owW1l7vyeojucYECfpOyOcAlbfNBoAW+l8bBrw7Vsua3fTjK0urBzZlyEsTEeBDVmmh
	9FazOcEtFNL1+6QWLvPJ48HYLaRpKx/nBNoLn7+GuZwveajZHJ+rOzmzR5ja8cYeivCquHfvf1i
	+0ojH/53eAFbk9lycW6+uDj7W7tLy/hZsYVkqhyvmHl08pRTNOG5l6PxZM1IMQ3mz9a39+aRqSI
	QfULCAxowAOVNhS1pFn5Irk0j18nfg==
X-Google-Smtp-Source: AGHT+IEIX04KbEhnC59jF35sJIWxiziJxxlj7+Pxs6uWKXoNxjH3yyR8TvsCk1zSJHtc3g87I5swYA==
X-Received: by 2002:a05:600c:3585:b0:439:6103:d2de with SMTP id 5b1f17b1804b1-4396103d503mr656295e9.7.1739392165041;
        Wed, 12 Feb 2025 12:29:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f21ea3246sm1454554f8f.81.2025.02.12.12.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:29:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] USB: dwc3: Use syscon_regmap_lookup_by_phandle_args
Date: Wed, 12 Feb 2025 21:29:13 +0100
Message-ID: <20250212202913.23443-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Rebase (drop of_node_put)
---
 drivers/usb/dwc3/dwc3-am62.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index c158364bc03e..9db8f3ca493d 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -153,11 +153,11 @@ static int phy_syscon_pll_refclk(struct dwc3_am62 *am62)
 {
 	struct device *dev = am62->dev;
 	struct device_node *node = dev->of_node;
-	struct of_phandle_args args;
 	struct regmap *syscon;
 	int ret;
 
-	syscon = syscon_regmap_lookup_by_phandle(node, "ti,syscon-phy-pll-refclk");
+	syscon = syscon_regmap_lookup_by_phandle_args(node, "ti,syscon-phy-pll-refclk",
+						      1, &am62->offset);
 	if (IS_ERR(syscon)) {
 		dev_err(dev, "unable to get ti,syscon-phy-pll-refclk regmap\n");
 		return PTR_ERR(syscon);
@@ -165,14 +165,6 @@ static int phy_syscon_pll_refclk(struct dwc3_am62 *am62)
 
 	am62->syscon = syscon;
 
-	ret = of_parse_phandle_with_fixed_args(node, "ti,syscon-phy-pll-refclk", 1,
-					       0, &args);
-	if (ret)
-		return ret;
-
-	of_node_put(args.np);
-	am62->offset = args.args[0];
-
 	/* Core voltage. PHY_CORE_VOLTAGE bit Recommended to be 0 always */
 	ret = regmap_update_bits(am62->syscon, am62->offset, PHY_CORE_VOLTAGE_MASK, 0);
 	if (ret) {
-- 
2.43.0


