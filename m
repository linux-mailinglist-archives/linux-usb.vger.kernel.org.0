Return-Path: <linux-usb+bounces-8646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E28913A2
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB61B2882AA
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502E44368;
	Fri, 29 Mar 2024 06:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjzz6fHQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DF94F1FE
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692953; cv=none; b=gFzxsVOCs3BGIXNNzti1TfUqzEk/8ecYXbChOboinfPjY/sxrV7vb4a+PGi0W5l6udwJrfvJfPYuv1SgUuSGzMoyvsXknJLBJU8pPp5YfDTfUh9+iOguqB2pPtjhhohUOi/VcU5BexCcCNOHlqODJQaiLUatEKmPFWtUEoztr0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692953; c=relaxed/simple;
	bh=FNeZFewSvhBuxQ3csqXQFOnbclapSSlOktRlQsrIAHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+6gVLzMiBlPFHJP3V2c12GkwVWxC1kRKwBlo24Ku+D0u6LfRR66U1swbOigoMvxry5ORwvpSpzWUoc/xywSnhCXpXjK3Mj184GSUBXp6EUsF2ldVrCgzQ6gWM/iZbd525qWlp7tTvJSmzab9GrkJtYPEZN56FKn/RkXABsOd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjzz6fHQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d094bc2244so18335671fa.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692950; x=1712297750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEJihiEeWvLfK57ti4sg0AX62I32E+gTiiYv2sVj33U=;
        b=xjzz6fHQCuh/dAoUt+DbxL68pbi+rg6CErP/r0xPzEVdT9z5lmpxoVxqCt03nBK0cy
         CvjmP1rNQkrl1hVM+lZLg1aWoKrdImH+Xmtfl+j+NrPhJ2ssIkq/uYJ/leYGGjXWm70X
         VKutAwK21xyw/AbXq7sGpLB4mATEvwI8pj7C34yoUiYBVJMUV2p66WN13/h5QFczV/Az
         oMFFW/c0RMlPoKVcQLZcmlWD+nRbkWR4Nc0KdwzLnnHFniymVlAQv18o/gfM6fOvuOla
         X7ntd35FGpKH6VXxCRHKtFGNQeXi8xFK56tmjjyvpyCz755Z+3Twy9gjscS9JDhsI8ot
         TF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692950; x=1712297750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEJihiEeWvLfK57ti4sg0AX62I32E+gTiiYv2sVj33U=;
        b=YJ/fPMZKACaaNnq1eQ1sQ5k8c9RXZ4cPDv3qjikZ1aVMmbfUdp+SC626x536XTOpwX
         i0qxhbjMxA9u3LWy0MOEL3RLiq2yegci7zNxI9HDQkSf0kzYlpfyVY+aOGsutxQnKYyD
         4SDt4Re8ZfLIaEDuwMC7qMTUSpJv2QdH61Jrnv6JQ3BJjyxha+GBbx5+L9BV3pB9M8ON
         faqtzGBdhK3gz4zC48h8DTXIHIbg7Wj5yaNadLAFA/Gt/ulu4ssDiMtpUft7lmpAc0Wm
         nYgfoJvmFsQNtwDHrFgUOkq143moFlUXyLJPeCfUNdBeRj/IntRarYYHV491gGXaw5T+
         mClg==
X-Forwarded-Encrypted: i=1; AJvYcCXi2wTZjXODecKwLCwVr4lVoWcECLRj0YkhKqCk4jBkioOowizy+ND8TEJ02hTcHiXL2Hcpk7pVS8I6oZELSIHgUX8YrqZ4GPju
X-Gm-Message-State: AOJu0YxwfB4HE0Z/+m0dQnSpFGPAa+ntKJMjSeMtRm7L6wHlDhsKO2gk
	uJfghbIPaQXmqiRpAPukJVjUHOg8yLEarCeIXnoGsYeSpdHB8EXaTJwOgTqFiYk=
X-Google-Smtp-Source: AGHT+IGGHKJDbeJ+KDR74ze9xUn1QQ2t9J+gNQvHakqGHDuXL08XBt38JlXNIIW1R3H4pdpMsPIKYg==
X-Received: by 2002:a2e:800a:0:b0:2d6:c0d5:b96e with SMTP id j10-20020a2e800a000000b002d6c0d5b96emr653911ljg.24.1711692949955;
        Thu, 28 Mar 2024 23:15:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:43 +0200
Subject: [PATCH v2 11/11] soc: qcom: pmic_glink: enable UCSI on sc8180x
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-11-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FNeZFewSvhBuxQ3csqXQFOnbclapSSlOktRlQsrIAHc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyNmGIBuVhU4gfN28LpZjdh7YgctgnqxE1E0
 KsohJsxZoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjQAKCRCLPIo+Aiko
 1SOwCACbroRYofwqqtJBc4WH7gWH+m6z605qzhkOa3DeXh9HM2Y7QoayQt36RhIldcY9tA+yjYW
 ZyYh4rtfY6YqQzm1G8Wcyo8SMOIwNs0uUTxM0Npyrvyi9+omUIWt/K8Lt4lYvwzVVQpix7u8VfT
 tcwhZxzRJ5Ez6ITnLte5q1ADP7F2rwmzD1CxKa5HrNklEUsHa8E3iTBAqsgG2mpJTy7OFQLvbR6
 hMSb2WpbFeWWJqGrAkyKp8fjEE6suhFaurGdtWNm1bOLcs25NA07dopiX6mGXRcECzf/v1O/MVp
 lS9ErAZLf3lDayifUsYiE/CJ+su1Nop6pNqgv2WHwf2c1uBR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as all UCSI issues have been fixed, enable UCSI subdevice on the
Qualcomm SC8180X platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index e5a591733a0f..c2f71d393bbb 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -334,15 +334,11 @@ static void pmic_glink_remove(struct platform_device *pdev)
 	mutex_unlock(&__pmic_glink_lock);
 }
 
-static const unsigned long pmic_glink_sc8180x_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-							    BIT(PMIC_GLINK_CLIENT_ALTMODE);
-
 static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
 							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };

-- 
2.39.2


