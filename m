Return-Path: <linux-usb+bounces-13426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F939517DE
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 11:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB9E1C21569
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2024 09:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3360815FA7E;
	Wed, 14 Aug 2024 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dukT9She"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B3016133C
	for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723628404; cv=none; b=gYbXnD6w/aE5YXru+dvw2kY6P46q1GiiI2F76O961sj0BlaMid1XCOh9NcU5HMipaLoXdBbxVrgC+UCIkYZSDjcs8tE0uHFdW0AjIyBbxcmbqtsEZ6qab7T/8YEdsxfIX+TfhveRI0jMFFiHnBxlnbRWiVsN7+fzYL7aV+gGJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723628404; c=relaxed/simple;
	bh=K7a0LCBXq6OZZ3B7ZT3AYD2E1d/U39ngdeL5y8O277s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N0qTz8hrrkPC533uyzBTGr1vQwzOvCMCXGZtRxp+LBAeIOt+VoXeO16dkoLKzLM9666IQlRAt81pDgnQw7ug9mGo84Zfc0hGYLBvWXzAY02tchoy5zv3sOxS9aevD5VdogkIHtRuq5TJNd2XfgUPSlB4BoLxLuigJdRUTKDBLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dukT9She; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42816ca797fso46899085e9.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Aug 2024 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723628401; x=1724233201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JmXmcga/zjb6ahfiHPXOSzwplx1CZRP7/PHn0u7sCk0=;
        b=dukT9SheX7TvEIR5S+jpcr94AZUkvlsmvl3MbErWvJyM5j62080PdspnaMT7pJ9bQx
         9zsL6Kyo7TAuNjYSh7BK6zr1PPAB95Ef3t+SfsKaf5fwxTQdm5uP9DAQsZ8+OllOkYi7
         zzwEaYA9lTxA9ptAbz7QT70RpGCsb0adDacca1843junx1eTYV6frc7BjxfKFM5frd3p
         u6fICjQDefWWZgE+HY6PQay+XcsbpZTtiJeupppd0l7Dg0ix9OTWfmXQkTFh2dL/9WN1
         OOLnaMoLctG8P7XbEBsufkYhgRwQWp/gODwAUxJJDlHMy7Eie752sx+SZ84tV5NAZmNt
         XVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723628401; x=1724233201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmXmcga/zjb6ahfiHPXOSzwplx1CZRP7/PHn0u7sCk0=;
        b=ezrQRDf0rh4et7hbLBU8DlqYh6w968qIw6dqoQeB1VT8dcbbyFf2y6hRxN/zXfp6fC
         8ECtuFFlW7Z/bHrXrYi8cgnk21xowQAJTe6JUs1wZk4cud++TXpcMPWVDEgKoWdpwYVP
         wM71pkHwabZhu2QNvYawWNH0jkuNET4tZIYTDRXeZ8Oezzw+Ud+UjONIWSZ1a76p1fuC
         1haov0rcLbL/7g6YK5/7JOkypV2N3je4VzTD2BGk05KoFZpOYvmvV1kU1v+RBMFpaSLm
         N8fegzzIX0Q/NFxo3NEooLO+zYFNiyQtrhjuCaPg1RO83mXJK5qDWwZCBi19UsdSvZ1a
         VDFg==
X-Forwarded-Encrypted: i=1; AJvYcCXOuyXABc4tq/YW/2eZ9X+eJvYzpYpDHNHlyhvALi5WimS864IF+0RE8tz9xYa8RaiN83SIFyuXjO9Eg5dmrH4l7cyZI2Tm69xK
X-Gm-Message-State: AOJu0YzQKX1wHOzwqW41NXsCDn3mA/KTar403mqytLtFt4Wd6ZgfTvku
	+IrCsU2T9b95kdq0vqBZpPsDYrIZUdYuziO+KvcaexDYgzzy9JQBm3dkG0/BTmU=
X-Google-Smtp-Source: AGHT+IF/bJMKfHmeWBSdbtMjSNM/VzBYMVOeE4F12fOKUYhXLXD2wvGqLv30n/W4um8EnKsh44iMBg==
X-Received: by 2002:a05:600c:3c96:b0:426:6eae:6596 with SMTP id 5b1f17b1804b1-429dd264983mr13645925e9.25.1723628400773;
        Wed, 14 Aug 2024 02:40:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded28cdasm14195615e9.16.2024.08.14.02.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 02:40:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] usb: dwc3: st: fix probed platform device ref count on probe error path
Date: Wed, 14 Aug 2024 11:39:56 +0200
Message-ID: <20240814093957.37940-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function never performs any paltform device allocation, thus
error path "undo_platform_dev_alloc" is entirely bogus.  It drops the
reference count from the platform device being probed.  If error path is
triggered, this will lead to unbalanced device reference counts and
premature release of device resources, thus possible use-after-free when
releasing remaining devm-managed resources.

Fixes: f83fca0707c6 ("usb: dwc3: add ST dwc3 glue layer to manage dwc3 HC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-st.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 211360eee95a..a9cb04043f08 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -219,10 +219,8 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	dwc3_data->regmap = regmap;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "syscfg-reg");
-	if (!res) {
-		ret = -ENXIO;
-		goto undo_platform_dev_alloc;
-	}
+	if (!res)
+		return -ENXIO;
 
 	dwc3_data->syscfg_reg_off = res->start;
 
@@ -233,8 +231,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 		devm_reset_control_get_exclusive(dev, "powerdown");
 	if (IS_ERR(dwc3_data->rstc_pwrdn)) {
 		dev_err(&pdev->dev, "could not get power controller\n");
-		ret = PTR_ERR(dwc3_data->rstc_pwrdn);
-		goto undo_platform_dev_alloc;
+		return PTR_ERR(dwc3_data->rstc_pwrdn);
 	}
 
 	/* Manage PowerDown */
@@ -300,8 +297,6 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	reset_control_assert(dwc3_data->rstc_rst);
 undo_powerdown:
 	reset_control_assert(dwc3_data->rstc_pwrdn);
-undo_platform_dev_alloc:
-	platform_device_put(pdev);
 	return ret;
 }
 
-- 
2.43.0


