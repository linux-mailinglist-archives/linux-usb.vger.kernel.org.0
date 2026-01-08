Return-Path: <linux-usb+bounces-32086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17BD066BB
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 23:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6924301C085
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 22:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A562EAD10;
	Thu,  8 Jan 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cXye81nn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4FF1E5702
	for <linux-usb@vger.kernel.org>; Thu,  8 Jan 2026 22:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767911044; cv=none; b=i3SnBwhGi+74g3XEv7ivz6LLJIK4NlG3YOXwzw67OajfUsKAJe48002JNF3eZrEcle/z67jTmS4k5xCYFkpMq5tq2CjYSqpV2F7Uh9okyWW0RvqYjZCEqEAJzVAgt2LVHTlaMW5xLJ3NYV1T6qGxZ35K6RT0rVTWpvKtf9XFicM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767911044; c=relaxed/simple;
	bh=I2ASBt5WzxUvL2f8lRIbUCnGbCxz4qjQX4fW0+nMsnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEluEfiGs3T9qbaiRs3IeQXAS8J9Lk5scn30aWw68t0DtumMxd3byntRzU7Nn4fVyxSiQeLOF3osQUkCcR1Gx3Ec4qtffdfkwD/J7cXm2hSmbxh+ZuuKboxRoXtj4ag2kjIRapOvTPARoUo2gea9NIifVT+jP/hz7govBAABd2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cXye81nn; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-88a37cb5afdso28727116d6.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Jan 2026 14:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767911042; x=1768515842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UiTRVAbrj6is/9Oq2Hlw4iDh703dXLRsUzumjb3o4L4=;
        b=cXye81nnljRtMpoF6iMSjc55fgd24VOtXeOYPixFnhPCucxGPIioM+me+VLTMJkl43
         c5aHEhJkoxkDDNs917C6qsKXYRuiUZ2QPyW92M24hNSUTfF+SNAll68hFmKLwxNHTXgF
         bc/ixgPn7jOzmQWGwQ6/sKp81c4NCQz5/h4MqVNwCp48eH0yMCWT6OoL6owLce3d+UV8
         fP0nbmyCvYBUd9txC7ZGp7HVd3/W5Vaw/XEDmoiNlhJgfX4W8sJBFY4ze43Vvx4iOP1P
         eSrcgkDnULRNnV8urvealnLx4EGsK8m9CEH8CUvstguFuTr+M66WMdXUZ+lCDWaEkGNQ
         eupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767911042; x=1768515842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiTRVAbrj6is/9Oq2Hlw4iDh703dXLRsUzumjb3o4L4=;
        b=epESOOB7OOu2dSmc9NLize04Q0/hE2QSf0OeHzxEcfManSuDC50ocMMbafqOV8TJCS
         StzR2UDWmE48wBGE2HY+HP58wuvuhyAPh0XD4QgS/WmA9sv9XBm8/om8Ppygmipjnf5l
         Vi0Eh410ehM7xHm2Cri0EZ29Mhdbd1UstPuibC2OZGIRZu/ujP2TvS//p0WSyPp/6e6X
         mqD/Wetil+QxuJDqS0bntVITlqznxihmPS37/Qf0cBcFWERXiIYneMex81Xec8AmztbV
         jIeb+UYWSTPxWNJ2ixf7OH3OGxj9771fJyFlRgE0NSq27hL2jS4lanqiC0f097KafXgA
         f9qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGN5DDgDfIKayylfDd2KRMAc9KTTmxhM5uSuVtFHQlLUo5+pzQA8MnxKc1Vn/kezW2C9JTl8uND+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGYUV+YQceLRU+T3q34ny9gfH6GLBttuBJLoL4zVyg4wIzSprU
	RK+CQxvpq1hd6mFFWLS8c805qZPRzTBLmaVXMxu7/msxwb7AF9vZbQUFpXPL6cVF3g==
X-Gm-Gg: AY/fxX7SITPCRH4hUtlG5FqOT6v5J8/JADCpmQ6JyvrKn9//anbuaQGP7qTYiLypChh
	0fZHsleZUobAjQu/AfM6fdVKB5EdUXTDMoz0CpOEErqa5VuqtIO9gVtfULNSucLynTEAAwri8dO
	fy58XeDqJEp3+hQNPcCI+ujfK9heaTORWvBaRe+DNNMCr5Sz88EortVXNo8B/XPZqBJqX9jHt3r
	sZoLZsOdRtcxL3PTL3jRVfM45hhwef6vlG4pgY3fBzhyfMCsJzPVYvy5Y+AUBBqxNAvDxKTisfA
	9iBlV/Srjt5FTqQRXIbIqwdqYJUvbfyf2rTN+ZlGjpiN89BieBw0+BcIJyrT7WlLZYKj6ZrX4AC
	LCBR71Q8fUPUgj4futHcqE4Iba9vuZjfX/NTHYYJ7vK+3e0fJOl+Z6nf8dp3bdAgaK+nUYTL9t8
	/7S4WeIUKCz3K3
