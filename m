Return-Path: <linux-usb+bounces-32246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E533FD184CA
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 12:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C44683029550
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55FA3803FC;
	Tue, 13 Jan 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXu7yaaG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038936921B;
	Tue, 13 Jan 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301955; cv=none; b=kgQRVMS8jCWQ42OZrIoGI7w3QNbGklz8hFqycUR1iwXv+/SUY5801BhcsgFRIbKH3wJRfGDk6xK40eOUb7IddlNyerAsksy+aVJ9XYPpH33vH8oK5A7koxqm4GZGdwvDFytIVranDHqNg3+vijuVas57Llclqvh0/DsWIJZiG5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301955; c=relaxed/simple;
	bh=VcF85LzT5URE9poSGiNu698xMq2fvTRWQwdD2woy994=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sd2Bx/RkPTGiqmJvYEcF4pEOknNTp8zs9NGVIUR2r5ak2SAQiPSVAGf+RyQ3fD0GpoydqFJG9hoOVgROF5odWCFQ7HjZoQH0MBytC/Udmzt7+5VaU6WsDSr6h26IDSV4X7gzGJ2Xv+Zn+nyoSxBW0K4FiXiZ/vtsWKjySpprdnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXu7yaaG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174B3C116C6;
	Tue, 13 Jan 2026 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301955;
	bh=VcF85LzT5URE9poSGiNu698xMq2fvTRWQwdD2woy994=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXu7yaaG8QUEiZd0YLTb3AcyHA7IpiKbo10MJzBcmFXmIAN7vfazElDFU79QeQezy
	 znrkYUVrSR+qfcbqvUh+esmHcCM6ENYDsNzbQ1gji/8Nhzu4AB2mjzJ8btBNL7+nwp
	 plVUAlGCbyb4frPlNqHLJZV6xvFYcJc0aRkNdhz/IUI9112b6Z2o51QzFSai2OeyEI
	 XNeaPZ906LWguJz5uAY4H7YmZdSe/xsYBfqxSLkT9OsNkZUNNTIuXEyMsQxnSkJrbn
	 ny/zMDGj17XM29ZWQZakS1cZxQ+XBxKT15cVREuXSo3TaDsMBbEjKCqZsa32WKqmqM
	 aPrW2Y1L3ECBQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vfc79-000000002qH-1WyA;
	Tue, 13 Jan 2026 11:59:08 +0100
Date: Tue, 13 Jan 2026 11:59:07 +0100
From: Johan Hovold <johan@kernel.org>
To: Ulrich Mohr <u.mohr@semex-engcon.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: add Telit LE910 MBIM composition
Message-ID: <aWYle9bpMAXZwzhZ@hovoldconsulting.com>
References: <20251209200841.21207-1-u.mohr@semex-engcon.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209200841.21207-1-u.mohr@semex-engcon.com>

On Tue, Dec 09, 2025 at 09:08:41PM +0100, Ulrich Mohr wrote:
> Add support for Telit LE910 module when operating in MBIM composition
> with additional ttys. This usb product ID is used by the module
> when AT#USBCFG is set to 7.
> 
> 0x1252: MBIM + tty(NMEA) + tty(MODM) + tty(MODEM) +SAP
> T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=1252 Rev=03.18
> S:  Manufacturer=Android
> S:  Product=LE910C1-EU
> S:  SerialNumber=0123456789ABCDEF
> C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)

With this patch the driver would bind to this port as well so I edited
the usb-devices output here to match as I assume that is the intention.

> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> 
> Signed-off-by: Ulrich Mohr <u.mohr@semex-engcon.com>
> ---
> Changes in v2: Omit define for PID, use PID (0x1252) directly

> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1252, 0xff) },	/* Telit LE910Cx (MBIM) */

Now applied, thanks.

Johan

