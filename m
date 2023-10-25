Return-Path: <linux-usb+bounces-2171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965257D6A85
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 13:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C74FC1C20C99
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 11:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDAD27739;
	Wed, 25 Oct 2023 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wywRBGAY"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EA12771D
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 11:56:26 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17B3B136
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 04:56:25 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507cee17b00so8194698e87.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 04:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698234983; x=1698839783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwKoRn1S3grUkj3T+P+0SLhXPECqB0f/S2wVYwKKKrw=;
        b=wywRBGAYCTFOg1YlDFolwLM4oiq53GZoYqfbmC6JTndmc7K36s/sVcAjFgLEhnrmqY
         WAA8Lp0uU86eskDBuFP9XoEsGF6VXLwQyoDioQEnaIlG/PARMV52HDTCEsdJbIrvI5QN
         XNk1fuN597rURYuO3qRYNYs2bxcm5Y37lXnNTkep8/7RjuoSv4ysgccqpf2yVqzLsgTG
         ZAcUnM4WTB43Arndw550xm4GJ8bZxr+VSnhFaaM4114LJCmV4xwDur8f/5CnruTYIuo2
         HYI3pq02Q1ban+qt2wyGV21bRW26gzEOxi04ccPUN2VGYHYkzsxW1+5jF/lgEZTcNg3/
         jqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698234983; x=1698839783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwKoRn1S3grUkj3T+P+0SLhXPECqB0f/S2wVYwKKKrw=;
        b=hUm1QBHAnfE+24kXhCKOPBj2OzzKRZluK//HNThsNx0YK1ZUu/hVcLlsELNm+oxH7X
         M9KHodOTGbzgX4rigqsKvV8f1+WkOUFTjjbI0OnuvG6eaBDzo06KHZMhD3fLuCN2Ern2
         YA5PDrhPYq544vDDOYlxj8y+f2ByuH7bUKrYXWTuSEQP0r/C4MpVLvSJcpv/AbCXax2R
         07lQRQosUOHsFMILWfKKui3DqBhDMB+LGkER+Yfa9H2BNrbFiUegvoeknCmdtx6uEwt1
         bg/BSWOtMwxydAcrEgdzjKeR8Q3wRWBeB/AhbEgD8R2EKi4OEg7ZLmoTTKmJ8reQ/ssA
         KbFw==
X-Gm-Message-State: AOJu0YwO37QjKGcKR50ty77u41zH463dUCLXrj4vM6gzKcSut+hqfVjb
	G6UlqY2CZHCNyAk3ETGUT91iUg==
X-Google-Smtp-Source: AGHT+IHVl0hvJGVOtsM48MxwtP1bLdahgW8rvBkoJexq6T0r5k2WH0HRFRiy+gmOHZV2HATZeoH86g==
X-Received: by 2002:a05:6512:3d23:b0:508:1227:5a0f with SMTP id d35-20020a0565123d2300b0050812275a0fmr2575756lfv.65.1698234983371;
        Wed, 25 Oct 2023 04:56:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 22-20020ac25f56000000b004fde41a2059sm2511751lfz.305.2023.10.25.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:56:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: pmic_glink: enable UCSI by default
Date: Wed, 25 Oct 2023 14:49:30 +0300
Message-ID: <20231025115620.905538-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now as the issue with the UCSI_GET_PDOS is worked around, enable UCSI
support for all PMIC_GLINK platforms except Qualcomm SC8180X. The
mentioned SoC has slightly different UCSI implementation, which I would
like be tested properly before enabling it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 914057331afd..71d8901a9389 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -18,9 +18,6 @@ enum {
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
-#define PMIC_GLINK_CLIENT_DEFAULT	(BIT(PMIC_GLINK_CLIENT_BATT) |	\
-					 BIT(PMIC_GLINK_CLIENT_ALTMODE))
-
 struct pmic_glink {
 	struct device *dev;
 	struct pdr_handle *pdr;
@@ -263,10 +260,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	mutex_init(&pg->state_lock);
 
 	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
-	if (match_data)
-		pg->client_mask = *match_data;
-	else
-		pg->client_mask = PMIC_GLINK_CLIENT_DEFAULT;
+	if (!match_data)
+		return -EINVAL;
+
+	pg->client_mask = *match_data;
 
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
@@ -336,14 +333,16 @@ static void pmic_glink_remove(struct platform_device *pdev)
 	mutex_unlock(&__pmic_glink_lock);
 }
 
+static const unsigned long pmic_glink_sc8180x_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+							    BIT(PMIC_GLINK_CLIENT_ALTMODE);
+
 static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
 							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,sm8450-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
-	{ .compatible = "qcom,sm8550-pmic-glink", .data = &pmic_glink_sm8450_client_mask },
-	{ .compatible = "qcom,pmic-glink" },
+	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
+	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };
 MODULE_DEVICE_TABLE(of, pmic_glink_of_match);
-- 
2.42.0


