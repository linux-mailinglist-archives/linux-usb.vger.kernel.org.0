Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1923E30C61E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 17:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236708AbhBBQjR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 11:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbhBBQhu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 11:37:50 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D03C0613D6
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 08:37:35 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id j12so14679638pfj.12
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 08:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xNw38r2JeVXVVV6FzK5sLHcyUvp5VegbtuFctvA/z6k=;
        b=NRO658hGW0XuiEXQRApb6qNx2RyxhxV99V4vKCUqkzqdt2tX+Eo5gvfNWoxQ/f9JdE
         eoFX+Zj1ubXwV+Kvrqv2u69XdFty1iNV3HUQXQUmSKW7Pnm/Mq9VNcQdCbfNKpbBcUvW
         FEAhD9TOwv/B9LfLk9SJLWcjGI2frAqa/7NdU8AUP6z5vPePHAljKAxcEW2RYmeHEFNc
         NBbIqTtIOppELWtdzZ8Bit9cj40vM1HTEZ8fDU6QIGo5qXCCRC8sIp56LkbKNfbw5GIW
         E+Xk3QEB4+opxPY36Oy/MogJclnJZBmu3bw9k5hErRUzneKirBGP9HX7B2R3bUIarpOB
         xzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xNw38r2JeVXVVV6FzK5sLHcyUvp5VegbtuFctvA/z6k=;
        b=pCXQ/r9dGWdkvcfEks1KAe8SzumaFuHY4Ez61L+vIcHAHukLG9fVeTauYTCLQnc8S8
         QnUi339j12xFI7zMzKPX1QCRlyXwK1LUVLC0YZMYyfDLB9mnBz28MwPI0aDX7Zm7e/ww
         +xteGkNoGsSjsHMEdiKI23D1mx2MZAxBd86lkEBv16ADzSel4Q7sZ4Lj7T2hccyYOlFH
         YyvZmURg83BLPAiLVyylv0alYCYPRI5t2Vxr8TPz3DkZ/gyjGKiMTqhgwO+1cYzuKBQ1
         gSmE6TBXiIGu5JftoW6BRaqO5XjKRKNiNRf0vcYxHYJATe+kjzBgbwfXZVuZcu0ctdPw
         lOhg==
X-Gm-Message-State: AOAM530q7G8yK2F8CuWRn7rn670ZOg8wbVvX/m/UjTg/Uqm1xW7gY4LL
        RBz/bQk7SxC30BH7A/8gctu4Lw==
X-Google-Smtp-Source: ABdhPJzuiIWZdtBkDpxwwtPD8fcXx/qczIvsjbFn66GRggwPb9gK0+w7ivzjHv/o9PJPlzYEaCRP4A==
X-Received: by 2002:aa7:979b:0:b029:1c4:a2ce:94db with SMTP id o27-20020aa7979b0000b02901c4a2ce94dbmr21899905pfp.12.1612283854297;
        Tue, 02 Feb 2021 08:37:34 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id e7sm3412978pjt.21.2021.02.02.08.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 08:37:32 -0800 (PST)
Date:   Tue, 2 Feb 2021 08:37:27 -0800
From:   Benson Leung <bleung@google.com>
To:     gregkh@linuxfoundation.org
Cc:     heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        pmalani@chromium.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, bleung@chromium.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Fix call to
 typec_partner_set_pd_revision
Message-ID: <YBl/xzvxwDuhasw7@google.com>
References: <20210202163248.3981555-1-bleung@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n+T8JPkT3uyw8q6M"
Content-Disposition: inline
In-Reply-To: <20210202163248.3981555-1-bleung@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--n+T8JPkT3uyw8q6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, Feb 02, 2021 at 08:32:48AM -0800, Benson Leung wrote:
> typec_partner_set_pd_revision returns void now.
>=20
> Fixes: cefc011f8daf platform/chrome: cros_ec_typec: Set Partner PD revisi=
on from status
> Signed-off-by: Benson Leung <bleung@chromium.org>

This one needs to be taken too after Kyle's fix earlier this morning.

Thanks,
Benson

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index a7778258d0a0..7b93dfd02999 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -842,11 +842,7 @@ static int cros_typec_handle_sop_disc(struct cros_ty=
pec_data *typec, int port_nu
>  		goto disc_exit;
>  	}
> =20
> -	ret =3D typec_partner_set_pd_revision(port->partner, pd_revision);
> -	if (ret < 0) {
> -		dev_err(typec->dev, "Failed to update partner PD revision, port: %d\n"=
, port_num);
> -		goto disc_exit;
> -	}
> +	typec_partner_set_pd_revision(port->partner, pd_revision);
> =20
>  	memset(sop_disc, 0, EC_PROTO2_MAX_RESPONSE_SIZE);
>  	ret =3D cros_typec_ec_command(typec, 0, EC_CMD_TYPEC_DISCOVERY, &req, s=
izeof(req),
> --=20
> 2.30.0.365.g02bc693789-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--n+T8JPkT3uyw8q6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYBl/xwAKCRBzbaomhzOw
wi4XAQC9Lvy+nlthBeuu5zXnkjFUhboKx3le6qd0K7aXflMatgEA7NOTf7EMMNvM
p1RwAuveO65PefiJ2RFBjAh+od8jlgY=
=OwW7
-----END PGP SIGNATURE-----

--n+T8JPkT3uyw8q6M--
