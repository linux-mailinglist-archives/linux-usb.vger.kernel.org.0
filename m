Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190EB3A2A98
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFJLtG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 07:49:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:55302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230084AbhFJLtG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 07:49:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69A35613CA;
        Thu, 10 Jun 2021 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623325630;
        bh=yvtVNRtmizxW7ILkuH2Yc35qjJxkXeFJIEZT3zghOuU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bwHQYcR1GoCtXD3liJ8BWl03lHRt/dh1nZ94for6c9nnhQTaPE004mol+jQrzt95A
         QFOupBbyID8J2hmTTcAVFUbkFaag8qQ0PC42U8aGDYleVScQM3YrXRnoE60OyHdrVw
         BC83PbKmc3qmZ/VbjRi0UlqSH8MnIc8aIBB3T1HVSzY9R/1KWDm55gh59+cFwDF7gJ
         hv7P7SnBvcYvZGRLXYiRyzdZdczvB6yLxKISj0cWrBBHZYzAXTiZqJoHaS9EnTpjDM
         VvJ4N9ANqQI06cayUy0Ud74LA6AsGRrGhr+An9WcPndKTTZBvZ9BfwpN71qeQIQBTz
         MnzYxonLVJ1VA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Yuan Fang <fangyuanseu@gmail.com>, linux-usb@vger.kernel.org
Cc:     Yuan Fang <yuan.fang@verisilicon.com>
Subject: Re: [PATCH] driver/usb/dwc3: Add error handle for dwc3 get usb phy
In-Reply-To: <20210610113745.7710-1-yuan.fang@verisilicon.com>
References: <20210610113745.7710-1-yuan.fang@verisilicon.com>
Date:   Thu, 10 Jun 2021 14:47:03 +0300
Message-ID: <87bl8e0wnc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Yuan Fang <fangyuanseu@gmail.com> writes:

> Add error handle for dwc3 core get usb phy, because
> without error handle will lead to bug.
>
> consider case like this, when both dwc->usb2_phy/usb3_phy
> and dwc->usb2_generic_phy/usb3_generic_phy do not exist
> current driver code set them all to NULL and return 0
> to caller which means usb phy is ready.

it's unclear what the problem is. Care to describe what's happening?

> Signed-off-by: Yuan Fang <yuan.fang@verisilicon.com>
> ---
> Hi maintainer,
>
>    I find this issue when i try to add a new usb phy driver for
>    dwc3 usb core, this issue looks like a bug, please kindly have
>    a review, many thanks.
>
> Best regards,
> Yuan Fang
>
>  drivers/usb/dwc3/core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index b6e53d8212cd..4d527d313a4c 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1184,6 +1184,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
>  		ret =3D PTR_ERR(dwc->usb3_generic_phy);
>  		if (ret =3D=3D -ENOSYS || ret =3D=3D -ENODEV) {
>  			dwc->usb3_generic_phy =3D NULL;
> +			return dev_err_probe(dev, ret, "no usb phy device\n");

no, this is incorrect. Some platforms don't require a PHY driver at
all because there's no SW control for the PHY.

Moreover, generic PHY framework protects against NULL phy. I don't see
what the problem you're referring to is here.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDB+7cRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhqRAgAqNX+NNo0TwF+0t39IgUC6D9VyH3LF6H2
gBs+xCyMCw0Q77JkCjO6hGrctgcZIuBVjMq4RF5GmvS0+P+KZKpBdNOEGy1OhdON
ZRfDC2SvWhw7HaaMQst5a27XoOMHZCycia/uF7ovPuZePMQ/aFNuc26sBPkmAN9J
Xrr0uPuGuwB+bFW1Acr1uraniQdi/AWd0sH8KBw2uyuLE2/GODpKlKz2dLixoWOp
aNGCl+o6+Ll9Wz52j+Zv7avRIkmSMUT2XOMPA5J0h6konyLchHJqyzzg9DCz3gEV
3Wk9+xOJOt8glbvSw6YIW91RNymQFMXiqtFGkkHHaKsxgSSpDNTSEg==
=oioT
-----END PGP SIGNATURE-----
--=-=-=--
