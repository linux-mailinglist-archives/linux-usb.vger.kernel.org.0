Return-Path: <linux-usb+bounces-30878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C928CC82EAA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 01:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86A3F4E1B74
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 00:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A341D416E;
	Tue, 25 Nov 2025 00:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="00MxXMVb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8C15853B
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 00:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029771; cv=none; b=g3J04eAmnG+Ia7hVBz1s32bzqdv/J92UbsgRL40VsjDqae6nIJgYhtfpz7YM/lGZ+Pp1rpwsOG75drIRgoGyDsOnWXGe43H/VRjfJrYTshB96jakHAMxI+v8BR1v84be18a8L0fRnJpS/mcxmxYyI6M7d8wnKlhrQXWHN5WdZ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029771; c=relaxed/simple;
	bh=88K+dT75g4DX+0i8vO0KhQGeYUQrLnAqYrXSdijTo0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uxzbmnz3WUK0nOQDo3XfGiF37iaMmIYq/fjjsrRkoIDcrYxNpIlmebtlpjqVfVkMvD8nu///c+C/5Ex4kcA0rh18PbwpIughQ71nEO6RhfW5dyLyHzJlHH0/2Cuvctl7SrEsaQoPffdXP20QwZG0akVE5W6ehJjggxiRBBuNb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=00MxXMVb; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34374febdefso4988256a91.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 16:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764029768; x=1764634568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sLyiccFRketBV3KSBd0kecIXR8DpgWP+Guf8h/gF8aE=;
        b=00MxXMVbD8FOO4F4t0LN94IL5Szm7D/tH1bj16utOAupc6fR4bqNkBoFfLO/ScGzlG
         uBez248jA5ibGShdQGKhlP2XS/YRzxvcx/0btYVaYSgFo31QfMyRh5k5N9lwSR1nTyp4
         ksi2gqK15naORQtosAChDxzdK0Y6SLVt4lHzaiQaYPqtih55J+QyHKdE8y2xAbgvlhlI
         JKy4DlNSKB3B8Y7s+FRew3wUevKejCH6zq3wL/hJqeHdWhQCIofRhV0uwGmMMcD3M0xO
         SSLIwsvbCn0DVo+5o2r+aEXK6dm0zZJmGhAEmQJ6h706xOeopChzLnzMSTb9NcVJF7lj
         w/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764029768; x=1764634568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLyiccFRketBV3KSBd0kecIXR8DpgWP+Guf8h/gF8aE=;
        b=O89Tnc3bJY7tIHm/hmWbyxwsla36gwkmx7Exve4UKwoe+ShIqwWT8M5Fezc5XO4R68
         npk/+yI7VQ5CbJayAvOj/QRa+rWRfd6Ul8ro3pntz435xWGZ5pVL+uJP2c0efAmg8ipQ
         QZPntQD+T0InruPAeCftkqDk8RqAneqGDN+fHoL7rK4NOsg3DDookJ+8ZTx2y11wh8Vv
         75Y/vmG6JzGhLTkyUchOKgxTAZB6pgf+e5WrBpEZn9TxmZkWEe+k6pOJk6+oSaF85zn2
         HdCig2GvgRnGP+4cJeiQL/xfphgqT8jfULmBdF4d/18FKif+g/cWMVSevxV9+iDryDko
         2FUg==
X-Forwarded-Encrypted: i=1; AJvYcCWw6jr0F96k/hWX49Vqk2rVz8A/7razwgq5WH7Np42Xyz9qeEbi2Typ94Cw8QW43tL+eoC+2Mead9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiFOkywikgYl8AxqgYUMUog/ogh54F0kmAbKsKhZhesKFDMeBk
	zY/62gwwX2y3U5uxS0tqporlhuA8wlmQ8AGv9hNIjwZySrR1DM+iqFFbQ2Rdnqq71Q==
X-Gm-Gg: ASbGncv57NenjvvilUjDyKFpIvr2n8OaEJhT8uEA23v0XWz2Wb3WZhGVTNnbmpUsTsj
	y1mCnoyT9l0ieccx5SRjHjvk0ZD5/owvhBoi1Ltj1dQIyqKp3vh1EGe02AdVW6HwI8bKNAoWoDM
	hblD8lzJn848MhJgPnK89mbv6cpIUyb913abwknuPUsvJeE75AbibEy2AfG80R7pd1Z3/RUY7tb
	oNRsE7i35Y0yfvNbCUSq4yKifsh39/2IPXS2rHHiifcNM6btHJOqLDDVl4l52nGF3rWRVGYNbqq
	lJob6zHL8gdldCLHJR+2UKHiUM3dDFG+LpBORwR3kMJCZyJiX8qNiTjrKhPQAwezBO9oJPPrQl5
	V62iCILqDhcm5130cbpST7g8bZhnUYhsnTh8b17PcSRh1myLNaHBrG3Dyy4/7ITaVylYWMlLf0G
	1F64tno8mMN+Io3S7Or8GHvVbRvHD0avobyKSbB0XntZH9
X-Google-Smtp-Source: AGHT+IGtdLfcLagv9EE4VeSiSV3iYZFaLH51pSBBmFPOYtCNlvtT3y5HX/LP7IIpmk258K5p2Ee90w==
X-Received: by 2002:a17:90b:3c8e:b0:340:ca7d:936a with SMTP id 98e67ed59e1d1-34733f22173mr15245146a91.18.1764029768076;
        Mon, 24 Nov 2025 16:16:08 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727be2fa7sm14650194a91.6.2025.11.24.16.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:16:06 -0800 (PST)
Date: Tue, 25 Nov 2025 00:16:03 +0000
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
Subject: Re: [PATCH v5 3/4] usb: typec: ucsi: Set no_mode_control flag
Message-ID: <aST1Q4P6noMUNH3u@google.com>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-4-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3g51RXmLcEl65vM"
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-4-akuchynski@chromium.org>


--h3g51RXmLcEl65vM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 12:46:38PM +0000, Andrei Kuchynski wrote:
> This flag indicates that the PPM allows the OPM to change the currently
> negotiated alternate mode using the SET_NEW_CAM command.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9b3df776137a..82c3efd72639 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1700,6 +1700,7 @@ static int ucsi_register_port(struct ucsi *ucsi, st=
ruct ucsi_connector *con)
> =20
>  	cap->driver_data =3D con;
>  	cap->ops =3D &ucsi_ops;
> +	cap->no_mode_control =3D !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_=
OVERRIDE);
> =20
>  	if (ucsi->version >=3D UCSI_VERSION_2_0)
>  		con->typec_cap.orientation_aware =3D true;
> --=20
> 2.52.0.rc2.455.g230fcf2819-goog
>=20

--h3g51RXmLcEl65vM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaST1QgAKCRBzbaomhzOw
wu9PAQDdKItmjykXpe6LqnMszjGxdJRCEusikaqeHLi1zowtagEAi+/gREG4Ve6j
IsJX8A/1r97W3g3/o2N3KiBzUS5j4Ao=
=OYnM
-----END PGP SIGNATURE-----

--h3g51RXmLcEl65vM--

