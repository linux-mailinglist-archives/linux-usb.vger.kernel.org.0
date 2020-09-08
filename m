Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0539F260AB8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgIHGTU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:19:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:53250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726787AbgIHGTT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:19:19 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C0A62166E;
        Tue,  8 Sep 2020 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599545958;
        bh=iJ5nEG3vlSbxGnjYr6G7d7BX6ZmK+uuOPRVP7Tx9jjU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=YnEHv9zpwc9Q7CeXWxwZq3Axg7ky+8+9P3hgtkJP2SD3Qzv1v6vD1FPio/A8ARka2
         E5tu9PiZlQi6lMnc0Zj63zBBHxOi+/OJOiOfpQ61geKOyMSsX/Xa4dcTvN7Ctb7/J1
         oLWU4qiX9Fz48kQg3NY9rB9bsmzAQBozMjEF540U=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 2/8] usb: cdns3: gadget: improve the dump TRB operation
 at cdns3_ep_run_transfer
In-Reply-To: <20200901084454.28649-3-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-3-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:19:11 +0300
Message-ID: <87lfhkn63k.fsf@kernel.org>
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

> It only dumps the first TRB per request, it is not useful if only dump
> the first TRB when there are several TRBs per request. We improve it by
> dumpping all TRBs per request in this commit.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/gadget.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 50282cab5fb6..f68c30b808dc 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -1089,7 +1089,7 @@ static int cdns3_ep_run_transfer(struct cdns3_endpo=
int *priv_ep,
>  {
>  	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>  	struct cdns3_request *priv_req;
> -	struct cdns3_trb *trb;
> +	struct cdns3_trb *trb, *link_trb;

one declaration per line

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XIl8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZx0BAA3R5ccueAYIsKqDJPZZTGeqpqe7DRfBrZ
BM5qdD4exN7n3dKkxUNh2FwB82HC2GM2JErsVnbQu5+ECbFrhhqaarQOzRao7S1v
RiCu9ZB+bxS3O2FElk+lsQ+AndexP3FL+9++dLHowVh8IgUg5AYf0EKyXeDKVFxd
E2Rfwd/CvH8fkvOxV6xVulukB2cKUodTACpw+e6YmdSbGKO3NUuCK00PbDK14OR6
LlpLz7Vch5isHroJUumT6mtr5XA04jiPVK0WMLGpSkuDBkpbcS15lod6yTWa0bk8
KCEfi1XL3j3z99DrIksaRZnPx2Ik5+b/LSdhIiwsIREDeBvitnQ+q0w+Id4X4BUC
qGP3kkdLak2bTOP/7g71MrMWgRiu+LqvvmF+MQl+CGztmH406HL1D1/iLB6WdanX
n9kresDcRcwp6bEnr8hKhFGy9rvf/c1VI8Pv8VBXY2YaKhGSgDOQhpxRorxwb8EO
dW8ecX84GIZpUfkFj8z/F+onSO0IT+WJaumH/uFYImd9LhogXTkclthwux/HCMro
1fv4566xr4MZuuT1ZWXcpLOXI4YXaQmdqZKRQkbjOUdoAweAjFd6ZsqmAKt6hpHz
/sGHXpEU331JAzrGxQkKFDS2My0o0L1BjNDiCZr9sbVVnwkkb6V2hkvTPnR7pA/5
MDDqdD7JWQI=
=TeB8
-----END PGP SIGNATURE-----
--=-=-=--
