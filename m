Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B52FE8814
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 13:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387806AbfJ2MZV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 08:25:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:31965 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728465AbfJ2MZV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Oct 2019 08:25:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 05:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; 
   d="asc'?scan'208";a="224954166"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga004.fm.intel.com with ESMTP; 29 Oct 2019 05:25:18 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Roger Quadros <rogerq@ti.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "Bin Liu \[EP\]" <b-liu@ti.com>
Subject: Re: g_audio breaks with dwc3
In-Reply-To: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
Date:   Tue, 29 Oct 2019 14:25:14 +0200
Message-ID: <87r22vhh79.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Roger Quadros <rogerq@ti.com> writes:
> I'm on v5.4-rc5 on TI's dra7 platform
>
> root@dra7xx-evm:~# modprobe g_audio
> [   79.951077] g_audio gadget: Linux USB Audio Gadget, version: Feb 2, 20=
12
> [   79.957849] g_audio gadget: g_audio ready
>
> Now I plug the EVM's USB to PC host.
>
> root@dra7xx-evm:~# [   85.359410] g_audio gadget: high-speed config #1: L=
inux USB Audio Gadget
> [   85.450574] 8<--- cut here ---
> [   85.453645] Unable to handle kernel paging request at virtual address =
ecb769dc
> [   85.460900] pgd =3D 08bb55ef
> [   85.463618] [ecb769dc] *pgd=3Daca1141e(bad)
> [   85.467651] Internal error: Oops: 8000000d [#1] SMP ARM
> [   85.472897] Modules linked in: usb_f_uac2 u_audio g_audio libcomposite=
 xhci_plat_hcd xhci_hcd usbcore dwc3 evdev udc_core usb_common spi_nor snd_=
soc_simple_card snd_soc_simple_card_utils leds_gpio led_class 4
> [   85.523128] CPU: 0 PID: 1240 Comm: irq/170-dwc3 Not tainted 5.4.0-rc5 =
#50
> [   85.529945] Hardware name: Generic DRA74X (Flattened Device Tree)
> [   85.536066] PC is at 0xecb769dc
> [   85.539240] LR is at dwc3_gadget_giveback+0x44/0x50 [dwc3]

what's in dwc3_gadget_giveback + 0x44? GDB can tell you that.

> dwc3 trace dump is below
>

[...]

> irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d=
4301893 length 0/0 zsI =3D=3D> 0

What the hell??? Where's the endpoint name?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl24L6oACgkQzL64meEa
mQZ/vA//ZvYSmrNWm0cO2qK/ZQ4ghL8UBKseXPArwEGLj90QZo6mV5fOWK9MDbM7
NFy4KEdBXdr60k8G44s7zNBPerOPW4jjcwKCI6msbSBm3VlSw09iaYCCBG3ig4Kn
HicnPfK9b2pIPQTx6PbHuibbW8ClbrfZAm0F6G5HOS4Kik+3yyj3HyrOrm7N0OuK
mKbkpDq9NGvOHInIpvyYWLEE09vV17wlTSeLCj4177dQz+1BmY9gIiymFuguUwVi
bjDCoahQjFY+0uQOI/OK2YD64JR7yONyRqPKFqtMwMw5QeADEixDt/Si5Xm9jFms
bJMLKYSPgrEQt9vfr2C8EIU3/1pVbfuvab283V/EwZEshVEbAdP2w9n1xaNppu9a
o8tKlykN0ZqPkDSQ8q9W8vUXbwm40eGGstYyQsVa4ad3SfTs9FIyfCjRWmubXVw0
5MX6EgEcu2a6Alq5NyKWni69yjwwAfK0DTlItqcFrfdvt2p0BwJajPw48OC5A3qJ
QtJuV9OlCgen476TNNHWdFxHRtPWGJRkxYPQUNAWEjqa7CVv4p0DaL80g74o+QFt
KSLYbYuwoCls1P1b1DTKrRsA0BN1KPOcFZuu3D5O6GsLc9+AXLC7U96fKqg98lOC
OgkOL79laJxK55gZQxV4TsejJLpJQKzq//Fr4lFKJS4jZ72Z2Yw=
=QIIu
-----END PGP SIGNATURE-----
--=-=-=--
