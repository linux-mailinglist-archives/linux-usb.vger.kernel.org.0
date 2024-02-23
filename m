Return-Path: <linux-usb+bounces-6935-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4853860849
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 02:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF1211C21676
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 01:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA9ABA56;
	Fri, 23 Feb 2024 01:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sdzmFqxz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB223BA46
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 01:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708652107; cv=none; b=pc2NdgpMO2wwkGhcfu1LKZRGCpTtxnvMqOCQKxGHqBhpf/zU8IJOxTzbaJWwHAXWF42e4Y+FCCOKki5e3Bc9jkI1j6fCWmj65+BbgH6uJgZ8p59/QnwGUVe/XM0XoaWyPGL8HeAw2woctwZrRFObQKnZQuKqovcXGUoO7A5Jvic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708652107; c=relaxed/simple;
	bh=8S3zHU+wpW3LOYH4XeYrWvZJw5y3FLK+bVDfQp3+Zm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXeB5IyB6PpkhKZ2DMcCkTtwbGSqwWKM0VUEIcEKZbNUsBlu7xAwv2LRjTvDCOfJsNheTEF3H3qM/mP4Q9K2OJLSKz9myCZ6Nou6QnGLQIyGMbpxLPpbIyBAfKN1LnyCfGCq6dh4oSUr38RRQsF+87gbWj1KN0QPntDL9Miji3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sdzmFqxz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d5ce88b51cso45955ad.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 17:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708652098; x=1709256898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=khEwVCNzD2MnqQGNLc3gqxG5YSr5roBlY9h2NMfy5PE=;
        b=sdzmFqxzKY7i/lRUMHV4L0N7wgqJcWUomXlw/kSlwm88iCB4eMfbRHGhXieuRI+OnL
         C8yYTdvZ1p40S9lL4Ho9xxADKeOkwxkEljDqVWywOWnECndZ+BMaw39G9nIUkcMgTDk1
         m+AfgZYVrTu6kJwr7iLg8hdsW3+wqbpZJtfB/Q5WjJIuNdMzyzWHrJ89Bs1nb9SXc1fA
         TR8tQh/dwLQkZbzxORy2EhBDMWQhwf1RV3MrJYKIvBK3lQmJzTiJ5YukaJHyKK6xKu7U
         OYrR/Lg4So1ZjALeNuQfOXWSuo7iI+Tc+9y61Yykl64OXP9yB6A9RrfCMNxgThg01RkS
         6i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708652098; x=1709256898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khEwVCNzD2MnqQGNLc3gqxG5YSr5roBlY9h2NMfy5PE=;
        b=CK+VVStoM0XVXbWaqdpFJW/HlubqVE8heleUoms7z2TrBd6FI7hDa4CpQupRct0VKd
         cHLZqlx3pHgRznjyYtXm0bD9hjIpYVDZMMzljjHLOO9vWZrhh46fnBF+kmLw82it8Tf0
         wBdGPFmUSkCNfGZLxl0zmWm5KY7rhP3PnvRIVvg9iJ+0hXYYEygXZT40uju1nMOGBrZY
         NiPbCnKO15wA7bho3GsO9or+TVoT4EgqlPlE11ZPg9LijRW3c796MT4EOHS69vXGbvqn
         69DalVZcqL+BPnXZcMpUoyh3Waem40hrmyecvWNEXRPPlBJlBtc/nCZJ+uZI+DgkLTig
         wDuw==
X-Forwarded-Encrypted: i=1; AJvYcCXO4bpvWWviQeqaynzNKEyFtqwj/H0Oii1GyNYtCtByuE0mjYbUjqCUwOqVX/SNta3hGyrb2EFYVhTH5AR9QAfOhmvI4LTzamDF
X-Gm-Message-State: AOJu0YyfJL+aqXsvNdRvw5Y+fKI/N5Fj5Gi3qmueW3FPxVmrO8oinRjZ
	biaMlZOx0P5unN0XTiv70uTbCRtbvd9pppvm8RdxoxLgxYcA2TbxnaXaolNVZw==
