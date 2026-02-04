Return-Path: <linux-usb+bounces-33072-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEZ4I4/Wgml5cQMAu9opvQ
	(envelope-from <linux-usb+bounces-33072-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:18:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EBE1DA5
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A3F630AA3F4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 05:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7185B3557FC;
	Wed,  4 Feb 2026 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eR4Yve9B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CEB3033D6;
	Wed,  4 Feb 2026 05:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770182192; cv=none; b=NaU7qp4LYbb/ZxDU5ncKQgM6Q4p6GuIIPoRSco6ysvM2LZBtkL49LAJ8Ih/X2rTzFYeuMWIZmoCAxT7TmZA89jwo/1nqDy/UVZl++lTFCCV5y864jQMC29Vbrvdrva7kP7h5eH/JUkLooQghEJN+8f8aMwZVUugGwRW25pNSJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770182192; c=relaxed/simple;
	bh=ealGi3kuCGc0r+DWLedua/qzGyjxRyWsP1snhcmKvNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDO/QfmZYwQhChg/W0igcnxie34HMkZU4MEJND05xtsE5zcPN1QaOsAoImnl4wZrPEkL39f22weoqwO7ZYKYp8i0BlEJ9hWIvYA8xW9P0/Xey3nOBazxcO+jMtzzVV+KcRo0OylhD4knTcBHiL63VQsiSB0KtYvm5igiBHqi6Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eR4Yve9B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFD0C4CEF7;
	Wed,  4 Feb 2026 05:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770182191;
	bh=ealGi3kuCGc0r+DWLedua/qzGyjxRyWsP1snhcmKvNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eR4Yve9Bxwnmsv5EVxyWDtDX7xNcUiz0St2zpLim5xSMQRIiptb8IuqY0jDMPIZ+K
	 CR+ft1IIfl10lpjcSWpXij5G+H3f+7LpIZLw3aHRkMPnLGT0k1bblAHqv+k7FLgMpx
	 ROPArNpI7hEj3hlZclm4diBfxbEmuzQWEMoGt4pY=
Date: Wed, 4 Feb 2026 06:16:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Jiayi Li <lijiayi@kylinos.cn>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Oliver Neukum <oneukum@suse.com>, Miao Li <limiao@kylinos.cn>,
	Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>,
	Lei Huang <huanglei@kylinos.cn>
Subject: Re: [PATCH 1/1] usb: core: Add quirk for Gigabyte Aorus Waterforce X
 II AIO coolers
Message-ID: <2026020403-federal-smite-0740@gregkh>
References: <20260203221452.198682-1-lyude@redhat.com>
 <20260203221452.198682-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203221452.198682-2-lyude@redhat.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33072-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kylinos.cn,linux.intel.com,suse.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB6EBE1DA5
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 05:10:27PM -0500, Lyude Paul wrote:
> The "Aorus Waterforce" is one of those fancy gaming water coolers that
> comes with fun LEDs and an entire dedicated LCD screen. A minor issue I've
> noticed with this cooler on Linux, is that we fail to actually
> reset the device when coming out of standby, ish:
> 
>   [  281.652184] usb 7-10.4: reset high-speed USB device number 7 using xhci_hcd
>   [  287.179843] usb 7-10.4: PM: dpm_run_callback(): usb_dev_resume returns -5
>   [  287.179854] usb 7-10.4: PM: failed to resume async: error -5
> 
> Generally this isn't fatal, as even when the water cooler doesn't resume it
> will still reconnect itself moments later:
> 
>   15:48:12 GoldenWind kernel: usb 7-10.4: USB disconnect, device number 14
>   15:48:12 GoldenWind kernel: usb 7-10.4: new high-speed USB device number
>      15 using xhci_hcd
>   15:48:14 GoldenWind kernel: usb 7-10.4: New USB device found,
>      idVendor=0414, idProduct=7a5e, bcdDevice= 2.00
>   15:48:14 GoldenWind kernel: usb 7-10.4: New USB device strings: Mfr=1,
>      Product=2, SerialNumber=0
>   15:48:14 GoldenWind kernel: usb 7-10.4: Product: Castor3
>   15:48:14 GoldenWind kernel: usb 7-10.4: Manufacturer: ITE Tech.
>   15:48:14 GoldenWind kernel: hid-generic 0003:0414:7A5E.000D:
>      hiddev98,hidraw2: USB HID v1.01 Device [ITE Tech. Castor3] on
>      usb-0000:74:00.0-10.4/input0
> 
> My guess here is that the device simply doesn't support resets properly -
> since that seems to be the only quirk I've found that actually works. Note
> that the device still ends up disconnecting and reconnecting after resume,
> but this seems to be normal behavior.
> 
> So, let's fix this by adding the USB_QUIRK_RESET quirk for this USB device.
> This seems to work perfectly fine and prevents us from getting the
> aforementioned errors on resume.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index c4d85089d19b1..9a81994ee725b 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -584,6 +584,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* INTEL VALUE SSD */
>  	{ USB_DEVICE(0x8086, 0xf1a5), .driver_info = USB_QUIRK_RESET_RESUME },
>  
> +	/* Gigabyte ITE Tech. Castor3 (Aorus Waterforce X II AIO coolers) */
> +	{ USB_DEVICE(0x0414, 0x7a5e), .driver_info = USB_QUIRK_RESET },

Please see the comments for this structure on how to place this device
in the list.

thanks,

greg k-h

