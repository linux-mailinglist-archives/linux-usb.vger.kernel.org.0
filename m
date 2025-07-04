Return-Path: <linux-usb+bounces-25465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C3AF852B
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 03:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065DE56505D
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 01:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDAC158520;
	Fri,  4 Jul 2025 01:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCv+jFkL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519531339A4
	for <linux-usb@vger.kernel.org>; Fri,  4 Jul 2025 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592043; cv=none; b=GNvSXc2SsfnyHvgnMqqF77d4jxiWQAla3w3JeTrGa/DAgB89+sCM828raQWGB+WfUvardX3Y3BWOis7JugAGuNQbu1jFLqEOWzk3zFC3c/C1TRgsb7Ocusq2rbz1w04HWwN8UOXwCczGyQthETwjOYtq6O4rKtKT17008sdC9pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592043; c=relaxed/simple;
	bh=SvgUT28YQtbYTyXeSDYnGb4dD2amcrqqud8uqK2y2Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLh4BtFyOMv6I6rgn3bvZbedBlMy+b+b6Qi4Qdpod3C4qvM4DB+7y/Yhjmam4AmOwnTr8tYlrnuKjg7aSoPNRd69K/0aEWpDDkPTwmb7Ua48uIN6+QvTkZf+MYK/benRHMZMTezdCEBJY0QjfPaDaSBesU36LJ31x23lfg4sdj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCv+jFkL; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-735ae68cc78so360933a34.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592041; x=1752196841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=ZCv+jFkLEwv0adnsM9nMRTash4Hg/SJYFtCIuemx/P9gg+v9tzJn3b1JQ7+1UTKLko
         IvmIice+c/dBrRqB4+YdHWdiK5wD3Mrngq21mzYQGSo7VVG/jJ4fZYLx7WWGE4hLmg9Q
         KO6+eYQdRizICy1TdbplJd7HFNZV38NdDSwTI7FQY2DK8V5VLRBdVqU++j4U1WkOk8pk
         wbcVK6vog3ZFkrDvTvquUYx/WZImVH3oQoEKztFxebo7U4FjjhHjrS0bULc9ZudrSnp4
         EaYuCHc/JTnX18dTUamY4SUfof87FmxvhWbc0JZi4b9Y7XFdTqbL71RDVSXGIg9YzqQr
         qYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592041; x=1752196841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=SOzB6m+8rE3ES4s2+QEgOQcUzfrgrAcGQWwQTVOCoJ276cFEhJYyBSSd00yXeaY4Wn
         e78Oe5GEtO1155naebzYxk1qOxEo/JykUlfj6gEb9iHLinsM53EcsvvBOfJSgollMup/
         kR8YgIAjOnJh+zyIF/cYKAhfA6CVZ3JvaJI26X9zmXX+EHI0erJyXQogiJlpydgcAYao
         /gCofg9jxp+qqFhP5L7DtkhOEWA3QBVBrljcN58Q1WKJ4rPKJBiFxAfJ/cRStKtOHtqS
         9ogWxY/lBdvrA+4028z7qnGt0hyPZ/khFjzAOYdDB3N+/qkk3IU/xMP9brysGPdKwf+X
         I/NA==
X-Forwarded-Encrypted: i=1; AJvYcCXTsO0IPrBJGobt8bmT6OwyvoOz5+GsSbo3NOdnXoDLyVIsGu13qInqZxJ8+98hWcdyoYxL3MQDwYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF9Hf/mHXFcLSqWVOtjhuOEwAdG/kpiw3v3UxV9rXbzIHqGqP0
	IWoYbC+yYeYIgXupg27DuYvNHcm5sGEkROJ4yDr/qheVeg8BLim3qsDJAXrOOu9PoP0=
X-Gm-Gg: ASbGncs9s8a1OlcetjC+xY3GxVVVYmEDF5EdACH3IqM4t0RnMTN5DHEoxMfV/oRUf2S
	m3ofZA2jXFfKyHlflt7Ut/Q8zCJsPk3PH9hiQRfdavn3RICFYYo7rX9VgbEOyfr5KjnLbMyhipV
	Am3CyO/8hPGTn18TGVM5yzisnGalInnFcU2mRuiVc2pPlr8bNSTdJp+Rv2miuV7yzXBl+7OTuoJ
	kKaGZyIP6zv/2D9OM6MfsA0D4QiGGguhItMjq0gIvvIzvGvn5HVAOMhyoWfJSqsrw05o1I8yzhH
	+pTCOXVJ5qXBqYvFTkeFKMAcg9CMAojWrr9qQRipBM3GO4bIWiLwrDFsVi0sGhPgTrt6UQ==
X-Google-Smtp-Source: AGHT+IHh+how27xFPi3jlyY66JrJHeNp1IVUr1F4gL3pyWo/92sd3tMtxnIq687N17nvaqy2j2xmcA==
X-Received: by 2002:a05:6830:2b14:b0:727:24ab:3e4 with SMTP id 46e09a7af769-73ca48e3741mr340463a34.9.1751592041579;
        Thu, 03 Jul 2025 18:20:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73c9f9628d8sm203282a34.60.2025.07.03.18.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:40 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:39 -0500
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
Subject: [PATCH v3 3/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <1733ae21-7257-4fdd-8249-7eaebbf769a2@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: No change

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 27a3127db4f6..9a1c97ea5463 100644
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
@@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
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
@@ -1429,6 +1440,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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


