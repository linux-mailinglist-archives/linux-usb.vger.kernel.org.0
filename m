Return-Path: <linux-usb+bounces-30780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D871C74190
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 14:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 51F312A937
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 13:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09E933A00C;
	Thu, 20 Nov 2025 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ty/FeXmY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4427530B511;
	Thu, 20 Nov 2025 13:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644194; cv=none; b=pI3oTvb/3Rnc9Z7ulSh87ErZWn3MNlnDc4u8V46xK3+irts2z24VcWYw101FjAPvSWXEhkbdK1d1C2GSKWt4AHdOpo/OqP2Ta9q4c3pmcO7MmNWMMeILgMH14/S2IIX5Y8rwl1wZy57smab84lpR+K78J5D58BGPiOS0YV6pEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644194; c=relaxed/simple;
	bh=LqDNF1+nse4EfPianJ9+Pn12SFYhtQMWV3V2Zbhyluk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGV+Sgx4KK0mlTB7Y+k2NHq0/H3Cz00eOH7EJz07RbpiYF55jq0vywbPdYcMqctcFKroGIe8t+qzrLb8AruMC6h2aBayAGlzOlBlioWDBZkS9WhzLUbO+aNh8JZOQsrjTBEfH/dxtfGpokDZI53XNQXBO9kp4W0gZnQqQ81e9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ty/FeXmY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5F6C4CEF1;
	Thu, 20 Nov 2025 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763644193;
	bh=LqDNF1+nse4EfPianJ9+Pn12SFYhtQMWV3V2Zbhyluk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ty/FeXmYA4JF5SzISlRtyec1fa32YeyKvHK8dA56N1fb05yO4F5iPPWAi79uw1RAq
	 RjLbyJm/83FG3KXQys0XxuDNMSobmwcE0lLZp2lzORU6LhWVVrk2BtvcqEDPGcwvlk
	 ETMaZejtCZaC8/c2zncD7ltZOPa5pA1cyEOIVhmfEbhTPs9nu4bEldLbcvy8HB6Z2y
	 N0BLli0vM6gJCJv+SURN+U0l3r+IDxQ5mXRh56165LO0GvmDs4kjGATnw1Azg+lxIX
	 5yjpRclzHnxCUpVrGKzYMzbhzh0E4uTSeVJBFM3dbzZKLNQSALPCbMlEEPzDNtQN4w
	 tEPQDQrsmPPQg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vM4Q6-000000003ii-0jmu;
	Thu, 20 Nov 2025 14:09:54 +0100
Date: Thu, 20 Nov 2025 14:09:54 +0100
From: Johan Hovold <johan@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V2] USB: serial: option: add Telit FN920C04 RNDIS
 compositions
Message-ID: <aR8TInn-XN1oUdSV@hovoldconsulting.com>
References: <20251120123908.1865387-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120123908.1865387-1-Qing-wu.Li@leica-geosystems.com.cn>

On Thu, Nov 20, 2025 at 12:39:08PM +0000, LI Qingwu wrote:
> 0x10a1: RNDIS + tty (NMEA) + tty (AT) [+ tty (DIAG)]

> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---

What changed in v2? Always include a short changelog here after the ---
line when respinning.

>  drivers/usb/serial/option.c | 6 ++++++
>
1 file changed, 6 insertions(+)
> @@ -1415,6 +1419,8 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10aa, 0xff),	/* Telit FN920C04 (MBIM) */
>  	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10ab, 0xff),	/* Telit FN920C04 (RNDIS) */
> +	  .driver_info = | NCTRL(3) | RSVD(4) | RSVD(5) },

This does not like it will even compile...

>  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x30),	/* Telit FE990B (rmnet) */
>  	  .driver_info = NCTRL(5) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x40) },

Johan

