Return-Path: <linux-usb+bounces-37990-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPY/GDEPE2rf7AYAu9opvQ
	(envelope-from <linux-usb+bounces-37990-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 16:46:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA15C2B86
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 16:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6116300C815
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718DC2FC898;
	Sun, 24 May 2026 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SiVoKvUT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7012D274FD1
	for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779633949; cv=none; b=BmXVI6nF20n6x9RT5/IedwQuZQXiMtkjkEhnkP7ZcPfNSReFJ1IMT1oM5Th8sIVwlPqXgGDA/SlzIdtyO+fEWDgmm4hWOE+FfTe3WuEE+JS8rP5DI0VPULdm0TB8YhYAWcPDy+9KhqAMDTw1HLH3F19pX1tHSxzT5znO9xwHMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779633949; c=relaxed/simple;
	bh=TI0/L+GejtTeSIioccUte+z8YXT9gEPZ8z/ahtZfawQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYu7cHYeb7Efhcs/h7oJjVuTnGNqkwPAzyFi4inqUB9u/wOg1v0gmmG0aHoyaTgaKQpOTIeQg3FcmrFQjjzXcPq5rmugWXQhZjkYleWaG4fV82oZUi2Vj3y461ZFu+nyLjWbB24xega07bijiV52aioPgwxpTOz+HyBx6/g3tSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SiVoKvUT; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cc9f97a124so3570056d6.2
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779633947; x=1780238747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDeJRb2nrc+/qAN65EJRxpxoDR8UwF/XfIcD8wa9bss=;
        b=SiVoKvUTYGwbwLKA7tF00uC3RFMq9EdXB3xSiLPXiTjpAIby6S0//EumIidUtbfSwA
         5ku0LAlal7XH1GgppDHoUQCunITrju3QkzhcS7EzCK32tGvQfDN4cn/xMb7IHwuN4qPz
         LoVZIRQUqVEq9AlLqAHyLUxBZeypOcKCKiSFufORqI9sEq0a93yGrMxRT1R7s6Ya4tjj
         /5EmDCiMwD41a9JtDhsOBwQRaKStlHHhzGK22D4K5Ja5V2Adms1C7ckdk1IA33jcljCF
         RgAIofpVyEIr0wjNR09tAX3NmuSnxGkhT1xjgqKG3XJSVmquhhVkS8IYEZTf+YVsZ/aY
         eRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779633947; x=1780238747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDeJRb2nrc+/qAN65EJRxpxoDR8UwF/XfIcD8wa9bss=;
        b=UxVNtUwXhtOc2EgmV9Iiooqw9Bd7YMzA6YinUZpZIkPkbcFiNh3My837vNfzVIqUjB
         PHCsOcU4Co1p8JBUEkwuDLzJ+62cZ5pv28ZvrMrzvc2JzrgqhrAVeD2yJq0gIyqKfrWm
         b0x8Vwl47grBYtDVpHlzhgOo6E6bfliDUDr8MiB4BFTDb7ahxqAczJwE16RleelgJzEZ
         lMuym8notxokcC8AFxWVHSxgzQ8GrIgSMPL8PMWitXzIaZVuzhTD2f+BargzS63nWcLy
         YspxiiY8boIEgAEtZxlfjpKzRft3F/6V3LilvDOmoywit8g8/cIvhyrUkPJXNZQLIOwu
         SfuA==
X-Forwarded-Encrypted: i=1; AFNElJ9bdznxM3bj3GL/U64+xWI+pVGz/g58jTFcbQhT6/blQx74SXAleqce/ExCIpnuGJCWNQ6zBqpePMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl3bo+95GolC5jmbIR8SBOXxWaN8nAwTUP6D61C/21jTfl5zQ+
	NAOkanWMQKn7sn2AJXmH/MKz23f4DJKbr3LM3ZFU0HewXLL8a5vBHfz+pliqkz8MFg==
X-Gm-Gg: Acq92OGvAmiTSvcq1ttdLpfs1vqUkV2mnPQ/1YDnd/iNrXg96cIwheBFawYqoFdk3Am
	cs0Hqsf5jbzv2jHdlg3FTUp1Jp/H9BX8M7sXe8cvTVqUt02virhzKz9JKwMEkzhtr0K93domVub
	1sMRjEYuFCbWpDvnI490hR7I+E4bcXlUzRO3sJACugKDR+dRQYl4xgiL8j87DE3ANtn/YwTWdUE
	RHcDdaomhSEcMZ5Y0U9xNxFVA9rAqkVBwzANuB78edNXAidciuRjPMvQ38/F0RCjGYx214xw1e+
	FjlolsDxWbcHFYdwdqb8AdPj6u/Mhho5GxELIEmr1C8cV8sRXaPWml/Ynd8OzSj/1vDRfPUthVC
	Nc6VHmmlGcMNw0zt7SIJTpLF0UU1etP4SxVphiony0/nNW3NPD3HU5nXh6zrRrIRvgOYcLazbCd
	C4CtC4o68giSXLCqA8Cvu76M3DzGiewqRt5rRG9nn5o0g=
X-Received: by 2002:ac8:7d0e:0:b0:516:e8aa:25e with SMTP id d75a77b69052e-516e8aa076emr63544651cf.55.1779633947167;
        Sun, 24 May 2026 07:45:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516d8d09e42sm70737431cf.28.2026.05.24.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 07:45:46 -0700 (PDT)
Date: Sun, 24 May 2026 10:45:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Joseph Bursey <jbursey@uci.edu>,
	syzbot <syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 iowarrior_write_callback (2)
Message-ID: <69c60a2a-68d2-48b0-8236-b80cd6b602cf@rowland.harvard.edu>
References: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
 <32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
 <20260524103053.308501de.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524103053.308501de.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37990-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rowland.harvard.edu:mid,rowland.harvard.edu:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,ad2aac2febc3bedf0962];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: CAAA15C2B86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 10:30:53AM +0200, Michal Pecio wrote:
