Return-Path: <linux-usb+bounces-33071-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLrYLOTVgml5cQMAu9opvQ
	(envelope-from <linux-usb+bounces-33071-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:15:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D095E1D60
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 06:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2266300D0CC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 05:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81C734D392;
	Wed,  4 Feb 2026 05:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XGScr5Q4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E83557F6;
	Wed,  4 Feb 2026 05:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770182113; cv=none; b=lXFraS7s6v4ypNvdfkFF/SlbZYYVfO5Y0WMn2iAIP2Abvee++xEVHb4q6tPwa9rvgLJCUM2M7EYloZFxMv4VWy7VRPN4nwoKvAche8oYR3JLk0APEsnxKYykRjPGU+hPrBRl6ckLBdptpi4/pdoZ16fA0qcWMiEFobz1aZR7MhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770182113; c=relaxed/simple;
	bh=0USVsA8tzRo5NQD5YTAvbj7QFvFzWPHVTbohRqrLciA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzfZu3Q5sia7qmSncRDlHV/6tb8eWBwt+g4WUOX37jABy/iv4d8AHYy5lJ3CbKsXLRO61R6A+hL+YBee+E70GqKK6O+WQM/c9MactWPGHbIMJOU1HuSRq7pCFawd1pmYBGWdrihLO/e2+cHMAhvykM10qwzbTSYs2qhBR6Zh5yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XGScr5Q4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A917C4CEF7;
	Wed,  4 Feb 2026 05:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770182112;
	bh=0USVsA8tzRo5NQD5YTAvbj7QFvFzWPHVTbohRqrLciA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGScr5Q4lWWArIXVa/opEgZiNtOd8rAOrJNb8Zi+BtPBbFuNxU6mQATq4rK98qesO
	 mHmdEmTihk9j4vHQ9ymuZiqDQUvRRH3pVkrl/g1fQO4J+BUofy5S4D9DTqYlBgRcj+
	 qblLqQZZGjrRT0DDlysg0UytHz6qDObbI+0dNtyU=
Date: Wed, 4 Feb 2026 06:15:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: A1RM4X <dev@a1rm4x.com>
Cc: linux-usb@vger.kernel.org, limiao@kylinos.cn, oneukum@suse.com,
	huanglei@kylinos.cn, lijiayi@kylinos.cn,
	johannes.bruederl@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
Message-ID: <2026020457-distrust-vision-e5de@gregkh>
References: <20260204032938.61553-1-dev@a1rm4x.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204032938.61553-1-dev@a1rm4x.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33071-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kylinos.cn,suse.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D095E1D60
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:29:38PM -0500, A1RM4X wrote:
> Add QUIRK_NO_BOS entries for:
>  * ASUS TUF 4K PRO (0x0b05:0x1ab9)
>  * Avermedia Live Gamer Ultra 2.1 (0x07ca:0x2553)
>  * UGREEN 35871 (0x2b89:0x5871)

Why?  What is the results without this option being used here?  And what
happens when userspace goes and asks for this descriptor?

> Signed-off-by: A1RM4X <dev@a1rm4x.com>

We need a real name, sorry.

> ---
>  drivers/usb/core/quirks.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index c4d85089d19b..ddce45ce9f6c 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -453,6 +453,15 @@ static const struct usb_device_id usb_quirk_list[] = {
>  	/* Elgato 4K X - BOS descriptor fetch hangs at SuperSpeed Plus */
>  	{ USB_DEVICE(0x0fd9, 0x009b), .driver_info = USB_QUIRK_NO_BOS },
>  
> +	/* ASUS TUF 4K PRO - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x0b05, 0x1ab9), .driver_info = USB_QUIRK_NO_BOS },
> +
> +	/* Avermedia Live Gamer Ultra 2.1 (GC553G2) - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x07ca, 0x2553), .driver_info = USB_QUIRK_NO_BOS },
> +
> +	/* UGREEN 35871 - BOS descriptor fetch hangs at SuperSpeed Plus */
> +	{ USB_DEVICE(0x2b89, 0x5871), .driver_info = USB_QUIRK_NO_BOS },

Please read the comment for this structure for how to place these in the
list.

thanks,

greg k-h