X-Google-Smtp-Source: AGHT+IEOtvC/aZoCplUX3kd8jEzZXYPQO3qJFlMEQRr5ID5ViMIVLWauunAFlwaXAOnW9tbyImYzCA==
X-Received: by 2002:a05:6214:5343:b0:884:6f86:e09a with SMTP id 6a1803df08f44-89083c364aamr111850416d6.6.1767911042068;
        Thu, 08 Jan 2026 14:24:02 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e20bcsm62516066d6.15.2026.01.08.14.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 14:24:01 -0800 (PST)
Date: Thu, 8 Jan 2026 17:23:59 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Kery Qi <qikeyu2017@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: hub: avoid NULL deref in usb_disconnect()
Message-ID: <ab8e4864-8b84-45a5-b5ff-b846813d70ba@rowland.harvard.edu>
References: <20260108220437.1930-1-qikeyu2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108220437.1930-1-qikeyu2017@gmail.com>

On Fri, Jan 09, 2026 at 06:04:37AM +0800, Kery Qi wrote:
> usb_disconnect() assumes that usb_hub_to_struct_hub(udev->parent)
> always returns a valid struct usb_hub when udev->parent is set.
> However, usb_hub_to_struct_hub() can return NULL if the parent hub
> is already unconfigured/disconnected (e.g. actconfig == NULL or
> maxchild == 0).
> 
> In that case, usb_disconnect() would dereference hub->ports[...]
> and hub->child_usage_bits, causing a NULL pointer dereference and
> kernel crash during device disconnect.

Have you ever observed this happening?  Are you certain that it is 
really possible?  (Hint: Does hub_disconnect() call hub_quiesce() after 
setting maxchild to 0?)

How did you discover this problem?

Alan Stern

> Guard the hub-specific port handling with a NULL check and only
> touch port_dev links and the child_usage_bits/pm runtime reference
> when a valid hub is present.
> Fixes: 7027df36e418 ("usb: resume child device when port is powered on")
> 
> Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
> ---
>  drivers/usb/core/hub.c | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index be50d03034a9..444e04ea433e 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2348,19 +2348,21 @@ void usb_disconnect(struct usb_device **pdev)
>  	if (udev->parent) {
>  		port1 = udev->portnum;
>  		hub = usb_hub_to_struct_hub(udev->parent);
> -		port_dev = hub->ports[port1 - 1];
> +		if (hub) {
> +			port_dev = hub->ports[port1 - 1];
>  
> -		sysfs_remove_link(&udev->dev.kobj, "port");
> -		sysfs_remove_link(&port_dev->dev.kobj, "device");
> +			sysfs_remove_link(&udev->dev.kobj, "port");
> +			sysfs_remove_link(&port_dev->dev.kobj, "device");
>  
> -		/*
> -		 * As usb_port_runtime_resume() de-references udev, make
> -		 * sure no resumes occur during removal
> -		 */
> -		if (!test_and_set_bit(port1, hub->child_usage_bits))
> -			pm_runtime_get_sync(&port_dev->dev);
> +			/*
> +			 * As usb_port_runtime_resume() de-references udev, make
> +			 * sure no resumes occur during removal
> +			 */
> +			if (!test_and_set_bit(port1, hub->child_usage_bits))
> +				pm_runtime_get_sync(&port_dev->dev);
>  
> -		typec_deattach(port_dev->connector, &udev->dev);
> +			typec_deattach(port_dev->connector, &udev->dev);
> +		}
>  	}
>  
>  	usb_remove_ep_devs(&udev->ep0);
> @@ -2385,8 +2387,9 @@ void usb_disconnect(struct usb_device **pdev)
>  	*pdev = NULL;
>  	spin_unlock_irq(&device_state_lock);
>  
> -	if (port_dev && test_and_clear_bit(port1, hub->child_usage_bits))
> -		pm_runtime_put(&port_dev->dev);
> +	if (hub)
> +		if (port_dev && test_and_clear_bit(port1, hub->child_usage_bits))
> +			pm_runtime_put(&port_dev->dev);
>  
>  	hub_free_dev(udev);
>  
> -- 
> 2.34.1
> 
> 

