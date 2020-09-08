Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E103260AF9
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:30:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgIHGaD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:30:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:55874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728869AbgIHGaC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:30:02 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F36921532;
        Tue,  8 Sep 2020 06:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546602;
        bh=2PM4BS/VyOP6k7uSLDFqufI9yqIpRwJ7HeYv7mznjBQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Fote4zkld6nTExQBI/oW7Okoaq/b3u8SCKL/cXxU06gTIyrXW35mTa8rQ+DSS7Ll3
         PcpfU0/eZpxa66aCv2VBE6UVOwLnZXO/Lh+TmpJ2AvhbmC4l0kxAqrYHox2mf0TQ4w
         qineP0kWZoRklL91IP4O9lA1HSgYN7uHFhiePKDY=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 6/8] usb: cdns3: gadget: need to handle sg case for WA2
 case
In-Reply-To: <20200901084454.28649-7-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-7-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:29:55 +0300
Message-ID: <877dt4n5lo.fsf@kernel.org>
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
> Add sg support for WA2 case.

what's WA2? Care to spell it out?

> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/gadget.c | 44 +++++++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 6cb44c354f40..1fd36bc5c6db 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -462,6 +462,36 @@ static int cdns3_start_all_request(struct cdns3_devi=
ce *priv_dev,
>  		(reg) |=3D EP_STS_EN_DESCMISEN; \
>  	} } while (0)
>=20=20
> +static void __cdns3_descmiss_copy_data(struct usb_request *request,
> +	struct usb_request *descmiss_req)
> +{
> +	int length =3D request->actual + descmiss_req->actual;
> +	struct scatterlist *s =3D request->sg;
> +
> +	if (!s) {
> +		if (length <=3D request->length) {
> +			memcpy(&((u8 *)request->buf)[request->actual],

			memcpy(request->buf + request->actual, ... ?

> +			       descmiss_req->buf,
> +			       descmiss_req->actual);
> +			request->actual =3D length;
> +		} else {
> +			/* It should never occures */
                                           ^^^^^^^
                                           occur

ps: famous last words :-)

> +			request->status =3D -ENOMEM;

this is not documented as a valid status for usb request
completion. Who's treating this -ENOMEM case? Which gadgets have you
tested with this change?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XJOMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYDnRAAp4b8O7q1GLjDfTpXFdiHMEa+5PbROoZE
NQ082hfCxBJKf+RictAMeNy8unTaMgH93FufCg6OYxpm6d48lBJBbeBY24nb+MoE
PAc6nQ2UYPUCvvqKnAPVVdu43j4jgahZme+XfZX4Lh+NLSVfSuU96TIr+adE/aza
fTp76y4G7hYX6NDST5rz+Pi+L2x+IrkXKB49/I/zP46pD87tEyNZ0z056mqhv8yh
5KE13GHa4nhPutssas9TJLdmTu0gQditA2hk+MZRfv9n367Tm/0lJCPdDPcIzmZj
i+on9RetAVbXDuX2EvqXCEiA7ZXjF1tQC3+WNjE0i0Q169c2tN7vD1ocLybg2OdX
35mTViGyfT8i+cQBxbEekrIOtdII1Htvw+UXzWGP7SpcwNWLLr3Mj4keZj62ckSm
SKpkHdvRqnG93mp01izUq63jKiSS6NixrwLWSu/Wx1b+KvQF9tiRHrZ8r+7NF7dl
jgGkVNa/624QC0RYYKRJB94pH938UcSQ6wOuKQAgRXBWIEoGksbW895Ce8XhPDmX
9nYgNjkgGAu2Bl5VLmqZkxFznaM8QXAA4hIAAzm5jZcI0cy0nbSdlKX3tJMVkfKm
MS6mJenoi58ydgjWqeB2QdpVp7A+VLpdaYfdaXVU/3pVI8QOIxwz3vgA6t3VWydE
gCELuJJvZbI=
=8zdA
-----END PGP SIGNATURE-----
--=-=-=--
