Return-Path: <linux-usb+bounces-13442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8867951902
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 12:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2409B2317B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 10:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECA51B29B1;
	Wed, 14 Aug 2024 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dGg+pl4G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB01B1504
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 10:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631776; cv=none; b=W4OPESDSPVuotpaAulJcdMWBcRv4Hczwl61bRHqTlziOun5x4BaDk1GrWq76BgJSTENnueYVO1FyyOQZXKh0fAKoGdm/QAM5dmoq8qE4jonWpg3uFwvi3FEUjST91aGpfnw5cjp+qjIp5SI7ZdLZA3T+KqFpTXdncDlAyXSk6x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631776; c=relaxed/simple;
	bh=VJH7ww0yEa5hwteKt4Iy0cvARyKEeaAwJ+DzHXrHZjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JA24sT59iAKOlV7WbuFsoLrkD8aawtH2JCus0/72UwfSVRpvM0Li95a2B0y1hT06sM4Qd/63RZxyafnRTYUfkcvxSa7jP7aFtSm6CPZxTW0kKseeriPhzITBpfmSYyDnp8pMpd4zUN+KRvHPI0EkGlxfvWX3TZregx3D62PxbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dGg+pl4G; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso49414985e9.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 03:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631773; x=1724236573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjbppopIL/o3EmGP4sE2p5zF2oRRpxGK4rh7C3MD61A=;
        b=dGg+pl4G/R2o0b8SI/qOXoo1+diYHQ9VyewoJjmKCtunLZ+Rf8oxs8L31EAcJdy2yA
         h0uzz2/q843iah0kOQVm04thZ2R88k5d354phYJeaAFkD2JUp4Tz1ijZ83OyZGdLlHgd
         mLyUku1h44EuYwEcIwwKek+lQ0UbadbE9XBiSY2AW8PRef6pxWoUXdCK4pZJu2dpM7fe
         VsxzHO7KndFSlvrCRcZl1oyBxBrxA46q0ZqU+m+qlCz1YOetTYx5VvYQvqjeyDaNZw4w
         egSomE/LDVyNCE/DCtpEpUcg2vvEGXqow3mMI91hBxBFB4xpig+IATxD6uPo/aa0lamc
         qFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631773; x=1724236573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjbppopIL/o3EmGP4sE2p5zF2oRRpxGK4rh7C3MD61A=;
        b=lPFFxMVe5fNtkKfcck5KqiT4j0CzdrS25H+JMmEB28UsobhalF0fDLdsMM1oUlufpW
         5VJLrfz0l36wQQGKnWJpNjsh2E4wy6el+en3Cbo7XtrjifEZH7pU//KlemuNzZM+TRbv
         KXRXqpBSjZdPpuwxGyH1sh2TTLFOf3iFWYvEkYqristUpOEZ5n3r64fHYwiNxXf7uvf+
         m4WFA22+VyLA9fXN90PF/aLZDdWKm9SftO5uS6aXhQkd3V99q/VwKHwZ+DD6yLSBHLyT
         qJrsfXkiWJb0TpfNIK7oFwrke9nI5lex1k9HhoySBnI8Nny0zFos5NN88XKe9w6tVCzI
         nh4g==
X-Forwarded-Encrypted: i=1; AJvYcCXWj2+7Tp8NAiGD1dFRp0BKA999d5YYoisM7d+EYPR2ozws7c6W4IdLvna5Fk2clvzzDu3dS868mzZsyAVPTn1uIcpgF+FtXpR4
X-Gm-Message-State: AOJu0YwIadtBwiY79djmrhHrqPIdQ2vAcyVBp+NUtsoSNCvzqR4O15VI
	JFkzA3jiNvKZD4iJpq7Xafah5GEebSNw3UObQ2CKXI5RBJnWBvdZtXI3C9SPfm255HdDMBYRAGz
	8
X-Google-Smtp-Source: AGHT+IGqOC4P6LuGVYDCd0LGQ8yL+BZNLTycWYBXifIzEcMIwJ4l2eW9+kjhsDRezNFecC2G2PBsOg==
X-Received: by 2002:a05:600c:500c:b0:428:6f4:57ff with SMTP id 5b1f17b1804b1-429dd26702fmr14846075e9.35.1723631772912;
        Wed, 14 Aug 2024 03:36:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:36:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:45 +0200
