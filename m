Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71AA057F71
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 11:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfF0Jje (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 05:39:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39606 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfF0Jje (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 05:39:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id x4so1737064wrt.6;
        Thu, 27 Jun 2019 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j62NP1auNev20NUFqYYN+Pl5cjsOPsB+5vzf7WXC8sA=;
        b=kJJqWpvZgfZQRljKCe/M12c3AdjsdYXW+AvVwauTsjup3E+/o4fraQWAVhz+XGncAa
         cTtjOljQn5+Ojeo19AI+5qunL/k1RhqU2eW2aU+OSqNHFlkGKnxF+lpDGFrfjr+X+cZL
         5KRk0RyKlc/P8v2MOmmnq5LpBYO2W7ukUyOrTksycc+7gPwbfrexx8SKJGlqA4joMeZe
         uBKswhxXzmVvjEk62hiJTO1jBaPXJB97r5+4Hn3pEFtUZHGcuyVo7mIG7K82I9tDPhzo
         mnrWtzX6SMm3vi4D4XfOyq6DF4miRZozrcmHO/eURGQt5qDXmMHP7eHYG/nfDFYFMGW8
         H6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j62NP1auNev20NUFqYYN+Pl5cjsOPsB+5vzf7WXC8sA=;
        b=o05d1efs6Hw6A8dFQ4jkDSkJtE/SgkDhKa0QUFbtNGyJaF+6vVzurGKyFZVkU8G/Dx
         vODUf203XNM+pqVNHBqLckXm1eNwawOvUb1LeKKwCAKv+CRyK1fz8ydjZUULviFngImw
         h/MPnltg0ndrzAXmsy5Sr4OimO0czKqy2kpE/9PwgavzHTS2h+dPSaMtjfF3HZdqhU2h
         TOFZ1JWu+4tkaT4eMXIMYhICyqzUXykaXu2RhRbz1hkGAuuSp2Eix9j2zLDSfUosqZ6Q
         wQhiwxVK+T5yD5QeElAKIH8/CGcoMf0ZlhwuVY45kc200+EVAt1TmJlcKjC92++MzSlQ
         ausw==
X-Gm-Message-State: APjAAAVxkHN0o6LCX0wde9+VheJFNGXApHEmtD/4PWJilY5AKjFbPpcy
        +/6/jnKQqn+IQPuHNq1cED0=
X-Google-Smtp-Source: APXvYqyXpsIratlqPJQMpyrPxcr+87PZwFJDx8WrmW887v8Ce03niFjhC9IxZrLH3o+vItJktVkfcg==
X-Received: by 2002:adf:e442:: with SMTP id t2mr2496780wrm.286.1561628371091;
        Thu, 27 Jun 2019 02:39:31 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id c1sm2846665wrh.1.2019.06.27.02.39.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 27 Jun 2019 02:39:30 -0700 (PDT)
Date:   Thu, 27 Jun 2019 11:39:29 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V4 1/8] phy: tegra: xusb: t210: add XUSB dual mode support
Message-ID: <20190627093929.GB21242@ulmo>
References: <1560161949-26031-1-git-send-email-nkristam@nvidia.com>
 <1560161949-26031-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
In-Reply-To: <1560161949-26031-2-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2019 at 03:49:02PM +0530, Nagarjuna Kristam wrote:
> Configure the port capabilities based on usb_dr_mode settings.
>=20
> Based on work by JC Kuo <jckuo@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Reviewed-by: JC Kuo <jckuo@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)

Tiny nit-pick on patches 1-3 in case you're going to resend: You may
want to make the subject consistent with existing changes to this
driver. We don't usually use a SoC generation prefix in the commit
subject, so this looks somewhat out of place. I think it'd be more
consistent to do something like:

	phy: tegra: xusb: Add XUSB dual mode support on Tegra210

Note also that the subject should start with a capital letter after the
prefix. Also, please try to avoid abbreviating TegraXYZ to {t,T}XYZ
because it helps when doing some archaeology on the repository. That is,
it is easier to just:

	$ git grep -i tegraXYZ"

