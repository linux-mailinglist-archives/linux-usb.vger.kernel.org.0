Return-Path: <linux-usb+bounces-20114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66354A27476
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D36BA7A27C0
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 14:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBCA2135CA;
	Tue,  4 Feb 2025 14:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rfQgL+Ld"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49952D057
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679666; cv=none; b=h76QxaBMH7UQPmabtR7Xu6C9jyC62pnxFqEN9e+FlEhR2XAY5dgAAPLPH29OvQTBlCD3BMqIdX1TE7L2mPbsN9bTya4L8g23jMijm5wNb4CsXbgeiDms0IkVhsDNWFGWniq37ih0FvDukhwt3sUcr8zdz1m6iag9k8ZhIp8BEX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679666; c=relaxed/simple;
	bh=nkmIb6gcYyVx/3Djk3nNOz89r23xu2R1V/QjE/EEIwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITjPzdI31MjOgHXkKsvg3iUITTotIGqXd4qH37JqcCI2URx4LAnLdR/dtocd2uSHN17tiNPIfLmd+PbrxDM2z5I9xTrSKGo/YN9yx9BlVtvc4bVpYzsSthviZZFgMXnZQpgYLFwNy56olcTqY+1jKm/DtuIqwx5bEDYLXQkfWeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rfQgL+Ld; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so408643a91.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 06:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738679664; x=1739284464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXBnAvLX+ryoogexm0ZNIasCmV+KVvCRmhOSBuvjXgQ=;
        b=rfQgL+Ldk9dNGYCi6Ow40ruhwMAlDsHm0x5YMz2Z8eBuMLdUV9Mb2lLwdMtlW5SURc
         f1edM2i+03wDBqoROOwlgvHSzhvi4bPSW09m/GttAu/F9HZJDIK45WM1A6cMzc79yAix
         2cQh0imODm43EMUD1WRBxIUSZres2y4oH5o6lOrXo/a/akW5RoLZEDUZmfme8qtUNNY7
         eRFKIy1EMSD+/kXOqDID2i8MA4119BlpFbWjPyywEEvK30w8LDwxqM7MKi9pD3Q06d3k
         Y268qVWWYNu+BjcHi6OtKRxE9Pw/Zvx7kh0K86rMsTljECrMDD083w9Y+FeJjGj6SzLW
         vI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679664; x=1739284464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXBnAvLX+ryoogexm0ZNIasCmV+KVvCRmhOSBuvjXgQ=;
        b=oLZzpG+ULpxnqwsoFINVXNvjEVZ2zv9KsTGHfr0lNwHvKWR9IaJzdtl97Gr4AybDoI
         UGuF77rORLo0fg0DpNRL7g2soAjK5ggWB033OaaeEna/jU+Ai7+bNVNPmo8cjqQ1YHPq
         8VImJwRA9+PWOxRrQsMExC2bEvoQSIwFg7XcyXbHvUFRkglvzosOr/fRKp7esR4pKNHH
         QG2a5EA6DC9D3UBr1fqRPH4Ou3VqLcvEeEgkwh5yyEahMdIM/hO3fVw+cK6kfKoZD8aR
         2VqKEM6zxiJTAH2cyvy8by4qjh3AuRQu+AjG+yyJ9pWrBBrqleou+n3sXN2JDEbNX0GR
         IrOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBTZMjeq7tlV5HIXI9XIfcYS3t0rbdTDr4TbCPE+MEhXDn+hHdqssoTvLWHTqQbleSGxnB8Oylh7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZmFUPM8xJ/XVwi5wibzbtX09pNVeLElROP3ldi9cuPSJm6yfO
	OyHZUhhPuA8VuzFYT4PdTwRs+evOjekEWNR2xE7qGg63UovABRml2cX32AWbUA==
