Return-Path: <linux-usb+bounces-32121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D90AD0C82C
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jan 2026 00:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0BB23009D79
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 23:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7F23396E6;
	Fri,  9 Jan 2026 23:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="OpSJtp9m"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBB248861;
	Fri,  9 Jan 2026 23:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768000290; cv=pass; b=XxWTEgO/GIx9zmisy1lixg8ii1hxyLGlV5BsC3xqloXL0+9sz/lZ6iF/kD4K9NSs7DGi0e/w5NprNIfr8xBRRUWNuy1IJEufg3sQVRPOgaGluUioC1w/pKUpcorr+A9hclAcAsDEBZ68eIqwWGvbzSSoCQrBsyD4ysQoCPCFgRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768000290; c=relaxed/simple;
	bh=2UjK8EkqX+o9dhUShzcqFv4Glmty3rhU5ORNvwL2DAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GxX2hM4p9NvGq+lBFt8UbODCkAqj5lnlsPUVavKOtTx8Op1z9XcuK5iM5Ox/UQVBOqk5v8Oha20VwqywfGP6NrjURFZDvUQm5b3oLn7Bzvoni185vTPSZXMNCgSKrHzcnLd4N2D4hBwDgIAP1O/X/02OdDvUes7/0HSuR00D98g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=OpSJtp9m; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1768000268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iTiTTgrfIXHegCuH7rVuuGmTtsbQmtYQxfx98Pq6aHGwQ2pLR0tB46SlPe0MvDDRNRo9hS0AxTx8TOju0Wa9udQKB4XOrMCIPSDcbGLSWyvEHkv4ckNGWXfs9YgnMlMKpJjT1cvpHLI5aImutuelzuEeFcKcQpAz9jVIDQRc60w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768000268; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VvO1eaLvUNP8fp2Ve6v5l3VhSZWqyr00cvhZUKpR3z8=; 
	b=eFpPxgKPf/C0iVNFAx4EMOng2cXw2JtBZC0QTiLrJ8SoA5BYXYPhRbpCaZvYoOgIDOiUIzmKmBf0UiuMSkKY3CGN6BS0qE344AGDjASUJL9C0fBdZYExAC4sD8tYW8AjtYeLB2S7vTCRK3tjDEyLSi6hoUu6EXO0qte0TV11cic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768000268;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=VvO1eaLvUNP8fp2Ve6v5l3VhSZWqyr00cvhZUKpR3z8=;
	b=OpSJtp9mT0i/A50DDxiCMFztbadTpH7Hko7+wmwv28FKS7NOWbgohgk5EGxCzYAx
	bQkoDZUlUQ/ZCnEf7RlrLepXMC+H74UNHtvY0uZif3+6alqisaUDOVd4LiSKdqi7u7x
	i4TxEiJqPTpc1FKrD8hggWt4p9rBFvrdJFX2Hc9Y=
Received: by mx.zohomail.com with SMTPS id 1768000265401385.2485780895405;
	Fri, 9 Jan 2026 15:11:05 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 65605180632; Sat, 10 Jan 2026 00:11:00 +0100 (CET)
Date: Sat, 10 Jan 2026 00:11:00 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
Message-ID: <aWGJYt3VPWh1kC_v@venus>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-2-linux.amoon@gmail.com>
 <aVke1kQnHJLqWGHi@venus>
 <CANAwSgSd0TLrkxpnS5qdot8B7vkd4wH76-g8hAixqfbEtH4LyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qwkqzwpah4jl6gzl"
Content-Disposition: inline
In-Reply-To: <CANAwSgSd0TLrkxpnS5qdot8B7vkd4wH76-g8hAixqfbEtH4LyA@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.5.1/267.941.65
X-ZohoMailClient: External


--qwkqzwpah4jl6gzl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
MIME-Version: 1.0

Hi,

