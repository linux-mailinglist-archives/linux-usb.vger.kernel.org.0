Return-Path: <linux-usb+bounces-9582-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D09A28AD4CB
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 21:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 008B41C211DD
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 19:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CF8155323;
	Mon, 22 Apr 2024 19:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DR4Y5bi7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qDjz/tCj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DR4Y5bi7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qDjz/tCj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12FD1DFFB
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 19:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713813735; cv=none; b=hrgXGKbnukTQWaM3NzYSh/qmbVwrFZsCBc7VIiv4ODqnHctU9gjg044pD+5+qpRzj2WdREh5IvbxW1Z64QrEqffJxXGytSzy+8h4fIpLQk2rty0vsS5hYfFhPAVU3Fir0NRsy/OwWbPWdwPaNoCTr/o0XRV8QPxZ0/KUIWedTTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713813735; c=relaxed/simple;
	bh=THWPdw6JqKZAiiLTFbavbqJsvhLidOKTRzSxkRqO1ok=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ChQijrl/i5N8j6b/ewrpp6rcdR0kNADBvxd8bpTz2V/JFHYsR4i+KCYWNUOgBrNJbODhvXG0LvxhoCef6olyWPtowKDcSY/3glOUfP1vuAjkU0tcNL38bNctYnrXAh0D/ndIo4vrsmT3bTUTU0vMSfwBznvX1A90wxYyeyMeyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DR4Y5bi7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qDjz/tCj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DR4Y5bi7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qDjz/tCj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB5B45D4F8;
	Mon, 22 Apr 2024 19:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713813725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i8agyjiTLmR3BKcF4v7NZrWkZ22h0a2yuRHhRa9dphY=;
	b=DR4Y5bi79fsZ3Fx2MzqcubZZuDO5iyQnBEvGc9CoOxGGIjPCcgBftjxFYJhWUfBiUNu4kB
	ckhXSMMZn0+BBmRiXPLN5n8OkQIc2NMX97a0nMqUWdsbETfAhf+Ybcjf5s/QWdvzbBvhA2
	IHbB64W+rrEuEIPi9mMxbtWo3UMnaxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713813725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i8agyjiTLmR3BKcF4v7NZrWkZ22h0a2yuRHhRa9dphY=;
	b=qDjz/tCjp99oQymDoCRPkKkcB/V3cWWHPZKZrv2dTmcSBHXHj9J8m0yFFH5sjtIZrU+Z42
	RqHfQHpklD/WnzCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DR4Y5bi7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="qDjz/tCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713813725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i8agyjiTLmR3BKcF4v7NZrWkZ22h0a2yuRHhRa9dphY=;
	b=DR4Y5bi79fsZ3Fx2MzqcubZZuDO5iyQnBEvGc9CoOxGGIjPCcgBftjxFYJhWUfBiUNu4kB
	ckhXSMMZn0+BBmRiXPLN5n8OkQIc2NMX97a0nMqUWdsbETfAhf+Ybcjf5s/QWdvzbBvhA2
	IHbB64W+rrEuEIPi9mMxbtWo3UMnaxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713813725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i8agyjiTLmR3BKcF4v7NZrWkZ22h0a2yuRHhRa9dphY=;
	b=qDjz/tCjp99oQymDoCRPkKkcB/V3cWWHPZKZrv2dTmcSBHXHj9J8m0yFFH5sjtIZrU+Z42
	RqHfQHpklD/WnzCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8ED97136ED;
	Mon, 22 Apr 2024 19:22:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6P1nId24JmaDPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Apr 2024 19:22:05 +0000
Date: Mon, 22 Apr 2024 21:22:14 +0200
Message-ID: <874jbtjj89.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>,
	USB list <linux-usb@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in SuperSpeed initialization")
