Return-Path: <linux-usb+bounces-20032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BB6A2609E
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 17:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDDF71887950
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 16:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42EA20B7EE;
	Mon,  3 Feb 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Opu9M+lg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F268220B218
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738601623; cv=none; b=igb3gyw9uOzZoQIhLK/el80w0Ze6fWpv/GUdtyXiA6je1JhnyMSeCPqus2X6yCWMFhhWebckIR9Q588TPfQf1yYxb68EueG6cizuuI4oWJgCgo/NHjFWTqNHwf9ByA/C8NE4j36UbLzSMBLBNyxjPjnKJ7mljx3hJ5wpU1l+4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738601623; c=relaxed/simple;
	bh=c58F+QaXwUKRmiF3JgG7XE2wJHv/Kt46YXIMky3LTPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVi1gsNF2b3ORgMEwctoSHMdmtJ1EVI5u0xNJlVMotWYVCIDe/OquxkgJ3SmvgqBh776MI443naa3DxCyDD5DodCTCfBWCGP/0n1CHQD3zO3zM1wwZPAHZW0WwUQ3PPwD+YCjJtFmWlTQv0uAfEus/m1OHMuzQa+mSVbJkApZgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Opu9M+lg; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21636268e43so103374855ad.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2025 08:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738601621; x=1739206421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e/d4YqkcQ1AIMsQCiK36w7Q480dfLOzuiJQ38Uik4jA=;
        b=Opu9M+lgVLcrkALZPzTKX2eLYrSJ6IFFFd8MAn7oIR0XVLyM/p1g/0gjTueRw1BRoP
         VKCPlKM1ifi/uwl5THnRkWFYfUXpISqzeJDqTrXwZXyH+zseNSKq+VQZMd80N8O5d2CP
         N4NBGeGPvtkoYHL4NirW7rYatfVgRaK/cCk/lJG3sKdxYTXfpkrQyx8U/R4swyN0eNsm
         4hs0DJSwAHBshC3jiMVSfQ/eVmXaIVVuYuHrP8xvALJBh9AgQXnIwvuFsp3CSjmUrv/w
         QxNaUS4BO7j4hgP9zw5YvfmeF3jLl7ZJxHnodQS84r8sjVW2Xlg1qCwPx1azgxGXunKS
         C5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601621; x=1739206421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/d4YqkcQ1AIMsQCiK36w7Q480dfLOzuiJQ38Uik4jA=;
        b=JqJ6KiacIO07lfZq+wrbzEW+8dX1SrijmTiEEadn+BJNwkHig03z83eJXR6n2LWkq9
         FEej2VumHgun+xPJ1Z2xir8om6VRIPQ+wV9KandoSrN/jL2BtQLOeRzmHcf9iEtIW470
         Teb6zW3hK93I7m0JUfzkFISKIelr7HUZjf3mx1hugLypXsh1RDLcTxLkZ4TencF+sis9
         oEWV7cP+p5+AFOjDovmiDkUza5iugNALY6ME1NOyhd2O40LiMTy2bkS8V9WNybeA5w/B
         WZ1IGXS+C3sPb1BHudPC4JyWfGuhWVoq2/YnHoTz2WDgm7OmZ5tgTaHnZky/k23s4RmU
         nABA==
X-Forwarded-Encrypted: i=1; AJvYcCVtnkBi7ArsFm7IDmWD2GWT30wv9rqaVdYZFEJi3Qbo5z2l91rFkyiiOME6jIe1Q572a9mJh2JRPIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEqWzqb1HIueo40N+/gIEMT4Kuef85Sv25gRv260dKBHAhlIC5
	OowRvQ3NVu+69lPyO2e/SiWtNmoUwlTdT7sySPBrA9MW8c+ziGmVw54k20YlWw==
X-Gm-Gg: ASbGnctAPluNBW1IYTHwGVo51hZ+hOUXSbnVdZwYKLQsBa/VASa/D3gzsNy624LPHv/
	0uj/RQMdD/tXO/MMwAtbgobsBUUQFTzJVwGkJRa8mFjTnacfcdsB7SftvwcIIJJbim8p9f3K4F5
	P5Ecl+xq8Mx/joTrv7LjRmUCH8vUdNxT3zKr1KdnY/WW0VnUyglX9/YeQ/ItcMof5dUDwJKHaSF
	C7kELMbizVyy4DSS5KryYXGBVg+4ffHdNSJiOu+NXrqE2+L0IuwKZ46tlw2HPWK6j9UT/KrVKyz
	lHS/1ADX1qq1rrLd9Bq6oVtq27hAx1R33VLgABCLagI3V8MEJg==
X-Google-Smtp-Source: AGHT+IFdJOSnpkQuRkfcGwvGUcDocSPWu16Ur+hRWJYZmTC3T4ZgPnF+ZwmcqZ/dlVy+CzA0etjR0Q==
X-Received: by 2002:a17:902:ccd1:b0:216:4e9f:4ed4 with SMTP id d9443c01a7336-21dd7dcb2a9mr414185175ad.36.1738601620791;
        Mon, 03 Feb 2025 08:53:40 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33246c4sm77992915ad.254.2025.02.03.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:53:39 -0800 (PST)
Date: Mon, 3 Feb 2025 16:53:35 +0000
From: Benson Leung <bleung@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>, heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org, dan.carpenter@linaro.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	akuchynski@google.com, ukaszb@chromium.org
Subject: Re: [PATCH 1/2] usb: typec: thunderbolt: Fix loops that iterate
 TYPEC_PLUG_SOP_P and TYPEC_PLUG_SOP_PP
Message-ID: <Z6D0j3EphmwMoWj3@google.com>
References: <Z5Psp615abaaId6J@google.com>
 <2025020328-lunacy-commend-9f52@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ytJCkdmVGeJhU5sb"
Content-Disposition: inline
In-Reply-To: <2025020328-lunacy-commend-9f52@gregkh>


--ytJCkdmVGeJhU5sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, Feb 03, 2025 at 04:18:28PM +0100, Greg KH wrote:
> On Fri, Jan 24, 2025 at 07:40:23PM +0000, Benson Leung wrote:
> > Fixes these Smatch static checker warnings:
> > drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: w=
hy is zero skipped 'i'
> > drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() =
warn: why is zero skipped 'i'
> > drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn:=
 why is zero skipped 'i'
> >=20
> > Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternat=
e Mode")
> >=20
> > Signed-off-by: Benson Leung <bleung@chromium.org>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/usb/typec/altmodes/thunderbolt.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> Please always use 'git send-email' or if not, manually thread your
> patches so they all show up together as a series.  These are both
> individual and as such, don't play nice with tools.

Sorry about that. I still need to set up my git-send-email workflow on this=
 new
cloud workstation, and I'll get that rectified for next time.

>=20
> I'll try to manually handle them, but you owe me...

Thanks! I'll definitely owe you one.

>=20
> thanks,
>=20
> greg k-h

Benson

--ytJCkdmVGeJhU5sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ6D0jwAKCRBzbaomhzOw
wtdjAQDFIFP3kN6znPHOCe1ZKG3eK9rCFV4h9ndZJYwHMfddBAD/eSwUOe1C6d0B
OsbqfpBW8MJSuLXFplTtltFSQnFFQQI=
=pDi2
-----END PGP SIGNATURE-----

--ytJCkdmVGeJhU5sb--