On Thu, Jan 08, 2026 at 12:24:50PM +0530, Anand Moon wrote:
> Hi Sebastian,
>=20
> Thanks for your review comments.
>=20
> On Sat, 3 Jan 2026 at 19:23, Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > Hi,
> >
> > On Sat, Jan 03, 2026 at 02:01:17PM +0530, Anand Moon wrote:
> > > As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
> > > active-low signal. It requires a pull-up resistor to maintain a stable
> > > high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable sig=
nal
> > > requires a pull-down resistor to ensure it defaults to a low state,
> > > preventing unintended power delivery during the boot sequence.
> > >
> > > Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
> > > pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
> > > electrical requirements.
> > >
> > > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for ROC=
K 5B/5B+/5T")
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > > v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
> > >     As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
> > > ---
> >
> > Checking the schematics:
> >
> > 5B v1.45 - CC_INT_L - R2613 10K pull-up resistor
> > 5B v1.45 - TYPEC5V_PWREN_H - GPIO is effectively unused because R95035 =
is NC
> >
> > 5B+ v1.2 - CC_INT_L - R2613 10K pull-up resistor
> > 5B+ v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
> >
> > 5T v1.2 - CC_INT_L - R2613 10K pull-up resistor
> > 5T v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
> >
> CC_INT_L is gpio interrupt pin to enable the I2C read operation.
>=20
> As per FUSB302 datasheet, here is the updated version of the commit messa=
ge
>=20
> Configure CC_INT_L as an active-low, open-drain output. Per the hardware =
design,
> this pin utilizes an external pull-up and is driven LOW by the Type-C
> controller to
> signal the processor to perform I2C register reads.
>=20
> The TYPEC5V_PWREN_H pull-down resistor is turned on as a signal to
> the Type-C regulator, which has an active-enable-high property. In this c=
ontext,
> the regulator is used to set the polarity of the GPIO used to enable or d=
isable
> the regulator.

I don't understand what you want to say here.

> > TLDR: All GPIOs have pull resistors in discrete hardware and do not
> > need them muxed in the SoC.
> >
> It depends on the GPIO, pinctrl PMU configuration.

as I try to say it does not depend on pinctrl configuration for any
of the GPIOs you are touching. The pull resistors for them exist as
components on the board.

> I was thinking of converting the vbus5v0_typec regulator to 'regulator-gp=
io.'
> to better reflect the hardware schematics. The TYPEC5V_PWREN_H signal
> (GPIO2_B6_d) acts as a state controller rather than a simple enable pin,
> and this change ensures the device tree aligns with that design
>=20
> [1] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic.p=
df
> (page 28)
>=20
> $ git diff arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index 5f58e339a052..387ff009ec76 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -57,9 +57,10 @@ rfkill-bt {
>         };
>=20
>         vbus5v0_typec: vbus5v0-typec {
> -               compatible =3D "regulator-fixed";
> +               compatible =3D "regulator-gpio";
>                 enable-active-high;
> -               gpio =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> +               gpios =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> +               states =3D <5000000 0x1>, <0 0x0>;
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&vbus5v0_typec_en>;
>                 regulator-name =3D "vbus5v0_typec";
>=20
> Could you please try this at your end?

This is missing gpios-states, but I also see no point in testing
that. Having one state as 0 effectively means this is a complicated
version of regulator-fixed. The switch from "gpio" to "gpios" is
valid though, since "gpio" is deprecated.

Greetings,

-- Sebastian

--qwkqzwpah4jl6gzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlhiv0ACgkQ2O7X88g7
+przrQ/9E7ZgXZmJU/ncfKD8Q0dB94+9RSYcBroM0lKy8akHS+dsY6LX+g48sjF5
654sDnAl5QlhVEPMgCsRwG1f87dJy1/eaXUIc7m5TmyPdK4VsvQbgRaBr5btBC1V
h1wvnRsHSdsTVRHT3Psygl3oMQKrB+MpzGv4SQEtPfVfOthpzA4h6hZ3S0fFBjT4
kd53oHe9Fvvd4Cc91bTbXTfQxM2IBzIUFYJgI5EO948EwDPtzxa2afGQ9lfEybtu
+l4MwSruIHQe7mFUsxVDVYw+BVzFzQGJ3E3pBnd+1shDm2r0FiT62swwRfbFcxu1
19btgFH18WVRVlPgIApKD6Exfjan7/elxYjicUIO1Q+GjGvYPKP1PsozxjYaoZr0
WutY3WzprO+D4NPyI7tvU2XprQ0MdINd3uXZSvCKi8CPryMrYytb45w8njIypO85
5JypAQJ9zYKhxyq10mUrzt2GBdgAak7lM63KtvN5E6pWk/OCyrEt0PfCI2HE/AOV
VXp2y/oW4VLZZ0LyvmcR8UUq7X2it+y+faAHhSANxccpT9I5M5rtleK30t+bemzZ
WofQinAz6AZ1aUC7EEyATr55gFXMcPQzKNTk7kuox5GpUUZfcrVgKFAamXV99pZw
p65DncEUuiQdNgk28h71AAW1MM4Jr7FeRlOqxjpU5aDk1gQXN8s=
=H3Oo
-----END PGP SIGNATURE-----

--qwkqzwpah4jl6gzl--

