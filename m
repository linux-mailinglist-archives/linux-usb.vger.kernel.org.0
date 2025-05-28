Return-Path: <linux-usb+bounces-24376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA01AC71DE
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 22:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65CC6A412B0
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 19:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00AF21FF44;
	Wed, 28 May 2025 19:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvsJoBS4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031721ABB7
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 19:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462267; cv=none; b=QeJPWGb/Iow83+mm5yBwsdQo9NZhbTqGjQ7QS074nVK141pAviFfXEs3q75ApmBvLoJXpze0JEHhjzsEjRlUoxhG96lsdh8sk5A2IAPVvl5+ZgTceFXWKceVtR80MMIpstwWdtY21Qq9haY3meavxKDtATlHDK//86HsXIj9OlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462267; c=relaxed/simple;
	bh=HxJNYY9IRB2fTnRgpeLfBfNMV4c9x5sL0a7Gxl/lSqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DYS1NpiS4YVaQm5iBAs+yfalCSydU4dxXLrD9lvSwufUnBuuQawHsv1E3bUZr75pk4y5TNHnQYvSOggJ7azZavBoxgZVSOXj5Zn7eNYjgXxU+BRzFo6nqNFj/kLrDPDaC4/tWzquI8d9MRiTaCLn8tYnvdlYu6kTVxKnlKFTEQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvsJoBS4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so262045e9.1
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462264; x=1749067064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=WvsJoBS4r3XoWTURdvUVsEgn9z1Pkwv0XjMjWl17B7CcJq6trEszWb90LOm+F/GMxF
         5cVYwzlqqISHt/uGKPlXLCV1uHq08X7Dq7noE+9eFz3+6MpJULRyaxS2WYZtsrCcKYTD
         fN9u1e0flhF6ebl03OEkqdZKiJPfRh2lOH/S4SBl83jwmx73ZL2O6C3NranZMwHkH9vU
         6lyEnmyEsjNc3VUcBWfouppZb6Q18LgfRH3zum9AF0bmxunmr/7Gv8Fhlbt0h2fBguL3
         ljjfyJ7s0ersC/Npx8/4ceDrSJseofX4eA/+ybSUbrepBcdNqkHcCQlJzm5+Qcb7QM05
         cPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462264; x=1749067064;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=xS6GNP5B93A9erIX4Jpdyrx29YUmFdCs1ggMbnSCg89aK+5MF6Q21aL1uqjxIa7gSF
         z5kbVaT7SYnudlIr/u2LMpvGcscCi+tznALALgKVRZHm4BQgaSrLUfsQMlfxclMH9sxA
         4AqnBByOijknA9n9B65FULW7eayjqHwOyZwfZ0pEAQOeaUi7TUj6rjAKtQOEcCwDZE0y
         tbt7BWCO6usXKSR8dE2X8JmQa8BvPIbt85RRaWNHSlKluOFhBi2/ttTyytRNczknNRK2
         rx23kRkGwBAD6cx9Ii1yE1Izh/tmqUh6ptfMn4dzKkMdMksTWICIhmey9APRTQvhcf2o
         JF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQ531mF45oj1PesCkxMFgQ3RGTguzPyDR/xVEsAihs6p2OWzrSob02bl8dyls5/FEr1vd6GoznyMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9YxIbIBkEJsGV82O5H647DYRMYC5nD6I2hF6GyP2WAK6uSWPC
	C7EhZ+BHBfGW01gqwwpZpF3kAO7JGGHTe10yK6wJCNkSftSCnyFpt/3kfNO2GGWzefg=
X-Gm-Gg: ASbGncuNWLCNk2yuqCQsxsgISBbQs3i8cRTyabBe+mpYldI0qC+tvsNKl+T4w39ZNLb
	sSg1CVFF9MI1GbaXnJuF14uq6M1DYpTHhnWVhS2V+dAzHv+gsEXQeOCUsy4qu59/Np2xtTEyHvC
	kUKLz9kKFpOwG98mZe6jZ1wKnjFKdMVHSKmo4vdwA/+tn7jMJDbtxnRHdcU93ksxQioDN5Yi2iq
	EdPN5QSiUw8kg/E/UuljCz53tf1LLIoEj14yWAY+qEUj9elCDw27TkzyZFPfgRIqzBq9+v3XlEN
	6bJxXc+QyVYkUW+1RgQfP6eDGwk77hMsAvMEf4lc1jMvz9p8Hv1UI/8=
X-Google-Smtp-Source: AGHT+IHg9XasKs+N0t/qumXHpJiiJ8sMTppJmHwcsmrYSwVnYilz8ut2u+dvhBQCw0zXqxv2hFdsXA==
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a4d6eda63bmr10797738f8f.39.1748462264092;
        Wed, 28 May 2025 12:57:44 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace3260sm2353096f8f.90.2025.05.28.12.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:43 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index ce207f8566d5..d062399ce15e 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
 	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
+	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 43098a150e83..34fd26faa303 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -677,6 +677,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
 	return usbmisc_s32g_init(data, S32G_UCMALLBE);
 }
 
+static int usbmisc_s32g3_init(struct imx_usbmisc_data *data)
+{
+	return usbmisc_s32g_init(data, 0);
+}
+
 static int usbmisc_imx7d_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
@@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
 	.flags = REINIT_DURING_RESUME,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.flags = REINIT_DURING_RESUME,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1432,6 +1443,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "nxp,s32g2-usbmisc",
 		.data = &s32g2_usbmisc_ops,
 	},
+	{
+		.compatible = "nxp,s32g3-usbmisc",
+		.data = &s32g3_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.47.2


