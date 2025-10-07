Return-Path: <linux-usb+bounces-28977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D87BC28AD
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 21:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00E5034F4D0
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 19:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44D9227B9F;
	Tue,  7 Oct 2025 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pTsx9F7B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95332E093A
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759866227; cv=none; b=tN8wiODc3qijLAGxoppvLZm8o0RvKJ8OCBYvKIrxb25pU/8sRsCrS1dLzyCNXMrltofxkDncHqxzLh2vZKuUFZ645wTpfXcoQ7GokvixO0+ZLR4/8SCth4lmadw4DrzrYLBQM9AkJn5VjyuAi1KHg2caX8qnI1kNbFtJi20ppGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759866227; c=relaxed/simple;
	bh=xZMyj1txn9yNEkPj4jndX7PoAnwBnvLHxpXeVdkrCq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkkF74nSNeRkRI4wi6vING/RtJzyOZC/9Zn4v8ZXvG5FNqLsMwv/ocPjiGYdt8mfV7WOpoaE+UdG7afEC28htfFxD+ZS4BLfWsgNTa8Ffuqsw8Y1Z3x1dXElg01e+X7raUY29Udqov/0VWWQDUuZ7bPy5VEChXRH+wj0o8LB8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pTsx9F7B; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b551b040930so4423457a12.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 12:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759866225; x=1760471025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPY6o7kS39nLiixzOv3LoRY6a9yECDfRcVUGAGn0FOs=;
        b=pTsx9F7BsgZPRYh2KnIata8/xdXru1GTKciZdhrXz5+jIE5lZL8mctpMkE7kMX05V7
         WNJU5PRBGrc0D28euwdq7O0ovI4NZuLiccuN1EbFDJD9wnc6g9+Cs1uOTj4vaVOsMlVD
         tEFGShJJsqjrE6/7d+anIKixZJmvgkXNWK5td5J52yyAqhjZpdbVby3h8vfNWoJlMel/
         TqR3N1PUFo6zT9C5gb/W7mDS+ugp283q5B6Y7GU89Q5xz4xvimX/nZVpa2f9yh7N9T5n
         qZojBLl14YsZtzHu5kY0TCE1QPAIqqZYCQC26Yjx+djJcbMQatcEm974VMO4ZLgfVdpv
         Y9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866225; x=1760471025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPY6o7kS39nLiixzOv3LoRY6a9yECDfRcVUGAGn0FOs=;
        b=EkjP1/OrT0AfEf/ushESbUuxGFwLGr6zh1Z94vKOJ5eFcCwzXoN1pJ+ymCRLcIfTrD
         3c9b6F7oPREImU4NWqoH5wbzNDlZjbZ9txEnagCJc0+wreW+blH8mkBvyUrunTNOiHI+
         LTymIoFKIl+jYw5qQ7s3YZf7+ENRI1aqjgf5kNQOho0M6munnJ7pr8x9/xfmeHc+FlAJ
         35fHRvQj03pxEASVpLqi1tmQlT++fGv8QQIStwSAH7NITBMZsyIvLeLvJetJDfwhppyJ
         bE9gVQPboGciFNuIXoqOwlNce+lrLiGd3f+0c/r2vU9Kd51nZIiE9asf/D53V59metYM
         qrPg==
X-Forwarded-Encrypted: i=1; AJvYcCVTGKL4nnkIUSjH4jQ+8RuuiTQ0KVKbd2JLg73HyTvtORy5+9UVQijiwvYxfSQ+zrOaOzdAwPhK8Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39H81VPehuLDtdnOvVHhNzIse0aqxGI8aSWCoLrXFuQ8rCjl/
	6TfYZgqBi3/eC+MP7QBAouszM2QepeWXShZSqrzvemM8SqNNoprkz+Kx/e9IHvKjhQ==
X-Gm-Gg: ASbGncuIU9mWXC/WidmO2QhT0SvBEcKUXXwfOW7XGxLOdtQGpjDwAh2JizfRjQQWPxa
	1rvNiD3vpFiiSXKCsFe31LIAkXkSMLcNTpV/gMKhvqYz6Lqn1ysPB6z7O/o/kPnwgK59vdqW7mZ
	hlVvh8i4IAa8CX/G+DTWZg9Fex7+a1NKAfmQoYF5xHGHMQSIPVI81amr5+hRzUL7Qo3C+AE5v6E
	Bbydy+G8mCP4YfX7QCH6PgzSm+07ZpbFLCxPRm/WzE/Ekvj8lr4rU1PZC4G4W6IAJgW2vIlhZT4
	zqU5pgRHMd4bG750ObOfhkRJkTzKxyfqLkumuu3KDcSDWW3yV3lJmzYpno2+JnTRKOJNboY8XjV
	aXeaEcPwuHcVh/0JqdaNaVzw+28CkhkvGMQe9S99AVoyYBgrMf9IJ6FtoILVv1suQZG4npHB3Vq
	Dl/bV0zepP8lKhhvz+tIvQ
