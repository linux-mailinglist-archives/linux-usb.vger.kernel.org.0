Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6164F65106B
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 17:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbiLSQ3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 11:29:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbiLSQ3l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 11:29:41 -0500
Received: from fallback4.mail.ox.ac.uk (fallback4.mail.ox.ac.uk [129.67.1.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1812FBF2
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 08:29:40 -0800 (PST)
Received: from relay20.mail.ox.ac.uk ([163.1.2.170])
        by fallback4.mail.ox.ac.uk with esmtp (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7J1G-0006MX-Hb
        for linux-usb@vger.kernel.org; Mon, 19 Dec 2022 16:29:38 +0000
Received: from smtp8.mail.ox.ac.uk ([163.1.2.204])
        by relay20.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7J1D-0000OM-Fj; Mon, 19 Dec 2022 16:29:35 +0000
Received: from cpc78303-slou2-2-0-cust186.17-4.cable.virginm.net ([62.31.33.187]:38444 helo=hilbert.cs.ox.ac.uk)
        by smtp8.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7J1D-0001Oo-Q5; Mon, 19 Dec 2022 16:29:35 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id E4F84744465; Mon, 19 Dec 2022 16:29:34 +0000 (GMT)
Date:   Mon, 19 Dec 2022 16:29:34 +0000
From:   dima.pasechnik@cs.ox.ac.uk
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6CRbgwHzjr2KNxK@hilbert>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zH/JET1D42Ij0GML"
Content-Disposition: inline
In-Reply-To: <Y6B8jd7dHsa85Wny@kroah.com>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=vindex&search=dimpase@cs.ox.ac.uk
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--zH/JET1D42Ij0GML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 04:00:29PM +0100, Greg KH wrote:
> On Mon, Dec 19, 2022 at 12:57:43PM +0000, dima.pasechnik@cs.ox.ac.uk wrot=
e:
> > this is a popular in UK education board: https://microbit.org/
> > - the currently sold (Version 2) one. It does on the same USB 3 things:
> >   mass storage, ACM, and serial. Serial appears unknown to the kernel.
> >=20
> > With Linux kernel 6.0.8 on x86_54, and various USB serial drivers insta=
lled, upon plugging into USB
> > port, I see in dmesg:
> >=20
> > [45460.035306] usb 1-3: new full-speed USB device number 10 using xhci_=
hcd
> > [45460.166959] usb 1-3: New USB device found, idVendor=3D0d28, idProduc=
t=3D0204, bcdDevice=3D10.00
> > [45460.166965] usb 1-3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> > [45460.166967] usb 1-3: Product: BBC micro:bit CMSIS-DAP
> > [45460.166968] usb 1-3: Manufacturer: Arm
> > [45460.166970] usb 1-3: SerialNumber: 9905360200052833525e24a702a685520=
00000006e052820
> > [45460.172168] usb-storage 1-3:1.0: USB Mass Storage device detected
> > [45460.172538] scsi host1: usb-storage 1-3:1.0
> > [45460.173203] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
> > [45460.175258] hid-generic 0003:0D28:0204.0005: hiddev96,hidraw0: USB H=
ID v1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
> > [45460.175581] usbserial_generic 1-3:1.4: The "generic" usb-serial driv=
er is only for testing and one-off prototypes.
> > [45460.175585] usbserial_generic 1-3:1.4: Tell linux-usb@vger.kernel.or=
g to add your device to a proper driver.
> > [45460.175587] usbserial_generic 1-3:1.4: device has no bulk endpoints
> > [45460.175818] usbserial_generic 1-3:1.5: The "generic" usb-serial driv=
er is only for testing and one-off prototypes.
> > [45460.175821] usbserial_generic 1-3:1.5: Tell linux-usb@vger.kernel.or=
g to add your device to a proper driver.
> > [45460.175823] usbserial_generic 1-3:1.5: generic converter detected
>=20
> Is there some script adding this device id to the generic driver such
> that you are binding to this device?  Did the script come with the
> device?

It didn't bind to a /dev/ttyUSB* device, even if I manually loaded the corr=
esponding modules.
Then I read somewhere I had to do=20

    echo 0d28 0204 >/sys/bus/usb-serial/drivers/generic/new_id

(the numbers there are VID and PID of the board)
to make it recognisible by the driver.

Unfortunately I can't easily tell you how it behaved without it,
as it seems to be impossible to remove things there :-(
https://unix.stackexchange.com/questions/463291/how-to-remove-device-id-fro=
m-manually-entered-usb-serial-driver
Can it be wiped by reinstalling the kernel? I can do this...

> How well does it work?  Why did the developer choose to use this generic
> driver instead of a real one?
I don't know, I followed the advice in dmesg, which sounds as if it's
not a "real" driver.

Best,
Dmitrii
>=20
> > [45460.175905] usb 1-3: generic converter now attached to ttyUSB0
>=20
> It is not unknown, seems to bind here, but does it work?
>=20
> thanks,
>=20
> greg k-h

--zH/JET1D42Ij0GML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOgkWsACgkQoksLHjfJ
BTHDfggAxUpxERS2kiyzg86+4GS0JoGEbTCwCC5nvSFNbbs9bvvl9Kdk7K2agw5M
LYQg4UVdAOSOboaKzqVI/b1gACzj8fELQ7njhGrC79AbF6ZjMkBLrs+IuvtgYksn
PKhHvI0cNl6KkUhaLzxZLP5/wltcxLKzRxPPuPmmukaU5roztC5p2U8J4IeeJJ4i
wXjCsSUMte2c9MJWutqXPJBGQxO5YE+VZ+cRijVK8UXLwSdvaOkTPPVXLx3UGWzP
30c95tDuZ65KB9t4X/rC0WCeuRyTcHuVD+H2q5fyio3wloAWnO2aexqgM5g5fBfP
WKEplbVHtZBpuNchgqw+dnKQ6qC4Vw==
=ecLC
-----END PGP SIGNATURE-----

--zH/JET1D42Ij0GML--
