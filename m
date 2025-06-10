Return-Path: <linux-usb+bounces-24635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BDAAD2E22
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 08:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71A65188FD7B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 06:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410FB27A929;
	Tue, 10 Jun 2025 06:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HVu56jNd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93CE278E7C
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 06:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538399; cv=none; b=oQQHVDK1+GiGJm35JBFOjuo9FptG4lcq9C+JNNHgk0CVP9nuEoPOw0MbBtt1iE+oCemXYMbrgkPw1aFixEVUEH4M+scssVZQYOJBKY/5+wWK44Rg/oXOJubl5AH4XBYRr4e9zibCYCcOV/B3FC/w1xv4p+z4WlVa3hlLG1TpkQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538399; c=relaxed/simple;
	bh=iyOd4HQzsqPbgprGkTnbglacQu9F+l1LR/UEgFtPOLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieF7LL3wGbwB96OuVdSoGy59H4NdP4Nhn+7+ttvk0PQCIxPj955MaAK+5SlRGwOs0eTdi9wiz+95YWfivNtYAy/XoKET1JkBkNOLtxmhcfhoXc6Zg++RlFPzzkAAiDlezAKACyuCVIGMVy7etcAOHr8bsvUxXNhz2VJ8OR+nUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HVu56jNd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451d3f72391so66013775e9.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Jun 2025 23:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749538396; x=1750143196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iyOd4HQzsqPbgprGkTnbglacQu9F+l1LR/UEgFtPOLo=;
        b=HVu56jNdzxlULSexBDvIrbnzf4Okj/ljPPA502WJ9rfdhvZq/VWyxi46uWpEcOET68
         pqLN1Ei1Y+7ZQCSv9D02biWQflEviPuw/3Ly76ebzC3hBQQB6NQxxu2JETMYpwVhRAIh
         elSaI6V9vIh4Z+4L0LSNhuQd2wp/b4I//gwhhdb6RKOjjs05Hs6lL/hBVql22YFdcnKU
         mnNvuu/dVAAbwKI3avBA4A7nK8que2dbyH+rfpNHKhMDbKw7OKfjogrSO8ypS17VGED6
         R1q2DnWjF1q0LzONAbmqeoN9YKTFtcCaXn82Cu4kMe8JqD8j9G8o55BVC/AzB/oOW9NV
         K/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538396; x=1750143196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyOd4HQzsqPbgprGkTnbglacQu9F+l1LR/UEgFtPOLo=;
        b=TuBf4hUYacV/T8x6q3eDkdr/pqH1qGdaxe8O9slaG/zwbVOKZB2PmDHWZgwYlujzPx
         gIwWWhYaPLqugxwyiWN2CB6l/Hqr4cUtdI2qKH+f0qsh541R9xfwX6nA1Rzi8gA9AWAW
         kates3d40U9xsjsTQyKvnIFDCvzVX91DDZyLAvaVbjm3QEYXVXYHSgd+Ksm5vtq5Wu5R
         Zk9xDZo9bsBPezcsiP3r/zDHHeQkKY/1DEi71ZfjPYqhl3N5P01wkv8NZQYe4Vxj0Lbf
         1Cv1pZ2/U/QQAZA2WK7JwTlv6mkzq6PLSI6v8a42gEFD0jGqS2GR+Y6VgmMoXqbv+kCz
         aFqg==
X-Forwarded-Encrypted: i=1; AJvYcCXP3SMp5d6tYAOp6CMXZrDh7kNvJ18/zPXbu0oDYA7o4BE8tT+ZvR1hRuol3JnSBIYoKdXUrqn2De8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8l2HcmKvAgMuZ5BgQ2EDB47UbcBjFEoBlJY0IOlAF9XWQ6MS9
	viNlB0+uMNPopze+SPUvtZGioUUn1fWCCL06s/lH99ZyPHcoNbrP0xh5jI3tNu/cfc0=
