Return-Path: <linux-usb+bounces-24374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B9BAC71D5
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 22:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B84A27AE9
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 19:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DEE220F3A;
	Wed, 28 May 2025 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFQ7G+io"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E62206BC
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462250; cv=none; b=iHpbLuWZkhg7PRtZB1E+uVd0bt/AaeIVMaDyiTzweG4XFRk8u4LTTzCcu2zkocEIkh7CL3MsTyRDOER0+EGKhzVYXn/z1ydRboX70eOaYEDkWh4UYLpe5UIOSosmr0lbjEK69IHHrXiVFc7AJxpAlZ4QH+s2qWQwNqPngHqJnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462250; c=relaxed/simple;
	bh=NSe9RzYFBpq47/dJ5qqWUOPu2I/KiKwtwt0jkoCunaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WK4tNbyOA73w3+htIXuWdOPp4UIPMRz3E3IU5jxh4YD7WQdQD+oPuNBJeie4uyznJJRFSQPPDTSJjJ50tFCWkl6mOcJ94N+HIZxDDMIZlHvlfTSPqION3Q2HZYcTihF1aGOp9CGkAhc3IgppfppB6CwYFVf7N1X57lDVoz+h0SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFQ7G+io; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so2237435e9.1
        for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462245; x=1749067045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=CFQ7G+iogz9ohwn6ms/590G4KfsuI77AWtGZuvgyCydOokQxrzdBayAgp1JLSpXysF
         zHr7llscxlMVmyj5iBH+jD7FWXlext/3Zkzm39jdkNdowuKnpZYZusVmRPI9RDA1ciIa
         u5KBitHC5f6ZwhqnGt+X2dhAJXIqxQlitaOXJhyION7ErzGKv3keH+qAJ5A2pPye0C3d
         CcQCpLHGGgLdA5vWFPmR0KSwgX+jXhGTQI3XXfNJ3G7LfD/0Bv6IBhPdHO5WYmACEb1h
         r0pq4XNQ6uDHiLOXK91+9S0yQ2YacH8jAhnUx0T4TGmWfnaqRb1fvhk4QsnWHKhIQ00G
         UQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462245; x=1749067045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=MMf7WQkOl4Rk381Dmnu0t96cjzX9wmT0/FgUrVJICV1ycIbuA+N3ZXYbZ1J2W25xcY
         qT8vJrJJbsTTcbUoTT+HOZMMSCK5aTLR+gVe7sytgbuo5FzhJryIXIR8pajMe+o/JRwy
         45+sMghSywn0qpRWKKMOmdpViNBnkmF1vcFhc37xKUYm1PJ/d21LYmioZPKLzKgfLJpM
         s16Z7E1eVN7fSX9WGPUyVV1/qGDkX4NpMFfeGUeQWD9Iri/+6zKsTpiYjM+ewXl6iCa7
         iVLhrDWLohjOUbB7AHEadrZx3U6xvsvxvRMFr5vhP62NdO3dhifzsEC1y0hhVMAJHinm
         QzJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXceAnrBf4wF8/QhmvA5tae4+k8h4K5/2ozc1eh8JfhIwWdtIJJ6SVW49wFp0QrW0eTVnJuzmJK81A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwETmEC9+LqZ0ozcNbiZ6N0gAZKLpp3GqA0cVa4IC/1tPmkOdr/
	MIUUCQQ6GEVI2/SICUvR3tn+HrSoG349EVX024hWWB5KKX4ZiyITVxbGn9Y1JJ7dmGU=
X-Gm-Gg: ASbGncuxVq67473QYlO3TrkG+tUKQovTn8vZsTx1syemi/UEmHQaqNn6jVr/sejwiCY
	3XVXI26lMbJuq+MCgYfB+QcT1TQzB6hWYDIGMgTJ7g8+WfCQm8A81FZP4J28eTF1dNtnnd/PdEA
	fmeOH/BFllvf25V3PMKicmXsTGV+KTWEoFuiSMG3Dul0Goy1nGkrNPiiiOXeN+rLWNI0H5blgxo
	76cdKQFhnzphLhrGFHM5Vm6/J0qgLEWy8NCKswthLeL0IKmU5lN8ist/0+Nrmza6LQQkxdFEjmH
	ai6cBq2u0hv+0TAUin0ykPLhompAHVNN15phLcFRwXgfKzOGQGrrtaWJ0C7jPWGkDw==
X-Google-Smtp-Source: AGHT+IGFimIQlDKktgw+rSB1HgWLv0+JQH4Uvai1EVQNKILhkigc431Q3x3/98hg2t4hXWqFBll7vg==
X-Received: by 2002:a05:600c:4f43:b0:442:e0e0:250 with SMTP id 5b1f17b1804b1-44c933ed7efmr166096775e9.29.1748462245206;
        Wed, 28 May 2025 12:57:25 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc2d383sm586565e9.32.2025.05.28.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:24 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:20 +0300
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
Subject: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a REINIT_DURING_RESUME
 flag
Message-ID: <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
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

The s32g2 and s32g3 chips will need to re-initialize in the resume path.
Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 118b9a68496b..95759a4ec60c 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -155,6 +155,9 @@
 					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
 					 BLKCTL_OTG_DPDM_WAKEUP_EN)
 
+/* Flags for 'struct imx_usbmisc' */
+#define REINIT_DURING_RESUME	BIT(1)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -171,6 +174,7 @@ struct usbmisc_ops {
 	/* It's called when system resume from usb power lost */
 	int (*power_lost_check)(struct imx_usbmisc_data *data);
 	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
+	u32 flags;
 };
 
 struct imx_usbmisc {
@@ -1266,6 +1270,9 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
 
 	usbmisc = dev_get_drvdata(data->dev);
 
+	if ((usbmisc->ops->flags & REINIT_DURING_RESUME) && usbmisc->ops->init)
+		usbmisc->ops->init(data);
+
 	if (usbmisc->ops->power_lost_check)
 		ret = usbmisc->ops->power_lost_check(data);
 	if (ret > 0) {
-- 
2.47.2


