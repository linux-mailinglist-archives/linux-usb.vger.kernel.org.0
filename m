Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9798279F3
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 12:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfEWKBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 06:01:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37511 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfEWKBb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 06:01:31 -0400
Received: by mail-wr1-f66.google.com with SMTP id e15so5579764wrs.4;
        Thu, 23 May 2019 03:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MkPGWKpLS8mLJgmPTzIkHrmG0zpQMb52+ri3uulpdng=;
        b=G/TDcKCpO6KuIhu+qMj5ormZVzx87o2if5YGJha9g3712N7U8VDPt+kaL/emCi3c8D
         VNUlyPeqJR2hIsE5+/PYuLXtDNKb8nSlfF0LpU7r7HCNq0tUNjqH1BHMBVEk6saEjf5K
         ywydB/X4+A2+1g66IZ4MlWwllIPsA4mU8ts1ltB+brwHrynxsGUYkjuvyqi0DMPGVGWA
         I23pVGtdSPbEGl4b5V1L1Fl55yM0i/PWcKDTBC4p1y7OBuveTecYZJ1ZbXMROXuC+pO2
         /GuK0GC8xSRzp5qLtUO1Ca6sxAGYm0dd1nPTN53la5peRulUmzhpuWrSejE3ktynmnvw
         vD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MkPGWKpLS8mLJgmPTzIkHrmG0zpQMb52+ri3uulpdng=;
        b=DcnYiyLVcRX+9PHYGoYXWrfzcTyccM/eJOlbK/Yu5r2XCzcgqLMg0k/ZF5oa4rOqYg
         fPRqmWAHCZcgmp59pyTegNLZ1aY96CVDbX4X3JwXJhJ9kQRXA9dBV3PkZ9mxQuyYJIxU
         Oee55b9amlMdNR+bYULAD6tg+AUQC027dhMpkJnr+ZLkJfEHG+VWnkvLjasEHpKqV4xY
         ePo9Iatg/+l/K5BWcfLgj3KCf6QVleAB3qslocDh0idVYkwlsxH4TFF5xfiQTrivc9Cx
         Ais9oS1+kKdXcx2vydMQCV75c2rhepfeQXaemnXzX92UIz2+p0Amw7hoAP/7dnNAQqkM
         vBJA==
X-Gm-Message-State: APjAAAVHt4woVcolvDmY8YlL6Npv/NXXIK3kiSacpJtdpXs0WeYuPPwR
        ELwHjPfj09x0sQ6+8++59CcxpEgyz18=
X-Google-Smtp-Source: APXvYqyTL1fTxdsyieXJMZmOT5NJ92JhtroT6mR7wHZ+BnDElDqfwu1zJvmA8EY/CmxUwWhwIysPUg==
X-Received: by 2002:adf:eb02:: with SMTP id s2mr52927563wrn.29.1558605687593;
        Thu, 23 May 2019 03:01:27 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id b136sm9791923wmg.1.2019.05.23.03.01.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:01:26 -0700 (PDT)
