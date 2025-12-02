Return-Path: <linux-usb+bounces-31107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C4C9C190
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 17:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A589349A63
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 16:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCC52874FB;
	Tue,  2 Dec 2025 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="KQIFYGTn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E0B28468D
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691550; cv=none; b=qhBSwtsjKT098SD8GPgsPA3IrOoT8cxAh1eAj8WM6J8gIObNcDqkqIWwY92ER9sND1mrX5br+lk9slghOpF91vM2MkCjt9jIq12Y0TBcj38g6NnYbTr9yx9wj5dOKyLd3oMkwHsXB3Gg9BLglrQrTTqhdlK93nCbEAYu337qjlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691550; c=relaxed/simple;
	bh=oBlUbm/4rajTOLUrUnf2zsSWelXrOsMnnCt8Bhe3JzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDcQvY3JQkjpBoIIeFDA5Dc+UpTfXutT/yltBYzF7Gp0ErriO0EZ/JIQRjQXsidD4O6BTEAqOnhEPuxz7+ogaE1EpaNnM5UkvfDqGH7zYu/SBPaqOXVKSR2vKDy0zs15tE9Af/WQ78P+CpOpWLi0oNUei1JJV/NlF3Wp/S7f/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=KQIFYGTn; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4eda6c385c0so44772701cf.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 08:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764691548; x=1765296348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iEziSNrQQn4I05oBYvzUjY2FjKsIMByhRBoiclkMFIc=;
        b=KQIFYGTnevjXpDUnDqt0jkUGh3z3F1Kw6qrgMY1NfxkuQGbUg8Kadewp5NTy9x0DO3
         ClzkpaWxuLj6F5xwEZ5KhulRc+9qJNWx/ESMUFkxDM/+26czInQ7uCn1UvqhiZDxtN0T
         8TIDQVOXUqHurcr+Uf6dU831Ya5Dr5kE95upkJPD9iC2wePhb6VHoxVraK3RzW/gOV42
         Z62OJh0SqC6RFs8eCk1NISLZrxZVOVscI/gT5KjttOpmouhB9jRNpfX1w5Z2/hj1bZXR
         jWy89pjPSf6byeId4N+nOnPSCJUKKGMAAFUP/pYlXvOyyrtpSslyWERJZj3F/MvgfT0u
         NvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691548; x=1765296348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEziSNrQQn4I05oBYvzUjY2FjKsIMByhRBoiclkMFIc=;
        b=l5jTO0lKHTtpheerKfiwhriDbIEMNiLTk8yUPH3oRXYMr6WXMFUPnwQgDaSc1QBicR
         ytumZ0NO5sWZZPmNiu8QjzxYlEc0dq0rjWStmgwQY93GoAaLFWp1bh6hUKEoY99W5mtT
         0jLJjDPBvmNpJU5Yw8t8Ka/mKxzWAaAT1PvuS54sqecwK/YJVfYaDEZ3rGfMvuXCrmIi
         JMaEjm2tuylgtgDbLeVmxQ7ndKQvBFz9D/zw0etZVtZS1o5mAhWAC9BQtLqjgftGLIh4
         9zr0xL2hETJjpPbiPTz/ldc+2ea8hfQeQefVVhYtgsi95tbZ2DROXRo422C3PT1mGSEf
         8a4w==
X-Forwarded-Encrypted: i=1; AJvYcCUkOmhQZeY3WuWr7RaRFXJX2IT8ue8XLHS2TtqmqVJ0+V/bBPY9/SJ4rdhSbve5tg8I7OJw3g1X4BM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6v57ibIIQeqVrVOtps2WSJQTLHoFywOzAEHLHKPl0DXOOvIIR
	mcd1J0Hn2TXwRD8Auj9cP1vip/Hl8POONf5TmR0/Fr7LJqi2KBlcTgJFQVZEtnMaDA==
