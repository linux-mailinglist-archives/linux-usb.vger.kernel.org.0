Return-Path: <linux-usb+bounces-7965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D0587C6B6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 01:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467A81C21269
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 00:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F90228FC;
	Fri, 15 Mar 2024 00:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WcOlNYhc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B3259C
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 00:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710461732; cv=none; b=sQ3PoVtRDwPpYIYZ3xvC8371otm33/dbe8LVBoojUPlLQkzZkd4LG75+IveD46t3Ae3MkyeDV6SqMMFJU92+SY9awkXUyYuTy+ljU3fNLjNaQ2UvpjJJ8eq9ZL33dF/1VZWLy1dwLGzvBZG90FLMccbMVp094Is+NWtB0BgFtWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710461732; c=relaxed/simple;
	bh=iPCvI9cAJJ6XqrwM3LbOqg+ugNAqYjJ/jVKsE8WUJU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYuROF9zQTn5E2vvOsia5x6YBatHlByTpQ+A5C5MnxGd9RITs+cqCpp3qLu4/6tZs0WyksaomR/LF299SvzjA4n/sTdO2HZQ9np/gCg20mTuRTbTHJLjWf2LVnpiTzxtzU+WqhF+yEgLM9axsIYUcHHzAC2skB87EqeG5bavd5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WcOlNYhc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dddd1a8732so68375ad.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Mar 2024 17:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710461730; x=1711066530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGSSZFxOEggqk7jtO3U/5Y+eCNhXKvWEHeIQxNPQo9E=;
        b=WcOlNYhc2+tulIEJ/D/bTlPcUPMji6HnKrvzbHHcRc9J6y1IAw48gsJfgaVjUXx2Zs
         o8ugWA426mdMW9c5CDS6jXU1xoM00qIe8RM4JxfYSOvolon2N4yBZpvdsuRCyD5S1qC2
         ZHThyRkG0lEykeUGxPcinBBsr0pLSOlpVC7W7ipZvjRSkvMUbG+GUDTttw7+muBPZSeG
         GtfVLewcXVL50rUVHp6KSSiex228g3Vj9zUpSXcvuMemry+yYb58jeU6RDL6byaLwxP0
         DB9Rq4jZw8tPQbBaxj42oum+oYFcJe9FIlmkUQ/dXovAwcdZhngNMK0gFk6md1R1wg6o
         DqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710461730; x=1711066530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGSSZFxOEggqk7jtO3U/5Y+eCNhXKvWEHeIQxNPQo9E=;
        b=c+SWE5Y/tN/dg7tvI+5VtW5qKw06qz0aNn5czSW322p/riaDVlBHJHSE7KJ7BjYxQz
         6W9FRYSBo7+Ua/M/R8qFxDueUK/ALHLPXc2M7tuovHoxEbVIvnhvoWxb2xH4nkSiLPZe
         QozWZZUxN9/iw5OLn6vT4upZT6UtQj8zndli7w60t3MBXmCO47UQwlHuEL7EOCxTifiX
         z5rrDWI1lCC+MQIPLi6IKy7lkrCKjn6CDRnNIa/eycRDpBE4yqLVZhtYBbpOXzDUThFV
         xQ6fFeiH746qtfeewdSGqOCJACSMn3R2PkJEuqBnQaMhLsLoM2RG+YVQSSa6PBQaV2nY
         AS6g==
X-Forwarded-Encrypted: i=1; AJvYcCU4nxR96ulBlgcaa9Vid/2ZXLpqMuGUyjFCFPSi/dMKl/CEzC1QlprNZmWZjT11lTYhv64b99FcKyYG96Zs/n8wFVyZ588ChIUN
X-Gm-Message-State: AOJu0YzhjkFq0gMevLpzm9TESj83UtPBKtqip9BkOG35mSoC/HoEguZv
	ktaUOETS+Iax1mXbRqvf8PxxQ2J4Sm1LNgVDqxKI/iRhKaE6wakHH2MgWb8nug==
X-Google-Smtp-Source: AGHT+IEcvqgIL3VybGQG+8q2mrFaBDvw6CR0GhSZf3+d/kN6TA6FONV7338Vak/zUFI6rr/n/F8Crg==
X-Received: by 2002:a17:902:e88d:b0:1dd:b505:d518 with SMTP id w13-20020a170902e88d00b001ddb505d518mr359597plg.22.1710461729413;
        Thu, 14 Mar 2024 17:15:29 -0700 (PDT)
Received: from google.com (109.120.125.34.bc.googleusercontent.com. [34.125.120.109])
        by smtp.gmail.com with ESMTPSA id s12-20020a056a00178c00b006e6a52307dcsm2118603pfg.122.2024.03.14.17.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 17:15:28 -0700 (PDT)
Date: Fri, 15 Mar 2024 00:15:24 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pmalani@chromium.org, abhishekpandit@chromium.org,
	andersson@kernel.org, dmitry.baryshkov@linaro.org,
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, neil.armstrong@linaro.org,
	rajaram.regupathy@intel.com, saranya.gopal@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: typec: ucsi: Check capabilities before cable
 and identity discovery
Message-ID: <ZfOTHO6FMlpjeQhZ@google.com>
References: <20240314235554.90079-1-jthies@google.com>
 <20240314235554.90079-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iqTGluPntXbmFBuc"
