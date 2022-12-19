Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8767651579
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 23:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbiLSWVE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 17:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbiLSWVC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 17:21:02 -0500
Received: from relay17.mail.ox.ac.uk (relay17.mail.ox.ac.uk [129.67.1.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2A025F1
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 14:20:51 -0800 (PST)
Received: from smtp9.mail.ox.ac.uk ([129.67.1.206])
        by relay17.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7OV7-0003FP-4E; Mon, 19 Dec 2022 22:20:49 +0000
Received: from cpc78303-slou2-2-0-cust186.17-4.cable.virginm.net ([62.31.33.187]:60942 helo=hilbert.cs.ox.ac.uk)
        by smtp9.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7OV6-0007Ci-Uk; Mon, 19 Dec 2022 22:20:48 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id 0C191741515; Mon, 19 Dec 2022 22:20:48 +0000 (GMT)
Date:   Mon, 19 Dec 2022 22:20:48 +0000
From:   dima.pasechnik@cs.ox.ac.uk
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6DjwFAp4M8I+T4P@hilbert>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vcV33DLd6qRcj8fz"
Content-Disposition: inline
In-Reply-To: <Y6Csfzqvy6GExhVB@kroah.com>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=vindex&search=dimpase@cs.ox.ac.uk
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--vcV33DLd6qRcj8fz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 07:25:03PM +0100, Greg KH wrote:
[...]
>=20
> That is only if you want to manually bind the generic driver to this
> device.  The kernel takes this and says "are you sure you want to do
> this, if so, email this address and talk to these developers" :)

One does need a dedicated /dev/ttyUSB. It is similar, but not
identical, to /dev/ttyACM. Cf. e.g.
https://rfc1149.net/blog/2013/03/05/what-is-the-difference-between-devttyus=
bx-and-devttyacmx/

And the board makes an effort to establish
a dedicated /dev/ttyUSB. Indeed, after I plugged the board in 21:35
and did "ls -l /dev/tty*" I saw

crw--w---- 1 root tty       4,  0 Dec 19 21:28 /dev/tty0
crw------- 1 dima tty       4,  1 Dec 19 21:35 /dev/tty1
crw--w---- 1 root tty       4, 10 Dec 19 21:28 /dev/tty10
crw--w---- 1 root tty       4, 11 Dec 19 21:28 /dev/tty11
=2E..

- it's the Linux host that doesn't recognise this fact.
(it's not even seen in dmesg that something happened on /dev/tty1 -
probably a premature termination of something in the kernel)

Needless to say, there is also /dev/ttyACM0 popping up - so this part
of the communication is OK.

I think it's prudent that the kernel understands that it's a
a proper ttyUSB device, apparing as /dev/ttyUSB, and advertises it as
such. Without it, it's hard to detect it, and indeed, the only way I see
this,  without an active usbserial driver, is by the time shown next to=20
/dev/tty*

> > > Unfortunately I can't easily tell you how it behaved without it,
> > > as it seems to be impossible to remove things there :-(
> > > https://unix.stackexchange.com/questions/463291/how-to-remove-device-=
id-from-manually-entered-usb-serial-driver
> > > Can it be wiped by reinstalling the kernel? I can do this...
> >=20
> > OK, I removed the "new_id" by kernel reinstall, and
> > now all I get is the following:
> >=20
> > [  176.427839] usb 1-3: new full-speed USB device number 5 using xhci_h=
cd
> > [  176.558808] usb 1-3: New USB device found, idVendor=3D0d28, idProduc=
t=3D0204, bcdDevice=3D10.00
> > [  176.558825] usb 1-3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> > [  176.558833] usb 1-3: Product: BBC micro:bit CMSIS-DAP
> > [  176.558839] usb 1-3: Manufacturer: Arm
> > [  176.558845] usb 1-3: SerialNumber: 9905360200052833525e24a702a685520=
00000006e052820
> > [  176.566864] hid-generic 0003:0D28:0204.0001: hiddev96,hidraw0: USB H=
ID v1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
> > [  177.727061] usb-storage 1-3:1.0: USB Mass Storage device detected
> > [  177.733180] scsi host0: usb-storage 1-3:1.0
> > [  177.733333] usbcore: registered new interface driver usb-storage
> > [  177.733607] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
> > [  177.733646] usbcore: registered new interface driver cdc_acm
> > [  177.733648] cdc_acm: USB Abstract Control Model driver for USB modem=
s and ISDN adapters
> > [  177.739250] usbcore: registered new interface driver uas
> > [  178.752970] scsi 0:0:0:0: Direct-Access     MBED     VFS            =
  0.1  PQ: 0 ANSI: 2
> > [  178.759252] sd 0:0:0:0: [sda] 131200 512-byte logical blocks: (67.2 =
MB/64.1 MiB)
> > [  178.759440] sd 0:0:0:0: [sda] Write Protect is off
> > [  178.759443] sd 0:0:0:0: [sda] Mode Sense: 03 00 00 00
> > [  178.759611] sd 0:0:0:0: [sda] No Caching mode page found
> > [  178.759613] sd 0:0:0:0: [sda] Assuming drive cache: write through
> > [  178.769674]  sda:
> > [  178.769773] sd 0:0:0:0: [sda] Attached SCSI removable disk
> >=20
> > As you see, no USB serial driver is loaded.
> > However, https://tech.microbit.org/software/daplink-interface/
> > tells you that there is a 2nd CPU on the board, aka "interface chip",
> > capable of UART.
>=20
> And that would be the ttyACM0 device node, right?  Why not use just use t=
hat?
Actually, the "interface chip" is reponsible not only for ttyACM, but
for USB mass storage, and USB serial, all crammed in into the same
physical USB port.

ttyACM is a slightly different from serial USB device, understanding slight=
ly different set
of commands. (as I wrote above)

An application might want to talk to the board on several virtual ports in
the same time, why not? If it's a real-time communication, say?

> > If I manually load the driver:
> > # insmod /lib/modules/6.0.8-gentoo-x86_64/kernel/drivers/usb/serial/usb=
serial.ko vendor=3D0x0d28 product=3D0x0204
> > and re-insert the USB connector, I see dmesg log as in my previous
> > message, and indeed, /dev/ttyUSB0 appears.
>=20
> Yes, but does using that device node actually work?
>=20
> > Well, perhaps, it's all supposed to work without a kernel module, hard
> > to say. It's however confusing that a /dev/tty1 (or some other number)
> > appears, but it's totally non-transparent that it is a USB connection
> > (no reflection of it in dmesg).
>=20
> Again, try ttyACM0 and see if that works.

Yes, it does basic things, I can use web interface for
https://python.microbit.org/ to upload and run Python
(https://python.microbit.org/) programs on the board. I only know
Chromium talks to the board via webUSB (https://wicg.github.io/webusb/)
I don't know yet whether one can try several USB interfaces from it.=20

I'll be teaching practicals to our 1st year CS students using these boards,=
 they will tear me apart
in case I don't know the stuff. :-)
And not only practical bits, but theory as well.

Cheers,
Dima


--vcV33DLd6qRcj8fz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOg47wACgkQoksLHjfJ
BTH/vwf/dhCxnl+ZApEzYDKJvIFf9ugmat4U/xny9nd3ZOvDxaHCbVoTevS9Wjp2
BEt8bi6N0SQGeCgI0PKvB0NbPUE3fQGduPGkMkNMYg/DsbxipUoqCDQQPD1rnCmj
9bRnm7AltBgblwg8u5/6lU/iUnO18GKQYTGSW29CJcmCYHO60ogwPvAurRg1gzt3
26Il7MkFIZYfBmJhsxxhxxvjlUtDJDa9lpx8otOKZ7mZ6yDm7XAulB5bwOi0BjjP
TWL3AnsEy2m7DxB/AsoxRKBoLmwtqmcKdJBRfvgm4QX2HViGEjocE+xM0g4JHG+S
LZY37XaCLm3mUHbzH/RJ8RZIbzH6YA==
=PmCO
-----END PGP SIGNATURE-----

--vcV33DLd6qRcj8fz--
