Return-Path: <linux-usb+bounces-11722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609A791A05B
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 09:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C95928240A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 07:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13984D8C3;
	Thu, 27 Jun 2024 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sc0FoZ/V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174DB4D8B9
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719473053; cv=none; b=ZHNZFU9ymHzZVdzBC/X1O2ERbLhyAsN5VVKMG+v/3nRqkK/bx1CD6Ht72qaF+g8LjrT/L/SyCUHnnlPmeoSFQaq9d3whPVx0sxxcgnKOvQ7j2RCoagVM1hJxjHbQdqhN+AI3ZomNmgFFG5V7t/ooi4v+Lnw7MYHc/oSpBPh28lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719473053; c=relaxed/simple;
	bh=BbeT/1G1FwJJE0HpjRA6Gl0u8SMOd7yixJ1GUKKhIjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfUA2h6jY+BSAYObwqIymr/PRZ4REQsEV/df7v5DJFfeIqaOcRpCF4bBqz9RAx6Cot69WgdNfzxAiRjdiO+uKH4e5/hyM+ZBSTCdmMcHz44/L2S9H1ruB7oiG9EAPSkCw7UQIRLZXhhFdGLrxB2bhrVNbKGrI3uI3/cURkdMRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sc0FoZ/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EECAC2BBFC;
	Thu, 27 Jun 2024 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719473052;
	bh=BbeT/1G1FwJJE0HpjRA6Gl0u8SMOd7yixJ1GUKKhIjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sc0FoZ/Vsunz95yUGi2vi0VnKOPIP5lcVlhNMa7YhgfOqsuQeXA2J/1Vvm6kx4kEc
	 V1W3jqcfJEWPBcrmPOL/r/vrubYgMBQz9GJJ5WnBn2jiQbv235z//FJ25s6jnioNt+
	 rAty+fPolvzUso3TvTi8AfyC9EcBNBaoj0huCzctqXZgqcMPuoU1sVH/zSxMz/ADsZ
	 kbZV2acwMVMiPzgApTkTl6oCL2qBL39uayVBFYjsI/HwXWZpcA14wW43/a1QoacSv2
	 uNVOyRJ86EYlzGosAV9ZqjZjNJrCGWbKcdyVTBM3K+S3ocEeNn5121vahnujD6nHeM
	 IEulsv0pTz53w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMjUX-000000000e1-3YLt;
	Thu, 27 Jun 2024 09:24:25 +0200
Date: Thu, 27 Jun 2024 09:24:25 +0200
From: Johan Hovold <johan@kernel.org>
To: mank <mank@netprisma.us>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB:serial:option:add Netprisma LCUK54 series modules
Message-ID: <Zn0TqbySxFVNwo-6@hovoldconsulting.com>
References: <LV3PR22MB5104866DF8BB6C75AED1D379B0F92@LV3PR22MB5104.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV3PR22MB5104866DF8BB6C75AED1D379B0F92@LV3PR22MB5104.namprd22.prod.outlook.com>

On Wed, Jun 05, 2024 at 12:50:12AM +0000, mank wrote:
> Add support for Netprisma LCUK54 series modules.
> 
> LCUK54-WRD-LWW(0x3731/0x0101): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> LCUK54-WRD-LCN(0x3731/0x0106): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> LCUK54-WWD-LCN(0x3731/0x0115): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL
> LCUK54-WWD-LWW(0x3731/0x0116): MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

Just out of curiosity, what is the difference between the variants here?

> Above products use the exact same interface layout and option
> driver is for interfaces DIAG, NMEA and AT.
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  5 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=3731 ProdID=0101 Rev= 5.04
> S:  Manufacturer=NetPrisma
> S:  Product=LCUK54-WRD
> S:  SerialNumber=b6250c36
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
> 
> Signed-off-by: Mank Wang <mank@netprisma.us>

Can you fix up you mailer and resend so that your full name is included
in From?

I think checkpatch.pl would warn about this.

> ---
>  drivers/usb/serial/option.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 8a5846d4adf6..0e8837f37ccd 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -622,6 +622,14 @@ static void option_instat_callback(struct urb *urb);
>  /* MeiG Smart SLM320 based on UNISOC UIS8910 */
>  #define MEIGSMART_PRODUCT_SLM320		0x4d41
>  
> +/* Netprisma Wireless products */
> +#define NETPRISMA_VENDOR_ID			0x3731
> +/* These Netprisma products use Netprisma's vendor ID */
> +#define NETPRISMA_PRODUCT_LCUK54WRD_LWW	0x0101
> +#define NETPRISMA_PRODUCT_LCUK54WRD_LCN	0x0106
> +#define NETPRISMA_PRODUCT_LCUK54WWD_LCN	0x0115
> +#define NETPRISMA_PRODUCT_LCUK54WWD_LWW	0x0116

Please drop these in favour of using constants with a comment after the
first line for the product, for example:

> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x3731, 0x0101, 0xff, 0xff, 0x30) },	/* NetPrisma LCUK54 WRD/LWW */

Johan

