Return-Path: <linux-usb+bounces-11718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F191A018
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 09:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA201C20DD1
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 07:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA3F47A6A;
	Thu, 27 Jun 2024 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPIsFU0U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACECB4317C
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 07:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472376; cv=none; b=SSMqXeyBxJ+Cy9s1cjyWIDDsL76Zy+kxra007A75Purt7b6PmF05+tzvFJcRKLqIIJwWg60/xseB8z2MMpfC/YhPTrrUA08c4fOYKVI/1mTXxab6Y5GOU28FiM/ICQ9X7oukx7f+0lNVx6Dcc1s4grenF8mkxzCszu6tdm+OxSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472376; c=relaxed/simple;
	bh=y/s6OWrXywXaVcl48+no62t80RLgNurzpwMoQyYC8cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnAwIgBm4epOSTvm8gaYLcwsaAkgqlpx+FUx6JeTHakLgA/TWtiUBIJgY+Bo5kVuut83G8gFPSnS2qFYv2eZ7fduPYo0X20qMl3e17ogAGgOS0o8kIiu+f/B9YvZ6/+NrWOU3l1tWfc9x84nZXwNWXTbDr7dGs+WoQ7p8cHL9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPIsFU0U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC7FC2BBFC;
	Thu, 27 Jun 2024 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719472376;
	bh=y/s6OWrXywXaVcl48+no62t80RLgNurzpwMoQyYC8cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPIsFU0UBZdr3mc06mtOx9Y9yLug9iN986/HkdBSAkSVAdBVN8MZIC0Z8IjzxBtDS
	 5Y8+0Y1oF5Es5bjOx1aSOYDnrmUHawCDqYVHWZNZqqu+EY2cAV58vczVK01PRCk1w2
	 ieyNScHds1lvJ8rhf2XbRcby8k+tws59JeVXNrl4dlkehRcHiE6l4XoJfNiZfbAjsh
	 SX5jEfbqy/+XiKo3/YT783O6hOy+6oHWDMPtiATygvYYUzpGTKU3Z9ujg0AemygC3U
	 7Qpup72pHlxILYr50kEftn0pY4P7gSJXYWlrDDudTjNVdt65bBzLbJSDJ6XNwNczHM
	 VrEurrC41czTQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMjJc-000000000SF-1TJD;
	Thu, 27 Jun 2024 09:13:09 +0200
Date: Thu, 27 Jun 2024 09:13:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Jerry =?utf-8?B?TWVuZyjokpnmnbAp?= <jerry.meng@quectel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: support NetPrisma LCUK54 series
Message-ID: <Zn0RBEjF6E1F70JH@hovoldconsulting.com>
References: <SEZPR06MB61391C210687243BE28D560793172@SEZPR06MB6139.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR06MB61391C210687243BE28D560793172@SEZPR06MB6139.apcprd06.prod.outlook.com>

On Thu, Apr 25, 2024 at 03:51:04AM +0000, Jerry Meng(蒙杰) wrote:
> LCUK54 series have four PIDs, 0x0100, 0x0111, 0x0112 and 0x0113,
> with the same interface layout.
> 
> If#= 3: DIAG
> If#= 4: NMEA
> If#= 5: AT

What is the difference between the products with different PIDs?

> T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#= 12 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=3731 ProdID=0100 Rev= 5.04
> S:  Manufacturer=NetPrisma
> S:  Product=LCUK54-WWD
> S:  SerialNumber=236ade60
> C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms

What's this interface?

> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=70 Driver=(none)
> E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 7 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
> E:  Ad=8f(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

And what are these two for. Please include all interfaces in the
interface description above.

> Signed-off-by: Jerry Meng <jerry@netprisma.us>
> ---
>  drivers/usb/serial/option.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 8a5846d4a..6b1f1b8bd 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -622,6 +622,14 @@ static void option_instat_callback(struct urb *urb);
>  /* MeiG Smart SLM320 based on UNISOC UIS8910 */
>  #define MEIGSMART_PRODUCT_SLM320		0x4d41
>  
> +/* NetPrisma products */
> +#define NETPRISMA_VENDOR_ID            0x3731
> +#define NETPRISMA_PRODUCT_LCUK54_100   0x0100
> +#define NETPRISMA_PRODUCT_LCUK54_111   0x0111
> +#define NETPRISMA_PRODUCT_LCUK54_112   0x0112
> +#define NETPRISMA_PRODUCT_LCUK54_113   0x0113

And please drop these in favour of using constants with a comment after
the first entry for the PID. For example:

	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0100, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54 */

Johan

