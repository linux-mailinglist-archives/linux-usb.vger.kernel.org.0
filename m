Return-Path: <linux-usb+bounces-2092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557A7D41F9
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 23:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5963E2816D1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 21:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B8022F14;
	Mon, 23 Oct 2023 21:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZoSqPyd"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EFF22F16
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 21:53:35 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360AAD79
	for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:53:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5079f9675c6so6004766e87.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Oct 2023 14:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698098012; x=1698702812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN2sLOa9xwGM67Rq52+5iCupQnqxlWnolzeyMPzN3QU=;
        b=ZZoSqPyd550fbXScvbW2Lf0ybFwCJUOvz73JJd+k1Lw5NiApZF0Oom0hx6qo+x3BEu
         tpm6EN1+FpjEM6ErziUvqdywm41dRFaYBmObHOi2Pj53ufMqPGnPX4Nd1j7TKrE+xd3k
         E9ZhE76tgMFTnuc7uhWVPDBQDJyf0iWqpcEpcNXpDBCf6vGv0H6moilmHARlgYuVLIuF
         LX20Qc2cGxlTGvh7vPeJ3SHLY2v/8IU+da3OW3u02TtvMjmoQxjZYBsgD46srfvVZGln
         G65kI6R8zjwDCoxIRW1xBWSS0R39xat4NCSODqKaczGAExV+O+YbRDvIXph75HpRjOVj
         5Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698098012; x=1698702812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN2sLOa9xwGM67Rq52+5iCupQnqxlWnolzeyMPzN3QU=;
        b=Mcl1KzH685FgH07MKxYWwx/4egDgaNPNULN7Zq4Pi1XZXaQXcv5xkvPLyaRHWV+EcJ
         L8TRDy6b9qPVE8ArbWoUV1S93HoKMkcGRph3orOPdFCdYbDJJGy+2PWfsXpn9O86kGXu
         K4gs5XRFyi7EyE/T70DM7aP73jtgMoXiXfrFDf9s2nD0vX5CAeesxzASAIsQqWU43gff
         8G6VAn6CuI+L6n8jXTv2ZY0jeh3VptjQnnIK9C1A5VgJTIcbP1qtZnhp5vkQYdZ1+wan
         U3F1tZT4GuaHc+2FwNBGR5PididS4w08qE4/xpDLFVOTC3KM+syOjEHZaIhojPEyUeQ+
         U7iQ==
X-Gm-Message-State: AOJu0Yy4eJfN7Lu+uHtvAgKDwJ1zYrZpcb+OQF3JTodG8yvc1gXzIK6v
	05KL77oBJNqGR8265OReBU3+PlCeGnC3FzHaK8j1Nw==
X-Google-Smtp-Source: AGHT+IHuJfk9KdAfnGmoSEogeTq5EFh5oiYm9phVPnu+CdkR8gpXcG8+3xH88P6QZsMQ6U3VJYKPDA==
X-Received: by 2002:a05:6512:3449:b0:503:1d46:6f29 with SMTP id j9-20020a056512344900b005031d466f29mr7218271lfr.37.1698098012440;
        Mon, 23 Oct 2023 14:53:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (85-76-147-63-nat.elisa-mobile.fi. [85.76.147.63])
        by smtp.gmail.com with ESMTPSA id g3-20020a056512118300b005079dac9620sm1845143lfr.43.2023.10.23.14.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 14:53:32 -0700 (PDT)
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
Subject: [PATCH 2/2] soc: qcom: pmic-glink: enable UCSI on older devices
Date: Tue, 24 Oct 2023 00:47:27 +0300
Message-ID: <20231023215327.695720-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the UCSI driver got support for the 'no partner PDOs' quirk,
enable UCSI device on all older Qualcomm platforms. Newer platforms,
which handle UCSI_GET_PDOS properly, should opt-in to use full-featured
UCSI device (see sm8450 and sm8550).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 914057331afd..b524291586d8 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -16,9 +16,11 @@ enum {
 	PMIC_GLINK_CLIENT_BATT = 0,
 	PMIC_GLINK_CLIENT_ALTMODE,
 	PMIC_GLINK_CLIENT_UCSI,
+	PMIC_GLINK_CLIENT_UCSI_NO_PDOS,
 };
 
 #define PMIC_GLINK_CLIENT_DEFAULT	(BIT(PMIC_GLINK_CLIENT_BATT) |	\
+					 BIT(PMIC_GLINK_CLIENT_UCSI_NO_PDOS) | \
 					 BIT(PMIC_GLINK_CLIENT_ALTMODE))
 
 struct pmic_glink {
@@ -273,6 +275,11 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
+	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI_NO_PDOS)) {
+		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi-no-pdos");
+		if (ret)
+			return ret;
+	}
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
 		if (ret)
-- 
2.42.0


