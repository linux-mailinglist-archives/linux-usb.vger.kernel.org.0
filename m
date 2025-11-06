Return-Path: <linux-usb+bounces-30168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977DC3CD71
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 18:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDE7B18953DF
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 17:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163CD350288;
	Thu,  6 Nov 2025 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XaHPLzPI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8CD34F470
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 17:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450100; cv=none; b=lUp8fmwR9tL6jk1/Mgox9N7KsuVxR49RbMn8QImbCpoqGO7wvImovrQmAt1g641gQ1NRVHwhj6ApzqabGXTeVaS2C7LmjJkpUWPS8qrs71Mbu9DBA7s3wKtvpzqjDLXorhS9Wc6MFO2F4jgGZxvMmxrotQKJ6kRHcnHhBloyfdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450100; c=relaxed/simple;
	bh=oYf852XmPSnTsJPv2ICqCZVY+o8aM4NGtu/MMcDrPWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6ibUvkvqC4ZWq5zvKPGaSmfF41ItLwd/NAGElwEl+A9V80Q3lWC+9hlVhoPWcKf/1hOwwwp/GXG8eNsjbGE6KraOzvlOSi3ncgbmbFxehtY32xbGlOI8h7299VohTaZO+z2M2kOPSeRasqECTKMofXJ2hzFGmS1kHfBf45abQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XaHPLzPI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29555b384acso12199385ad.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 09:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762450097; x=1763054897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLBofMqKN3VaS7h4xsO2CKhBBssknoWp+VFnYQ+9NIQ=;
        b=XaHPLzPIM02VsOdfbUt6zi/wEgDft/LZ9LZfDcxBu9gPSlClQNeydtFaGgw9yWZ40Q
         BxnX5BxQgO9RGZ0riPY3gaJnPz/jl8lZQ3S2kzRuS8HFw/CWVsIiJBM1YzJL6OHDXE00
         8rIudFOM21CYGtbyHhIb/7wAwMk/tYJLsm0u1Dkj+kRNEIQ3gVr31VqFhiweaOs7w/wG
         12ZUNks+HMeM4SJbTOBkecqT7IbBGNH9oMD1zGUbEM4L0MbVbL5TieWQD+XhCfrhsBkR
         7d+zKrGNAHGd73eXon5p5dLCbxjIIxD1QrXMcuvH1WyLLeCZAhoNkt126gJxxw/GR1w3
         3rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762450097; x=1763054897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLBofMqKN3VaS7h4xsO2CKhBBssknoWp+VFnYQ+9NIQ=;
        b=aLQHMSt6S4BpSCfxsPgdBQSVnS1u1/Yl2CmJD1t7/Z+4ZKfI/BYppLe60A6WTm+fhp
         ma2l/bzootTXuH2VlDDRZv4uIcPaSja3tOKWyYkc5tZr3UILGokLuafxo95h4tkXCQdi
         k9UNOKE6Y9j+hW3VAlAm7nXs1a8BCMhoxruEafvORQ+Z74BdxDOQAOpwWB9u4MKHgqsy
         FiQjeY6pgzzrMFGhMQBmjzxwR10pfGiMp9okFrYZHYy/No+2M/rItP/Nzu68e2vzSVDn
         PXimv1QZr7yXUSOP/Z64HrpcXfn3qDqwORQOZq/ikwzaKcw5WTkEuYZfd3H3OxOlUHAq
         UwKA==
X-Forwarded-Encrypted: i=1; AJvYcCVSYprHvhJCUkYNr9bYO0Hpe6+EG7QCgpbPnZgNq9QJK/GLYb3P4tsmSvs9v3nYKLiESVv/zKGwGL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg969iOwSJ0oVSwF1FUitr4jSu8KHHWP4oKfVTkzXjJhOaVNS1
	TdQCArUC2t9851vj6I8ZOcmuI13A7dXsXRF+wvTzRQq0zd9xTfHpuPRrSuWaFHm4hw==
