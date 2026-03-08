Return-Path: <linux-usb+bounces-34239-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG+fGJ+1rWmi6QEAu9opvQ
	(envelope-from <linux-usb+bounces-34239-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 18:45:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D549C231775
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 18:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72F6E300F7B5
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 17:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6DD38551F;
	Sun,  8 Mar 2026 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aRGfb5mA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52942D8793;
	Sun,  8 Mar 2026 17:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772991377; cv=none; b=apGoWF4JlaOviR5QW5VzeVWxpq4xFS3nFgD0JMVTZ99EUEwciGzfyAca/PDWwAITdzWIEjktPhXweUpcWlJHRzRUPwd9Vbwdy9aZPXMjb01BH1zUO6PW3mS0JneuD171691mzmC+djbHiC5ozlA/0MFT+IepIv0iEz5ezRR1Gds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772991377; c=relaxed/simple;
	bh=qovB4Yz3SMRmH4QFLRbpUL+eA+2+jbJBMWzPkZl8BrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMFmu7gE7EZb2yyp4uj0yHHJn5CRPT4XvR+u5dpROJFdTrMzKRFh0cxe/EmrK1DV2CDpcwY+Xkz2xPYsKWzH33zy2iP3CNv8fx8XlFYEnfscP6+WlhalEhm5fopoFirqcfIWAWb9lZaR5Ov8f1klLg7GmkHdKB40kYHqNKXB5yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aRGfb5mA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB5CC116C6;
	Sun,  8 Mar 2026 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772991376;
	bh=qovB4Yz3SMRmH4QFLRbpUL+eA+2+jbJBMWzPkZl8BrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRGfb5mAWJ8/KhgsSXiu5SCCkdZyosdow3gAUwHz1JdDxJH1ZXNzIlsnazFiNbpcA
	 B7iEVvEWOzxnBVVM0G0EdFXjlatdYL2hEqBFFzPugADqu0dskUR5DlBjDeVYYEafJh
	 /KipqVhvwHHkTLUrf6aTsYss4mbdB3oJnFNeEGQk=
Date: Sun, 8 Mar 2026 18:36:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hans =?iso-8859-1?Q?J=F6rg?= Paliege <hans_paliege@web.de>
Cc: linux-usb@vger.kernel.org, linux-hotplug@vger.kernel.org
Subject: Re: potential bug or quirk in the linux kernel usb subsystem, usb
 microphone sampling rate resolution rate
Message-ID: <2026030805-snowcap-engaged-0a8d@gregkh>
References: <159da401-4f3a-4069-bd2a-d8dd934995e1@web.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <159da401-4f3a-4069-bd2a-d8dd934995e1@web.de>
X-Rspamd-Queue-Id: D549C231775
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	INTRODUCTION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TAGGED_FROM(0.00)[bounces-34239-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[web.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_SPAM(0.00)[0.296];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:55:13PM +0100, Hans Jörg Paliege wrote:
> Hello Mr. Kroah-Hartman,
> 
> 
> 
> my name is Hans Paliege and i am a longtime Linux user, but i came across a
> potential peculiar quirk or bug in the usb subsystem
> 
> that may need your attention. According to the kernel documentation i should
> contact You as the main developer directly.

The documentation should say to contact the linux-usb list, which I've
 cc:ed here :)

> I am using a debian unstable amd64 build that is updated daily, and during
> boot for about two weeks now
> 
> the audio frequency sample rate of my logitech C270 usb webcam is no longer
> initialized correctly.

When did it last work properly?  When did it stop working?  Any specific
kernel version ranges?

> As a result the webcam only delivers video but no audio. The webcam
> microphone is as a audio device recognized
> by the webbrowser but the input is null.

Those are 2 different USB devices in one, so something is off for the
audio stream somehow.

> 
> During boot the dmesg error messages are:
> 
> 
> [ +0,007125] usb 3-1: current rate 24000 is different from the runtime rate
> 16000
> [ +0,002572] usb 3-1: 3:3: cannot set freq 24000 to ep 0x82
> 
> 
> 
> After manual usbreset of the logitech C270 webcam the dmesg error messages
> are:
> 
> 
> [Mär 2 22:13] usb 3-6.2: reset full-speed USB device number 7 using xhci_hcd
> [ +12,959814] usb 3-1: reset high-speed USB device number 2 using xhci_hcd
> [ +0,288046] uvcvideo 3-1:1.0: Found UVC 1.00 device C270 HD WEBCAM
> (046d:0825)
> [ +0,036940] usb 3-1: current rate 16000 is different from the runtime rate
> 32000
> [ +0,063995] usb 3-1: current rate 24000 is different from the runtime rate
> 16000
> [ +0,061679] usb 3-1: 3:3: cannot set freq 24000 to ep 0x82
> [ +0,213449] usb 3-1: set resolution quirk: cval->res = 384

Is that the audio device, or the video device?

> After some internet search i could not find any specific command,
> application or grub boot parameter to manually set the rate to the runtime
> rate of 16000 or 32000.
> 
> The quirk seems to be, that the sampling rate is automatically set to the
> value of 24000, while the actual working runtime rates are ignored.
> 
> Any subsequent pipewire-alsa related audio volume and input/output works
> fine, and i have to use a really old ZOOM H2 usb microphone at 44100 that
> works for now.
> 
> Maybe a recent change in the linux kernel or the usb subsytem caused this.
> It would be great if you could take a closer look at it and fix it.

A range of kernel versions here would be helpful, as would any other
kernel log messages.

thanks,

greg k-h