X-Google-Smtp-Source: AGHT+IFKre034ym4QT3ZN4MPepBoEPIH5QCEvjgqY/CG3MD1pHdGHf+YtnuAMCiChADa0/ToTg06BA==
X-Received: by 2002:a17:903:4306:b0:1db:c4a1:1c84 with SMTP id jz6-20020a170903430600b001dbc4a11c84mr635117plb.7.1708652097957;
        Thu, 22 Feb 2024 17:34:57 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id r26-20020aa79eda000000b006e118d2db9dsm2329565pfq.97.2024.02.22.17.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 17:34:56 -0800 (PST)
Date: Fri, 23 Feb 2024 01:34:53 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pmalani@chromium.org, abhishekpandit@chromium.org,
	andersson@kernel.org, dmitry.baryshkov@linaro.org,
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, neil.armstrong@linaro.org,
	rajaram.regupathy@intel.com, saranya.gopal@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: typec: ucsi: Register SOP/SOP' Discover
 Identity Responses
Message-ID: <Zdf2PamMOlnTlB8b@google.com>
References: <20240223010328.2826774-1-jthies@google.com>
 <20240223010328.2826774-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kvp6mdBMKbJb/VEW"
Content-Disposition: inline
In-Reply-To: <20240223010328.2826774-4-jthies@google.com>


