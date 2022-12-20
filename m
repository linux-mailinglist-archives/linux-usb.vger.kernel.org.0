Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E95E652318
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 15:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiLTOvS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 09:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbiLTOuq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 09:50:46 -0500
Received: from relay17.mail.ox.ac.uk (relay17.mail.ox.ac.uk [129.67.1.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425BB1AD9C
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 06:50:20 -0800 (PST)
Received: from smtp7.mail.ox.ac.uk ([129.67.1.205])
        by relay17.mail.ox.ac.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7dwg-0006cG-3l; Tue, 20 Dec 2022 14:50:18 +0000
Received: from cpc78303-slou2-2-0-cust186.17-4.cable.virginm.net ([62.31.33.187]:52514 helo=hilbert.cs.ox.ac.uk)
        by smtp7.mail.ox.ac.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <dima.pasechnik@cs.ox.ac.uk>)
        id 1p7dwf-0008UY-PI; Tue, 20 Dec 2022 14:50:17 +0000
Received: by hilbert.cs.ox.ac.uk (Postfix, from userid 1000)
        id 25DA8741515; Tue, 20 Dec 2022 14:50:17 +0000 (GMT)
Date:   Tue, 20 Dec 2022 14:50:17 +0000
From:   dima.pasechnik@cs.ox.ac.uk
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6HLqYpxwT+v3BgX@hilbert>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6Fc2Fz8w4KoX952@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XbjB6LMRu+O5rEG3"
Content-Disposition: inline
In-Reply-To: <Y6Fc2Fz8w4KoX952@kroah.com>
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


--XbjB6LMRu+O5rEG3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 07:57:28AM +0100, Greg KH wrote:
> On Mon, Dec 19, 2022 at 10:20:48PM +0000, dima.pasechnik@cs.ox.ac.uk wrot=
e:
> > On Mon, Dec 19, 2022 at 07:25:03PM +0100, Greg KH wrote:
> > [...]
> > >=20
> > > That is only if you want to manually bind the generic driver to this
> > > device.  The kernel takes this and says "are you sure you want to do
> > > this, if so, email this address and talk to these developers" :)
> >=20
> > One does need a dedicated /dev/ttyUSB. It is similar, but not
> > identical, to /dev/ttyACM. Cf. e.g.
> > https://rfc1149.net/blog/2013/03/05/what-is-the-difference-between-devt=
tyusbx-and-devttyacmx/
>=20
> Yes, they are a little different and the main point here is your device
> says it is a ACM-compliant device, so just use that tty device node to
> talk to it.  That is the standard for talking serial protocols to USB
> devices.
>=20
> By forcing the device to the generic usb-serial driver, you are saying
> "this random endpoint is really a tty pass-through device" is that the
> case?  Why would you have both a ACM and a pass-through set of endpoints
> in the same USB device?
>=20
> > And the board makes an effort to establish
> > a dedicated /dev/ttyUSB. Indeed, after I plugged the board in 21:35
> > and did "ls -l /dev/tty*" I saw
> >=20
> > crw--w---- 1 root tty       4,  0 Dec 19 21:28 /dev/tty0
> > crw------- 1 dima tty       4,  1 Dec 19 21:35 /dev/tty1
> > crw--w---- 1 root tty       4, 10 Dec 19 21:28 /dev/tty10
> > crw--w---- 1 root tty       4, 11 Dec 19 21:28 /dev/tty11
>=20
> Those are not USB-serial devices :)
>=20
> Seeing those device nodes is one thing, did you connect to the ttyUSBX
> device nodes and talk to the device properly?
>=20
> > Needless to say, there is also /dev/ttyACM0 popping up - so this part
> > of the communication is OK.
>=20
> And I think that is the usb-serial connect to this device.
>=20
> > I think it's prudent that the kernel understands that it's a
> > a proper ttyUSB device, apparing as /dev/ttyUSB, and advertises it as
> > such. Without it, it's hard to detect it, and indeed, the only way I see
> > this,  without an active usbserial driver, is by the time shown next to=
=20
> > /dev/tty*
>=20
> There is no "proper" ttyUSB type of device.  That set of drivers was
> created because there was no USB standard for usb-serial devices way
> back in the day so people made custom chips for them with custom
> protocols.  Then people realized this was a bad thing and came up with
> the USB ACM spec so that you would NOT have to write a custom kernel
> driver for their devices.
>=20
> So if this device does need to be controlled by the usb-serial driver,
> what chip is in it and what protocol does it talk?  As Alan said, the
> output of `lsusb -v` for the device would be helpful.
>=20
> > > > As you see, no USB serial driver is loaded.
> > > > However, https://tech.microbit.org/software/daplink-interface/
> > > > tells you that there is a 2nd CPU on the board, aka "interface chip=
",
> > > > capable of UART.
> > >=20
> > > And that would be the ttyACM0 device node, right?  Why not use just u=
se that?
> > Actually, the "interface chip" is reponsible not only for ttyACM, but
> > for USB mass storage, and USB serial, all crammed in into the same
> > physical USB port.
>=20
> Are there specs on this chip anywhere?
See https://tech.microbit.org/hardware/=20
(choose V2.2X there)
I have nRF52833-QDAA (there is also a different option)