than both of:

	$ git grep -i tegraXYZ
	...
	$ git grep -i tXYZ

Anyway, probably not worth resending just for this, but perhaps keep
these guidelines in mind for future submissions.

Thanks for the good work on these patches!

Thierry

> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 05bee32..4beebcc 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2014-2019, NVIDIA CORPORATION.  All rights reserved.
>   * Copyright (C) 2015 Google, Inc.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
> @@ -47,7 +47,10 @@
>  #define XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_XUSB 0x1
> =20
>  #define XUSB_PADCTL_USB2_PORT_CAP 0x008
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(x) (0x0 << ((x) * 4=
))
>  #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(x) (0x1 << ((x) * 4))
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(x) (0x2 << ((x) * 4))
> +#define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(x) (0x3 << ((x) * 4))
>  #define XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(x) (0x3 << ((x) * 4))
> =20
>  #define XUSB_PADCTL_SS_PORT_MAP 0x014
> @@ -72,6 +75,7 @@
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x4=
0)
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
> =20
>  #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
> @@ -965,7 +969,14 @@ static int tegra210_usb2_phy_power_on(struct phy *ph=
y)
> =20
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_PORT_CAP);
>  	value &=3D ~XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_MASK(index);
> -	value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
> +	if (port->mode =3D=3D USB_DR_MODE_UNKNOWN)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DISABLED(index);
> +	else if (port->mode =3D=3D USB_DR_MODE_PERIPHERAL)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_DEVICE(index);
> +	else if (port->mode =3D=3D USB_DR_MODE_HOST)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_HOST(index);
> +	else if (port->mode =3D=3D USB_DR_MODE_OTG)
> +		value |=3D XUSB_PADCTL_USB2_PORT_CAP_PORTX_CAP_OTG(index);
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PORT_CAP);
> =20
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
> @@ -997,7 +1008,12 @@ static int tegra210_usb2_phy_power_on(struct phy *p=
hy)
>  			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
>  	value &=3D ~(XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK <<
>  		   XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT);
> -	value |=3D XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +	if (port->mode =3D=3D USB_DR_MODE_HOST)
> +		value |=3D XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
> +	else
> +		value |=3D
> +		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL <<
> +		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT;
>  	padctl_writel(padctl, value,
>  		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
> =20
> --=20
> 2.7.4
>=20

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Ujs4ACgkQ3SOs138+
s6FOjg//SXjncb16FqCnLR6GP4YSc1dPiZJmmbDG6XVNr+vsAJJyylcX7PfqSDYy
/Rmpe0ysVR1Et+t/e38GG2/GJdsH9TnIJ/mgPzIl8pH+4JTKukRXNwdAbw7EomT8
iGQRn2OddLE0zhE2wiWNqaH+HxZ02ysdogUt0wSXnoQf/pYyjBDYYMivTeq6CAKh
1Qy5PxXK81YG2PJdpEcUduAlYieDGeLaz0nq91qAkYctFMMHeeyPfEqZA6PgH0NA
1ZpVJL17R8aZTKtYAfp8YsxkY4opy3PD9fM2O2SXxFPYTVBwFwtK63a/BRWPG6OE
BtVnYMNBZRLIkQgZVJ40uWKtYZr0M33pqDMcRzvluTkJg7NbcKrP8U/eKCZG4OIj
s+tAzOuYixzx3s9DgZ8/LwzJalG0wCUv91/mOZ/l3//rFfgbu/R6CBvuSdriYqzW
ESrxP9tPtq0IlHmm9OkQDOHPS2LlIUqc+znL+na6KEh9gDbbK+FF4f1bqpX0ZtRr
2gAbSlBWvFu9V9rCslOhbrc+Iyt/MU7NOjtVa8w/A/YJe91EI2+H6iURhYyJ8lrG
ZUKucL8IQWXarCNDtlrNONIyC5bF3FIAG1btql9fqzuVX/ZacIYydMJYg8ksJkHZ
FL2HCX7RE+GzTuWvYtGgBSY6OR6uJzBwMbRDbP3FeLKv0iS9OKk=
=2p8d
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--
