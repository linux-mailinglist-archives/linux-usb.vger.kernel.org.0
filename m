Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAA9251179
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 07:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728352AbgHYF1Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 01:27:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:33680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbgHYF1Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Aug 2020 01:27:16 -0400
Received: from saruman (unknown [194.34.132.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 028D020738;
        Tue, 25 Aug 2020 05:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598333235;
        bh=89Ugqw89n8UiV7pFhqsKIwbiQvViTv7FgVjlKo0BSJw=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=h9vGWGh2NzK4yHZcisN4PAGJsJgMIxCq4q0fzeY012iSGDq/tMgvkJTYjUQGOb8/I
         7AR8G5vdZgDtE6yNLo/9YV9zDJfWWm6AFu+y79DEOOYmEq8bYDG0xB5M11iBmzejCM
         y7XjLIzhn3xxJTExKb0c86fAOw7awPJEYa2FssH8=
From:   Felipe Balbi <balbi@kernel.org>
To:     Sid Spry <sid@aeam.us>, linux-usb@vger.kernel.org
Subject: Re: mkdir acm.${name} in configfs always fails with "Device or
 resource busy"
In-Reply-To: <d22c16f3-9fb2-4dd2-b511-5f2b5a975d6b@www.fastmail.com>
References: <508e531e-076d-4b02-8aac-783842346bc2@www.fastmail.com>
 <87ft8ck1qx.fsf@kernel.org>
 <d22c16f3-9fb2-4dd2-b511-5f2b5a975d6b@www.fastmail.com>
Date:   Tue, 25 Aug 2020 08:27:09 +0300
Message-ID: <87a6yjjnwy.fsf@kernel.org>
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

"Sid Spry" <sid@aeam.us> writes:

> On Mon, Aug 24, 2020, at 1:16 AM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> "Sid Spry" <sid@aeam.us> writes:
>> > See title. I'm getting this even when using shell commands, so I don't
>> > think it is my program.  Creating anything else, like ncm.usb0, will
>> > work.
>>=20
>> which kernel version? which usb controller? which platform?
>>=20
>
> Kernel 5.4.45 compiled for a Raspberry Pi 4, the UDC is a DWC2.

great. Latest v5.4 stable is v5.4.60. There have been a few fixes in
dwc2 and gadget drivers between .45 and .60. Just to rule out a problem
that was already fixed, could you merge v5.4.60 to your kernel and try
again?

> On another device (Allwinner based) I could add one serial gadget
> but not two, and I though this may have been endpoint exhaustion. Now
> I am not so sure.

It could exhaustion of Interrupt-capable endpoints. It depends on how
the gadget and the UDC were configured.

cheers

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9EoS0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQb5nQ/9EltbuNGrCbMReuKEvXm/zZY10Y4UH7uV
JeOMsgFYLVhQZ4QOdmgRQzrkg8KshDLT4CkfWO2Z+zsyhPw3IoYhWF0XZ4+NRJoC
crzVEZPl+gRbQAn5JspZt2sHAs930g9f9W7l627moA7FPOubFw7aD/ryuknBLgAw
DtpZrKRZACNexBBukBgyFhz0r73lgahElnXI16n7QRpXMyn0cc9bysigYK7hcZwd
DpSOYlTHhsBDrVmHFK4sfBJOZi95map0QvQgpHr0fUy6+hr72CYARV57OD6qw/Q/
7S0f3oSokL3X4W8oTUa1p9AWbujOhTSVPi2K5z+aFLL31JepADQrVs8nsLrgMTW6
I4hky9zV4Jx+BwYOpvJgku+6YHbYKAHMuUk/K2Nci4A4LxQUpQd2fZH9Yj8HI12d
mLWoVZTt8CP6D/Brj1FLRXNMxkCrz5Q7J6SehCYLeD5w1QrICS4fBaSB0sKJhiC7
remtbO+e0oAzQxFJy/TbfY6qAikLzczmvS3Ys7WUIS0ODdPFJ+We7VP0J1U6bwFj
ZCTm7vtSwiO3kN8MfGD+1X3S7HIheALGVWR0/AOVK2n8XPJ5huYMDnQqc9wjw7f+
va0xshM1+fXbBdfbPEEGtVlLAbM9m1h5+Cgqmz6oJwjcUzMFzwdF+A7Vtp4O+ZJA
U+eJaiEwmzY=
=95hA
-----END PGP SIGNATURE-----
--=-=-=--