X-Gm-Gg: ASbGncvyRHNbq7KzCrBUy1lbO/DkdGYBxWAOqNrBH+OUdaA+vbP/rb8UxBZfgutxa4i
	iBq3ljdrOt+U4m7yu0tJKzuTYNLyq7qKPaA5YLa2aAzpKxX5Z9A6iNEGrKt8MTre7MlDSjzRcw0
	Xd9ENXd55OHMBheky/a6IJPGyAf9/BkPN4dAQJ/IerIJ3c0gMNkn4c7rjNsb0fgUfvu6PG+TVqD
	xiopXyUsSfq1aXoz2/3bk2lMsSRM1P/OHiN0umy9fN+ykV2ps1FVQl5CnpJTXs5zXOu2XvUWC1X
	q6bjK8wSRlSvMbETZVB/FkUjMKnW/8XrjpSestmfJbDvHidNt3AYNiuT8wDwT4eXjbCZdWGha8h
	sePvLmBdgExHaI8gVYl8ygbxOmZUxk7iNgo9o1eE=
X-Google-Smtp-Source: AGHT+IEs+YhhJZoR/pGvAaYaeAcRyr5uezaIhHxVp1Crs8g4CqMjqFGehJlm2hhZ0ehAlxYyCfBfbw==
X-Received: by 2002:a05:600c:b86:b0:450:cd25:e68f with SMTP id 5b1f17b1804b1-452014e9325mr128402985e9.27.1749538396165;
        Mon, 09 Jun 2025 23:53:16 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45209bc7391sm133955865e9.7.2025.06.09.23.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:53:15 -0700 (PDT)
Date: Tue, 10 Jun 2025 08:53:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux USB <linux-usb@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Felipe Balbi <balbi@kernel.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] Documentation: usb: gadget: Wrap remaining usage
 snippets in literal code block
Message-ID: <icl6osl67smwbaytqcelw4iwf75tvy5prkv5wx2t4n2xx2aybc@ec6keupto7dd>
References: <20250610031705.32774-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i3pyjm5b2q23ytxu"
Content-Disposition: inline
In-Reply-To: <20250610031705.32774-2-bagasdotme@gmail.com>


--i3pyjm5b2q23ytxu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: usb: gadget: Wrap remaining usage
 snippets in literal code block
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 10:17:06AM +0700, Bagas Sanjaya wrote:
> Several configfs usage snippets forget to be formatted as literal code
> blocks. These were outputted in htmldocs output as normal paragraph
> instead. In particular, snippet for custom string descriptors as added
> in 15a7cf8caabee4 ("usb: gadget: configfs: Support arbitrary string
> descriptors") is shown as single combined paragraph, rather than two
> command lines.
>=20
> Wrap them like the rest of snippets.
>=20
> Fixes: 5e654a4655c3 ("Documentation/usb: gadget_configfs")
> Fixes: d80b5005c5dd ("docs: usb: convert documents to ReST")
> Fixes: 15a7cf8caabe ("usb: gadget: configfs: Support arbitrary string des=
criptors")
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Looks good,

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--i3pyjm5b2q23ytxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhH1lcACgkQj4D7WH0S
/k6R+gf/XuFME9waQUBbNlezcsZwYX9GBHRc4Tf3As1u1de0Sddp6pGqTQdZnKaF
WRnRPeQ6vLnJEL4ng8q0ZDUSms2Kq1HVO8esuGb2FJxdbtSlh+bE8lFEoH5cxND2
Of8pUR41cvkVYz0keVmk2TqEqM7B1GUotrUTu4mXo10+qwevDDLCSvyZlD271Hwn
OVdakodfZsKZ/0nhiAeBvykYXyuuYLmeKevCQC3pRvLulErjTEA2sXloC3MueFCC
GVdRY9ekj+Q4l6lSuwBrKK8lrXQw1RPOutCfGSJtCCvA+lqjjtIJ/esaR/ZwyfNZ
cwTxQw4fq3m9imucca3lXK0ks1D80g==
=2vMM
-----END PGP SIGNATURE-----

--i3pyjm5b2q23ytxu--