X-Google-Smtp-Source: AGHT+IE5SIvyP4eUf3ipqqD5UvRzEUwKrkkptQOc7fcVjGhgP5yFTG0+Dw+sZtrUtx3Ml6RCP26bLg==
X-Received: by 2002:a17:902:d60d:b0:269:8407:5ae3 with SMTP id d9443c01a7336-290272f8283mr11547605ad.54.1759866224509;
        Tue, 07 Oct 2025 12:43:44 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b93f1sm173669135ad.71.2025.10.07.12.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:43:43 -0700 (PDT)
Date: Tue, 7 Oct 2025 19:43:40 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <aOVtbDOl1w4RXEfi@google.com>
References: <20251001193346.1724998-1-jthies@google.com>
 <20251001193346.1724998-4-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AVuZMM5ghkB0dxRG"
Content-Disposition: inline
In-Reply-To: <20251001193346.1724998-4-jthies@google.com>


--AVuZMM5ghkB0dxRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 07:33:43PM +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 40 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..b0523f6541d2 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2014 Google, Inc.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/kconfig.h>
>  #include <linux/mfd/core.h>
> @@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subde=
vices[] =3D {
>  		.mfd_cells	=3D cros_ec_rtc_cells,
>  		.num_cells	=3D ARRAY_SIZE(cros_ec_rtc_cells),
>  	},
> -	{
> -		.id		=3D EC_FEATURE_UCSI_PPM,
> -		.mfd_cells	=3D cros_ec_ucsi_cells,
> -		.num_cells	=3D ARRAY_SIZE(cros_ec_ucsi_cells),
> -	},
>  	{
>  		.id		=3D EC_FEATURE_HANG_DETECT,
>  		.mfd_cells	=3D cros_ec_wdt_cells,
> @@ -177,6 +173,16 @@ static const struct mfd_cell cros_ec_vbc_cells[] =3D=
 {
>  	{ .name =3D "cros-ec-vbc", }
>  };
> =20
> +static int ucsi_acpi_match(struct device *dev, const void *data)
> +{
> +	struct acpi_device_id ucsi_acpi_device_ids[] =3D {
> +		{ "GOOG0021", 0 },
> +		{"", 0},
> +	};
> +	return !!acpi_match_device(ucsi_acpi_device_ids, dev);
> +}
> +
> +
>  static void cros_ec_class_release(struct device *dev)
>  {
>  	kfree(to_cros_ec_dev(dev));
> @@ -264,6 +270,30 @@ static int ec_device_probe(struct platform_device *p=
dev)
>  		}
>  	}
> =20
> +	/*
> +	 * FW nodes can load cros_ec_ucsi, but early PDC devices did not define
> +	 * the required nodes. On PDC systems without FW nodes for cros_ec_ucsi,
> +	 * the driver should be added as an mfd subdevice.
> +	 */
> +	if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
> +	    cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM)) {
> +		struct device *acpi_dev =3D device_find_child(ec->ec_dev->dev,
> +							    NULL,
> +							    ucsi_acpi_match);
> +
> +		if (!!acpi_dev) {
> +			put_device(acpi_dev);
> +		} else if (!of_find_compatible_node(NULL, NULL,
> +						    "google,cros-ec-ucsi")) {
> +			retval =3D mfd_add_hotplug_devices(
> +				ec->dev, cros_ec_ucsi_cells,
> +				ARRAY_SIZE(cros_ec_ucsi_cells));
> +			if (retval)
> +				dev_warn(ec->dev,
> +				    "failed to add cros_ec_ucsi: %d\n", retval);
> +		}
> +	}
> +
>  	/*
>  	 * UCSI provides power supply information so we don't need to separately
>  	 * load the cros_usbpd_charger driver.
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--AVuZMM5ghkB0dxRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOVtawAKCRBzbaomhzOw
wmRYAQC++OoC5q1mBE/1huCJjMRFkqmQs/g8WPoS9w/QsoyC0gD8DywFVX8m6bXV
rSfJcTnDduy80Nfk8IhLCFhVH1L3cAY=
=Cikw
-----END PGP SIGNATURE-----

--AVuZMM5ghkB0dxRG--

