Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01D1E1368
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 09:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389997AbfJWHtn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 03:49:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:62380 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389978AbfJWHtn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 03:49:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 00:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,220,1569308400"; 
   d="asc'?scan'208";a="397961262"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2019 00:49:41 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH 2/2] usb: gadget: composite: Support more than 500mA MaxPower
In-Reply-To: <20191023065753.32722-2-jackp@codeaurora.org>
References: <20191023065753.32722-1-jackp@codeaurora.org> <20191023065753.32722-2-jackp@codeaurora.org>
Date:   Wed, 23 Oct 2019 10:49:37 +0300
Message-ID: <871rv3kijy.fsf@gmail.com>
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

Jack Pham <jackp@codeaurora.org> writes:
> USB 3.x SuperSpeed peripherals can draw up to 900mA of VBUS power
> when in configured state. However, if a configuration wanting to
> take advantage of this is added with MaxPower greater than 500
> (currently possible if using a ConfigFS gadget) the composite
> driver fails to accommodate this for a couple reasons:
>
>  - usb_gadget_vbus_draw() when called from set_config() and
>    composite_resume() will be passed the MaxPower value without
>    regard for the current connection speed, resulting in a
>    violation for USB 2.0 since the max is 500mA.
>
>  - the bMaxPower of the configuration descriptor would be
>    incorrectly encoded, again if the connection speed is only
>    at USB 2.0 or below, likely wrapping around UINT8_MAX since
>    the 2mA multiplier corresponds to a maximum of 610mA.
>
> Fix these by adding checks against the current gadget->speed
> when the c->MaxPower value is used and appropriately limit
> based on whether it is currently at a low-/full-/high- or super-
> speed connection.
>
> Incidentally, 900 is not divisble by 8, so even for super-speed
> the bMaxPower neds to be capped at 896mA, otherwise due to the
                ^^^^
                needs

Why do you need to cap it? DIV_ROUND_UP() should still work.

> round-up division a MaxPower of 900 will result in an encoded
> value of 904mA and many host stacks (including Linux and Windows)
> of a root port will reject the configuration.
>
> N.B. USB 3.2 Gen N x 2 allows for up to 1500mA but there doesn't
> seem to be any any peripheral controller supported by Linux that
> does two lane operation, so for now keeping the clamp at 900
> should be fine.
>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/gadget/composite.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composit=
e.c
> index e1db94d1fe2e..92ce3018f482 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -438,9 +438,10 @@ static u8 encode_bMaxPower(enum usb_device_speed spe=
ed,
>  	if (!val)
>  		return 0;
>  	if (speed < USB_SPEED_SUPER)
> -		return DIV_ROUND_UP(val, 2);
> +		return DIV_ROUND_UP(min(val, 500U), 2);
>  	else
> -		return DIV_ROUND_UP(val, 8);
> +		/* USB 3.x supports 900mA, but that isn't divisible by 8... */
> +		return DIV_ROUND_UP(min(val, 896U), 8);

DIV_ROUND_UP(896, 8) =3D 112
DIV_ROUND_UP(900, 8) =3D 113

Why value do you want here?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl2wBhEACgkQzL64meEa
mQaY5g//cTQ21sqxjtSLVljv9foRp5xusGf12FxboPqS8pPcO2stuipCYEN2W/1P
4SfE4AZN7zK9Ml0Lkl25/MKwnW34D2U4rWPfKny273wXPSF8u4OPkQ2ufZKWB6SU
rUjhMX8e5O8XVXWcQPtVRsivCzPni5+fkJpm6cVjolnEXHQyz8Aor1SoTBQbCSoX
pkEv2Xu9Lu/FsdMdLW6SfOVfM08AKz1Ceo6bF3xwLvlOWQQXUe9wY52hYxff/Ovf
bXJa3EyAE2Rain28i3HvwbYudWLPJZd0I8PIX/afC8ujpOfra1BYIUnQyqCADrBW
qQoO2eK5ofzrhECkACp89qssQ/l7VYeSjZjlufAA/4s++XbNijVhC2QLWiYfYalI
BBp67Kqy0GkXFUDneZsvR9wo6SIadSMQWrT2AfIpW98BWObtPDX6bXrYT+3rveCx
sVfuKq/lsXAB6kn8O8YafVnOen+4j+8lUMquIgmXhzXE1ooh9m8A/VP2L8BKcgg0
vgGwBtzOPVvC7cEEfvfkGk7AHl99fouACQ2XGXVAU1hXkT8jlesMM5HGEDZSgeQ9
vhh3IHoyEfklE0gtFxB5l1DWeNaObrQYkMP9KqoQiR/tsbGD3l/c7XwVsssQrvBK
DVcOxCb7e535e1GPetPz1mdU4qA2vcsln4U8LuYbSQeGu88KeOw=
=nox/
-----END PGP SIGNATURE-----
--=-=-=--
