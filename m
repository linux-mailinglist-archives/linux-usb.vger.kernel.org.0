Return-Path: <linux-usb+bounces-20115-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D941A2747B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5425B1885C76
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 14:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AF6213259;
	Tue,  4 Feb 2025 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDxtYWzA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702AC2135B2
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679717; cv=none; b=tMPly7AGknXZSy58eFM3FT1GLZUd4Tp7brb1uDGtM7ScDswVshf/pyenpqc92PgIM5QxZ+LaeNQNJgpLgIKxexjGrqGo5tFTHBWopdPpdNza9LpenguTOj9JyBAZScKxvpWyZe/+9jV3Y1Y313QkFcLaKK6kirUxQoLPdvza8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679717; c=relaxed/simple;
	bh=tcMOhxTSOwD2c6GuVYis4DhDURKjK8Gnt0lKkjG2irI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8680h0u5nLA9oD7pvuUkKYoF9Q8O/fDo/jEJs/geIqaLBTYwV5Hujvye8R8gqiAcJPG+x+jq59k0p1tObCQtkyszirKiUS5zKZGQW1mLgyxIasTf0mLmx7kJYynfGNTzY4KP2g9FhlpdYS87x/jrgYd8oBbzD2T8JEUiVcVVeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDxtYWzA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so10304506a91.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 06:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738679714; x=1739284514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KvIihmND6ZFM+bCyzu+q7+jTdhiHhkSYeMCQU4OgoS4=;
        b=TDxtYWzA8/6geJzXPUGFcUFLAfY/JP0QyFAqRl+0+aL8F/3VxDNQqV9fX2E9pdIZDB
         HS1/37RCkW9lOQ39oW100eaHrKzn6lx/NJ+giO1RmACvJobS8f2bOpAmAivpEXAQpCwr
         094TeAY8uopeekcF7ZUlY9ey/nBkLn1hrQ8HkhP1qi7lpTbs3zCAu9Wh7JnqBMkB2k1B
         MGr9fqmddR9Kg/LI9T9dJtipNU91EqUSUzmrbKOevAxfs6/QmQ1anSKoZKFIXBUizbpK
         AICt2WNSt7p3rjSk1waiyHr42u+LqoGF3pTR3qhWWiUOq0jCtJA33F22gCTji+JoQi4l
         jBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679714; x=1739284514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvIihmND6ZFM+bCyzu+q7+jTdhiHhkSYeMCQU4OgoS4=;
        b=EizuB08wKYwKgKDSYnjVnKsqE1H7D0+HXIbN94IH7/lKBv8ktNsxyYh9p9BA3kkLb6
         EdLLDK4srGKj0ddPy5jvShUfpYbA1OMXCmp2jAwVYy7g/MkaXcktOwMORJ5kPnKKfNnx
         kAEkO6by+D4AwI1RjtLTqukGn4MeU3PNqLwdu+LRSM69/ZJc+zKxq+w6l1y2Dh39JHhf
         m7G3gtvqHB5LlmBkK7qyrZxzKXsMqBWsLM2alAxYeTjpsUzDmer36Lr6/tJEk2aQLBmW
         sl1xle/hBwdy3ZfT2VlVlKelfaOqpuzGBdf5oeatkgax8kfruHOFzisnMT9pa7sW7I+N
         NZHg==
X-Forwarded-Encrypted: i=1; AJvYcCVTkzAAF1Y1YKNf+Yw2kzyGp3A/f6WKEB8aKnaS58kIEwVPfJwCVHtBUShRKHWmpKVS1bJpYdnbV2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBj2MesQzeNIpfB7cfaQGCamKIaJufdjQymFaCfx7UUHoTcxqx
	eYTUNZmJxZKik/Favtp2sgdYJoYqpbsqBOEcn6+H1cIjK7LpZqRsubg9252gnA==
X-Gm-Gg: ASbGncs4cljJ/XVrUm277QNS0kaAVkBNRV2aSjbUQRdCMAXhXxXGx09wiS8S7JtsiB2
	Yaf6wkzdM+/8GSjMaXNU+FCGRID8vGWw4lHjZNEP4Op4oVblMeVjy44rQpwO80X5sy6PIPbM71I
	tnUUxmEMepMrU269mSa6acCSLUze65hWObYWJSDRygXD4yxSu9I/GfsdPmYDVf0oie5okkrcSA7
	3BsFfiCp1+/n2JBPs1INWOMrYQfb059aAyaj4gwADudcmzYQg0aJzPB5FEgnyMtdneOauqycFF4
	jGMcDRSIJeGTk/90Cqv8TouAE/aKhvi/PQ+/Pg/0CAh8/KAq
X-Google-Smtp-Source: AGHT+IEJWJDPw0AlXxZgAMJJlavRK8mWeKF6DfMWbxOueuowlrvDUq0kMxUun0eh+/rRilYepx2+MA==
X-Received: by 2002:a17:90b:2dc7:b0:2f2:e905:d5ff with SMTP id 98e67ed59e1d1-2f9ba227090mr5570647a91.6.1738679714329;
        Tue, 04 Feb 2025 06:35:14 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848acac43sm11196238a91.40.2025.02.04.06.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:35:13 -0800 (PST)
Date: Tue, 4 Feb 2025 14:35:09 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	dmitry.baryshkov@linaro.org, abhishekpandit@chromium.org,
	akuchynski@chromium.org
Subject: Re: [PATCH v1 1/2] platform/chrome: add PD_EVENT_INIT bit definition
Message-ID: <Z6IlnW5i93mHVcnj@google.com>
References: <20250204024600.4138776-1-jthies@google.com>
 <20250204024600.4138776-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fguC/8dz6gO27jZW"
Content-Disposition: inline
In-Reply-To: <20250204024600.4138776-2-jthies@google.com>


--fguC/8dz6gO27jZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jameson,

On Tue, Feb 04, 2025 at 02:45:58AM +0000, Jameson Thies wrote:
> Update cros_ec_commands.h to include a definition for PD_EVENT_INIT.
> On platforms supporting UCSI, this host event type is sent when the PPM
> initializes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  include/linux/platform_data/cros_ec_commands.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index ecf290a0c98f..1f4e4f2b89bb 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -5046,6 +5046,7 @@ struct ec_response_pd_status {
>  #define PD_EVENT_DATA_SWAP         BIT(3)
>  #define PD_EVENT_TYPEC             BIT(4)
>  #define PD_EVENT_PPM               BIT(5)
> +#define PD_EVENT_INIT              BIT(6)
> =20
>  struct ec_response_host_event_status {
>  	uint32_t status; /* PD MCU host event status */
> --=20
> 2.48.1.362.g079036d154-goog
>=20

--fguC/8dz6gO27jZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ6IlnQAKCRBzbaomhzOw
wnJkAPwJs+MI9qs0ZEsIHDyvzbOyJlqQQ21Ih7QgMF4OxrPkwgD9EfOexfo9o585
fYRoOwK7AawgC6gQob95POoPzMVqGwc=
=QBdL
-----END PGP SIGNATURE-----

--fguC/8dz6gO27jZW--

