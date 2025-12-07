Return-Path: <linux-usb+bounces-31225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AAFCAAFA6
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 01:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 692F33052B10
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 00:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710607082F;
	Sun,  7 Dec 2025 00:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iTlfpVKm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD2F1C68F
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765066526; cv=none; b=glS90yheBCQTAdJC5/iQQ7wQubooMvn+C4ZDeQTTkD0/HIobiAv7PRoyiT08c0PaYGkht6TMAllbsNlyOdRd0ovFIIAdtPDmncADqEgNT4x7zAbGpdBvfXGD14YzmE0OsZD/muMppnLZudG9dC/YpMnejcFWRBzZw+Re4xg7Pa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765066526; c=relaxed/simple;
	bh=5IExN7HE9MX46nmA5JICp+vpnP5hQRaMnsGe0BUO6vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTmIqF3apGR3hdt6Urcevo3ZCY5OJe68/8LRXfhsOBv6pD/YJjfzwL+cAoDYdN/qKdYnioMrtwSu5253SJ0roxUMKVOs1rsKvHcDz3g184Q7lpx3ESwM5XLXWtmjRbueHqDuv1jounuFBx+eJi9vKEfVomzZpNSPsqO9cBRLdSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iTlfpVKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60D0C4CEF5;
	Sun,  7 Dec 2025 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765066526;
	bh=5IExN7HE9MX46nmA5JICp+vpnP5hQRaMnsGe0BUO6vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTlfpVKm5/ZQeRT94EaDUAnFZDnVgVS0W5s6DR8SFYH9Tki5x6MIbWqbYGVLcGYqc
	 VSiKi9NNEivakJb5re2j/3olhJhNCFTu5kyDCFlQ9wUQoNFN4LdqD9gcEvwjafzELa
	 jGCSOFQOo4pRIPLuTQ5iQo4jJZY+QayNJBrpJff8=
Date: Sun, 7 Dec 2025 09:15:23 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: add USB_QUIRK_NO_BOS for devices that hang on
 BOS descriptor
Message-ID: <2025120708-header-startling-ffaf@gregkh>
References: <20251207000007.11631-1-johannes.bruederl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251207000007.11631-1-johannes.bruederl@gmail.com>

On Sun, Dec 07, 2025 at 01:00:07AM +0100, Johannes Brüderl wrote:
> Add USB_QUIRK_NO_BOS quirk flag to skip requesting the BOS descriptor
> for devices that cannot handle it.
> 
> Add Elgato 4K X (0fd9:009b) to the quirk table. This device hangs when
> the BOS descriptor is requested at SuperSpeed Plus (10Gbps).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220027
> Signed-off-by: Johannes Brüderl <johannes.bruederl@gmail.com>
> ---
> Before (device hangs at SuperSpeed Plus, then re-enumerates at lower speed
> with different product ID 009c):
> 
> [    3.284990] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
> [    8.574542] usb 2-2: unable to get BOS descriptor or descriptor too short
> [    8.600018] usb 2-2: unable to read config index 0 descriptor/start: -71
> [    8.600027] usb 2-2: can't read configurations, error -71
> [    8.998412] usb 2-2: Device not responding to setup address.
> [    9.215157] usb 2-2: Device not responding to setup address.
> [    9.422737] usb 2-2: device not accepting address 3, error -71
> [   10.990897] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
> [   11.065869] usb 2-2: LPM exit latency is zeroed, disabling LPM.
> [   11.152244] usb 2-2: New USB device found, idVendor=0fd9, idProduct=009c
> 
> After (device enumerates correctly at SuperSpeed Plus):
> 
> [    3.297159] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
> [    3.354248] usb 2-2: skipping BOS descriptor

This feels like a USB spec violation :(

> [    3.432917] usb 2-2: New USB device found, idVendor=0fd9, idProduct=009b
> [    3.432927] usb 2-2: Product: Elgato 4K X
> 
>  drivers/usb/core/config.c  | 5 +++++
>  drivers/usb/core/quirks.c  | 3 +++
>  include/linux/usb/quirks.h | 3 +++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index baf5bc844b6f..8fa3a486d038 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -1040,6 +1040,11 @@ int usb_get_bos_descriptor(struct usb_device *dev)
>  	__u8 cap_type;
>  	int ret;
> 
> +	if (dev->quirks & USB_QUIRK_NO_BOS) {
> +		dev_dbg(ddev, "skipping BOS descriptor\n");
> +		return 0;
> +	}

What is the downside of claiming to successfully reading the BOS
descriptor, yet not having done that at all?  Can we tear down the
device properly?  Show the information correctly through userspace
tools?  Shouldn't we return something like -ENOMSG instead?

thanks,

greg k-h

