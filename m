Return-Path: <linux-usb+bounces-31884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47303CF0114
	for <lists+linux-usb@lfdr.de>; Sat, 03 Jan 2026 15:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80C1E301F7EB
	for <lists+linux-usb@lfdr.de>; Sat,  3 Jan 2026 14:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13C330DD27;
	Sat,  3 Jan 2026 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="MpCacc/z"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB441386C9;
	Sat,  3 Jan 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767450277; cv=pass; b=QLX1cetdQzv5GMi7BmGc6BqJEgHP+5lH2lXw2mEOUiGaLh7FWniNn6CDzCynKrS+b1LKwR3AkMSsjp2Ho16fS6mY//gk1WCCerh61Ya7t3OSLB2K6Yy+xRdzs2Qdrm6OAxv1nInxhLE0tlVY94pweqEG0O/XVquyvbPPETLlx4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767450277; c=relaxed/simple;
	bh=tZy4h3oHoPhnVf9ToE1qLkOG/JtI1YhQzlvvEOL91+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f93uBjUJsu5Kmq3fkgJlHQIgeqdwKGCBmz072JDJYnZ1TGz6m2Ja8OCwvnL8EoMIqBjQLEG1JCrzH3hFfQgt8Yq4SgIujMUo10G32Mq5uHGXHrCLBc4Nf02wvp3TpI/Nkxck5gUcIOtAYgzH3hUAxe1wkdJ4FbRHWY6Bv+JheiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=MpCacc/z; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1767450251; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GrDAJsOcMRqa4lmRjcJ8byk9lPym882PrTIq79tcqvVWrr6QsydRXjaVBVtI3T/zgVCHVY8IroVf0Q2YwKgOwThXT5gz1ac63sKPV7Jzvre9ewDed+efyyggAJvj+cdV1yFPbtnjMCfFKDCnXrY/2l0ycWiP2TmOx+DCLMN6m5k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767450251; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ih+WSwVVDojt8+S5KlRj+VrWY8LbNzRPse4rqBZZ5G0=; 
	b=mVJ63CjVN7jPXgOHuxu07CPxAqC0rV4eEoSFgaCCmR/wXImHSGLWcubp1BgJ0u8nW9nnadcqTSpbWxY6chxBrmn9bRC6/mMSpbh0+2g9joNJ6Sl8U8Obb19n2/v0PXWEBSBU1NC3hS7Lfq5wWm4MyFqgqI258flC/r6KfC956JU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767450251;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Ih+WSwVVDojt8+S5KlRj+VrWY8LbNzRPse4rqBZZ5G0=;
	b=MpCacc/zU7n4iYLpFcx3C1+y7S1j8UVNz1NHwBplAokSKOgMRlDU5WYfUC+SdFgi
	cCbEQz3/3E+UcaTmCbm9pimWXbU3Ll990H2KRkCmyTi0QYMSOrElO8ZwlSnAVndCs+l
	zKXqFK8XoJyYI2w6vIxu1BNyeUWimIAvV+2mDCdc=
Received: by mx.zohomail.com with SMTPS id 1767450248307364.7110964115078;
	Sat, 3 Jan 2026 06:24:08 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 8D11E18054C; Sat, 03 Jan 2026 15:24:03 +0100 (CET)
Date: Sat, 3 Jan 2026 15:24:03 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Diederik de Haas <didi.debian@cknow.org>, 
	Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 0/3] Typc fusb302 powerloss issue on Radxa Rock 5b
Message-ID: <aVkinPvh_jxdh9wm@venus>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fhxt6xjqdij5sxjm"
Content-Disposition: inline
In-Reply-To: <20260103083232.9510-1-linux.amoon@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/267.430.24
X-ZohoMailClient: External


--fhxt6xjqdij5sxjm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/3] Typc fusb302 powerloss issue on Radxa Rock 5b
MIME-Version: 1.0

Hello Anand,

On Sat, Jan 03, 2026 at 02:01:16PM +0530, Anand Moon wrote:
> On the Radxa Rock 5B, the system occasionally experiences intermittent
> hard resets during the boot process. Initially, I suspected a power supply
> issue, but further investigation points to the Type-C fusb302 module as
> the cause.
>=20
> Specifically, probing or reloading the fusb302 module triggers a hard res=
et,
> which can result in immediate power loss and a reboot.
>=20
> [root@rockpi-5b ~]# rmmod fusb302
> [root@rockpi-5b ~]# lsmod | grep  fusb302
> [root@rockpi-5b ~]# modprobe fusb302
> [root@rockpi-5b ~]# [ 3389.031608][ T7143] typec_fusb302 4-0022: Initiati=
ng hard-reset, which might result in machine power-loss.
> [ 3390.030444][ T7143] typec_fusb302 4-0022: Initiating hard-reset, which=
 might result in machine power-loss.

