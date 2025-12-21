Return-Path: <linux-usb+bounces-31660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C3CD42E4
	for <lists+linux-usb@lfdr.de>; Sun, 21 Dec 2025 17:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE6CD3007611
	for <lists+linux-usb@lfdr.de>; Sun, 21 Dec 2025 16:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4582301011;
	Sun, 21 Dec 2025 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IPgL+TBP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA961E492D;
	Sun, 21 Dec 2025 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766334181; cv=none; b=kYQCSq2AdtkqYzBa+pdZcBi1f7Skz75G6B30RDYWRUEsfzA75k8q/eDenqbynxafAjtuqzKC20Dj6VVpzD7w0ceeBmG0eqHwfZ8/my0IShmcFc4Txli0g/V9EkRIDOBdHZNyA3yhgZLerbuCoUm5quNaT8KF7Mm3oyvJLL0kiLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766334181; c=relaxed/simple;
	bh=HFVDEYEven2cCpWR+rsQYn2YYudIq3KS0/uxFk/Wz2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQwHzMw44EsVT7aahWo5bSi2jTI8tkTlzKadqhA1BXc89D1YeO20rfyxeuY6B5aWJA6vVrraGx9ZWK86phnVTXO1pCoGRpfFiesZVK3dqDO3sOqAGkiltt8Qd1rAFZtqA+Qkxwq64bSN4QRWRTwokrr37k4/hZA2LJJy878eSlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IPgL+TBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1631AC4CEFB;
	Sun, 21 Dec 2025 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766334180;
	bh=HFVDEYEven2cCpWR+rsQYn2YYudIq3KS0/uxFk/Wz2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPgL+TBPgFquq/tuRIaxt0tq7b4qfdtrji7ITrupfI76SlkzjUZSMKYDpCpEmlkIc
	 zstKML5PaqljHWmPbBYaPVLcUx3Vm9AFNoWpppS/ojtLyG0DvimMamYnxYJ05gQLzS
	 TNR3w4zg9Ra6+sE2TOtaVgfj2u2f3qTiZMoct/ic=
Date: Sun, 21 Dec 2025 17:22:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <2025122131-jaunt-obtuse-4585@gregkh>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>

On Fri, Dec 19, 2025 at 07:18:10AM +0000, 胡连勤 wrote:
> From: Lianqin Hu <hulianqin@vivo.com>
> 
> Considering that in some extreme cases,
> when a digital headset is connected and a wake-up
> operation is performed,if the headset is plug out
> or the headset connection is abnormally disconnected at this time,
> segment_pool will be set to null, resulting in accessing a null pointer.

Nit, please wrap your changelog at 72 columns.

> So, add null pointer checks to fix the problem.
> 
> Call trace:
>  dma_pool_alloc+0x3c/0x248
>  xhci_segment_alloc+0x9c/0x184
>  xhci_alloc_segments_for_ring+0xcc/0x1cc
>  xhci_ring_alloc+0xc4/0x1a8
>  xhci_endpoint_init+0x36c/0x4ac
>  xhci_add_endpoint+0x18c/0x2a4
>  usb_hcd_alloc_bandwidth+0x384/0x3e4
>  usb_set_interface+0x144/0x510
>  usb_reset_and_verify_device+0x248/0x5fc
>  usb_port_resume+0x580/0x700
>  usb_generic_driver_resume+0x24/0x5c
>  usb_resume_both+0x104/0x32c
>  usb_runtime_resume+0x18/0x28
>  __rpm_callback+0x94/0x3d4
>  rpm_resume+0x3f8/0x5fc
>  rpm_resume+0x1fc/0x5fc
> 
> Fixes: 0ebbab374223 ("USB: xhci: Ring allocation and initialization.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> 
>  drivers/usb/host/xhci-mem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index c708bdd69f16..2ea5fb810a80 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -35,6 +35,9 @@ static struct xhci_segment *xhci_segment_alloc(struct xhci_hcd *xhci,
>  	dma_addr_t	dma;
>  	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
>  
> +	if (!xhci->segment_pool)
> +		return NULL;

What prevents segment_pool from being set to NULL right after checking
this?

And what happens when you return "out of memory" like this is doing?
Doesn't that cause problems with the caller?  Looking at the callbacks
it seems like the whole ring will then be torn down, is that the proper
thing to do on system resume?

thanks,

greg k-h

