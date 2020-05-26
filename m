Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F65A1BBAEF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 12:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgD1KQ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 06:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726932AbgD1KQZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 06:16:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1123C03C1A9;
        Tue, 28 Apr 2020 03:16:25 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 188so2104179wmc.2;
        Tue, 28 Apr 2020 03:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jI61D3pK7tEsFPtL9D7ArZ+npdMtqavH0JfI0NA07Jo=;
        b=MPwBGs0OEZKm4gYNgRP3IzLx0uC5OrervGY7XcsNEpqPvTmS/g5Q6qRXC3hwoQlBYJ
         q0R818w3E9WzkxzuF8JQWyikSa52GHIj2rs7Y7RhFF2dxcdsnQy3/VQdB+v8l6ZVj+5X
         fb6G8WwaEEVF7JnISyUCY97pAv9JxcdMXUWPk15zd+2rRDNiOIzLBUjZLUoJNpgqPcjr
         e9i9cXrhr4OfGg9uqv7qsecdudmGm5gPd6qMxZeN/7y9DDT35ekGqwb9622JwJRza5M3
         km9YlkOloAw4Wfekn3RSsBJ1RYMSwSH1YxK2r2BtrxOGmdq8mucn8rHe57GvhqD6MeTN
         eC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jI61D3pK7tEsFPtL9D7ArZ+npdMtqavH0JfI0NA07Jo=;
        b=mWj1zZWzZ6FsROc10/o2FrOT3k6ErI+HSFIFLNlDRNg9KoWog5cl6pB/BRum+bI3hY
         ODln+L878sY7+UmHMCkrfoBBHxiC0D8zdRV7uI2tmwX7oTto19QzhU3o0laGfFjvfvsn
         4/RRN/8qH6/F6PBSxAJuX76M5eF4/76qQ1D/BfU1Vy1xNRTXK3A6hxSYgMygT9oA6Cz/
         LoeOm1mYHQaiVaf3xrzj3yx2oRZ65sEVeheWbAihLzl4+fcdXGoiPbJ8+viOFqZhxRTx
         z5dvaZ75bB7hBzgxWPHamnPJ3AsRCiTc7nc+I/2lZhXozZDFMUeEIlISZOTTthYne2B/
         eWVg==
X-Gm-Message-State: AGi0PuYaQTimwwBJ7MSoyShPwlVv3hRRsRqKx8KAYhY/wcv+rXSYs+tL
        RdzvHsdCOZuqtJwGeFl4Lls=
X-Google-Smtp-Source: APiQypLAI4evIskSACj57EzCt/lb1i+XZI1FIreSjW655/rP2GS+eFguQ5+pEn2nxt/XVkjjSdLSCg==
X-Received: by 2002:a1c:bc08:: with SMTP id m8mr3678180wmf.119.1588068984495;
        Tue, 28 Apr 2020 03:16:24 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id h3sm24482973wrm.73.2020.04.28.03.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 03:16:22 -0700 (PDT)
Date:   Tue, 28 Apr 2020 12:16:21 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/8] phy: tegra: xusb: Add support for UTMI pad power
 control
Message-ID: <20200428101621.GF3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-4-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Content-Disposition: inline
In-Reply-To: <1586939108-10075-4-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:03PM +0530, Nagarjuna Kristam wrote:
> Add support for UTMI pad power on and off API's via soc ops. These API
> can be used by operations like charger detect to power on and off UTMI
> pad if needed. Update powered_on flag in the pad power control API's.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 51 ++++++++++++++++++---------------=
------
>  drivers/phy/tegra/xusb.h          |  2 ++
>  2 files changed, 26 insertions(+), 27 deletions(-)

Nevermind my prior comments, for some reason I thought this was adding a
custom API for driver interoperability, but I see now that this is just
a means of splitting out SoC-specific code, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oAnUACgkQ3SOs138+
s6GllhAAqj0KLe0kZLc4UCJ+esPO9vr0YEg1APWbfONIUbkNfgOkAwK2Zzwb2PAG
ieVffoOuvphSiOMWhuweuFea8TwaSdenBPQJjrB/kKLCWIBdOAuFPMiwtZA/eXGQ
YNg1MllVAQuUiniCXWGxCD785DgGeozdONGvDM5YuhZlvizQ4X2hGve/Hp9i9Jk3
9LR5ZI2uHAent7wzGpFTAAvI487Vik+fnacrtMddvU4u0qhdVrdGEIWUa8yRsJT+
MUVbOicbJD5Uw5EOZie+VuW+3FG6XJTPjc7efdm+z2CQWTEDSDWCd2HOyPqmUlHg
U4lN2TPVCTiEEzGmBRCqPmyzsKhWgfxrHAbkpIL88C+/grqUW9rpLv+TxbFY/2zj
3meHPMkePB+yKGZtqAkyYemx8QGWUs0vaqw8ptlBiNd+H5hVPINvnsg1cQJdb4P3
lqxr+BCpBHbA/1+QekcW2QnUcKbEyGwDq2e0rkWYusZPfbYwsEvoHBkN1SgirSjM
q/RtxiWUm03inP8IQWFIhbULJSS5n848MpBNryBu7IhVASEeICEJ9R3OLY4zc1Bv
l3P1UqrxAEfn+H7YnMN6xWP0T5TJB02Bj6GWPBTngXEgM/Oo2sgcvu29864ZipKt
xeRrSOjA9n/cEdeyXrh3etD3DZ2AgvFRa93w9TNPu535nAEv/88=
=h33Z
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
