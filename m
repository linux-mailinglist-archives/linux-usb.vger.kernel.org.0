Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7892651189
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 19:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbiLSSLB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 13:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232089AbiLSSK5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 13:10:57 -0500
Received: from relay19.mail.ox.ac.uk (relay19.mail.ox.ac.uk [129.67.1.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E3D13D5A
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 10:10:54 -0800 (PST)
Received: from smtp7.mail.ox.ac.uk ([129.67.1.205])
        by relay19.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7KbF-00041D-A9; Mon, 19 Dec 2022 18:10:53 +0000
Received: from cpc78303-slou2-2-0-cust186.17-4.cable.virginm.net ([62.31.33.187]:56288 helo=hilbert.cs.ox.ac.uk)
        by smtp7.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7KbE-0003Ld-PD; Mon, 19 Dec 2022 18:10:52 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id BFF00744465; Mon, 19 Dec 2022 18:10:51 +0000 (GMT)
Date:   Mon, 19 Dec 2022 18:10:51 +0000
From:   dima.pasechnik@cs.ox.ac.uk
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6CpKxZ4KsiYttbL@hilbert>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wQAKYByI35Qcowj9"
Content-Disposition: inline
In-Reply-To: <Y6CRbgwHzjr2KNxK@hilbert>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=vindex&search=dimpase@cs.ox.ac.uk
X-Oxford-Username: coml0531
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--wQAKYByI35Qcowj9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 04:29:34PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> On Mon, Dec 19, 2022 at 04:00:29PM +0100, Greg KH wrote:
> > On Mon, Dec 19, 2022 at 12:57:43PM +0000, dima.pasechnik@cs.ox.ac.uk wr=
ote:
> > > this is a popular in UK education board: https://microbit.org/
> > > - the currently sold (Version 2) one. It does on the same USB 3 thing=
s:
> > >   mass storage, ACM, and serial. Serial appears unknown to the kernel.
> > >=20
> > > With Linux kernel 6.0.8 on x86_54, and various USB serial drivers ins=
talled, upon plugging into USB
> > > port, I see in dmesg:
> > >=20
> > > [45460.035306] usb 1-3: new full-speed USB device number 10 using xhc=
i_hcd
> > > [45460.166959] usb 1-3: New USB device found, idVendor=3D0d28, idProd=
uct=3D0204, bcdDevice=3D10.00
> > > [45460.166965] usb 1-3: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D3
> > > [45460.166967] usb 1-3: Product: BBC micro:bit CMSIS-DAP
> > > [45460.166968] usb 1-3: Manufacturer: Arm
> > > [45460.166970] usb 1-3: SerialNumber: 9905360200052833525e24a702a6855=
2000000006e052820
> > > [45460.172168] usb-storage 1-3:1.0: USB Mass Storage device detected
> > > [45460.172538] scsi host1: usb-storage 1-3:1.0
> > > [45460.173203] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
> > > [45460.175258] hid-generic 0003:0D28:0204.0005: hiddev96,hidraw0: USB=
 HID v1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
> > > [45460.175581] usbserial_generic 1-3:1.4: The "generic" usb-serial dr=
iver is only for testing and one-off prototypes.
> > > [45460.175585] usbserial_generic 1-3:1.4: Tell linux-usb@vger.kernel.=
org to add your device to a proper driver.
> > > [45460.175587] usbserial_generic 1-3:1.4: device has no bulk endpoints
> > > [45460.175818] usbserial_generic 1-3:1.5: The "generic" usb-serial dr=
iver is only for testing and one-off prototypes.
> > > [45460.175821] usbserial_generic 1-3:1.5: Tell linux-usb@vger.kernel.=
org to add your device to a proper driver.
> > > [45460.175823] usbserial_generic 1-3:1.5: generic converter detected
> >=20
> > Is there some script adding this device id to the generic driver such
> > that you are binding to this device?  Did the script come with the
> > device?
>=20
> It didn't bind to a /dev/ttyUSB* device, even if I manually loaded the co=
rresponding modules.
> Then I read somewhere I had to do=20
>=20
>     echo 0d28 0204 >/sys/bus/usb-serial/drivers/generic/new_id
>=20
> (the numbers there are VID and PID of the board)
> to make it recognisible by the driver.
>=20
> Unfortunately I can't easily tell you how it behaved without it,
> as it seems to be impossible to remove things there :-(
> https://unix.stackexchange.com/questions/463291/how-to-remove-device-id-f=
rom-manually-entered-usb-serial-driver
> Can it be wiped by reinstalling the kernel? I can do this...

OK, I removed the "new_id" by kernel reinstall, and
now all I get is the following:

[  176.427839] usb 1-3: new full-speed USB device number 5 using xhci_hcd
[  176.558808] usb 1-3: New USB device found, idVendor=3D0d28, idProduct=3D=
0204, bcdDevice=3D10.00
[  176.558825] usb 1-3: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[  176.558833] usb 1-3: Product: BBC micro:bit CMSIS-DAP
[  176.558839] usb 1-3: Manufacturer: Arm
[  176.558845] usb 1-3: SerialNumber: 9905360200052833525e24a702a6855200000=
0006e052820
[  176.566864] hid-generic 0003:0D28:0204.0001: hiddev96,hidraw0: USB HID v=
1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
[  177.727061] usb-storage 1-3:1.0: USB Mass Storage device detected
[  177.733180] scsi host0: usb-storage 1-3:1.0
[  177.733333] usbcore: registered new interface driver usb-storage
[  177.733607] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
[  177.733646] usbcore: registered new interface driver cdc_acm
[  177.733648] cdc_acm: USB Abstract Control Model driver for USB modems an=
d ISDN adapters
[  177.739250] usbcore: registered new interface driver uas
[  178.752970] scsi 0:0:0:0: Direct-Access     MBED     VFS              0.=
1  PQ: 0 ANSI: 2
[  178.759252] sd 0:0:0:0: [sda] 131200 512-byte logical blocks: (67.2 MB/6=
4.1 MiB)
[  178.759440] sd 0:0:0:0: [sda] Write Protect is off
[  178.759443] sd 0:0:0:0: [sda] Mode Sense: 03 00 00 00
[  178.759611] sd 0:0:0:0: [sda] No Caching mode page found
[  178.759613] sd 0:0:0:0: [sda] Assuming drive cache: write through
[  178.769674]  sda:
[  178.769773] sd 0:0:0:0: [sda] Attached SCSI removable disk

As you see, no USB serial driver is loaded.
However, https://tech.microbit.org/software/daplink-interface/
tells you that there is a 2nd CPU on the board, aka "interface chip",
capable of UART.

If I manually load the driver:
# insmod /lib/modules/6.0.8-gentoo-x86_64/kernel/drivers/usb/serial/usbseri=
al.ko vendor=3D0x0d28 product=3D0x0204
and re-insert the USB connector, I see dmesg log as in my previous
message, and indeed, /dev/ttyUSB0 appears.

Well, perhaps, it's all supposed to work without a kernel module, hard
to say. It's however confusing that a /dev/tty1 (or some other number)
appears, but it's totally non-transparent that it is a USB connection
(no reflection of it in dmesg).

HTH
Dmitrii


>=20
> > How well does it work?  Why did the developer choose to use this generic
> > driver instead of a real one?
> I don't know, I followed the advice in dmesg, which sounds as if it's
> not a "real" driver.
>=20
> Best,
> Dmitrii
> >=20
> > > [45460.175905] usb 1-3: generic converter now attached to ttyUSB0
> >=20
> > It is not unknown, seems to bind here, but does it work?
> >=20
> > thanks,
> >=20
> > greg k-h



--wQAKYByI35Qcowj9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOgqSgACgkQoksLHjfJ
BTFIQwgAtITI2KG12X45s0HJU1ANbZMiFnvHCP8geCuOuIgjmpMBv5G5P0QzJfce
HnNme8yrnz58uAzSDd2YntAyT1VqbURed+68ngE3SiBVekH/H1jHJdZaRsP3QrSS
b7su+GpNxoy2nCSj75C6RCpJRf+51LFwdbJcmvwAWrKNvfDPq+c/Vad8aK23tT0y
pROVeXrNJnD1BkFcDnixLQgLYktrAywwzPbL4B6CCRZdcou2hbdFQPjsZJDwHWMB
HpBvlhbax6qamv0U09+jsA8rKNNO8qP9REMscmn40mZw1rPZT2Q9cDD6dE2MCaa9
16OmXHfjva7esOLe/2zPd+ErPW3n5g==
=Apzk
-----END PGP SIGNATURE-----

--wQAKYByI35Qcowj9--
