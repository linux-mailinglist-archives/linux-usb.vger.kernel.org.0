Return-Path: <linux-usb+bounces-36656-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGOiA0Qo8WmAeAEAu9opvQ
	(envelope-from <linux-usb+bounces-36656-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 23:36:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683A48C589
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 23:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF735302A6C2
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 21:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF7D3C2775;
	Tue, 28 Apr 2026 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwnC3Lsf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B22E8DE3;
	Tue, 28 Apr 2026 21:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412158; cv=none; b=nGPGWhClZnELmrT0I0nlMS18QW4qth+Zpxe3u24iaCCgOjMz2pmS21PyhEXDyHUcelhimg/AmpPgxM9b8iScejXEp6m65Z96sjGKvugizUITCA8nkSe1vu97pqPTcynOz7oLH3/5RKLG+tD2JOgNJ6N4dzZplRLU0bMtiBVU8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412158; c=relaxed/simple;
	bh=4WF/96wjnOrMMUrAFfoOywj5EFUl8oXxhUnuXCwOogE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgT+gpbnyw7J1xCFOQocNmIXekUwRF6dnVNfFjT0uW2u0/74JJQZJE96bcIymx5Vm1KWW1bQzZz7FMRIb6d3oVCGdEDBHfrS19bXMaT2Z0dypRHdNS+qGG6HO+oc5UTXyv9Rdewt0o4+SkC35ZK6ErBE89QFPW3WBqkC3jgt17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwnC3Lsf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B926DC2BCAF;
	Tue, 28 Apr 2026 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777412157;
	bh=4WF/96wjnOrMMUrAFfoOywj5EFUl8oXxhUnuXCwOogE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FwnC3LsfMBcgkbdu5ezB9EAvkyjyZxI+PWh3R9OjsI+IDpZtXQAF+K9MLqK+tFID4
	 R7HP8i5tCt6x9+NEjMs18zuqSiVjqAQYBU/8fIuOEaM51qHu2YmtgSgrx0zmTjI1kZ
	 geG8nCjQLQAp7AmgFrd/TSsc0GuIDiXqDuVhL997jh0BfBRFugt7/mOCEoG6iNcIoX
	 tpux+r9HQa+7+kRW9UPr1muGm3oTuHllW8TIq4LqcBLOtCbburZ2RY08ZH50/x+ibg
	 qpN0K6lQiSkDagzwdt9lNr6A8vA5W/hyvsrm7i2eqBIFWHGpNAYwOtPMCsVPVc81+M
	 EvTogoz/IjHyQ==
Received: by venus (Postfix, from userid 1000)
	id 1743C182957; Tue, 28 Apr 2026 23:35:56 +0200 (CEST)
Date: Tue, 28 Apr 2026 23:35:55 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	usb4-upstream@oss.qualcomm.com, Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Jack Pham <jack.pham@oss.qualcomm.com>
Subject: Re: [PATCH] usb: typec: mux: ps883x: Power the retimer off when not
 in use
Message-ID: <afEoAvbgzDvFbKo3@venus>
References: <20260420-topic-ps883x_unused_reset-v1-1-7aabf7004d2a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k323naxkp6axmw45"
Content-Disposition: inline
In-Reply-To: <20260420-topic-ps883x_unused_reset-v1-1-7aabf7004d2a@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6683A48C589
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36656-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sre@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]


--k323naxkp6axmw45
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: typec: mux: ps883x: Power the retimer off when not
 in use
MIME-Version: 1.0

Hi,

On Mon, Apr 20, 2026 at 01:40:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> When there's nothing going through the retimer, there's no reason to
> keep it online. Put it in reset when possible to save power.
>=20
> Also, remove the register cache-compare optimization as it makes little
> sense now that the chip resets during almost all transitions and
> tracking the validity of that cache becomes a headache.
>=20
> Suggested-by: Jack Pham <jack.pham@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Note most of the diff happens to be there because I need to move
> ps883x_(en/dis)able_vregs() around..
> ---

Tested-by: Sebastian Reichel <sre@kernel.org> # T14s Gen6 Snapdragon

