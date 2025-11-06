Return-Path: <linux-usb+bounces-30171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 174FDC3D0D5
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 19:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB9E94E128F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 18:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E15350A32;
	Thu,  6 Nov 2025 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EsYWlP1A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118D334DCE1
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762453120; cv=none; b=PecMzwj1cllTbgEYGOf6XCPVOv26WgeUBo+y0XWTS4NU4XCGImkJOG/h1hnnk8HAUCeuLNWNEIpvX3UvQlFJaG9nygDzvr8yzEpHU+O9UKsFp/8KCbcXguEu1wve5SjSNK7yXa4yGhTYD6Xx9+6pB4jv8TupFYWlVQ+TEXKSV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762453120; c=relaxed/simple;
	bh=oMS8T+OT/9Nui4b46aIksLQJ0N9ZjMFuDvzZmhiJqww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hy64FDrmvQYHOqbNlMgBS5vff+5/FFhYPte0/MzjPA6GisHOokN6TSgp8i/yZdE1TiVTe+l2v0O7WCUQcOuRXUC+Txymo8WtwaYW+1jpTIZ9/HFxgfkEL7r85qqHuwZsFCRCFI+VWbwRGxK1snAGYcyWgBQ/tkk3PwUAj4Nid50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EsYWlP1A; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7277324054so202285566b.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 10:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762453115; x=1763057915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FN9+63BCY6a91Sh11P8wg56sTIKFRq6Ev4z9/iG60s=;
        b=EsYWlP1ADJyWJPFJt8M1pGT5r7dFof4P7To9cSsuwzhEt2ALxkPkUrN63ZeXMIOXs1
         Pvy5q9FeRTMhGbGov7O2U6XLQT5ZlY0G5RvtiIiSY8vMsLL0Sv9QTfr4NHwszUCiXs+t
         VRjQXFXylzOjljIjiiL8cp/bY1l4meidbZoS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762453115; x=1763057915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FN9+63BCY6a91Sh11P8wg56sTIKFRq6Ev4z9/iG60s=;
        b=GCLFnwBpwJKs1ngScjPQJF1sqsXOQEP+8RJph82HhtlzosFWpGd1D+zmgJj33quTX4
         heeR4COjFwbGxncFHJ69eEOO7nTSsJKsw5F9XlbUsNwQKL9cy7sZquB0mDJlEoNnLgx3
         7vwhP3cVDfbdx8LoVy4Lqduv3pWn926c1Ss6kztd06SaDRjdK9rYRhZBzamejfLa2wxu
         AaxKB7IkUZSwh4lqJVNKwObEQY0INVH1DU/zGhrj+Ms+8dVNzTw6q4QDNpZ3+SAfyS6r
         WoQE6ugogtrWJc+5Dw/19uU9U1RlG9TfLps3kZkmEb6d8MLtv1iNOEQ5RYoZ8rHM8YR2
         CCEw==
X-Forwarded-Encrypted: i=1; AJvYcCV2xkpH17Q/ZyjGgycgKN7k/YNJYj9PXGAV6fzT2T6wC3mdtRyH3lpVwQxigcVXW3mOUh4nx7r8jCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+9sbotUN32J0loGJJh3W7ebyhSeY0KbQa8RH8B/ISlfvuRSqG
	ZA6byVI2OxERaVPLH29Jw12/f5CpMrUDm0hL9ul8hKLGgWN6KIs2p7PPAgZ6L+eDGlb23/gRHxK
	TB7u6ivhcaMQba3wN40gZXd6VPsgRxZvGuvQR3OkH
