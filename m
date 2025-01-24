Return-Path: <linux-usb+bounces-19702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9044A1BD10
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 20:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 790557A4A81
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 19:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69572224AF2;
	Fri, 24 Jan 2025 19:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3HU9JLj7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937F214A630
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 19:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737748606; cv=none; b=AfxyD0YBCIAmgHjt17EdGXvBF+hX3ReW3f2WY/DdJeMopmDTrxzBOPbWEGM5ruTDeRdHC/4weWL6dTYkIpYVWBDGZwmkZCdiP3BqK7p9PNVbqgj+DkRwtw6d2AihCPIxvHHU1r5Geci5gHk1SriKk/tmZGW30BzN0leDKJJplaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737748606; c=relaxed/simple;
	bh=JEtiT+7vJXGht8hKXV8McZX28EtIfb0rwmpRAG4fVgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkO+lDKeHxmeE9PwQHKBbyDIjeOxTRmcMEyarRFAieTwdIXgmbd/htMMdDJT2xNWVJXZaA/hCfVZDyaVkkC2Hi9+hECh9HbUFV/uE5UrVx6BSQjZlpGetA/YYf+SQZWdX53MbyhyG6DJtzk9lae1uFMSjABjX0j9CaRTZoN+hLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3HU9JLj7; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21654fdd5daso44121095ad.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737748604; x=1738353404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JEtiT+7vJXGht8hKXV8McZX28EtIfb0rwmpRAG4fVgU=;
        b=3HU9JLj7r7mhI/tX+CmNTvoCVT8F78H3jSi6tI8UXSgi5nLLsQA+nNHnM4gKY+RDEi
         mxygp6FZaoVP1mzTtxw80bU2Fh1KjJcH507HWf2wbepc7abp8RiOi7htu3/d1fVYzKQy
         OzrWQOiYJk6bpivqdT2Q12iwacOfDQYGYbQVaN8Bz0xkdGu0dKv6SVLTVWRzQhSsh5u6
         2BQv9lMqOKOwpN+jCFfLnVD8M7BhIfWzRe3nPzx6TVhZopdGdXz7aDJv8RitJGzIZxj7
         ClQk/BXCZQ4tw72AsxYcEyMUjE44uvk4dkZgINpO+rbU9gFvObNrDOlpO7/ZXeNPRyxe
         lIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737748604; x=1738353404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEtiT+7vJXGht8hKXV8McZX28EtIfb0rwmpRAG4fVgU=;
        b=jiGWG3dAi9MnKQbTIJTaD7t3HX8VxAA+jSh+fh0d9XurHQ6I//8mK8iExiSkc1pLW2
         7Lcei9/zCATb+L0L65LZV1+0kE2+H6mGqRHMXzJNKBEp1/dLrftYsyQao1/Naze+N+mx
         1eJvkak1w34pbxObrU78AZVuScpVi61O677+SptX9hEn+/AYM6StFYWoOwAWXmDk3KAp
         ZOfEh34nuKhBjWb5Xot8OH09ycH1TI3AV6PpUoB5SvrY5LtGtoJHQgL3ZrLOh88Q2WpO
         I59uVUl68wIT3RskJ338ObgqZkcvgzt/PCUD4pHI6AS6nyE4WnXymWgdsHgXgzQeMkbE
         FkpA==
X-Forwarded-Encrypted: i=1; AJvYcCXOpFzp3+vwxJmk8pD6vQ8QZY6dUzGEvKpqjlAc8pD3/GWyKiMZBItByYOqQLJthWciBOEqi6oS2RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Xqa+ePFhhEQCEo21TeGhKHr1y0lz4SfjXyHKPSYGrsKDIFVp
	AKjxMkKybBUdAvjNwUek53uh5I4wkOPy2LOqTZA9lb3LiGc8qnCs3OHcgmnKqjqR1bc6hTDQpxV
	w3w==
X-Gm-Gg: ASbGncsKha1C1+iku+4/Z2+HEwOT8T2NOPblXsAotUwrdRxtWRW5X7gjRfn0myrTueF
	g3X1LPjAW9CjWiG1j2LK+ffc+thwV511ECqSz7VEBLA2Yp7ZKnbF8pwYo8DD8gsx6SSPenuGkCo
	OBwfQCQuHxSiH07i5nHvAML/FpFtgN6v4TOzTMEdy4yuCToyIaixUWe2U4TWSX6Fp2nCSy07YP0
	VPGZIB+N24x/g2WyTfoZ2sXZktbZCe3HZE5Up/EpyOuhW9XbChOFtpHB5v8V8rKY+8kDcbDzaVJ
	kf1Gm1Q7aBvLl6Me9LsCKFKqBeAxSM/0Fjcl5A==
X-Google-Smtp-Source: AGHT+IF0Zuc0h38RSUf5lIqZ3moYkbSoWxqhLl5RsBPGEZgALVsoU3PnECgvW2T5zgJg5cajpmOzxA==
X-Received: by 2002:a17:903:910:b0:216:282d:c69b with SMTP id d9443c01a7336-21c35607c11mr441348885ad.50.1737748603505;
        Fri, 24 Jan 2025 11:56:43 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141bf1sm20042865ad.151.2025.01.24.11.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 11:56:42 -0800 (PST)
Date: Fri, 24 Jan 2025 19:56:38 +0000
From: Benson Leung <bleung@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, abhishekpandit@chromium.org,
	ukaszb@chromium.org, akuchynski@google.com, bleung@chromium.org
Subject: Re: [bug report] usb: typec: Add driver for Thunderbolt 3 Alternate
 Mode
Message-ID: <Z5PwdkpiQcGDCitI@google.com>
References: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SwQYnmi8AWjOv7aU"
Content-Disposition: inline
In-Reply-To: <48dbbbab-3d09-4162-9d76-74c9baca6603@stanley.mountain>


--SwQYnmi8AWjOv7aU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,


On Tue, Jan 07, 2025 at 05:16:43PM +0300, Dan Carpenter wrote:
> Hello Heikki Krogerus,
>=20
> Commit 100e25738659 ("usb: typec: Add driver for Thunderbolt 3
> Alternate Mode") from Dec 13, 2024 (linux-next), leads to the
> following (unpublished) Smatch static checker warnings:
>=20
> drivers/usb/typec/altmodes/thunderbolt.c:153 tbt_enter_modes_ordered() in=
fo: return a literal instead of 'ret'

I posted a couple of patches to fix the other warnings, but wasn't sure wha=
t to
with this one since by my reading, we're doing that intentionally. This see=
ms
like an informational message.

Thanks,
Benson
=20

--SwQYnmi8AWjOv7aU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ5PwdQAKCRBzbaomhzOw
wpZoAPsFY/9enrwkuw9RFxmZyWZEakH90/z9VeM+RAKGEI6YHAEApxj4UQe98wIe
z9ojdU8zoqQUjLEdXA9J5xxyINf8fwU=
=4UWk
-----END PGP SIGNATURE-----

--SwQYnmi8AWjOv7aU--