Content-Disposition: inline
In-Reply-To: <20240314235554.90079-2-jthies@google.com>


--iqTGluPntXbmFBuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Thu, Mar 14, 2024 at 11:55:54PM +0000, Jameson Thies wrote:
> Check the UCSI_CAP_GET_PD_MESSAGE bit before sending GET_PD_MESSAGE to
> discover partner and cable identity, check UCSI_CAP_CABLE_DETAILS before
> sending GET_CABLE_PROPERTY to discover the cable and check
> UCSI_CAP_ALT_MODE_DETAILS before registering the a cable plug.
>=20
> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jameson Thies <jthies@google.com>

Since Neil pointed out that this error appeared starting in 38ca416597b0,
I think it would be appropriate to tag this commit with a Fixes: tag.

See here on instructions how to describe a Fixes:
https://www.kernel.org/doc/html/v4.10/process/submitting-patches.html#descr=
ibe-changes


> ---
> Confirmed a device which supports GET_PD_MESSAGE, GET_CABLE_PROPERTY and
> GET_ALTERNATE_MODES still requested identity and cable information.
>=20
> This moves 8 bits from "reserved_1" to "features" in the ucsi_capability
> struct. Really, this should be 24 bits to reflect the field size in UCSI.
> But, as of UCSI 3.0, this will not overflow becasue the bmOptionalFeatures
> description only defines 14 bits.

Are you sure you wanted to include this information below the --- ? This wo=
n't
be incorporated into the commit message when this is merged.


Thanks,
Benson

>=20
>  drivers/usb/typec/ucsi/ucsi.c | 34 +++++++++++++++++++++-------------
>  drivers/usb/typec/ucsi/ucsi.h |  5 +++--
>  2 files changed, 24 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index cf52cb34d2859..958dc82989b60 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1133,17 +1133,21 @@ static int ucsi_check_cable(struct ucsi_connector=
 *con)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D ucsi_get_cable_identity(con);
> -	if (ret < 0)
> -		return ret;
> +	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE) {
> +		ret =3D ucsi_get_cable_identity(con);
> +		if (ret < 0)
> +			return ret;
> +	}
> =20
> -	ret =3D ucsi_register_plug(con);
> -	if (ret < 0)
> -		return ret;
> +	if (con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS) {
> +		ret =3D ucsi_register_plug(con);
> +		if (ret < 0)
> +			return ret;
> =20
> -	ret =3D ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
> -	if (ret < 0)
> -		return ret;
> +		ret =3D ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
> +		if (ret < 0)
> +			return ret;
> +	}
> =20
>  	return 0;
>  }
> @@ -1189,8 +1193,10 @@ static void ucsi_handle_connector_change(struct wo=
rk_struct *work)
>  			ucsi_register_partner(con);
>  			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
>  			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
> -			ucsi_partner_task(con, ucsi_get_partner_identity, 1, HZ);
> -			ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
> +			if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +				ucsi_partner_task(con, ucsi_get_partner_identity, 1, HZ);
> +			if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
> +				ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
> =20
>  			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) =3D=3D
>  			    UCSI_CONSTAT_PWR_OPMODE_PD)
> @@ -1589,8 +1595,10 @@ static int ucsi_register_port(struct ucsi *ucsi, s=
truct ucsi_connector *con)
>  		ucsi_register_partner(con);
>  		ucsi_pwr_opmode_change(con);
>  		ucsi_port_psy_changed(con);
> -		ucsi_get_partner_identity(con);
> -		ucsi_check_cable(con);
> +		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> +			ucsi_get_partner_identity(con);
> +		if (con->ucsi->cap.features & UCSI_CAP_CABLE_DETAILS)
> +			ucsi_check_cable(con);
>  	}
> =20
>  	/* Only notify USB controller if partner supports USB data */
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 32daf5f586505..0e7c92eb1b227 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -206,7 +206,7 @@ struct ucsi_capability {
>  #define UCSI_CAP_ATTR_POWER_OTHER		BIT(10)
>  #define UCSI_CAP_ATTR_POWER_VBUS		BIT(14)
>  	u8 num_connectors;
> -	u8 features;
> +	u16 features;
>  #define UCSI_CAP_SET_UOM			BIT(0)
>  #define UCSI_CAP_SET_PDM			BIT(1)
>  #define UCSI_CAP_ALT_MODE_DETAILS		BIT(2)
> @@ -215,7 +215,8 @@ struct ucsi_capability {
>  #define UCSI_CAP_CABLE_DETAILS			BIT(5)
>  #define UCSI_CAP_EXT_SUPPLY_NOTIFICATIONS	BIT(6)
>  #define UCSI_CAP_PD_RESET			BIT(7)
> -	u16 reserved_1;
> +#define UCSI_CAP_GET_PD_MESSAGE		BIT(8)
> +	u8 reserved_1;
>  	u8 num_alt_modes;
>  	u8 reserved_2;
>  	u16 bc_version;
> --=20
> 2.44.0.291.gc1ea87d7ee-goog
>=20

--iqTGluPntXbmFBuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZfOTHAAKCRBzbaomhzOw
whB3AP946oaNmuw0wJkY/4atT3JxeH7Zt2KDypPL00UNC6SxaAEArNt5K27sbk4W
opP71xy41YA4ERBox7GvTmIcXBU4jgU=
=DycA
-----END PGP SIGNATURE-----

--iqTGluPntXbmFBuc--

