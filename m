Return-Path: <linux-usb+bounces-20012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB5EA25EE3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 16:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E257418813AA
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 15:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB91208995;
	Mon,  3 Feb 2025 15:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EpMeEInk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710133595E
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596948; cv=none; b=K98YXBOCOpYEfH6+QZQkrCHlBe974vyvAlSUtLxxMmgfNAazUNX6HJI9guDHrNmNSfBdNZpQkGdg+BN8uOGcij/czrlDyVJQz5xY1/lVUvvIZ6qtVnXoaM3YoYz13xn0tq3jTyVbZltBfvgBlTAH++IrW+EIOSjTJjZcKZeR8Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596948; c=relaxed/simple;
	bh=XehIwTuknn7FCbZwwZInVK3b6aQCcEVLducKWiwrs2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVzgNLO45F2ldRAuv66bO2G+OoKJqdeHPt4+SiRssN4M+nV+ecW+B7yKMkejhc5Lt4B5fkZoG7VoWNDUikskhbgrcCCIG/qW1nDmmV4MxbA9QN6eRC32Isxi3Xd4+2T41dTI2RF902e+9jABm1VwU0mhi0Bgum0SE/JK3xLU3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EpMeEInk; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467b955e288so49040521cf.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2025 07:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738596945; x=1739201745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1EL9kWAEXdueWDYWhHxrXg5zd0uBuSWy4eRFrMfEKQ=;
        b=EpMeEInkiT5GkSmdheX2EDvY+UQ5kvrAAigQHIkkfSeuoriKe5w2v6oaJ70H7KC3sw
         F0tNpHhN9TOnkZ2x5X/VxaAxTnEVqptGcn3tC7MxaftBOa8f6H+y7d+09ikcKc93v6ph
         znt9b1Ekod1RWtrWOwkZaWd7GPVUoQZtYE+dJARMduzCJlfxNPs7sCVMSnBVkS28zNC1
         r50k795nPKIQenZT1u1+pADLGXDkzRQ1QtmHcaQUr+ZdqGGIN6RUMXlh1aazmLIpPmgJ
         kaS4tEIbGU3eDuZqaHFL8aUWKimMHROSPGazw4B51uD8NjUCFjaIQFBi+qV4iUibMIyK
         c0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596945; x=1739201745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1EL9kWAEXdueWDYWhHxrXg5zd0uBuSWy4eRFrMfEKQ=;
        b=ADrqVaFknZ6Og25m9qAywIg10heqrnWuExgPtkuAdw+U4qtLEhcbz2zgm+Aar8DEM8
         vb/41HwkSkjr4+2ew69Z6iYQYgE9eTvAOeFE4qLMuIN+rtY5BzDu4opfTuyw82gg2agP
         OsUorNlp/kr3G4zzoLReB/O2E/fumcoK00vuSwx9US/NMjJUMJBzT+u8KXCMP9LYbApo
         YE2Eyb+8rJ2MCN6MedIqixBdNehlv2UTY0tKXuWWq7L6dxus5YRur4XazVz49Aan3M2C
         6rK6/pd3BqfCWSRD9P7ThtaNJNjVQKqn4VMTUMFwnGtbyOM2lPYu0nLcpmnd/7ygoxQY
         9iNg==
X-Forwarded-Encrypted: i=1; AJvYcCWU7CnNIy7kDWF97J0NhkNCJcniUdIWvDnts+MJvgJJymKW1cw2V66iYHkkldjgmG6/mt2zIs9XEoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Ih0qW3r3ZW+0OCETFhedb2Z28o3khJbx/myc4dKZY62XVS0T
	npgiX+ThRVy4VGcHvyiO4tCQOc1B9TY5fi1k+CdL46towo49COlnWUVBh0gXv7M0DTluQFEQ72w
	=
X-Gm-Gg: ASbGncuPal9n/ShSV25VU+zheFdV4SUP09bitic77Z3JyCNnBvSWT853b0Xccr4pcWH
	a1+T+5kR+Fndf50yp3gqkSovvQIHGiy6NtSYdKY7PaqL3sXuka94KJ6tIIS0dbffXE5Sy47iJFu
	z88rSNPnFdqHODWbXbWcil9L3v4XPL1OTwqNRo3O6Z/wdD/NCVZF+R429q4KQcwRzaLJjqdZ5tq
	MxikoMX1JyPpK41xORRKSSI1ZxKiy1z44T0y2qb9EdFuKrvgfqmLybLhN1p/klWlhYrNigir68A
	pxN+cQTjZbIXyX9e1+7Pk4C7RHEs5JLfdQ==