X-Gm-Gg: ASbGncv3QCglm6wSEvGFpoZBsHlk6EnQbv/njQNexR9OLOdnG/ZySglN7li8VlcHlnH
	FRRT93gwJg1nRNjmpjLB3KxcHbVbuWix69u1yM+awlT2ohUdMqyMxZuq0ORc11fjEGpKLuOgcVi
	hUX9LMMRbSWkfEwinF3UcIFaSlcnuJourOGd8CE+07vLjllWFPrdQBiyRviIdmTEYVr3N9skuF6
	hjKhr8f5v8wsbD+xAsuJ91wmb3Dh60ZaCrERbVYFI4BVLnpQSmzadrkLIzsA8DysFUFZxPbHU3Q
	fZzfR+ThYYDUEVHPLThiUSO1JumvTu89eOL34eTrBGINfhnI
X-Google-Smtp-Source: AGHT+IGbmxeYbuSf4UFOcHr1yWL53zmkYtj0nTTb0gGeRj7tw8tZqugXM9pf8gJeuVWCt7aVFIhFpg==
X-Received: by 2002:a05:6a00:ad8d:b0:72d:2444:da2d with SMTP id d2e1a72fcca58-72fd0bfa867mr35103510b3a.9.1738679663479;
        Tue, 04 Feb 2025 06:34:23 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69b9cb5sm10859616b3a.107.2025.02.04.06.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:34:22 -0800 (PST)
Date: Tue, 4 Feb 2025 14:34:18 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	dmitry.baryshkov@linaro.org, abhishekpandit@chromium.org,
	akuchynski@chromium.org
Subject: Re: [PATCH v1 2/2] usb: typec: ucsi: resume work after EC init
Message-ID: <Z6Ilasq-FdKlfsYx@google.com>
References: <20250204024600.4138776-1-jthies@google.com>
 <20250204024600.4138776-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RwNGK21nKrpya7o2"
Content-Disposition: inline
In-Reply-To: <20250204024600.4138776-3-jthies@google.com>


--RwNGK21nKrpya7o2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Tue, Feb 04, 2025 at 02:45:59AM +0000, Jameson Thies wrote:
> A manual EC sysjump will restart the PPM and break communication with
> the UCSI driver by disabling notifications in the initial PPM state.
> Update cros_ec_ucsi to listen for PPM init events and treat them as a
> system resume to re-establish communication with the PPM (ChromeOS EC).
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index c605c8616726..5f17fcbda059 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -205,12 +205,19 @@ static int cros_ucsi_event(struct notifier_block *n=
b,
>  {
>  	struct cros_ucsi_data *udata =3D container_of(nb, struct cros_ucsi_data=
, nb);
> =20
> -	if (!(host_event & PD_EVENT_PPM))
> -		return NOTIFY_OK;
> +	if (host_event & PD_EVENT_INIT) {
> +		/* Late init event received from ChromeOS EC. Treat this as a
> +		 * system resume to re-enable communication with the PPM.
> +		 */
> +		dev_dbg(udata->dev, "Late PD init received\n");
> +		ucsi_resume(udata->ucsi);
> +	}
> =20
> -	dev_dbg(udata->dev, "UCSI notification received\n");
> -	flush_work(&udata->work);
> -	schedule_work(&udata->work);
> +	if (host_event & PD_EVENT_PPM) {
> +		dev_dbg(udata->dev, "UCSI notification received\n");
> +		flush_work(&udata->work);
> +		schedule_work(&udata->work);
> +	}
> =20
>  	return NOTIFY_OK;
>  }
> --=20
> 2.48.1.362.g079036d154-goog
>=20

--RwNGK21nKrpya7o2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ6IlagAKCRBzbaomhzOw
wsAOAP9KwEvwMM4veP7t/EEWT3nOr5yfNc4lDarAH4iwqV80RwEA7MMH1Rgjl5m7
yTBLmkCapqpKmyZDXJcwWYAq381pmAM=
=4d2D
-----END PGP SIGNATURE-----

--RwNGK21nKrpya7o2--

