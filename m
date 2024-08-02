Return-Path: <linux-usb+bounces-12894-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E09460B5
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 17:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D7AE1C21016
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 15:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB70A1537B8;
	Fri,  2 Aug 2024 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="1RTrc407"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7388D136330
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722613424; cv=none; b=kgoEjFilltA5Ftt3yd2M6m56FFN05RFPEJDc2+DCBbspZTYokkiMQ3wqxPvyqNd5jU4/i/8FB+ICEFQsvZqUtaBhCNZbjwhuvt1a2ZOMbLbbHtZC4jLgsN34kJiAuhjXIyyBMFrg/CQefVBugMXrj9yL4kzBfCmgZu/syMnq3k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722613424; c=relaxed/simple;
	bh=yIGm2BQpu2T9isCJI3xoo5saFoIz2B6ZKFy1laVtVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sybvuU8XBo9VmqoUptxkKYMopzck615jKMGfc/6avGdARrL0adU921mpNBbj9SUnHlV/LuF/yowyloze8+KX6Zcci8GZXXaza983zImnWfWWlCegd+dnuujKACV2XxfKqykoGQdc8GBmXIKHyrjauUl5tbpLEGqrCiJIFnjiFgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=1RTrc407; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722613420;
	bh=yIGm2BQpu2T9isCJI3xoo5saFoIz2B6ZKFy1laVtVXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1RTrc407fFbb/t1qDtHec/xsgynpI/G4ehN675sXZFhqcSJwibiVKgzMydYuLJwTQ
	 BPHHySKXJmH4+Rj4d/CIbVKeFv1p+oQGnObkkYRfamglfAdb2lQC4VsWwkZmrF6mWZ
	 1jsyI7ALgo59k313EefXMw3FmUQJatSZGa2QhGDyk4rfzU/doexGCwxus/AFrNAHj5
	 dtMsbgjOiExaPfGCT/pE8GZUG7a91Cmb3IYoBsVr6QwDvMFepVtRg89kA1lAnx9zno
	 z7+8sYrUt7BZpJ0fHw8FWZrmoA4a/ATuIbXwRSN5/UOIupyczOOEl13EWTqNYY7FYM
	 chGY9JPyXAV8Q==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A56BA3782212;
	Fri,  2 Aug 2024 15:43:40 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 41CF71060929; Fri, 02 Aug 2024 17:43:40 +0200 (CEST)
Date: Fri, 2 Aug 2024 17:43:40 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	rdbabiera@google.com, linux@roeck-us.net, badhri@google.com, kyletso@google.com, 
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: avoid sink goto SNK_UNATTACHED state
 if not received source capability message
Message-ID: <qo452qwsquqfumcsvlczotdjvyqu2y6itufglldxrlxjv3ganm@6rvhfye7mobv>
References: <20240802064156.1846768-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xdre7bjtvphpkror"
Content-Disposition: inline
In-Reply-To: <20240802064156.1846768-1-xu.yang_2@nxp.com>


--xdre7bjtvphpkror
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 02, 2024 at 02:41:56PM GMT, Xu Yang wrote:
> Since commit (122968f8dda8 usb: typec: tcpm: avoid resets for missing
> source capability messages), state will change from SNK_WAIT_CAPABILITIES
> to SNK_WAIT_CAPABILITIES_TIMEOUT. We need to change SNK_WAIT_CAPABILITIES
> -> SNK_READY path to SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_READY
> accordingly. Otherwise, the sink port will never change to SNK_READY state
> if the source does't have PD capability.
>=20
> [  503.547183] pending state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAP=
ABILITIES_TIMEOUT @ 310 ms [rev3 NONE_AMS]
> [  503.857239] state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILITIE=
S_TIMEOUT [delayed 310 ms]
> [  503.857254] PD TX, header: 0x87
> [  503.862440] PD TX complete, status: 2
> [  503.862484] state change SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_UNATTACH=
ED [rev3 NONE_AMS]
>=20
> Fixes: 122968f8dda8 ("usb: typec: tcpm: avoid resets for missing source c=
apability messages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/usb/typec/tcpm/tcpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 26f9006e95e1..cce39818e99a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4515,7 +4515,7 @@ static inline enum tcpm_state hard_reset_state(stru=
ct tcpm_port *port)
>  		return ERROR_RECOVERY;
>  	if (port->pwr_role =3D=3D TYPEC_SOURCE)
>  		return SRC_UNATTACHED;
> -	if (port->state =3D=3D SNK_WAIT_CAPABILITIES)
> +	if (port->state =3D=3D SNK_WAIT_CAPABILITIES_TIMEOUT)
>  		return SNK_READY;
>  	return SNK_UNATTACHED;
>  }
> --=20
> 2.34.1
>=20

--xdre7bjtvphpkror
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmas/pAACgkQ2O7X88g7
+pqHRg//e8sk4hIopBO3ivUJbsltt8010iXDzs8ZODpe/Ooc4NXeOZpiqaIzwbSy
T8JwCwVLEiHLrWtICseVC0358U+iCUD2Z+DLXi2+vr//o1cb6Pdb1j8HkSWfQGf1
nFuE0Kbn1icdRjDDNpoVaZGvxaoHw/BjOZA6V/gwE7PjRYTp0qJ5NhE7wK1wHGTm
UeBQ5qWAA4o00yLTc6boGBWsZbSKrK66OfvH31hXJFnRpp3nXIaoOdvwPObWnyY/
l9rGLiFS7AEAbbAvyHHeQbfm0C54bVj0Kle23hxME9ESimPHXJl3XscErlD4gSbu
Kus5bH0Wo26cncwjsd9hugHdbI8Q+jrq38+ty8db5qlYnKYiR2+MvXVD6TFUHE+j
R8Wo3DIqa3/tF32W8LwamEdvEKSCdB42hmuzl3okTqyRR25f49i+Y7bLem1b1k0f
i1ZNuvrJ9IoCP8N5cxYioNvXcosK4rBOCC1Xm18hATsd1NhF64vc2VoeZYDWZIro
a8ZqoPcOQMYbHa5/BfhWRaqZRIf75Y4EVTbyxy9h/7R4okfmVMCH4Rx9E88GntEs
yLvOqxTPtjjVqeuLDB2arsf+I44L+fmKNzriR12eEMYmonrhVymuGkpaB4vEiQpl
JFaTmS3u0WewKLz93efr0WPrCYXhL58V6G2e+WAelYKJIg9e3Es=
=hDoO
-----END PGP SIGNATURE-----

--xdre7bjtvphpkror--

