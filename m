Return-Path: <linux-usb+bounces-29955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE975C254A5
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29A494E3ED6
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF3C22D78A;
	Fri, 31 Oct 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMqAI0HW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E412253EB
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918014; cv=none; b=FvZPEDWAj4Pc/FgUJLz1AbaaoMSFoZgGV97oRMYeotmBFRShq++cZU1ZarnVEC4czibeHDRtC7cx1JoA50R+BTx0gqBe7X0dfn4PrwkVSpvyAdmL88RYcCZbeyfY9yXseRzk8rwjA1SoiZdcFXkyMqnwNfp4aLBKwUhhATqjHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918014; c=relaxed/simple;
	bh=KNpskwFR5G3PDllY6+cnZdqFCqpPSArAkPL9BrRXigY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCiHvVeg3qol8jdfNON96HglPwVbPhoGgBRdLTDGRJDZRx8Jce9rERDMuc6sRB+A2W2GNilOCurKukxtsduC3JhspirvuZg6hNuQZ7a8Okhp/VE8erFQcrqZJ0hY/xn3Niu9FsaZ6x3JaMXW559yyAQRG8GMRPZgePYo3dfNbd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMqAI0HW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF97DC4CEE7;
	Fri, 31 Oct 2025 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761918014;
	bh=KNpskwFR5G3PDllY6+cnZdqFCqpPSArAkPL9BrRXigY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMqAI0HWvOSZYzY8eTtxwyhPOqKoL8y091mZY4VRM6OyiBtGVKl19yObI+RKXS1/m
	 y2+40Xs+x7AcgsOWPnseWCGcgWmVFAIp9Ola2onImsCg2UdsrvV7c4fCXuY/DBFZfu
	 wr7rY4okPl02Tlzung+FfAFrCUYzzqgXCQ0YXusj+nyM6kvrKUuNY4gF/U03t0oW2c
	 gRbjj6Ecd0vIx17462cRY74aVbXpyNaLHJOPQLHzczIRjbszScuGqVtoV79KC5CVEt
	 I4S0BkTspkRXnmYCUMFmk+8wJP/cwL71B1ZBIzvSdOUOX/Ab+vPwkSjAJFgeAarcFx
	 elswJvmuD8UMg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vEpMd-000000007Oc-1sk1;
	Fri, 31 Oct 2025 14:40:23 +0100
Date: Fri, 31 Oct 2025 14:40:23 +0100
From: Johan Hovold <johan@kernel.org>
To: Andreas Messer <andi@bastelmap.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] Support FlashPro5 serial ports
Message-ID: <aQS8RwAeqjueoVXb@hovoldconsulting.com>
References: <aQPdYic6PaONe9hk@zeus.ad.home.arpa>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56lg3oCTWnbQRd/r"
Content-Disposition: inline
In-Reply-To: <aQPdYic6PaONe9hk@zeus.ad.home.arpa>


--56lg3oCTWnbQRd/r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 10:49:22PM +0100, Andreas Messer wrote:

> I'm currently working with a Microchip Polarfire Discovery Kit. It has
> integrated a FTDI USB Converter IC connected to JTAG and 3x UART of the
> SoC in the kit. It identifies itself on USB as "Microsemi Embedded FlashP=
ro5"
>=20
> Only one of the UART ports is working with the current ftdio_sio driver.=
=20
> I found a device id entry for Microsemi Arrow SF2+ Board=20
> which has same Vendor & Product ID like my board but enables only one UAR=
T.
>=20
> I have added more entries to the device list to make all UART Channels
> working with my board. However it will make these UARTS show up with SF2+
> Board too. I found at least four different device which have the=20
> same Vendor/Product ID, but I assume there are more:
>=20
> - Trenz SMF2000: FT2232H
>   Channel A -> JTAG, Channel B -> UART
>=20
> - Microchip Polarfire Discovery Kit: FT4232H
>   Channel A -> JTAG, Channel B/C/D -> UART

Where did you find these two? Do you have access to the devices?
=20
> - Microsemi/Microchip FlashPro5: FT4232H
>   Channel A -> JTAG

I guess you forgot "Channel B/C/D -> UART" here?

> - Arrow SF2+ Development Kit:
>   Channel A -> JTAG, Channel C -> UART
>=20
> Not sure what would be the proper solution, attached my changes.

It would be good to avoid enabling unused ports on devices that only
have one UART (e.g. to avoid regressing udev rules).

You could use something like ftdi_8u2232c_probe() and only enable the
other ports (i.e. B and D) after comparing the product name to a
whitelist.

Johan

--56lg3oCTWnbQRd/r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaQS8QwAKCRALxc3C7H1l
CHQtAQC0s0nbQTewOPFeKM5OSQjsl+1B0cKTrf4DiIRL05w6wQD9HB3kXvJ/07Qr
qFKmVkQkt4axAUIU7MgomcRSCyyNrQw=
=dA60
-----END PGP SIGNATURE-----

--56lg3oCTWnbQRd/r--

