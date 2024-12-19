Return-Path: <linux-usb+bounces-18662-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B49F71B8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 02:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A81616D52B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 01:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EB37080A;
	Thu, 19 Dec 2024 01:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mc3dWcD6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43C339A1
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 01:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571446; cv=none; b=dYPVXCHthAgbyts4G+cTuu6FfbL+PnRO0D3ztpIOhFNkl0RXo3Sd7C3VsvMFPYLO3+QdAx5JcurwgNoN3HGNzQUpaGn2si7QzQeGi/UJQPec8/VQM18frgBXeJ5mkmRHsVhLwWN/IxHjumcVncYjwheknPafpxFJPdzGlATnKEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571446; c=relaxed/simple;
	bh=C6XyGEl+4JGQUnuKfD9opbycijz+c9g9Y8SrwNryp70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0jACBEFZorkI4YgJnKzp14W7UlLo6AJMEpUTQJpTketbhORmEprp/cveByPN5BOagG4zOfyLm4B5Tk8L7u45XET3uki22Wj+dDuvRq4ASFre6pi/N31PFNSl6oSAFvMXzZlZ3UGY4oOOtvFPTAYzgROJ+VR8riTxL3eudttSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mc3dWcD6; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-801c7e6518eso103307a12.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 17:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571444; x=1735176244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QeqA1W7HgN/1BEGMNZZ5O+/9wdsSo7XuIwN5RQ+xvQY=;
        b=Mc3dWcD69/geq2SX00m2jziMuLEYkd5WrVAxMfFMXsQLIkEFXPqSjuwAvwQ8ilZL5g
         iqPyS65VvHrwBzUR5TScCXpK8OGBiBL2nEsXLb0xFPer3abRpx1uMo2cxHCjGAvmgLIE
         A5NCGpZEdREFbzYmt4cK6uojYenA+rc9Nswd1Apz/1UqQqJW/fQ2VFdJ+oO9n55Afqik
         ly7PF2dn/l/MdtqgQhJKjGDCYRGj8xmda3wKaRQUEXkmVrFYojn10vo1moqS3rJTkbKE
         UXce8ojM4mFLAffpJ7Jjdzz9DTcZ31cUN058z/9WcFxDDsFCRcIsESpILQVuAhFEcYVd
         vvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571444; x=1735176244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeqA1W7HgN/1BEGMNZZ5O+/9wdsSo7XuIwN5RQ+xvQY=;
        b=njQN1x4g7gAW3OQAiyYG+lgwGsOYyQFFYZnJA8MlWIngU1tVvZLTA600o2XFY3V4jg
         E9rB9ALIKPnFLWnYbMdRzPXB7p+1ekEA9kblHFnOumm/J8Fx91oBql0VHzno7ZhzsQVY
         hmtA7efbUJmL9p/wLd2QJr/UsDi5KvXzfs2Rq03Uhwk9ocxbF0B4Yi1HmxbGhot1oB3x
         TnaTTRG1G2/GIlyx0jb+Mz6apITCZG08wYB5kpPqgscbJMK1cfKplUOqx6+PZ9YKVaAH
         3InmN5L0LCBM7D86swQ0YD6GZCxYZO4fi3c7z9WV2wzw86oDixcjtHtU2Uahxpka1qVV
         I5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVinaLB3EHPFklEj6x79FJGwSredR+1wQWhXdxWdMJFrYanAWbmfUotJXThw5OT0jJLJiwJrbZr1n4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzghjNRmtzxO2H9WYj2z/rKGT/1xxK25kaCcD+QjeUTuF42ZkZ0
	XrVtvYmhxyhv8qMPSTKcEY3euF8Ho0K+gMSzpofJBip9Rpyu0icw3s5HH1UoUg==
