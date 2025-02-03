Return-Path: <linux-usb+bounces-20022-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B4FA25F74
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 17:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F173A7999
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 16:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BAA202C2F;
	Mon,  3 Feb 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TaioHuJd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E51D63DD
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598563; cv=none; b=U/FKpU96SGJn3ufn4WGDOSesH0lu28R6kAmNARrgGyGAvVlKWm4B2Ey1bnFtY9MMJDzRFxwmb+EFcoCEfp+NLd4a6YC5kC6Wxetedxpm7GF4vql4ZpOgH+JGX7VQO3ErTxQReS8cTa2/VoFiI/6+6T2kjZzCqApM/SOZh9rqfkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598563; c=relaxed/simple;
	bh=sDk+aBkk9q+OypnxJbdPIdTa9fK9F+Kj7CyFeHwcuUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsBmW3DorRA5Z0CghrWcD542+7ro0oOj4nMkjanQGv1kmKKKFmSqTfSSRkRjpwpHc05C6MzNRf1gAseJqAiTzuBBn1m5LOQMMXNbGWohseZh0EgNJKhAiObJEpQFW3zIuMUyfNbbW3DwAzinobRDvXz8ecHKO5jXQxAJEFeTIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TaioHuJd; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46e28597955so41295991cf.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2025 08:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738598560; x=1739203360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6y7ZNUaq1V6kS4V4CjLbL07j92Sevuw+/xeWgjypQrQ=;
        b=TaioHuJdQRVwxYmDvIiytqEDmGZK4FdJ2HSdNNI47A4TfHxYrjs7Req92VKYcuNSQn
         Z9C06f2SRIEAMw8wiHYq/2ohWo6aUn1qGDRBoV3Dal1IZXFmrsRowTE1fiEvauIyw3Ei
         yyeDp81WgInFIZU3SRvhGzfXQkIy/CpjXEK5JK26vSRSJCb5O+4+CiMhTEGdsUi1uUip
         Zix3FrP86SpERYkwep4fwm+Z1Clm9+ro5gvaogI3ZbDtV6iJMRh65z1tVXBeXwxDYLpg
         Omsb+IJlgqA8qGj6kdoY6j3bZcakzfys34UdB+Uog1xpr/TVqm6TrFh1rXyHupZ7hA6J
         UtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598560; x=1739203360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y7ZNUaq1V6kS4V4CjLbL07j92Sevuw+/xeWgjypQrQ=;
        b=WfoI8ylk5TMn1d3VZ9EpLDPdobIdtAq8NyjXQHxWYJp4ibyTnSlR4e5FupPJV3nN9S
         I+Lo6FA9kf9+LTeKTQJvvxZ6Bhpj5VEsjKcDLTCJcEg+/9Uq9ZRxWaYFKosewAEc8sQr
         oRjaopPJBQpLylil3nWMZghB+b6u6nx6oc1msebt8cnzcFpGghhxQT+mM1vMnxTNg59f
         3bNs4nHSHm2pw6PyTYce7/W+5SP7bfipx8MRQfrLepTiT2YlLVttq8wBamcUYkNrZrBQ
         WpnFoeGkAktm9OEg9j1J8nirBVNr94ZfeGnbmQaGkS9TVjqIk0JfwiOjTlcKcgNr+axI
         GHiw==
X-Forwarded-Encrypted: i=1; AJvYcCVVbFi2AaoZjVT4aX2jyFD7I2cYcjIxyshoxWRVkYshsaiHwD6hm6vsILhLFdxiv0tjXdDIYkszf3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFD2gUkbtaqzzZD6lKppjGNZ4TBuf7RVSu32uZVSDubgL7OQy
	SXzDAxIRLy6dqYBwwjtH9S8HiidvtKjZOyDXaLI0npg5kCfPpV90w0j1+e03U+6dUeX2END+yE0
	=
X-Gm-Gg: ASbGnct/tNCtTkVa/140XdO5szMo6LmjcdHH3e+r0GyNGQF8EafWgzrBK0pmAW2FTfK
	UD3Kjj1KU38iMYgDIPa3+EfqVRpu1wZxXok4YQO9midZgq5WL9HefsPuHT3ilL7002Bk3KQxVgL
	jATEJnsnJwxv55tjICuFouySfbH+8gAaCbKj9XEQLf46WMdyAsXA29NbJSYBPqUFPmHhNb+Hxuk
	84p0LcNBgynvFFsWbD3mthqf6vZdEVY/eloc7/QCQDL9DgYqJV7+zoiAxC5ub2WfbF3Nh+uyM0h
	W2AAZcW+yZ3qE+AqsC8/I1jaOMVnY8cU6g==
