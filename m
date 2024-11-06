Return-Path: <linux-usb+bounces-17233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFED9BF20B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 16:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B99F31F2398B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29B120606F;
	Wed,  6 Nov 2024 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCGNRA2z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A042022EC
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730907972; cv=none; b=MbE8kfWHbBHRCrcXRNgij7hlsMw1J8ekeVTS2gITmaEXFj9IV1tiejWXjkztdGXR+nXV8d3Eng3XalAC+f9eQCYqTZ3OqWytuCOScQDUVORxf1NJrcqeu0kc9O5GF0tunYRLD6jDEYdEST6CwQFmdx/BqZOR2b4+cj7MZLsSbcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730907972; c=relaxed/simple;
	bh=M8HPZh1+/AbA2gNG9MKXsspTiP4s86OPzcBOT20Yh4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiL2+v4uEuyWOByN6PnAQzSuLyltZ6RX/0VJzTOI1+FbIc2mB/5WdP2LWsfCeg8Qg0yXY/E4KeLO8hT4QIJWdRy/X5Y3OLCS2GlM5o0RwBATuLThUGBbK0emkPj/cwfAuud/3JymM4UL0X+4tsPy69tbO68TTYeqpiHcDM/hOOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCGNRA2z; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53a007743e7so7622634e87.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2024 07:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730907969; x=1731512769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NZe3BHus0cCe7ERcHLwvghPFG3p54ztVsTlGG+rY9g=;
        b=mCGNRA2zET9WdbC5yjoY0YzgFRaYWsOjsRo4fFz0Kg0lKS+CJK+EMYORvT97R46hY6
         VolWSeNxXPT/8CdNZQmwWx5QaPCSahgk1FwUejFvyh869SW1O+UKOcx84yR2Iuh422X4
         eoUihzoMkR7QLarilPiqYQoGyuLgmEDUtlqHVJCUK6CHo9n8vK1EHcq6aIY3cj4wOusC
         msM9Q3qXnJqsYFeiHoKVtB+Z1dxI94AsXeAI7SpS4zBajIFNSbadHReXElonUMujKiEB
         GAlfx4hGTlwkP67WqHCQ4aYnwi5tg59CvzcKh1qGmtEKruzkaeN8DpJ+RgY/7RzPySP6
         gDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730907969; x=1731512769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NZe3BHus0cCe7ERcHLwvghPFG3p54ztVsTlGG+rY9g=;
        b=rU0wJIYLfdZdacNjVncg/C5Oi8WT+sm0iViwYK8cEbovXUh0yE2EAb1R2YXFE5LICV
         f08Qrel9hkqqgsb4XKztuTMAoKcGx34wwne0eWx+PhgrdSyLBdTR5ZuJGvnqiLoSbiMC
         ogcljJ+BRruK7ofw4D4Ser9uAjCDB6V03+Sd6DuYnKadfkEPtrId6DwlvYMm726vBjtM
         E3b8EG3tEVl1SZbfTGrXLduJ9HY8y4gV7gpj0guwMZ2/rT8Xad7Jsw8ZbnRbS7oav+ZJ
         ugkgqeV2u62FPJsjpuNdxgqkF0qIKaoQDdjpAv6ET0RRkXE3erTTuPHg8c+XSZPdr27+
         v8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWPZ/m8IIec6Onc5zfzH4cDErCffULrCmBcxqO3732Mcq53uBHGADPUbis/aniSf5Z5vYA5wRYkyMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjbc+ZBmPPLh9fvQwcu8xieB1u5V+Hkdx6p4ehxfkVd6NZMDda
	pkVeGMFiynRpQhenCL6BD1IMc95tathFY0Y0BT5gQhPFf/Uoy0L+8HjSNBKyrbc=
X-Google-Smtp-Source: AGHT+IE/ZB8rXBTy5Tnq85t9AV9uUbYdWY3aKtN/NNUgIGMzLSYfsl9Ge+5uZeb3gK8oFYzvOuDRKA==
X-Received: by 2002:a05:6512:b94:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53c79e8ec22mr13131356e87.45.1730907968784;
        Wed, 06 Nov 2024 07:46:08 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9598dsm2536626e87.22.2024.11.06.07.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 07:46:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 06 Nov 2024 17:45:55 +0200
Subject: [PATCH 2/2] usb: typec: ucsi: glink: be more precise on
 orientation-aware ports
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241106-ucsi-glue-fixes-v1-2-d0183d78c522@linaro.org>
References: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
In-Reply-To: <20241106-ucsi-glue-fixes-v1-0-d0183d78c522@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogeurs@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=M8HPZh1+/AbA2gNG9MKXsspTiP4s86OPzcBOT20Yh4g=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p2v03nsbQr4ZviVwXbSvWsYLguVH9CcYsAh7j+THuXg
 9NY2CZ2MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiQRs4GPobs85q/eI+9Mz9
 nvPjTy5pr9zlYyWd59/ZFHn9Ob/p+latViFhcdMrYmpVfnrnDr2WqgjYeO61kEul5N69JnufzY9
 KObx73b/VRt9c+WbfebxfS1vkqJIum+hZJ+u1Lv6HLif/zrjQbsP8Q09It+C27fMXBhdqeSWt57
 RnsplOjeQ5z5xZrhNkeK950fwgU79TlTM5yxwW2V/gX5f/MnLl/lfyYh/6FfmEH8xxmbWSkYvlv
 crheQt1Fju53Kr1Zmi88P6Xa1KNX5N5NB+L35NttS73pOMz2ZvfhW2TvJq24Bn3cxPu/pqlG94I
 2jBXKu1dOjUwaqFPyWnGyxLX2DYkPzfidmZf5hHze9Z9AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of checking if any of the USB-C ports have orientation GPIO and
thus is orientation-aware, check for the GPIO for the port being
registered.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 2e12758000a7d2d62f6e0b273cb29eafa631122c..90948cd6d2972402465a2adaba3e1ed055cf0cfa 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -172,12 +172,12 @@ static int pmic_glink_ucsi_async_control(struct ucsi *__ucsi, u64 command)
 static void pmic_glink_ucsi_update_connector(struct ucsi_connector *con)
 {
 	struct pmic_glink_ucsi *ucsi = ucsi_get_drvdata(con->ucsi);
-	int i;
 
-	for (i = 0; i < PMIC_GLINK_MAX_PORTS; i++) {
-		if (ucsi->port_orientation[i])
-			con->typec_cap.orientation_aware = true;
-	}
+	if (con->num > PMIC_GLINK_MAX_PORTS ||
+	    !ucsi->port_orientation[con->num - 1])
+		return;
+
+	con->typec_cap.orientation_aware = true;
 }
 
 static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)

-- 
2.39.5