X-Gm-Gg: ASbGncu9u49YA/71/jPW3zTBpOcpLWwgzGHNSZpuiRj6KxbwYoV6TYjGnu1FRvhoVJq
	HuMzM+I64u+lBZnXIK3YHZlwTVhgXiZnPG2n4wb/0jCVZBuaTZDS2z1BVHCrzX5nmHEsJNxWsHI
	5xDEl6gUz4oM+OpvVelh8O1VKwdLTinnkgP7nmYR1sDVFs7fLmOSo7CZwUixAQqxg87c6ALQ7Vs
	iS9UZEJ+oGN2fr6QBVRPmyG08gtyAfA0zx9qkM+lPtx+LlMekDQpBwZrR1t71/M+BG6jDIXnUvY
	azgXSGiZ+Tj31FF6
X-Google-Smtp-Source: AGHT+IGLsnsDna2mnXoogFYmcXNYx7Aw7CMzWVyI52xBFBmbW0omcnochVS+D1fp/HqWS1IUPexG4A==
X-Received: by 2002:a17:90a:c884:b0:2ee:d824:b559 with SMTP id 98e67ed59e1d1-2f2e938a64fmr6291306a91.28.1734571443962;
        Wed, 18 Dec 2024 17:24:03 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9939b5sm3149919a91.1.2024.12.18.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:24:02 -0800 (PST)
Date: Thu, 19 Dec 2024 01:23:58 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/8] usb: typec: Make active on port altmode writable
Message-ID: <Z2N1rvl-3g5ditVp@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uitaZZ4HI1y6kP8G"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.3.I794566684ab2965e209f326b08232006eff333f8@changeid>


--uitaZZ4HI1y6kP8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:44PM -0800, Abhishek Pandit-Subedi wrote:
> The active property of port altmode should be writable (to prevent or
> allow partner altmodes from entering) and needs to be part of
> typec_altmode_desc so we can initialize the port to an inactive state if
> desired.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v5:
> - Extract port altmode ".active" changes to its own patch
>=20
>  drivers/usb/typec/class.c | 5 +++--
>  include/linux/usb/typec.h | 2 ++
>  2 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index febe453b96be..b5e67a57762c 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -458,7 +458,8 @@ static umode_t typec_altmode_attr_is_visible(struct k=
object *kobj,
>  	struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj));
> =20
>  	if (attr =3D=3D &dev_attr_active.attr)
> -		if (!adev->ops || !adev->ops->activate)
> +		if (!is_typec_port(adev->dev.parent) &&
> +		    (!adev->ops || !adev->ops->activate))
>  			return 0444;
> =20
>  	return attr->mode;
> @@ -563,7 +564,7 @@ typec_register_altmode(struct device *parent,
> =20
>  	if (is_port) {
>  		alt->attrs[3] =3D &dev_attr_supported_roles.attr;
> -		alt->adev.active =3D true; /* Enabled by default */
> +		alt->adev.active =3D !desc->inactive; /* Enabled by default */
>  	}
> =20
>  	sprintf(alt->group_name, "mode%d", desc->mode);
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index d616b8807000..252af3f77039 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -140,6 +140,7 @@ int typec_cable_set_identity(struct typec_cable *cabl=
e);
>   * @mode: Index of the Mode
>   * @vdo: VDO returned by Discover Modes USB PD command
>   * @roles: Only for ports. DRP if the mode is available in both roles
> + * @inactive: Only for ports. Make this port inactive (default is active=
).
>   *
>   * Description of an Alternate Mode which a connector, cable plug or par=
tner
>   * supports.
> @@ -150,6 +151,7 @@ struct typec_altmode_desc {
>  	u32			vdo;
>  	/* Only used with ports */
>  	enum typec_port_data	roles;
> +	bool			inactive;
>  };
> =20
>  void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd=
_revision);
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20
>=20

--uitaZZ4HI1y6kP8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N1rgAKCRBzbaomhzOw
woa/AQClwvgkDgjG8nKbR+T6b3aSmlK/AY9NW+YEO8etrtu2CQD/VoPsbnYYRSRD
wfJa2/2WUrHFrKSpbvZi5szLUf5XcAw=
=dvzt
-----END PGP SIGNATURE-----

--uitaZZ4HI1y6kP8G--