Subject: [PATCH 09/11] usb: dwc3: rtk: use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-9-95481b9682bc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VJH7ww0yEa5hwteKt4Iy0cvARyKEeaAwJ+DzHXrHZjQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiHDUE1X6S3IWAv34HXtuIqBmv1I17GruhtF
 vPMWowVMvuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIhwAKCRDBN2bmhouD
 1xX3EACUB9tf6k7X0MULQJXFJ+ZLByLYVhL7ksURJsGivZ2/rG8khKJhe+lNIOn++WlU7XJ6e/e
 8/qeTs/LZWS5ZgzVK1vHRD5noK1fQMkTLERlQpN9puEVzFAlrOp00EoynceA9fR9741SS6kqQhw
 QrrJ89/ko3JPlrJ3Dz+RAYz9D77pCEA3VCW7R6yLm6PRwQd75jVNC8Lvw+5JGCRNweIoClFZN0H
 4+mcDdT5nmdvghsSAaefcdJZ2XXqiqWFFiiLBxRg7aLVnrdycDIfNIg7NLldPPEH3v8z3ES8m9d
 bN4sbyYuiR37k+qLrRorIyuKEMRwawAOxehbBfLrEw32eLQ5Oaz5XTlCkOsVel6ibAEO+nb7VKX
 IwTeclzbW8iQfd96NyIWUCsFcluH4fpk8GJ+iUwqjD3dUQWFUCB/4GoygBqH+VgqtWhwREQg27v
 UIL/XZf+6dc5dsHcb3NqrgIxdmCwRk8N3P3RG2aiiiMT7XKF8xVVdVTsXtWp2OM/RJuw8YnXwaf
 7NCtPLKtmR6IcVhsLuvFszR/5E8PFz5HI7OFHLwqz1BvPJZ+CQreQwvoiiUjHOy83Lalcmi/uHq
 911FcqaYwh5nkFNMDbJlgW3jlN/j/q62/fb6nuknwCxuYfI7rcZ4kjxp07zimDhiZ7BZMCma95D
 HG9w8MKbFx+0k4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-rtk.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
index 3cd6b184551c..1e3ec2084286 100644
--- a/drivers/usb/dwc3/dwc3-rtk.c
+++ b/drivers/usb/dwc3/dwc3-rtk.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
@@ -173,23 +174,20 @@ static const char *const speed_names[] = {
 
 static enum usb_device_speed __get_dwc3_maximum_speed(struct device_node *np)
 {
-	struct device_node *dwc3_np;
 	const char *maximum_speed;
 	int ret;
 
-	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
+	struct device_node *dwc3_np __free(device_node) = of_get_compatible_child(np,
+										  "snps,dwc3");
 	if (!dwc3_np)
 		return USB_SPEED_UNKNOWN;
 
 	ret = of_property_read_string(dwc3_np, "maximum-speed", &maximum_speed);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
 
-out:
-	of_node_put(dwc3_np);
-
 	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
 }
 
@@ -276,7 +274,6 @@ static int dwc3_rtk_probe_dwc3_core(struct dwc3_rtk *rtk)
 	struct device_node *node = dev->of_node;
 	struct platform_device *dwc3_pdev;
 	struct device *dwc3_dev;
-	struct device_node *dwc3_node;
 	enum usb_dr_mode dr_mode;
 	int ret = 0;
 
@@ -290,7 +287,8 @@ static int dwc3_rtk_probe_dwc3_core(struct dwc3_rtk *rtk)
 		return ret;
 	}
 
-	dwc3_node = of_get_compatible_child(node, "snps,dwc3");
+	struct device_node *dwc3_node __free(device_node) = of_get_compatible_child(node,
+										    "snps,dwc3");
 	if (!dwc3_node) {
 		dev_err(dev, "failed to find dwc3 core node\n");
 		ret = -ENODEV;
@@ -301,7 +299,7 @@ static int dwc3_rtk_probe_dwc3_core(struct dwc3_rtk *rtk)
 	if (!dwc3_pdev) {
 		dev_err(dev, "failed to find dwc3 core platform_device\n");
 		ret = -ENODEV;
-		goto err_node_put;
+		goto depopulate;
 	}
 
 	dwc3_dev = &dwc3_pdev->dev;
@@ -343,14 +341,11 @@ static int dwc3_rtk_probe_dwc3_core(struct dwc3_rtk *rtk)
 	switch_usb2_role(rtk, rtk->cur_role);
 
 	platform_device_put(dwc3_pdev);
-	of_node_put(dwc3_node);
 
 	return 0;
 
 err_pdev_put:
 	platform_device_put(dwc3_pdev);
-err_node_put:
-	of_node_put(dwc3_node);
 depopulate:
 	of_platform_depopulate(dev);
 

-- 
2.43.0


