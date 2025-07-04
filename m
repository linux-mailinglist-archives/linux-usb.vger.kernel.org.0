Return-Path: <linux-usb+bounces-25464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B89AF852A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 03:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCEDD48512F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 01:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30708635C;
	Fri,  4 Jul 2025 01:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBmSc1cJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE4A1339A4
	for <linux-usb@vger.kernel.org>; Fri,  4 Jul 2025 01:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592041; cv=none; b=IWO4TiACaL9AL0Fpt79U7J3EpbvIyGsduOUGIEPePOTIOTHry7VSTNdO9q6NUrRu5ckPlA5Fbp4BRFx9v67Da5vcSm7knMJDZwtFl5HVnYqODnv+s4xdvmq+u2yVKQoc2LVJRcTo8vq+PuESoNHuqBf+xCZJ/GHLxg7v+tlnbA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592041; c=relaxed/simple;
	bh=AZzPT40XlYFbA7DuV+ZkKloQbdJqJIGri35N1UjALFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAe3y1DcJryVtZVhWrFkPy7N5/onzXaYwoAlt8DtT9B+P0xTejEBAF9aIPL1tTxg4YxOfPMd24Elf/pzeLDdxCVIge+3VFCjtiT/QTAGPP9wBf5CtNqkFUo8N64VrgNl0LRK+KK2LRrvbKwg4PyEED01ZylTh91lhNLjqb2JthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBmSc1cJ; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73afbe149afso355130a34.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 18:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592037; x=1752196837; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8+iCOuTihJeiwPkhhbjsp9DCgzmpIJwxn9DIeybNWM=;
        b=YBmSc1cJkip42FCetkaxRZnkNaM5Frh1Z8NEp5Hf60vQRXlj2vobP4q5N8sA1nh5Ng
         GZZ7BqNWqRSbh074/NiY+MvTdEEnAdY1OfXoBsufDdzIiyVLSzPirc3hNWfMOAfJh+mG
         lq+INjKVGGuhbl/cGz5Q63mjV27pM98JsHFHsOwisI7l3vWQ2UgBa3idatce6MP9qqpK
         WDcpOw3iPnLkC32eSlWY+9aatF6rfHMA7F3RXPYxtH32kLnVOGQalaGf7tjEOQVtiHHF
         E0k1S8pbTWuGz465ER0loAsDzh2j5I4v2cjGAiUaq+RcxlHxu/y5RdabbKGLo3amJAks
         w2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592037; x=1752196837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8+iCOuTihJeiwPkhhbjsp9DCgzmpIJwxn9DIeybNWM=;
        b=c9p4LgHz1n33T/1FzpAFICyvuBkCUY75/ZuwoODQza/wj/NQXhsSv5hI+4DnZXy3sX
         BErNrILDUJTkgrvZQyFV/LnAiDLBR7u8jqRluElvL7iCbTdDSKvfyJmy6kDNflPFbebI
         SEkqJg+WuXmRtSm8lipkHZyqlcxQNxpg+/gJREteW+nUkBMU42N3EdGLlAW7tZDrS14T
         uV47WsBc7K1O2qBwy+fO0lORl4AcGOHs24EDizTncTAjgupSPEHaYcafgSIXvcVmaCns
         vARAL4VwS8FMm94ENLzB7iBJdyf8V9BQBfgSm5SLS7GbQiI9uBmzqSQuxHK/YXsmJp8c
         JXEw==
X-Forwarded-Encrypted: i=1; AJvYcCWwQXikYCGitDK0LOQxFVAqo4Sv0Bi20Bbxhs43SeIrHeZ7/fdNFNZqspewtlytl8G21seZ15I3RMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xTJyWK5ciQbrTiMBJVrM+a9Hok35whW0us3rf1f8vmK2MPOx
	dgpK3LxmmGppES18eItnjTod7dnwR8AacW9ggzEN6gerVwITZdLSa3EsujRHMiqZGOM=
X-Gm-Gg: ASbGncvt+99d9fVp4N5245VHjHaSL9RyYwNq/MhqpJRVaYYIdOvLkSngOxOHcOVQhFT
	Q7bi9aq+Qd12OnCc91tIOJ8ibuH370aCaPcf5bFWQaHiT6RCDmBCbU8XXQ/+00TPWr1fIJEIErE
	IslN281O3WsbVv0de7Ieb2eKrGXVz+Iwx/dcoOlf1jdqQOP2PAl3GGRh/CE1eg3m77bQ2nup6UT
	vdn5SNS9hVj3LqbJsfHEt9/EA72s8S0yeeZYrq7d9dtEIDgjLvdIfIMgVFWw3boDGm9O0JREfXJ
	avc9tJpm/me4uOhqj4ZgrriCL4JBHRwN5FAqFRmDIXJUyoYLKQob56IFU9DygOQWBwEkKloP6wC
	iBZ/W
