Return-Path: <linux-usb+bounces-30526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE7C5F343
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 21:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BBD635F5C8
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 20:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AD0347BB9;
	Fri, 14 Nov 2025 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Ui1Q9dZL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A062DAFBB
	for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 20:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763151253; cv=none; b=azT1VzRlFbeQELaw73W6nUmxh1WtDoFprQrYbdQQoCzp6D9RdZdg5FRKflHVdbvJDclTjCU/MJExaPU4IIP7ca1pPvR9vduAPITBG6QY7kYq4599uKyy/ZAf1ZnukzXI+yimzSYgoFHB+dAki6YS7GFY/XEQFWqdVJKYGDMcFUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763151253; c=relaxed/simple;
	bh=N9Nn1Kf+jPSjwAPzNrpju3gWBFvTHHSbfMS1/aU/jVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVpYo/0o+uFuC8r7aUuonImIiBmzBpNWXym0aIEjxwr6b6MZ0wmD+s64zghrH8RDEIL4XW9avnAuQhR2J1eo6zxunwlNaPNmA4J1oSq2G07W8SaWmJ0hBoEci1KBk/MNZkFeNpn4YOKwVDMh4vysgY63yp9KcvLa4VH3F/8mSjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Ui1Q9dZL; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b2627269d5so288287785a.2
        for <linux-usb@vger.kernel.org>; Fri, 14 Nov 2025 12:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763151248; x=1763756048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPH299lzaBz+THxQ1kEgK73wlgA7iHLtfrwrMcyrnTc=;
        b=Ui1Q9dZLWd1P+UR1dJpbxrN+k70b61Au1TJbw3+MbkNxKl1OGKkI2wJ4n1AsdEE0uB
         koE4nX05ErMXx31e4SJRyLxYPRrXokVJl2uBhV+tlm9pOKLdgEwAg6YA4UNQOCFVlPuw
         MFGfD3VXOrH9w1H+E0kWZghupgYF6MCsd/eiirp/qNTb9MyEb4QY9WEUClejCK7BBdgZ
         5R1wADdyhSC72vEXDlnI5jlOL0HM7FGrs3wKjVF9c4eEJ5Lg73cnXmtHNNitnucnszvH
         G+3SjRJboRAivFnZhw/IBQO8EEF+VVmafeKeo2FMUuzxTVq3H9jd8Mp+KVoYEPdgi8IQ
         u2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151248; x=1763756048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPH299lzaBz+THxQ1kEgK73wlgA7iHLtfrwrMcyrnTc=;
        b=qjjA9Rj8RLziqlRXq/7g6gtkjAJOvuCKZt/3qi5L3kffTO1iQO63iAvJd4Zg/gaDfk
         ql2D02V2cCxF7HDjhtaU1ntw080z0OfTm7paQeEEcHzGdl/ll/oaAvKk5USXH0Isp2X3
         gojUdEAXmarJRH0mighTono9SdtfiF4cW6Tq9iYz1SztSRkEK3Dz5i+W0hxtHS1jpNOS
         jStyUJ9VQ3wLmPTFzM70gHSkS224qS03b+Mlj4zDAWVBeOHRa2DsDD7yXdDujpnGeyLm
         x6uzQ1qGH3llngyoX/dkFqs5X/imDzhtxoExzrbOKOBsqGo2G0aERw66NH2qeKbF3eYl
         G13g==
X-Forwarded-Encrypted: i=1; AJvYcCX+LxY8A1f9Cr37C2g1Vhlv+dYMIgXOYbcV0jZF20N22kVaR58DgcskIi1HMdFwvvpoVvZmM/MBXBc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyozvd+hlfRk0x3KcLMXIAJvzoUsXfnziTyGt8ItTLXXmOGFv5o
	TQmPfYkHSiGhXpBLR984EsWHVRNbrL6303JqZ9RMUe6U0fE1wgqvA288rZtmu0ywErdvt80bcv8
	6jETNfQ==
X-Gm-Gg: ASbGncsYrbi3kNJb78abXYyM7UPP2Xu3a/NJLniQds4uQlwwwkVmDTc9QidDKYJ1b66
	r5FD2UjnGWoRFgqyb7goAZHx4PKfGF5JrgOTavZgpXtpvrtXUsegbvNGcnWGQ9LM7uV4Lk58tPK
	OtI93PwTRJhij8PdGnBSiNPVHrZ7cQ4TvUgVO1UzetM5QThOOfMaIXkPA/QwCen1x9KuL/38G7v
	OzUIw3eC+9jIlvOBm5sXJHXs0gv3kfvLxfVVlRu0pRBL+W2PqGfOFmiJDDERdTemcQdDOrlrUf7
	Pz2g1hk6GWxdaiokltftlh1kuYEgVbnNrNLZbm2czuIO0NIASpFc/jKvRf1NrSGA22hyTag/nWR
	uPyNnsiJg986iHfTThXI8BLJBx3noiZYFjE6v/Fpk3RlBboFMe2HWaOU7KYvJulcsOELJaPZTHr
	4hSHVhcFgILFqT
