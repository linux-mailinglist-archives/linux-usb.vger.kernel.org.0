Return-Path: <linux-usb+bounces-18172-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 323839E5973
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 16:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBC3228315C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 15:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3693221D58C;
	Thu,  5 Dec 2024 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AiofJIco"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092C421C9FE
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733411546; cv=none; b=H3isyT6miotvPNDrJmZxijR5y51595BbwtNO3UhvzWwcBBu6VUJ7Y8DELOCPWrlOaNp7YPpq/zyD4UtG1VlnijxYXS7sQVSP9+EhaJcrIWO25cH/4CyDxqvfj+lrgzX/EbqPjwwdmE5TUG7KnDg/9qHfh7SMl3F1kelYETCBoJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733411546; c=relaxed/simple;
	bh=8oBlH9Skh5+tYIY+TSUzZhh7emwiSyw93vKxzSMqwEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upxyOvxjAiLHhpm03GUWshiPrRBRxvjyllDsy/jQN4lAldILXTC5BQtOvoTj4foUqSuhhw8dIr0627EZ0y20kIJ2bhpfjifRJZTAvGZEqUa+i5f+sryG63nRzSx4Z2jn9hPy9DxYjNQyAjAew5IXy0jJC6cYOYRmDQ1rbmNkyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AiofJIco; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d89dc50927so7282416d6.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2024 07:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1733411544; x=1734016344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpDuirXeCkooc6CrYIBSyW5CbLWq2iPbUdPYDNgR92g=;
        b=AiofJIcoWSSwqw1GEGpOT6SRUMSujaBKPHcX+5hsMedLEoE3U4ASkENK17O8lHZ88u
         rbfsTo5YXQ/FRACXrqjGC8M3+Xz+y/HYuwX+Yf4BVdLBWgGUUn/40jq/vhwC79h+nBGW
         w7ywSB0euUeQ/qLNYAN0TpK5MqvOEW3J+OcCer2YnUmsfTa/3wKbKY09im1dtM0Dnah9
         Kyc86sf3bvrgGBOhYnmCuTnuJGJHNtMDFfDwHBQ1sJxbAsQ3+Cxy7XfvP4PoTWlmgO/b
         NJ2A1sD7It7jHoEYP4eouapDbmoVQgV/SxrASnqcafh9W60H79vU1f1AcH1vWE8xTUjY
         +9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411544; x=1734016344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpDuirXeCkooc6CrYIBSyW5CbLWq2iPbUdPYDNgR92g=;
        b=Ntc0CYqNgbuoCRKRlsX4a3pyk6I3640WZbbz4Zbz7MIQJMSFEuByT0vc9gDISucYqz
         G8hc1Tz2RwOqb4BG1o/ZSl6vCCGbUgszdIVa9YESfXTxr/lbqJEDalLz1ieX37EyHr7Q
         gyWClTwg5yQaAAF51St1jYTrMjk7FGIkudNOHtU4QE1uqOaJ/v4Bc3nuJV9aG6OBEPeI
         W1eOrMNO1qrNJ44+qSGGcUurgMMI6XxU7VB+TZabkgFRW9JSD2u/JFZ21CwS3Qe/uiy5
         IGWp+zUQM7zkhknSHMI8tthBavZc2XrlvG6hNPo8Wo/sec3Nmj8UV5zTKIYD+HifC7+v
         dZaA==
X-Forwarded-Encrypted: i=1; AJvYcCVes3FKDtQJfuYeVhOUzjA8QFAmngZCwcc7fL58BMs/aDjdQgsmY4wom5oCZks3g4jasjjppSfb8xk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYbo6+nMFwHzutNsyYNoZTbYPdSJ6cRG7GtnppxqU5B6hXAhP
	yfTy16RzemwV+9eiwGqOiRvwCt2EfPVxTUmHW5P5XCQrDN1IJy77v45xfO3lgQ==
