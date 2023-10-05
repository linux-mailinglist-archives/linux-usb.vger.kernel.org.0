Return-Path: <linux-usb+bounces-1169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6E7BAB79
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 22:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 938DA282154
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 20:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A382C38DC7;
	Thu,  5 Oct 2023 20:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XW0IGpZO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B141E43
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 20:35:14 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471AE93;
	Thu,  5 Oct 2023 13:35:12 -0700 (PDT)
Received: from mercury (unknown [185.254.75.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 44CD56607336;
	Thu,  5 Oct 2023 21:35:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696538110;
	bh=+Rnv2prRvZyVs11h4b6Mvv3TPCjUToYKmLtK7qDQkIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XW0IGpZO3bt6WbxkR9uUpyOT72hklLSv568GU7RwhhTEY/Ud8L76HNM3vDDtInz9y
	 5hSVIYPVh+MPb7Zkk0Vem3TE+cLdIhzjhbcxyUskFo3a6uhSSehvHo6J9wH+zouoZX
	 76x9VhxYm+e9RpMrckoYeJML2WyETUyBSHYYXkJUh3OFdm7WvqOALmBKRqkgsWPBiL
	 zgOoopweoFg+P3re35A58hO9BNtDpG/lxBSDqn3NG7G+V8mOGYKwsBv3GL36j7nGhr
	 IsYfpY2cjeluRrnxm0FIPEzLDviXotjy2xzUrUDUvxiHLggobgn3QwxErqKr0UqLdz
	 j2E/5gTweAO9Q==
Received: by mercury (Postfix, from userid 1000)
	id 994511060532; Thu,  5 Oct 2023 22:35:06 +0200 (CEST)
Date: Thu, 5 Oct 2023 22:35:06 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Richard Gong <Richard.Gong@amd.com>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: Use GET_CAPABILITY attributes
 data to set power supply scope
Message-ID: <20231005203506.akgyrzdjnmq3ugd6@mercury.elektranox.org>
References: <20231005175230.232764-1-mario.limonciello@amd.com>
 <20231005175230.232764-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hxwbm6xxxmhg7owu"
Content-Disposition: inline
In-Reply-To: <20231005175230.232764-2-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--hxwbm6xxxmhg7owu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 05, 2023 at 12:52:29PM -0500, Mario Limonciello wrote:
> On some OEM systems, adding a W7900 dGPU triggers RAS errors and hangs
> at a black screen on startup.  This issue occurs only if `ucsi_acpi` has
> loaded before `amdgpu` has loaded.  The reason for this failure is that
> `amdgpu` uses power_supply_is_system_supplied() to determine if running
> on AC or DC power at startup. If this value is reported incorrectly the
> dGPU will also be programmed incorrectly and trigger errors.
>=20
> power_supply_is_system_supplied() reports the wrong value because UCSI
> power supplies provided as part of the system don't properly report the
> scope as "DEVICE" scope (not powering the system).
>=20
> In order to fix this issue check the capabilities reported from the UCSI
> power supply to ensure that it supports charging a battery and that it can
> be powered by AC.  Mark the scope accordingly.
>=20
> Fixes: a7fbfd44c020 ("usb: typec: ucsi: Mark dGPUs as DEVICE scope")
> Link: https://www.intel.com/content/www/us/en/products/docs/io/universal-=
serial-bus/usb-type-c-ucsi-spec.html p28
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>>
> Cc: Richard Gong <Richard.Gong@amd.com>
> ---
>  drivers/usb/typec/ucsi/psy.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 384b42267f1f..b35c6e07911e 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -37,6 +37,15 @@ static int ucsi_psy_get_scope(struct ucsi_connector *c=
on,
>  	struct device *dev =3D con->ucsi->dev;
> =20
>  	device_property_read_u8(dev, "scope", &scope);
> +	if (scope =3D=3D POWER_SUPPLY_SCOPE_UNKNOWN) {
> +		u32 mask =3D UCSI_CAP_ATTR_POWER_AC_SUPPLY |
> +			   UCSI_CAP_ATTR_BATTERY_CHARGING;
> +
> +		if (con->ucsi->cap.attributes & mask)
> +			scope =3D POWER_SUPPLY_SCOPE_SYSTEM;
> +		else
> +			scope =3D POWER_SUPPLY_SCOPE_DEVICE;
> +	}
>  	val->intval =3D scope;
>  	return 0;
>  }

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--hxwbm6xxxmhg7owu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmUfHfEACgkQ2O7X88g7
+pppFQ//fWCSXocN8V9lRZsVm33b3mgWdP2RaiSkwmCaeOsp2meEhzaND+5l2W2R
u9ESFzFFmC5R29upWz7R5ACgNpGJiyN1kzIlxgfldp6xG8IFjsDetQk8RCdEoYI2
zrC3ckTJ2qrv+RXyvdoOjoGfjRbllExOWAlMD55XebSoBAI3HDD69uWatWLYucN3
XwyzzWVHaBdn957IE4IIU8bZQioDXaPECvnR67LIUlCrWDyzWtZ44tX+rEkzOlzW
MzKg0hZPjmYJ3+abBUFXWHD3YJuyoQrbl+MAju4SH1pVNG3dxg67FmHEETZRFVIZ
DYLg9SgdfBEINIvH1tNIpvsgp9pJVZ5w8s80sajobht9lNA4vTR9LHoP+NjbuwlT
UNQlHufAAA/O7zWtqlqgz5X4Ge7klZ7cu4ybYoQOrI4j4L4MRNC77nSlQlpmB1/w
71046UcX/rHGjQNYeqXR37YsNcemWLwQkBM7+6Hyupjdu5VKhXPpTxFizdl4E5Rw
obgiOjYwgxti3G8PRp95sKO/56QJTGYO4hgjDu2III24YTT6VmIhDOTNjBk+PpIv
5K4/GT6VV7csRyHfMCxvvF1cyNlIRoGaIjYYD7HDMgOKdx5qQobPkEwDJpNuvtCK
ozGkiCfEdRerdMwQtbywbeZ7nqUzd12P2ZI07UeRUfd4JqsNE6c=
=TKBn
-----END PGP SIGNATURE-----

--hxwbm6xxxmhg7owu--

