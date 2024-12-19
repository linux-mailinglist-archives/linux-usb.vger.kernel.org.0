Return-Path: <linux-usb+bounces-18665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D519F71CA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 02:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C294B1889F43
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 01:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983B94207A;
	Thu, 19 Dec 2024 01:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jiYig6j/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B232F7081A
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571826; cv=none; b=DBLA1lqFEMaaa5Gxu7+cXevC5UK0jv77egdi4PSfuzcqYJu97uGxoGZT2Us0fBjCDdgQ8pX08ShrrWtHUsYVICozMC7Ltk5VbujUh0dmPwnMD3LkbjEYZfc9OX05rVpQYV05fvOZDE8I9bPcGhTNDaoNbe6K7jwqm9ey0rP5FFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571826; c=relaxed/simple;
	bh=p6nOoEYp0S5604xQ7iSGBSC3YT4ztXbChxOK0GMxqtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvyYqHMj8uwPxA5fZAXTo76GilgntohzRJ6Tz/uhznlijgHRLyie201sl+jc1UBoOJsZqwF2xkjxsRNEp32fSLGWHVbWJqMAIcIVYC/5kmMG0YHdVCgKEuDsSl1lRyIIC62krc3rTpAClIN/oQh9197cnZ3XRt+QscJ5IDA0+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jiYig6j/; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f42992f608so195604a91.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 17:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571824; x=1735176624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3INdROJe3ktwJeWPfSyY/3heuTKVBEytvmnr8lDFnM=;
        b=jiYig6j/uebqWlY4k/Ha20few1voNOp//62CULkd9M0GuFWGrR0j8Zs59pg/0qdurG
         ULHtADFSj5avh8knzzYd4e4FouPj/IZuzja34sMscZwpBbWnftMEKvrY6Nl2uf/ykZa9
         TzB1AahNHFDL/CNUhoy+SL7NTaF3zoJf2WDzpsHtQmGLtr3G1UYuJTP1e12r2r99XtjN
         /OnwDp/9h3TCuwwnm/7G6P079BoUxddlIruEBjhXPo+H3AC5BB2T9E/jvDY/G8RFpdDi
         SvDkQyxbrdV386O1g9hj6ql48/WXtpfQQT87J5qBaddFRRrWrhLiq4czcJZlMN2Un5Ao
         sFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571824; x=1735176624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3INdROJe3ktwJeWPfSyY/3heuTKVBEytvmnr8lDFnM=;
        b=LNCy0xHcRkLv9DHk2aQVPnhf+vm/7Ztj8+5m+mT4/oTBVrSe9URQfRPII9I+G5df4K
         Jx17ifUIDvdnicP1CPlUhh+0S0qq5CkcPLPyiRdswxa7XNOUMmUD37KjfUlgnHWrUevS
         lBJww0mybKA7F7GUwD+wFmr7YZMCD1nhygDFPXp3xuhxKgPU8RYzQE8H+Bd2tVwuSrPb
         SYUAnmEGRKgHHlj4MmF1b73JfusHGTANy1dKwpf0TLQWCObO2wywaNcLj23oAfeMLdGK
         UltwNfN9k0UZMklESgDPybKG82kXEReGL/zEEGm2UqovZPYavuU2ifPvfgm6sqf2INzp
         Bufw==
X-Forwarded-Encrypted: i=1; AJvYcCWIMD7sMI2WciIQH4NqeM3KUwP+3EXKQhrnk1s9kq6EXmnASDXpZC/BNFsKtPK+ltlpIyeTSxwP0wI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIrDV1PSCkhKAqAwdMlQH7OL6tePKicnxYd8X+QPgjrKBycVN
	EKwWsDItu4jFq71inV6kpwY6tTHxyMdKeD/XMQGn77sT544OIv9Uax/0br3zKA==
X-Gm-Gg: ASbGncudOHE1i7JVIqO1KifzNFbAzTUxt6wgHo6TQEOk6zvbTmLspsdzuSuRk9yvgFh
	v+FPvRddtAGsDbthnVlyKXzmU+pcLFArlJniKGVT5+6oE/9yjZLmoJj9wNWS/9KfcnY5Db15YnM
	NKug9JvS9Q/1UG0nDA6OOy9azTmBpQ5+lmAwj14Ook1CyuX/aj4gmVac6PC7UN/G9g+r5Qk6ktE
	dDI7TVrQZFS4D2D23ou6pVJPBmlhbhx7igLTMmStWYTYGkxShrZOZ2mIGwZuDpJq9KTREc/ua/M
	f2jVrglSYOcSaku/
X-Google-Smtp-Source: AGHT+IEYJCxKLU4r/XjygJL6qQfCXVxFX5QGZm3Shr7aqw/EDMLY4faPDbFmN+OkIbu3bZt9d9iqeg==
X-Received: by 2002:a17:90b:1f86:b0:2ee:eb5b:6e06 with SMTP id 98e67ed59e1d1-2f443d7181fmr1894693a91.36.1734571823733;
        Wed, 18 Dec 2024 17:30:23 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477c4cc5sm172684a91.12.2024.12.18.17.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:30:22 -0800 (PST)
Date: Thu, 19 Dec 2024 01:30:18 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/8] platform/chrome: cros_ec_typec: Update partner
 altmode active
Message-ID: <Z2N3Kplgwy8P7STz@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u6VxNHwxbPI9ztRE"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>


--u6VxNHwxbPI9ztRE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:46PM -0800, Abhishek Pandit-Subedi wrote:
> Mux configuration is often the final piece of mode entry and can be used
> to determine whether a partner altmode is active. When mux configuration
> is done, use the active port altmode's SVID to set the partner active
> field for all partner alt modes.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Use list_for_each_entry and simplify conditional statement within
>=20
>  drivers/platform/chrome/cros_ec_typec.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index ae2f86296954..77f748fc8542 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -619,6 +619,7 @@ static int cros_typec_configure_mux(struct cros_typec=
_data *typec, int port_num,
>  	};
>  	struct ec_params_usb_pd_mux_ack mux_ack;
>  	enum typec_orientation orientation;
> +	struct cros_typec_altmode_node *node;
>  	int ret;
> =20
>  	ret =3D cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
> @@ -677,6 +678,14 @@ static int cros_typec_configure_mux(struct cros_type=
c_data *typec, int port_num,
>  			port->mux_flags);
>  	}
> =20
> +	/* Iterate all partner alt-modes and set the active alternate mode. */
> +	list_for_each_entry(node, &port->partner_mode_list, list) {
> +		typec_altmode_update_active(
> +			node->amode,
> +			port->state.alt &&
> +				node->amode->svid =3D=3D port->state.alt->svid);
> +	}
> +
>  mux_ack:
>  	if (!typec->needs_mux_ack)
>  		return ret;
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20

--u6VxNHwxbPI9ztRE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N3KgAKCRBzbaomhzOw
wnC2AP9bzmKnl1n7FGD2IxuFSue5HXr+ftqRgv4W6e9ba0LPcAEA3pKlrW133tep
HIPcEzKbrNwxsTxV3ohC4hIhodbuZgk=
=4d93
-----END PGP SIGNATURE-----

--u6VxNHwxbPI9ztRE--

