Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344A0260AFA
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgIHGbH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:31:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:56066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728501AbgIHGbG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:31:06 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D2C3207DE;
        Tue,  8 Sep 2020 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546666;
        bh=tKFqs58DUBuvgkG9OhvtPVhfc2JM8UM0V/+NiletXWQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EZxR6/+q+RTWx1EvjPKJauS6ZfDl/fCRMnR7ZetKPIpUHwb7c2jTANJGYK2BkA3Ey
         WNbG9ahPI77gskoHwuK09A8D7iILGG+hfgXwOnPuFEtAXv0cIJIk+qHvrQg9ApT4YA
         LxUVdrUa6HZE2mGHetpy6iM6+sAXxnCfe8YTM79c=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 7/8] usb: cdns3: gadget: sg_support is only for
 DEV_VER_V2 or above
In-Reply-To: <20200901084454.28649-8-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-8-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:30:59 +0300
Message-ID: <874ko8n5jw.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:

> The scatter buffer list support earlier than DEV_VER_V2 is not
> good enough, software can't know well about short transfer for it.
>
> Cc: Pawel Laszczak <pawell@cadence.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/gadget.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 1fd36bc5c6db..82dc362550bf 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -3161,7 +3161,6 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
>  	priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
>  	priv_dev->gadget.ops =3D &cdns3_gadget_ops;
>  	priv_dev->gadget.name =3D "usb-ss-gadget";
> -	priv_dev->gadget.sg_supported =3D 1;
>  	priv_dev->gadget.quirk_avoids_skb_reserve =3D 1;
>  	priv_dev->gadget.irq =3D cdns->dev_irq;
>=20=20
> @@ -3200,6 +3199,8 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
>  		readl(&priv_dev->regs->usb_cap2));
>=20=20
>  	priv_dev->dev_ver =3D GET_DEV_BASE_VERSION(priv_dev->dev_ver);
> +	if (priv_dev->dev_ver >=3D DEV_VER_V2)
> +		priv_dev->gadget.sg_supported =3D 1;

is this a bug fix?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XJSMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZK1BAApUS1GDqKd5+mN3Dd4sVI7tdM04tnyAW0
AC0MrUfp5w2ruh/J0L38+VuzXcwHCJ5yQ+OosZrKF7GcjycfVFjPekp2Qtn2oQn3
LRQmkoMC2afOj3BR31HWsqkosEzsvE8nFd5md/NlG40TGXbDsNRKSFVSlkhkMQ+4
P3r+cPH0Up05LdVE6awQ3I2PtCiuO4t8Gcd3xbmGfhnHXGYYhg3gcngb1yJADFU/
CixyYXsNwoXleuAi9i2l+LQyq+ksRwURNcPJu0yaIgMjtGkCVF47twPvSgArZbye
c+Xw7Te4swETBjj3RFftbwjzevUph61WARPfE8CBXCQsXhThEdKlcKCZDdL1FT/t
PZfRJHu2f/rcqpM4BQ2/lsH5fGjcQjUKOXz39kpH/J6tZgd119Tw2FoKqo+oPXwh
Hhd5MyFBEebsHOjgnjMCpZ6jCAIW8lw6NZJ3Mrai6301XHhfmyG/MuNhaltFBcmf
CdA/tEcWj4UwAPlSaW8TeXV/LjjiJ2318xxIr+cOjqY+/Nu1D54SEZBiNe4h1IoG
TjfpMkWaVSRgbv7yfET1k6BhCOWAnbFTVdcCUn9umoI47P7qvSLW6qE6W4QW+Tpl
il3ZJw8rREXkHQvsMkVlaww038doIteDcR8/ErHgxJQzUsSFpiLZAY9ejqHSqRRT
K1o6Sbcwx58=
=KGp1
-----END PGP SIGNATURE-----
--=-=-=--
