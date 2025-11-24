Return-Path: <linux-usb+bounces-30873-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA42C819A8
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 17:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5EDF5346B55
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 16:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F4629ACCD;
	Mon, 24 Nov 2025 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lokYA2Yz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02DB2989B0;
	Mon, 24 Nov 2025 16:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002143; cv=none; b=sSQGFBovgVe77piwaaMZcMTNujSnQtG22p2OTsudrH1uRiXoMpq1WqopKY+Vd/SBmgyssiezdTfg4T0/Zuk5v0GxNhhFZPGic2BR/QsSAgnVlkLVXxUWaSZDO6ew8v8BMcBcNjoiYNo2THcd/3WBSe0wsVsgaSlvuSIpYocNtIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002143; c=relaxed/simple;
	bh=I7MSo9WOwr4lJLhtKFoOw88/1oTcYTTYXnWaDAe+DNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5wKAiO3rM8z5dgpct/9v8DKGy4OTkhU34J7CCnqCVoKSOkmewRG9AiBDx1kGNHQdXz+0np+eAj9q5cO2/vnVJUUI9H1bitx9J/AdExHDthSWBz8G75Mq1x0O74D6PDv4DGWsBtAnPaIJT7xwJ+KkDch6eVi9sqzlF8xeUtqZSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lokYA2Yz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F025C116C6;
	Mon, 24 Nov 2025 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764002143;
	bh=I7MSo9WOwr4lJLhtKFoOw88/1oTcYTTYXnWaDAe+DNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lokYA2YzZUaupKH1NK/Vw6ZbU1l2rM3XI7B7LMARzorFoe2gx0ZK/owK2ADCrZdo+
	 hEGpiL2U88GI4ieX0ItFkN3aJB4o2QSuRsCaPO7Soxva8mx0owRc/GHdFaAramDc81
	 juwSrIQ738W/0I1bQgCguRARz8NqwFeRwjsiI2X0d1FppYxPErhXnkH2qRsj3+p95f
	 7HcRLAXa/rsf/XrvbMmHd1AgNApROAws6uJh9iNNfxGBnJI+FjLKkdPMIGTIExkITi
	 F/RShvrO65ndY+i1fOEP3Hdyc1KR+rvlkQNX5G6HvOykIF/Poh1C2r50ZWZFnyw98y
	 RsQ6EW5GSD/ew==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vNZXT-000000004q3-1VeT;
	Mon, 24 Nov 2025 17:35:43 +0100
Date: Mon, 24 Nov 2025 17:35:43 +0100
From: Johan Hovold <johan@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V3 1/1] USB: serial: option: add Telit FN920C04 RNDIS
 compositions
Message-ID: <aSSJX8bP4v8oCrA3@hovoldconsulting.com>
References: <20251121053956.263364-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20251121053956.263364-2-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121053956.263364-2-Qing-wu.Li@leica-geosystems.com.cn>

On Fri, Nov 21, 2025 at 05:39:56AM +0000, LI Qingwu wrote:

Including an introductory phrase here (e.g. from you cover letter) would
be nice.

> 0x10a1: RNDIS + tty (NMEA) + tty (AT) [+ tty (DIAG)]
> T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  6 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=10a1 Rev= 5.15
> S:  Manufacturer=Telit Cinterion
> S:  Product=FN920
> S:  SerialNumber=76e7cb38
> C:* #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=ef(misc ) Sub=04 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=(none)
> E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Have you tried binding the RNDIS driver and made sure it works here?

> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> 0x10a6: RNDIS + tty (AT) + tty (AT) [+ tty (DIAG)]
> T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  5 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=10a6 Rev= 5.15
> S:  Manufacturer=Telit Cinterion
> S:  Product=FN920
> S:  SerialNumber=76e7cb38
> C:* #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=ef(misc ) Sub=04 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=(none)
> E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Nit: last endpoint fell out when you resent.

> 0x10aa: MBIM + tty (AT) + tty (diag) + DPL + ADB

I guess you meant "RNDIS" here too?

> T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  5 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=10ab Rev= 5.15
> S:  Manufacturer=Telit Cinterion
> S:  Product=FN920
> S:  SerialNumber=76e7cb38
> C:* #Ifs= 6 Cfg#= 1 Atr=e0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=ef(misc ) Sub=04 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=ef(misc ) Sub=04 Prot=01 Driver=(none)
> E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=(none)
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/usb/serial/option.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 5de856f65f0d..b521d47cda53 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1401,12 +1401,16 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = NCTRL(0) | RSVD(1) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a0, 0xff),	/* Telit FN20C04 (rmnet) */
>  	  .driver_info = RSVD(0) | NCTRL(3) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a1, 0xff),	/* Telit FN20C04 (RNDIS) */

The comment should say "FN920C04 (RNDIS)", right?

> +	  .driver_info = NCTRL(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a2, 0xff),	/* Telit FN920C04 (MBIM) */
>  	  .driver_info = NCTRL(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a3, 0xff),	/* Telit FN920C04 (ECM) */
>  	  .driver_info = NCTRL(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a4, 0xff),	/* Telit FN20C04 (rmnet) */
>  	  .driver_info = RSVD(0) | NCTRL(3) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a6, 0xff),	/* Telit FN20C04 (RNDIS) */

Here too.

> +	  .driver_info = NCTRL(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a7, 0xff),	/* Telit FN920C04 (MBIM) */
>  	  .driver_info = NCTRL(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10a8, 0xff),	/* Telit FN920C04 (ECM) */
> @@ -1415,6 +1419,8 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = RSVD(0) | NCTRL(2) | RSVD(3) | RSVD(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10aa, 0xff),	/* Telit FN920C04 (MBIM) */
>  	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x10ab, 0xff),	/* Telit FN920C04 (RNDIS) */
> +	  .driver_info = NCTRL(3) | RSVD(4) | RSVD(5) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x30),	/* Telit FE990B (rmnet) */
>  	  .driver_info = NCTRL(5) },
>  	{ USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x10b0, 0xff, 0xff, 0x40) },

Johan

