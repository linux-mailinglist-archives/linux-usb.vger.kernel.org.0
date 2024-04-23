Return-Path: <linux-usb+bounces-9654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8CC8AEB3A
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 17:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 647CA283E79
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 15:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0009813C80C;
	Tue, 23 Apr 2024 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="37W9Fk1H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBA17BA8
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713886672; cv=none; b=go5MJHBpTQ6W+WY1b+yANS1kzmwTeQHRZ7I50+c9ck/Tt2AFY8sDeNdLnGT8b+eSECVqDxpqRe5x9LzgflPtcGb2mxNxTdA7nc6VIMidjWqPCiUGtC8+tkxypoCgwSTk1BYEV8S8Z7fAP58xGZVG4IRMCUezI0vOQcZ0MT6SaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713886672; c=relaxed/simple;
	bh=vl3GRAzYz99s0lWym4/W6lfyNnieohCIbEozsVCTjag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJ6Tj9goXpVOVMVBsJ180cjt8nbhqffmORqIFHAdGavvXdlGrOKbAPRgko2abXKwoNknsPfUu2VYMNw68mTsLRcby+JtmWZG2j+R+10cSeJ35olQxSQ3f117+hqcfZ9cAqlvBXDRFvnpccjEhAPI1ygNmC4wFc1fF9ZUiCXUgww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=37W9Fk1H; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e44f82ff9cso142105ad.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 08:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713886670; x=1714491470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELOEiKBNPubW2OIGLE+1HSCC+4SjR5FivEAPE1zzPx0=;
        b=37W9Fk1H8XPxycm74jeZaPqE+v2bZ7qzJDY4Teut5l73MuKBrXMuRa1Wsb+UHIAh6T
         iG/fV6vh9He1ZiIl1h0Li9Z8QI8T7K0N9nQxYjscjDy+eVCp1FEsEX+aBgSHn51Ba5Pj
         O4DShzUUzebtgxYfGVWL83BMe98DeXB1pQCMM3LMQv574sdoutwDUFlrjtcfwBpd4MkB
         9kdrgfZ8/f2mcvk9WmSi4Kn+rC0Y0Wj6m5V6C6A39ZR0CVQ7ZjBKC0+eM65Uc4AKOhKD
         WYNoDZvEQnr0ZAnqGyEEgpgJKYKnyCJupp3S/+M6uKkAOzpf/qcDkkcG5qK8yf/Lzt1W
         ipnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713886670; x=1714491470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELOEiKBNPubW2OIGLE+1HSCC+4SjR5FivEAPE1zzPx0=;
        b=ufa9OOabvzPTcm4F4nl6VOgAC1BuHhSZcGv/4pitoEOmOIl2Zv/Szjjs46Q6M+4/y0
         f+isrm2sj8An0giJutd030CVQ7WM5jOTLRpkCVkvoNJX9ThhTeNRJpFk1cXzDUVYbAwN
         JpY9wT4MX2mLOOUCE11Ks+6XYTbx0JZhSTnvAjYDMpwnbvo8UgoiW8Sef/lLpA6si2RL
         l3tFtf3lrWFie405+Z0u2F72XbpzsZ5r36DaacaRW4FpxcFkVX5rg5x8a3IGFOqsdoqM
         iG3U+3jjpclDMgBdpcq9wJQx5ChxrWNxUEWrZDM+QLIEnFUwXIZlIh+OLO3K/XveY0U6
         4iZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUhJqYmuYBBLUFamQUGJUFF2Bw64xC8HLjdm9YkCFA6rY+KUjMfar0xmnHUr5w3Zq/BzbAcKd9nvlmwaDTP+0zywf8S6sJkFaG
X-Gm-Message-State: AOJu0YwNXupPzYCe9BBzjiMkf9ZRR5ZIxna/slU6I3/bmeMUIlke9o9c
	pmIaPacWJU2kbDMUQ24R4HCmMzX3ce6rXkwJiT7otgQRRkxyP5uzjC5cORqguQ==
