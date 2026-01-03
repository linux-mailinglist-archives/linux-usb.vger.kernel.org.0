Return-Path: <linux-usb+bounces-31882-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94098CF0088
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 14:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6A5D301FF71
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 13:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720E230BBAB;
	Sat,  3 Jan 2026 13:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="Sxq5Vpnt"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6FE1C3BF7;
	Sat,  3 Jan 2026 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767448417; cv=pass; b=nta7DxwAmp/jSUrKub13O+iS3thteYysB6dkxN9rRkEJAA3iToPmYpt8KJ7OCzpulOyRKMGqc38ivHfhRPR0I41fmKHftjmKeghDjwO08b+3p+n8FyM18k56n7SRB1IM9bZ35Gl/SpGX0rRnn18cMWEJ0otMLzk69/PyD4BIKLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767448417; c=relaxed/simple;
	bh=Y5Ip+rY8zrCI3sEu3f8EYm4Ck++Bkr6j3eOP3rTS3dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nj4vvziMGu0o/pr0QL2qFNgtWsfKsqLXA2Tz3Qc8xCquqg0LfJbZOTguz2TPz2UjWWG54TVdo6hz4Lx8nu94Vg8dsMbBQMOS19p5D3X+/3WJ20/JlL5Ah4GiT+kgtOGAy+Wc+y/jLnZzJwEE8qXmwlIC1zIfzv+j9c2PFkE7jpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=Sxq5Vpnt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1767448380; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IDcuSeXH2CICFAdm65XISS6csPuDye1jA/nhxRiRK6YMQM12LYDxTaCVVQ4rbbIdp27i5JRf16TAhfu1JYS+zTQt/CIh03k2luJ3uVWsNuBM08iTOHxAvrDFSIrqDylrgxWGNJ1sjDAqJeOuojaWudVLknBaQmJ7yYY7DmXgdL8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767448380; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d9H7y6YgOMKmHV3+yZbIO63YJ0wpHijUok8tAbtehVI=; 
	b=DqtH6+e3u69ksoK5kcrZTy0bIIZw3+54+VHz34hV59f4WSuVCxPJ/W6DbiG6qqKlqpajswX3i5hv63fh92v+dJcO6x2yuDx+gNp4rNbEMBtqUFZcDJ5iNqq1dpxGKABGg80YOnHChy6mMuNU0LWy/yEjM4gX+FOlUCh4p0WW2DE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767448380;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=d9H7y6YgOMKmHV3+yZbIO63YJ0wpHijUok8tAbtehVI=;
	b=Sxq5VpntLYcVgyUsXFWqi2JLqQB6A3kAks8oO07M3eVS0R2IpY+LCS02nVEbZRL/
	U0NDdJSSazUI68G0BqabQ3XugbHJQ5J7Pk5tdUENmcXgSC4mh0tJD5/4s2bvyV4Ehv2
	3VLeUumbLQptuQKi8LgI/DpZ6K7XpKFqbaZjMe+Y=
Received: by mx.zohomail.com with SMTPS id 1767448375895378.81651063590607;
	Sat, 3 Jan 2026 05:52:55 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 7AB8F18054C; Sat, 03 Jan 2026 14:52:50 +0100 (CET)
Date: Sat, 3 Jan 2026 14:52:50 +0100
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
Message-ID: <aVke1kQnHJLqWGHi@venus>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-2-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j3clvygndka2x6e6"
Content-Disposition: inline
In-Reply-To: <20260103083232.9510-2-linux.amoon@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/267.430.24
X-ZohoMailClient: External


--j3clvygndka2x6e6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
MIME-Version: 1.0

Hi,

On Sat, Jan 03, 2026 at 02:01:17PM +0530, Anand Moon wrote:
> As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
> active-low signal. It requires a pull-up resistor to maintain a stable
> high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable signal
> requires a pull-down resistor to ensure it defaults to a low state,
> preventing unintended power delivery during the boot sequence.
>=20
> Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
> pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
> electrical requirements.
>=20
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for ROCK 5B=
/5B+/5T")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
>     As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
> ---

Checking the schematics:

5B v1.45 - CC_INT_L - R2613 10K pull-up resistor
5B v1.45 - TYPEC5V_PWREN_H - GPIO is effectively unused because R95035 is NC

5B+ v1.2 - CC_INT_L - R2613 10K pull-up resistor
5B+ v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor

5T v1.2 - CC_INT_L - R2613 10K pull-up resistor
5T v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor

TLDR: All GPIOs have pull resistors in discrete hardware and do not
need them muxed in the SoC.

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index b3e76ad2d869..0cd8ac7bf538 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -537,11 +537,11 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> =20
>  	usb {
>  		usbc0_int: usbc0-int {
> -			rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pins =3D <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
> =20
>  		vbus5v0_typec_en: vbus5v0-typec-en {
> -			rockchip,pins =3D <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pins =3D <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
>  		};
>  	};
>  };
> --=20
> 2.50.1
>=20

--j3clvygndka2x6e6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlZHy8ACgkQ2O7X88g7
+po4Og/9H83sPXhEoMq5arPCN6/ta/CDQCipwx6OZLyN6znuNtnhXP5yq7ymZ/wf
06Nuv4Abjr7/hl3DyyprGK8nSQiZ6BpFNzbqP/9VcVxdZHHbOrqRLLb8DllfhZeR
OgeIx5Lg1NkyyEIPLEUn72KuI7FD+jwfKzk1ptdYc8VW3woDefWwKVOCD1pFlyb0
jYbSI+4oVtq7sPLlH+Eu0H2ef7btVvmOFNFbuM0xgQQnL5jxHLux4fOd66hVJQb6
5PGzVQkppms6Srq34fF11/+pdCEAZFs3D1nIXsF46HkxILxHhObUkz21FIZ2MKOX
VaYyb0aFGxgqKnFMGFUXlvDWHZreHKZZHwTpaMABiQGp+4E/k0ORW3FmX3Djgu69
UPdPf16M1mZNYzj7N0iR36Jb6lGkeW0BAc4+qdEhuJc78t73kHObkM1KoNXXzFEx
fuANSDk/OAw6o8eCv0Jw3H/bPrwj2J67YLN1ZITxrWxWjuX3bPq2aorWWW5aBMPo
d3PXQwHz0r3bcvgsSY/DWa2xaQilt8w2iT/1OY49zkFty+1EDznqZExprL3TM8zG
4uOw9kMuk7+RvbZjZzgxlowzroN08ICWYhCgPld36DCb25YMQNeARU4/y+lBpnoA
XPy+YtUpDtM1I/JRXDsMdEIeyTK6GwgvoaS7xsnephRytgPosuQ=
=NzfA
-----END PGP SIGNATURE-----

--j3clvygndka2x6e6--

