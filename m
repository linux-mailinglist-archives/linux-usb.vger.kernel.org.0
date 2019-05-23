Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 104C0279FB
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 12:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730311AbfEWKDj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 06:03:39 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54935 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfEWKDj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 06:03:39 -0400
Received: by mail-wm1-f65.google.com with SMTP id i3so5137728wml.4;
        Thu, 23 May 2019 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xm9uwBB1vzuK1qGJ0WzNpoRC9jOdI8HxonN1ZU8SrNE=;
        b=tMIsS6Bqb2UGGIVuNBNyLDNoEZHDul2zOiTcM5xZSlChwNqeKNhrAraFBh5BfhnGIA
         EroW8bo8VurF2jjH6fpdE8KHddKgpqCV8Vzl5RIF2GRT3e3CJfYY5A3NHvdVAOfYEei/
         7OgeE5IWn/eSZdO0tF0PhoiWIh7qWEzmHykcKlXG/f4NqBNylMUxHtHBfQ+mmJCXpL6C
         996GZlqWcO8lZxlVNtIrCftcoHkop/VQXs6T/k0/kqEeznFAchaKM7qQXWWfcj+S4f3R
         UMBIUgLxRvZ9EBgHCW8wA8qmv1SiFuvqBJT+IOuuw4i4O5SUm5NnM1zIU9i7VhJLsh/5
         TvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xm9uwBB1vzuK1qGJ0WzNpoRC9jOdI8HxonN1ZU8SrNE=;
        b=knp0ADS3OYsVkR/al2inp50ahmhrNOoBVzkq3nJMK0zD3H3D9sQuG8Rtq/xCpzeqR3
         dLeM4JSvJDYngOwWW2ainiy2EO00jDcrwO9+r7ntM3Zlfu+Tk3TEOoXmNKMQl/h+3g+Y
         lvqV10BIW6ZSNOJgSZSHBVlJ1GLocaaSxuFFlmvGjTSF8DS4lR+M6/yGUobGOxLku06Z
         oLKzE4NBs+cFpSmPfKituJmikRbcn84ygj27xBHJ0TxvGXQwaDiYOgYy5wUp8cKgqMR9
         hh2W3T26F8js5L34D/COGUzeRFKK2ZfG8cNDbc0a5kVdQo9Ur4zpwXrmTX27EtzlotVs
         lfmA==
X-Gm-Message-State: APjAAAWJg9+dWLCYd81oE5HbUD780q1wWFVp+64P1Fcd9mmEzktw5JGs
        pCstC+x4ARKdmuSJkDHrJhbO+HlwA50=
X-Google-Smtp-Source: APXvYqzeijpqGVSTynGVCh2Q4RVjsOrwIl3M+dZKKo+teialfKTfjsqbqa5V3H9oUIAso+cwnlTw6w==
X-Received: by 2002:a1c:98d0:: with SMTP id a199mr10934041wme.140.1558605815908;
        Thu, 23 May 2019 03:03:35 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l18sm2059977wrh.54.2019.05.23.03.03.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:03:35 -0700 (PDT)
