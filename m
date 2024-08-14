Return-Path: <linux-usb+bounces-13443-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99F951904
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 12:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E2332831DD
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 10:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477D71B29CE;
	Wed, 14 Aug 2024 10:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXfzEKm6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C131AE845
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631778; cv=none; b=kqYZbcOlR2M3wdktSDgcsijVvVQ1souxPV70SAsrH21Q104J2LORSRHN0UbJu8O701F/p5btRzR+v9zR/ZSbq4ehZcvekV3gM8Ua5rj75/w4+LMDXEXea9JeL8RSvLeOSbHi9YFStBTygRNEVKp1gIj4l8hOfmZaH7Q2a7W51Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631778; c=relaxed/simple;
	bh=aHruM+v3S7F5SKLPASpNGwqsVSdoAILTTajaygaE0T0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OgmT7oNSMCs2aj+mo+DLGjr7M4Beuj6UWLJxWLH+gu8eX/JjprrW9yozH+QPcJUrC9plCImTxGMSf8/qDYrBsJMN7Lv/PwV+WEhR+ZfrEOLUE8Z1+ChoZHBBhM1RU9htbkOHz3KnpUENIV2byb4i6n5R8QsifelcTWUSwD1vZTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXfzEKm6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-368440b073bso445363f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631776; x=1724236576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOU0Gq3KpoO7WBWTzWhfXxGaOW7blDKSHePxJmszLkU=;
        b=wXfzEKm6Gg5msXS+soAPWf524zrDcnqAhncEixwvpdTupjim6Z9I5EoiUMRT52K7EU
         qj+5+tP4BFrL9vsNHm158YAAlaHFZuVPBKQlhRhZ/LwjreAj8ryHueRVVhPUwHYw/a5Z
         zHEkZUH5De1PdY9vI6jte1ip7jfJ9z1H1vQ4EC86/bcUD6CDFT84V87DDU2jkqTh7Rne
         Tf55NPGTvIzoDJ6DvMrAlxVj6Akn1wZDQ4odFYJtMGBaXCAAQGSSXVZMN9VRvcmrYfE6
         hDYsuaYq5y0t2j3i52Tb0FrbSwe1McteUzvaRI6+wtyVK9QJra+bmNnZpWNjtR3dQndR
         oH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631776; x=1724236576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOU0Gq3KpoO7WBWTzWhfXxGaOW7blDKSHePxJmszLkU=;
        b=VlN95vN3UZ7868R0wfpTURbhEgHRJEQOKsLGFX6rO4Zaznrc+6WHVWk55Sa0ib7Mtu
         LQDZHjW0WZ9BQoBPJO5ctYaOSvHgnm80Ts47Cd6/Us4HbahGW71wvI7Zvdkor+QllEaX
         1gH9gLXiJuC3avlkT3NCvEblgdE2fCwX0ty4NrwPNk7e9UfVnkhPwEagL6YPbv61pRUu
         KKZqKO9nFfgxoZ718vfkIWXFLWwQESwZyAY9l5t5bawAg3uNqV68ujanFCoSYJHR44JC
         gPiUVMlQNOwapA8l3jQvnX5JtKlbd4r41QUtcExMAqi+tVYkJSajUvGbXIP4AOb6BVgC
         1UxA==
X-Forwarded-Encrypted: i=1; AJvYcCWpWS7kge6URmGqj/IGyRUV7LJnBDRhn6r8ZZqu4vfNajYkAVcXsenmtGYVGdHcHK5Gi/EggfsgjWx7yHjZHhcy6mhXOa2wNScT
X-Gm-Message-State: AOJu0YzOqc+z0KaZ2j4arpXBPy3/ar0n3ALOr6FzzlCixdImpgMphzlm
	tecVfELslhdunu6Ob/3BokuBynH/PeIklRf+25WCa+fk9KVD2SQkJFUB6zPc+qA=
