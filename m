Return-Path: <linux-usb+bounces-8645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BA89139F
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B969C287B64
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 06:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3695B4AEFE;
	Fri, 29 Mar 2024 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7iQNn8S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868784B5DA
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692952; cv=none; b=Linvq+BNt5j6vTrqgdkiHi/i0ERrfZWqhPk3JGje3B+/z2oxrovw6oZlgzSwhXTJoWbz1TkES3lR7Sm/2qajOjrIPKk8AcanA+H2F2MBe/szZH7hctX53m35eWfzo0iY5XhypC80hssXuwIp9cT3WsjDAjqF/ED3m60lMKxuQZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692952; c=relaxed/simple;
	bh=PIpCaKz646kYps9WO7oi+imJxxIB2fUbNCrT9mXhSWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XEt3yaEdu1rFq99AKZdoQcJyVeYwJM0t9jpz2mI+rAbYNlKN0w8dOhyqRnwn0xUpVQm3wIuoXpANKUQUPnNDdXtMbrOk19Z8dQcAB+H+Ap/5xpQhM2XQZVcnXWONi2bBJJvjq0Yvs++KJ2DlKuChMfqjV9m3eIVwRT4tDSimu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7iQNn8S; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-513d247e3c4so1653218e87.0
        for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692948; x=1712297748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dl25DokgNVTYbVKPM8M20YH/KVy/slLgz9YOOtJtXcU=;
        b=U7iQNn8SryoWQON/K3QhlUswYPVj4fUE4JjJjx9cXnXu+/S1t1dKExyLliOpIMzvFi
         Os6w+opV6L3XDTSflvcxlb7XPqmeZxX5xegjGpF94NYI46tAEfq50kuO0T78+X2yxZk5
         7sb9Lc+jEc7UwNLCs7pO8VnHy/UI/elodOgAKAafTFFCcRDuvplxN6u6k/fBKxCXA8Z0
         oQaKcQqRiJBQ0KJtlQYa/mkO4FrZf5BaE8UNP3zxxPdA4UGU4N4RDmeHH6NCz0zLdSkr
         Mf7L7UIIXMBrFHcy+ywKNSi8UJJ6Yfpcez/q89c/W2TDctcuYx009NxzDAz2WIThsmzU
         DgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692948; x=1712297748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl25DokgNVTYbVKPM8M20YH/KVy/slLgz9YOOtJtXcU=;
        b=YA7IADoesz1qEI7StaCCpj6PYPxlmZxD4sbx0C8kykUneXc+VGwtPJsJ+3N8iEYDG9
         /WNibC+kHOm11iGIAMuY9UjV/0blLZXZuYyoCD63fKf569iu/buoMsgx9TzeBmc+fST0
         tfE9VC01ccNvZsQZFvo1aR3ooDyrsp4Bta/mhBWuldlKBPcqADRYn8Cc7MDpzJGSkZ99
         uL4I3A5lhPoTjcerjjOKfENkUvVRuQoMI/wmWv6GMiSPznrb6DYMhRULWlc7KjM5Zokx
         ZqV99XtFsNY0szd4k9QtNCT/uUeWpo1+najUZHymE5/LOivtqZTlw+j+Ynmr1ghWbvzG
         S7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh2eMiI2De8Wpm6HZtpSTjZ4td5jOsYXF6TxIMy4V4H6cl2WKLLZiBDYM+OICaC6xKEXMrIaA7eBLlEovX3xfJ5P2tRo/eRnya
X-Gm-Message-State: AOJu0Yy14Wlx9pX22ezR3BlRjUNA7EOIq+hQdz/8GFUXy/fYeCvfHfnk
	nyU65m9ibk+hZu3gMa764R9nFnS8DNrAxjFrFaKTE36pnJ+WhDBFz/4zIPt1w8c=
X-Google-Smtp-Source: AGHT+IGhL1McFwjL5PEzzP3t8HVBwUYFSjxZG4tgE8H9ubN7PvPYahZXnCEbdZggroVmo+yA+xgOQg==
X-Received: by 2002:a19:641c:0:b0:513:dbcd:7b8e with SMTP id y28-20020a19641c000000b00513dbcd7b8emr1584308lfb.24.1711692948717;
        Thu, 28 Mar 2024 23:15:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:41 +0200
Subject: [PATCH v2 09/11] usb: typec: ucsi_glink: enable the
 UCSI_DELAY_DEVICE_PDOS quirk
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-9-0f5d37ed04db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PIpCaKz646kYps9WO7oi+imJxxIB2fUbNCrT9mXhSWI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyMGvKaZxzfltl87OzQ0Ia7nmC/reuVwNOYk
 MQPWauJ+M6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjAAKCRCLPIo+Aiko
 1Qp2B/9ts/dQ2RTSr+K2Hf1YAd8TtYXEsL9cZC4b/xta7NvE/N3yGQbFWh18E8UP/dF0MfeIeTB
 mdPSr1TRgtEF6T1U8Ga8fRjgRy8wILqxC8cvEpurB7Cc2/1fOxXCVfogRyu/Gq/kIN+OcfCSgEN
 fr8s1O3kl/E1u0XKfIrcKgCrSijq7jvACIcSazpO/mTjJ7qi1KCTSfxShm0C4ktOqoUWJReJjib
 Cr7UMleJ3ZM7vY0gXV1sBmz/E6B6i8G3+fWRcNvdvbbCxUtG+fO+h9VDsOMSoMvHCYmtkj8g0ET
 iu+XhV2o99TCIkKV+EM2dZdsMjErbs8KWJIP8jjVYdb9f/HP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the UCSI_DELAY_DEVICE_PDOS quirk on anything past sc8180x /
sm8350.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index d7a18950faab..bd5ad1898a4a 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -298,13 +298,16 @@ static void pmic_glink_ucsi_destroy(void *data)
 }
 
 static unsigned long quirk_sc8180x = UCSI_NO_PARTNER_PDOS;
+static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_PDOS;
+static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
 
 static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
 	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
-	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
-	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sc8180x, },
+	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
+	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sc8280xp, },
 	{}
 };
 

-- 
2.39.2


