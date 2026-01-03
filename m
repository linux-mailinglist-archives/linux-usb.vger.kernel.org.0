Return-Path: <linux-usb+bounces-31883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E0CF00A1
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 15:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 241AE301E224
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 14:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816E3307AF0;
	Sat,  3 Jan 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="ERkT8Xdu"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7318C933;
	Sat,  3 Jan 2026 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767449130; cv=pass; b=JTHMgk8805CG0wVcfwAAGFWsyan8xemtrVWibJFoNAI9SCj00/hP6Y96RK4bId39c+l2p9WKh2kDzQ2VwLVsBTv/jJE272mef9qAHFa/qWx3Stk+CAS9Miva3Q5nffCtAGkgi+gJkp5hzlw1t/JVzq1NKLwlAEAAu9rmCHb7vkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767449130; c=relaxed/simple;
	bh=vhVK4hg+42hPm8Kuf9vzVYKmK27olOpoQTdcfL2nVG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UET/qr0IfSZAUJweiA5qpwG6AxHavKKldcO4xIPG2J7UZR3RFVB1GJzx7/ur+s5BIICsggQ3TfIx2BapCZoUdcRjNFrxLDzcl7yKbxCLuHV+Rg9hjuAQG7i6bhCfoUGGYQ5cahJVWgm42EKg+s7mq71urw8Ci2+VfArOI+hFfag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=ERkT8Xdu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1767449095; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YRa4h1EQKHxjfU+6npG5r/xqTnNpN/jB8rwYJCF4nuXy/jqrnz48j+gkSIT3TXr62gF2IzoI8DRp9RzVZt5Ic5Qv5MHQ3xjd8nrM6JoF/V4CuGzntnfX9fPpbP2dqIpAtPBw5Dgq3yWkEVvCkG6XCc1UkEulfnZ7KBh8+NqtkYc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767449095; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sclPIbTuFBUw6SwfyH8YCc5Ug5qVUgcMP6TFoeELZHA=; 
	b=KaEoR/UEk1mtY1aH711qYegTdXg4jVe51X8YBcwTHbogmd0M+GnHPwBOJKhRLIILQZJSTRA3SidEA4RwI0XbtDTAPbLSPx912pVBLGL4Fs1bB8upJSI0mpR/KyrcqoNuBcIX72eRuDxR0y9S6YKDURMc+VWGsuxz9c+ZSbSygXI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767449095;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=sclPIbTuFBUw6SwfyH8YCc5Ug5qVUgcMP6TFoeELZHA=;
	b=ERkT8XduG5w+z9adyLzBkItLI3DKSMCSysdnGKEWlinvM453YMBXZamMDpjrKbOX
	aIksk9GW6cID8EQ2YURl6NI2nRtWrLZx5QBaiXu2AwDRGuVk6mcujM0n5L4/QIn3QAS
	c+XXiWDvJAEjmwWnj46ixxSmHAHVfzWM7towiuoE=
Received: by mx.zohomail.com with SMTPS id 1767449092519959.3621110978988;
	Sat, 3 Jan 2026 06:04:52 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 4BEF418054C; Sat, 03 Jan 2026 15:04:47 +0100 (CET)
Date: Sat, 3 Jan 2026 15:04:47 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix
 USB host phy-supply on Rock 5b-5bp-5t SbC
Message-ID: <aVkfNBUDUumzV0-X@venus>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
 <20260103083232.9510-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kv5ni5kly6ecqwne"
Content-Disposition: inline
In-Reply-To: <20260103083232.9510-3-linux.amoon@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/267.430.24
X-ZohoMailClient: External


--kv5ni5kly6ecqwne
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix
 USB host phy-supply on Rock 5b-5bp-5t SbC
MIME-Version: 1.0

Hi,

On Sat, Jan 03, 2026 at 02:01:18PM +0530, Anand Moon wrote:
> The USB host USB2 and USB3 on the Rock 5B, 5BP, and 5T is powered by the
> USB_HOST_PWREN_H gpio pin which is used to enable vcc5v0_host host
> regulator which ensures proper power sequencing and management for onboard
> Double-USB-HOST.
>=20
> Update the u2phy2_host node to reference the correct phy-supply.
>=20
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---

u2phy2_host is connected to an onboard USB hub chip, which is
powered by &vcc5v0_sys as the comment says.

You can see this on page 9 of the v1.45 ROCK 5B schematics (page
name USB2HUB). The usb hub chip uses VCC5V0_SYS + VCC_3V3_S0 and is
connected to USB20_HOST0_DP, USB20_HOST0_DM. The related USB
controller for that in the upstream DT is &usb_host0_ehci, which
in turn is using &u2phy2_host. Thus at least for the ROCK 5B the
existing DT is correct. Properly describing the downstream port
VBUS regulator would require something like the following series:

https://lore.kernel.org/all/20250911-v6-16-topic-usb-onboard-dev-v4-0-1af28=
8125d74@pengutronix.de/

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/ar=
ch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> index 0cd8ac7bf538..886d788572fc 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> @@ -981,8 +981,7 @@ &u2phy2 {
>  };
> =20
>  &u2phy2_host {
> -	/* connected to USB hub, which is powered by vcc5v0_sys */
> -	phy-supply =3D <&vcc5v0_sys>;
> +	phy-supply =3D <&vcc5v0_host>;
>  	status =3D "okay";
>  };
> =20
> --=20
> 2.50.1
>=20

--kv5ni5kly6ecqwne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlZIfsACgkQ2O7X88g7
+ppfnBAAlkhFx+COcza3lA5ddFOvmfszMCpFeKSBHkXDGlL5a12sMSXTlQqO0S0A
LR2IHlvQWQy+k0gRuh12FByzc+UmFcfw9BF27Hyk6sSZLfiivT1bD6P7/99+4qwJ
NO7O8GrJDH4FRacbTQy1qi4Yv/S1R4juSsdHUHL5Zi/Y+Yc6YjW5c+d0shZ661kd
kEfw1KuNGdeG4DDrgGqKgUTd+Cy82VicsBw8gqoG/Ur1I65HLFZtJSVLjN4oK3HM
pE9fixoWUR0GPsmDEEFjy5jnWs9hc+bW8Zb80QbUFPBLRe+0P8rcm9M/zOVzibX4
A2MRLqOmq8JEwPIaxjL3KI1xerbMGjeK+V6qBKJxRv6TTDMGNh+IbbDoq1N5APJv
1xaTUPXZxYnu3HasyGpjytPzYeP3W5T0T1OWgQ28TruwPqHtvMM61xxLMjM3Wpa9
3EibGeXO2VzPJBPq6z2SxguIY3uPG7hTznTMMAq9yantUdhCBkevDncyXJjja/Wd
gYzkXhCokKk2JzlvExvkjzkhQSrFuFaiDF1vHkxykGnWjdxuBUkMDcCNYieMuUHx
cFwHljZUeM7wImpi/4kYaSAiEN+IArTtWDusptTaCOC0nMYd6tjn7YV12jFDaRZM
h2o1H0TPQ9cXOMv5of6qEpichDrcuU9fN8D+0cR7PW17yfDzvr0=
=j8HA
-----END PGP SIGNATURE-----

--kv5ni5kly6ecqwne--