here is "details" on the board itself (describing firmware, I suppose)

# DAPLink Firmware - see https://daplink.io
Build ID: alpha9-189-g5dd23001 (gcc)
Unique ID: 9905360200052833525e24a702a68552000000006e052820
HIC ID: 6e052820
Auto Reset: 1
Automation allowed: 0
Overflow detection: 0
Incompatible image detection: 1
Page erasing: 0
Daplink Mode: Interface
Interface Version: 0256
Bootloader Version: 0256
Git SHA: 5dd23001a7a3199d74870790049d6686e183316c
Local Mods: 0
USB Interfaces: MSD, CDC, HID, WebUSB
Bootloader CRC: 0xa60a7780
Interface CRC: 0x0bac75fa
Remount count: 0
URL: https://microbit.org/device/?id=3D9905&v=3D0256


------------------------------------------
Here are the specs for V1 version (not the current, V2 one -these are above=
) - see my reply
to Alan with lsusb details on this.

https://spivey.oriel.ox.ac.uk/digisys/The_BBC_micro:bit#Microcontroller_chip
https://www.nordicsemi.com/Products/nRF51822

And "details" from the board:

# DAPLink Firmware - see https://mbed.com/daplink
Unique ID: 9901000051114e45005f80130000004e0000000097969901
HIC ID: 97969901
Auto Reset: 1
Automation allowed: 0
Overflow detection: 0
Daplink Mode: Interface
Interface Version: 0249
Bootloader Version: 0243
Git SHA: 9c5fd81e6545d00b7f7c21ca9d8577dbd6a5fed2
Local Mods: 0
USB Interfaces: MSD, CDC, HID, WebUSB
Bootloader CRC: 0x32eb3cfd
Interface CRC: 0xcdb7b2a3
Remount count: 0
URL: https://microbit.org/device/?id=3D9901&v=3D0249

HTH
Dima


--XbjB6LMRu+O5rEG3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJVdDnfI7raAa4RJxoksLHjfJBTEFAmOhy6UACgkQoksLHjfJ
BTHeiQf9FQoPPk/ZpJwaHxglscnWG7/nZvXpl3W06I6L56jbWHnwzWzdHwgrQ3DF
mLJqmcvzxswY0/LfNfbJU715C6mq7876/cxtQLMem9TvFz6dWQ4xxWD4WQE5AGbG
b/lqyy3itZ/1+ezgAYCCKT4y5ThokNNPeTZ/sSDCwF4tQQ58st82Gk1wXy3I2bv6
hvPHpwbbdy5ncMSCpemoRvPgVai4s4Pexg44C7XGjPYLs4GzhoTDsqabsQ0zBxFx
9efayMtCztLSfc3qHTTCy4pEbxWog0KEz/C1BuI45HCICEo/BDP0eecAVlYAjkr+
tMIxcyAnT4hxO0ODfsmpuXtyLdTHfA==
=hB5z
-----END PGP SIGNATURE-----

--XbjB6LMRu+O5rEG3--
