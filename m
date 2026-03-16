Return-Path: <linux-usb+bounces-34856-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMTvFRPXt2kwWAEAu9opvQ
	(envelope-from <linux-usb+bounces-34856-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:10:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B285E297B37
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 11:10:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF81F3011BEE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36AA388361;
	Mon, 16 Mar 2026 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWe6Jjkk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133E34EF17;
	Mon, 16 Mar 2026 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773655801; cv=none; b=bqkKKJw/Rqo9/Kvcq7VeLH5dkoPyZ9lNYZ5EfZHvAUFY6Sj3gUSACZunODSFt3BP4UzdTnix3abX4y27UMkRDiyqWDA5h6omI9TUCXns5tjChTyCvc7pWsBJgrxW7BQBtlTz1QSLW0eFTa4eUyBumDyyfHLpkr00rQDuoCA0zpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773655801; c=relaxed/simple;
	bh=JKnEypnAf3/7kaI0EvzTejmPuFH/grhCmaq5m4MJFec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQBc7uZrrI8RaMgafP2v0oIIqlP+ILEAHOxeTNbRPtG2G65qkBrycsjTIoBFKOooxfbF0Xb7qUYIn8ZTaQfPCcG4YyySHwBquzJ72wQvAu/uJQKmdKkdXsH7iJZp7DaXiBhJRwfsUEZ+V0XMUusXg6W+I0bnSJS5NmQA5gPqV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWe6Jjkk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A21C19421;
	Mon, 16 Mar 2026 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773655800;
	bh=JKnEypnAf3/7kaI0EvzTejmPuFH/grhCmaq5m4MJFec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWe6JjkkAT7hLruVLL9T9ZeFAkFifhCcCUcS3MKwBG+mBHy9Ay9+ZKokwmd0/zBd+
	 XEtF9WmWd+rHV9uyXbza3jOQwJf9sm9MiRLqprKOvvjACBsJm4n9X/EsB4XRktkWdJ
	 NclOdqN1kZ2JX2Grm0DneTHNW1UbzZ71QjAFA4PXkUMxgb4R5ICSJr4Dc23TVfrdSr
	 GQvq2QVFTAwKbP9t92kALe7DqEkF2KqXLAejryoN/sNprUexgmBhjCAXXWD4lmzJzP
	 Ca9PjyeAGw9sCMRiQJy538K3m28z/noYDTgML9eNQxVdn0z14oLrImbbV8219d65Kf
	 InRnZSQ+taALw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w24ta-0000000005n-2gHC;
	Mon, 16 Mar 2026 11:09:58 +0100
Date: Mon, 16 Mar 2026 11:09:58 +0100
From: Johan Hovold <johan@kernel.org>
To: zwq2226404116@163.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] [PATCH v2] usb: serial: add support for Rolling Wireless
 RW135R-GL (33f8:1003)
Message-ID: <abfW9nRKv6C6cfdE@hovoldconsulting.com>
References: <20260316100306.904519-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316100306.904519-1-zwq2226404116@163.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34856-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fibocom.com:email,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: B285E297B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 06:03:06PM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
> which is used in laptop debug cards with MBIM interface for
> Linux/Chrome OS. The device supports mbim, pipe
> functionalities.
> 
> Here are the outputs of usb-devices:
> T:  Bus=04 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=33f8 ProdID=1003 Rev=05.15
> S:  Manufacturer=Rolling Wireless S.a.r.l.
> S:  Product=Rolling RW135R-GL Module
> S:  SerialNumber=12345678
> C:  #Ifs= 3 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> 
> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---
> Changes in v2:
> - Move entry to correct VID/PID sort order (after 0x01a4 entries)
> - Place comment after the device entry (matching existing style)
> - Fix commit message typo: remove incorrect mention of diag/adb/AT interfaces
> - Update subject to reflect v2 version

Thanks, this looks better, but this one should probably have been called
v3 at least.

Note that you have an additional "[PATCH]" in your subject, though.

If you use git-format-patch it has a -v parameter to add the version
number to Subject.

> ---
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index e349ed66d2ac..4e44d8ff89a3 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2461,6 +2461,8 @@ static const struct usb_device_id option_ids[] = {
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0302, 0xff) },			/* Rolling RW101R-GL (laptop MBIM) */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0802, 0xff),			/* Rolling RW350-GL (laptop MBIM) */
>  	  .driver_info = RSVD(5) },
> +	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),			/* Rolling RW135R-GL (laptop MBIM) */
> +	  .driver_info = RSVD(5) },

Looks like you don't need to reserve this interface for this device.

>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54-WWD for Global */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0x00, 0x40) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x40) },

Johan