> On Fri, 22 May 2026 13:38:40 -0700, Joseph Bursey wrote:
> > Hello, I believe I have a reproducer for this bug using a combination
> > of syz-execprog and eBPF programs.
> 
> Hi, could you check if this patch (compile tested only) fixes it?
> 
> I admit I'm not an expert on USB core, but I see nothing _reliably_
> preventing URB submissions after usb_disable_interface(), which may
> be the root cause of this bug (besides the driver sloppiness for
> which separate patches have been posted by Johan Hovold).

The general attitude has been that it isn't the core's responsibility to 
recover from bugs caused by drivers.  Rather, it is the programmers' 
responsibility to fix the bugs properly.

On the other hand, it won't hurt to add some code to the core for 
detecting and reporting buggy driver behavior, so that the programmers 
would know about it.

> My patch tries to fix it by updating ep->enabled under a spinlock
> which will be held while checking this flag on submission attempts.
> 
> Such bug is trouble not only for sloppy drivers, but also for HCDs
> which assume that no URBs exist while endpoints are being "dropped".
> Syzbot and you apparently found ways to break this assumption:
> 
> static int usb_unbind_interface(struct device *dev)
> {
> 	[...]
>         /*
>          * Terminate all URBs for this interface unless the driver
>          * supports "soft" unbinding and the device is still present.
>          */
>         if (!driver->soft_unbind || udev->state == USB_STATE_NOTATTACHED)
>                 usb_disable_interface(udev, intf, false);
> 	// no URBs should be pending on these endpoints now

Depends on whether the driver has the soft_unbind flag set and whether 
the device is still attached, obviously.

> 
>         driver->disconnect(intf);

But definitely no URBs should be pending now.

> 	// but one is observed completing concurrently now
> 
> I also suspect that more UAF in sloppy drivers is possible due to
> usb_hcd_flush_endpoint() failing to wait for pending BH givebacks.

usb_hcd_flush_endpoint() only guarantees that the HCD is finished 
dealing with any pending URBs.  It is not meant to guarantee that the 
URBs' completion handlers have run.

> It seems that dummy-hcd doesn't use HCD_BH, so this shouldn't be
> a factor here, but it could become an issue on real hardware.

Do you think it would help to provoke some exotic bugs if dummy-hcd did 
use HCD_BH?  That would be an easy change to make.

> As long as resubmission is prevented reliably, this won't affect
> HCDs, but it may cause UAF in buggy class drivers.
> 
> ---
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index b181b43a35dc..4fee30101e96 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -1958,6 +1958,15 @@ int usb_hcd_alloc_bandwidth(struct usb_device *udev,
>  	return ret;
>  }
>  
> +void usb_hcd_set_endpoint_enabled(struct usb_host_endpoint *ep, int enabled)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&hcd_urb_list_lock, flags);
> +	ep->enabled = enabled;
> +	spin_unlock_irqrestore(&hcd_urb_list_lock, flags);
> +}
> +
>  /* Disables the endpoint: synchronizes with the hcd to make sure all
>   * endpoint state is gone from hardware.  usb_hcd_flush_endpoint() must
>   * have been called previously.  Use for set_configuration, set_interface,
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 75e2bfd744a9..8d656d7e8f69 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1358,7 +1358,7 @@ void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
>  			dev->ep_in[epnum] = NULL;
>  	}
>  	if (ep) {
> -		ep->enabled = 0;
> +		usb_hcd_set_endpoint_enabled(ep, 0);
>  		usb_hcd_flush_endpoint(dev, ep);
>  		if (reset_hardware)
>  			usb_hcd_disable_endpoint(dev, ep);
> @@ -1523,7 +1523,7 @@ void usb_enable_endpoint(struct usb_device *dev, struct usb_host_endpoint *ep,
>  		dev->ep_out[epnum] = ep;
>  	if (!is_out || is_control)
>  		dev->ep_in[epnum] = ep;
> -	ep->enabled = 1;
> +	usb_hcd_set_endpoint_enabled(ep, 1);
>  }

For debugging purposes you might also add a dev_warn() to 
usb_hcd_link_urb_to_ep() in the test for !urb->ep->enabled.  We can't do 
this all the time because a driver might unknowingly submit an URB just 
as the endpoint is being disabled.

Alan Stern