Date:   Thu, 23 May 2019 12:03:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V3 3/8] phy: tegra: xusb: t210: add vbus override support
Message-ID: <20190523100333.GC30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-4-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:27PM +0530, Nagarjuna Kristam wrote:
> Tegra XUSB device control driver needs to control vbus override
> during its operations, add API for the support.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 59 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.c          | 22 +++++++++++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  include/linux/phy/tegra/xusb.h    |  6 ++--
>  4 files changed, 87 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 829aca5..363d2aa 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -73,6 +73,10 @@
>  #define XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(x) (1 << (1 + (x)))
>  #define XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(x) (1 << (8 + (x)))
> =20
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(x) (0x080 + (x) * 0x4=
0)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP (1 << 18)
> +#define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN (1 << 22)
> +
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(x) (0x084 + (x) * 0x4=
0)
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_SHIFT 7
>  #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
> @@ -235,6 +239,12 @@
>  #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(x) (0xa74 + (x) * 0x40)
>  #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL 0xfcf01368
> =20
> +#define XUSB_PADCTL_USB2_VBUS_ID 0xc60
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON (1 << 14)
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
> +#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
> +
>  struct tegra210_xusb_fuse_calibration {
>  	u32 hs_curr_level[4];
>  	u32 hs_term_range_adj;
> @@ -2024,6 +2034,53 @@ static const struct tegra_xusb_port_ops tegra210_u=
sb3_port_ops =3D {
>  	.map =3D tegra210_usb3_port_map,
>  };
> =20
> +static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *=
padctl,
> +					      bool status)
> +{
> +	u32 value;
> +
> +	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
> +
> +	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
> +
> +	if (status) {
> +		value |=3D XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
> +		value &=3D ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
> +			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
> +		value |=3D XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
> +			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
> +	} else
> +		value &=3D ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
> +
> +	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
> +
> +	return 0;
> +}
> +
> +static int tegra210_utmi_port_reset(struct phy *phy)
> +{
> +	struct tegra_xusb_padctl *padctl;
> +	struct tegra_xusb_lane *lane;
> +	struct device *dev;
> +	u32 value;
> +
> +	lane =3D phy_get_drvdata(phy);
> +	padctl =3D lane->pad->padctl;
> +	dev =3D padctl->dev;

dev seems unused. Is this debugging leftover?

Thierry

> +
> +	value =3D padctl_readl(padctl,
> +			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL0(0));
> +
> +	if ((value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIP) ||
> +	    (value & XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL0_ZIN)) {
> +		tegra210_xusb_padctl_vbus_override(padctl, false);
> +		tegra210_xusb_padctl_vbus_override(padctl, true);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
>  static int
>  tegra210_xusb_read_fuse_calibration(struct tegra210_xusb_fuse_calibratio=
n *fuse)
>  {
> @@ -2086,6 +2143,8 @@ static const struct tegra_xusb_padctl_ops tegra210_=
xusb_padctl_ops =3D {
>  	.remove =3D tegra210_xusb_padctl_remove,
>  	.usb3_set_lfps_detect =3D tegra210_usb3_set_lfps_detect,
>  	.hsic_set_idle =3D tegra210_hsic_set_idle,
> +	.vbus_override =3D tegra210_xusb_padctl_vbus_override,
> +	.utmi_port_reset =3D tegra210_utmi_port_reset,
>  };
> =20
>  const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc =3D {
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 6618db7..e333532 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1133,6 +1133,28 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct =
tegra_xusb_padctl *padctl,
>  }
>  EXPORT_SYMBOL_GPL(tegra_xusb_padctl_usb3_set_lfps_detect);
> =20
> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
> +							bool val)
> +{
> +	if (padctl->soc->ops->vbus_override)
> +		return padctl->soc->ops->vbus_override(padctl, val);
> +
> +	return -ENOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
> +
> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
> +{
> +	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
> +
> +	if (padctl->soc->ops->utmi_port_reset)
> +		return padctl->soc->ops->utmi_port_reset(phy);
> +
> +	return -ENOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
> +
>  MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 26dd6d2..cb22a70 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -381,6 +381,8 @@ struct tegra_xusb_padctl_ops {
>  			     unsigned int index, bool idle);
>  	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
>  				    unsigned int index, bool enable);
> +	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
> +	int (*utmi_port_reset)(struct phy *phy);
>  };
> =20
>  struct tegra_xusb_padctl_soc {
> diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xus=
b.h
> index 8e1a57a..9b8351c 100644
> --- a/include/linux/phy/tegra/xusb.h
> +++ b/include/linux/phy/tegra/xusb.h
> @@ -1,5 +1,5 @@
>  /*
> - * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
> + * Copyright (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
>   *
>   * This program is free software; you can redistribute it and/or modify =
it
>   * under the terms and conditions of the GNU General Public License,
> @@ -26,5 +26,7 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_p=
adctl *padctl,
>  				    unsigned int port, bool idle);
>  int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *pad=
ctl,
>  					   unsigned int port, bool enable);
> -
> +int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
> +					bool val);
> +int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
>  #endif /* PHY_TEGRA_XUSB_H */
> --=20
> 2.7.4
>=20

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmb/UACgkQ3SOs138+
s6Ga4w/+Ict8L3jWlR56CvoJ/Jelck4XSUs/fdiuNu+/zImFovDh8U7OHoMpmzND
okNVA+BrZ2lgmXz9/NBDvTt+7c4qxEqr4Vik6Q89HRqFn2Qf31VlTyPMQbMXVu+3
nFrIWib2C3ly8usKBGYQR1OprzfKVwS8VPq+LxZ+zJMWQQbARAOlW/g9YzR1duhZ
TPMj9sM0+odgh4zPzoLCTa0MTrU1hkIyKH87teyeUJtuPCBldrs516iezeqUyUhr
0Lzo6IISP9kkURSpnXp3uFHEDd1SS0JTTV+HmfwG0JpSGLzryN0yTFk9YBQmcL1n
hpAJg34rhQlJMyqa2lBk9eg76Ci8eoNGu8ad8NoXiR66ulCpdhfQ+03d7dZjtC4S
NRK6O7VGf0Ajy9zELnj4KHGYEzAttwU+jJ4rmJJxwjX0leZ9bKerqiFCwnlDZQSj
s9PDzjLPJBqPJdvd0pkTjS4024juBkkkf3LTA1tYxoZMRdfGi9FbouPoGXoG/Qlw
ccoWhdfuK3wpGBddw+MnYbg9LDnHmsbo4QQFR1WPS1GL/1tC+PON3LClVCOl/8on
jyEQ4NJPagnpkJis/ocxeZPIHn6x86Gm9LCFBP8E5xCRnvXWCWtkoTSD2HpAYUql
aAzSryw/uyyf9sRJT3H4Vcw4UYj9M4fTujpxuu/Xf8f+uaNLqT0=
=rpvr
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