X-Google-Smtp-Source: AGHT+IGgaTqKcq+i+yPtDAOE8UP2FdqxGzb3uuymH0A+e0Rp9pmpsohZFyxdCX8qDm6ENYzvXQPmpA==
X-Received: by 2002:a17:902:ea04:b0:1de:f0c7:108 with SMTP id s4-20020a170902ea0400b001def0c70108mr272281plg.6.1713886669001;
        Tue, 23 Apr 2024 08:37:49 -0700 (PDT)
Received: from google.com (134.90.125.34.bc.googleusercontent.com. [34.125.90.134])
        by smtp.gmail.com with ESMTPSA id u3-20020a631403000000b005bdbe9a597fsm9626776pgl.57.2024.04.23.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 08:37:47 -0700 (PDT)
Date: Tue, 23 Apr 2024 15:37:44 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pmalani@chromium.org, abhishekpandit@chromium.org,
	andersson@kernel.org, dmitry.baryshkov@linaro.org,
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org,
	hdegoede@redhat.com, neil.armstrong@linaro.org,
	rajaram.regupathy@intel.com, saranya.gopal@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] usb: typec: ucsi: Always set number of alternate
 modes
Message-ID: <ZifVyNAfLyq4qG5H@google.com>
References: <20240419211650.2657096-1-jthies@google.com>
 <20240419211650.2657096-5-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eJT88a/Gw6Jw6Zqe"
Content-Disposition: inline
In-Reply-To: <20240419211650.2657096-5-jthies@google.com>


--eJT88a/Gw6Jw6Zqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 09:16:50PM +0000, Jameson Thies wrote:
> Providing the number of known alternate modes allows user space to
> determine when device registration has completed. Always register a
> number of known alternate modes for the partner and cable plug, even
> when the number of supported alternate modes is 0.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index cd4c3b7a5d989..ea76d42fd1504 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -812,10 +812,11 @@ static int ucsi_check_altmodes(struct ucsi_connecto=
r *con)
>  	/* Ignoring the errors in this case. */
>  	if (con->partner_altmode[0]) {
>  		num_partner_am =3D ucsi_get_num_altmode(con->partner_altmode);
> -		if (num_partner_am > 0)
> -			typec_partner_set_num_altmodes(con->partner, num_partner_am);
> +		typec_partner_set_num_altmodes(con->partner, num_partner_am);
>  		ucsi_altmode_update_active(con);
>  		return 0;
> +	} else {
> +		typec_partner_set_num_altmodes(con->partner, 0);
>  	}
> =20
>  	return ret;
> @@ -1138,7 +1139,7 @@ static int ucsi_check_connection(struct ucsi_connec=
tor *con)
>  static int ucsi_check_cable(struct ucsi_connector *con)
>  {
>  	u64 command;
> -	int ret;
> +	int ret, num_plug_am;
> =20
>  	if (con->cable)
>  		return 0;
> @@ -1172,6 +1173,13 @@ static int ucsi_check_cable(struct ucsi_connector =
*con)
>  			return ret;
>  	}
> =20
> +	if (con->plug_altmode[0]) {
> +		num_plug_am =3D ucsi_get_num_altmode(con->plug_altmode);
> +		typec_plug_set_num_altmodes(con->plug, num_plug_am);
> +	} else {
> +		typec_plug_set_num_altmodes(con->plug, 0);
> +	}
> +
>  	return 0;
>  }
> =20
> --=20
> 2.44.0.769.g3c40516874-goog
>=20

--eJT88a/Gw6Jw6Zqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZifVyAAKCRBzbaomhzOw
wmzdAP4hLwx+iB6UOZExWPt/9/X7A4cZYouNkVFA1g9q1otaAwD/QZDPpf1OQo4e
hI75vwIXV5x7lzjWASoeMN7ptmzbMgE=
=rovc
-----END PGP SIGNATURE-----

--eJT88a/Gw6Jw6Zqe--