X-Gm-Gg: ASbGncsJe7tDQdc3Co04qJzPz4HtjR2qswH8Sm0RU/SPc8zuGEoRlv+Md1vyQYp5KJr
	edJ3OfgJ7fWtKDKHkBpRD1peiYqWAE/ohDy5YLsObxImrg7H8V3PYr/LshLghD9m2eUSh29UkYb
	SkSKmhvgcaX4Ce4LU3DdGGZma1zaJ6sJ90k2Qxkt4HeokmSjNBIpSKDuVJGn49VGsWabEQnLIav
	QjLVOCvwJyqAedX3cpTahT+Y7ZtsK3wxoxOdCzRhIvYUa63dMtd2BpCY+juaRkeISggyCPljfLL
	iqw=
X-Google-Smtp-Source: AGHT+IEP/nwzlykeSLaebiXJLfmr7cwOpqfsasygiy3POXKTjyaWp0Ppxd+0Gxo3zqPuZbdRPhQDcPYGjLKAO0sPWyQ=
X-Received: by 2002:a17:907:3c91:b0:b33:b8bc:d1da with SMTP id
 a640c23a62f3a-b72c08e023emr12144066b.1.1762453115425; Thu, 06 Nov 2025
 10:18:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com> <20251013203331.398517-4-jthies@google.com>
In-Reply-To: <20251013203331.398517-4-jthies@google.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 6 Nov 2025 10:18:22 -0800
X-Gm-Features: AWmQ_blOKtSWKrioiTuTVnOpd2P7YQAJP4q98Q_uCp-RggagsBRvuHIuk3LHNVM
Message-ID: <CANFp7mV0FjZ-4OB8uMeVfyQn_BAMhnhYs-w+ABzupoiiywN1Gg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Jameson Thies <jthies@google.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org, tzungbi@kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 1:34=E2=80=AFPM Jameson Thies <jthies@google.com> w=
rote:
>
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev mfd. cros_ec_ucsi will load from the OF or ACPI node.
>
> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Benson Leung <bleung@chromium.org>
> ---
>  drivers/mfd/cros_ec_dev.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index dc80a272726b..1928c2ea2b8f 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2014 Google, Inc.
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/kconfig.h>
>  #include <linux/mfd/core.h>
> @@ -131,11 +132,6 @@ static const struct cros_feature_to_cells cros_subde=
vices[] =3D {
>                 .mfd_cells      =3D cros_ec_rtc_cells,
>                 .num_cells      =3D ARRAY_SIZE(cros_ec_rtc_cells),
>         },
> -       {
> -               .id             =3D EC_FEATURE_UCSI_PPM,
> -               .mfd_cells      =3D cros_ec_ucsi_cells,
> -               .num_cells      =3D ARRAY_SIZE(cros_ec_ucsi_cells),
> -       },
>         {
>                 .id             =3D EC_FEATURE_HANG_DETECT,
>                 .mfd_cells      =3D cros_ec_wdt_cells,
> @@ -264,6 +260,23 @@ static int ec_device_probe(struct platform_device *p=
dev)
>                 }
>         }
>
> +       /*
> +        * FW nodes can load cros_ec_ucsi, but early PDC devices did not =
define
> +        * the required nodes. On PDC systems without FW nodes for cros_e=
c_ucsi,
> +        * the driver should be added as an mfd subdevice.
> +        */
> +       if (cros_ec_check_features(ec, EC_FEATURE_USB_PD) &&
> +           cros_ec_check_features(ec, EC_FEATURE_UCSI_PPM) &&
> +           !acpi_dev_found("GOOG0021") &&
> +           !of_find_compatible_node(NULL, NULL, "google,cros-ec-ucsi")) =
{
> +               retval =3D mfd_add_hotplug_devices(ec->dev,
> +                                                cros_ec_ucsi_cells,
> +                                                ARRAY_SIZE(cros_ec_ucsi_=
cells));
> +
> +               if (retval)
> +                       dev_warn(ec->dev, "failed to add cros_ec_ucsi: %d=
\n", retval);
> +       }
> +
>         /*
>          * UCSI provides power supply information so we don't need to sep=
arately
>          * load the cros_usbpd_charger driver.
> --
> 2.51.0.858.gf9c4a03a3a-goog
>

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

