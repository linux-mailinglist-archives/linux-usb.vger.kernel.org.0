Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD151303B
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 16:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbfECOaM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 10:30:12 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43597 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbfECOaM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 10:30:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id a12so8141389wrq.10;
        Fri, 03 May 2019 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8XS21LIJ2tVsygI+hdUEpfMMFls0VOcpVodpKaggnTU=;
        b=l5oEH1QJTJ6aozOjBZMJQntoEpEc/qwcHA996ynP+hD90MYxIzQh3y+SFc5daB1erM
         lv0Og4ib5cH73WnDDJqnuwulZvDHMWQ8r4AAYu5nxfVeCWQ8tC+Yy6yz8FCz5sUQc5Zj
         p4V9lThzPOAgCKqoQzx1h+5lcr2o+QyYsgMjILNF1qBXSA18Pqt0EGrIR2E1OFVLWtjR
         2p7l+8Sl8Gmx3aMuvaUyKOboJWkDiUDjTsyr/bgHk8ED8NeAg5auPPtvNxSa1+UZtZjq
         fc6Hkl5vk/jyakzmzjCMGyuuQzq2bq7hSHfxkiGrm7rVca2p0+VUw+OfBC3x2U8S/O6h
         j/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8XS21LIJ2tVsygI+hdUEpfMMFls0VOcpVodpKaggnTU=;
        b=GorwNJloH3AtCEJBGLvKC2XuwX+CHN15Gi3F6+ceo+yEX0/CSXyzlXJwppOEQoOB1a
         7QcCRCx3P6DBbeHXdqi/XlvQsD2yBxhUrE3lNlOlG91cyT9aCZY3BG4Vj3I4Nk8khJ8M
         8+g5X7ZZ0VqSYAVybk6Y/Cc+Vil1pvYpHL6uGDv7TH0CcVcrX5V5t7D2Zl0C3GXQw5NS
         gKx/D4zhEsH2xvSpvRdBlZlMcw3qlgxuG2Hu9y2qMZXkQFkiGHyxbkSbakmE0TrWHDNe
         MDlJtuGgrqwkrjGzRnLLz7K7uuoEEQ3kULTUxPCxVtKPhSFGcFL8RwOdvgzFNq7n2pxp
         gtIQ==
X-Gm-Message-State: APjAAAVW4K7sJqOoA3zQ2lzY3dxiv7FX8jlwLaDMwSAnGt+pD0fNEraF
        bi8e9bqfivdVsCAMWk/Bzk0=
X-Google-Smtp-Source: APXvYqxsVsWHe9wJLazxkdymb8836MuDF9GuASQ9g3RxYw7hSCUB2Gumi8kCgC6UKdYhNKZ+PjNH6Q==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr3307072wrj.10.1556893809631;
        Fri, 03 May 2019 07:30:09 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id g185sm2626350wmf.30.2019.05.03.07.30.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 07:30:08 -0700 (PDT)
Date:   Fri, 3 May 2019 16:30:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 4/8] dt-bindings: usb: Add  NVIDIA Tegra XUSB device
 mode controller binding
Message-ID: <20190503143007.GA20469@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-5-git-send-email-nkristam@nvidia.com>
 <20190425151401.GF24213@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20190425151401.GF24213@ulmo>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 05:14:01PM +0200, Thierry Reding wrote:
> On Mon, Mar 11, 2019 at 04:41:52PM +0530, Nagarjuna Kristam wrote:
> > Add device-tree binding documentation for the XUSB device mode controll=
er
> > present on tegra210 SoC. This controller supports USB 3.0 specification
>=20
> Tegra210, please. "... supports the USB 3.0 ...". Also end sentences
> with a fullstop.
>=20
> >=20
> > Based on work by Andrew Bresticker <abrestic@chromium.org>.
> >=20
> > Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> > ---
> >  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 105 +++++++++++++=
++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-=
xudc.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.tx=
t b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> > new file mode 100644
> > index 0000000..990655d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
> > @@ -0,0 +1,105 @@
> > +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
> > +USB 3.0 SuperSpeed protocols.
> > +
> > +Required properties:
> > +--------------------
> > +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
> > +- reg: Must contain the base and length of the XUSB device registers, =
XUSB device
> > +  PCI Config registers and XUSB device controller registers.
> > +- interrupts: Must contain the XUSB device interrupt
> > +- clocks: Must contain an entry for ell clocks used.
>=20
> s/ell/all/
>=20
> > +  See ../clock/clock-bindings.txt for details.
> > +- clock-names: Must include the following entries:
> > +   - xusb_device
> > +   - xusb_ss
> > +   - xusb_ss_src
> > +   - xusb_hs_src
> > +   - xusb_fs_src
>=20
> It'd be good to explain what each of these are.

Perhaps we should also drop the xusb_ prefix here. That's already
implied by this being the XUDC controller bindings.

>=20
> > +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used =
to
> > +  configure the USB pads used by the XUDC controller
> > +- power-domains: A list of PM domain specifiers that reference each po=
wer-domain
> > +  used by the XUSB device mode controller. This list must comprise of =
a specifier
> > +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt=
 and
> > +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
> > +- power-domain-names: A list of names that represent each of the speci=
fiers in
> > +  the 'power-domains' property. Must include 'xusb_ss' and 'xusb_devic=
e'

Same here, I'd drop the xusb_ prefix. I think the "device" power domain
is also usually referred to as "XUSB_DEV", so perhaps make that "dev"
instead?

Thierry