X-Gm-Gg: ASbGncs47VA3ibw+HTbYY/NTyySy11l0v2OphAW3IiVEwApHuj5XKTRvctHnZoA6JWV
	X2gU1o/JN/oMqLyfBVjSdU1OfhAsW7PuQq8upwISz3ERmpbEChMk9/fKtzkCNqsud4dpK5Iz0rk
	A62gj33OC+GGFcq/UeOzrDbepxxbN/5QT8KW/WnM8QNgv958bgBwW35dfbeuYdx375QbA3IrtkF
	wteKBRw+HFilUfJ85KMcptM4USWeY0sf8ZSEkLMNoGrfc6+pxF1yylLiXiG2p4TKDbh01mILGLk
	nsS/d8urXNzLd+Zh9YVpNfHxzZFS6Yl87W6VxklREvai+fYl52w7n4895UPnnlf6Wks0wuAhFSA
	p9c/QnV9ly/SRhwCor3XnVWPpsD+Kjm11EjedtuBa9UWpZFoexty1RvW3sIc23ROdExh7s+NR+3
	zCY4xTRUTC4bfj
X-Google-Smtp-Source: AGHT+IHjgMbcY+byTZV1x8KfhonySSDxlQ5+BhItSw06ag+f4H5XsHVZFjDTTcOrdWE4HzLgPcTA0g==
X-Received: by 2002:a05:622a:4c8:b0:4e6:ebcc:23fb with SMTP id d75a77b69052e-4efbda58b15mr409662561cf.36.1764691548001;
        Tue, 02 Dec 2025 08:05:48 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::eaae])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd2f9a755sm96901011cf.3.2025.12.02.08.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:05:47 -0800 (PST)
Date: Tue, 2 Dec 2025 11:05:44 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: ehci-omap: Fix missing usb_phy_init() error handling
Message-ID: <7c6ed1af-46c8-425b-83a5-4692095144a6@rowland.harvard.edu>
References: <20251202080027.1124-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202080027.1124-1-vulab@iscas.ac.cn>

On Tue, Dec 02, 2025 at 04:00:27PM +0800, Haotian Zhang wrote:
> usb_phy_init() may fail if the PHY clock or regulator setup fails,
> but ehci_hcd_omap_probe() does not check its return value,
> potentially causing later operations to act on an uninitialized PHY.
> 
> Add proper error checking for usb_phy_init() calls. Add a new
> error label to properly remove the hcd.
> 
> Fixes: 4e5c9e6fa2d2 ("USB: ehci-omap: Tweak PHY initialization sequence")
> Fixes: 49f092198f4f ("USB: ehci-omap: Fix detection in HSIC mode")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/host/ehci-omap.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
> index db4a1acb27da..30b3586fd696 100644
> --- a/drivers/usb/host/ehci-omap.c
> +++ b/drivers/usb/host/ehci-omap.c
> @@ -166,7 +166,11 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
>  		omap->phy[i] = phy;
>  
>  		if (pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY) {
> -			usb_phy_init(omap->phy[i]);
> +			ret = usb_phy_init(omap->phy[i]);
> +			if (ret) {
> +				dev_err(dev, "Failed to init PHY %d\n", i);
> +				goto err_phy;
> +			}
>  			/* bring PHY out of suspend */
>  			usb_phy_set_suspend(omap->phy[i], 0);
>  		}
> @@ -205,13 +209,19 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
>  		     pdata->port_mode[i] == OMAP_EHCI_PORT_MODE_PHY)
>  			continue;
>  
> -		usb_phy_init(omap->phy[i]);
> +		ret = usb_phy_init(omap->phy[i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to init PHY %d\n", i);
> +			goto err_remove_hcd;
> +		}
>  		/* bring PHY out of suspend */
>  		usb_phy_set_suspend(omap->phy[i], 0);
>  	}
>  
>  	return 0;
>  
> +err_remove_hcd:
> +	usb_remove_hcd(hcd);
>  err_pm_runtime:
>  	pm_runtime_put_sync(dev);
>  	pm_runtime_disable(dev);

This basically looks okay.  But...

I don't know much about the usb-phy code.  Is it really okay to call 
usb_phy_shutdown() for something that hasn't gone through 
usb_phy_init()?  (Yes, the original code already does this -- maybe 
the original code is also wrong.)

Alan Stern

