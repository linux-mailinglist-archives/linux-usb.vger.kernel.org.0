Return-Path: <linux-usb+bounces-30877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 855EDC82EA4
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 01:15:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 024E3348C6C
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 00:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413221DD9AD;
	Tue, 25 Nov 2025 00:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BBw2zZAi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CED71917ED
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 00:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029730; cv=none; b=u2tjNjB5DNPabq2h+3g1QmEsVEjqzsBV98Krf/CY6KKnRUu8PNirIyctQMqnrkB+RR5JJGHJxQWj1Dup/98N/QZ3HMx78uGGHErHADz95+3f+jHxTEF1BRS9fjk0DWiczj+Q2ntZgybOi58aNC6V0HhJKjVPE1ZvApdkxnBEcho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029730; c=relaxed/simple;
	bh=M2QyDO/Ls3kyrjY+oZ6+0A/VI/hwZn34k06mJO8/ChY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFg7jgELXv5jREmlALmMFweMY+UVDaeo9k4ELdQPKhH5NjTHS3Bed3RqDtegDuMXzfPqCLVBZOJBk4o7ufP0EUZ5/NqZNYBITNPLBpqbt8rdvqEj51uFF3pnPrCQCSovyloRCAZpe3lhKYLsC4hCMgCTSqnemXBgLamDinTzXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BBw2zZAi; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29555b384acso60996325ad.1
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 16:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764029728; x=1764634528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z75TCqXiDeNiJ1V7BhWMq+8kmv0G4dkLwgIfeG61ojE=;
        b=BBw2zZAimPj4BcQtfaWmdsyknwPX4r5mdYdXbbQUSjBq5RLHRqVsnKmG+43T2HBNSA
         REDXKq71uXM1px2mOCLZr0huInnSPxRRnFQXpFNJlgXILdzGJdwW95bgyNc5v4Zhb9TJ
         HXFPk4uu4FCliHFSk30zbkBKZIRJALDcpDFsBGjAXdP39xQjHijAhCCGpYESvCXE6dS2
         UExvq1aSvqT+VLVPN/nWze0Ou0Y2upbmTzsr01VJw3iSbkTSqYfLlu/FooF8dJavYwbA
         UzT8hdfWiWIQdzHUS8lJQiNPptf1MullCqbGf7f8ojxjeM0YAvzJSNrhN+x/bgElK0gj
         nw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764029728; x=1764634528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z75TCqXiDeNiJ1V7BhWMq+8kmv0G4dkLwgIfeG61ojE=;
        b=DqmqWtyBOG6fakpVSALGg0ldn9sEi7zR7SZ0c15pHoZ9gLePoCk6jJeE8JNPMAWy0d
         xz4j952ukDaWuhjfd/1vBWuTVAQIjnNFzjToATBPC/ipTMci3jEFaR2Pv8VGsm9rRBYW
         YxZTWKEK9HrMi0W9vfUyFqB97aklPFPGaxsSV9eNygzvRA0g0JlMpdlAQl5TZOHh4vyS
         SaPH339SPRPpr4QgLsO2nUrcOWD1rcyKwukBvboG25QDGhuZlHMFhX2DBoDGoD1tsEv2
         xPjnU+1stvRaxj82RuqTCQySKcGl8LAOOqDLNyWuFH1V/lqtfrdUPnokOkB88WcA0IdQ
         Pogw==
X-Forwarded-Encrypted: i=1; AJvYcCW+uhZyAyJ/gOm76v/XC6LhDqCzg2/P4gG4iExKfrPrGX2Rhrv83edxfeqejv+DglJWX72u8ibvqyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs8O0bDzrvad6zmEbt+k6YqhEFYjEXU9ViHuxCKPuU9qwnslXT
	Dwol5+WWSYsUG5t+T/7irDYu7k9AIYwx5ypKDw2eWtTZz7RzFDBp2YxdZVcSzrYgbg==
X-Gm-Gg: ASbGncsZSXaVY0KZGzVvHjMZEa/hn/ir94GN7N/V/6XK2LmoCpMSR5ssL5MSB9tjuqo
	K1LXoMSZB1GWCyCJjCAmCsJrdRgYw+UnuSID4Xw/x2dwVFiihUDPQqnDDUle0xPqnNANrpmaFEG
	RlPO7pWHbRT/63ijCJVgez6qQLFm0wx7tJMDW+ehH0VqGEjeKi7D4x1+wZj8zc/ZfBCqXYhs+OM
	KGVP/MeaXRdTptVd6LNAiz3f/qSI7W0C6ZH/QjBlSwi2JEX042MHOImDqCihVvECLepLmSTkXpY
	8b0eIV56omT8IqdDrwltmYrwPt5oEDLaUFOBgjf36JneF3go7xbT4biYzo7UVGoEg1+hgbNXEml
	8Klg0Hq+EWOjcF1ZUe8kC11cRRc8DaoJctqLbu5PvaOXYBi30pIe0pFoXhGOghceLuIsM+tpXvO
	k6C6NLXhNbc834ErntCQQJYZJA9URo3w+2rFfUqdbIUL9c
X-Google-Smtp-Source: AGHT+IEXdnepa2ycG6iOsvpDqbdObTbNWIRhpbI2lUk6w/VA/v7ttzN3xAcFJ11ipO773Q0QjnnD3A==
X-Received: by 2002:a17:90a:ec8f:b0:340:bc27:97b8 with SMTP id 98e67ed59e1d1-34733e71c77mr13581520a91.10.1764029727967;
        Mon, 24 Nov 2025 16:15:27 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3472693bd15sm14766119a91.13.2025.11.24.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:15:26 -0800 (PST)
Date: Tue, 25 Nov 2025 00:15:23 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] platform/chrome: cros_ec_typec: Set
 no_mode_control flag
Message-ID: <aST1GwCm4aPqCWVh@google.com>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7PfsJrJt7aahXr+c"
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-3-akuchynski@chromium.org>


--7PfsJrJt7aahXr+c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

On Mon, Nov 24, 2025 at 12:46:37PM +0000, Andrei Kuchynski wrote:
> This flag specifies that the Embedded Controller (EC) must receive explic=
it
> approval from the Application Processor (AP) before initiating Type-C
> alternate modes or USB4 mode.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_typec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index b712bcff6fb2..c0806c562bb9 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
> =20
>  		cap->driver_data =3D cros_port;
>  		cap->ops =3D &cros_typec_usb_mode_ops;
> +		cap->no_mode_control =3D !typec->ap_driven_altmode;
> =20
>  		cros_port->port =3D typec_register_port(dev, cap);
>  		if (IS_ERR(cros_port->port)) {
> --=20
> 2.52.0.rc2.455.g230fcf2819-goog
>=20

--7PfsJrJt7aahXr+c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaST1GwAKCRBzbaomhzOw
wvFFAQCuGbxz6xVli+GKaG/ptObNPicCsYYsw9JeZWvQTFU4XAEAqOIJD+ai4Uuu
O6BLLAU4psq5ZdQXWlVEG1RtiPxTmww=
=obta
-----END PGP SIGNATURE-----

--7PfsJrJt7aahXr+c--

