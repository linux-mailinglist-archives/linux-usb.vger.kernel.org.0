Return-Path: <linux-usb+bounces-29928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2193C227BD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 22:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 907F03BC07B
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 21:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B141C33557F;
	Thu, 30 Oct 2025 21:57:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from nyx.bastelmap.de (nyx.bastelmap.de [185.233.106.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2412EC0A0
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.106.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761861476; cv=none; b=ELUyEdj985Fu46voh3aPXby6Bg4oIjcKjVWwzQI6NU+6ifCSegMC1B7euYhc+ehQKfmG1r3ie7JQGu9mup65rtyiiScWVCPnHntqbUK0cgSgWfHi33UwzZHha9pWyccL9Y+Q/ehH403froGbaE0p3M1ho0ep+zByMiXre/RZ2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761861476; c=relaxed/simple;
	bh=0DqVxt4kQbV1/kPrx4fZkFXqhzGebtvZ8x/as3L9smE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e0WY2EnuK/47n00Bc6qhIlMiKB2UJ3QIj7okNfuo7TXq6LuO0yY6YxdJwoRXrDqVn68ZiL1BC9UfEBimUB53YqCc8NADXMm7cJPbPSZHru3Im//XtcMJC7hxV/QZ+0Q9HixsPiyvxUoc5BdxhKqueQ5frmQrs/SjQy2yTR1W2xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bastelmap.de; spf=pass smtp.mailfrom=bastelmap.de; arc=none smtp.client-ip=185.233.106.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bastelmap.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bastelmap.de
Received: from zeus.ad.home.arpa (p4fdbac6c.dip0.t-ipconnect.de [79.219.172.108])
	by nyx.bastelmap.de (Postfix) with ESMTPSA id 5AF967EE2FA;
	Thu, 30 Oct 2025 22:49:23 +0100 (CET)
Date: Thu, 30 Oct 2025 22:49:22 +0100
From: Andreas Messer <andi@bastelmap.de>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] Support FlashPro5 serial ports
Message-ID: <aQPdYic6PaONe9hk@zeus.ad.home.arpa>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sA4KY+d1bypWexMh"
Content-Disposition: inline


--sA4KY+d1bypWexMh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I'm currently working with a Microchip Polarfire Discovery Kit. It has
integrated a FTDI USB Converter IC connected to JTAG and 3x UART of the
SoC in the kit. It identifies itself on USB as "Microsemi Embedded FlashPro=
5"

Only one of the UART ports is working with the current ftdio_sio driver.=20
I found a device id entry for Microsemi Arrow SF2+ Board=20
which has same Vendor & Product ID like my board but enables only one UART.

I have added more entries to the device list to make all UART Channels
working with my board. However it will make these UARTS show up with SF2+
Board too. I found at least four different device which have the=20
same Vendor/Product ID, but I assume there are more:

- Trenz SMF2000: FT2232H
  Channel A -> JTAG, Channel B -> UART

- Microchip Polarfire Discovery Kit: FT4232H
  Channel A -> JTAG, Channel B/C/D -> UART

- Microsemi/Microchip FlashPro5: FT4232H
  Channel A -> JTAG
 =20
- Arrow SF2+ Development Kit:
  Channel A -> JTAG, Channel C -> UART

Not sure what would be the proper solution, attached my changes.

Best regards,
Andreas


---
 drivers/usb/serial/ftdi_sio.c     | 4 +++-
 drivers/usb/serial/ftdi_sio_ids.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 49666c33b41f..44f35aeb0b04 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -908,7 +908,9 @@ static const struct usb_device_id id_table_combined[] =
=3D {
 	{ USB_DEVICE_AND_INTERFACE_INFO(MICROCHIP_VID, MICROCHIP_USB_BOARD_PID,
 					USB_CLASS_VENDOR_SPEC,
 					USB_SUBCLASS_VENDOR_SPEC, 0x00) },
-	{ USB_DEVICE_INTERFACE_NUMBER(ACTEL_VID, MICROSEMI_ARROW_SF2PLUS_BOARD_PI=
D, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ACTEL_VID, MICROSEMI_FLASHPRO5_PID, 1) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ACTEL_VID, MICROSEMI_FLASHPRO5_PID, 2) },
+	{ USB_DEVICE_INTERFACE_NUMBER(ACTEL_VID, MICROSEMI_FLASHPRO5_PID, 3) },
 	{ USB_DEVICE(JETI_VID, JETI_SPC1201_PID) },
 	{ USB_DEVICE(MARVELL_VID, MARVELL_SHEEVAPLUG_PID),
 		.driver_info =3D (kernel_ulong_t)&ftdi_jtag_quirk },
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_si=
o_ids.h
index 4cc1fae8acb9..7e4eb4c3295b 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -929,7 +929,7 @@
  * Actel / Microsemi
  */
 #define ACTEL_VID				0x1514
-#define MICROSEMI_ARROW_SF2PLUS_BOARD_PID	0x2008
+#define MICROSEMI_FLASHPRO5_PID	0x2008
=20
 /* Olimex */
 #define OLIMEX_VID			0x15BA
--=20
2.47.3



--sA4KY+d1bypWexMh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQQo7oQ45ojZkjZhx1OQs7qqjCuvUQUCaQPdXgAKCRCQs7qqjCuv
UX2eAKDhitMElXXNzMfyV8l8+KIq1wetRgCfRENt96t0wkhi1qLhKkw+SVEV7Xg=
=6yso
-----END PGP SIGNATURE-----

--sA4KY+d1bypWexMh--