Greetings,

-- Sebastian

>  drivers/usb/typec/mux/ps883x.c | 196 ++++++++++++++++++++++++-----------=
------
>  1 file changed, 114 insertions(+), 82 deletions(-)
>=20
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883=
x.c
> index 1256252eceed..f52443638ee2 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -61,19 +61,110 @@ struct ps883x_retimer {
>  	struct mutex lock; /* protect non-concurrent retimer & switch */
> =20
>  	enum typec_orientation orientation;
> -	u8 cfg0;
> -	u8 cfg1;
> -	u8 cfg2;
> +	bool in_reset;
>  };
> =20
> +static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
> +{
> +	struct device *dev =3D &retimer->client->dev;
> +	int ret;
> +
> +	ret =3D regulator_enable(retimer->vdd33_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D regulator_enable(retimer->vdd33_cap_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
> +		goto err_vdd33_disable;
> +	}
> +
> +	usleep_range(4000, 10000);
> +
> +	ret =3D regulator_enable(retimer->vdd_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
> +		goto err_vdd33_cap_disable;
> +	}
> +
> +	ret =3D regulator_enable(retimer->vddar_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
> +		goto err_vdd_disable;
> +	}
> +
> +	ret =3D regulator_enable(retimer->vddat_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
> +		goto err_vddar_disable;
> +	}
> +
> +	ret =3D regulator_enable(retimer->vddio_supply);
> +	if (ret) {
> +		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
> +		goto err_vddat_disable;
> +	}
> +
> +	return 0;
> +
> +err_vddat_disable:
> +	regulator_disable(retimer->vddat_supply);
> +err_vddar_disable:
> +	regulator_disable(retimer->vddar_supply);
> +err_vdd_disable:
> +	regulator_disable(retimer->vdd_supply);
> +err_vdd33_cap_disable:
> +	regulator_disable(retimer->vdd33_cap_supply);
> +err_vdd33_disable:
> +	regulator_disable(retimer->vdd33_supply);
> +
> +	return ret;
> +}
> +
> +static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
> +{
> +	regulator_disable(retimer->vddio_supply);
> +	regulator_disable(retimer->vddat_supply);
> +	regulator_disable(retimer->vddar_supply);
> +	regulator_disable(retimer->vdd_supply);
> +	regulator_disable(retimer->vdd33_cap_supply);
> +	regulator_disable(retimer->vdd33_supply);
> +}
> +
> +static void ps883x_reset(struct ps883x_retimer *retimer)
> +{
> +	if (retimer->in_reset)
> +		return;
> +
> +	gpiod_set_value(retimer->reset_gpio, 1);
> +	ps883x_disable_vregs(retimer);
> +	retimer->in_reset =3D true;
> +}
> +
>  static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
> -			    int cfg1, int cfg2)
> +			    int cfg1, int cfg2, bool reset)
>  {
>  	struct device *dev =3D &retimer->client->dev;
>  	int ret;
> =20
> -	if (retimer->cfg0 =3D=3D cfg0 && retimer->cfg1 =3D=3D cfg1 && retimer->=
cfg2 =3D=3D cfg2)
> +	if (reset) {
> +		ps883x_reset(retimer);
> +
>  		return 0;
> +	} else if (retimer->in_reset) {
> +		ret =3D ps883x_enable_vregs(retimer);
> +		if (ret)
> +			return ret;
> +
> +		gpiod_set_value(retimer->reset_gpio, 0);
> +
> +		/* firmware initialization delay */
> +		msleep(60);
> +
> +		retimer->in_reset =3D false;
> +	}
> =20
>  	ret =3D regmap_write(retimer->regmap, REG_USB_PORT_CONN_STATUS_0, cfg0);
>  	if (ret) {
> @@ -93,10 +184,6 @@ static int ps883x_configure(struct ps883x_retimer *re=
timer, int cfg0,
>  		return ret;
>  	}
> =20
> -	retimer->cfg0 =3D cfg0;
> -	retimer->cfg1 =3D cfg1;
> -	retimer->cfg2 =3D cfg2;
> -
>  	return 0;
>  }
> =20
> @@ -107,6 +194,7 @@ static int ps883x_set(struct ps883x_retimer *retimer,=
 struct typec_retimer_state
>  	int cfg0 =3D CONN_STATUS_0_CONNECTION_PRESENT;
>  	int cfg1 =3D 0x00;
>  	int cfg2 =3D 0x00;
> +	bool reset =3D false;
> =20
>  	if (retimer->orientation =3D=3D TYPEC_ORIENTATION_REVERSE)
>  		cfg0 |=3D CONN_STATUS_0_ORIENTATION_REVERSED;
> @@ -148,9 +236,13 @@ static int ps883x_set(struct ps883x_retimer *retimer=
, struct typec_retimer_state
>  		}
>  	} else {
>  		switch (state->mode) {
> +		/* SAFE can be transient or point to an actual disconnect */
>  		case TYPEC_STATE_SAFE:
> +			reset =3D retimer->orientation =3D=3D TYPEC_ORIENTATION_NONE;
> +			break;
>  		/* USB2 pins don't even go through this chip */
>  		case TYPEC_MODE_USB2:
> +			reset =3D true;
>  			break;
>  		case TYPEC_STATE_USB:
>  		case TYPEC_MODE_USB3:
> @@ -171,7 +263,7 @@ static int ps883x_set(struct ps883x_retimer *retimer,=
 struct typec_retimer_state
>  		}
>  	}
> =20
> -	return ps883x_configure(retimer, cfg0, cfg1, cfg2);
> +	return ps883x_configure(retimer, cfg0, cfg1, cfg2, reset);
>  }
> =20
>  static int ps883x_sw_set(struct typec_switch_dev *sw,
> @@ -184,11 +276,19 @@ static int ps883x_sw_set(struct typec_switch_dev *s=
w,
>  	if (ret)
>  		return ret;
> =20
> -	mutex_lock(&retimer->lock);
> +	guard(mutex)(&retimer->lock);
> =20
>  	if (retimer->orientation !=3D orientation) {
>  		retimer->orientation =3D orientation;
> =20
> +		/*
> +		 * Orientation notifications usually come prior to mode switch
> +		 * events. If the retimer is already in reset, we still want to
> +		 * cache the new orientation value for the subsequent ps883x_set().
> +		 */
> +		if (retimer->in_reset)
> +			return 0;
> +
>  		ret =3D regmap_assign_bits(retimer->regmap, REG_USB_PORT_CONN_STATUS_0,
>  					 CONN_STATUS_0_ORIENTATION_REVERSED,
>  					 orientation =3D=3D TYPEC_ORIENTATION_REVERSE);
> @@ -196,8 +296,6 @@ static int ps883x_sw_set(struct typec_switch_dev *sw,
>  			dev_err(&retimer->client->dev, "failed to set orientation: %d\n", ret=
);
>  	}
> =20
> -	mutex_unlock(&retimer->lock);
> -
>  	return ret;
>  }
> =20
> @@ -222,75 +320,6 @@ static int ps883x_retimer_set(struct typec_retimer *=
rtmr,
>  	return typec_mux_set(retimer->typec_mux, &mux_state);
>  }
> =20
> -static int ps883x_enable_vregs(struct ps883x_retimer *retimer)
> -{
> -	struct device *dev =3D &retimer->client->dev;
> -	int ret;
> -
> -	ret =3D regulator_enable(retimer->vdd33_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD 3.3V regulator: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D regulator_enable(retimer->vdd33_cap_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD 3.3V CAP regulator: %d\n", ret);
> -		goto err_vdd33_disable;
> -	}
> -
> -	usleep_range(4000, 10000);
> -
> -	ret =3D regulator_enable(retimer->vdd_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD regulator: %d\n", ret);
> -		goto err_vdd33_cap_disable;
> -	}
> -
> -	ret =3D regulator_enable(retimer->vddar_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD AR regulator: %d\n", ret);
> -		goto err_vdd_disable;
> -	}
> -
> -	ret =3D regulator_enable(retimer->vddat_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD AT regulator: %d\n", ret);
> -		goto err_vddar_disable;
> -	}
> -
> -	ret =3D regulator_enable(retimer->vddio_supply);
> -	if (ret) {
> -		dev_err(dev, "cannot enable VDD IO regulator: %d\n", ret);
> -		goto err_vddat_disable;
> -	}
> -
> -	return 0;
> -
> -err_vddat_disable:
> -	regulator_disable(retimer->vddat_supply);
> -err_vddar_disable:
> -	regulator_disable(retimer->vddar_supply);
> -err_vdd_disable:
> -	regulator_disable(retimer->vdd_supply);
> -err_vdd33_cap_disable:
> -	regulator_disable(retimer->vdd33_cap_supply);
> -err_vdd33_disable:
> -	regulator_disable(retimer->vdd33_supply);
> -
> -	return ret;
> -}
> -
> -static void ps883x_disable_vregs(struct ps883x_retimer *retimer)
> -{
> -	regulator_disable(retimer->vddio_supply);
> -	regulator_disable(retimer->vddat_supply);
> -	regulator_disable(retimer->vddar_supply);
> -	regulator_disable(retimer->vdd_supply);
> -	regulator_disable(retimer->vdd33_cap_supply);
> -	regulator_disable(retimer->vdd33_supply);
> -}
> -
>  static int ps883x_get_vregs(struct ps883x_retimer *retimer)
>  {
>  	struct device *dev =3D &retimer->client->dev;
> @@ -422,6 +451,9 @@ static int ps883x_retimer_probe(struct i2c_client *cl=
ient)
>  		}
>  	}
> =20
> +	/* Keep the retimer in reset until a Type-C notification comes */
> +	ps883x_reset(retimer);
> +
>  	sw_desc.drvdata =3D retimer;
>  	sw_desc.fwnode =3D dev_fwnode(dev);
>  	sw_desc.set =3D ps883x_sw_set;
>=20
> ---
> base-commit: c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
> change-id: 20260420-topic-ps883x_unused_reset-9af0909cefac
>=20
> Best regards,
> --=20
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
>=20

--k323naxkp6axmw45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmnxKDgACgkQ2O7X88g7
+przRQ/+JsrZ1UlHL6mePbTo2gdVfYOXP/I75Z8p6xKg0ywaGFFNQEZjxeF97JWc
EONsfthfTKz3jjwwZBTw1CZf/wlryLKRWD0eo/VlCrxLrjYKbE/prgoLQqSgS3vV
1XpEkEDN5nXeHf1NcU+1QkFdZ5gmErki/yF5aBXnVT2SFDU2vQIGO69jjigwR6Zc
tCIzAshW81k0tL9v68FX/SuxAG8XT92h/wOF7mIP2tqyvI3LFFr2J1jDAl5n9nLM
DlZFzjsBMf3PvcZzoKdsJJD9ErytEh0nf8plGZrb9An87OcFLocQ3AantK91vTbI
BZiEvmH7rPInHaHABumvBXh7F3s5oc0QuLkvov162+o9vlTMDE+w4AuTWJdlWnFF
aTkV17FC51l+6P2D8zECjy/aU/fdJfiSKIp2mmRYxsO7NzBgDR1v8TIwkxzSlgOp
vzULDD7Hv22dByP80K3icVlkCrlM/Q0oZ0H/IFu+2+munJoPcQaiJXgA4PKGXd5P
VxgH4ZtfftcHJROGxcKJTpsRfgMNg8TJfmz/ds0TfRauzisBPJZiOSbtOHNmDgdx
/B3CnG0TtovlyfLiPSDgb1t7FcHnhS3uaoimQ/tqcfoa9F0O2V2P5WjHBsGNilWf
oM1oka4en6O5U+pUXl6Eup1/jBi44BugN0+o871Do6HqzR7T0kw=
=OdeZ
-----END PGP SIGNATURE-----

--k323naxkp6axmw45--

