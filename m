Return-Path: <linux-usb+bounces-19211-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC7A0A572
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 19:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A5F169274
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 18:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279D11B81C1;
	Sat, 11 Jan 2025 18:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yycgr1Eo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DB11BD027
	for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736621657; cv=none; b=qosP4yl4jyiDWnt4fNhLn7Cr5k9Y+x9JEF4G2027PHT//YAuz9yaTyeGE6RC3bPaZ7VCX2XtVqh/EuikcmlQf6Rpts+sxPDycc4zES2/Ldn4fmu5QkUQO7NH4PD6+DdNWVXFcnJHyVyMXFP26tLYgvUg4BhFjJBwFsYFi1cDH70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736621657; c=relaxed/simple;
	bh=Tyjms/Yti/UvFb8+9BSbIe16lMX+RInIq2Aum6XvGnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JSQjkXa+CLjwe0JAfyJBA83L7AVgwMCZll2hNeF04X6M9IjdMHRDZl6vovt+g7bfRVRsy88z+0rihtr8c98lid2SIeaNpD6fgOwZR1P+nMSd1nCGsyC6OB9exZwJVp4l7MkZZZW90q2eFWX4uZy3YWhInh60DwURA2l53mnzw40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yycgr1Eo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso4370405e9.1
        for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 10:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736621654; x=1737226454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPN0ghv4POmAX7O/LF6CWcXvpxXfP5ryfl6t+1HzMDw=;
        b=Yycgr1EoXbKLETgLN6Dpq7aC7Yl7+Gq8f+79o5eOPBvso3sYucJnC0UE1Ug25FpoVx
         EVIuYtD/yStb1OZJpc2D7ZYGqPQqgf9F1gE2C2zzIV3BfBbGS0H8Xlnk3jUCwGLddaA2
         0oPPHsmXcTucsyJBjNylMQoBHgPFWy1elvDemHm39+uFEG6ZcQFebxnbQje2rO4YWXwB
         7HwDdYcHbx202eCtBMi7yQPUkW/Qp9dOTJYxaUceMv/GGv15MFTo9iUecvcDmqg99DJ/
         TTQUH/TtAP7MmHApaJTZb4WbKrtGPPWJ8FjPPKpfWrRkFivg6TC80hZhsgEvz1M4H29+
         Pddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621654; x=1737226454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPN0ghv4POmAX7O/LF6CWcXvpxXfP5ryfl6t+1HzMDw=;
        b=nY/Ki8V177VWNUGItSqWXh+Cw+gHom1U9wTvwGU+8hO0TWQvNI2LjIWUfOznDrXlHy
         oE3Fe3+UPA7XaTE/O4jiOciZmlDtWu041IRGOLfEmOqjqMGR9jSD1ZazzdnI58eqoA/k
         W55BAFHSKLhMoW5kd1z+9kTwThvjh0DtOztKDnJazZNLq+SzLcpZVS7QPs+o1V+Ve//v
         5gSz0VEudLWJSKsa3Kz0TsTZJZYDKzYyXrO4Nv4YqFqFe138JVchW33laTZDYE2wmwlG
         d680MjO/4dNqT6IL8CC3Gbhhtpdhfz3o74WpZy5vgflgnb2ja0VUh2+AfTa3SMIVax7n
         KS0A==
X-Forwarded-Encrypted: i=1; AJvYcCXLsJ/Ip7Vo8mAMF0cTGYOx07hcdQr6zKwe84LXyeizyiTZXNx8CJ/1QD88c/yib3R6XROvLSv+168=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtK6SzmSHh8gqz0oymorEBq6a3gns0H1SlfMPYVAXIUnZVeKGX
	r2N5hDz/+he7dLM+ri2wL/0fhlzNb4A7X/ANmITxw5pbp6vEMARcd0sFphoS0CQ=
X-Gm-Gg: ASbGnctQ9TMfMcV1S9CjmMRxjSvMNXH/5Gb4JshRm8vedG0uoTbgYxuEMsA3CZSIE+z
	HYTU2doqhOPdTPZ018wkWQJp2r1QLW/gCxgDkNbj4CnA2C+khIHIlztl6IVgYKUZ9fVHVu/MaOB
	0fhDE3KmGn666681H05zp+YIXcwU2PF/42VOUyP5PuNE23rCaB6Khy4hNSUoeDhQy1ppkxhTyfY
	VXiPKs/DgiARcbhCOA8EYgC4JCr4mR0/T1TKfOG80Cz1pcVwgMh/KA2y/MxnTNAepQ0XdU=
X-Google-Smtp-Source: AGHT+IHhmrhqUMId1efQpMotsMGAGOrlDrN6qJOCzg7EtCNkjNnkg5SoD9IRhcQsDqNMz+QidSuVFA==
X-Received: by 2002:a05:600c:154a:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-436e27076d2mr58324595e9.7.1736621654153;
        Sat, 11 Jan 2025 10:54:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm449205e9.22.2025.01.11.10.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:54:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] USB: dwc3: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 11 Jan 2025 19:54:11 +0100
Message-ID: <20250111185412.183939-1-krzysztof.kozlowski@linaro.org>
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
 drivers/usb/dwc3/dwc3-am62.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index fa2c4c08711c..9db8f3ca493d 100644
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
@@ -165,13 +165,6 @@ static int phy_syscon_pll_refclk(struct dwc3_am62 *am62)
 
 	am62->syscon = syscon;
 
-	ret = of_parse_phandle_with_fixed_args(node, "ti,syscon-phy-pll-refclk", 1,
-					       0, &args);
-	if (ret)
-		return ret;
-
-	am62->offset = args.args[0];
-
 	/* Core voltage. PHY_CORE_VOLTAGE bit Recommended to be 0 always */
 	ret = regmap_update_bits(am62->syscon, am62->offset, PHY_CORE_VOLTAGE_MASK, 0);
 	if (ret) {
-- 
2.43.0


