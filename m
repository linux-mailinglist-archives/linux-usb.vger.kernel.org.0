Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C354E4C5724
	for <lists+linux-usb@lfdr.de>; Sat, 26 Feb 2022 18:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbiBZRsg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Feb 2022 12:48:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbiBZRsf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Feb 2022 12:48:35 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9B923BDD
        for <linux-usb@vger.kernel.org>; Sat, 26 Feb 2022 09:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645897678;
        bh=vr1Qfa8mqhdHvTJJm7cSbIqcwp6T2GrrTIfYhGtpZpI=;
        h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
        b=ACo7kWJd9VNcqZTKBEJdkXx4q3Ug2PHWjVw8rqNuu+gfFXc0Bm19/oSK6sfriNtk7
         8QamEKCchI0BIXJE5I4m263Ju+CdzrQMDtWeLvTiQpXeHhU0lHYb0FWw29Sdk9Sy94
         aQuoj6fBh9urlF35kikT0VAj2iOwGLSY6NJag4dU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from felics-pocket.localdomain ([2.247.251.17]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MwQXH-1oGFgZ2Elx-00sM0o for <linux-usb@vger.kernel.org>; Sat, 26 Feb 2022
 18:47:58 +0100
Received: from localhost.localdomain (localhost.localdomain [IPv6:::1])
        by felics-pocket.localdomain (Elektropostamt) with ESMTP id 6329D5C4A605
        for <linux-usb@vger.kernel.org>; Sat, 26 Feb 2022 18:47:42 +0100 (CET)
Date:   Sat, 26 Feb 2022 18:47:32 +0100
From:   Felix Becker <linux.felixbecker2@gmx.de>
To:     linux-usb@vger.kernel.org
Subject: Re: [usbserial] device 0421:069a is supported, in fact.
Message-ID: <20220226184732.42536060@gmx.de>
In-Reply-To: <YheJtJ/p5QIsphYd@hovoldconsulting.com>
References: <20220208125958.295e8a0b@gmx.de>
        <YgKKQSOuwBy1cQ6H@kroah.com>
        <20220208201506.6c65834d@gmx.de>
        <YheJtJ/p5QIsphYd@hovoldconsulting.com>
X-Mailer: Claws Mail 3.18.0git303 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YrNHCR9xsKCQZaBJ4oMSq4A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:e27ctY0O4XhkX7yF+oGBfxEY/wmuvHp3u+wQmx2JpMcb4eMVLpm
 8udR4WUdinMQYsBKzYexLCzKuYpdH633SGU5bkko6pP5Ip7G8sG3wXwcDflhUY8+h+2g17W
 DJ3ysCTGiwvRF7W8QZnpE8QGR498YfJb1R2g8+U+2tOsz6Dqv+zG24JmbcMvXgLZ0PEAlkZ
 s3vTX1P7dV0CtuZ6JEZSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hrj1guA/9I0=:ke+CI0a+xgBD8rppd4Pvl/
 /5E4F3/Nu7oPbT6pTHnKIwKWay7165ekpwEhI0XeN45OJ0snoakngNdcA/TAWvoeRzDZlmzMc
 OSZZEJVaCKriZ1sk9ACP+gYIuv2loijKBpfDSaonDYSYXZhVmG4+SP7ykgoEha70WfYtFYIae
 AmaaHYJVMNi2oEz4PKkbUZzceMwPzhDrqEFTFK8MUO8nWTX3NRAR56Lmw2EcfY1Z+AMJHrCde
 4Xn4QJ8G+C1U8wrNXn0Q7NXrfSrshr+t260caM5ExHaSJCiAVrz3co+s5ESrdAMXt3iwBqHZi
 10BVjL6/2npz0OgxKb9uuN9OqHEJRQa1cFafoUabcG/jqZTf5cgvpkxc4EwvIwQdoW0RHz4iO
 2dMjlrsYYgPC59VeGffaVgcsSufAWUACmVq58807iBE4s8BnngqCyEIFAy38SPqQxGOk+Ka/o
 fRK83k7O/I3ICVeu3j8OE1iU6vD+s9HpRN5mdWRwkd55RC8dixIDwdN2ooszx/7vPgc9iQQNI
 FXaO9j8DNJmdI6N67+EGdZuDdGMW0Winhh22tkR4KmaJ3aQOAQLE8TIECdQafnf61OQQhVFL0
 5YLIX++IqdrNhu4C+ZO8PawIx8u5P35ReHgfPSu+boAWtsDV7c7YyIQKmJjliZ3XMozNynirr
 ZqUUMTc2a53qd+rLe0KJbUdNrY+09F0a67OPlhgB3CdOM0hN8uaC1xtTAcT/PYXkhOyPrIJ0h
 yy6iNhSGyqvHmhtgBTW6NxLg5OWpXa7IZp0VTDStA7ihgv2UG5HZss2HwUrFlhiyPPPK90uev
 7rWP6wuS2kXvuqtKpNQhLnj9aQFP28DyHD8/79KhmStmakAjiGueQnlPcz+pFvM+FEkiO9VYk
 YEzepDNdfW4XYckxG4ZewaHLIChRF+HWAjp9vg6ce6LRLq/DFt7aywEdDh/yyQw3AUC8KZTxh
 bmqkjMqg5c3ywO/C8ipjpsHi2uX/2YwVzNNh2QWcRB/jMP0fjJor/JSwMZjaED9v6FpM3OfGy
 ieUK2UN2VtrBtdD2snycc2bbkYiL+YBOad/s92Zm9PqN3FrDOgMSnQRTEcMuBoYT3pt6tFS2w
 o89Vj5fN1wqzXw=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--Sig_/YrNHCR9xsKCQZaBJ4oMSq4A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hej,

On Thu, 24 Feb 2022 14:35:48 +0100, Johan Hovold <johan@kernel.org>
wrote about "Re: [usbserial] device 0421:069a is supported, in fact.":

> On Tue, Feb 08, 2022 at 08:15:36PM +0100, Felix Becker wrote:
> > On Tue, 8 Feb 2022 16:20:33 +0100, Greg KH
> > <gregkh@linuxfoundation.org> wrote about "Re: [usbserial] device
> > 0421:069a is supported, in fact.":=20
> > > Can you provide the output of `lsusb -v -d 0421:069a` for us? =20
> >=20
> > Attached (without `usbserial` loaded to specifically drive this
> > phone): `lsusb_0421:069a.nodriver.log` =20
>=20
> [...] I've just sent you a patch adding a new
> "simple" driver for Nokia phones that should allow you to use this
> device without adding the device id manually.
>=20
> [...]
>=20
> Will you be able to test the patch and let us know if it works as
> intended?

It works, but different than when I loaded the `usbserial` driver (not
`usb-serial-simple`) with the device ID manually:

I now get 4 (instead of 2) USB interfaces.

`dmesg` output when I connect the phone:

```
[  160.876977] usb 1-2: new full-speed USB device number 9 using xhci_hcd
[  161.060539] usb 1-2: New USB device found, idVendor=3D0421, idProduct=3D=
069a, bcdDevice=3D 1.00
[  161.060549] usb 1-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[  161.060552] usb 1-2: Product: Nokia 130 (RM-1035)
[  161.060554] usb 1-2: Manufacturer: Nokia
[  161.140899] usbcore: registered new interface driver usbserial_generic
[  161.140915] usbserial: USB Serial support registered for generic
[  161.147248] usbcore: registered new interface driver usb_serial_simple
[  161.147265] usbserial: USB Serial support registered for carelink
[  161.147273] usbserial: USB Serial support registered for zio
[  161.147282] usbserial: USB Serial support registered for funsoft
[  161.147292] usbserial: USB Serial support registered for flashloader
[  161.147304] usbserial: USB Serial support registered for google
[  161.147312] usbserial: USB Serial support registered for libtransistor
[  161.147320] usbserial: USB Serial support registered for vivopay
[  161.147327] usbserial: USB Serial support registered for moto_modem
[  161.147337] usbserial: USB Serial support registered for motorola_tetra
[  161.147346] usbserial: USB Serial support registered for nokia
[  161.147355] usbserial: USB Serial support registered for novatel_gps
[  161.147364] usbserial: USB Serial support registered for hp4x
[  161.147374] usbserial: USB Serial support registered for suunto
[  161.147382] usbserial: USB Serial support registered for siemens_mpi
[  161.147412] usb_serial_simple 1-2:1.0: nokia converter detected
[  161.147514] usb 1-2: nokia converter now attached to ttyUSB0
[  161.147582] usb 1-2: nokia converter now attached to ttyUSB1
[  161.147610] usb_serial_simple 1-2:1.1: nokia converter detected
[  161.147665] usb 1-2: nokia converter now attached to ttyUSB2
[  161.152908] usb 1-2: nokia converter now attached to ttyUSB3
```

and in this case it is `/dev/ttyUSB2` which responds to `AT`-commands.

Via this interface, I can sync contacts.

Regards!


--=20
I'll catch you if you fall.
                      - floor

--Sig_/YrNHCR9xsKCQZaBJ4oMSq4A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoQC1DtG8M9RevkfXW6j9HlIpTekFAmIaZ7QACgkQW6j9HlIp
TenOgA/+I83L6nUA/HGat54XBnxgrY/HiOupUyzmhh7kKMprCtEstMHp+Vbzjvf8
/m7DJ24z4/JrNXceeJVLREz/sFAbg2S0ZfbVRl9rmIoWJV4J7LJUNxz4fPJs6ItQ
25qfthNoXbUsOykPujLDAii30eUdiEr02WcfECydzM/KvQPYGS6BXzj0B9/yWOU1
8NQH33Q44sOADL7id26GqNmhLQg3VkR+PmRjWv8uRhCR3UcCm8wnCsMfa1EFj2/h
1/8pC60uI+Xg34VA/ArVSfJaHVEYLv55+WLPX931TEgnRcDfZwKAF/olgJVEg2gu
hXaiRehcfBfdVRMke8uwDoG/XzgN++3WTWfULgrObC9qnCEPjcZvmQe1cjzGAR8V
dzY4cU4ZLJNox8Z1q23Z2kNE8nB1054gU3kZqDPDk1vLVzrQHtQP4NktjQUVGddb
LlrDAQZ7cMTQlRhkPzu6xwdOThy6opFHC4iQdbvquHoeEl65Kz5l7nIE4o0R2kCH
lqtJd/BTfc5Puc85xDwlHL/cVA/otwdTJtQne/YXDPIN0XD6VulIipkfYIKfLdhk
BLFgFzFjoCPVtKX970ms+NS5EF0iu6Do7waKC3HBJaueIkxXSxQRhf4rEml36p2I
B3u4RVbd9fGd3LkpMjAluXS8VoD8Ro+5J6zRerywvfJ3HQZQk/4=
=7Ell
-----END PGP SIGNATURE-----

--Sig_/YrNHCR9xsKCQZaBJ4oMSq4A--
