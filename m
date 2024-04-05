Return-Path: <linux-usb+bounces-8983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F2D89A3E9
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 20:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518BB1F24116
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 18:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A774171E78;
	Fri,  5 Apr 2024 18:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hpPBNxoi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54171171E40
	for <linux-usb@vger.kernel.org>; Fri,  5 Apr 2024 18:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712340695; cv=none; b=XlZlI9AD3K93gu7xVoAxjY5KJWB0u/q6Ocp5ZKJBfQph2UcOKw6VSkLHsWkZyi4WBbleC+744IHtXmzaoqDAYmBGnLM5ezCBe0tmcJwWke/Xw1v3im9eTfsB0yDbn2tA9TgCSHP7iQFMdVKyVRl/o7uGlNpQR3D2PsgFr3MkLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712340695; c=relaxed/simple;
	bh=Q67+S6V3QHztyCWOwIh90pzBvONFSy99V7/W4B38ll0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sC6AH0HphlQ90bSHx93fo6RUvNat3hMRI0J+kPlsbNcZ+fNZB7VewJUS+NfJXLr4EsRu444EZQ5LkvQ7I6UceEnOks3n+O/7ciQomkn9Bm8yVVxXabC90wU+NtJGKSA0yJYJxpOkI+MAA3zee/Ce6bRuwbdnPPkbPQW3yaxHDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hpPBNxoi; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d874250869so1985431fa.3
        for <linux-usb@vger.kernel.org>; Fri, 05 Apr 2024 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712340691; x=1712945491; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0UhNzRDaaLZJMtJI0V+d0B1HY2nx2ORlnj45fvhY3M=;
        b=hpPBNxoizPoNxhr+o6Ol1XjAMwbXkZXBCQc5E/gzqUOMlRTg8fTIvsuY/zPSgKKRXk
         pNY0m5Pv4o8igbR4U/XdvcqEwoa+OXAmmo/WLXQL3nCPNZNq7CfOOp4jBXlhL7SG3+7K
         OqH7gFjW85Pjau+8YLw48ZKuCHl6mTOsNVdww+EiNrVL5OB9zz18T7Hmx6E53UF4WQYv
         20P3TjqkyVomXHEN4dqJ2xeWXKBfulqdijCvvusVJXOdIOLYMJkphOhUnqtfxoY2ahtL
         0os+3yFAQI+iljJfxv+8DTnwQgnDC3sKBOV7owjGFfOoeCqcOQwNwCY2yxgTOQwbqA9k
         Nz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712340691; x=1712945491;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0UhNzRDaaLZJMtJI0V+d0B1HY2nx2ORlnj45fvhY3M=;
        b=ba/Q5N8VvOnoFsnPE66tlJu2QP0x3Wq6fxP74NGcY6S0shfVn0N2EwwjRGrnPillPq
         HZtHDU+62nbF2pucnZuMq+GVMGJ4Acu8Qn/fcc/75DgMdRMfdnSmSTt7tXULBfrSFvHc
         aJFMBEhQfmnmXFnr2li2IOQ/pUBeWGDICHXbqIas2gtpBYnHIJ5XaDfDIUR+LxzDYMKK
         1fcMn/sdV9Eg4sJFuJyIMrC0pJNrQ8Un0RE9x1gckEH4WBTAk2gxNgrXhuBhGiKCUWns
         g252A0WxzB33MRv8l8n3ii/SUHKCsQoEvDf0VjB9WjRByPJckMpq4i8/9vVTER5hJkNX
         Rzxg==
X-Forwarded-Encrypted: i=1; AJvYcCXjMkRnCj1ob9fUcuUdCEcogVc66KyJbAttSIjMA/uYP9mGWX2eOzoaUHSaRFlh7UHt8u2Lo/GXlW5JwlXCj9O2OJkvtlHNay7G
X-Gm-Message-State: AOJu0Yy920gk7o0Cj1fNyrAIVprfxLuAEujgFsYHUROJais1vaiPcERK
	5VPQUlMJ8naUdFzQxT+NDPaMkmSm9toC/tLGrkh/mppJ4hCwKv34ppck+NA1Ydo=
X-Google-Smtp-Source: AGHT+IGzTSVhyURcwPUC+RUG2PdoKx93zSHkbv/W8wopB2ayFn1AT8brWggoRJM61C73cKtKDO/sdw==
X-Received: by 2002:ac2:560a:0:b0:515:a8c9:6ec4 with SMTP id v10-20020ac2560a000000b00515a8c96ec4mr1579335lfd.42.1712340691309;
        Fri, 05 Apr 2024 11:11:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d19-20020ac25453000000b00516c580b640sm254387lfn.13.2024.04.05.11.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 11:11:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 05 Apr 2024 21:11:30 +0300
Subject: [PATCH] usb: typec: qcom-pmic-typec: split HPD bridge alloc and
 registration
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org>
X-B4-Tracking: v=1; b=H4sIANE+EGYC/x3MQQqDQAxA0atI1g3EMAXtVaSLNpPWgNo4M5SKe
 HeHLt/i/x2yJtMMt2aHpF/L9lkq2ksDMj6Wt6LFamDiQIGuuAr6bIJlcxUcPWL2yQoydxSY2p7
 4CbX2pC/7/c/D/ThO7ki9UGkAAAA=
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q67+S6V3QHztyCWOwIh90pzBvONFSy99V7/W4B38ll0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmED7SqcNNLHSudEvUbG6dnxGcnQs9/bVZtDJlL
 KiAi9anaTKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhA+0gAKCRCLPIo+Aiko
 1fwjCACEkmWtqqAt2NCd4c1cEGh4vQpwrpTZuocaOfLHk3golMIxsiaoxIdwR8B76LcU2hrLDv/
 /gcKINvWRyVruDgMSB0EYzeA4wJZXoX5Tqc+Z4OFpVsS/74dVVSFZsMgVLkVNoKCvwRVNCG8ruL
 yPuDfFiOIOYMx2YCDa64uk6VMJUeKD2xuOLpNzOaoLGAdh2uvR4pKRMkshZJuFZ+jlEsMB7nCoh
 JPACJyiYfUKPq1QIODlWyk0JOSs1v3MKczcMkoBHPGBjxLj7jJjqzqS4i3yIy2e7JeOSYhO5Xs6
 Jx4ZGkN1xeYx4xDNSIuY2Us0Fg/6jStsGcaKo+Xp+RNHB5zI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If a probe function returns -EPROBE_DEFER after creating another device
there is a change of ening up in a probe deferral loop, (see commit
fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER").

In order to prevent such probe-defer loops caused by qcom-pmic-typec
driver, use the API added by Johan Hoval and move HPD bridge
registeration to the end of the probe function.

Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index e48412cdcb0f..96b41efae318 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -41,7 +41,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct pmic_typec_resources *res;
 	struct regmap *regmap;
-	struct device *bridge_dev;
+	struct auxiliary_device *bridge_dev;
 	u32 base;
 	int ret;
 
@@ -92,7 +92,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (!tcpm->tcpc.fwnode)
 		return -EINVAL;
 
-	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
+	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
 	if (IS_ERR(bridge_dev))
 		return PTR_ERR(bridge_dev);
 
@@ -110,6 +110,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	if (ret)
 		goto fwnode_remove;
 
+	ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
+	if (ret)
+		goto fwnode_remove;
+
 	return 0;
 
 fwnode_remove:

---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240405-qc-pmic-typec-hpd-split-22804201902b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


