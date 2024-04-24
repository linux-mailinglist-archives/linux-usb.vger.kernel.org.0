Return-Path: <linux-usb+bounces-9707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574478B051E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 10:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2DB286D26
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 08:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3A1158A1D;
	Wed, 24 Apr 2024 08:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zrYsDkbh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lrm5U1x1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zrYsDkbh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lrm5U1x1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FF0157468
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713948968; cv=none; b=WTPV496jer4U4akJ2qLiKDvctWYhRl9asBBFzAPhsRe8kVzPMX0JIKOQsKM3DUhNYtCKo4viqnsVJrNkqjk4QMG5QbkI6kSUoXXadFFBz4obOK18O+C2rZ1duqOBQY0QRHqEVHVbus3p+TUPGfmW8liRxyBj0BgoC4CV6Jv5gK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713948968; c=relaxed/simple;
	bh=fW9dtU9EvLsvMfBLExE7W5wnUxHbOc4p878m3NHnhaU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=skIfIyMNBCu+VjFHYPl0pI0fxTnGVFI13BxLWVqG4DQXO5q1/4Xynmhy7wQv22rQqyT87v5RuTmihbBB160EckqZSlUWydZth5KioEafb3tHSr4G1a7W26ZJdk5r/mqIedoyX6AQuW5xypsbnqioCvkc9iMlFGxiEloc+BoPBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zrYsDkbh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lrm5U1x1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zrYsDkbh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lrm5U1x1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0E2AB2207B;
	Wed, 24 Apr 2024 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713948962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4jhrOjUXMi4L68sOb83OwZw0U9BrZMnPEkBveoFfzM=;
	b=zrYsDkbhAdVAoSC71s+vwjhLti5Z2SrEelLLT9+FuuM9AXmnqfQPy9OWsOrJ4MFewliBpL
	DsR4rh2vWyHzOs1FdsFz7+kmmTk+E7ZGLzYjip6U1Ey+INDNCfnJo9p9JRDDgPQVrfrHeI
	mg1LfHMqSO9IZ95A6XETn215cN+wYbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713948962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4jhrOjUXMi4L68sOb83OwZw0U9BrZMnPEkBveoFfzM=;
	b=lrm5U1x1G252pPOJtSkPrC+PTUlP/fiC+Qdy86sXVqPr10eGOL0FEZ9sceGzaHrHeDq4J+
	f0riM8kecu/sNwCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zrYsDkbh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lrm5U1x1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713948962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4jhrOjUXMi4L68sOb83OwZw0U9BrZMnPEkBveoFfzM=;
	b=zrYsDkbhAdVAoSC71s+vwjhLti5Z2SrEelLLT9+FuuM9AXmnqfQPy9OWsOrJ4MFewliBpL
	DsR4rh2vWyHzOs1FdsFz7+kmmTk+E7ZGLzYjip6U1Ey+INDNCfnJo9p9JRDDgPQVrfrHeI
	mg1LfHMqSO9IZ95A6XETn215cN+wYbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713948962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P4jhrOjUXMi4L68sOb83OwZw0U9BrZMnPEkBveoFfzM=;
	b=lrm5U1x1G252pPOJtSkPrC+PTUlP/fiC+Qdy86sXVqPr10eGOL0FEZ9sceGzaHrHeDq4J+
	f0riM8kecu/sNwCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A811913690;
	Wed, 24 Apr 2024 08:56:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id el7GJyHJKGaSLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Apr 2024 08:56:01 +0000
Date: Wed, 24 Apr 2024 10:56:11 +0200
Message-ID: <87bk5zdtqs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Oliver Neukum <oneukum@suse.com>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in SuperSpeed initialization")
In-Reply-To: <ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
	<78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
	<8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
	<673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
	<8734rdjj4n.wl-tiwai@suse.de>
	<ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0E2AB2207B
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -5.51

On Tue, 23 Apr 2024 21:29:27 +0200,
Alan Stern wrote:
> 
> On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> > On Mon, 22 Apr 2024 20:03:46 +0200,
> > Alan Stern wrote:
> > > 
> > > On Mon, Apr 22, 2024 at 07:33:21PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > > for once, to make this easily accessible to everyone.
> > > > 
> > > > Is anyone still working on fixing below regression? From here it looks
> > > > stalled, but I might have missed something.
> > > 
> > > I've been waiting to hear back from Oliver or Takashi.  A revised patch 
> > > taking my comments into account would be welcome; it should be a very 
> > > small change (just one or two lines of code).
> > 
> > As posted in another mail, it's a virtualized environment.
> > Details are found in the original bug report
> >   https://bugzilla.suse.com/show_bug.cgi?id=1220569
> 
> Hmmm.  If this is a virtualized device, isn't the best solution to fix the 
> emulation code for the device so that it presents a valid descriptor?

Honestly speaking, I don't know, but it smells like a hard way.  After
all, we brought some regression of the previously (even casually /
unintended) working "device"...


> > About the patch change: I appreciate if you cook it rather by
> > yourself since I'm not 100% sure what you suggested.  I can
> > provide the reporter a test kernel with the patch for confirmation, of
> > course.
> 
> Here's a condensed version of the patch you wrote.  But I would prefer not 
> to add this to the kernel if the problem can be fixed somewhere else.

Thanks, I asked the report for testing the patch now.


thanks,

Takashi

> 
> Alan Stern
> 
> 
> 
> Index: usb-devel/drivers/usb/core/hub.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/hub.c
> +++ usb-devel/drivers/usb/core/hub.c
> @@ -5110,9 +5110,10 @@ hub_port_init(struct usb_hub *hub, struc
>  	}
>  	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
>  		;	/* Initial ep0 maxpacket guess is right */
> -	} else if ((udev->speed == USB_SPEED_FULL ||
> +	} else if (((udev->speed == USB_SPEED_FULL ||
>  				udev->speed == USB_SPEED_HIGH) &&
> -			(i == 8 || i == 16 || i == 32 || i == 64)) {
> +			(i == 8 || i == 16 || i == 32 || i == 64)) ||
> +			(udev->speed >= USB_SPEED_SUPER && i > 0)) {
>  		/* Initial guess is wrong; use the descriptor's value */
>  		if (udev->speed == USB_SPEED_FULL)
>  			dev_dbg(&udev->dev, "ep0 maxpacket = %d\n", i);
> 

