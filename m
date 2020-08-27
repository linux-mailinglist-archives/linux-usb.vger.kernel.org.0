Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD6C2547D7
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 16:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgH0NK2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 09:10:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbgH0NJo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 09:09:44 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9FDB206F0;
        Thu, 27 Aug 2020 13:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598533783;
        bh=Hw8S0iXk3F0NNo4Sgldg/CqyuQTpDMwlBwO0sSRglkQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=sWGwxeIDAW2m6HoGZzH8H0FGJg0qj041qDtDRw2mW2/EkgXmuhYJyNPM7iEV398uJ
         /7sPtbog9eFFnSqGf/SNGFNtC7xmvvhImn4eahEtUMK8VWTe7jl+xkFF/2Oo0MfNC9
         2fislIHQwZetjnV6Wva3ZbpQpx4Gx/jINcH9PRgc=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v7 1/3] usb: cdns3: introduce set_phy_power_on{off} APIs
In-Reply-To: <20200825021120.4926-2-peter.chen@nxp.com>
References: <20200825021120.4926-1-peter.chen@nxp.com>
 <20200825021120.4926-2-peter.chen@nxp.com>
Date:   Thu, 27 Aug 2020 16:09:36 +0300
Message-ID: <87k0xki6b3.fsf@kernel.org>
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

> Since we have both USB2 and USB3 PHYs for cdns3 controller, it is
> better we have unity APIs to handle both USB2 and USB3's power, it
> could simplify code for error handling and further power management
> implementation.
>
> Reviewed-by: Pawel Laszczak <pawell@cadence.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/cdns3/core.c | 43 ++++++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 5c1586ec7824..e56dbb6a898c 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -371,6 +371,27 @@ static int cdns3_role_set(struct usb_role_switch *sw=
, enum usb_role role)
>  	return ret;
>  }
>=20=20
> +static int set_phy_power_on(struct cdns3 *cdns)

care to keep the cdns3_ prefix? It's useful when you want to use
e.g. ftrace and function_graph trace

> +{
> +	int ret;
> +
> +	ret =3D phy_power_on(cdns->usb2_phy);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D phy_power_on(cdns->usb3_phy);

let's say we fail here

> +	if (ret)
> +		phy_power_off(cdns->usb2_phy);

usb2_phy will be powered off..

> +	return ret;
> +}
> +
> +static void set_phy_power_off(struct cdns3 *cdns)
> +{
> +	phy_power_off(cdns->usb3_phy);
> +	phy_power_off(cdns->usb2_phy);

Won't this cause a problem?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9HsJARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQbW8A/+KtXQnsWiepv4CGMXfqqDO9DVzIS9Wus1
4eUYIwcvsh75EG3sy+438EP2R8dXevnPRoh8etxsRjH8KB3iHSkA09Uqn1zSYwxF
BZpn9QOacRdHLL9E8gsLfr8vfrnB7TFhYQ2mm82J5MO8CRBSwkGCKbBMyNuKrKvZ
/IG5O69JJdvvp+cgd1OQQdFKp5CqbjW9FXFAWbCnBSDjK+ag11fDFCsOIj8iJ+Fp
ynC1gJDfa47jIAuoDNYDlUV8xkdzCLLRaTXnpvgws9NC1B8E3HcrjGsxj2w17IAa
BGBokXGee9m3iK2tPKSZOKDgS6/LeaJIW4Ov9gVWnucLtpk/WiaCfxB4uQglO0V0
T9vCiK/Y/EBWtimabWiJqqzQz7x7xoPUJaWJcWbGRyiKb7rDG/Ht0v+X0gFAUl+E
801mMlQC7fnNSVktcf8chkhoJq47GqGcCxMDUpnJva+vebuUHCuyPIi/P7X+nL8K
NXgYFMSSocTUs+sE/sWivM3+zT9plJwnuCsl+Bqb7dd6gbMHNY77bIC5x+UlI/13
s6D+ZC9tGrJZ74J1kFJuqBb6WkFJOEVbZdiHnmd11RQzfZebdL3Fkz01cSpwgREm
WFESj4hTz/ePl4tHtu4kQWJ2Cf6egELoKAwkMCXbnCvEX3O3qzyFVF686LXtW5aZ
6io4C6ugM6g=
=xROt
-----END PGP SIGNATURE-----
--=-=-=--
