Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7F63BA8C7
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jul 2021 14:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhGCMz5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Jul 2021 08:55:57 -0400
Received: from mout02.posteo.de ([185.67.36.66]:40127 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhGCMz4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Jul 2021 08:55:56 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 9CBCB2400E5
        for <linux-usb@vger.kernel.org>; Sat,  3 Jul 2021 14:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1625316801; bh=cTAS6jnLHw5wSKAvgGLK/HWE5xksPvue7CmuoXNFnzU=;
        h=From:To:Subject:Date:From;
        b=PAiYS9N+/5msoVE7I3nL8AgYzdSVAY/wg9cjtPu1r8WcYMBf6Ngb7btbInTRbrvSr
         39NAVBdJ56oH8KqT6YTWwKJURkF/f60ayS/8D+pKw/bZlgqnKNAaBvduFAJtwpOom1
         VFD9gCtbhbwU53DpdZ3Law6ZelvI1v/hQNTfh5UHo+kJn8wzO7qxDHZOUkEO+eKBKO
         VoKwk5D0kL1yFEw2B0D2imEeroBrzf08dNFfCnTkJXGAWjZdLGDg2f9x9WhfCq2nPX
         ruiKgs95CS3qukh7dQ+LL1NvtbAXnDZ7yaFP7lW8OXT6px6obcEZhMWq9nEJ883l5M
         qR1d2Wo100PgA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4GHBhK0kMjz6tm5;
        Sat,  3 Jul 2021 14:53:21 +0200 (CEST)
From:   Marco De Marco <marco.demarco@posteo.net>
To:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: option: Add support for u-blox LARA-R6 family
Date:   Sat, 03 Jul 2021 12:53:20 +0000
Message-ID: <2990355.UxunKf390f@mars>
In-Reply-To: <YN1rUbJ9OKWMfwDp@hovoldconsulting.com>
References: <2644396.hb5XgcuobH@mars> <YN1rUbJ9OKWMfwDp@hovoldconsulting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The patch is meant to support LARA-R6 Cat 1 module family.

Module USB ID:
Vendor  ID: 0x05c6
Product ID: 0x90fA

Interface layout:
If 0: Diagnostic
If 1: AT parser
If 2: AT parser
If 3: QMI wwan (not available in all versions)

Signed-off-by: Marco De Marco <marco.demarco@posteo.net>

=2D--

ADB interface is not available.=20
Diagnostic interface (If 0) can be used with option driver.

Output of usb-devices command (this version does not have QMI WWAN):
T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  3 Spd=3D480 MxC=
h=3D 0
D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D05c6 ProdID=3D90fa Rev=3D00.00
S:  Manufacturer=3DQualcomm, Incorporated
S:  Product=3DQualcomm CDMA Technologies MSM
S:  SerialNumber=3D7da8aacd
C:  #Ifs=3D 3 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D500mA
I:  If#=3D0x0 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3D30 Driver=
=3D(none)
I:  If#=3D0x1 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3D(none)
I:  If#=3D0x2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dfe Prot=3Dff Driver=
=3D(none)

Thanks for your patience.

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index d08e1de26..bef24b50b 100644
=2D-- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1115,6 +1115,7 @@ static const struct usb_device_id products[] =3D {
 	{QMI_FIXED_INTF(0x05c6, 0x9083, 3)},
 	{QMI_FIXED_INTF(0x05c6, 0x9084, 4)},
 	{QMI_FIXED_INTF(0x05c6, 0x90b2, 3)},    /* ublox R410M */
+	{QMI_QUIRK_SET_DTR(0x05c6, 0x90fa, 3)}, /* ublox R6XX  */
 	{QMI_FIXED_INTF(0x05c6, 0x920d, 0)},
 	{QMI_FIXED_INTF(0x05c6, 0x920d, 5)},
 	{QMI_QUIRK_SET_DTR(0x05c6, 0x9625, 4)},	/* YUGA CLM920-NC5 */
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index aeaa3756f..32d1eac8c 100644
=2D-- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -238,6 +238,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_UC15			0x9090
 /* These u-blox products use Qualcomm's vendor ID */
 #define UBLOX_PRODUCT_R410M			0x90b2
+#define UBLOX_PRODUCT_R6XX			0x90fa
 /* These Yuga products use Qualcomm's vendor ID */
 #define YUGA_PRODUCT_CLM920_NC5			0x9625
=20
@@ -1101,6 +1102,8 @@ static const struct usb_device_id option_ids[] =3D {
 	/* u-blox products using Qualcomm vendor ID */
 	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
 	  .driver_info =3D RSVD(1) | RSVD(3) },
+	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
+	  .driver_info =3D RSVD(3) },
 	/* Quectel products using Quectel vendor ID */
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, =
0xff, 0xff, 0xff),
 	  .driver_info =3D NUMEP2 },




On gioved=EC 1 luglio 2021 09:14:25 CEST you wrote:
> On Wed, Jun 30, 2021 at 07:09:20PM +0000, Marco De Marco wrote:
> > Support for u-blox LARA-R6 modules family, usb serial interface.
>=20
> Please include the interface layout here too (cf. commit 4205cb01f6e9
> ("USB: serial: option: adding support for ublox R410M")) and post the
> output of usb-devices (or lsusb -v) for this device.
>=20
> Isn't there an ADB interface that should be reserved as well for
> example?
>=20
> Please also use the common "USB: serial: option:" prefix in your commit
> summary (Subject).
>=20
> > Signed-off-by: Marco De Marco <marco.demarco@posteo.net>
> > ---
> >=20
> >=20
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index aeaa3756f..05d0379c9 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -238,6 +238,7 @@ static void option_instat_callback(struct urb *urb);
> >=20
> >  #define QUECTEL_PRODUCT_UC15			0x9090
> >  /* These u-blox products use Qualcomm's vendor ID */
> >  #define UBLOX_PRODUCT_R410M			0x90b2
> >=20
> > +#define UBLOX_PRODUCT_R6XX          0x90fa
>=20
> Looks like the indentation for the value is off here, or in any case you
> should be using tabs rather than spaces.
>=20
> >  /* These Yuga products use Qualcomm's vendor ID */
> >  #define YUGA_PRODUCT_CLM920_NC5			0x9625
> >=20
> > @@ -1101,6 +1102,8 @@ static const struct usb_device_id option_ids[] =
=3D {
> >=20
> >  	/* u-blox products using Qualcomm vendor ID */
> >  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R410M),
> >  =09
> >  	  .driver_info =3D RSVD(1) | RSVD(3) },
> >=20
> > +	{ USB_DEVICE(QUALCOMM_VENDOR_ID, UBLOX_PRODUCT_R6XX),
> > +	  .driver_info =3D RSVD(3) },
> >=20
> >  	/* Quectel products using Quectel vendor ID */
> >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC=
21,
> >  	0xff, 0xff, 0xff),>  =09
> >  	  .driver_info =3D NUMEP2 },
>=20
> Johan




