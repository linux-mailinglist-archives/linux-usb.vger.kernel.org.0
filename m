Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B78D260AD4
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728790AbgIHGVu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:21:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:54190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727903AbgIHGVt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:21:49 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66099207DE;
        Tue,  8 Sep 2020 06:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546109;
        bh=a5WLAi1MUUHjWpp0aRGilCkbLTQZ/tQdUIjt6MhCzM0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FFa3SNVRphFQSP5atPqw0u3u2CzRCrU6/RIeyjG/osSeBXTndB23Nnu2iARGEoEzV
         Jgvyc+/HsHypv+UCSO+KEvPmKlsllAYTWEbv4atOi/vYaKdSTg2b2ILTadqG0/DljB
         FFV4SCVJ3q+/WA0oNsnDk3t/sw0ndMpeYjp7dtD8=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 3/8] usb: cdns3: gadget: calculate TDL correctly
In-Reply-To: <20200901084454.28649-4-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-4-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:21:42 +0300
Message-ID: <87ft7sn5zd.fsf@kernel.org>
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
> @@ -1168,9 +1169,19 @@ static int cdns3_ep_run_transfer(struct cdns3_endp=
oint *priv_ep,
>=20=20
>  	/* set incorrect Cycle Bit for first trb*/
>  	control =3D priv_ep->pcs ? 0 : TRB_CYCLE;
> +	trb->length =3D 0;
> +	if (priv_dev->dev_ver >=3D DEV_VER_V2) {
> +		td_size =3D DIV_ROUND_UP(request->length,
> +				       priv_ep->endpoint.maxpacket);

spaces for indentation?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XIvYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbF0g/+L5v30Yjh6BzD06GDpzR0spCxFT7ZcJzZ
q8JcG6RMbM9PueXn3uoYKszBC6rrRFMcxc2gdSsh/G3Wumkv37HPsQBVgJnO7eWD
5inRzrZ6JAAKhl7XZLmy6JMmhsXNJ4ZkZkhcTMMbagFDD7PK/57g+Ui7NYZZqLYf
Dipb2uld9Ioahu73oVsEXvqwUkUIoJhUEFmyjm2R9pzoR9xHGVaVidcAstdH2i1J
E1/Ve3J2EpMZfL+jzh21u4yCbjeistV1/OhqBOozf0yu9q4/Jpy6eBkYLcYQla1c
WnpkLY180i6JAwO5BvWPibmvhbdPpNu80kwWQPRIRH5sUDkEBr5ErkM9bNnkAUBq
VZaCTUma5NPcFjexKHejr5QKgA4UXV4M9EYqGbYw7WFBn3u2Rde0cRqAxezbszi6
hfVJ+Gna0pPoHfH20J1xShwWRgQa5hbqeEfTx9rhjog9Xz0CKTIy884T6efy9NFz
5N/0T/YsHtS6hiW2YiVH4fG+0kbA/yvBScQ23IG+ZNKcTVWNekthTSxIBSbmElgb
sGgfUSUCkV6iui2r6Yp2+tRzAzO6GUPGBn/TGwp8EdW7BlWJfJVgUZzczn4BIqtq
m3vM70E1DziGGGYVzkAR52u/KyFnGzoC7DxWP+gn9Maljf3aKSMUMHlNnCDV+Rg7
dE2gvm/u64o=
=B654
-----END PGP SIGNATURE-----
--=-=-=--
