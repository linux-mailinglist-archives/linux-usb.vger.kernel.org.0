Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84D3260EAC
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 11:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgIHJaW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 05:30:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:54084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728676AbgIHJaV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 05:30:21 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3570E21D20;
        Tue,  8 Sep 2020 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599557420;
        bh=zhZWGnx7STM0K0xVIREFtKBHKF/wIzgdMuTwprJbfqU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=V6KIRvnjH5ORUtJRiDy4pMiMkTzKJqcJaKXtiwO7x+1Q2TivhykkCldSMP4V+8ZLb
         yRQEjGtbJ7v+0B7fH8RmmZturXz2SWxWXujvHb+TiC7iWwKljlGSgpAT0Qwk+/yI8e
         bXYFaa+4mYhp4ar4j20rLEVmdlWn5FMpu8NuuA7U=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 8/8] usb: cdns3: gadget: enlarge the TRB ring length
In-Reply-To: <20200908091738.GC18578@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-9-peter.chen@nxp.com> <871rjcn5hb.fsf@kernel.org>
 <20200908091738.GC18578@b29397-desktop>
Date:   Tue, 08 Sep 2020 12:30:13 +0300
Message-ID: <87mu20lioq.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:
> On 20-09-08 09:32:32, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Peter Chen <peter.chen@nxp.com> writes:
>> > At Android ADB and MTP use case, it uses f_fs which supports scatter l=
ist,
>> > it means one request may need several TRBs for it. Besides, TRB consum=
es
>> > very fast compared to TRB has prepared for above use case, so we need =
to
>> > enlarge the TRB ring length to avoid "no free TRB error".
>>=20
>> can you give a little more detail here?
>
> I will.
>
>> How many sg entries do you get with ADB? What's the size of each TRB?
>
> I remembered it is about 120 requests for ADB and MTP use case, 16KB for
> each sg entry, so four TRBs (4KB/TRB) per sg entry at worst case.

I wonder why this isn't a problem for other UDCs, though. I haven't had
a similar report on dwc3, where we use 256 (255 + 1 link) TRBs for each
endpoint and we never use more than one segment. What you describe here
would amount of 480 TRBs worst case.

Anyway, this is hypothetical, something to keep an eye for dwc3 users
too, I guess.

>> How many memory does 600 TRBs
>> actually amount to? How many segments are you using per endpoint?
>>=20
>
> Each TRB consumes 3 * 32 bits =3D  12 bytes, 600 TRB consumes 7200 bytes.
> One segment for each endpoint, one segment includes 600 TRBs.

thanks for the info

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XTyURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQafxBAA10ZWQOKjZ7f4hxCrL9ZunKydbYoDXOAZ
L/EalOAtluTbIIZHFLS0mzDKNzxii/+v8641kLFeC/LjW/0ginx90uOSNauNWgaB
jh7/l3gSJ1DChSr36g1Xc0gCCHi9/niCRtmYOs6N88NDkwXUvb5KeN3HXNwbJKbK
5OnPvYCeoJjgAntuzZZS3sa/sCYMxzJezj40pBYONgM3JU+Z6V9uwko6tTNUoQZ1
lCPYc3di+Ci2pDyXb35ObgTPbi//fqfCcnnDLCQBIywo6oRBI//nkaJkZ1e2gMZH
SyZqypNZ9D/yS84udBxWScEzWDyPEr3/FJ2HZ74xYbQX9uiSCJ7d5KdPS97l5/j4
BDNjzOqFtvimfZvR5oSe9Uw+Pa1O9wKydD2smkKAjolc9Gb6bpwVJC83vKuDzJ1T
QpW2QR+0tNogLBBS98aaawgFBJHKeV5VwfXCtJeJM4c5BYfp/k8avsS1Il9mgQxv
88jYaO7BROJNfS3iGf4lO0+5cYNSqQjgZqKeIyX85E0N/NbvrP2MySYJXgPvu36c
ECCr3st/QJgX9ZU1TgizhLRezJxwAofTeS7I1rFNiy/KDAYZD2MsHjZjmJBCWoXM
zfSaPFx2NE26lveXqSOY2anpuVWYItUw59Nab4rKW/gzygyRB/rgJfZInEnWpIhB
YI0BNfxMC9s=
=8EKI
-----END PGP SIGNATURE-----
--=-=-=--
