Return-Path: <linux-usb+bounces-14414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28099670E9
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 12:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F36A11C21671
	for <lists+linux-usb@lfdr.de>; Sat, 31 Aug 2024 10:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126C5176AA5;
	Sat, 31 Aug 2024 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K79//bN8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080AA1531E9
	for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 10:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100362; cv=none; b=bewjavXDGWkFoMzsb/H+TYdar9Zi0uXWCjup9fcYn+5tztm4EC5u20i3mJ4SEYc8OZCkJu6VhYnlJ3m0pTayVGvIQ0HBu4tk/bB7qVnYx1/IMjPfVJaZN7mHgESStAg4Ci6Pfx1ViJ7yULXSOnxt4tHj0AxGaG8BZSyblD2c6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100362; c=relaxed/simple;
	bh=LS7JjNLNOai5U4tKMxi9bIxoMnNaywIh2Nz/2XzTViE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S8gED11WUDv/HFlteFge7UEuqMxHAwKQiLJfdFUxopFlqWQz/v5T9AqOp+GmnDsoR9wPkKJIMwZC3BkHiGaCble0XqByRJWQGeh5AXJvkvuwS1cyVQKCWShO5q4UYMHgQmGg/g50a3VrdhHpuTdonFYysZ3rrrcGYeLIDhq9Obo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K79//bN8; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso2837884276.0
        for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 03:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725100360; x=1725705160; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKxIacQXeZ2qcUvNmDUUVII5ysi793GfJwtJp8UupOo=;
        b=K79//bN8cXBhdsmHCleEkY4jKCZWc7vZw5bVpr+9ezF/Tq9yh1+AQko2aps9jV6Nra
         L3nUQSBVdDPzzAsctwyEh26AqNfkQnXhfTKx0aojqdEI8gv5BjVAuA2+xBBr1rH1wAtc
         yiWEUy1EZCGryL4OB5YQUkSL5aAXA3sGcD85ZAL4shyVE7asTxQMohCD4zVZ0qcqazA+
         b53sCQ6XKu59mdeupIEFnm/dF5Ob8dzrs1MmEDemLvq5f8/ydxpoIgty/SaFvRDwTE85
         iFPmNSWBYjRCQXEJXCFHh80/KOlBz+bZXN+Kne31Q2Xfyrmax4lC7xpTONo/KgnTjNEo
         +BGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725100360; x=1725705160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKxIacQXeZ2qcUvNmDUUVII5ysi793GfJwtJp8UupOo=;
        b=jYoSLZ2uZJcU4dpKm99DtNB924poy5YpLA2IZrC+lZIlHsHbX8CYhUdN3dBxubN0UO
         vyv+583jsd5b1aTrKi2e1/5G8S1gy+4andJJQ2LuYcpJwID8Zsp4gJqFe0bBC3Slm0yI
         Bo+zCP9N+P6Np33dSs4p6savyeZh7xoT6dnxO+ALyOeh4yzkTvroJVN0FokMPA+yuLob
         MxkzYHXLbHicQrNj2SxpihjJx4fGEyf4V9OpfZwRIb/VbgHgQAYnW4+08BAwT0fWx2Zf
         UXaGZ6cY99QpfitKB4R5X0zlJpHgVXlsD5vvIieLkyMuz6zUqaocM37QyTpr7aSc2ZjQ
         Is7g==
X-Forwarded-Encrypted: i=1; AJvYcCXHTGnkomYGpNryyuyoeZDlrO7TDhe7aQq/E/JcEZqe22apt7Z6g3vWU+1jm0jv3OOShONUv+UJxhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjolf4K9imRFijd8QVUjwwXvGI8LaaKXufYzcD8uWi+vN4rGEp
	drGYZwNI8AlIOZSeIiyH3Dxgx54YiU+0qf0z4j0d1F+DxBl7t+iGCTTh+n1dD+sF/NW91i2BIJM
	rcCR77GzKLHpNbwlOqqPeb3/zvQd6I52nzDTbiA==
X-Google-Smtp-Source: AGHT+IH8Eb7EYXiidD/DrNNChHQ2lwNk48tFSRFBB77aRxIJWoIIPagMeOtludSNPt8BV9FsjbJZVJT8vUY8xBCkml0=
X-Received: by 2002:a05:6902:1145:b0:e0b:a7c1:9dcc with SMTP id
 3f1490d57ef6-e1a7a019106mr5308764276.20.1725100360016; Sat, 31 Aug 2024
 03:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFrS4Dhd7DZa2zz=oPro1TiTJFix0awzzzp8Qatm-8Z2Ug@mail.gmail.com>
 <99bef301-9f6c-4797-b47e-c83e56dfbda9@tuxon.dev> <CAPDyKFrVS2vpsJqTvjKCJ7ADqXc4D4k2eeCBsaK4T+=pXDnKUA@mail.gmail.com>
 <fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev>
