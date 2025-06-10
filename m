Return-Path: <linux-usb+bounces-24631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B6AD2B12
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 02:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B01D170A64
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 00:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C5A17A30F;
	Tue, 10 Jun 2025 00:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1GVp70T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B03151985;
	Tue, 10 Jun 2025 00:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749517030; cv=none; b=L8O7+z4H21jLcQOPFbRKtqurE8QW0IDTJLFgbpZGbDBDthrIiqAMLKPZcuvOar2sdzNlrMfmZovuEatButRB0rCG+lZkjAoiG4+L1dE+K8pW6/3srwEKmzY47dnRNgb8Y65T50pe3Y6kBcynCGoElFo+SR7rjLtDMXxyAToTqRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749517030; c=relaxed/simple;
	bh=oyLK1slm11FPI7N6OT2cVJrkfcmoYwMafSrBI9soMLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCwi11fiaIH7eqg8tLDreVBGOC1PNh2VxOyx0rQK1P8kqU0wuF+K80I3L2zjOeo/Z2SIEfmcYk3g2cBnzzntT0lt5bGZeMUhvTPKeVX3SKMYyzc4DPsqDRbzoBtdhKjrkKoGT6vKhAHADyhZSHnb2VFv7eEVqFYn1ZOih1AjxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1GVp70T; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23636167afeso3483615ad.3;
        Mon, 09 Jun 2025 17:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749517028; x=1750121828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ty8YG6nww55Bq685tuv7oGe3iUWWWOLruj06ufM5JYo=;
        b=N1GVp70Tjg2Ns6gmIe7WnZ64BgNroMnKT8epw5Kw2QRzvBxZHYkyWn7ZijjdwgzRhD
         to3np6hASFc7N0XNnvsSQlxJMbVgamf9iTB8LkKgqeUP5TlOzGxSUsJhXaYQaUoGrtIj
         JjSQddXpEexNvd1yK8c7lgoSTOZ2MjwyZ9U2YCutI84qG/loZulBPMqa2L6pGsPvM1i0
         2drq/+X+RLzfnFs5rISnFktx9v+jX3wuSBLI60keUkXGWoui4SX9lWWvDuxCrBHRpOFH
         1LRn5Tq0nt2ZspYQxFQeNIBKIJTaM6icNdXyOAdsJGE1GMtC27U1ETNHe+bPyqjM/+Xz
         Mnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749517028; x=1750121828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty8YG6nww55Bq685tuv7oGe3iUWWWOLruj06ufM5JYo=;
        b=VHY9mwm7g7iQSejGUcGOUOFupBGU/GEe6pUfgTl4hDRUI7xBAnfJPkzco2Hc5w6jXH
         Sjr69htMtvb7xQqmCD8tf6gdsPuSCP6Rdu5MAmxeZlkzt5822FDaGBEaFQnnXzINJPb2
         0cFaTf2obAbaY/R8SWnw//TopmNQWGkY72n4EjUWxF8B/YIFEyGVIEMswtMP00hsEVpp
         Ngpq+Rj4NtTrpw6Wg9U58YpbvyWwTXQ9EhKArdY58hLU5vULO9FYPOi3RlWgB2DrJPZy
         OcXjE5xp5XBfvrkJEo6PVVPtAk36RCgU9feFJTewyS/uce/hvbhjWYP41+tBVrzcSn15
         wZog==
X-Forwarded-Encrypted: i=1; AJvYcCVbnvSM6XIVZOl+/Jmofr5apShHqbWqjuycEJUt2CdO9Q3jVkf+k6dnHTIUNb/tt8OCe4Hp22DtTOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgHJbtbyfgKN77zrXvyYkgLDI5H/zXl7Ro+8eoOgDSZITLxw5S
	H2U+9swgqZyfJpfTGMRWOCveBW18RKrE9fQGXW7s1h2qrtSxGGJ3uaC/ACOziQ==
X-Gm-Gg: ASbGncu2fts16kRpjAgMIktTfaNdGV08HQyRDZEFY/5b6g7ceDRwxBtTYVs3NSyWbnk
	vXTUXdf/YADuHvKfZfN8DekNYe8SodErH3gi5S8mWG955fg4NLgruWVwmlyxqYgt2a9SPJ7eb3d
	R/QoDbSFM+HarFdc2JN8c+bX5dms9rFVauL1RlahCPmX5tdQrubXsn+GmxCiS7nWCFue591DNIb
	chWYWuCBZys4L3f4UKQtXYNKFshc9V49r6cDd1AC7BYEdGHB9pUoCQ/UmOJK2THj9mbDt1yrecQ
	2jaJPT86prkbr08HJL41NZ5Nu5LuqiFaT7vnGfDEYoP5EHUrW98gaWvIZOsyEw==
