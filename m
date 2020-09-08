Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C23A260AC0
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgIHGUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:20:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:53468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726787AbgIHGUA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:20:00 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 605C1218AC;
        Tue,  8 Sep 2020 06:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546000;
        bh=6D8njUFnLpwtsiNp14oY+Gj4L60fxM5hWlgyrQGqFZk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BvucOyAPI7ZqrZWuHLVcMIEGi8ifOKRRQ3MV9VCXEfyvAXhNyOdbWQnETBqff3r+W
         k8i0YUT0HvPjZqGtA4kPyWYIH8/syHgSHKLJ0qS0DEo3vZBL3IiogvWzw5fXVfXxX6
         zWivmbSJVg3LRIWmg6JSMWxWi9xn+5XL9Qqg97N0=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 1/8] usb: cdns3: gadget: using correct sg operations
In-Reply-To: <20200901084454.28649-2-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-2-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:19:52 +0300
Message-ID: <87imcon62f.fsf@kernel.org>
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
> @@ -1162,22 +1164,24 @@ static int cdns3_ep_run_transfer(struct cdns3_end=
point *priv_ep,
>  	if (priv_dev->dev_ver <=3D DEV_VER_V2)
>  		togle_pcs =3D cdns3_wa1_update_guard(priv_ep, trb);
>=20=20
> +	if (sg_supported)
> +		s =3D request->sg;
> +
>  	/* set incorrect Cycle Bit for first trb*/
>  	control =3D priv_ep->pcs ? 0 : TRB_CYCLE;
> -

unnecessary change

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XIogRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbnjQ/8DNUKTiKadmxr6RkNUJ8hPn8ta+QBmMlX
tVALs9mwDHQTuNwjNEPdVFhsE64nOd/bF4mWIs64cXmLViafeZRPu2dDQ/YcTeBk
g6PRzaZcJaSl5qesHNjVTR7PdLMvNh9kMzcurHuJRkCc3Fhc4OXsft4UVaqwrtWK
OHfFgtx2juqScMBDPxYu/Jrk+xh8Gd7GTOScCHqiNNq4ahPg7qC3PDzkX9w4ITaY
cVWlhTpMEakfF0ck5O0e5H/+XR4gbXCsWxtfYGDXpZuRjqMkkTPHDbBVyH528urB
a2Ug79ETOaT6/TQZC3buaF4aYxzQ9lrtfBP/tiIcEkPprJpUCH6EVeFIj3yueuuW
u9xV0nUpJ8vIRPIJ/86jCK1iFCoZHrGhMbIAysmsOT8bCgL+DH36YoOdeigV3Cwu
Fam/qPyGkOuNI0VApt0c0RGRljar/uKDsCV7xIViZNPBjlfQnzy6rGaDZ76r0s41
VwkPQYq4iMCmIFPeyMm5CYltQz+/zzLLdhRpzQIDIbFoLV23H+UPlRMH7LeLN4A6
h+MivuULqExeji0Y/HTu6eyzARW06xVE4f/Eg1T9H5r94rCxj1bf4zE+2Gymh4UK
3FIXcF54t1nIy4gsSu/LMccY7sBkex2Ik/ylmxUxdSU2MMkfafwbGaVjxMNzPzQq
ryNMODWlOZ8=
=aHB9
-----END PGP SIGNATURE-----
--=-=-=--
