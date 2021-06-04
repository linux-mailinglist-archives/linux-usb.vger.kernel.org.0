Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6AEB39B1E6
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 07:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFDFXF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 01:23:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:38334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229826AbhFDFXE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 01:23:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 554FF613D2;
        Fri,  4 Jun 2021 05:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622784079;
        bh=12fi7DQynrTvCazz/NECZ1ivpizOZu+uNHoDQ/10QOs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EGM2cMG1dEKmun1UUVAl9JrUwytJ4i2r/+ks5pyO1DyfV5EOBTf4a5RQlOYTdSeIh
         JkWy9oon6MzXLaRo9FBv8nxJ6o8NFmPXu5bCpdL3lntIj33tENTbwNnT0LCumsuiT4
         /udPqxpjcpoIXJ6Dprpj426TbdNZcsBxjWf12vs3zNs3dmOmx4rIqdKTHyez3ksUO+
         7vUnxl5sTv3SOz7fXQ2E/XZEnjaa7ep/VIYkfFTvlvTNsMXZM9FlIK8PHKYOuWXKCd
         MopRQLQMEZpZYaZcrWVmHSK1Rn5ODuz45cqWTKAgt+PIoHfeKvaF0fLwcBRE3tZsGP
         R1yxEi/lZWfvw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/4] USB: UDC: Implement udc_async_callbacks in dummy-hcd
In-Reply-To: <20210520202152.GD1216852@rowland.harvard.edu>
References: <20210520202152.GD1216852@rowland.harvard.edu>
Date:   Fri, 04 Jun 2021 08:21:11 +0300
Message-ID: <87v96ub3y0.fsf@kernel.org>
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

Alan Stern <stern@rowland.harvard.edu> writes:
> @@ -990,7 +1000,6 @@ static int dummy_udc_start(struct usb_ga
>  	spin_lock_irq(&dum->lock);
>  	dum->devstatus =3D 0;
>  	dum->driver =3D driver;
> -	dum->ints_enabled =3D 1;

should the matching write of 0 be removed from dummy_udc_stop()?

Other than that:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC5uEcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUj5yggApGSHOhCAoqSJBsTz9RYOa/nuOv0XJCCS
RwCeHig9BFyBapSq7DvH/07OLZuoscQ7EPWaeaAEatPVYpIgfQZlaUTEv0H/3ED0
nw2GLRjcgMDVaAE58yrdgSWonpaJyaF0VG8O7rtMMm8Y1lQAk9duEmKprYPTxpzX
X58UCbgRfBiyORZgRXlHWFcSdNqGpGML9CUsfz7fAbpzdQqlAgraHW+1iFm1bT4C
jHf2zzxzZLLd33D3Arx87tTlHuMsr/ZMdW6GNtWQK5Vx9I2GZ7wTyVEoP+5EaPFJ
pXH+4KFm5CNj4UHNRvJE5BnEYQh3gxDvgnfL6AhkqCWtqXBJpQjVmQ==
=pO6n
-----END PGP SIGNATURE-----
--=-=-=--
