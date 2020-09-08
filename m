Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECEEE260ADB
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 08:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgIHGWx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 02:22:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728009AbgIHGWw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 02:22:52 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 35B0E207DE;
        Tue,  8 Sep 2020 06:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546172;
        bh=XBluZHCbDCHpGd3Kgu6I6hOk36uZqwR347/Poo5IlxA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HxUmOzuz5dOaB+eu7wfOjJgCDxXAvtxGJ9rcUbJ30JU1ubRvOiaX26Fw9qZ92l5Ar
         hVc82RCEgL7MuFWXiH7kvqwL40867VGIwDW3b+ZrRZMc0b8T90CxuXgbbRlfJrgIjL
         xpA/Kzn87L+yCIpm6lrJrhdwWX9fdow+hEyIth+c=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 4/8] usb: cdns3: gadget: add CHAIN and ISP bit for sg
 list use case
In-Reply-To: <20200901084454.28649-5-peter.chen@nxp.com>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-5-peter.chen@nxp.com>
Date:   Tue, 08 Sep 2020 09:22:44 +0300
Message-ID: <87d02wn5xn.fsf@kernel.org>
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
> For sg buffer list use case, we need to add ISP for each TRB, and
> add CHAIN bit for each TRB except for the last TRB.
>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/gadget.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 25e3ff1cdf61..a308a694abc5 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -1221,8 +1221,14 @@ static int cdns3_ep_run_transfer(struct cdns3_endp=
oint *priv_ep,
>  		else
>  			priv_req->trb->control =3D cpu_to_le32(control);
>=20=20
> -		if (sg_supported)
> +		if (sg_supported) {
> +			trb->control |=3D TRB_ISP;
> +			/* Don't set chain bit for last TRB */
> +			if (sg_iter < num_trb - 1)
> +				trb->control |=3D TRB_CHAIN;
> +
>  			s =3D sg_next(s);
> +		}

is this a bugfix?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XIzQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY0qg//f05TYxrqQWFV9XifAX8NzyIc/IEIypK3
twuQPHqr+AN1CEmY+jcoX6EniNRJz3tsfj60OTLUDo21ATMgq41zwn2SgIEU590T
cGI9Vu44csJbTvi+MUIfUYB6Bhd2+BEdrUdFSthgdOKrv0dMuSuN5/TsYOUvrEpn
Av/bPmTxBzjmUJxVn9SQKsVHc8MjvmMhjwKMxRrLUUEIyJaJNCBvtX48iMiEDcBg
SfwUP+dylfGwRoXD4rDB0dj0AvaAOpbulW+UA/SRZszZNE19NPIeuvi81+/wmGOs
39l01V9EECz+IWQVX+r2wKJsSiLTHqUgEyDbaN9wfKlpstJz4qUrYikEsMCak+11
oMw7yIOKVMvfBkGUFojKBmyFSLZ23HWhOSCC0WheKALvSu3Ifj392oFFrFpuTain
TmW/yZx8RTYgvAqBhH1xfpVEmdCM5KiSlwIjTzjY6t3jrbfHt/4i+Y5uCXPY3Wb/
GEL0LKBiEn01lfCQOFiPrOZ7K+h8pZCQO+dtP0KU5NWF468RutxOpDN80Ldxaabs
iyNC0TDRJGj4UudyAGJnZ6pwBzLJhU+w24tfQq1A/zJZuhh8SbTDWzLZXPeM5FnE
EKjkL8CGyAnLmjlQ/xUPnrz2LHEVsvma8r7Nva/sobwF4Ne2h2yB9Cv7JfDVD7zY
/B7fEyIACFE=
=0cG/
-----END PGP SIGNATURE-----
--=-=-=--
