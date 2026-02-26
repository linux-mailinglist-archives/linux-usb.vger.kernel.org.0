Return-Path: <linux-usb+bounces-33742-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PAgCmxroGk3jgQAu9opvQ
	(envelope-from <linux-usb+bounces-33742-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:49:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D31A914D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95DF531B3BDF
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 15:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4503EFD30;
	Thu, 26 Feb 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DL9tDrvn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712F73EFD13
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772119887; cv=none; b=ElUTUQrKvvTXMq/JI9KaNVsIKvSFM7cG+3yWzjoGkrvx7PAnPv+SwCE7CK3MwiqNU3ilww1Res4IOLggrViKxOrRFLJlxLiheXtgI/vzY0JHUSALO5BjdmYDXQzU5rTsGPEgDu+NXyAUAlaMKrVhRVivjfL3bAq838ICuedL2/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772119887; c=relaxed/simple;
	bh=tS/5+s2qy96s4nfeia8V6t/o4A6nX2pPB5PckP91eFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KH30b//nOwGJkAoVlHH3ojWdSqL8aLMUM4Y/n3eR6UPk+IeIyCH/ZbscuniC5bTMI+72OLZUURVvGIgO0KqgVvV0BaugeYy94WnqhLp3FzURtYGv+xyW/7ujI5EBHLLAuBqZ4Fqo+x9wAo5Ka5eMeE5dLnvA9GMmbgvrbkC3O2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DL9tDrvn; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb39647a70so87153885a.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 07:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772119884; x=1772724684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N6X/gMmY66SWl2eWr1aMLFZgJdYPA0TPgB14Mg4UwHM=;
        b=DL9tDrvnn0gYsCmPUE64hc3Sa8yisVzNJ3oMipyD7m12k/ZP0d7hYbFxTVhCgKD56i
         6sF3wex/6rRvXtY7o1pXD5LpytT+FWzLYG+1TX4C6SeO+/kcmGEb8dx/tdkqx/3055R4
         LNJUGohHJnDXUOsFOTaTQNCM9jtSSTu0Kq7g2+/iKzdVDK+kHujIGVMuoptNZLqc7yZC
         CipfBUBJOxpt77/EVjTW324N1iPjKeVk5/PWZI17LRBHAfPcKO/rrFySN0u1kNsJ74lu
         eyyda2+R1i+gBL+bfcn4WsDnOqzZ+67CXAFywouDtwId0LCtOlTxE6Q4m3MB5pOarQea
         3+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119884; x=1772724684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6X/gMmY66SWl2eWr1aMLFZgJdYPA0TPgB14Mg4UwHM=;
        b=wtSLB1AgEFsN9sRO1xHSFyxRHmSShlQwh0G5MHgdMD7lxj7Hy6B7AQszhXp956JeVa
         OWjK1sH4Zw5ypIyLrlVtp51jQdfoi6YcPb4eLgob38a3vAcofUgiXo4P6cGw4p30+VPm
         tGTc9ZwobXoSawj9Erdl5fonHg2ZxMRM84pnJBbfZ0by6TN/9tHgs8yCyBZG0q7SkGp7
         1DsqngZuTPKqT/R5jlDwY+kRadmQGhqXbr0OoQiQg64KihPzRHVDZdydtXQdEFokxh5O
         nfNEKxJDiHuU92RMO6LMLYxRLeeGWp42k3ZeJT+OZnkQAWMdHvqf4xakAseXxjP2WFmr
         os1A==
X-Forwarded-Encrypted: i=1; AJvYcCUvjkOO9DCOO2ZaDl/s7orAjf3WgACZFu372GB+Lfo+ko1aXy4v3Rien0eA55x3rYs0zEXz8Gny2ls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk0fCGr4mr2ZmcRTfSFYaOb+qc9HQx25zW6dicKa3D1YdKiop6
	fNZoeyqzpiDk2Uk8cX40uLgvG/cC/1JSuuOEJqmyXkabNkKhF/LP+Eo/z+hTF/fF9IXS1wJ1CRX
	7eyk=
X-Gm-Gg: ATEYQzxJ4hCljNDcDaggm+aD0m9U5pkt5X/obiI3mHPRSM5jumSnSlYOg9QDGjuNO4E
	Pi4rpmztxTREDDDTeGfAZAqPAYb0p/B0sesAzHHlEJUXEXAE4P/Yr+wjjQXqnRnWv5WFtJdf9so
	+MDyAB/ww5txNgjTe6hqWnPJ7EaPk2Csq3i8qKa6Eb2BLnXPxUoAOoL1O7tWJXtjNg3Q47wy5qv
	21IZvtNZQ1Mvi67PGPTb/Cm2Fh8aNGe+FvxPI/rjU+nKTK9J40kr7PvkyC6pKPLaZVC+N42M/Qi
	PrQgnh0IKKA5jdJti0SRwNfY/Q2/VKUoE3LSOHFgOztI6GFkku2kKmeW2FeefvjNM23OsvqvgXp
	VzgDm71OlNDwNUeL4Wik/RV/RSCISgc3bEVqMnz8++CHxvRMNmlqUOIgVZME3R6fbeamJevMUtR
	UeC5e7Ho+ekdHJdWeMcDJrYm9xS7dPvfOXZs9D/q04pw==
X-Received: by 2002:ac8:7fc9:0:b0:506:a617:175a with SMTP id d75a77b69052e-50741f2cff7mr64283101cf.22.1772119859896;
        Thu, 26 Feb 2026 07:30:59 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ab3f52sm22311771cf.22.2026.02.26.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:30:59 -0800 (PST)
Date: Thu, 26 Feb 2026 10:30:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: new quirk to handle devices with zero
 configurations
Message-ID: <69dfd06e-3745-463d-a634-c6eaf946d962@rowland.harvard.edu>
References: <20260226094737.1306471-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226094737.1306471-1-dengjie03@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33742-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 8D3D31A914D
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 05:47:37PM +0800, Jie Deng wrote:
> Some USB devices incorrectly report bNumConfigurations as 0 in their
> device descriptor, which causes the USB core to reject them during
> enumeration.
> logs:
> usb 1-2: device descriptor read/64, error -71
> usb 1-2: no configurations
> usb 1-2: can't read configurations, error -22
> 
> However, these devices actually work correctly when
> treated as having a single configuration.
> 
> Add a new quirk USB_QUIRK_FORCE_ONE_CONFIG to handle such devices.
> When this quirk is set, assume the device has 1 configuration instead
> of failing with -EINVAL.
> 
> This quirk is applied to the device with VID:PID 5131:2007 which
> exhibits this behavior.
> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  drivers/usb/core/config.c                       | 7 ++++++-
>  drivers/usb/core/quirks.c                       | 5 +++++
>  include/linux/usb/quirks.h                      | 3 +++
>  4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..63e6d3ebbd7a 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -8183,6 +8183,9 @@ Kernel parameters
>  				p = USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT
>  					(Reduce timeout of the SET_ADDRESS
>  					request from 5000 ms to 500 ms);
> +				r = USB_QUIRK_FORCE_ONE_CONFIG (Device
> +					claims zero configurations,
> +					forcing to 1);
>  			Example: quirks=0781:5580:bk,0a5c:5834:gij
>  
>  	usbhid.mousepoll=
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 1cd5fa61dc76..f60fed224cbb 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -927,7 +927,12 @@ int usb_get_configuration(struct usb_device *dev)
>  		dev->descriptor.bNumConfigurations = ncfg = USB_MAXCONFIG;
>  	}
>  
> -	if (ncfg < 1) {
> +	if (dev->quirks & USB_QUIRK_FORCE_ONE_CONFIG) {
> +		dev_info(ddev, "Device claims zero configurations,
> +				forcing to 1\n");
> +		dev->descriptor.bNumConfigurations = 1;
> +		ncfg = 1;

What if a device claims to have 2 configurations but the flag is set?  
This will cause the kernel to ignore the second configuration.

> +	} esle if (ncfg < 1) {
-----------^^

Clearly you never compiled this code.

Alan Stern