X-Google-Smtp-Source: AGHT+IFcbbmmge+3vZw0NuSyEFXhPY//WibCANRMTGQbBY4sp5JCdlKvRshBkh9waSTBcHXSETI5Uw==
X-Received: by 2002:a05:622a:118c:b0:467:4fc5:9d72 with SMTP id d75a77b69052e-46fd0b6b823mr283818731cf.36.1738598559880;
        Mon, 03 Feb 2025 08:02:39 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1740bcsm50017611cf.64.2025.02.03.08.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:02:39 -0800 (PST)
Date: Mon, 3 Feb 2025 11:02:37 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: gregkh@linuxfoundation.org, francesco.dolcini@toradex.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: core: fix pipe creation for get_bMaxPacketSize0
Message-ID: <aa0c06f6-f997-4bcf-a5a3-6b17f6355fca@rowland.harvard.edu>
References: <20250203105840.17539-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203105840.17539-1-eichest@gmail.com>

On Mon, Feb 03, 2025 at 11:58:24AM +0100, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> When usb_control_msg is used in the get_bMaxPacketSize0 function, the
> USB pipe does not include the endpoint device number. This can cause
> failures when a usb hub port is reinitialized after encountering a bad
> cable connection. As a result, the system logs the following error
> messages:
> usb usb2-port1: cannot reset (err = -32)
> usb usb2-port1: Cannot enable. Maybe the USB cable is bad?
> usb usb2-port1: attempt power cycle
> usb 2-1: new high-speed USB device number 5 using ci_hdrc
> usb 2-1: device descriptor read/8, error -71
> 
> The problem began after commit 85d07c556216 ("USB: core: Unite old
> scheme and new scheme descriptor reads"). There
> usb_get_device_descriptor was replaced with get_bMaxPacketSize0. Unlike
> usb_get_device_descriptor, the get_bMaxPacketSize0 function uses the
> macro usb_rcvaddr0pipe, which does not include the endpoint device
> number. usb_get_device_descriptor, on the other hand, used the macro
> usb_rcvctrlpipe, which includes the endpoint device number.
> 
> By modifying the get_bMaxPacketSize0 function to use usb_rcvctrlpipe
> instead of usb_rcvaddr0pipe, the issue can be resolved. This change will
> ensure that the endpoint device number is included in the USB pipe,
> preventing reinitialization failures. If the endpoint has not set the
> device number yet, it will still work because the device number is 0 in
> udev.
> 
> Cc: stable@vger.kernel.org
> Fixes: 85d07c556216 ("USB: core: Unite old scheme and new scheme descriptor reads")
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
> Before commit  85d07c556216 ("USB: core: Unite old scheme and new scheme
> descriptor reads") usb_rcvaddr0pipe was used in hub_port_init. With this
> proposed change, usb_rcvctrlpipe will be used which includes devnum for
> the pipe. I'm not sure if this might have some side effects. However, my
> understanding is that devnum is set to the right value (might also be 0
> if not initialised) before get_bMaxPacketSize0 is called. Therefore,
> this should work but please let me know if I'm wrong on this.

I believe you are correct.  This is a pretty glaring mistake; I'm 
surprised that it hasn't show up before now.  Thanks for fixing it.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

In fact, it looks like usb_sndaddr0pipe is used in only one place and it 
can similarly be replaced by usb_sndctrlpipe, if you want to make that 
change as well (although this usage is not actually a mistake).

Alan Stern

> ---
>  drivers/usb/core/hub.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index c3f839637cb5..59e38780f76d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4698,7 +4698,6 @@ void usb_ep0_reinit(struct usb_device *udev)
>  EXPORT_SYMBOL_GPL(usb_ep0_reinit);
>  
>  #define usb_sndaddr0pipe()	(PIPE_CONTROL << 30)
> -#define usb_rcvaddr0pipe()	((PIPE_CONTROL << 30) | USB_DIR_IN)
>  
>  static int hub_set_address(struct usb_device *udev, int devnum)
>  {
> @@ -4804,7 +4803,7 @@ static int get_bMaxPacketSize0(struct usb_device *udev,
>  	for (i = 0; i < GET_MAXPACKET0_TRIES; ++i) {
>  		/* Start with invalid values in case the transfer fails */
>  		buf->bDescriptorType = buf->bMaxPacketSize0 = 0;
> -		rc = usb_control_msg(udev, usb_rcvaddr0pipe(),
> +		rc = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>  				USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,
>  				USB_DT_DEVICE << 8, 0,
>  				buf, size,
> -- 
> 2.45.2
> 

