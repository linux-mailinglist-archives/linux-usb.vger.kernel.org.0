Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB9E4AD81F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 13:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237023AbiBHMGB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 07:06:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbiBHMF7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 07:05:59 -0500
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 04:05:58 PST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42006C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 04:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1644321956;
        bh=As8Vv71Lk+9rDs/5goyLjQeSzZPJ2w3FhseNRrvhZhU=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=iwbsQp3eMMjgT4iDk3z1WgkYS+G4wUwc42OITKqkWaiP8chAfXh5csCwheub+LLHk
         m87RHORKpP4oyLW6jEpJWpBGnNzNE0taIuv7vAgQdmDi4a9ziGipgZALtMMJSjA8PQ
         HVmwVT2cH+a6Nhaz5CUhKZBloaP2X0i4ub8K4rmA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from felics-pocket.localdomain ([2.247.249.60]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mof9F-1o6QEm2qSn-00p5GY for <linux-usb@vger.kernel.org>; Tue, 08 Feb 2022
 13:00:53 +0100
Received: from localhost.localdomain (localhost.localdomain [IPv6:::1])
        by felics-pocket.localdomain (Elektropostamt) with ESMTP id A79BA58D8772
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 13:00:51 +0100 (CET)
Date:   Tue, 8 Feb 2022 13:00:48 +0100
From:   Felix Becker <linux.felixbecker2@gmx.de>
To:     linux-usb@vger.kernel.org
Subject: [usbserial] device 0421:069a is supported, in fact.
Message-ID: <20220208125958.295e8a0b@gmx.de>
X-Mailer: Claws Mail 3.18.0git303 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tyZQL.+o9DIf4zMViIPrjW4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:h/b5Xu+SCrjW+74MXZFw2SLZcliYZIHy6rLtA9+z3Ey832YJnzR
 PUqW9hdS4ZjemaYdJNWf6VWd3o2jhITTtBC7UtrpPBGqz0W0ip46vw7KdNXIGzqPmsD3ST1
 JHQQW5y5FNrktCG8G/yXaeYvNLb0VDUB0aPi1LdpDP5KSB7NIpTVhOeCRVeWSd22R+B049u
 UdmuCbIDnEaR+OEWaSonw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JP8f9kNIi6U=:IisbE7fw/c8qL9hH7iRzg+
 R1Xkkxn4ep6Q/Fw6RU6YIfThr+F40OROmthwMxbkWnPt8PnnT4AsgC6DyMBJ0gXkfvKMRcRBL
 5YvQ/e0CGWygF2NZ/NkTAZrbjiRCuqGGvSbgpJPiUl/7bwXkaMiLDEl46J53ZjkGShcUdf9BC
 nU+yG9TagHNNMFeLIHTENzATtxmvbIA6E6Xpb6ZgYCeXriVvHtSQyyq/nLD+KzlJz65JtjYVj
 YChObUecr72I+Ai5IpwXa1+/a0PZGrsAz6SHKdMYKtUWr7O5Df8/tM/4cTIv6GpwjB6xahg9k
 P2zw0QZ1iE7NTDCMNS9xzYdRHMYTikNUx4m4Df0NGBhd5s/oPI4goc7CK7c6ivzQoBL669wIn
 GV2S1CSL7W3SAwZRU4MxDtt+NNKI86WAvbT2sZWMVx9lZAaEY38d3Bqt/+izEGxSmDuZChwp8
 bbMYx8qC9DxzLAR7Je/gKyUK3yw7C8+nTMx+tqpYey2uYBdAcAHw9nT9Y07265Q4C7OeE/kAO
 /xen3D1ybPwa4Rqr3+VnZJrJlPgwoy7TRGzIOjCH1z0gSawUIqk5iGIFtOYCyAChFr75WhTK5
 biVVn0Q5taTJFM1EbfLLMyfsAqFyBYNkgolXOokn1B1HIP3Mew0hAa/ijyRMthYsH+Pw8ZK7u
 u/R3WjjiU0k/BxqU8fMUzODgAIIhT3Y9ZdfCWc88ngGSjAs4SBcYV4HMWF7NGyUdXsKFvpxyh
 jyTicUhIKmGHo/qKswOO8L5DDDUkCG0+nvTqSfRmoS4ECps/v7uEjlmTz6kJS/PfyO+Tm2d2F
 q3UOUbgrWq6GksFoZB/1nA7RvGmrL/CSPTtfK2MyeyJoU8Da+mEs150teKzyVHnSh/k/SwkyW
 ddKriE6aV6Yv/6c8uwaKAmu1Ye6v3NKSgnNz1TjFZCsDwrWLiRuIrsowC13ve0CC+iZfxcxUi
 zdgLgszjYqRoSWfxes+f4OKpRpYbIwZSFLWMv5ds3Bbc67uPo6ZBnFSc/hJlHsKY/QOD9YrqG
 VbDCFvlRhhgJ5motEeKz0/VX+VqamrZfG8/k3cos0luqReD7uxRX/Mzs9nGbwpupNZfX9rUNb
 xPAueJTrN2+tHM=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--Sig_/tyZQL.+o9DIf4zMViIPrjW4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear "linux-usb" mailing list people,

I was directed here by the email-bot of Greg Kroah-Hartman.

First I was contactim him directly, since at [1] it is written that
things regarding the `usbserial` driver should be directed to him,
which in turn I was getting from a question on where-to-address-this
which I asked here [2].


Here the issue I want to address:


I have a device which is ignored by any in-kernel driver, but when I
tell `usbserial` manually to drive that device (via
`modprobe usbserial vendor=3D0x0421 product=3D0x069a`), it provides two
serial ports where useful things can be made via the second.

It is a Nokia 130 mobile phone, and it provides an "AT"-style serial
interface where things like address book synchronisation can be made.

It has the following vendor:product number 0421:069a.

So I suggest to you to add that device as a supported device to
`usbserial`, so that hotplug works.

In `lsusb` it shows up as
`Nokia Mobile Phones 130 [RM-1035] (Charging only)`, so the string
`(Charging only)` should be removed then, too.

(The phone itself has two USB modes: "Memory card" (which will make it
behave as mass storage with access to the microSD-card) and a mode
which is called in the phone's menu as "Charging only", which is the
mode interesting here and which in fact is more than "carging only").


I have also made a Linux bugtracker issue out of this [3], but my
experience is that issues posted there are sometimes very unreliably
noticed (depending on the subsystem, some parts of the bugtracker seem
to not get attention at all). That's why I followed the suggestion in
[1] instead at first. I am still confused about what is the correct way
to give this information to the people able to deal with it properly.



[1] Linux kernel documentation "USB serial": =20
http://kernel.org/doc/html/latest/usb/usb-serial.html#generic-serial-driver

> For any questions or problems with this driver, please contact Greg =20
> Kroah-Hartman at greg@kroah.com

[2] Answer to the question where to address this on stackexchange: =20
http://unix.stackexchange.com/a/689577/133286

[3] Enhancement-Issue of this at the Linux bugtracker: =20
http://bugzilla.kernel.org/show_bug.cgi?id=3D215579

--=20
| sed 's/\([Mm]\)an[n]*/\1ensch/g'

--Sig_/tyZQL.+o9DIf4zMViIPrjW4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoQC1DtG8M9RevkfXW6j9HlIpTekFAmICW3AACgkQW6j9HlIp
TemEfBAApbSVDFtuWC3klougPWGoAz50bZWtULVJu2P+TeHdlppUJgr6Oz5YssSE
W81ytLEMC6j+EhtsIq/ZIDd00xOMCgLcwDJHfBi501XYGgB8mSQ+COGFf7G74vdi
mUYQjjItOW8jpVxeDU2eAK2C//Zmfh5kxwa56Fq8F8tuh9mnMsuYveWpqz4GBy4J
lfB+dpSg/dzTe3fiBdXVLnMOClsKv5WSXvy6+TSH1LbFSgUL5kcCtpBWid2//7Zg
Ivc4VYBhHTPQNVVPMcXDyZQaGoyBdbQsY44MO89yZRLFn9ftiJNaol4l7L+tfbnU
WENMEXJbS3woX9Dy8leffmAc/AUkPd6IvZW5Z7Qbe/AXGNk/BzbX1WFyBFSi1ORA
X3RykQWFazO8fNHUJ1RIDxqiZLsm1SOntzOcRLs+7bsh7br+9tqLUr6wdwfbASqx
nc5WmEPe2KwlRuzlRzAH4yZa8SL5WdRl3192Bc8RLjMtCgxlYLCSL2bLVugsw+Et
Sg4JhjI+xvsOZHSfijTQopRXQfIFMTApUCH9OPe+zk7RNaJFd2Dch04mH7pvsQPk
0bwRBOWwiaVcWh08T/uJcwh6LYlcHTqU60RE7cs0gfdIb7jTutSD+G3vQXhJDhNE
z/p2yQDdqtOiAev+CDNYjoihamA4w1winQE4wwfQSapR+ymTEGM=
=3rZg
-----END PGP SIGNATURE-----

--Sig_/tyZQL.+o9DIf4zMViIPrjW4--
