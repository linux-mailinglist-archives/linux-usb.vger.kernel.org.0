Return-Path: <linux-usb+bounces-29100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE8BBCAA92
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 21:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 70CBA4E5E2E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 19:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD9225742C;
	Thu,  9 Oct 2025 19:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d9HgJu3v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234F204096
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760037133; cv=none; b=bOhTkH0FoQwSrYsI826h+ACMOGx+duewUhqNNSUmTpCgPzv+qX9v9A3Wk0522I11DsDeDaf85Q3EkGBPVzag8/VRVDvP2fgVIh4WI6CGif6PYQCM6dQujsTHQM6xxfkcTjh1DLDYqpubyS3jtB/+l5eFy+zMJXRZou2dDZMi22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760037133; c=relaxed/simple;
	bh=n1pgm9KXQpsmFTJTlrRTqqoc3StRiW8H6U0QmRxjVIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bemUA2ALZzgUh5lf4tZJW6l9B7Pda1hMVqn7pMv3jebrw42KMwUv3LBHLqCX38ieRwuMatxtLIDB8K+9udXDFFZCGBxcpXE5ku346YvCftH3afd8sA6awcU7YAQ3wMGzN7+suvdIq59bsb4Q89fnck6MdrsDryrBL5Z8XnOLl7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d9HgJu3v; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7835321bc98so1329336b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760037127; x=1760641927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwOoGI07ldKNXakHc31vPQT9U2zxbYTfJdNYRER5vcU=;
        b=d9HgJu3vW9MKHQkFwYU3PbzAyaO/2F4IrrQ55xALGSkFD4BdBTv4D8rxhEYRVZywQ0
         2Y5em49M0Ngn1pzEo4sDa7ClL2Z7MrGrTyrPKJFRnsqlyOVEjIMT21bxE72IkvI8gTg4
         aqf06165OsxMeJlYpmUW5PzWfbC19DscI+wZcnrxDta499QbSjzdGzRQkuVGTet8DJHa
         fmyDaJZCudN6YFn6ZEQo8+XtDAg+b8W3vLJuhBDXlmJAFgY05+nUaypKT+/5DBtvYNv8
         ZJ7wFiWUaByPm9IZ8Bbn4O74ZXaZfIK3pEbARGOzR3RVuIUMS4TVBsCCzuGLP4TudW13
         bSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760037127; x=1760641927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwOoGI07ldKNXakHc31vPQT9U2zxbYTfJdNYRER5vcU=;
        b=YOGv/nDYJLA3f/Z+CKaaIX1JDt5ivdFzYEqGBDpxlPLa0fsyAxl4PUZVL50OmGAFfO
         26h7dKsG7Fu5mLfR+Kt/wAb3Uvwk9Xt4+gKQj0q5JjSZSOwsu25bVk+WgZe0Qu0nrTCq
         2JGjcN6+tPmBN8biXS+7CS5K3gcIyKrWX8rrlUi9lGiX6TZJJQtJy+Srfz+51TBBaI7t
         6xJzaBzv7L7hmzgQXucZpkgBCTHbN7/UyEXWfLb87647NRs/PnlOvFL7T33Sy4cZN/Lg
         jPr7Ok2sRxVbiKh/yBN21OkPuXHXXn8VqaaaXUf2pgaEb6fptUxD2OikQmESNZtrgSXB
         Clwg==
X-Forwarded-Encrypted: i=1; AJvYcCUOYM22W5NjKT+ueZYIYqOGpK8zKTeLYzvoKU8QatycpRpfz30BSVv0jYo9oW65O5h0kBHgd/+u0GM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTSiMKzwNFItTngZwP4tLdDycoLIBsb9sUUlY2BjL13bDRcpGD
	GyfgAj5d3edcgAUUFTXSma78QaMdgsn1sZaAilJP533Lw06Q+ZNKw3upqC6igHhCsQ==