Date:   Thu, 23 May 2019 12:01:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch V3 2/8] phy: tegra: xusb: t210: add usb3 port fake support
Message-ID: <20190523100120.GB30331@ulmo>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Content-Disposition: inline
In-Reply-To: <1557988772-15406-3-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 12:09:26PM +0530, Nagarjuna Kristam wrote:
> On Tegra210, usb2 only otg/peripheral ports dont work in device mode.
> They need an assosciated usb3 port to work in device mode. Identify
> an unused usb3 port and assign it as a fake USB3 port to USB2 only
> port whose mode is otg/peripheral.
>=20
> Based on work by BH Hsieh <bhsieh@nvidia.com>.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 56 +++++++++++++++++++++++++++++++
>  drivers/phy/tegra/xusb.c          | 69 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.h          |  2 ++
>  3 files changed, 127 insertions(+)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index 4beebcc..829aca5 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -58,6 +58,7 @@
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_SHIFT(x) ((x) * 5)
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(x) (0x7 << ((x) * 5))
>  #define XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(x, v) (((v) & 0x7) << ((x) * 5=
))
> +#define XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED 0x7
> =20
>  #define XUSB_PADCTL_ELPG_PROGRAM1 0x024
>  #define XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN (1 << 31)
> @@ -952,6 +953,34 @@ static int tegra210_usb2_phy_power_on(struct phy *ph=
y)
> =20
>  	priv =3D to_tegra210_xusb_padctl(padctl);
> =20
> +	if (port->usb3_port_fake !=3D -1) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
> +					port->usb3_port_fake);
> +		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(
> +					port->usb3_port_fake, index);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +	}
> +
>  	value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
>  	value &=3D ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
>  		    XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_SHIFT) |
> @@ -1086,6 +1115,32 @@ static int tegra210_usb2_phy_power_off(struct phy =
*phy)
> =20
>  	mutex_lock(&padctl->lock);
> =20
> +	if (port->usb3_port_fake !=3D -1) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(100, 200);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		usleep_range(250, 350);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +		value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(
> +					port->usb3_port_fake);
> +		padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(port->usb3_port_fake,
> +					XUSB_PADCTL_SS_PORT_MAP_PORT_DISABLED);
> +		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +	}
> +
>  	if (WARN_ON(pad->enable =3D=3D 0))
>  		goto out;
> =20
> @@ -2051,6 +2106,7 @@ const struct tegra_xusb_padctl_soc tegra210_xusb_pa=
dctl_soc =3D {
>  		},
>  	},
>  	.ops =3D &tegra210_xusb_padctl_ops,
> +	.need_fake_usb3_port =3D true,
>  };
>  EXPORT_SYMBOL_GPL(tegra210_xusb_padctl_soc);
> =20
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 0417213..6618db7 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -808,9 +808,66 @@ static void __tegra_xusb_remove_ports(struct tegra_x=
usb_padctl *padctl)
>  	}
>  }
> =20
> +static int tegra_xusb_find_unused_usb3_port(struct tegra_xusb_padctl *pa=
dctl)
> +{
> +	struct device_node *np;
> +	unsigned int i;
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		np =3D tegra_xusb_find_port_node(padctl, "usb3", i);
> +		if (!np || !of_device_is_available(np))
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static bool tegra_xusb_usb3_port_has_companion(struct tegra_xusb_padctl =
*padctl,
> +							     unsigned int index)
> +{
> +	unsigned int i;
> +	struct tegra_xusb_usb3_port *usb3;
> +
> +	for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
> +		usb3 =3D tegra_xusb_find_usb3_port(padctl, i);
> +		if (usb3 && usb3->port =3D=3D index)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static int tegra_xusb_update_usb3_fake_port(struct tegra_xusb_usb2_port =
*usb2)
> +{
> +	int fake;
> +
> +	/* Disable usb3_port_fake usage by default and assign if needed */
> +	usb2->usb3_port_fake =3D -1;
> +
> +	if ((usb2->mode =3D=3D USB_DR_MODE_OTG ||
> +	     usb2->mode =3D=3D USB_DR_MODE_PERIPHERAL) &&
> +		!tegra_xusb_usb3_port_has_companion(usb2->base.padctl,
> +						    usb2->base.index)) {

This port is still a bit confusing to me. It's not entirely obvious
what's going on here. What I think this is doing is this: for OTG or
peripheral USB 2.0 ports that are not companion ports themselves (i.e.
only standalone OTG/peripheral USB 2.0 ports) find an unused USB 3.0
port that can be used as fake for the hardware workaround.

Correct me if I'm wrong.

I find the tegra_xusb_usb3_port_has_companion() confusing in that case
because you seem to be testing a USB 3.0 port (_usb3_ in the function
name) for a USB 2.0 index (passed as second parameter). So what you're
basically trying to do is find a USB 3.0 port for which the USB 2.0 port
identified by the given index is a companion. It seems to me like that
would be a lot easier to understand if you did this:

	!tegra_xusb_usb2_port_is_companion(usb2)

with:

	static bool tegra_xusb_port_is_companion(struct tegra_xusb_usb2_port *port)
	{
		struct tegra_xusb_padctl *padctl =3D port->base.padctl;
		struct tegra_xusb_usb3_port *usb3;
		unsigned int i;

		for (i =3D 0; i < padctl->soc->ports.usb3.count; i++) {
			usb3 =3D tegra_xusb_find_usb3_port(padctl, i);
			if (usb3 && usb3->port =3D=3D port->base.index)
				return true;
		}

		return false;
	}

> +
> +		fake =3D tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
> +
> +		if (fake < 0) {

This is one of the few exceptions where the blank line is not useful. It
makes sense here to keep the above two lines close together because you
assign the value and then check it. So the blank line rule doesn't apply
to this general pattern:

	value =3D foobar(...);
	if (value < 0) {
		...
	}

That is, if the value that you check is the same that you just assigned,
you should avoid the blank line as separator because the two lines are
closely related.

> +			dev_err(&usb2->base.dev, "no unused USB3 ports available\n");
> +			return -ENODEV;
> +		}
> +
> +		dev_dbg(&usb2->base.dev, "Found unused usb3 port: %d\n",
> +					 fake);

Nit: the above fits on a single line.

Otherwise looks good.

Thierry

> +		usb2->usb3_port_fake =3D fake;
> +		tegra_xusb_find_unused_usb3_port(usb2->base.padctl);
> +	}
> +
> +	return 0;
> +}
> +
>  static int tegra_xusb_setup_ports(struct tegra_xusb_padctl *padctl)
>  {
>  	struct tegra_xusb_port *port;
> +	struct tegra_xusb_usb2_port *usb2;
>  	unsigned int i;
>  	int err =3D 0;
> =20
> @@ -840,6 +897,18 @@ static int tegra_xusb_setup_ports(struct tegra_xusb_=
padctl *padctl)
>  			goto remove_ports;
>  	}
> =20
> +	if (padctl->soc->need_fake_usb3_port) {
> +		for (i =3D 0; i < padctl->soc->ports.usb2.count; i++) {
> +			usb2 =3D tegra_xusb_find_usb2_port(padctl, i);
> +			if (!usb2)
> +				continue;
> +
> +			err =3D tegra_xusb_update_usb3_fake_port(usb2);
> +			if (err < 0)
> +				goto remove_ports;
> +		}
> +	}
> +
>  	list_for_each_entry(port, &padctl->ports, list) {
>  		err =3D port->ops->enable(port);
>  		if (err < 0)
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index e0028b9f..26dd6d2 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -299,6 +299,7 @@ struct tegra_xusb_usb2_port {
>  	struct regulator *supply;
>  	enum usb_dr_mode mode;
>  	bool internal;
> +	int usb3_port_fake;
>  };
> =20
>  static inline struct tegra_xusb_usb2_port *
> @@ -397,6 +398,7 @@ struct tegra_xusb_padctl_soc {
> =20
>  	const char * const *supply_names;
>  	unsigned int num_supplies;
> +	bool need_fake_usb3_port;
>  };
> =20
>  struct tegra_xusb_padctl {
> --=20
> 2.7.4
>=20

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzmbzUACgkQ3SOs138+
s6FQqg/+Pb+7ftImb82JH+x2htjQtdaEIUv/+3XoxBeuiFY7WWD+RD1FK3Zcn839
Rc75RxjcTsJyWOxMLLYdb1Jao8U/NlV+4KKBovJj/VCCmHgHk2RlzsQD4DHgP9oX
hBfTonyb62c39nk/PuPq6oKEmOEnLBtz6SnZL2ByznVEic1pGS67JTtsGz6rDFXM
X8C3c7ZwB9k+LVb9PfDoH4Q7sck3Xx7nso06o/Baj63HoyG0fLZrnQstpdTqgVrQ
STr6u7wZuu2UfHBVeRDrXbLFQPkt9JgeEM0lI4DJCTU7znm4w/qrYi2q1IjgaZrW
NChPBkQTEeIEC4uDKpwySLa1yiZB680xE3iN7H0rtGKOq6733O44+bK6Eeox03fv
QM7Rra6a9K/YDVfkTEX5oEp5WLVDgs3WrZLWuz7uhEwyMKkdmk5qbOB9Lhl3UKdp
sDT6eE+Jx9TlLSiwv4jslJGYrliB4w2tWm+56ayB/KVd5EKUyHxDmZlTuHXQvYTi
BMxmUX/JLFhI1WZtx+FLg1J4jvNoE6N8a3HBfsq6P0ag8e9QaBC1hop7Bn88AcpK
yl3lA7Xs4jteevZF+cVp+yuxrwQBl/RXdGTywWa90iry+waFYRh7IWJ5V3nxUCKE
eL/aoUrhgkXK8MklpYxkCoTSEzl9+9ZNHARRu8RVVLDXrNpaImk=
=Vwak
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
