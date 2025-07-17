Return-Path: <linux-usb+bounces-25935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07827B093E3
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 20:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389B65A2FFF
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 18:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2032FE391;
	Thu, 17 Jul 2025 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wR0OaNql"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1C2D1F7E
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 18:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752776779; cv=none; b=jpA3SEtCeHvsgeQzd937JlS/CfWhi6wj1BTBxRqlNPUFry4XrVigh8iA6uhj5qh5ewMWXrXpyFdtAeP12+njnRH3XUCIjvZ+SJ8BEqMWrgM1X7aSvxwOHjOoJE7Lnb6jbrnm5CSsV6ZWOdJInaBBolyolz5JYZ88TKcBqLhuGCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752776779; c=relaxed/simple;
	bh=ppzKDV147GTmitogPpx6ny6wCxKqzhgdhfRqK1S48s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0/wFOyPX6Y/UZIJmmdhhOOKr/lu27TEVXZ101FSLK/PCSn0WW4SuZi4ukm2zxLjmoe/JBPlJNX8M6MzV0NFN0+19l8VO1KsNesOD4M1atc5lLM5KV/0adD8xLY35SV/eQIpHa4meF58lSfggSaQgHZcrGUjtJIMK4ERbJVXfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wR0OaNql; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-700fee04941so13232066d6.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 11:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752776776; x=1753381576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asMzSG8uBnib1bvPL+c/CNdPTsqgEKsf5HJcW5YgS2I=;
        b=wR0OaNqlwS6ogIaAOMRAQRhXTm35bkb1734C3uqxgTOXnrWB4vENvxZBhTb+0BG8R3
         AQv60aIhZW9cZMQdZDB0AHtwSpoulQftLHjAc/8iq9PV9xHBfafym4+kA47/foLCY7Wt
         2ES2x6Hx6s/uUVqFUxKYziORi/7qzzrvJx8u6NGwZCuiq76CzPFZBMlh77UrChue0AFU
         J5dzLSHlWAkSYFJf7Y2PRZ+b7kSUgv/OyepmrZ6nXO4dd4NA9LbMbs30/z526p9YLRWe
         kwydkkjuFZMFJ1dEFliTpPoYfy233VAKjrc6RfjDz5yxNUc2qw6Ca/+h8cqXy5JmwHpf
         J3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752776776; x=1753381576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asMzSG8uBnib1bvPL+c/CNdPTsqgEKsf5HJcW5YgS2I=;
        b=IAFYI3b2D0i7S0IC18Wa/mrDa0vJW9MIXW6e4xvCZPww5vGxtFoAD79XbCG9EMvMOO
         Uco1gjujXw1t+Z6j+MoRpXMDCACoMLdLx/Lt9V/ZDtU3pHukll4kFXmQcZG93gbMsSvi
         3sDigHsHDEdklUNYbbSLFO8q/mBDpSw4Mxlf9XNuMFpuj/RdzKRCAmO8P9bFZcgb9wHt
         2Srf5Gf1gLNwfrF0wiROrWvbvUNZGn42vy7xEvfORk+EBFowTVgFnqBl1DWWsCd6dvG8
         /2wqQP3f+y4jn1hMhrCQ2v/5HjYmmDkC4KL/tmUZyAtgl7JogQHwvzkQ3P6N/MWUDDWp
         mqVg==
X-Forwarded-Encrypted: i=1; AJvYcCW8onzRj/E1IiUtgPN8do7TrrQM+oUcD5ro0WvcbQkF4AtPNQr7a1crQM2KdO1WJzZ5jXi4mJrIK2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Uev2rtV+k7gCVH7GleRddF/hg01K+OFZFqdjjvpgzMDy8dy0
	vKMVOejDc938/pAWuYwI5vpT83J+1rrtgIfcPd54C42RRhbySokrggjow9VNMZswhQ==
