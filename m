Return-Path: <linux-usb+bounces-31963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF2CFA203
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 19:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7EF1304A8F8
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF8B358D35;
	Tue,  6 Jan 2026 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oRKeezUN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DAE358D27
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 18:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723639; cv=none; b=em2yksapKSFOg8zhErOpFzkcgEiiKVuWLNrYLEjVcjj68TO0KG3KTi8/0FgyIbSjHwNwucxYwDmyWFA0/IGwzqDdodMuEk8TUKo4U49bW3KWDY5UoQcse3Fot0ZAhhKALiy779gDi45ujKviGZ9a9JSASbMo7FJkhg/KH9TwXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723639; c=relaxed/simple;
	bh=oLByWGhMmtlgQrCsAJkw5zSyaU3rGCFxQdBZznTJe1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRNylipn++dhwwhHnBdqiHvL7dfP/KNRBhZxnA4tWfiaNnEWegDrknMpHslVpacZzg7g37VCn2HxQl+BPBMLRDzn94gJi13n4XfbpxjtGn0UYUpM8NRudZhruGB1kQYmQWbRxbMd3qLzn7BynHKwe5Xqe8xiafJlK0Ra7lXvqf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oRKeezUN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f651586be1so51761b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 10:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767723637; x=1768328437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nal+3dw5fP97GxbQVBy3+yEoJhPzTcTc56UQ322E1m0=;
        b=oRKeezUNeWI3AtKNsvOUIbdB9CvrIpJ0XH/M2YlbQLolvHhigv4asf7Pqiwp5pAaqR
         inzM91p0as4xR9GDpTe/5n58KmuOcp1pT1nTxNH6n9Zppk2zgWCht5j8AaSUf91lO6qh
         UqydOCh1MFfsM2JUiCNuqusGVWxy/dKjutZNLvTVlrKX7ExvXFYEdmcEUnVbqkbEGgiV
         zRLbOTKU3gPHbQ2TJvh2YCA5sAnTePoBsbT77bKx/j5SMMzPHo2h+/u+8vD6bwNGMwCD
         SAONXbSYKBcF/xBFJuYnflXQc8D0KhrQ64JlrDZDtZ6aXhFqnuMmh5yOoh/VRfaTaZzT
         8W+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723637; x=1768328437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nal+3dw5fP97GxbQVBy3+yEoJhPzTcTc56UQ322E1m0=;
        b=dW3LekD21vdZPs4mbV1uECl/fVa9Sc4MoPt/EBw7KdACtKaQPv7zasxWgVbvfK8YKY
         9qITnlEwZlV12sJrpnQg3liu3JClvcDYAqwCxeVKWIOJEbUoen308eV5MmAYKqKgeHaY
         zL8PxS0+NxQTdBfRVisRfqsjpsPI125Tw7L2R2T4XV6jYVOUF66LHWQRAoGPCbUDpx1z
         2/GrK15w2wNoMlVX1h2hjwBOfOQdfA4rdK9rBanNADLSWbKeFNdG84GP6ukKyJnMtQ3T
         BsarZNMJ6krTQLbOFW/yh/viSKh9sRIvSpK3xGKh6BKYxZtuaFB9+BKtUZtf7Al7urRi
         lRwA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Z2cXBy8gXdkTNyG/d2TZvsbYrYRFdFGZNzjYenxWJPLWLwCHj+g4bLydOlOlFxTCg4EegituWfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTrD669qvAgGOlTAxK+V2TMiYmjH+M2CNLPgbOBNNoIo94xspy
	95YTRLaKmq7iFbSmop156I0mHBkNqXlHMsjwLVkObyBbfyZWwVp/HCPpSLu1U/uG6p0/G+h1HYH
	bdkvZZg==
