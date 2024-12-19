Return-Path: <linux-usb+bounces-18666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C81089F71CC
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 02:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12CE91688EB
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 01:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC831433CE;
	Thu, 19 Dec 2024 01:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DcOUEHCR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1613AC1
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 01:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571915; cv=none; b=dShi5KA/3xe0f4A/P85XDSRi1vV/p5hNidnhwStigxaEviwNTx5DMOj2O/pi8DFpdQtwgPY+9SOsU5Ee1d2MJf+y9ZL8WeeYBFJtCc54yVGuKEIN2K/Vd/N2WG3TkSpwpGnxazjQ5WCrCN56xdZ7qIBOARg3e6eOuad8XEkkGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571915; c=relaxed/simple;
	bh=bUvONEZA3OLVoEyo4UdyQ4yLetDCZDuZ3+gIErX1dq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDtvwBQELtMhq2c4A/OX727qGf7XL8T3xR80gBAnotvPLCDWc8BMLxfnujS3vXn/AaDIM0bDaIt6TUrPNP1N/1G7St2KKIU0LHIo63RaEPHvOQ3uqw6objyrDG/6enUj+szIAjCMJ4jURrxrmr8NQAyXYpxnleA7lyao9uF5Aec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DcOUEHCR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2167141dfa1so2550815ad.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 17:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571913; x=1735176713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OdwE90uht9jBwxmpYSg7VZGKoIqGtArfw5Ct4ZZ+J6A=;
        b=DcOUEHCRrx6SbjmxxtJryJ5gmcMP3u+5xvkdDMAqoe7w2BjSLe/jdOMjk3G25w7ZqH
         tpnD5ECmwbknUFDkpstMfJI/9fYD2Mz6GkBzXe5SgU52BdMNyJF1wBafxrSrRGgOtzYu
         pHO0ZJ1l87wayyxv2Waz69QVp34mk26RUaToRxqEVzPVb4aTVG9VUkxeVzDRLKBSQ/ie
         mSO0T9bnCTOIhrvVp36gr+GnEEcnO9WYF68W/Ccq3ni1jnS16zAF6/609nimZ7S/3Sel
         Kr/bJdfVmgUrdDdWQK7HVsQSl6tev1kwilxUDadR5WdfJgpUpMzNOUVIOvxL6X8DyYX5
         fbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571913; x=1735176713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdwE90uht9jBwxmpYSg7VZGKoIqGtArfw5Ct4ZZ+J6A=;
        b=a9ljhDS/VDZI41ioP0s53RcKEj1sKzugNjYFx5bbV69CU/H7JSU20w4iokb3HxItB6
         LjDA26vCzmmhQNXLp82DnpwmAPEEJD/bETCwdVKPQHQvSCO6Zue63BG2eL7TmFJzvtF4
         72mbfkCV9xXA0QakVJjEu7lHmy1/FM8oMSVgYqvFBb9ANVDo/8w4jpMAWz9k2X2gH02z
         wAh68DE7BdncTiZxaxNxTUENqM0pFc+izxvZ7r73LafnTZtIXaf0P/2qeqs1teT72vpG
         M2cOd7bzV12+9Q/BTupyhBhefG4DbmY9x+YxOyiWKzHgxE54ZbUs6KeF4Orw7W07/EC0
         jEqA==
X-Forwarded-Encrypted: i=1; AJvYcCWOV1pnowAEGDXRxHN4YW0L6Ykj3T0n5PiUqy+f+1BRdxWHj2x0XQzd8+RKFNL7HVoPqkZ/xeTbHFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUa/rfcfsEFlGbO+KM60RW2KTLc6/le/YCX98nBsdAfJiM1nIv
	u2xwtw6aMDYLmVS82f1UInjUkq8MuImFue70QHpFbntHLBgeQJukZxA6U6tFsg==
X-Gm-Gg: ASbGnct1Fp19G9e09BfbDQkz8CFwSbu0DUi4mz+VZUmBO4CTpE81zLzXD/RhEnyZERb
	toq/9ab9lGrvWJw2gZit6d1BmyvJwfxIpbXfKfyntshUceG1LcnpBf+BbKRkgPMjj1QyoB0ce6H
	QjVOW+Vr+QwVQM+bhEOhLee1vUx7oCFH1WQNlQE2WOCKjXOUWNEQ61nd3ggIW0uNLHrlIkEbM4V
	RmQG+yQ1/mh8kX9bG1Gd8xU7SHzFR4pxQSYcYQzfEitquYrmXzAsF6CsM9iQWNWdCEqlthkQotR
	bT0my/De3EbK9Ann
