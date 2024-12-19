Return-Path: <linux-usb+bounces-18664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC749F71BE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 02:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2E167A27B4
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 01:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC0A70809;
	Thu, 19 Dec 2024 01:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fBLgZMel"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280FA44C7C
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 01:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571557; cv=none; b=BALP69jicrYlZNOqOr04Wmw7v8707gAYvbr80YeUE3zXXOcNbkKQnUsRnoQeOX3J+PEkrTjqjI9w1mFZZvN+yXmVrWSm1BEeX7W25wHhfRmLx/vN6rkOX9ehboWf8X/pRagwzt8Q9jNyjQKRjJIoS/scgmNdNp7D90KoHPsQ2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571557; c=relaxed/simple;
	bh=2Dsf61/7CTSu04vldpJc6g9vN2n4R3Sf+/+qxTD4tfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AynkaUNjvQH2Hu7Rfx98XyQxiUSGdmEctRfqFwe4/cd/VMgb44APVqN2rWhgWC5syFactksBiTC+CXZYaVKUkbe3pcCS8+p75HzcL85pgofI3ph6ufrKrN4GU7xBrDpamxe78VReN/ibUeJEPkAYKTM0kTlLWrAzHVqs6AV2PCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fBLgZMel; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-725dc290c00so1159898b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 17:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571555; x=1735176355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifr3ayHIXYnUY/bBziOfNp0H3xeqKGEAJL0/80vlIrs=;
        b=fBLgZMel7tOExrRTBiG1GsC6Ahc/AvQj2Y0lSGi/e906ElxlJDKRikIrltRH/KVTRT
         gKeDATkk8LK6rRvkeAqQhbLNlO00W1fS+y4c5rXnUkFxjH3CsiLuGrkmBxAKCkRowvrW
         ECUuJxcumqbsREi1Jp5seSePYws1P0VyFmGe8lZtXUZRi+YUWkpfXv4+e2GNJdgQ4A7q
         Ks6VshJau2iYnYNVMV0PL21KD8s7X/UPUqODLOpAwQ0HyCzg3wkmJl4mwpzsL31tvioB
         Q7NhfvUpI1Q7He2ACkHQD8gt2MRRiIkdiAEJ3WbdKbqJsYyqHzDK0ZNYJgz52dSW8P4P
         83tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571555; x=1735176355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ifr3ayHIXYnUY/bBziOfNp0H3xeqKGEAJL0/80vlIrs=;
        b=RPNPWIZm1MzM2HGhUMBaJWhK1Msy/Jjs7tGBogLqFNQR9Bsc3TUalriJKIEmUiVYvB
         dfHmJeYKb5vTgA8ODiwmEyShoP0KSRTwV7J7SOweHT7ezgv9pGCwyOswS+HMR5f2Oij5
         6kgMFVFKUXxySFaUI0COEOquDSn7DaYKWjG58FWnEPAnbGNK84iYxFANa+HkBDu/rLwP
         Ve/L9WQmD2EQV2Z4PWTBLUAKTi8ht83biAqOO8ds67x5f2oi6AuMekgQSPZhTH6p9+qA
         6N5F2Ux2zpHOuYTM26yGrpcVaLELZp5m5aJJlkbAHNrqbm2zIfKg8XNWxUH9OOggtQXw
         sJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCWnslORG/L3on4+rOmzRXCqdHb74sEZI7Hw1zq/W0tC7ZUoORn14o6tRM1OX3LU2WZKkxvF00EXBqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYUPG8AXKjokRcUgJqpMtkhk64FeXULeF1CZdTKwkEZdewUz9f
	jEtXXT0JXQngiTIqw+rPa2HAiB4Jwl2plSLmxs1LV1Dl3ZIlA3at47818AEO+A==
X-Gm-Gg: ASbGncve5ebYnjC+pRvHrrlcj2QBY05hQzCndxoByIWGxZWmCP4/YdQKruve6BlFIm+
	CxNVUPK79EPNZnLpTfmdXEiqgYSEf1yZ6KdSFSQ/X/VoK//6Wvva/CqXq5fxmLrSAbM8WAx8qFS
	VDoQ8qifdKndjHrRkBagbzg9WaMWeX9y3eB0kZ5iC2Agg3YDIEdi6pyJ18K7yzbGy/YFPsOEK0h
	w18hyB3EwFHDxT12jwwVghPS65h+MNy3s492dX0p4VIzPvuOgm+CneKfdLaGsZgRpOBNcz9GxuN
	xUszpwebVWEPy+xL
X-Google-Smtp-Source: AGHT+IHaUtXpvS/Hr2aDFT2gXzn/HZ2P+Vpy2i8XwtK/2MHIKvZk286tXxhVBHLLpf4XBoweUFYGfA==
X-Received: by 2002:a05:6a21:3997:b0:1d9:a94:feec with SMTP id adf61e73a8af0-1e5c70190f7mr2478459637.2.1734571555057;
        Wed, 18 Dec 2024 17:25:55 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c225sm111371b3a.197.2024.12.18.17.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:25:53 -0800 (PST)
Date: Thu, 19 Dec 2024 01:25:49 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 4/8] usb: typec: Print err when displayport fails to
 enter
Message-ID: <Z2N2HeljULoCsdAi@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tnXtIProi7xyxxSe"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>


--tnXtIProi7xyxxSe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:45PM -0800, Abhishek Pandit-Subedi wrote:
> Print the error reason for typec_altmode_enter so users can understand
> why displayport failed to enter.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Put dev_err on single line.
> - Slip clang-format a washington to look the other way.
>=20
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 3245e03d59e6..ac84a6d64c2f 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -252,7 +252,7 @@ static void dp_altmode_work(struct work_struct *work)
>  	case DP_STATE_ENTER:
>  		ret =3D typec_altmode_enter(dp->alt, NULL);
>  		if (ret && ret !=3D -EBUSY)
> -			dev_err(&dp->alt->dev, "failed to enter mode\n");
> +			dev_err(&dp->alt->dev, "failed to enter mode: %d\n", ret);
>  		break;
>  	case DP_STATE_ENTER_PRIME:
>  		ret =3D typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--tnXtIProi7xyxxSe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N2HQAKCRBzbaomhzOw
whX+AQDbKOoKjJw/ywfmFiIx+z/bwE9H8nxc+cnA77TQLewf/gD7BdIO9xpPe+WT
6MxZLxwAWDTtUQuMW4ewsFAM/8ss4QQ=
=LfMz
-----END PGP SIGNATURE-----

--tnXtIProi7xyxxSe--

