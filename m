Return-Path: <linux-usb+bounces-8009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C2B87D3D4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 19:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C6131F21A21
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 18:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AEE1DA26;
	Fri, 15 Mar 2024 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rZZ3dG3U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72751EB2C
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710528207; cv=none; b=LifAaA0nsCn0DrLcHOA1JREj/GKrMA/HGI0VzSpEwGhF6y+t5fQ1bQqh7hn5TCqu4uHH9NZjwEkyvlJ+00rXciPTENNkggEwZZ34wtQAF1toaNZC2R4oHBJ6fDVN9HU933vaBjaGDc+8NTq5Cluj4sB+ud2JSYM59xFdW1pmeX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710528207; c=relaxed/simple;
	bh=ZGAKvjpVyxM3BBrLds4PWZ/+N149a/CyzaamggAV7jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYe2wdmq7zqbAL03Ujtn6/nVdYkLBpPbdPrcQ/kzvgZvCaz7lLSJ3LJ+DFLp4IKrbqFk03hah4EVccw2i1KsuptWS7TJi0WE35VaqkXF2pNsL2EVHAI9mgPUylT61LGZdIhg+jcEj3hmh+iJVUZOwAx4DTKUpdq70CmD6vA/QQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rZZ3dG3U; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dee917abd5so24725ad.1
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710528204; x=1711133004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0nLVozB9ALrnWP2j3gJY+fFROYo2VF4bx0LpeBoqGk=;
        b=rZZ3dG3UCdyEmAvrmjzzHOQY25FLO2ghUk5xLT3LRBmHTsHIFPZ79EhQF/+LJTNMs4
         oTpO9IFg9/Bk5xw+oGqS2++iCpt2/79e4D5/VvxWAMe8M8OI69z8PAHPrtCjUzHHEegm
         0XyszOIsRsDk45LS6NzanWcKNhRx22I24qpWkPxfTie+H3TX/zmETHysYTkClta/lEJs
         T1l6GD25V5DWTpnHi0e9/bKwjHOBixPV2CSxPKmQBeWdE91wFt9voxVSGAXHDhAYmJTw
         KRk6Wigj+ln/gn0XvUu1drxNntlOmEcdlcCKa0lREP4/2tFKhRzi6dpnFDMk+hIAmfkM
         Sagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528204; x=1711133004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0nLVozB9ALrnWP2j3gJY+fFROYo2VF4bx0LpeBoqGk=;
        b=Nvyfig0SaXBuvm1KBpE0hIOb0Xs2LIEa3c1ltIBm6hWjuEXO4EvS6E688uI9iw8WmN
         CtupLAqXzMxr1n/bXxc24rvH6MtUxGz+LcD82efH7fNmXzmnvkIZRnrNlqFIkKKbib4t
         cmLY+a/5Nis0JG+sDirLBrXgV5JihRtoN7/KP2U66DRfKPEC6XfckMzFmXCDp8ZgMuS9
         VIwxZBd62I94Kqm+ossChVilSL1sFSDFb5eNdRWtH/g7vQAfz4t+z8omuHkEkOjU8kM3
         qjxYn0KQrWR+YDANuq7atdHh/FA8d/zY2p0mEf00lMMK200G2RGXR4EsbWmuiNm3nJhY
         nyrg==
X-Forwarded-Encrypted: i=1; AJvYcCW0RMavMpF+xqN0fL9UIXijQsF4Oy5/3OVrSVzRqb3OkR8TZlI+tuFY+Ua+TsKfNQEJeEJgdcztB7fDOM8RlqEEH9pDHZk6dOoG
X-Gm-Message-State: AOJu0YxXaBFw0wnkxpqKdBtz/ehko5/IXol27BM+vauDL+FprW3445B0
	0im9fsgFObPgFyB5iTv7kguRLuQvYCcvPzMNJhbeiKNCy52kRH6iXtLCO4BY0Q==
X-Google-Smtp-Source: AGHT+IFoJ0bVhvsAPes4gndhDj9YHwXtO39P5oJlfBAr+tW32T/mEI0xXQ6DlK7gVIcI9TYHoGOaRw==
X-Received: by 2002:a17:902:ce8a:b0:1dd:ae61:67bd with SMTP id f10-20020a170902ce8a00b001ddae6167bdmr552466plg.18.1710528203683;
        Fri, 15 Mar 2024 11:43:23 -0700 (PDT)
Received: from google.com (109.120.125.34.bc.googleusercontent.com. [34.125.120.109])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d08300b001dcad9cbf8bsm4187758plv.239.2024.03.15.11.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:43:22 -0700 (PDT)
Date: Fri, 15 Mar 2024 18:43:18 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pmalani@chromium.org, abhishekpandit@chromium.org,
	andersson@kernel.org, dmitry.baryshkov@linaro.org,
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, neil.armstrong@linaro.org,
	rajaram.regupathy@intel.com, saranya.gopal@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: typec: ucsi: Check capabilities before cable
 and identity discovery
Message-ID: <ZfSWxu2bXwitinrI@google.com>
References: <20240315171836.343830-1-jthies@google.com>
 <20240315171836.343830-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WmDXk6lFQ12bfwcw"
Content-Disposition: inline
In-Reply-To: <20240315171836.343830-2-jthies@google.com>


--WmDXk6lFQ12bfwcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Fri, Mar 15, 2024 at 05:18:35PM +0000, Jameson Thies wrote:
> Check the UCSI_CAP_GET_PD_MESSAGE bit before sending GET_PD_MESSAGE to
> discover partner and cable identity, check UCSI_CAP_CABLE_DETAILS before
> sending GET_CABLE_PROPERTY to discover the cable and check
> UCSI_CAP_ALT_MODE_DETAILS before registering the a cable plug. Additional=
ly,
> move 8 bits from reserved_1 to features in the ucsi_capability struct. Th=
is
> makes the field 16 bits, still 8 short of the 24 bits allocated for it in
> UCSI v3.0, but it will not overflow because UCSI only defines 14 bits in
> bmOptionalFeatures.
>=20
> Fixes: 38ca416597b0 ("usb: typec: ucsi: Register cables based on GET_CABL=
E_PROPERTY")
> Link: https://lore.kernel.org/linux-usb/44e8142f-d9b3-487b-83fe-39deadddb=
492@linaro.org
> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

Thanks!

> ---
> Confirmed a device which supports GET_PD_MESSAGE, GET_CABLE_PROPERTY and
> GET_ALTERNATE_MODES still requested identity and cable information.
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

--WmDXk6lFQ12bfwcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZfSWwwAKCRBzbaomhzOw
wsP+AQCQwtzFT9Ew+c2pOe6PjrRLEQHEO2Agg/q+z7SC7SpOYwD+MnqzCv8Vd7kG
MlEct53Z8N/V+jCD6NAzqFPfaBeFjQk=
=hNlq
-----END PGP SIGNATURE-----

--WmDXk6lFQ12bfwcw--

