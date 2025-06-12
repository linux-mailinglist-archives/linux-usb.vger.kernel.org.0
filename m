Return-Path: <linux-usb+bounces-24714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3467BAD79FE
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 20:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 544513A9991
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 18:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE8B2D29D0;
	Thu, 12 Jun 2025 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwcSVhA2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1FF2D29C2
	for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754276; cv=none; b=WOwN/UZxz01mcs5saQmSWjoGuwLxEVwSHGFLi4Ah19RqeUTVUmwjdZw42C/Xm43xA5dDi7qQsZOAGrbE4hCS9cGSmsPwafTd6nY8IM1JkaID6FehE7hk+MMsnBhJt3I9hgcqO/ztc4XIG6x0UZtDvXtRoQjlJhFJe1gdsvVOeMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754276; c=relaxed/simple;
	bh=IWlKY+BMG19gHf6CAGx0zr0/tTNrF1H4xaMS/LlJU2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiT67J8GrLq/VjZoyeNjmjH2HcOk9K3RVjtNG7QDTMevX7hRcUIX3TJkVKPGQBxZHUZOqKnfPOG3Ay44H06RNod33eoH+TtlA/TrGmoQOnydyp/kK9+slBFKv8RKDChUdGuGrrEw5wvW5zOVR6l6FE76kZFgRLMfZdpcgwkZQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwcSVhA2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso871893f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754273; x=1750359073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=LwcSVhA2evGpPWYLNDAJwbo2w5+fh0wRw9GnuzQUbFoRHD50Qj8t0/7fYENrz+ekAZ
         nldua6oEWWvKPqCMtEWNDiv5zNtXFpvjUheRFoMgI5HKJ2y5ojwYIQ1YxSxUiZCcgKJi
         nIq4MEmnV1geVCbAM77Qhoj3eyloy7qAM1Pdb1lT3vKbHLSjL/F6sbZ91/P2dVt7itTX
         Nh3Xzq2mHOJc3v/Juy3YrKl9YH0sjPw0U92G+JIis2dId7JpZ5HT3TDGaGCH8xnj8o6z
         V4VvkttWTkHom4B7akL5Ed+EnLNqcE3gwmhiPDfTrLd81oB4Mp2hIcOSoCNwgoDteM0S
         KAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754273; x=1750359073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=VfqJ97dkWSYAengl4mqMGqgGNrOkOLbVOL24Ie3iF/7cYYP8fISNBX5D+tG9hJeojG
         EDbO84da8OiRMpc24ol2PkpOCk2MrdN22rWpCTXALZDPyfTKPz3W7V6K05vGifyMJQIt
         mc/2GouwQ0RAjrPKzFEsBv4IaW15rtCrXSaCg4faRYeER1SG1/X0nsh0ZBCFRFFYC98R
         x1fVL61IpCDM6Tg69ZkTgaIo5W/wJHW6LBCFGAXWMBXjW1PaX+u/lwW0Ete99zvPjzXC
         jaA4Z0xi/715pxbWkkkN1cXC/oR5VgxedFXPth+lKDyXBldK8JSMaopXCWw9su3mwgoG
         cxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/x0+X0TIaHFoWp2PpKYB3r1JT2d3rZSIW8EQ7o0dPe83/QnNZwCTCTJ2NdUXMtFmH7ocMn0TRCGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoUMiwSVZq1Esx6GLPu/12+NTaFIVLqt1g8qVnl5K1N8CRL3a
	oPv/GV5N7wXQGl13AMb1ajWWzBHKTtGvvC/G10mD1mT99cQC/HeeSCntjRHnQ59TWUQ=
X-Gm-Gg: ASbGncuQV5dRJGdtnSvXnLPRflujeslESxAXkEyLaBE3jY1QvU0Jt2Mwa2dfaOt8C3U
	STPMbY2m0Ux1TE6T4VVyNM7bL5suanb2Jel5nioogfrE0PGVTJr6TYm/6WN5zKq5KmSEDYJS3Um
	hO09oIbZtFuvJFovfX6S76D7lcz/28CMY3q1QIisk4gkXE6/pvUXkqGxPc4SH3d+jrPzJnXLcQG
	Qtb+ZFBdVxi8+LNdaU2jxUWa9uzNgjS1efnTZLDSXsCyFZkfJ/TfkcoTg5GxhOjBZ474PjTpwH6
	cXcuZoTfsUn9UhYUaHsapoCNDMDp0XVxV4NFS1zo4qOOpYL8mec65huL0Qa7hBbpI1k=
X-Google-Smtp-Source: AGHT+IF8J8y/ngnpoyOUShRv9/aJkdzYRnZ60F/4jSk31esEVM/l95MI9oTPjOP8gHOhRdPMBTj3gA==
X-Received: by 2002:a5d:5f91:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a5684cc429mr399383f8f.0.1749754273164;
        Thu, 12 Jun 2025 11:51:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a7f8f9sm113600f8f.42.2025.06.12.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:51:12 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:51:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 3/3 v2] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <957b91eb2270113a857474ddaa29c99198ed95ab.1749747898.git.dan.carpenter@linaro.org>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes since v1:
* Drop the changes to ci_hdrc_imx.c since that part is compatible with
  the s32g2 chip.
* Use the .power_lost_check() callback.

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 67ff073ad806..d5389156e157 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -673,6 +673,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
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
@@ -1201,6 +1206,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
 	.power_lost_check = usbmisc_s32g_power_lost_check,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.power_lost_check = usbmisc_s32g_power_lost_check,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1430,6 +1441,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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


