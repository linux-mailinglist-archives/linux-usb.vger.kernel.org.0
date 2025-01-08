Return-Path: <linux-usb+bounces-19134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A9A058A0
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 11:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDE4E162C24
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D76E1F8AD0;
	Wed,  8 Jan 2025 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oU0bmYPH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5471F8930;
	Wed,  8 Jan 2025 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333360; cv=none; b=bYhyf3TeOiIG2GKbFedlmmW9bmSm4l1epGg5FmKO8F4ggcr513VidzNC2OoDQoyixlkpmARsuaYPvOvPc3SNbc1X1j6Ul4tW+amWoLRNm6p0TBAo4otMOmcQ4P6VpWIW3QEdJaVEuUG0UDbqbapoPmTuDgeE8uPh1k8/hh6ZVBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333360; c=relaxed/simple;
	bh=d94ZeYPo0AOgPaK/2IQrQxtDwizkhQy1NKc1P57rEEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjJxN5WMnIzWxTs5n++h941v6M1R2x68Edcol4rQv09NXjlhCAk3yoRJmpbhJQwYZLN7F2xcmioqFHGyuuBvI3m5tBLLTTluoAIO65OSpAtiKe776k7XMWOzt2S8z8+PqAFoMqa5xV3KRkuma73a9X4vPUjCw0v/vNoJrf/NeXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oU0bmYPH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2BCC4CEDD;
	Wed,  8 Jan 2025 10:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736333359;
	bh=d94ZeYPo0AOgPaK/2IQrQxtDwizkhQy1NKc1P57rEEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oU0bmYPHIJOe9yXz2AF9nqzthsKvCrE4BkIMzKvJ0UAsoLZiQvvYblcGWqhK1yZpz
	 4lAhA3Py4FOKFZKFZnqS2bpiJHvyxXw5CpyzWJtm7NJLahj+3rMccTTfALeZryPv2P
	 yHWqAtUYfjORNEpas1lS5TcvDFRBqAzGo93OEWdtqjBQLtrQHJOi505yZShmGFHvbR
	 rSGGyohR+FUNsEw52zqNGaljoG/wj1xoNieFJ8ZduxLnn4azBUyk1qR2960xr+wOJw
	 RiMjuZy9IR64AuZnhfB+Y5B+RiZa8/VoJH91JVchbbAU475PiK7Ay8QGqDu9Bd5ENb
	 AauvEWGwGYcAg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVTcl-000000004Os-2IHa;
	Wed, 08 Jan 2025 11:49:19 +0100
Date: Wed, 8 Jan 2025 11:49:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Michal Hrusecky <michal.hrusecky@turris.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Neoway N723-EA support
Message-ID: <Z35YL54e1eBPslEv@hovoldconsulting.com>
References: <csxkrj4qclw3yzijwr57zqqd737kk47zpwjvy6t2oxnobmvswp@o5gt4k7vtwql>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <csxkrj4qclw3yzijwr57zqqd737kk47zpwjvy6t2oxnobmvswp@o5gt4k7vtwql>

On Tue, Jan 07, 2025 at 05:08:29PM +0100, Michal Hrusecky wrote:
> Update the USB serial option driver to support Neoway N723-EA.
> 
> ID 2949:8700 Marvell Mobile Composite Device Bus
> 
> T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2949 ProdID=8700 Rev= 1.00
> S:  Manufacturer=Marvell
> S:  Product=Mobile Composite Device Bus
> S:  SerialNumber=200806006809080000
> C:* #Ifs= 5 Cfg#= 1 Atr=c0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=03
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
> E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0c(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=89(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0b(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0e(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0a(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Tested successfully connecting to the Internet via rndis interface after
> dialing via AT commands on If#=4 or If#=6.
> 
> Not sure of the purpose of the other serial interface.
> 
> Signed-off-by: Michal Hrusecky <michal.hrusecky@turris.com>
> ---
>  drivers/usb/serial/option.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 64317b390d22..758f02f0d2b9 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2412,6 +2412,7 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = NCTRL(1) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
>  	  .driver_info = NCTRL(3) },
> +	{ USB_DEVICE(0x2949, 0x8700) },						/* Neoway N723-EA */

This should be USB_DEVICE_INTERFACE_CLASS() to avoid trying to bind to
the rndis interfaces.

I fixed this up when applying.

Johan