X-Google-Smtp-Source: AGHT+IFuN7C49uR9Zqj3Kbi++21slLnoSRjYdZ0ft5dUCy/bxuSuSXRxT/6IJbD7IlKwFARUS3YoPQ==
X-Received: by 2002:a05:620a:4105:b0:893:b99:711a with SMTP id af79cd13be357-8b2c315efe8mr557386385a.19.1763151248013;
        Fri, 14 Nov 2025 12:14:08 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef3318asm399511285a.33.2025.11.14.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:14:07 -0800 (PST)
Date: Fri, 14 Nov 2025 15:14:05 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] usb: ohci-da8xx: remove unused platform data
Message-ID: <44d226ef-0d7f-491b-aa9b-aa2593bdf2d0@rowland.harvard.edu>
References: <20251114-davinci-usb-v1-1-737380353a74@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-davinci-usb-v1-1-737380353a74@linaro.org>

On Fri, Nov 14, 2025 at 07:37:55PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We no longer support any board files for DaVinci in mainline and so
> struct da8xx_ohci_root_hub is no longer used. Remove it together with
> all the code it's used for.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-da8xx.c             | 17 -----------------
>  include/linux/platform_data/usb-davinci.h | 22 ----------------------
>  2 files changed, 39 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
> index 3c5ca2d7c92ed786af41d98ed124926ae06d4025..0938c0e7a8b6d54cf1981298119d51a3bfe49148 100644
> --- a/drivers/usb/host/ohci-da8xx.c
> +++ b/drivers/usb/host/ohci-da8xx.c
> @@ -18,7 +18,6 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> -#include <linux/platform_data/usb-davinci.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb.h>
>  #include <linux/usb/hcd.h>
> @@ -166,17 +165,6 @@ static int ohci_da8xx_has_oci(struct usb_hcd *hcd)
>  	return 0;
>  }
>  
> -static int ohci_da8xx_has_potpgt(struct usb_hcd *hcd)
> -{
> -	struct device *dev		= hcd->self.controller;
> -	struct da8xx_ohci_root_hub *hub	= dev_get_platdata(dev);
> -
> -	if (hub && hub->potpgt)
> -		return 1;
> -
> -	return 0;
> -}
> -
>  static int ohci_da8xx_regulator_event(struct notifier_block *nb,
>  				unsigned long event, void *data)
>  {
> @@ -228,7 +216,6 @@ static int ohci_da8xx_register_notify(struct usb_hcd *hcd)
>  static int ohci_da8xx_reset(struct usb_hcd *hcd)
>  {
>  	struct device *dev		= hcd->self.controller;
> -	struct da8xx_ohci_root_hub *hub	= dev_get_platdata(dev);
>  	struct ohci_hcd	*ohci		= hcd_to_ohci(hcd);
>  	int result;
>  	u32 rh_a;
> @@ -266,10 +253,6 @@ static int ohci_da8xx_reset(struct usb_hcd *hcd)
>  		rh_a &= ~RH_A_NOCP;
>  		rh_a |=  RH_A_OCPM;
>  	}
> -	if (ohci_da8xx_has_potpgt(hcd)) {
> -		rh_a &= ~RH_A_POTPGT;
> -		rh_a |= hub->potpgt << 24;
> -	}
>  	ohci_writel(ohci, rh_a, &ohci->regs->roothub.a);
>  
>  	return result;
> diff --git a/include/linux/platform_data/usb-davinci.h b/include/linux/platform_data/usb-davinci.h
> deleted file mode 100644
> index 879f5c78b91a30fb05681668797a5f07c6bf43b9..0000000000000000000000000000000000000000
> --- a/include/linux/platform_data/usb-davinci.h
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -/*
> - * USB related definitions
> - *
> - * Copyright (C) 2009 MontaVista Software, Inc. <source@mvista.com>
> - *
> - * This file is licensed under the terms of the GNU General Public License
> - * version 2. This program is licensed "as is" without any warranty of any
> - * kind, whether express or implied.
> - */
> -
> -#ifndef __ASM_ARCH_USB_H
> -#define __ASM_ARCH_USB_H
> -
> -/* Passed as the platform data to the OHCI driver */
> -struct	da8xx_ohci_root_hub {
> -	/* Time from power on to power good (in 2 ms units) */
> -	u8	potpgt;
> -};
> -
> -void davinci_setup_usb(unsigned mA, unsigned potpgt_ms);
> -
> -#endif	/* ifndef __ASM_ARCH_USB_H */
> 
> ---
> base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
> change-id: 20251114-davinci-usb-a66b2b9798fc
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 