X-Gm-Gg: AY/fxX6sWwEjbObq4d+Pq3+H66h47bMQH08QG+p2ZnRFu9tYJ+EJVwmpxHsD/t+zYdk
	hLgcUY/8krQppr7wC7uInhP6vE60CTjMuHiRiEsEUZQYXMD0B1n5MWnZ/fyg3PZ0cQt1J1nsoMr
	yMYceMQjgfDAm0IFU37MyOpSuBk7sNST+jmEMFIeCYZdz/jl0AsnOZD9pRFlrAKAsOW5IwvItm7
	Sny4QfLosBd1qS0jH83ey0lqeev9GGCF+kgPXPoRVuHNKK8v2aoCGKfEcpWF2+m5ZZ7aWsR+YOl
	nj0aS5nSYFMygASS1oONO7TRv26xW6gJ5ufAnJHoIpmFNtL51rFA2RHSO0EQgQ+keH+ErUGmiRf
	dLLmLJM7TXu8F4NmD74JcI1GKzniPU7+BJVSMTC5xbZZAcqFaANEvXC7n0gwijuvcECdn1VEBO4
	aCCARaKPXqh31dGOfMWSneCtmFwStJDW64jw8RTuTrQbCg/d8=
X-Google-Smtp-Source: AGHT+IHyiezq7NO6P7x1v6a5YBj6fT5NMMsYRIDC1EFIWEwc4hQKCw1xy+mxsH0VmR1NKivkha+gQg==
X-Received: by 2002:a05:6a00:330d:b0:7a9:7887:f0fa with SMTP id d2e1a72fcca58-81b7627355fmr101158b3a.1.1767723637146;
        Tue, 06 Jan 2026 10:20:37 -0800 (PST)
Received: from google.com (228.88.145.34.bc.googleusercontent.com. [34.145.88.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm2780880b3a.16.2026.01.06.10.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:20:35 -0800 (PST)
Date: Tue, 6 Jan 2026 18:20:32 +0000
From: Benson Leung <bleung@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	chrome-platform@lists.linux.dev,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: drop an unused Kconfig symbol
Message-ID: <aV1ScKQ32hoOQB1G@google.com>
References: <20251228190604.2484082-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrW8ToQA95dUcYcA"
Content-Disposition: inline
In-Reply-To: <20251228190604.2484082-1-rdunlap@infradead.org>


--lrW8ToQA95dUcYcA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 28, 2025 at 11:06:03AM -0800, Randy Dunlap wrote:
> EXTCON_TCSS_CROS_EC isn't used anywhere else in the kernel tree,
> so drop it from this Kconfig file.
>=20
> (unless it should be EXTCON_USBC_CROS_EC ?)

I concur with abhishekpandit@chromium.org. It looks like this was a typo at
first, but removing the depends should be fine.

>=20
> Fixes: f1a2241778d9 ("usb: typec: ucsi: Implement ChromeOS UCSI driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Cc: chrome-platform@lists.linux.dev
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
>=20
>  drivers/usb/typec/ucsi/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
>=20
> --- linux-next-20251219.orig/drivers/usb/typec/ucsi/Kconfig
> +++ linux-next-20251219/drivers/usb/typec/ucsi/Kconfig
> @@ -73,7 +73,6 @@ config CROS_EC_UCSI
>  	tristate "UCSI Driver for ChromeOS EC"
>  	depends on MFD_CROS_EC_DEV
>  	depends on CROS_USBPD_NOTIFY
> -	depends on !EXTCON_TCSS_CROS_EC
>  	default MFD_CROS_EC_DEV
>  	help
>  	  This driver enables UCSI support for a ChromeOS EC. The EC is
>=20

--lrW8ToQA95dUcYcA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaV1ScAAKCRBzbaomhzOw
wtQmAQCkXPYyBFkYXYeaYCCX0Rara5KgsEYng6pNWk9X7E7P7QEA5cDZHhYIJIS7
MHum8EySQPaVN9zafNjVTFRVVfVLsQg=
=3tHD
-----END PGP SIGNATURE-----

--lrW8ToQA95dUcYcA--

