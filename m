Return-Path: <linux-usb+bounces-29966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01502C267C1
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 18:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12A04267EE
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 17:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82A534403D;
	Fri, 31 Oct 2025 17:45:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from nyx.bastelmap.de (nyx.bastelmap.de [185.233.106.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A6833DED9
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.106.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761932756; cv=none; b=FN1wRmYCMIMvZyxBijLD/C0CcwMpHrIN0n/YjwNJc/FK/a2VBquqnobAEhM53TXuQvZkUUZxDhjWtkdVe7ym7VYsadHbd99IKvAr5fPBv4DDMa4HFSyuF2C7kBke7psgzV+kWJJdLjeRxyqqLQzIAVf0cjOZGZ1GeQQXACDhP44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761932756; c=relaxed/simple;
	bh=rHVrXtleSDnjAzIFGGiGizUcGXnb3oyF8t+NOQBJOds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA/yDRWhZeQtdz/vSBv4GwPmJyFQXlRJc1jaq2L3V/DehwJxV7Ktj2XCEpTBU6iFZlfij54X29ZH6NpGZLIyjskkfZCFi83obsGTChQyWPMToN0XO/45+/z+fAl7iQbWvv9PwK1uEMO1VJIJLEk5GZsI0NV7O6TawRejRQf49bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bastelmap.de; spf=pass smtp.mailfrom=bastelmap.de; arc=none smtp.client-ip=185.233.106.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bastelmap.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bastelmap.de
Received: from zeus.ad.home.arpa (p4fdbaf3c.dip0.t-ipconnect.de [79.219.175.60])
	by nyx.bastelmap.de (Postfix) with ESMTPSA id 117657F08F5;
	Fri, 31 Oct 2025 18:45:48 +0100 (CET)
Date: Fri, 31 Oct 2025 18:45:46 +0100
From: Andreas Messer <andi@bastelmap.de>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] Support FlashPro5 serial ports
Message-ID: <aQT1ynWbVTb7J2hl@zeus.ad.home.arpa>
References: <aQPdYic6PaONe9hk@zeus.ad.home.arpa>
 <aQS8RwAeqjueoVXb@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AyHknbThKH8vx0L4"
Content-Disposition: inline
In-Reply-To: <aQS8RwAeqjueoVXb@hovoldconsulting.com>


--AyHknbThKH8vx0L4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am Fri, Oct 31, 2025 at 02:40:23PM +0100 schrieb Johan Hovold:
> On Thu, Oct 30, 2025 at 10:49:22PM +0100, Andreas Messer wrote:
>=20
> > I have added more entries to the device list to make all UART Channels
> > working with my board. However it will make these UARTS show up with SF=
2+
> > Board too. I found at least four different device which have the=20
> > same Vendor/Product ID, but I assume there are more:
> >=20
> > - Trenz SMF2000: FT2232H
> >   Channel A -> JTAG, Channel B -> UART
> >=20
> > - Microchip Polarfire Discovery Kit: FT4232H
> >   Channel A -> JTAG, Channel B/C/D -> UART
>=20
> Where did you find these two? Do you have access to the devices?

For the Trenz I found the information in the web here:

https://wiki.trenz-electronic.de/display/PD/TEM0001+TRM

I own the Discovery Kit but the schematic is also public=20
available here:

https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocu=
ments/BoardDesignFiles/PolarFire_SoC_Discovery_Kit_Schematics.zip


> > - Microsemi/Microchip FlashPro5: FT4232H
> >   Channel A -> JTAG
>=20
> I guess you forgot "Channel B/C/D -> UART" here?

No, the standalone FlashPro5 hardware has only a JTAG Port

https://www.microchip.com/en-us/development-tool/flashpro5


> It would be good to avoid enabling unused ports on devices that only
> have one UART (e.g. to avoid regressing udev rules).
>=20
> You could use something like ftdi_8u2232c_probe() and only enable the
> other ports (i.e. B and D) after comparing the product name to a
> whitelist.

Ok, I'll have a look at it and try to come with a solution.=20
Thanks for the pointer!

Andreas

--=20
gnuPG keyid: 8C2BAF51
fingerprint: 28EE 8438 E688 D992 3661 C753 90B3 BAAA 8C2B AF51

--AyHknbThKH8vx0L4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQQo7oQ45ojZkjZhx1OQs7qqjCuvUQUCaQT1xwAKCRCQs7qqjCuv
UcfBAKDjaGf8FY+YdcXdP4R1Kzubz+cnewCgor4ZI4A4ltPEi6tpoG9sKqZd2fE=
=Ry6J
-----END PGP SIGNATURE-----

--AyHknbThKH8vx0L4--