X-Google-Smtp-Source: AGHT+IH7BBaj8bKam+xZYWR9TBindDzHs4YpRVhqJW0AYYVb4JYQJSYcjYQ8qRvEu+1rR/mmGoXIBQ==
X-Received: by 2002:a17:903:986:b0:235:be0:db4c with SMTP id d9443c01a7336-23601dc45aemr225505225ad.41.1749517027584;
        Mon, 09 Jun 2025 17:57:07 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b13ad70sm6143860a91.33.2025.06.09.17.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 17:57:06 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 1F1B14209E8C; Tue, 10 Jun 2025 07:57:03 +0700 (WIB)
Date: Tue, 10 Jun 2025 07:57:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: usb: gadget: Reindent numbered list
Message-ID: <aEeC33xHpqh2qoEw@archie.me>
References: <20250607224747.3653041-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y4LFNU5afeVxv6jH"
Content-Disposition: inline
In-Reply-To: <20250607224747.3653041-2-u.kleine-koenig@baylibre.com>


--Y4LFNU5afeVxv6jH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 08, 2025 at 12:47:46AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> diff --git a/Documentation/usb/gadget_configfs.rst b/Documentation/usb/ga=
dget_configfs.rst
> index 868e118a2644..f069d2a0d092 100644
> --- a/Documentation/usb/gadget_configfs.rst
> +++ b/Documentation/usb/gadget_configfs.rst
> @@ -369,18 +369,18 @@ For more information on configfs please see
>  The concepts described above translate to USB gadgets like this:
> =20
>  1. A gadget has its config group, which has some attributes (idVendor,
> -idProduct etc) and default sub-groups (configs, functions, strings).
> -Writing to the attributes causes the information to be stored in
> -appropriate locations. In the configs, functions and strings sub-groups
> -a user can create their sub-groups to represent configurations, function=
s,
> -and groups of strings in a given language.
> +   idProduct etc) and default sub-groups (configs, functions, strings).
> +   Writing to the attributes causes the information to be stored in appr=
opriate
> +   locations. In the configs, functions and strings sub-groups a user can
> +   create their sub-groups to represent configurations, functions, and g=
roups
> +   of strings in a given language.
> =20
>  2. The user creates configurations and functions, in the configurations
> -creates symbolic links to functions. This information is used when the
> -gadget's UDC attribute is written to, which means binding the gadget
> -to the UDC. The code in drivers/usb/gadget/configfs.c iterates over
> -all configurations, and in each configuration it iterates over all
> -functions and binds them. This way the whole gadget is bound.
> +   creates symbolic links to functions. This information is used when the
> +   gadget's UDC attribute is written to, which means binding the gadget =
to the
> +   UDC. The code in drivers/usb/gadget/configfs.c iterates over all
> +   configurations, and in each configuration it iterates over all functi=
ons and
> +   binds them. This way the whole gadget is bound.
> =20
>  3. The file drivers/usb/gadget/configfs.c contains code for
> =20
> @@ -388,13 +388,12 @@ functions and binds them. This way the whole gadget=
 is bound.
>  	- gadget's default groups (configs, functions, strings)
>  	- associating functions with configurations (symlinks)
> =20
> -4. Each USB function naturally has its own view of what it wants
> -configured, so config_groups for particular functions are defined
> -in the functions implementation files drivers/usb/gadget/f_*.c.
> +4. Each USB function naturally has its own view of what it wants configu=
red, so
> +   config_groups for particular functions are defined in the functions
> +   implementation files drivers/usb/gadget/f_*.c.
> =20
>  5. Function's code is written in such a way that it uses
> -
> -usb_get_function_instance(), which, in turn, calls request_module.
> -So, provided that modprobe works, modules for particular functions
> -are loaded automatically. Please note that the converse is not true:
> -after a gadget is disabled and torn down, the modules remain loaded.
> +   usb_get_function_instance(), which, in turn, calls request_module.  S=
o,
> +   provided that modprobe works, modules for particular functions are lo=
aded
> +   automatically. Please note that the converse is not true: after a gad=
get is
> +   disabled and torn down, the modules remain loaded.
>=20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Y4LFNU5afeVxv6jH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEeC2gAKCRD2uYlJVVFO
ozf0AP90prqe9cMUXHT99RW/8zDpCP1XNI3WQtNK1NSTdPTKuwEAnL6nVIxCPXn4
mGDFtdK0G8qYBLDsxPU2/r3EydMhVQM=
=NV47
-----END PGP SIGNATURE-----

--Y4LFNU5afeVxv6jH--

