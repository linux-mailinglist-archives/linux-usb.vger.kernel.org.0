Return-Path: <linux-usb+bounces-11720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A091A034
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 09:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E9051C210DA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 07:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6504C46B83;
	Thu, 27 Jun 2024 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQEEZlXU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BD62F41
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472629; cv=none; b=OA1AOB1J5soqtJn5L/oGt1VD8mvja4Kmj6ptbGhrygUHHBqJ0k2EBXqBIZfHSr3V4YyeYlnOQJt2mH1fmjFkVxq/JFUw3ma5mA7O5VVha27R4eURJfM3s+ITI0ToR98/M5VFUz0HGTEn7gO70QJdnOogvYXOeR+mojrFrbXW658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472629; c=relaxed/simple;
	bh=tA+evfTFjDfgsAI4Bs+Tachrc/lHuwT6z3zqIzz2plw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck2fHNwxGbf1yZbkM+oE9Wsyv88JXFQfxFWSBiofRAcgDqbALSPFvQ6q4+wdUWYJDw8w0P3gZ+SsfnTU8YFPOSeloyrcoztVQ7VZCqihX6/iWbq47RpqEVGx6WjqYOgnR5gz8EOUxC8wwWsLsR7MlaJyteVv0scnn8ECPQQSdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQEEZlXU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B40C2BBFC;
	Thu, 27 Jun 2024 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719472628;
	bh=tA+evfTFjDfgsAI4Bs+Tachrc/lHuwT6z3zqIzz2plw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQEEZlXUp1gx8fB38wrJj+jK77wPIbpDbVLGn+VfB3f3rOdeA7t0u3bde4i47ZZvw
	 qkv4KuLOWWPeSVPJRPD53JhagwflWhVEikpOAQ2ldKAc3OQOAoc2rnXAj7x0Mg+jHX
	 SjI9RQDi18CaxwzmuY+C5+d2qFustPtynIRGo6GAi5iikueqkE3XmQriW4DhkAnOcu
	 yR9QzayxPJ6hQBpoq+dvToK6u+lx4HRXmmTgZQO8LWZ6XTrcaYFPxSN3gMn9oSeUwR
	 zXtLeN8q+WP19ZxlG6hId8PW4J4Q6aG+cu1nkon1IppeOZcOacu7LjNaaJE9BdpPPn
	 SJKf5l8vFozfA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sMjNh-000000000YK-2Vkc;
	Thu, 27 Jun 2024 09:17:21 +0200
Date: Thu, 27 Jun 2024 09:17:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit generic core-dump
 composition
Message-ID: <Zn0SAXwM45_XF1VX@hovoldconsulting.com>
References: <20240530080053.1094657-1-dnlplm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530080053.1094657-1-dnlplm@gmail.com>

On Thu, May 30, 2024 at 10:00:53AM +0200, Daniele Palmas wrote:
> Add the following core-dump composition, used in different Telit modems:
> 
> 0x9000: tty (sahara)
> T:  Bus=03 Lev=01 Prnt=03 Port=07 Cnt=01 Dev#= 41 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=9000 Rev=00.00
> S:  Manufacturer=Telit Cinterion
> S:  Product=FN990-dump
> S:  SerialNumber=e815bdde
> C:  #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=2mA
> I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 8a5846d4adf6..a58dd4ef461b 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1433,6 +1433,8 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = NCTRL(2) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x701b, 0xff),	/* Telit LE910R1 (ECM) */
>  	  .driver_info = NCTRL(2) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x9000, 0xff),	/* Telit generic core-dump device */
> +	  .driver_info = NCTRL(0) },

ZLP not needed like for the other flashing device entries?

>  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9010),				/* Telit SBL FN980 flashing device */
>  	  .driver_info = NCTRL(0) | ZLP },
>  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x9200),				/* Telit LE910S1 flashing device */

Johan

