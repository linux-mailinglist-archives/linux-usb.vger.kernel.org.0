Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C78BAE8640
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 12:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfJ2LDd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 07:03:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:50619 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbfJ2LDd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Oct 2019 07:03:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 04:03:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; 
   d="asc'?scan'208";a="350949554"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga004.jf.intel.com with ESMTP; 29 Oct 2019 04:03:31 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     jackp@codeaurora.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: composite: Support more than 500mA MaxPower
In-Reply-To: <92d4a38890cbac34e6bb52dcf98f394c@codeaurora.org>
References: <20191023065753.32722-1-jackp@codeaurora.org> <20191023065753.32722-2-jackp@codeaurora.org> <871rv3kijy.fsf@gmail.com> <92d4a38890cbac34e6bb52dcf98f394c@codeaurora.org>
Date:   Tue, 29 Oct 2019 13:03:27 +0200
Message-ID: <87wocnhkzk.fsf@gmail.com>
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

jackp@codeaurora.org writes:
> On 2019-10-23 00:49, Felipe Balbi wrote:
>> Hi,
>>=20
>> Jack Pham <jackp@codeaurora.org> writes:
>>> USB 3.x SuperSpeed peripherals can draw up to 900mA of VBUS power
>>> when in configured state. However, if a configuration wanting to
>>> take advantage of this is added with MaxPower greater than 500
>>> (currently possible if using a ConfigFS gadget) the composite
>>> driver fails to accommodate this for a couple reasons:
>>>=20
>>>  - usb_gadget_vbus_draw() when called from set_config() and
>>>    composite_resume() will be passed the MaxPower value without
>>>    regard for the current connection speed, resulting in a
>>>    violation for USB 2.0 since the max is 500mA.
>>>=20
>>>  - the bMaxPower of the configuration descriptor would be
>>>    incorrectly encoded, again if the connection speed is only
>>>    at USB 2.0 or below, likely wrapping around UINT8_MAX since
>>>    the 2mA multiplier corresponds to a maximum of 610mA.
>>>=20
>>> Fix these by adding checks against the current gadget->speed
>>> when the c->MaxPower value is used and appropriately limit
>>> based on whether it is currently at a low-/full-/high- or super-
>>> speed connection.
>>>=20
>>> Incidentally, 900 is not divisble by 8, so even for super-speed
>>> the bMaxPower neds to be capped at 896mA, otherwise due to the
>>                 ^^^^
>>                 needs
>>=20
>> Why do you need to cap it? DIV_ROUND_UP() should still work.
>
> The round up causes 900 on the input side to be greater than 900 when=20
> doing the
> reverse, i.e. multiplication by 8.
>
> Alternatively we could just do a normal integer division here=20
> (effectively
> round down).

(...)

>> DIV_ROUND_UP(896, 8) =3D 112
>> DIV_ROUND_UP(900, 8) =3D 113
>>=20
>> Why value do you want here?
   ^^^
   I mean which, sorry

> Right, but now on the host it will do the reverse calculation, i.e.
> 113*8 =3D=3D 904mA.  For a root port this would be greater than it's
> maximum power budget of 900mA and would result in not selecting the
> config.

That's a very good explanation of the problem, thank you. It seems like
a round down would be safer here in all cases.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl24HH8ACgkQzL64meEa
mQa6Xw//T4k2MAnVeJ5zyEyyLio428qoMvqC6Qr/jRMli4ayk7TsGedF7McUj/Dk
v/tGoTvkw2tEyXTDXNGpawQhL8OLxVfgG8+SC0mxHfMmOWfpriGRXV3nSI8YpGiM
Ub5iXxcEiOb0RebirWxuhQ4L+DUJjov7HyuhhKvo9p7F59JOgMWXgFxGkGBV0dW2
EB72/N18OiFvHyez+B+z/ED7WXO++cpqfh6shMW7H666NDo0Z6+zEzeFQKr3sLiQ
XhFFRwT2FESuOE6JiuLw73/j+c0LZB4O/2kq4J7jsn2vsFFXWVPC/rcF1JtzR6F8
WksBGN3p3T/Pqwy7qAeEwZBZ0J6XoVYzub5lemDCSdJVBaYHDWOYVk1TiCTzSckH
vYxeki9wOXpJoCrpO41qtck1gcP/Q3B8qlj429mhni7tgcs+ynro1VOM9UptJyCZ
fzIVohaA2l6yAyLBeRGlShshFN/rWP9eeNSUUqp5/ZkqINTLRX3tjVKlKWohKtN7
i7TO4QQ+ZihMoPCzi4wqNyS7BTVHCgq58OPOebV9+nz8MZow8NmhhlX7hu4LGMqP
xwaf4dZQQ04LYAObCDU1xfVeF93EnLwRGju8kQegAOYoEeGow4At8koJk3vwJfcz
UrLUQElNXefxtVL9/ViE9T2V49Q+p90aOzN5UnWWuv7WLV39AEM=
=KREz
-----END PGP SIGNATURE-----
--=-=-=--
