Return-Path: <linux-usb+bounces-11165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715199049D8
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 06:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EC481C2336F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 04:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6181B1F92F;
	Wed, 12 Jun 2024 04:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ZMdSfVdo"
X-Original-To: linux-usb@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06207257D
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 04:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718165222; cv=none; b=XXUuX0oomru7RIDVv7d/2cSF30GddSdk3aIKJlLjCQlgViDe53tVpIB6HQqIbTOT9TS42U9EYbTotEJAXvoxvTzjLzNVypUtA+ovVcYy1X4HtBUnMGJqda4AfCoKiNRbr6BFABfFNav/vjbncPj02/6CTyt3OD5gSl4xGwg8/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718165222; c=relaxed/simple;
	bh=VWU510IEJaei7L1fm9T7NBMsy32IPQo29pSxnBveuLM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rwqGfMITAlRGyHvJhjQyHOYv39K/UAI358dDif4V/dRt5TC/rOkk6XgsUdbhUJjD/zyrhZmx14Aeljk0miWH8rZowGlcPtu1zv+XKVgP3lzVZHuV2/8VN0MSG6bfeV/7uVpYMJMOkCqiH7538jZ4xcQVeMO7U8WrVlAOuZ4jTx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ZMdSfVdo; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6BFC62018F;
	Wed, 12 Jun 2024 12:06:56 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718165218;
	bh=CC+bF8lNbNgXo0LrTA+eL6Px83RxgIPHQTvQeVNUAxI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZMdSfVdoHqtOjSg/Oo5ZrrxUzRHEfJxyzPNIykWyhwCgvnvKctoBiZZmft+GuBN2b
	 MzhRIrOHD8cY7Yc0nwJmKPb2HWR8Yczezz+kSwvLxtDDA85RZDuB3HiMfqisArdup8
	 5m2kj7xD57FSu+WTQ9eRSCz/zpqgtrnoDDqZNc2shMYNOvuAps8RU389NFUsKw3Aan
	 b+bV8wggxzqh6A1SGDte6M9IC459oa1y4/AUlqr8e6t+qOSGgNckrnf8uCE57B7RcE
	 3qap+VcS3eazeZ9fh8Gti8+kHd9QG+kPaG4zccjOGA+7ozumwC4RW35OKzoN47wnAG
	 VKoWYpWSawAXg==
Message-ID: <de1c329751bfc327901c969eafecb7624aaf6a97.camel@codeconstruct.com.au>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix device address
 configuration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Neal Liu
 <neal_liu@aspeedtech.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org
Date: Wed, 12 Jun 2024 13:36:52 +0930
In-Reply-To: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
References: <20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-06-12 at 10:07 +0800, Jeremy Kerr wrote:
> In the aspeed UDC setup, we configure the UDC hardware with the assigned
> USB device address.
>=20
> However, we have an off-by-one in the bitmask, so we're only setting the
> lower 6 bits of the address (USB addresses being 7 bits, and the
> hardware bitmask being bits 0:6).
>=20
> This means that device enumeration fails if the assigned address is
> greater than 64:
>=20
> [  344.607255] usb 1-1: new high-speed USB device number 63 using ehci-pl=
atform
> [  344.808459] usb 1-1: New USB device found, idVendor=3Dcc00, idProduct=
=3Dcc00, bcdDevice=3D 6.10
> [  344.817684] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [  344.825671] usb 1-1: Product: Test device
> [  344.831075] usb 1-1: Manufacturer: Test vendor
> [  344.836335] usb 1-1: SerialNumber: 00
> [  349.917181] usb 1-1: USB disconnect, device number 63
> [  352.036775] usb 1-1: new high-speed USB device number 64 using ehci-pl=
atform
> [  352.249432] usb 1-1: device descriptor read/all, error -71
> [  352.696740] usb 1-1: new high-speed USB device number 65 using ehci-pl=
atform
> [  352.909431] usb 1-1: device descriptor read/all, error -71
>=20
> Use the correct mask of 0x7f (rather than 0x3f), and generate this
> through the GENMASK macro, so we have numbers that correspond exactly
> to the hardware register definition.
>=20
> Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

