Return-Path: <linux-usb+bounces-11370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C0B90B631
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 18:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A2FBB2E961
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 15:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDFF155A56;
	Mon, 17 Jun 2024 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GMKN27UH"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E9155C85
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634537; cv=none; b=lpKGOEn5CXRXfo3tYcYZpUWCYq6EiDnthxJRikwiyV1koAUH0qnZZBVHoSFtXu+rIDWBORt5DTwecuqObYWxS18uzyom0LnR9KOKGC2Yt7w9H6pKqR1SFfbhuBB6qD9Figi404WcysndKRaCUVZ++PNqlc+Na3YdSP4ptFAskAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634537; c=relaxed/simple;
	bh=IvAzEYSqjp955nxuHYqD3GwR+NTLpNNY0SVZEjurZrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plJG/yf9Dyc+AhOlS5/ltyApXRJb4mqK+yFoeUC3pixjFMrJ/LtSjKh3TvZE+tOyMonyLAXmjk8+IFR1INt+wvigudQcQSJLw8Pq/h0GYO+8wzXfkYlKaXYUIr90ok+sW4uzzYwbzZ9IbIB/YrSZRdasfa2pTqL2/xkGGR3u2H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GMKN27UH; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718634534;
	bh=IvAzEYSqjp955nxuHYqD3GwR+NTLpNNY0SVZEjurZrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMKN27UHcD81efpg0WI3EtyXpuI0XMFlIuhaBwuMeAAjW2YY2nCkH/8iXpZemXMTI
	 X8JDNuT4MSeZK/uikrbaUqvSluRVCJYLbQftm6JOPcAksnL84qX07mS8h/1jdlC6Pd
	 +wxk9zatQa7orEbKinA8/ADKCBOzLyfAG/J4Y7RgToQSFPiXI2lwT8tRW5QpzqrK/j
	 IJODBABhONBmvZiS4wflH9Hs737hhQpChZGd/s11VInp+wRsj+lcE1kxDJFeVCPOPZ
	 MCrDTE3HSF0JqZ6a8QVj78LWK9PZ67tib4ksQlBFJnsEqBC540GObe/tLzoqdc00wX
	 1MX8tDR47NoFA==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 260DA37812FD;
	Mon, 17 Jun 2024 14:28:54 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id BC7C01060734; Mon, 17 Jun 2024 16:28:53 +0200 (CEST)
Date: Mon, 17 Jun 2024 16:28:53 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: psy: Expose the charge-type property
Message-ID: <3qqzailo3ewq53ozmpnarlcb5zqhi2afeivb4ptszwhtygq3bd@l3jyosbcekxk>
References: <20240617105554.1677285-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cnv6rlkh26lqzka2"
Content-Disposition: inline
In-Reply-To: <20240617105554.1677285-1-heikki.krogerus@linux.intel.com>


--cnv6rlkh26lqzka2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 17, 2024 at 01:55:54PM GMT, Heikki Krogerus wrote:
> UCSI has this information in the Battery Charging Capability
> Status, so making it available for the user.
>=20
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/usb/typec/ucsi/psy.c  | 27 +++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c |  3 +++
>  2 files changed, 30 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index b35c6e07911e..b3910f37e171 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -20,6 +20,7 @@ enum ucsi_psy_online_states {
>  };
> =20
>  static enum power_supply_property ucsi_psy_props[] =3D {
> +	POWER_SUPPLY_PROP_CHARGE_TYPE,
>  	POWER_SUPPLY_PROP_USB_TYPE,
>  	POWER_SUPPLY_PROP_ONLINE,
>  	POWER_SUPPLY_PROP_VOLTAGE_MIN,
> @@ -194,6 +195,30 @@ static int ucsi_psy_get_usb_type(struct ucsi_connect=
or *con,
>  	return 0;
>  }
> =20
> +static int ucsi_psy_get_charge_type(struct ucsi_connector *con, union po=
wer_supply_propval *val)
> +{
> +	if (!(con->status.flags & UCSI_CONSTAT_CONNECTED) ||
> +	    (con->status.flags & UCSI_CONSTAT_PWR_DIR) !=3D TYPEC_SINK) {
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
> +		return 0;
> +	}
> +
> +	switch (UCSI_CONSTAT_BC_STATUS(con->status.pwr_status)) {
> +	case UCSI_CONSTAT_BC_NOMINAL_CHARGING:
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +		break;
> +	case UCSI_CONSTAT_BC_SLOW_CHARGING:
> +	case UCSI_CONSTAT_BC_TRICKLE_CHARGING:
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> +		break;
> +	default:
> +		val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ucsi_psy_get_prop(struct power_supply *psy,
>  			     enum power_supply_property psp,
>  			     union power_supply_propval *val)
> @@ -201,6 +226,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
>  	struct ucsi_connector *con =3D power_supply_get_drvdata(psy);
> =20
>  	switch (psp) {
> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
> +		return ucsi_psy_get_charge_type(con, val);
>  	case POWER_SUPPLY_PROP_USB_TYPE:
>  		return ucsi_psy_get_usb_type(con, val);
>  	case POWER_SUPPLY_PROP_ONLINE:
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 6bbaad4b89a5..51135e3502cf 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1257,6 +1257,9 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>  	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
>  		ucsi_partner_task(con, ucsi_check_altmodes, 1, HZ);
> =20
> +	if (con->status.change & UCSI_CONSTAT_BC_CHANGE)
> +		ucsi_port_psy_changed(con);
> +
>  out_unlock:
>  	mutex_unlock(&con->lock);
>  }
> --=20
> 2.43.0
>=20

--cnv6rlkh26lqzka2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZwSB0ACgkQ2O7X88g7
+poH5A//VGQdyBS1/E8UtvZeJcUW8nZsdHtosjVrTabhd/byiRcxk4LxwAfMycQh
PicL7RA4LfRKL1gmbhyhTbglLu5VvaCHBBqaAC4moINWN/iIqtpl/gsyrfCykkNr
Toz8aw+FbbgpOHPbkX+VIYv5PXWbDP2E2pdiNcUN7kLVkY4vFAMyzb4d/v8ixIhY
19cowlsPRovR9CUs8hxNTs1mJE/satg8aD/rq8NdPlsafXFrUtuZV1o/X8iKUn4J
1IkiHMB/nFYDwpyl2BndHGoE8d8qsFSqL8sojGYPp4qv0/ujrYpBPDapkZoEJGaE
AOWLrVezPMLeLsb3yQZ7plXX0vnHuTEc7jppEyCoG2Cv0Ttq+9iLX9sKOBJFa3zZ
OZ54oohBUfg3DyqVb+OpXdcUUv+U5aoolYcgbE+DlXmrgBeRwamyaN9soLYng046
e72r7ivbPjCL8dpaS6q0xXmrz9XKy4cD7zIB2e0zxIRbCmXxBQMf/7lr3cUAcqHD
q0povLZIXXOwv0u9motAU7Es/nS4jlz2RK0Rs7DLkFSh6QGFwiXOkTEksaN5XcML
5iuQdk4d4iNevlDOeiFMy47XuODMgcjaskrbktFYj+0W4hZMgMPdyNGZ6611xLu3
2ykhiLy2vgxNeQBQNgUFAU8y+lwwGNxAtViuDtGS/yTu0pA4SaY=
=WKtl
-----END PGP SIGNATURE-----

--cnv6rlkh26lqzka2--