X-Google-Smtp-Source: AGHT+IERRZ3TErFkxlmTHG93CaXrwBE0EPjPX3pIWrXXrwapQygihAR5woifIPQ+tjkMb3Z42rpP7A==
X-Received: by 2002:ac8:5994:0:b0:466:89f8:305e with SMTP id d75a77b69052e-46fd0b9233dmr282695101cf.38.1738596945113;
        Mon, 03 Feb 2025 07:35:45 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0a74b0sm49708781cf.2.2025.02.03.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:35:44 -0800 (PST)
Date: Mon, 3 Feb 2025 10:35:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rtm@csail.mit.edu, USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: hub: Ignore non-compliant devices with too many
 configs or interfaces
Message-ID: <9368333d-fc47-4a86-8b76-d41f61029cba@rowland.harvard.edu>
References: <d86313f9-e77b-47a5-9a84-01d71493b15c@rowland.harvard.edu>
 <96145.1737573668@localhost>
 <c27f3bf4-63d8-4fb5-ac82-09e3cd19f61c@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c27f3bf4-63d8-4fb5-ac82-09e3cd19f61c@rowland.harvard.edu>

On Wed, Jan 22, 2025 at 02:26:17PM -0500, Alan Stern wrote:
> Robert Morris created a test program which can cause
> usb_hub_to_struct_hub() to dereference a NULL or inappropriate
> pointer:
> 
> Oops: general protection fault, probably for non-canonical address
> 0xcccccccccccccccc: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
> CPU: 7 UID: 0 PID: 117 Comm: kworker/7:1 Not tainted 6.13.0-rc3-00017-gf44d154d6e3d #14
> Hardware name: FreeBSD BHYVE/BHYVE, BIOS 14.0 10/17/2021
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:usb_hub_adjust_deviceremovable+0x78/0x110
> ...
> Call Trace:
>  <TASK>
>  ? die_addr+0x31/0x80
>  ? exc_general_protection+0x1b4/0x3c0
>  ? asm_exc_general_protection+0x26/0x30
>  ? usb_hub_adjust_deviceremovable+0x78/0x110
>  hub_probe+0x7c7/0xab0
>  usb_probe_interface+0x14b/0x350
>  really_probe+0xd0/0x2d0
>  ? __pfx___device_attach_driver+0x10/0x10
>  __driver_probe_device+0x6e/0x110
>  driver_probe_device+0x1a/0x90
>  __device_attach_driver+0x7e/0xc0
>  bus_for_each_drv+0x7f/0xd0
>  __device_attach+0xaa/0x1a0
>  bus_probe_device+0x8b/0xa0
>  device_add+0x62e/0x810
>  usb_set_configuration+0x65d/0x990
>  usb_generic_driver_probe+0x4b/0x70
>  usb_probe_device+0x36/0xd0
> 
> The cause of this error is that the device has two interfaces, and the
> hub driver binds to interface 1 instead of interface 0, which is where
> usb_hub_to_struct_hub() looks.
> 
> We can prevent the problem from occurring by refusing to accept hub
> devices that violate the USB spec by having more than one
> configuration or interface.
> 
> Reported-and-tested-by: Robert Morris <rtm@csail.mit.edu>
> Closes: https://lore.kernel.org/linux-usb/95564.1737394039@localhost/
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> ---

Greg:

I originally didn't mark this patch for the -stable kernels because it 
doesn't really fix a bug.  But on the other hand, it does protect 
against a possible DOS attack from a malicious device, so perhaps it 
does belong in the -stable kernels.

I'll leave the decision up to you.

Alan Stern

> 
>  drivers/usb/core/hub.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> Index: usb-devel/drivers/usb/core/hub.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/hub.c
> +++ usb-devel/drivers/usb/core/hub.c
> @@ -1848,6 +1848,17 @@ static int hub_probe(struct usb_interfac
>  	hdev = interface_to_usbdev(intf);
>  
>  	/*
> +	 * The USB 2.0 spec prohibits hubs from having more than one
> +	 * configuration or interface, and we rely on this prohibition.
> +	 * Refuse to accept a device that violates it.
> +	 */
> +	if (hdev->descriptor.bNumConfigurations > 1 ||
> +			hdev->actconfig->desc.bNumInterfaces > 1) {
> +		dev_err(&intf->dev, "Invalid hub with more than one config or interface\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
>  	 * Set default autosuspend delay as 0 to speedup bus suspend,
>  	 * based on the below considerations:
>  	 *