X-Google-Smtp-Source: AGHT+IErg2dHX74n5TysQQr/gvq6r/w/Gz7PLsV5/06cgv2TpA9Ny7e7jZhd+HWMaeBO4jWCb6N20A==
X-Received: by 2002:a5d:64ac:0:b0:36b:aa27:3f79 with SMTP id ffacd0b85a97d-3716e3ead20mr6020700f8f.4.1723631775573;
        Wed, 14 Aug 2024 03:36:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:36:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:46 +0200
Subject: [PATCH 10/11] usb: dwc3: rtk: return directly and simplify with
 devm_platform_ioremap_resource
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-10-95481b9682bc@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aHruM+v3S7F5SKLPASpNGwqsVSdoAILTTajaygaE0T0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiHcSmRGhuwBz9e8Zrie3GMyf3A0DgnlB9Ci
 3oVAGm9VeuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIhwAKCRDBN2bmhouD
 1z/CD/9uYBrkwDpgMI8jLZ53spioe7hi+WbHBN32G8REKLdl035c6yyTkROruKhRMuCf/nB2BAw
 zDvWRJ/BidEMKr/0ERGyF8qpLSINWEJ6XQgKy8w+RCOa9qE5OyTkLrLVOrSVJZP6WDHYGmL5rDe
 Usk6jYBh0+KlqjawNYoC0DIjOZfY+rsbdqZr5xvRebfaFdRoPgqPADVkQurdUOwEu5maxtIZBaL
 AkEFUDGk0Tx+hzMJJsNFWyR3lAlbpb2Ik5T8rFUOKT7SZZgO8JdVR9WekyC0gv2PBIenJaU2bjI
 XFas8y71W1ldpMyNl3HldhhsBDC4SgFTokUml3IipSwBW2mIO+2B9qTD5W1ovj2VdrgWOlIqa/s
 A4J5Wln/Uc3DyYqeJylDOowhl0xVA+KRAgfMrxZ5qw9hh50sIOUCXieTuDwmcSMd28VNNmwrbhU
 6/DH0lnscNlTUz3gWML/YMgxhXxP6P0GWDeJ5MKFUvvO9Irv4N9Oo+2o4G9BWUMtjXj/8C+uw/a
 27m8GCF0qcOU1cibcw0sRBO7Apn2SRgjwc2tJz29AQH3xQb/g1PI7VraLR257qoqiEJmOtbHpnN
 E3ylOe98tUFbr3sYRnkOwxrOsI8nA9Is3o8leV1km53qyqmJWauSw1Vi2x7e6lniix+sXjtt0K5
 K9IRO1+qoV4HcgQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use devm_platform_ioremap_resource() wrapper instead of two calls, which
together with returning directly instead of useless goto, allows to
nicely simplify the probe() function.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-rtk.c | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
index 1e3ec2084286..b3db5cd9906e 100644
--- a/drivers/usb/dwc3/dwc3-rtk.c
+++ b/drivers/usb/dwc3/dwc3-rtk.c
@@ -358,30 +358,18 @@ static int dwc3_rtk_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	void __iomem *regs;
-	int ret = 0;
 
 	rtk = devm_kzalloc(dev, sizeof(*rtk), GFP_KERNEL);
-	if (!rtk) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!rtk)
+		return -ENOMEM;
 
 	platform_set_drvdata(pdev, rtk);
 
 	rtk->dev = dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "missing memory resource\n");
-		ret = -ENODEV;
-		goto out;
-	}
-
-	regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(regs)) {
-		ret = PTR_ERR(regs);
-		goto out;
-	}
+	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	rtk->regs = regs;
 	rtk->regs_size = resource_size(res);
@@ -389,16 +377,11 @@ static int dwc3_rtk_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (res) {
 		rtk->pm_base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(rtk->pm_base)) {
-			ret = PTR_ERR(rtk->pm_base);
-			goto out;
-		}
+		if (IS_ERR(rtk->pm_base))
+			return PTR_ERR(rtk->pm_base);
 	}
 
-	ret = dwc3_rtk_probe_dwc3_core(rtk);
-
-out:
-	return ret;
+	return dwc3_rtk_probe_dwc3_core(rtk);
 }
 
 static void dwc3_rtk_remove(struct platform_device *pdev)

-- 
2.43.0