X-Google-Smtp-Source: AGHT+IHdAl85Tc0d95lg8SPjbfiPYFq6g+pCNhSIZqOygfLDCYRSb5pvs+f/vaqCov10dRh30Wk19Q==
X-Received: by 2002:a17:902:d589:b0:215:ae61:27ca with SMTP id d9443c01a7336-219da7f855bmr23142535ad.26.1734571912186;
        Wed, 18 Dec 2024 17:31:52 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9705ccsm1782875ad.92.2024.12.18.17.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:31:50 -0800 (PST)
Date: Thu, 19 Dec 2024 01:31:46 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt
 support
Message-ID: <Z2N3ggIJVo9gaOfj@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dDy4ikmXkNHiRafN"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>


--dDy4ikmXkNHiRafN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:48PM -0800, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting Thunderbolt alt-mode using AP
> driven alt-mode.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> (no changes since v4)
>=20
> Changes in v4:
> - Update Makefile + Kconfig to use CONFIG_CROS_EC_TYPEC_ALTMODES
> - Add locking in vdm function
>=20
> Changes in v3:
> - Fix usage of TBT sid and mode.
> - Removed unused vdm operations during altmode registration
>=20
> Changes in v2:
> - Refactored thunderbolt support into cros_typec_altmode.c
>=20
>  drivers/platform/chrome/Kconfig              |  1 +
>  drivers/platform/chrome/cros_ec_typec.c      | 23 ++---
>  drivers/platform/chrome/cros_typec_altmode.c | 88 ++++++++++++++++++++
>  drivers/platform/chrome/cros_typec_altmode.h | 14 ++++
>  4 files changed, 115 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kc=
onfig
> index 23aa594fbb5b..1b2f2bd09662 100644
> --- a/drivers/platform/chrome/Kconfig
> +++ b/drivers/platform/chrome/Kconfig
> @@ -249,6 +249,7 @@ config CROS_EC_TYPEC
>  	depends on USB_ROLE_SWITCH
>  	default MFD_CROS_EC_DEV
>  	select CROS_EC_TYPEC_ALTMODES if TYPEC_DP_ALTMODE
> +	select CROS_EC_TYPEC_ALTMODES if TYPEC_TBT_ALTMODE
>  	help
>  	  If you say Y here, you get support for accessing Type C connector
>  	  information from the Chrome OS EC.
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 1bcaa7269395..1ac5798d887f 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -303,18 +303,19 @@ static int cros_typec_register_port_altmodes(struct=
 cros_typec_data *typec,
> =20
>  	/*
>  	 * Register TBT compatibility alt mode. The EC will not enter the mode
> -	 * if it doesn't support it, so it's safe to register it unconditionally
> -	 * here for now.
> +	 * if it doesn't support it and it will not enter automatically by
> +	 * design so we can use the |ap_driven_altmode| feature to check if we
> +	 * should register it.
>  	 */
> -	memset(&desc, 0, sizeof(desc));
> -	desc.svid =3D USB_TYPEC_TBT_SID;
> -	desc.mode =3D TYPEC_ANY_MODE;
> -	amode =3D typec_port_register_altmode(port->port, &desc);
> -	if (IS_ERR(amode))
> -		return PTR_ERR(amode);
> -	port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> -	typec_altmode_set_drvdata(amode, port);
> -	amode->ops =3D &port_amode_ops;
> +	if (typec->ap_driven_altmode) {
> +		memset(&desc, 0, sizeof(desc));
> +		desc.svid =3D USB_TYPEC_TBT_SID;
> +		desc.mode =3D TBT_MODE;
> +		amode =3D cros_typec_register_thunderbolt(port, &desc);
> +		if (IS_ERR(amode))
> +			return PTR_ERR(amode);
> +		port->port_altmode[CROS_EC_ALTMODE_TBT] =3D amode;
> +	}
> =20
>  	port->state.alt =3D NULL;
>  	port->state.mode =3D TYPEC_STATE_USB;
> diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platf=
orm/chrome/cros_typec_altmode.c
> index 6e736168ccc3..557340b53af0 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.c
> +++ b/drivers/platform/chrome/cros_typec_altmode.c
> @@ -10,6 +10,7 @@
>  #include <linux/mutex.h>
>  #include <linux/workqueue.h>
>  #include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_tbt.h>
>  #include <linux/usb/pd_vdo.h>
> =20
>  #include "cros_typec_altmode.h"
> @@ -72,6 +73,8 @@ static int cros_typec_altmode_enter(struct typec_altmod=
e *alt, u32 *vdo)
> =20
>  	if (adata->sid =3D=3D USB_TYPEC_DP_SID)
>  		req.mode_to_enter =3D CROS_EC_ALTMODE_DP;
> +	else if (adata->sid =3D=3D USB_TYPEC_TBT_SID)
> +		req.mode_to_enter =3D CROS_EC_ALTMODE_TBT;
>  	else
>  		return -EOPNOTSUPP;
> =20
> @@ -196,6 +199,56 @@ static int cros_typec_displayport_vdm(struct typec_a=
ltmode *alt, u32 header,
>  	return 0;
>  }
> =20
> +static int cros_typec_thunderbolt_vdm(struct typec_altmode *alt, u32 hea=
der,
> +				      const u32 *data, int count)
> +{
> +	struct cros_typec_altmode_data *adata =3D typec_altmode_get_drvdata(alt=
);
> +
> +	int cmd_type =3D PD_VDO_CMDT(header);
> +	int cmd =3D PD_VDO_CMD(header);
> +	int svdm_version;
> +
> +	svdm_version =3D typec_altmode_get_svdm_version(alt);
> +	if (svdm_version < 0)
> +		return svdm_version;
> +
> +	mutex_lock(&adata->lock);
> +
> +	switch (cmd_type) {
> +	case CMDT_INIT:
> +		if (PD_VDO_SVDM_VER(header) < svdm_version) {
> +			typec_partner_set_svdm_version(adata->port->partner,
> +						       PD_VDO_SVDM_VER(header));
> +			svdm_version =3D PD_VDO_SVDM_VER(header);
> +		}
> +
> +		adata->header =3D VDO(adata->sid, 1, svdm_version, cmd);
> +		adata->header |=3D VDO_OPOS(adata->mode);
> +
> +		switch (cmd) {
> +		case CMD_ENTER_MODE:
> +			/* Don't respond to the enter mode vdm because it
> +			 * triggers mux configuration. This is handled directly
> +			 * by the cros_ec_typec driver so the Thunderbolt driver
> +			 * doesn't need to be involved.
> +			 */
> +			break;
> +		default:
> +			adata->header |=3D VDO_CMDT(CMDT_RSP_ACK);
> +			schedule_work(&adata->work);
> +			break;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mutex_unlock(&adata->lock);
> +	return 0;
> +}
> +
> +
>  static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
>  				      const u32 *data, int count)
>  {
> @@ -207,6 +260,9 @@ static int cros_typec_altmode_vdm(struct typec_altmod=
e *alt, u32 header,
>  	if (adata->sid =3D=3D USB_TYPEC_DP_SID)
>  		return cros_typec_displayport_vdm(alt, header, data, count);
> =20
> +	if (adata->sid =3D=3D USB_TYPEC_TBT_SID)
> +		return cros_typec_thunderbolt_vdm(alt, header, data, count);
> +
>  	return -EINVAL;
>  }
> =20
> @@ -283,3 +339,35 @@ cros_typec_register_displayport(struct cros_typec_po=
rt *port,
>  	return alt;
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc)
> +{
> +	struct typec_altmode *alt;
> +	struct cros_typec_altmode_data *adata;
> +
> +	alt =3D typec_port_register_altmode(port->port, desc);
> +	if (IS_ERR(alt))
> +		return alt;
> +
> +	adata =3D devm_kzalloc(&alt->dev, sizeof(*adata), GFP_KERNEL);
> +	if (!adata) {
> +		typec_unregister_altmode(alt);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	INIT_WORK(&adata->work, cros_typec_altmode_work);
> +	adata->alt =3D alt;
> +	adata->port =3D port;
> +	adata->ap_mode_entry =3D true;
> +	adata->sid =3D desc->svid;
> +	adata->mode =3D desc->mode;
> +
> +	typec_altmode_set_ops(alt, &cros_typec_altmode_ops);
> +	typec_altmode_set_drvdata(alt, adata);
> +
> +	return alt;
> +}
> +#endif
> diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platf=
orm/chrome/cros_typec_altmode.h
> index ed00ee7a402b..3f2aa95d065a 100644
> --- a/drivers/platform/chrome/cros_typec_altmode.h
> +++ b/drivers/platform/chrome/cros_typec_altmode.h
> @@ -34,4 +34,18 @@ static inline int cros_typec_displayport_status_update=
(struct typec_altmode *alt
>  	return 0;
>  }
>  #endif
> +
> +#if IS_ENABLED(CONFIG_TYPEC_TBT_ALTMODE)
> +struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc);
> +#else
> +static inline struct typec_altmode *
> +cros_typec_register_thunderbolt(struct cros_typec_port *port,
> +				struct typec_altmode_desc *desc)
> +{
> +	return typec_port_register_altmode(port->port, desc);
> +}
> +#endif
> +
>  #endif /* __CROS_TYPEC_ALTMODE_H__ */
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--dDy4ikmXkNHiRafN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N3ggAKCRBzbaomhzOw
wnz3AQCBaiHbQ/YooZ/o0NvSunjo9KHNeuJX5ALK9nogiFuIRAEAyieuKVMh2I2Y
6XTA7uXsLuYwN0eSiFLncDSJJ685gAg=
=nUp8
-----END PGP SIGNATURE-----

--dDy4ikmXkNHiRafN--

