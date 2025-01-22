Return-Path: <linux-usb+bounces-19646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EBEA19920
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 20:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41FFF167D28
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 19:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFD62153CB;
	Wed, 22 Jan 2025 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b="k0XU/A7N"
X-Original-To: linux-usb@vger.kernel.org
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E086AD4B
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737573673; cv=none; b=OD+K3tNzc0oyVsp0XjV6csVOMHHc5iugX7uhgK5cPtHhRgKRjI3Hiv2bZ8hYkLZKTjK8AnijQXLteuLd1tf+xf06gtWr1JCSyNLmBHUqgBRXZhk1p4kbkB82N8HMRdyMg7PYq3PEdA/vKgLkjoQuXGZR8CV3A9yoDAe3iO8RpCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737573673; c=relaxed/simple;
	bh=DLveF4vi5FOwuyzxnHzSIDuww0ox5jtvY4ZuwermbTw=;
	h=To:cc:From:Subject:In-reply-to:Date:Message-ID; b=WJCNHcly7+7m0oUMQqs+eWf5H64W21qvTSfIkIGme7JUBxLh4YIWHBpKap9/Bpi4y0wxUV9w//dgwW/Oz1+694DDpit9gDzDgcCOzHgKL7RI9k46h2ITLIO+v0e0A2aGOjY4esp/pzoynp2WUwS47DsGKkmcjMkd0jREub9e23o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.b=k0XU/A7N; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:In-reply-to:
	Subject:Reply-To:From:cc:To:Sender:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=+i8m/n3yydNZLPykVqwQSwDxVqRO9TR81JAgWaejj6I=; t=1737573671;
	x=1738437671; b=k0XU/A7NmoLOPC7+JMmfePgyobKVc1nR9JVR+NGVgDUd3gSZvcAPSk6PKnfq7
	Med/tsSQImKN4FuderfQdmtnwvsrIqU3n6rqASWSW4a2SV/vMU5VjwNLPC2Fd5W3tKkIOjyzeH+zy
	lHUnIiCrA0krYioj0ZMWyVUk7n127kNmJ1YG4go5la4tNhWfiN8RkWwkxmUuL1VzFHUGizaNR+KgW
	ZGrHDlhwZdnELvD1N1BsIEf8E3W9xcZmM8QHjbmNiD49s/vEyMeW6owvqlNBCWBA5YKE83U0GfjVl
	BcfNKmE9HCJFNwaVEoFkpMG2EtF2tGeb6jpy/i9WomRG3FloAw==;
Received: from [73.149.18.137] (helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1tagHl-004jdI-GA;
	Wed, 22 Jan 2025 14:21:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id 8BBAE1A11D89;
	Wed, 22 Jan 2025 14:21:08 -0500 (EST)
To: Alan Stern <stern@rowland.harvard.edu>
cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
From: rtm@csail.mit.edu
Reply-To: rtm@csail.mit.edu
Subject: Re: USB hub code can dereference NULL hub and hub->ports
In-reply-to: Your message of "Wed, 22 Jan 2025 10:55:24 EST."
             <d86313f9-e77b-47a5-9a84-01d71493b15c@rowland.harvard.edu>
Date: Wed, 22 Jan 2025 14:21:08 -0500
Message-ID: <96145.1737573668@localhost>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Alan,

Yes, your patch makes the NULL hub and hub->ports crashes
I've seen go away!

Robert

> Date: Wed, 22 Jan 2025 10:55:24 -0500
> From: Alan Stern <stern@rowland.harvard.edu>
> To: rtm@csail.mit.edu
> Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
> Subject: Re: USB hub code can dereference NULL hub and hub->ports
> 
> On Wed, Jan 22, 2025 at 06:37:45AM -0500, rtm@csail.mit.edu wrote:
> > > Great, can you submit patches to fix these issues now that you have a
> > > reliable test program to verify the problem?
> > 
> > I think the problem is (at least sometimes) not that hub->ports is
> > legitimately NULL and there's a missing check, but that
> > usb_hub_to_struct_hub() returns an object of the wrong type so that
> > hub->ports is junk, and only accidentally NULL in the demo I
> > previously submitted.
> > 
> > I've attached a new demo which crashes because hub->ports is
> > 0xcccccccccccccccc (on a kernel with red zones). The demo presents a
> > USB device whose DeviceClass is a hub (9), with two interfaces, but
> > the Vendor and Product indicate an FTDI serial adaptor.
> > 
> > First, usb_serial_probe() sets the interface zero dev->driver_data to
> > a struct usb_serial.
> > 
> > Later, when the hub code is trying to set up interface one, it calls
> > usb_hub_to_struct_hub(hdev):
> > 
> > struct usb_hub *usb_hub_to_struct_hub(struct usb_device *hdev)
> > {
> >         if (!hdev || !hdev->actconfig || !hdev->maxchild)
> >                 return NULL;
> >         return usb_get_intfdata(hdev->actconfig->interface[0]);
> > }
> > 
> > interface[0], however, has been set up by the serial port code, and
> > its dev->driver_data is a struct usb_serial, not a struct usb_hub.
> 
> Okay, that explains the problem.  usb_hub_to_struct_hub() assumes that a 
> hub device will never have more than one interface, because that 
> requirement is in the USB spec.  But of course, a bogus or malicious 
> device can violate the requirement.
> 
> I think the best way to deal with this issue is to prevent the hub 
> driver from binding to non-compliant devices.  Does the patch below fix 
> the problem for you?
> 
> Alan Stern
> 
> 
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

