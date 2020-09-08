Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121E1260AEC
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbgIHGZx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:25:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgIHGZt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:25:49 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 748A121532;
        Tue,  8 Sep 2020 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546348;
        bh=Q8qAMx+NP7u70ldvZgDJ4ldMHSRBRu5t8XnIngB7RcY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=yhzmmLcd/SSQiJ3MTx7ACFW72HKwMk/JyvpG+kiECugHczruPOB9Lbti/87A6fuj2
         L7ADbddrigiD2dtZVWzeaU1SawRu/lUoY4u7A+1dPCWHS8zoZKzd3DD79iw6k2qgye
         rFMX+83483k2keB/jVmP9Waoq5C1ix/eeTnnppEM=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 5/8] usb: cdns3: gadget: handle sg list use case at
 completion correctly
In-Reply-To: <20200901084454.28649-6-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-6-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:25:41 +0300
Message-ID: <87a6y0n5sq.fsf@kernel.org>
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

> - Judge each TRB has been handled at cdns3_trb_handled, since
> the DMA pointer may be at the middle of the TD, we can't consider
> this TD has finished at that time.
> - Calcuate req->actual according to finished TRBs.
    ^^^^^^^^
    calculate

> - Handle short transfer for sg list use case correctly. When the
> short transfer occurs, we check OUT_SMM at TRB to see if it is
> the last TRB.

it looks like each of these should be split to its own patch.

> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/gadget.c | 85 +++++++++++++++++++++++++-------------
>  drivers/usb/cdns3/gadget.h |  9 ++++
>  2 files changed, 65 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index a308a694abc5..6cb44c354f40 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -817,6 +817,8 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *pri=
v_ep,
>  		       request->length);
>=20=20
>  	priv_req->flags &=3D ~(REQUEST_PENDING | REQUEST_UNALIGNED);
> +	/* All TRBs have finished, clear the counter */
> +	priv_req->finished_trb =3D 0;
>  	trace_cdns3_gadget_giveback(priv_req);
>=20=20
>  	if (priv_dev->dev_ver < DEV_VER_V2) {
> @@ -1241,6 +1243,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpo=
int *priv_ep,
>  	trb =3D priv_req->trb;
>=20=20
>  	priv_req->flags |=3D REQUEST_PENDING;
> +	priv_req->num_of_trb =3D num_trb;
>=20=20
>  	if (sg_iter =3D=3D 1)
>  		trb->control |=3D cpu_to_le32(TRB_IOC | TRB_ISP);
> @@ -1362,7 +1365,7 @@ void cdns3_set_hw_configuration(struct cdns3_device=
 *priv_dev)
>  }
>=20=20
>  /**
> - * cdns3_request_handled - check whether request has been handled by DMA
> + * cdns3_trb_handled - check whether trb has been handled by DMA
>   *
>   * @priv_ep: extended endpoint object.
>   * @priv_req: request object for checking
> @@ -1379,32 +1382,28 @@ void cdns3_set_hw_configuration(struct cdns3_devi=
ce *priv_dev)
>   * ET =3D priv_req->end_trb - index of last TRB in transfer ring
>   * CI =3D current_index - index of processed TRB by DMA.
>   *
> - * As first step, function checks if cycle bit for priv_req->start_trb is
> - * correct.
> + * As first step, we check if the TRB between the ST and ET.
> + * Then, we check if cycle bit for index priv_ep->dequeue
> + * is correct.
>   *
>   * some rules:
> - * 1. priv_ep->dequeue never exceed current_index.
> + * 1. priv_ep->dequeue never equals to current_index.
>   * 2  priv_ep->enqueue never exceed priv_ep->dequeue
>   * 3. exception: priv_ep->enqueue =3D=3D priv_ep->dequeue
>   *    and priv_ep->free_trbs is zero.
>   *    This case indicate that TR is full.
>   *
> - * Then We can split recognition into two parts:
> + * At below two cases, the request have been handled.
>   * Case 1 - priv_ep->dequeue < current_index
>   *      SR ... EQ ... DQ ... CI ... ER
>   *      SR ... DQ ... CI ... EQ ... ER
>   *
> - *      Request has been handled by DMA if ST and ET is between DQ and C=
I.
> - *
>   * Case 2 - priv_ep->dequeue > current_index
> - * This situation take place when CI go through the LINK TRB at the end =
of
> + * This situation takes place when CI go through the LINK TRB at the end=
 of

not part of $subject

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XI+URHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY3zRAAhZGVRcXXBeXj+S7XztHNmhsNEoSAGusq
lN3RryuXRmR/o+c2Y/9E+qTsSHOWvLn4lEvxgYfbltjwCJASZI57vojz30b87fuq
I42FEWtUa+vbRtUjzAO409vT3zECltBbXREjk4RNUlKStuKFRPCnwpLKu5wFfT21
cNEmblxPe7Img0b0kL9Weq/EsI6wp3CHX3yDstociWfNuSKLsGQPPx4vorINzpW8
WoLQdXOj5ZZfRVOraqqbt8wsRFHWhktC+Mgy7rlzstpxljcjpjzZEiSoq+pcvBn3
LC7MUW+a33cIASU870QE0RY+pknN0zA36f830J2WR1emoU1hxrn8JQI9BIwZr/Eq
ViB8y9cXXfHWp8GiqvmDso2Ok65SDOSGE+c+MtjveptSVRpndmM3pcKTkiDzvEH7
RmXZFUd9xZFOsyx5UreEcPq5ONLH+qTe8jQlStVWPaKUI/1iUrNMmsqhrb/EifCe
epKdNq79eCZBQvorlkgHnGpPNxsmsBuTpPest/lkeRXVwbNzkPJWkZMp2Xig9+uQ
tqcv5sTKU7qvRi722I/7TCiKOiche/QYzDI+223zJW1On7mwLqbd7mys4n1LE0hs
mczGfF4PKc/qjeKpCnadV1VhMGFMT5F5TJ3qNihrtme6gyUIj8E5JVHyDvl2Mwjk
3d5GYFYxdCk=
=goLi
-----END PGP SIGNATURE-----
--=-=-=--