X-Gm-Gg: ASbGncsRFW+gXF67E2j+icwHcSe3GexVRoRHbVsH5Ed6xANx1A08RsvPF8vgVqqWW94
	hay5UAxLZWLFkBM58ExUscTnlnhkqC0vnTZr+Wf1Xa0KLYRyNXUaH59Psgd8zyUf9LN02iGT6QV
	g6+BnYeFHddpEj5MoFPm64QfbajND2oQTxuxaUiBzaRhvlKgjFVoK6T/ox8tMtku3h0Wy7M4TTv
	s5UY/jQcn+xC3la/OEKGkMaq4/np3oqgbUmOCmeYi7wBKHzVTVBkE7cmdIxMl9Qw8gmebZm/6IG
	6cGl/9vNBaHLVLbWlvmPwK9aDK/6czuOTpAOSx7fHe/cFshP/QHqAgvPS4FrnR5yqOUlLWRSRje
	tocfvi6APhVz2zGGfW3+kp2h7ERV5x6Yxd1TimY0KgErsfOJ+hmFbuNfjVFAp4MlyUrEvkWQjWU
	z7DqFfHAmwVRUnxfYKXoz0eNJsMg==
X-Google-Smtp-Source: AGHT+IFT29oCaTJdFJsadG73kHFw/opg93WH+GFJQnpC7OyrxX9paIy8wYX3Ql9L/lBbT3xd+BtMqQ==
X-Received: by 2002:a05:6214:5c44:b0:704:7dbd:d991 with SMTP id 6a1803df08f44-705073a31b4mr64028466d6.31.1752776776244;
        Thu, 17 Jul 2025 11:26:16 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab5b1617a2sm60760761cf.22.2025.07.17.11.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 11:26:15 -0700 (PDT)
Date: Thu, 17 Jul 2025 14:26:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Brian G. Merrell" <bgmerrell@novell.com>, kernel@collabora.com,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] usb: vhci-hcd: Prevent suspending virtually attached
 devices
Message-ID: <42bcf1e1-1bb2-4b63-9790-61393f780202@rowland.harvard.edu>
References: <20250717-vhci-hcd-suspend-fix-v1-0-2b000cd05952@collabora.com>
 <20250717-vhci-hcd-suspend-fix-v1-1-2b000cd05952@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-vhci-hcd-suspend-fix-v1-1-2b000cd05952@collabora.com>

On Thu, Jul 17, 2025 at 06:54:50PM +0300, Cristian Ciocaltea wrote:
> The VHCI platform driver aims to forbid entering system suspend when at
> least one of the virtual USB ports are bound to an active USB/IP
> connection.
> 
> However, in some cases, the detection logic doesn't work reliably, i.e.
> when all devices attached to the virtual root hub have been already
> suspended, leading to a broken suspend state, with unrecoverable resume.
> 
> Ensure the attached devices do not enter suspend by setting the syscore
> PM flag.
> 
> Fixes: 04679b3489e0 ("Staging: USB/IP: add client driver")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/usb/usbip/vhci_hcd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index e70fba9f55d6a0edf3c5fde56a614dd3799406a1..762b60e10a9415e58147cde2f615045da5804a0e 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -765,6 +765,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  				 ctrlreq->wValue, vdev->rhport);
>  
>  			vdev->udev = usb_get_dev(urb->dev);
> +			dev_pm_syscore_device(&vdev->udev->dev, true);
>  			usb_put_dev(old);
>  
>  			spin_lock(&vdev->ud.lock);
> @@ -785,6 +786,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>  					"Not yet?:Get_Descriptor to device 0 (get max pipe size)\n");
>  
>  			vdev->udev = usb_get_dev(urb->dev);
> +			dev_pm_syscore_device(&vdev->udev->dev, true);
>  			usb_put_dev(old);
>  			goto out;

This looks very strange indeed.

First, why is vhci_urb_enqueue() the right place to do this?  I should 
think you would want to do this just once per device, at the time it is 
attached.  Not every time a new URB is enqueued.

Second, how do these devices ever go back to being regular non-syscore 
things?

Third, if this change isn't merely a temporary placeholder, it certainly 
needs to have a comment in the code to explain what it does and why.

Fourth, does calling dev_pm_syscore_device() really prevent the device 
from going into suspend?  What about runtime suspend?  And what good 
does it to do prevent the device from being suspended if the entire 
server gets suspended?

Fifth, the patch description says the purpose is to prevent the server 
from going into system suspend.  How does marking some devices with 
dev_pm_syscore_device() accomplish this?

Alan Stern

