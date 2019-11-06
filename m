Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBEAF16BA
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 14:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbfKFNIs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 08:08:48 -0500
Received: from orion.archlinux.org ([88.198.91.70]:49676 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbfKFNIs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 08:08:48 -0500
X-Greylist: delayed 447 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 08:08:46 EST
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 4895C166CBA503;
        Wed,  6 Nov 2019 13:01:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from localhost (unknown [178.128.41.207])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Wed,  6 Nov 2019 13:01:16 +0000 (UTC)
Message-ID: <7cb80237ed20f96d1eb0d3be58c64b71d0c6e9a0.camel@archlinux.org>
Subject: Re: Logitech mouse G900 works only after ~6 seconds after plugging
 it in
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Fabrizio Pelosi <tesfabpel@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20191106134217.37e221af@tesx-pc>
References: <20191106134217.37e221af@tesx-pc>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Lb1NjAo3HiiLHxJ5MDAk"
Date:   Wed, 06 Nov 2019 13:01:13 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.1 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--=-Lb1NjAo3HiiLHxJ5MDAk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-06 at 13:42 +0100, Fabrizio Pelosi wrote:
> I'm having this issue since some kernel releases but I never took the
> time to report it since it's not so severe...
> Anyway, if I plug my mouse (a Logitech G900) the device gets detected
> immediately but starts to work only after ~6 seconds as you can see
> from the log.
>=20
> The mouse is connected via USB cable (without the wireless receiver).
>=20
> I have this issue on a ArchLinux box (running kernel 5.3.8-arch1) and
> also on a Fedora 31 box.
>=20
> NOTE: Also reported here:=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D205449
>=20
> LOG:
> nov 06 08:29:50 tesx-pc kernel: mousedev: PS/2 mouse device common
> for all mice
> nov 06 08:29:50 tesx-pc kernel: logitech-hidpp-device
> 0003:046D:C081.0007: Device not connected
> nov 06 08:29:45 tesx-pc kernel: logitech-hidpp-device
> 0003:046D:C081.0006: input,hidraw5: USB HID v1.11 Mouse [Logitech
> Gaming Mouse G900] on usb-0000:0f:00.3-1.2/input0
> nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 as
> /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> 1.2:1.0/0003:046D:C081.0006/input/input36
> nov 06 08:29:45 tesx-pc kernel: hid-generic 0003:046D:C081.0007:
> input,hiddev4,hidraw6: USB HID v1.11 Keyboard [Logitech Gaming Mouse
> G900] on usb-0000:0f:00.3-1.2/input1
> nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900
> System Control as
> /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> 1.2:1.1/0003:046D:C081.0007/input/input33
> nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900
> Consumer Control as
> /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> 1.2:1.1/0003:046D:C081.0007/input/input32
> nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900
> Keyboard as /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-
> 1.2/5-1.2:1.1/0003:046D:C081.0007/input/input31
> nov 06 08:29:45 tesx-pc kernel: hid-generic 0003:046D:C081.0006:
> input,hidraw5: USB HID v1.11 Mouse [Logitech Gaming Mouse G900] on
> usb-0000:0f:00.3-1.2/input0
> nov 06 08:29:45 tesx-pc kernel: input: Logitech Gaming Mouse G900 as
> /devices/pci0000:00/0000:00:08.1/0000:0f:00.3/usb5/5-1/5-1.2/5-
> 1.2:1.0/0003:046D:C081.0006/input/input30
> nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: SerialNumber: 0E6C36503233
> nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: Manufacturer: Logitech
> nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: Product: Gaming Mouse G900
> nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: New USB device strings:
> Mfr=3D1, Product=3D2, SerialNumber=3D3
> nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: New USB device found,
> idVendor=3D046d, idProduct=3Dc081, bcdDevice=3D 1.03
> nov 06 08:29:44 tesx-pc kernel: usb 5-1.2: new full-speed USB device
> number 5 using xhci_hcd

Oh, it looks to me like the driver thinks the usb device it's a
receiver. I will check this out when I get home.

Cheers,
Filipe La=C3=ADns

--=-Lb1NjAo3HiiLHxJ5MDAk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl3CxBMACgkQ+JPGdIFq
qV2C8xAAhtBDUSTCmRqClVG88+162f0AJ7Ju8IMENZyjLyAAz0lYTqc3Jn0Lh3eD
rqUk7f9ecLCbOjX7jQ7qYDrmAe6IC03z7DhqyVEw2ozZU9WOFou+HiM2gtPmnzhc
ecMnW0znSaoCJhtu5a4xealPX10Y6ewj5ALAjaFb4huAP11vE5XnERHJKAMx1ui9
4OptM7b8uCLebM0g7PrQMpyM+MGlghmli6IrYn5JLm9N8SqyG0CFnBgtU2BnZO38
qWbIVWFnGnpd8ER0NnHGkhDWXAyz2h3aD5vB/oCNfiQjZ4XtbhXNvJrpz95jouPO
YDFlO22OrnbYcPxYZ289gmEZq4+rFgIEHQMb7j1lbgwcXCuciyUCzEovFSBJ2/fW
niu6BawuoO0xCaI3IsjJ4z5nkHhp2QFwk1tk+VjF1s4YO/LogIUfD0LO8tppXyxX
uDHRkNb/vMjUusjNxKFBAUo9RGhINaQrH7DtwRA5+Rv4PDfXmiUFR699DEo17kkO
4iAyvkeZtxbCNKxmOXhWZMCEATFA/mbu0A+guMRR9xCWomaNZtl5K4Pv8v5EBXk3
dJXDTDbYWoH2+vgyfROMWA8qLzGPYeg4tkPPZFFlAYu+zM/l8C4K50MXDOfZgM2L
eO+EYW+ygaNAviV7k9buhUNbyryJfGqv5ITSuVzD6uGJv5LoE58=
=7lA6
-----END PGP SIGNATURE-----

--=-Lb1NjAo3HiiLHxJ5MDAk--
