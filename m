Return-Path: <linux-usb+bounces-19139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC767A05C21
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 13:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D0A165DB2
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 12:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979791F9F7D;
	Wed,  8 Jan 2025 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="iH69hbGd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D4BA59;
	Wed,  8 Jan 2025 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.31.204.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340832; cv=none; b=h9HUDd9Ur7rz3wKRqpTnFdCvVQzBMeLgfBgAKUePfKQbBPZSH23QyPGCU7Mw2QyF2izhjez3+8MHZXzgYGkgyguaUMPcPnayD5JJWLIo0QyMZXxcFLI71wqzRSjWDqS7PQLvgqwo1uBlHl0icuHF1TkCWFFi58TeEjNEeaor7Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340832; c=relaxed/simple;
	bh=+4DH9RUDrM3naZIg1di80JpaZvocc403S9FVS/DV5pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHAJneyJ9YmF4byszD/3o8iHH2FxEgZTcHHxT8mYUBvaV/iefJlkFontxnn/Yvie56krsUBRxhrPSJUMmr9c6l86B08dak0JHPuNoWwW1lLKnB8UH8ZmLa3G/Hor5iO0hLFg1YBx/VeaRWl7IX68HjhqsqmCWkw74j3nar606ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz; spf=pass smtp.mailfrom=nic.cz; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=iH69hbGd; arc=none smtp.client-ip=217.31.204.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from localhost (unknown [IPv6:2001:1488:fffe:6:1695:51de:f3c4:a72a])
	by mail.nic.cz (Postfix) with ESMTPSA id 4FB421C11E9;
	Wed,  8 Jan 2025 13:53:47 +0100 (CET)
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=michal.hrusecky@nic.cz smtp.mailfrom=Michal.Hrusecky@nic.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1736340827; bh=+4DH9RUDrM3naZIg1di80JpaZvocc403S9FVS/DV5pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=iH69hbGdgl61yI/dS3T0WfHqetFItFQJ5gUzzGLK90YCuiAPxajkEzIg+1fEa7OjD
	 yQwcpCCSSUXDj1CwTEcLOkiKrLOcQZnuJR70yZmWgN7BNjTR3reF+b2dBU4HaZf91N
	 e9jOChv2gasRpfDLe9HbxAAmIO2qWuL9we+7+1p8=
Date: Wed, 8 Jan 2025 13:53:46 +0100
From: Michal Hrusecky <Michal.Hrusecky@nic.cz>
To: Johan Hovold <johan@kernel.org>
Cc: Michal Hrusecky <michal.hrusecky@turris.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Neoway N723-EA support
Message-ID: <7kcoujzqccjnegcngm56qjph37ksdhp6meubdjp7iwf6wtruoo@qxbwx2b32iry>
X-Operating-System: Linux
References: <csxkrj4qclw3yzijwr57zqqd737kk47zpwjvy6t2oxnobmvswp@o5gt4k7vtwql>
 <Z35YL54e1eBPslEv@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z35YL54e1eBPslEv@hovoldconsulting.com>
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 4FB421C11E9
X-Spamd-Result: default: False [-0.10 / 16.00];
	MIME_GOOD(-0.10)[text/plain];
	WHITELISTED_IP(0.00)[2001:1488:fffe:6:1695:51de:f3c4:a72a];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25192, ipnet:2001:1488::/32, country:CZ];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Server: mail

Johan Hovold - 11:49  8.01.25 wrote:
> On Tue, Jan 07, 2025 at 05:08:29PM +0100, Michal Hrusecky wrote:
> > Update the USB serial option driver to support Neoway N723-EA.
> > 
> > ID 2949:8700 Marvell Mobile Composite Device Bus
> > 
> > T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> > D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> > P:  Vendor=2949 ProdID=8700 Rev= 1.00
> > S:  Manufacturer=Marvell
> > S:  Product=Mobile Composite Device Bus
> > S:  SerialNumber=200806006809080000
> > C:* #Ifs= 5 Cfg#= 1 Atr=c0 MxPwr=500mA
> > A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=03
> > I:* If#= 0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
> > E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> > I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> > E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > E:  Ad=0c(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> > E:  Ad=89(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> > E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > E:  Ad=0b(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> > E:  Ad=86(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> > E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > E:  Ad=0e(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > I:* If#= 6 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> > E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=4096ms
> > E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > E:  Ad=0a(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> > 
> > Tested successfully connecting to the Internet via rndis interface after
> > dialing via AT commands on If#=4 or If#=6.
> > 
> > Not sure of the purpose of the other serial interface.
> > 
> > Signed-off-by: Michal Hrusecky <michal.hrusecky@turris.com>
> > ---
> >  drivers/usb/serial/option.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 64317b390d22..758f02f0d2b9 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -2412,6 +2412,7 @@ static const struct usb_device_id option_ids[] = {
> >  	  .driver_info = NCTRL(1) },
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
> >  	  .driver_info = NCTRL(3) },
> > +	{ USB_DEVICE(0x2949, 0x8700) },						/* Neoway N723-EA */
> 
> This should be USB_DEVICE_INTERFACE_CLASS() to avoid trying to bind to
> the rndis interfaces.
> 
> I fixed this up when applying.

Ah, sorry for the inconvenience and thank you very much!

Michal