X-Gm-Gg: ASbGncvzCX2O1e4jyR5gaJafQilbResAX086vOt5mn6O7dYB1HXHdV6QwU6doNuaWV9
	CviN2KI71Ed6M4hDQpFBskNCnIcM2KrqhtR2prJl8qL/VIMelkbq9/3V5rgGc4xT7X8aeHNjtrL
	MUEfBNCvSiEYorcyN8FBVtRYdH8CzqOfjl3cRBCvkVvFYPjM/p0cK/MAx3JwLOrjlsvG+vDcjF2
	pKJaVZweEl6tcRNOqeiHuG1WBh4WXp2nTaPLtJAY05PSn3E1EU=
X-Google-Smtp-Source: AGHT+IGMhfCAwtSQVxKuS1TWRYoQx3MDjyra1gBdo8y0EUiz1ShXMjGXkrxghW12qu50gM/TSSZqXA==
X-Received: by 2002:a05:6214:29c9:b0:6cb:e648:863e with SMTP id 6a1803df08f44-6d8b7454e0emr157169546d6.43.1733411543697;
        Thu, 05 Dec 2024 07:12:23 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::d4d1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da66ddd4sm7370816d6.9.2024.12.05.07.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 07:12:23 -0800 (PST)
Date: Thu, 5 Dec 2024 10:12:20 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Deepak Saxena <dsaxena@linaro.org>,
	Manjunath Goudar <manjunath.goudar@linaro.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>, stable@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-spear: fix call balance of sohci_p->clk
 handling routines
Message-ID: <81c02947-5617-4ab5-a8bd-56349b9929f4@rowland.harvard.edu>
References: <20241205133300.884353-1-mordan@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205133300.884353-1-mordan@ispras.ru>

On Thu, Dec 05, 2024 at 04:33:00PM +0300, Vitalii Mordan wrote:
> If the clock sohci_p->clk was not enabled in spear_ohci_hcd_drv_probe,
> it should not be disabled in any path.
> 
> Conversely, if it was enabled in spear_ohci_hcd_drv_probe, it must be disabled
> in all error paths to ensure proper cleanup.
> 
> The check inside spear_ohci_hcd_drv_resume() actually doesn't prevent
> the clock to be unconditionally disabled later during the driver removal but
> it is still good to have the check at least so that the PM core would duly
> print the errors in the system log. This would also be consistent with
> the similar code paths in ->resume() functions of other usb drivers, e.g. in
> exynos_ehci_resume().
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> Fixes: 1cc6ac59ffaa ("USB: OHCI: make ohci-spear a separate driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-spear.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
> index 993f347c5c28..6f6ae6fadfe5 100644
> --- a/drivers/usb/host/ohci-spear.c
> +++ b/drivers/usb/host/ohci-spear.c
> @@ -80,7 +80,9 @@ static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
>  	sohci_p = to_spear_ohci(hcd);
>  	sohci_p->clk = usbh_clk;
>  
> -	clk_prepare_enable(sohci_p->clk);
> +	retval = clk_prepare_enable(sohci_p->clk);
> +	if (retval)
> +		goto err_put_hcd;
>  
>  	retval = usb_add_hcd(hcd, irq, 0);
>  	if (retval == 0) {
> @@ -103,8 +105,7 @@ static void spear_ohci_hcd_drv_remove(struct platform_device *pdev)
>  	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
>  
>  	usb_remove_hcd(hcd);
> -	if (sohci_p->clk)
> -		clk_disable_unprepare(sohci_p->clk);
> +	clk_disable_unprepare(sohci_p->clk);
>  
>  	usb_put_hcd(hcd);
>  }
> @@ -137,12 +138,15 @@ static int spear_ohci_hcd_drv_resume(struct platform_device *dev)
>  	struct usb_hcd *hcd = platform_get_drvdata(dev);
>  	struct ohci_hcd	*ohci = hcd_to_ohci(hcd);
>  	struct spear_ohci *sohci_p = to_spear_ohci(hcd);
> +	int ret;
>  
>  	if (time_before(jiffies, ohci->next_statechange))
>  		msleep(5);
>  	ohci->next_statechange = jiffies;
>  
> -	clk_prepare_enable(sohci_p->clk);
> +	ret = clk_prepare_enable(sohci_p->clk);
> +	if (ret)
> +		return ret;
>  	ohci_resume(hcd, false);
>  	return 0;
>  }
> -- 
> 2.25.1
> 

