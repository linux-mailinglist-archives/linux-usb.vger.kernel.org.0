Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9656A367F1B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 12:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235882AbhDVK44 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 06:56:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:59276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235634AbhDVK4u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 06:56:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B5C261452;
        Thu, 22 Apr 2021 10:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619088976;
        bh=/pjgdb7SPJ4sfDCKkWzbKs83nTC92d/LMJ+cqb8Q4kA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=C3UBY5goxHUE+TJB641m7PkpI1xGa/MuXqqJgPFWvSc3bdK7ZSuWr86kVIKWM4nhG
         2n8xcMKf5QiOoruwchVLoctskRrxWecnIcXBqy6Xateh4u32AxNdtixn28YTLu2FKU
         ngu+S1iBKH0vj2x4Shj4G/ZsUtIzQUj8K9pSQnb9myURRn6mRfsB8vftaoybU3fpxb
         bQeeA3mcqQo3X2XCHjL2FZi+3Jg1wGBl3joi9Dt/L6HxR5NLn0PqIeKafwjv2g8446
         wD3JcXyMlpNZOViNAgvWUnyqWRfm4HpuCLjKs0whv4t73Sp9TnTTlL5IXExodgbL6h
         hXDmBJicfkuww==
From:   Felipe Balbi <balbi@kernel.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] dwc3: gadget: fix tracking of used sgs in request
In-Reply-To: <20210421204837.4185-3-m.grzeschik@pengutronix.de>
References: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
 <20210421204837.4185-3-m.grzeschik@pengutronix.de>
Date:   Thu, 22 Apr 2021 13:56:09 +0300
Message-ID: <87o8e6mvue.fsf@kernel.org>
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

(subject format as well)

Michael Grzeschik <m.grzeschik@pengutronix.de> writes:
> The variable pending_sgs was used to keep track of handled
> sgs in one request. But instead queued_sgs is being decremented

no, it wasn't. If the total number of entries in the scatter list is 'x'
and we have transferred (completed) 'y' entries, then pending_sgs should
be (x - y).

> on every handled sg. This patch fixes the usage of the variable
> to use queued_sgs instead as intended.
>
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/dwc3/gadget.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 118b5bcc565d6..2d7d861b13b31 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2856,7 +2856,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc=
3_ep *dep,
>  	struct dwc3_trb *trb =3D &dep->trb_pool[dep->trb_dequeue];
>  	struct scatterlist *sg =3D req->sg;
>  	struct scatterlist *s;
> -	unsigned int pending =3D req->num_pending_sgs;
> +	unsigned int pending =3D req->num_queued_sgs;
>  	unsigned int i;
>  	int ret =3D 0;
>=20=20
> @@ -2864,7 +2864,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc=
3_ep *dep,
>  		trb =3D &dep->trb_pool[dep->trb_dequeue];
>=20=20
>  		req->sg =3D sg_next(s);
> -		req->num_pending_sgs--;
> +		req->num_queued_sgs--;

no, this is wrong. queued shouldn't be modified as it comes straight
from the gadget driver. This is the number of entries in the request
that the gadget driver gave us. We don't want to modify it.

>=20=20
>  		ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,
>  				trb, event, status, true);
> @@ -2887,7 +2887,7 @@ static int dwc3_gadget_ep_reclaim_trb_linear(struct=
 dwc3_ep *dep,
>=20=20
>  static bool dwc3_gadget_ep_request_completed(struct dwc3_request *req)
>  {
> -	return req->num_pending_sgs =3D=3D 0;
> +	return req->num_queued_sgs =3D=3D 0;

nope, request is, indeed, completed when there no more pending entries
to be consumed.

What sort of problem are you dealing with? Got any way of reproducing
it? Got some trace output showing the issue?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCBVkkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZrOQ/9H6xp4lLFbXLaQsvhuNciNlL1rwRCav7E
5/YYNccTRDxY8aLeIwb0oyOvaTzVDMCtmsmhIJuk74cRm2b+9nKR7moXHmfxDtSZ
Jfl1osrxBVzjKv71wTTPjj52pzxfj/9HMVvCXlKlJxxFnilt6XIZ0aWVajaIrdMY
ax9CNqL6S9eoRMNhDI/bxaBzjBq3YoXO1mDP1JWGRFd5+LKlqQ1XMJKTYtBthNLo
qkI7AdTKr6sY08VQ3xJyQ56paUVyjZDG9L00mhVkh1ovHGtNFjw7beCku7o8KpJK
QoCoi1+keCwtxQG/vdxZCjXNjV42py9Xs74j5teLumogP+YEvSjAF6mUtqZ+fbSU
xZdPb/y5I88hN7wZmxxPh3SAPzX4f3NUoHFVTxTETOKR3e31zTxI0opVR1RiPofb
Y46XMpU6TiSWkk9zjlGgFBgIcznreTqRttItxoe2KXSjbRSQKlFUQ5L5jdlHcKZ7
pNC0fJEsPbPt4qVL9wcd+uJROQQJbNuCSP3eklzL8uw38kOpWDhy4PSldPir1zpV
/JnZrniw23oQesXl6q0KpW5dCneINMa9YfhwfYnl9WVAv3lUWQkUPNy4Hcq0z+tN
IiMbXlhfCiYDH9wASNoVCsAAKEZ9MydtWlPg30g+IAWrYeYyHH27TOal40WCRqd2
GbLs52xWWG8=
=7TRT
-----END PGP SIGNATURE-----
--=-=-=--