In-Reply-To: <fa9b3449-ea3e-4482-b7eb-96999445cea5@tuxon.dev>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sat, 31 Aug 2024 12:32:02 +0200
Message-ID: <CAPDyKFrkkASq7rfRN=9sEet-p8T8t+f__PdnSNRN3bMNipnNNw@mail.gmail.com>
Subject: Re: [PATCH 00/16] Add initial USB support for the Renesas RZ/G3S SoC
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, yoshihiro.shimoda.uh@renesas.com, 
	biju.das.jz@bp.renesas.com, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

[...]

> >
> > If not, there are two other options that can be considered I think.
> > *) Using the genpd on/off notifiers, to really allow the consumer
> > driver of the reset-control to know when the PM domain gets turned
> > on/off.
> > **) Move the entire reset handling into the PM domain provider, as it
> > obviously knows when the domain is getting turned on/off.
>
> This option is what I've explored, tested on my side.
>
> I explored it in 2 ways:
>
> 1/ SYSC modeled as an individual PM domain provider (this is more
>    appropriate to how HW manual described the hardware) with this the PHY
>    reset DT node would have to get 2 PM domains handlers (one for the
>    current PM domain provider and the other one for SYSC):
>
> +               phyrst: usbphy-ctrl@11e00000 {
> +                       compatible = "renesas,r9a08g045-usbphy-ctrl";
> +                       reg = <0 0x11e00000 0 0x10000>;
> +                       clocks = <&cpg CPG_MOD R9A08G045_USB_PCLK>;
> +                       resets = <&cpg R9A08G045_USB_PRESETN>;
> +                       power-domain-names = "cpg", "sysc";
> +                       power-domains = <&cpg R9A08G045_PD_USB_PHY>, <&sysc
> R9A08G045_SYSC_PD_USB>;
> +                       #reset-cells = <1>;
> +                       status = "disabled";
> +
> +                       usb0_vbus_otg: regulator-vbus {
> +                               regulator-name = "vbus";
> +                       };
> +               };
> +

According to what you have described earlier/above, modelling the SYSC
as a PM domain provider seems like a better description of the HW to
me. Although, as I said earlier, if you prefer the reset approach, I
would not object to that.

>
> and the PHY reset driver will get bulky with powering on/off both of these,
> at least with my current implementation, something like (and the following
> code is in probe()):
>
> +       if (priv->set_power) {
> +               priv->cpg_genpd_dev = dev_pm_domain_attach_by_name(dev, "cpg");
> +               if (IS_ERR(priv->cpg_genpd_dev)) {
> +                       dev_err_probe(dev, error, "Failed to attach CPG PM
> domain!");
> +                       error = PTR_ERR(priv->cpg_genpd_dev);
> +                       goto err_pm_runtime_put;
> +               }
> +
> +               priv->sysc_genpd_dev = dev_pm_domain_attach_by_name(dev,
> "sysc");
> +               if (IS_ERR(priv->sysc_genpd_dev)) {
> +                       dev_err_probe(dev, error, "Failed to attach sysc PM
> domain!");
> +                       error = PTR_ERR(priv->sysc_genpd_dev);
> +                       goto err_genpd_cpg_detach;
> +               }
> +
> +               priv->cpg_genpd_dl = device_link_add(dev, priv->cpg_genpd_dev,
> +                                                    DL_FLAG_PM_RUNTIME |
> +                                                    DL_FLAG_STATELESS);
> +               if (!priv->cpg_genpd_dl) {
> +                       dev_err_probe(dev, -ENOMEM, "Failed to add CPG
> genpd device link!");
> +                       goto err_genpd_sysc_detach;
> +               }
> +
> +               priv->sysc_genpd_dl = device_link_add(dev,
> priv->sysc_genpd_dev,
> +                                                     DL_FLAG_PM_RUNTIME |
> +                                                     DL_FLAG_STATELESS);
> +               if (!priv->sysc_genpd_dl) {
> +                       dev_err_probe(dev, -ENOMEM, "Failed to add sysc
> genpd device link!");
> +                       goto err_genpd_cpg_dl_del;
> +               }
> +
> +
> +               error = pm_runtime_resume_and_get(priv->cpg_genpd_dev);
> +               if (error) {
> +                       dev_err_probe(dev, error, "Failed to runtime resume
> cpg PM domain!");
> +                       goto err_genpd_sysc_dl_del;
> +               }
> +
> +               error = pm_runtime_resume_and_get(priv->sysc_genpd_dev);
> +               if (error) {
> +                       dev_err_probe(dev, error, "Failed to runtime resume
> sysc PM domain!");
> +                       goto err_genpd_cpg_off;
> +               }
> +       }

Indeed, the code above looks bulky.

Fortunately, we now have dev|devm_pm_domain_attach_list(), which
replaces all of the code above.

[...]

Kind regards
Uffe