> > +
> > +For Tegra210:
> > +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply =
1.05 V.
> > +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
> > +- avdd-pll-utmip-supply: UTMI PLL power supply. Must supply 1.8 V.
>=20
> My understanding is that this last supply is really needed for the XUSB
> pad controller to bring up the PLL. In fact, I've just moved the same
> supply to the XUSB pad controller from the XUSB controller for all of
> the supported boards because having this in the XUSB controller would
> fail under some circumstances.
>=20
> > +
> > +- phys: Must contain an entry for each entry in phy-names.
> > +  See ../phy/phy-bindings.txt for details.
> > +- extcon-usb: Must contains an extcon-usb entry which detects
>=20
> In the example below, this is simply "extcon".
>=20
> > +  USB VBUS pin. See ../extcon/extcon-usb-gpio.txt for details.
> > +
> > +Optional properties:
> > +--------------------
> > +- phy-names: Should include an entry for each PHY used by the controll=
er.
> > +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
> > +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines
> > +  - "usb2" phy, USB 2.0 (D+/D-) data lines
>=20
> Why are these optional? phys is required and references phy-names
> explicitly, so I think that effectively makes these phy-names required
> as well.
>=20
> > +
> > +Example:
> > +--------
> > +	pmc: pmc@7000e400 {
> > +		compatible =3D "nvidia,tegra210-pmc";
> > +		reg =3D <0x0 0x7000e400 0x0 0x400>;
> > +		clocks =3D <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
> > +		clock-names =3D "pclk", "clk32k_in";
> > +
> > +		powergates {
> > +			pd_xusbss: xusba {
> > +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> > +				resets =3D <&tegra_car TEGRA210_CLK_XUSB_SS>;
> > +				#power-domain-cells =3D <0>;
> > +			};
> > +
> > +			pd_xusbdev: xusbb {
> > +				clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>;
> > +				resets =3D <&tegra_car 95>;
> > +				#power-domain-cells =3D <0>;
> > +			};
> > +		};
> > +	};
> > +
> > +	xudc@700d0000 {
> > +		compatible =3D "nvidia,tegra210-xudc";
> > +		reg =3D <0x0 0x700d0000 0x0 0x8000>,
> > +			<0x0 0x700d8000 0x0 0x1000>,
> > +			<0x0 0x700d9000 0x0 0x1000>;
> > +
> > +		interrupts =3D <0 44 0x4>;
>=20
> This should use symbolic names defined in the following includes:
>=20
> 	dt-bindings/interrupt-controller/irq.h
> 	dt-bindings/interrupt-controller/arm-gic.h
>=20
> Thierry
>=20
> > +
> > +		clocks =3D <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> > +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
> > +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> > +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> > +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> > +		clock-names =3D "xusb_device", "xusb_ss", "xusb_ss_src",
> > +			      "xusb_hs_src", "xusb_fs_src";
> > +
> > +		power-domains =3D <&pd_xusbdev>, <&pd_xusbss>;
> > +		power-domain-names =3D "xusb_device", "xusb_ss";
> > +
> > +		nvidia,xusb-padctl =3D <&padctl>;
> > +
> > +		phys =3D <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
> > +		phy-names =3D "usb2;
> > +
> > +		avddio-usb-supply =3D <&vdd_pex_1v05>;
> > +		hvdd-usb-supply =3D <&vdd_3v3_sys>;
> > +		avdd-pll-utmip-supply =3D <&vdd_1v8>;
> > +
> > +		extcon =3D <&extcon_usb>;
> > +	};
> > +
> > +	extcon_usb: extcon_vbus {
> > +		compatible =3D "linux,extcon-usb-gpio";
> > +		vbus-gpio =3D <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> > +	};
> > +
> > --=20
> > 2.7.4
> >=20



--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMUG8ACgkQ3SOs138+
s6GRxw/9F1AjPELYxDVgEwWUdvDVekJMFWe6RWl+W/FchW6VrW1iUL0z6dTEC4AI
RArTYF2I6APFhBvjZtoAnZ0zBevi/aUE6dFfj7GQWS/Wv/TDjkNeijk7QT+gW+Nr
p6bYSsXnj7WU1GOQCOQqXqN0S3UdCj3r3PlgwkD/zjDULIOguaSFdF994vz5jQ/E
Q1Ok2DiAxgOkTjlMBLbYuINqGZoCD28RsrPJmy8s4dlAntg41eq5T50rPAa4CqOm
ryRhlnY4d7RIxpD2P6kqAEVsIbusqhpgUXURDZNmitgxmr6S41CRxsY8H/OGtdJT
fT/Lp7a2LOr66apRDqCzjNEUELvX6kgR31eBgqXd+k01or7Pa+NdA/+bfEhRiXZp
KlOZRtq5Sa54Y/e/OPuUH1Cq+2h23IZmJYYMhih94zsEFpwbnAQZ6k9a1p+Mbc7l
Y4BiMF6tDGVx5JPyeRJ0y9PLNLHKx+u+n9E5b9xggLl66/cLKyLjr/+RHpCynurM
WNnHw0TyN7JO80Wo4a4rMLIDFFR8xbN0FgMtBoNNdLmZ3I23i9+3G5WkxI7QGVFS
ogYNfh963bRwEuV0Owf+WeIzXQiOQVdrgRfeqsgibfSSBwLZwZwuOkks+Sr5d5D2
v7th5HZqieGuR387Y0+z5a7l+l35M5P+2YtG+44ZL4Foye0rnsU=
=7mlo
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