In-Reply-To: <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
	<78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: AB5B45D4F8
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 09 Apr 2024 16:56:53 +0200,
Alan Stern wrote:
> 
> On Tue, Apr 09, 2024 at 03:49:01PM +0200, Oliver Neukum wrote:
> > Hi,
> > 
> > with the following device:
> > 
> > Bus 002 Device 002: ID fb5d:0001 BHYVE HID Tablet
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               3.00
> >   bDeviceClass            0
> >   bDeviceSubClass         0
> >   bDeviceProtocol         0
> >   bMaxPacketSize0         8
> 
> A USB-3 device, running at SuperSpeed with its bMaxPacketSize0 set to 8 
> instead of 9?  Presumably this thing never received a USB certification.  
> Does the packaging use the USB logo?

IIUC from the report, this is a virtualization environment, no real
device:
  https://bhyve.npulse.net/


Takashi

> >   idVendor           0xfb5d
> >   idProduct          0x0001
> >   bcdDevice            0.00
> >   iManufacturer           1 BHYVE
> >   iProduct                2 HID Tablet
> >   iSerial                 3 01
> >   bNumConfigurations      1
> 
> Why on earth would an HID tablet need to run at SuperSpeed?
> 
> > Binary Object Store Descriptor:
> >   bLength                 5
> >   bDescriptorType        15
> >   wTotalLength       0x000f
> >   bNumDeviceCaps          1
> >   SuperSpeed USB Device Capability:
> >     bLength                10
> >     bDescriptorType        16
> >     bDevCapabilityType      3
> >     bmAttributes         0x00
> >     wSpeedsSupported   0x0008
> >       Device can operate at SuperSpeed (5Gbps)
> >     bFunctionalitySupport   3
> >       Lowest fully-functional device speed is SuperSpeed (5Gbps)
> >     bU1DevExitLat          10 micro seconds
> >     bU2DevExitLat          32 micro seconds
> 
> A tablet not capable of running at any speed below 5 Gbps?
> 
> > we are getting a regression on enumeration. It used to work with the
> > code prior to your patch. Takashi is proposing the attached fixed.
> > It looks like we are a bit too restrictive and should just try.
> > 
> > 	Regards
> > 		Oliver
> 
> > From: Takashi Iwai <tiwai@suse.de>
> > Subject: [PATCH] USB: hub: Workaround for buggy max packet size with super
> >  speed
> > Patch-mainline: Not yet, testing
> > References: bsc#1220569
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > 
> > ---
> >  drivers/usb/core/hub.c | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index e38a4124f610..64193effc456 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -4830,7 +4830,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> >  	const char		*driver_name;
> >  	bool			do_new_scheme;
> >  	const bool		initial = !dev_descr;
> > -	int			maxp0;
> > +	int			maxp0, ep0_maxp;
> >  	struct usb_device_descriptor	*buf, *descr;
> >  
> >  	buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
> > @@ -5070,7 +5070,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> >  		else
> >  			i = 0;		/* Invalid */
> >  	}
> > -	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
> > +	ep0_maxp = usb_endpoint_maxp(&udev->ep0.desc);
> > +	if (ep0_maxp == i) {
> 
> This variable looks like it was left over from earlier testing.  It's 
> not really needed.
> 
> >  		;	/* Initial ep0 maxpacket guess is right */
> >  	} else if ((udev->speed == USB_SPEED_FULL ||
> >  				udev->speed == USB_SPEED_HIGH) &&
> > @@ -5082,9 +5083,15 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
> >  			dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
> >  		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
> >  		usb_ep0_reinit(udev);
> > +	} else if (udev->speed >= USB_SPEED_SUPER && initial) {
> > +		/* FIXME: should be more restrictive? */
> > +		/* Initial guess is wrong; use the descriptor's value */
> > +		dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
> > +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
> > +		usb_ep0_reinit(udev);
> 
> This could be merged with the previous case fairly easily.
> 
> >  	} else {
> >  		/* Initial guess is wrong and descriptor's value is invalid */
> > -		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d\n", maxp0);
> > +		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d, expected %d\n", maxp0, ep0_maxp);
> 
> This also looks like a remnant from earlier testing.
> 
> Alan Stern
> 
> >  		retval = -EMSGSIZE;
> >  		goto fail;
> >  	}
> > -- 
> > 2.35.3
> > 
> 