X-Gm-Gg: ASbGncv7kkR33dGPB787xY6R/ugcfa1VsiMaBqLPq3p9s0gQYutaFhd/kLuZSriHm9L
	bWN/mXnDqH0Bg4LzKbnLoEPdaWoMvmkE/qOimpzHsTeDIck65SH/ULYphHz+j+ko6p4iUZBVVmG
	ZTGoS6yOt+jFmlwJ9WN7JpMwNBwP/+LJbWpIAS44+5+h643bYYfZe9L/lShfv9lxjGiQp9Tgr73
	RXsulO4ohrdZQiTlCNV+YXop2G+spUVPtJcEo2X6WHbd9b5udFTg7wQXgdlBqBvwTO2R5VprQlp
	rgpUZ5RSVrILvOrbJ1KUFzNNqB+LWvMpC13gZOQ/l1fTxXk1oK5TOJMwEDsWgmG9gvRZrLE2Lc6
	PYB/VNcHiHOilwbdiyx572/5lOIw2em6AgeoYZiMy2QoDGJXvRk4j429oo+AnkoLKFMjuzzUoSK
	f9OO/q6fflkg==
X-Google-Smtp-Source: AGHT+IH72sDrXwwkrDO6FWG06LbsT+R2CV7vzjUVeXBnwqtete9TvLbCDH2IOKZiEWq/Wu1NWkJrRA==
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr9925673b3a.21.1760037126658;
        Thu, 09 Oct 2025 12:12:06 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09659esm480905b3a.45.2025.10.09.12.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:12:05 -0700 (PDT)
Date: Thu, 9 Oct 2025 19:12:02 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
Message-ID: <aOgJAtdd_M62cnR6@google.com>
References: <20251009010312.2203812-1-jthies@google.com>
 <20251009010312.2203812-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ck64/QEIf9Tlz/RB"
Content-Disposition: inline
In-Reply-To: <20251009010312.2203812-3-jthies@google.com>


--ck64/QEIf9Tlz/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 01:03:07AM +0000, Jameson Thies wrote:
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index eed2a7d0ebc6..62b80ad85a68 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -5,11 +5,13 @@
>   * Copyright 2024 Google LLC.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
>  #include <linux/jiffies.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -235,7 +237,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *=
udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
>  	struct cros_ucsi_data *udata;
>  	int ret;
> =20
> @@ -244,8 +245,11 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>  		return -ENOMEM;
> =20
>  	udata->dev =3D dev;
> +	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
> +		udata->ec =3D dev_get_drvdata(dev->parent);
> +	else
> +		udata->ec =3D ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec=
_dev;
> =20
> -	udata->ec =3D ec_data->ec_dev;
>  	if (!udata->ec)
>  		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
> =20
> @@ -326,10 +330,24 @@ static const struct platform_device_id cros_ucsi_id=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> =20
> +static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] =3D {
> +	{ "GOOG0021", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
> +
> +static const struct of_device_id cros_ucsi_of_match[] =3D {
> +	{ .compatible =3D "google,cros-ec-ucsi", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
> +
>  static struct platform_driver cros_ucsi_driver =3D {
>  	.driver =3D {
>  		.name =3D KBUILD_MODNAME,
>  		.pm =3D &cros_ucsi_pm_ops,
> +		.acpi_match_table =3D cros_ec_ucsi_acpi_device_ids,
> +		.of_match_table =3D cros_ucsi_of_match,
>  	},
>  	.id_table =3D cros_ucsi_id,
>  	.probe =3D cros_ucsi_probe,
> --=20
> 2.51.0.710.ga91ca5db03-goog
>=20

--ck64/QEIf9Tlz/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOgJAgAKCRBzbaomhzOw
wtyVAP0TLJub+b5vagwrk3iMRa/VWY57prIisehNkOjcgtnzmwD9FkRZPL6JqvbZ
fL2S6Q1rkPu0rq5K0Fteq+E+dV7jbgw=
=d2GV
-----END PGP SIGNATURE-----

--ck64/QEIf9Tlz/RB--