X-Gm-Gg: ASbGncvoCpW8xy4brQhMfMZRQkiKmWlvXSlCZxeOQZUnprWU/SsPdquhan8Nhll/mHg
	WSAtju22WHhFCw8Z3vfOj3lYutvS8n6CLi1imLbrzfoPuLBLTSRxVnIWYjPg4FMI1wZEugG8RCu
	2lgCHmL5FhYdeuOtOxJIZzCwMuzG5rPZQG2XYYpaPHO+TOaDkFxGJ3fRAYqsl5IllZF4BF/hzb1
	i4SBiBN9q/7ZDAbRPzg5zfKDWW+Sk7NRtR2KGljgroCVkZoNB2YknSkfbnC9KUq1rlc586h+KYq
	pzlSE+Dbg4HDjpzhmcV/Lkqe133hFrMRB/VoxsfTNzOmWGjAuwLl41u+rZfGrMDwW9/qX90PSwk
	LTEv8PItFSR1KoKnYrisI353Ilj/E/6Sgrdo8DLAaqUeB5if3/QoJMIHm1QEsaMdwclzNHbTRAp
	Z9sCCh6N52P28AjukSbbnraBsZX8iq4Ler7Pq2zWvbaWVN
X-Google-Smtp-Source: AGHT+IHBNC1jf6r38TkeQ/oHkizcoaleYcZliP5t+OWlYI2kyXAfaGDt97VYWBSTlcQmGkWVXUqktg==
X-Received: by 2002:a17:903:174e:b0:295:82b4:216a with SMTP id d9443c01a7336-297c049df28mr2482025ad.55.1762450096884;
        Thu, 06 Nov 2025 09:28:16 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650968298sm35077625ad.6.2025.11.06.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 09:28:15 -0800 (PST)
Date: Thu, 6 Nov 2025 17:28:11 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org,
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	ukaszb@chromium.org, tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: chrome: Add cros-ec-ucsi
 compatibility to typec binding
Message-ID: <aQzaq2ord0gK-gaL@google.com>
References: <20251013203331.398517-1-jthies@google.com>
 <20251013203331.398517-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XuiAe52XEjP5vh9N"
Content-Disposition: inline
In-Reply-To: <20251013203331.398517-2-jthies@google.com>


--XuiAe52XEjP5vh9N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Mon, Oct 13, 2025 at 08:33:25PM +0000, Jameson Thies wrote:
> Chrome OS devices with discrete power delivery controllers (PDCs) allow
> the host to read port status and control port behavior through a USB
> Type-C Connector System Software (UCSI) interface with the embedded
> controller (EC). This uses a separate interface driver than other
> Chrome OS devices with a Type-C port manager in the EC FW. Those use
> a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
> compatibility string to the existing cros-ec-typec binding.
>=20
> Additionally, update maintainer list to reflect cros-ec-ucsi and
> cros-ec-typec driver maintainers.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-type=
c.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> index 9f9816fbecbc..fd1a459879bd 100644
> --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> @@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type C =
port driver.
> =20
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Prashant Malani <pmalani@chromium.org>
> +  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> +  - Andrei Kuchynski <akuchynski@chromium.org>
> +  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
> +  - Jameson Thies <jthies@google.com>
> =20
>  description:
>    Chrome OS devices have an Embedded Controller(EC) which has access to
>    Type C port state. This node is intended to allow the host to read and
> -  control the Type C ports. The node for this device should be under a
> -  cros-ec node like google,cros-ec-spi.
> +  control the Type C ports. This binding is compatible with both the
> +  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
> +  supports the host command interface used by the Chrome OS EC with a
> +  built-in Type-C port manager and external Type-C Port Controller
> +  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
> +  System Software (UCSI) interface used by the Chrome OS EC when the
> +  platform has a separate power delivery controller (PDC). The node for
> +  this device should be under a cros-ec node like google,cros-ec-spi.
> =20
>  properties:
>    compatible:
> -    const: google,cros-ec-typec
> +    enum:
> +      - google,cros-ec-typec
> +      - google,cros-ec-ucsi
> =20
>    '#address-cells':
>      const: 1
> --=20
> 2.51.0.858.gf9c4a03a3a-goog
>=20

--XuiAe52XEjP5vh9N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaQzaqwAKCRBzbaomhzOw
wp2+AP9SJFEYIzmMX7wReFg8A8bTfAW9puN4rGeQqHGMqCl16gD9H9LsKtJexPSJ
wJa/rxDyLKo1A8lNbYjk+JggefOqAQU=
=Gu40
-----END PGP SIGNATURE-----

--XuiAe52XEjP5vh9N--

