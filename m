Return-Path: <linux-usb+bounces-22257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6452CA73E94
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 20:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40E33189E574
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 19:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFFD1C7010;
	Thu, 27 Mar 2025 19:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jwTKEtkW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB0A55
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743103882; cv=none; b=Gp4Nza4wBOq+lqBEcl5peuTkFE7OE38lz76akOBRHe/8HjGUoxoloTof/Pk2CTy5OO0k6dUgViZ35ChHqd4v1LoDCMRUQqbHPSkjdnUvIKlrIuzxd4usSe8RPLHBSVeKk+7W0gZsn3G0vXBQzHi8YDa7bG579eaR6ZLO6xetAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743103882; c=relaxed/simple;
	bh=Uo3Y4wwMyV3y+DSOMke8R1D7DBAWK/vp0DGAudzMYeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9Xf0UHAj0ogpi0uCoHBSIwNLfd4H2zp5pnpkI/2NhVyiUC4h0eOzxF7EQmhT5yd437kykFNDGvQIfId8ltZMz5CUnlJ7CBV408NAEbd4g6nkj6uNcSpXOeI92fMBzRwh5TPLyEGvwBl/8oQlMUspYVREQwkHcTWNlE2u3znD/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jwTKEtkW; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47692b9d059so19177931cf.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743103879; x=1743708679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOWvcEa0sbfZjABPw9Te+y/65mWJI8Lsb95Ek+V1dlo=;
        b=jwTKEtkWQuP40eSVJnCqMGKUXDv7LRvL4ATsKdf26B6bkeYXlFq8KKuqmzIyt4knjZ
         MVQoW1+bDJCD25GGSq9yonzk7H99jWi/UHjDSapc0O31BGxwDmJxW0sbvY5oh+k5aAlb
         K/k2TDm3plK4XIzx9VetIdQc3jU/p8MHtFAfCz3DkSYuhpsZcwlA2Tzd2XVLBuwJrbPA
         3JQMAHQ1KVQ2qsR+fwzxNMMxG8r+cmdliX3ofJZb8ijDXjehqMzT1E5bYv7bw8sx8tz6
         x9hW4yp8f3PXcJkcSHCiUYbEdcNu22T07KtczXKlaS60xWmapq6OyM4hsTXpYoebOUEV
         H3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743103879; x=1743708679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOWvcEa0sbfZjABPw9Te+y/65mWJI8Lsb95Ek+V1dlo=;
        b=NpUYpIkjdeGClxgO+eG+w2GFpm2jym2T2wYBoOv2po/jZa9nlqqzsBnb8rZVS436XO
         MS75Hpm8X628o/7gZsmp7ZX1IKFq46PGx3idQJSHSBCbUSWTWPzvr3fl59Xy+5Zvjfrb
         o8uL2EqPWbZXw2FOyW3idUh0kXtwueua7mkdrpM1FsQnJTlvclyUEqs3SrvYjUBT5MCN
         lvrc4yf1yS3pR34Y8joTu0DslRiQT9WiW5OVH1Ou1JIy/iQEYldj0CNI6HOZ+NnhOj6L
         yMes5Yq2rGh8wWYgR83TzfNn7YN0BOguAI4lCU8az9kk0NnqRvuS/MdX6D+9hPZFrEkW
         sCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFvLBiFwWZxOg9ZXYo8cO5XuK44qs50nsdxpgLegNwOj9OveSFOhKvXc58D9v1liI/c1H4LgnRBEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr7qlRxxsTlBn1/o/WtF1DgklmuQNa6F65oV77q4UPVRbPLvg3
	VkS7qG0PLDqNYdiCZJuiH6ACcGgNBYyLzodT0EIIcoZ4Qu83qyNZIb8ATb7BWQ==
X-Gm-Gg: ASbGncvTmpnmg3Ftxkhv0zFuFGN29sDnxlyWTYSzgkVMYQ/92E+bSa+jSJ/Uv/er/nS
	D5loiI2OAZm7MXD+cdx1Lqp1F/1YqbKkYvzUMpWW/vJV1vAPGCXXeRpIpO0KZh9eYpOq+BuoZYa
	p1PJbk/y5STIls05x+dKjfSMpAAr1XETx5dRsxZZEN99hM5js5AlyWOORAUi0IhmQDAsidM21pY
	jqZuIcaQ7ujW8cZEti1tgMvWijHgEAiNcXN2BBg9hGDXQp/ZkPdizUZNjJLnm07dXse27DP6eTz
	J/9XAXgczGF5B/kDS0mwDFkAL238H73hZ65i+SHaXolfyq5zfUh78ND44ZepFJ44SFJpxra5WZR
	oInBrc4XnRTvMuJreVvC59XdvQgeSMg7rYIkMAg==