If you see this message the TypeC port manager (TCPM) state machine
reached the hard reset error state. A USB-PD hard reset involves
removing VBUS for a short time, which effectively removes the board
power on ROCK 5B. Unfortunately the situation is quite complex :)

> I attempted to trace the issue using ftrace but was unable to
> pinpoint the root cause. The problem appears to originate either
> from the I2C controller or the PMIC reset.

I2C and PMIC are not at fault. This is all about USB-PD
communication itself.

> I have identified a potential workaround involving the I2C SCL debounce s=
ettings
> for the RK3588 and submitted a patch here:
>=20
> [1] https://lore.kernel.org/all/20260103052506.6743-1-linux.amoon@gmail.c=
om/

This is most likely a red herring and just slightly changing timings
in the USB PD communication.

> Please note that the submitted changes address a minor aspect but do not =
fully
> resolve the underlying issue.

I don't expect any fix from this series regarding your problem. Also
I suggest having a look at my talk at the Linux Plumbers Conference
=66rom last month where I discussed this issue :)

slides: https://lpc.events/event/19/contributions/2156/attachments/1784/386=
1/improving-stability-for-TCPM-using-boards-that-are-not-self-powered.pdf
video: https://www.youtube.com/watch?v=3DDmLsePJoH8I

Something that might be sensible to do on your end is figure out
*how* the state machine ended up in the error state and check if
we can avoid it. The related code for that lives in
drivers/usb/typec/tcpm/tcpm.c and quite complex. I use the
following two patches to ease debugging:

 * https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/c=
ommit/6edc68e3c0ec4c209b5e96b848e17201059ce9ee
 * https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/c=
ommit/8ca8b1d6ee36e80f794bcf351a8b78d5a96daf06

Combined with CONFIG_DYNAMIC_DEBUG=3Dy and booting with the following
kernel arguments: loglevel=3D8 tcpm.dyndbg=3D"+p" fusb302.dyndbg=3D"+p"

Greetings,

-- Sebastian

>=20
> Thanks
> -Anand
>=20
> Anand Moon (3):
>   arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Correct Type-C pin bias
>     settings
>   arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Fix USB host phy-supply
>     on Rock 5b-5bp-5t SbC
>   usb: typec: fusb302: Switch to threaded interrupt handler
>=20
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 7 +++----
>  drivers/usb/typec/tcpm/fusb302.c                        | 7 ++++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>=20
>=20
> base-commit: 805f9a061372164d43ddef771d7cd63e3ba6d845
> --=20
> 2.50.1
>=20

--fhxt6xjqdij5sxjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmlZJoAACgkQ2O7X88g7
+prmAQ//Szd3e+4Q3obakorrCA/Rkjd/Falf3rVKj3JWkmeucNnOTL2jHofdgZPQ
Up3hSKfSWMN/zCotdRopg8tBkTAC6IfHfouCbq5n/ksodO4+yXH8VZ/XqisJW6wi
b+Nd4pWrThDpeQ4a8Tq+qEpvFbmRUxbCktoKVb8hQY6YF0GMvjGUOWiJ3NhwrKEC
M+PIICA6+pDqwvkY3ULR65kYBE9o7fIlaRwvz9MT+R+XzdJ4v6q7L+p6w4fNgppJ
Yf4I0PgROlpHTWhaeYKS/EdlMqszFKrW+3ykVrO2BxusCFEtzI5jm065tNomBWoC
Yy/LWQcyCE4yb5/fupabsBgmbSN/AZqpGMS1OMivIP1DLlF4s5Qzcn4Tpoeqzjo+
JU6BVpXv5v3ms4DUZN1cCwOf8lg2KugFccqut6uH640IndAlwrfElsC/ac6NNAWK
uhXfnJ7VDJtVFjF3t0qQ/960JdA+MpMnEHI3px+9IP46Mq43OTL4YITn5mSetckz
Jie3G1ctO4nroo0ZBWlDh7zNn97bDbhpshBYKK9fR8lhEmchoVBhRJ1nRPtX9cW3
ulvUri6WY1/QEi/erCXrsVxYMhYSm1H/is7tXDChwdbb0eZfmJBRzSK2CMxbsbyr
O1zEi87Ei8ax4giABrrIVB2XsNmQNvpL/OCqHmog9v0Al0ysdm0=
=tlFx
-----END PGP SIGNATURE-----

--fhxt6xjqdij5sxjm--