X-Google-Smtp-Source: AGHT+IEvAKaFLRrXiJ2vNvkYk/bsSqagV089+dY3iwgVhXHBkkjAFStvvEN26+imHealtouRRZ3DJg==
X-Received: by 2002:a05:6808:6d8f:b0:3fc:7e1:a455 with SMTP id 5614622812f47-40d07277abcmr89734b6e.2.1751592037340;
        Thu, 03 Jul 2025 18:20:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40d02ac77e9sm147118b6e.36.2025.07.03.18.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:33 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 2/4] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <abb2ed5d-f01a-48f6-b1ae-6f8f39ae40fa@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for s32g2.  This chip has an errata ERR050474[1]
so we need to set S32G_UCMALLBE to avoid some memory corruption.  I
have include the description below:

ERR050474: USB : USB data may be corrupted if transaction size is
non-multiple of 32bits

Description
When USB issues narrow length transfers i.e. AHB transaction size is less
than 4bytes, data for that transaction will get corrupted. Narrow length
transactions can occur if the transaction size is non-multiple of four
bytes, error scenarios terminate the transactions early or if the address
offset programmed in QTD is 4 Byte unaligned.  This happens because the
SoC NOC is not able to handle the byte strobes generated by USB controller
and is dependent on its internally generates byte strobes.

Workaround
Narrow transfers work properly on bypassing USB controller’s byte
generation logic. This can be done by setting UCMALLBE (bit 15, USB Core
Master All Byte Enable) bit of UOTGNC_CR.

Link: https://www.nxp.com/webapp/Download?colCode=S32G2_1P77B
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: Add the errata to the commit message

 drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
 drivers/usb/chipidea/usbmisc_imx.c | 73 ++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 780f4d151345..e8c847eab8e3 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2025 NXP
  * Copyright (C) 2012 Marek Vasut <marex@denx.de>
  * on behalf of DENX Software Engineering GmbH
  */
@@ -78,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
 		CI_HDRC_HAS_PORTSC_PEC_MISSED,
 };
 
+static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
+	.flags = CI_HDRC_DISABLE_HOST_STREAMING,
+};
+
 static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
 	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
@@ -89,6 +94,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
+	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 118b9a68496b..27a3127db4f6 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2025 NXP
  */
 
 #include <linux/module.h>
@@ -155,6 +156,18 @@
 					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
 					 BLKCTL_OTG_DPDM_WAKEUP_EN)
 
+#define S32G_WAKEUP_IE		BIT(0)
+#define S32G_CORE_IE		BIT(1)
+#define S32G_PWRFLTEN		BIT(7)
+#define S32G_WAKEUPCTRL		BIT(10)
+#define S32G_WAKEUPEN		BIT(11)
+
+/* Workaround errata ERR050474 (handle packages that aren't 4 byte aligned) */
+#define S32G_UCMALLBE		BIT(15)
+
+#define S32G_WAKEUP_BITS (S32G_WAKEUP_IE | S32G_CORE_IE | S32G_WAKEUPEN | \
+			  S32G_WAKEUPCTRL)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -614,6 +627,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int usbmisc_s32g_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
+	reg = readl(usbmisc->base);
+	if (enabled)
+		reg |= S32G_WAKEUP_BITS;
+	else
+		reg &= ~S32G_WAKEUP_BITS;
+
+	writel(reg, usbmisc->base);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
+static int usbmisc_s32g_init(struct imx_usbmisc_data *data, u32 extra_flags)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
+	reg = readl(usbmisc->base);
+
+	reg |= S32G_PWRFLTEN;
+	reg |= extra_flags;
+
+	writel(reg, usbmisc->base);
+
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+	usbmisc_s32g_set_wakeup(data, false);
+
+	return 0;
+}
+
+static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
+{
+	return usbmisc_s32g_init(data, S32G_UCMALLBE);
+}
+
 static int usbmisc_imx7d_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
@@ -1032,6 +1091,10 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 	else
 		return 0;
 }
+static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
+{
+	return 1;
+}
 
 static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
 {
@@ -1131,6 +1194,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
+static const struct usbmisc_ops s32g2_usbmisc_ops = {
+	.init = usbmisc_s32g2_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.power_lost_check = usbmisc_s32g_power_lost_check,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1356,6 +1425,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx95-usbmisc",
 		.data = &imx95_usbmisc_ops,
 	},
+	{
+		.compatible = "nxp,s32g2-usbmisc",
+		.data = &s32g2_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.47.2


