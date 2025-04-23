Return-Path: <linux-usb+bounces-23363-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2941CA98383
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 10:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B7E71B609EE
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 08:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B051528A1CD;
	Wed, 23 Apr 2025 08:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4NijQWT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75287289342
	for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 08:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396642; cv=none; b=EZ+HTvITJc8W5WxcjUUvry3qbjm9mW2Af08xckrloQAKQHkjRg/QuqnkdTZMgv5EoUQETrRq+pSRKmuWvVnD8ahi9FEkOFbA9kmH04TipYS3npS3adb7Cv0jgOOwdoSrdzDcwViIDS3qDKHIlwFkcSlc7b/Fpy3RG6Co1groyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396642; c=relaxed/simple;
	bh=9AoM/AIPb3N4elSC5sH2DHMkFgmxak1AJlaKm7usVmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DWwfr+GOh8aZCuJsRmr0dwmhO2xR30+k7qzoYXVnPqZb919i+EkkQ/N22yBcN2FUsey3KV6pG527FS5GFH20KYlZXmBzrl0YarhFp/4R/KNhF6CXCu27T9TZBThhF9DTRDA1aRRsfUd5IeFI/4D76yxDWDIjaB6eg08q87RUczI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4NijQWT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so53003745e9.3
        for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 01:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396638; x=1746001438; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y01SW2UsKHrmSkBJiFRdXdGr5Bt5eDkwEO8sgbkacPw=;
        b=j4NijQWT3Gg1tDJocMoFEem4SPvLpQNMi3fnLglvwIhwRm06Ip/qae0ZxWvzzh55Gh
         EhYRxQzZj90KqHQ4+Ae07w+kCu0BAZEj4+VdXZg35PXNGRzV3miI6t6OIRWnbU+bQkJR
         ABNtMCpXYSdB6g1bEQdzWBJTbSXW0Q+xtlxCSDaegFVTC+d6rN6N3xopJEBu25/7tveI
         UMfl4ksJpz5FTbqR9+UfCqTlGh4Oey1A8XHo5/EwBCV3XJ8gLgYwvS0mRs6OfWJUZJei
         TdfG8elIZnZswCnnVM0OCBXUrxPZCwnLHWHFO8qdoJ+Oe0CqXcMi8tYdW8luSz5OLmSK
         vhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396638; x=1746001438;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y01SW2UsKHrmSkBJiFRdXdGr5Bt5eDkwEO8sgbkacPw=;
        b=nPHv8RSjUt94oBD4H42i3tb6/uYpuU63iOIns68jIeqQ70gd/CiBXu7PGDJO5ep8lu
         iOWZWAIBIUbNiLrBeIPDSkGLTew9neA92lhpCmTdz8/Zf4qXsrLmzHPQts6fjpofw/88
         ysgaDGMLyukcRAf3eEnT+zKQCJIM6zBiOQn41DKA5kftREgz3kWsGbhoMoXtZBeg2MDQ
         7YInbTvm2wKZ06MQXDrG4Kt/AnMR0WHWqCUlJ/44hMHtimL0XIStkGz7ZX8iN5eW9/J0
         7dwFafKk8KFeBNOX8sxZvlerhCNIMhoRKDxx+MJiWxh9IbLXNTjtfBmLMwzqV8dTL4tJ
         ywYw==
X-Forwarded-Encrypted: i=1; AJvYcCVUyNt0+3K/n58OAB7Z1uFsjjjfJAzZLKxO71URDp3B2h414PKLsC+v5NNO1KXVBAd+qMQ5mm9wZ1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTSmyleyEuwEqaq5CF+AiAudfjGy9R5KmziP3Y++UVLSUq7NwC
	RnRk9vDYQOjD4ufhLgomVixbiHTRtFiVH/7kn82o2TGA6TDkHcBwvMbquspXRA4=
X-Gm-Gg: ASbGnct7X2+7DVnBPoJBB1Itkykg2c3oTvsAkvhHJ4Ti36m9B90D5sEJpFR3Mn5+TDW
	f9cpgIEgTcZkoe7fUbBr24VETAr+dm8pS6ckFSrhsz1NRV0Nm6dkRkCEURoPxt4bT68jeEpvo7z
	ZvfwvdgxCGK13QJN7fYuvde03d1ssiqRROopKGVDmdrtbhh1VB9zhQPcGyVqzCfe+afs/3YWkId
	STPLDizixwqGaCl+aVqOqiQKhZc1Mn8Jgwjy2NqHE09848kls7hUuknJXpnQgomOiCyWMtVbDj6
	5Mh5JVv/vSjcE8LzEvRJg+31ly4wdW2JdUA8T0WSSw+E7Wlc6eJ3PObT
X-Google-Smtp-Source: AGHT+IECPr27/stUCSI1PWk+UsjbUIKYWkA1fnIwKTwVRmawMohMG5diVeFjOVyCEZb5VbXMG1aMDA==
X-Received: by 2002:a05:600c:4e52:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-4408efbaebemr33514505e9.26.1745396637683;
        Wed, 23 Apr 2025 01:23:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092b0a52asm17463555e9.0.2025.04.23.01.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:23:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:23:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] usb: dwc3: qcom: Fix error handling in probe
Message-ID: <aAijmfAph0FlTqg6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two issues:
1) Return -EINVAL if platform_get_resource() fails.  Don't return
   success.
2) The devm_ioremap() function doesn't return error pointers, it returns
   NULL.  Update the check.

Fixes: 1881a32fe14d ("usb: dwc3: qcom: Transition to flattened model")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d512002e1e88..b63fcaf823aa 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -740,15 +740,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	}
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
+	if (!r) {
+		ret = -EINVAL;
 		goto clk_disable;
+	}
 	res = *r;
 	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
 
 	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
-	if (IS_ERR(qcom->qscratch_base)) {
-		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);
-		ret = PTR_ERR(qcom->qscratch_base);
+	if (!qcom->qscratch_base) {
+		dev_err(dev, "failed to map qscratch region\n");
+		ret = -ENOMEM;
 		goto clk_disable;
 	}
 
-- 
2.47.2