X-Google-Smtp-Source: AGHT+IHhYGeHC6Cc7v+fL0j0iHE1UuzcR8DR3uKdtY7qHAlgm3C/YNf4p1yl1SUxogG0H29UbqzJ+g==
X-Received: by 2002:a05:622a:58c6:b0:477:4df:9a58 with SMTP id d75a77b69052e-4776e0d1714mr88924621cf.18.1743103878520;
        Thu, 27 Mar 2025 12:31:18 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm1526041cf.9.2025.03.27.12.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:31:17 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:31:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] usb: ehci-fsl: Fix use of private data to avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <8139e4cc-4e5c-40e2-9c4b-717ad3215868@rowland.harvard.edu>
References: <Z-R9BcnSzrRv5FX_@kspp>
 <1e82761e-8554-4168-8feb-561abbe49f7e@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e82761e-8554-4168-8feb-561abbe49f7e@rowland.harvard.edu>

In the course of fixing up the usages of flexible arrays, Gustavo
submitted a patch updating the ehci-fsl driver.  However, the patch
was wrong because the driver was using the .priv member of the
ehci_hcd structure incorrectly.  The private data is not supposed to
be a wrapper containing the ehci_hcd structure; it is supposed to be a
sub-structure stored in the .priv member.

Fix the problem by replacing the ehci_fsl structure with
ehci_fsl_priv, containing only the private data, along with a suitable
conversion macro for accessing it.  This removes the problem of having
data follow a flexible array member.

Reported-by: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/linux-usb/Z-R9BcnSzrRv5FX_@kspp/

---

 drivers/usb/host/ehci-fsl.c |   25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

Index: usb-devel/drivers/usb/host/ehci-fsl.c
===================================================================
--- usb-devel.orig/drivers/usb/host/ehci-fsl.c
+++ usb-devel/drivers/usb/host/ehci-fsl.c
@@ -410,15 +410,13 @@ static int ehci_fsl_setup(struct usb_hcd
 	return retval;
 }
 
-struct ehci_fsl {
-	struct ehci_hcd	ehci;
-
-#ifdef CONFIG_PM
+struct ehci_fsl_priv {
 	/* Saved USB PHY settings, need to restore after deep sleep. */
 	u32 usb_ctrl;
-#endif
 };
 
+#define hcd_to_ehci_fsl_priv(h) ((struct ehci_fsl_priv *) hcd_to_ehci(h)->priv)
+
 #ifdef CONFIG_PM
 
 #ifdef CONFIG_PPC_MPC512x
@@ -566,17 +564,10 @@ static inline int ehci_fsl_mpc512x_drv_r
 }
 #endif /* CONFIG_PPC_MPC512x */
 
-static struct ehci_fsl *hcd_to_ehci_fsl(struct usb_hcd *hcd)
-{
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-
-	return container_of(ehci, struct ehci_fsl, ehci);
-}
-
 static int ehci_fsl_drv_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
-	struct ehci_fsl *ehci_fsl = hcd_to_ehci_fsl(hcd);
+	struct ehci_fsl_priv *priv = hcd_to_ehci_fsl_priv(hcd);
 	void __iomem *non_ehci = hcd->regs;
 
 	if (of_device_is_compatible(dev->parent->of_node,
@@ -589,14 +580,14 @@ static int ehci_fsl_drv_suspend(struct d
 	if (!fsl_deep_sleep())
 		return 0;
 
-	ehci_fsl->usb_ctrl = ioread32be(non_ehci + FSL_SOC_USB_CTRL);
+	priv->usb_ctrl = ioread32be(non_ehci + FSL_SOC_USB_CTRL);
 	return 0;
 }
 
 static int ehci_fsl_drv_resume(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
-	struct ehci_fsl *ehci_fsl = hcd_to_ehci_fsl(hcd);
+	struct ehci_fsl_priv *priv = hcd_to_ehci_fsl_priv(hcd);
 	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
 	void __iomem *non_ehci = hcd->regs;
 
@@ -612,7 +603,7 @@ static int ehci_fsl_drv_resume(struct de
 	usb_root_hub_lost_power(hcd->self.root_hub);
 
 	/* Restore USB PHY settings and enable the controller. */
-	iowrite32be(ehci_fsl->usb_ctrl, non_ehci + FSL_SOC_USB_CTRL);
+	iowrite32be(priv->usb_ctrl, non_ehci + FSL_SOC_USB_CTRL);
 
 	ehci_reset(ehci);
 	ehci_fsl_reinit(ehci);
@@ -671,7 +662,7 @@ static int ehci_start_port_reset(struct
 #endif /* CONFIG_USB_OTG */
 
 static const struct ehci_driver_overrides ehci_fsl_overrides __initconst = {
-	.extra_priv_size = sizeof(struct ehci_fsl),
+	.extra_priv_size = sizeof(struct ehci_fsl_priv),
 	.reset = ehci_fsl_setup,
 };
 

