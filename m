Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D54A727BD36
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 08:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgI2GfN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 02:35:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:55082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgI2GfN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 02:35:13 -0400
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E40732083B;
        Tue, 29 Sep 2020 06:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601361313;
        bh=/RmDsE0taAfLxQC8CxUNvTfrGypqrJHBDHlKTRK5ZEM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BFhkwIwaxzFxN8qwiVEZChUexuLkl/f1Aimn3FVXqpBqh5P6WTLa9yYacKhwzSbAa
         wXi7r5QSrdxqWCAMklHGXJRjQw7Mjg/uE8IPxtHi1PRwGT0Bs7VKtDtQPHJ38OQi7Q
         eGrwVyBa+Rd80IBmU6f/bWtGGDaqb1RpWEaIhLVs=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Allow restarting a transfer
In-Reply-To: <d2664c6b9cbaa091c1ce7bea25e02989fc7f6272.1601342393.git.Thinh.Nguyen@synopsys.com>
References: <d2664c6b9cbaa091c1ce7bea25e02989fc7f6272.1601342393.git.Thinh.Nguyen@synopsys.com>
Date:   Tue, 29 Sep 2020 09:35:06 +0300
Message-ID: <87h7rh9jl1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> For streams, sometime host may reject a stream and the device may need
> to reinitiate that stream by stopping and restarting a transfer. In this
> case, all the TRBs may have already been prepared. Allow the
> __dwc3_gadget_kick_transfer() to go through to reinitiate the stream.
>
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 82bc075ba97c..c53a22f0d952 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1327,7 +1327,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3_=
ep *dep)
>  	u32				cmd;
>=20=20
>  	ret =3D dwc3_prepare_trbs(dep);
> -	if (ret <=3D 0)
> +	if (ret < 0)

do you mind adding a comment here stating the detail about ret =3D=3D 0 and
why we're still continuing with it? This would prevent someone from
reverting this change years down the line.

Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9y1ZoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY5+Q//TpaqBHMHGvfhHSjVbkkTVNWuY3A4hlKg
1t9V7EAPKiuhKcLVIGhNRRL7mAPsy7gAX5u8n3qGA7A6L0LYdFvnqquzKCdzojHB
vEOJHQcvc6jOuq5emAQBT7ctFpp0+DefCCULlAeIGPY8JUZbECzwq2OdUsFGOTb5
C9FWjRsHdh+O0lORShT3LzcIV29yYmLb4MNmE2rBK+IgwSoyHWx8xMvvmo9fj66Z
wNnho16FVmMvHeoP2rQCczBRVehOAyO4GQp0j2MGMEagv35KoBOxNKyKt0DPTQ4S
PJB159gRK6AtI9IBt7j39g4L5Q7QSukUf/xmWd/8kxUmGukOmczxr/+6CniWHKe5
k1siGjP7vIH/QnSKEMRFw7rHcEGvy3iXsoDVOoNP6TfiJAkw9LTblG737FUZWg0I
Z51yOj8kfwNGYTk/DCa5+WtgI8Op+HbtVsCAN0zIkG9D0NZC/C32s5sG0iOhYoYo
av6nv/rHjKPsvTFhNSOnIeSBDfOIBsqoSg0CVHa7D2PMM4qubHQ3cXTbgK1GP7tH
MuPma3VXLH8HdjQ0XHUjdrYD200OmlRDCapMuoWC3oC7FZnvbdaDb7G40FGy2Gy/
933cJzgJCZq5HHquqHXapDR4td5DFHIldzkYJhJGkpDMT8vcuFRJ2TxUj2oUZhDm
1CJZhCYyDP4=
=a35t
-----END PGP SIGNATURE-----
--=-=-=--