--kvp6mdBMKbJb/VEW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Fri, Feb 23, 2024 at 01:03:27AM +0000, Jameson Thies wrote:
> Register SOP and SOP' Discover Identity responses with the USB Type-C
> Connector Class as partner and cable identities, respectively. Discover
> Identity responses are requested from the PPM using the GET_PD_MESSAGE
> UCSI command.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Tested on v6.6 kernel. GET_PD_MESSAGE responses from the PPM populate
> partner and cable identity in sysfs.
> redrix-rev3 /sys/class/typec # ls port2-partner/identity/
> cert_stat  id_header  product  product_type_vdo1  product_type_vdo2
> product_type_vdo3
> redrix-rev3 /sys/class/typec # ls port2-cable/identity/
> cert_stat  id_header  product  product_type_vdo1  product_type_vdo2
> product_type_vdo3
>=20
>  drivers/usb/typec/ucsi/ucsi.c | 77 +++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h | 29 +++++++++++++
>  2 files changed, 106 insertions(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 15e82f5fab37..6d6443e61faa 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -646,6 +646,73 @@ static int ucsi_get_src_pdos(struct ucsi_connector *=
con)
>  	return ret;
>  }
> =20
> +static int ucsi_read_identity(struct ucsi_connector *con, u8 recipient, =
struct usb_pd_identity *id)
> +{
> +	struct ucsi *ucsi =3D con->ucsi;
> +	struct ucsi_pd_message_disc_id resp =3D {};
> +	u64 command;
> +	int ret;
> +
> +	/*
> +	 * Skip identity discovery and registration if UCSI version is less than
> +	 * v2.0. Before v2.0 MESSAGE_IN is 16 bytes which cannot fit a complete
> +	 * 24 byte identity response.
> +	 */
> +	if (ucsi->version < UCSI_VERSION_2_0)
> +		return -EPROTO;
> +
> +	command =3D UCSI_COMMAND(UCSI_GET_PD_MESSAGE) | UCSI_CONNECTOR_NUMBER(c=
on->num);
> +	command |=3D UCSI_GET_PD_MESSAGE_RECIPIENT(recipient);
> +	/* VDM Header + 6 VDOs (0x1c bytes) without an offset */
> +	command |=3D UCSI_GET_PD_MESSAGE_OFFSET(0);
> +	command |=3D UCSI_GET_PD_MESSAGE_BYTES(0x1c);
> +	command |=3D UCSI_GET_PD_MESSAGE_TYPE(UCSI_GET_PD_MESSAGE_TYPE_IDENTITY=
);
> +
> +	ret =3D ucsi_send_command(ucsi, command, &resp, sizeof(resp));
> +	if (ret < 0) {
> +		dev_err(ucsi->dev, "UCSI_GET_PD_MESSAGE failed (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	id->id_header =3D resp.id_header;
> +	id->cert_stat =3D resp.cert_stat;
> +	id->product =3D resp.product;
> +	id->vdo[0] =3D resp.vdo[0];
> +	id->vdo[1] =3D resp.vdo[1];
> +	id->vdo[2] =3D resp.vdo[2];
> +	return 0;
> +}
> +
> +static int ucsi_get_partner_identity(struct ucsi_connector *con)
> +{
> +	int ret;
> +
> +	ret =3D ucsi_read_identity(con, UCSI_RECIPIENT_SOP, &con->partner_ident=
ity);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D typec_partner_set_identity(con->partner);
> +	if (ret < 0)
> +		dev_err(con->ucsi->dev, "Failed to set partner identity (%d)\n", ret);
> +
> +	return ret;
> +}
> +
> +static int ucsi_get_cable_identity(struct ucsi_connector *con)
> +{
> +	int ret;
> +
> +	ret =3D ucsi_read_identity(con, UCSI_RECIPIENT_SOP_P, &con->cable_ident=
ity);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D typec_cable_set_identity(con->cable);
> +	if (ret < 0)
> +		dev_err(con->ucsi->dev, "Failed to set cable identity (%d)\n", ret);
> +
> +	return ret;
> +}
> +
>  static int ucsi_check_altmodes(struct ucsi_connector *con)
>  {
>  	int ret, num_partner_am;
> @@ -754,6 +821,7 @@ static int ucsi_register_cable(struct ucsi_connector =
*con)
>  		break;
>  	}
> =20
> +	desc.identity =3D &con->cable_identity;
>  	desc.active =3D !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE & con->cable_prop.=
flags);
>  	desc.pd_revision =3D UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(con->cabl=
e_prop.flags);
> =20
> @@ -776,6 +844,7 @@ static void ucsi_unregister_cable(struct ucsi_connect=
or *con)
> =20
>  	typec_unregister_cable(con->cable);
>  	con->cable =3D NULL;
> +	memset(&con->cable_identity, 0, sizeof(con->cable_identity));
>  }
> =20
>  static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
> @@ -825,6 +894,7 @@ static int ucsi_register_partner(struct ucsi_connecto=
r *con)
>  		break;
>  	}
> =20
> +	desc.identity =3D &con->partner_identity;
>  	desc.usb_pd =3D pwr_opmode =3D=3D UCSI_CONSTAT_PWR_OPMODE_PD;
>  	desc.pd_revision =3D UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->=
cap.flags);
> =20
> @@ -854,6 +924,7 @@ static void ucsi_unregister_partner(struct ucsi_conne=
ctor *con)
>  	ucsi_unregister_cable(con);
>  	typec_unregister_partner(con->partner);
>  	con->partner =3D NULL;
> +	memset(&con->partner_identity, 0, sizeof(con->partner_identity));
>  }
> =20
>  static void ucsi_partner_change(struct ucsi_connector *con)
> @@ -971,6 +1042,10 @@ static int ucsi_check_cable(struct ucsi_connector *=
con)
>  	if (ret < 0)
>  		return ret;
> =20
> +	ret =3D ucsi_get_cable_identity(con);
> +	if (ret < 0)
> +		return ret;
> +
>  	return 0;
>  }
> =20
> @@ -1015,6 +1090,7 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>  			ucsi_register_partner(con);
>  			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
>  			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
> +			ucsi_partner_task(con, ucsi_get_partner_identity, 1, HZ);
>  			ucsi_partner_task(con, ucsi_check_cable, 1, HZ);
> =20
>  			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) =3D=3D
> @@ -1414,6 +1490,7 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
>  		ucsi_register_partner(con);
>  		ucsi_pwr_opmode_change(con);
>  		ucsi_port_psy_changed(con);
> +		ucsi_get_partner_identity(con);
>  		ucsi_check_cable(con);
>  	}
> =20
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index f0aabef0b7c6..b89fae82e8ce 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -106,6 +106,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define UCSI_GET_CABLE_PROPERTY		0x11
>  #define UCSI_GET_CONNECTOR_STATUS	0x12
>  #define UCSI_GET_ERROR_STATUS		0x13
> +#define UCSI_GET_PD_MESSAGE		0x15
> =20
>  #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
>  #define UCSI_COMMAND(_cmd_)			((_cmd_) & 0xff)
> @@ -159,6 +160,18 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num=
);
>  #define UCSI_MAX_PDOS				(4)
>  #define UCSI_GET_PDOS_SRC_PDOS			((u64)1 << 34)
> =20
> +/* GET_PD_MESSAGE command bits */
> +#define UCSI_GET_PD_MESSAGE_RECIPIENT(_r_)	((u64)(_r_) << 23)
> +#define UCSI_GET_PD_MESSAGE_OFFSET(_r_)		((u64)(_r_) << 26)
> +#define UCSI_GET_PD_MESSAGE_BYTES(_r_)		((u64)(_r_) << 34)
> +#define UCSI_GET_PD_MESSAGE_TYPE(_r_)		((u64)(_r_) << 42)
> +#define   UCSI_GET_PD_MESSAGE_TYPE_SNK_CAP_EXT	0
> +#define   UCSI_GET_PD_MESSAGE_TYPE_SRC_CAP_EXT	1
> +#define   UCSI_GET_PD_MESSAGE_TYPE_BAT_CAP	2
> +#define   UCSI_GET_PD_MESSAGE_TYPE_BAT_STAT	3
> +#define   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY	4
> +#define   UCSI_GET_PD_MESSAGE_TYPE_REVISION	5
> +
>  /* ---------------------------------------------------------------------=
----- */
> =20
>  /* Error information returned by PPM in response to GET_ERROR_STATUS com=
mand. */
> @@ -338,6 +351,18 @@ struct ucsi_connector_status {
>  	((get_unaligned_le32(&(_p_)[5]) & GENMASK(16, 1)) >> 1)
>  } __packed;
> =20
> +/*
> + * Data structure filled by PPM in response to GET_PD_MESSAGE command wi=
th the
> + * Response Message Type set to Discover Identity Response.
> + */
> +struct ucsi_pd_message_disc_id {
> +	u32 vdm_header;
> +	u32 id_header;
> +	u32 cert_stat;
> +	u32 product;
> +	u32 vdo[3];
> +} __packed;
> +
>  /* ---------------------------------------------------------------------=
----- */
> =20
>  struct ucsi_debugfs_entry {
> @@ -428,6 +453,10 @@ struct ucsi_connector {
>  	struct usb_power_delivery_capabilities *partner_sink_caps;
> =20
>  	struct usb_role_switch *usb_role_sw;
> +
> +	/* USB PD identity */
> +	struct usb_pd_identity partner_identity;
> +	struct usb_pd_identity cable_identity;
>  };
> =20
>  int ucsi_send_command(struct ucsi *ucsi, u64 command,
> --=20
> 2.44.0.rc0.258.g7320e95886-goog
>=20

--kvp6mdBMKbJb/VEW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZdf2PQAKCRBzbaomhzOw
wu1YAP9zbCotZw2xMUkOYOfeeEQk1pRj6wHI3AClgo0uNiMexgEAumJkZWIz3Ts4
WQgGk+5FOzKUan+5j3Ei5kJZ2Jc+5Qw=
=2r6R
-----END PGP SIGNATURE-----

--kvp6mdBMKbJb/VEW--

