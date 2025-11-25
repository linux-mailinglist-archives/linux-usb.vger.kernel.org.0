Return-Path: <linux-usb+bounces-30876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E06BC82E98
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 01:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46E463ACEBA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 00:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803374D8CE;
	Tue, 25 Nov 2025 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E+B0SJTh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819941BC41
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029630; cv=none; b=r1tiPEwy9hueD00rDIseQAOEVRdterIaIehVs5vNZJpquCgGaGvGnIZhcnT8FvewiuAZpFbM1Ylxuf+rHwcELi6oZ4yYA8ZvJ0jk7giJPI1anD7dXOxFlzfnKKJ/wotHL38WgdjvYDtkcLENGRg7SloZyMQYBtJV5S6aEiRazPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029630; c=relaxed/simple;
	bh=gRzVQa8IVbeE/BIBpTVfPatwgFtyMI6IyU5NqB8p9uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emfkc25UmJ4SvnFb44eQyM1fYrqNlgKbY15yfOidUV4ZZenuC2z3i/Y7OP023g9jZmkFAGzhJ9HgJzGbWzcpCKDaXz9mhm+AoxjbB/noomxeWiT7plgbFu+QKzAg6LrUuQxDQqmS0x6MFcV4CLcMtA52NQgFqhhNwpSVtXL+gNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E+B0SJTh; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-343f52d15efso4502994a91.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 16:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764029627; x=1764634427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YhWYyo5D4/dh4SDt0h6HiWezG31XdYLPCdnS+Z5TsGA=;
        b=E+B0SJTh1fg1u+tRuWyOGxH/rvaFaKkjCYt07QYRWETHNqtXTN7FfF5LYTVvs/MYFj
         36/bm82Q6UF1ZnIa5SZn6ssosC+wm9LfQZeUcR6l0WvNXy2P+MMujlLTXkc85iiWq0C4
         vNZOCBKDpVO8nKq8PdYw6zz9rW46XrixUH+wrcQ5ZmLY34PT/6pBdzim8C9B3kCjK2fG
         gYOYg2tbQDS5oS6ePSzCelRCyrQP5m68+R2Dm+Kp28OYL6R3DzVKES/rGahwD9GMTD4x
         SxBwVddEnXcV8/J6guRGLIufa/iETcIu3tx+sPRzlxqvsKMqbj0TZgI06nyuH4ekuywN
         +meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764029627; x=1764634427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhWYyo5D4/dh4SDt0h6HiWezG31XdYLPCdnS+Z5TsGA=;
        b=e2UU4yNJVIknua4YhNl2PqIL4Kyb9lZTRIOKYKAOl0rdnkYJpYELbu4w2nAXAuhQjH
         kMnFmpMRFh79Ai9YjaRqSXiHOhwSj4rfgciwfSRMZ0GAVcEh1PECr8mMToPVRxOGsnYT
         uRjsmpvhhXbc25iwtyRzteF4xiLgkbHginCtmKWIsc6q/uQdR7OcmQdKkglR8Wh9f0iB
         yhmIWpun331MBW03Ogjl6NN5spsm9d+DfauikVNzCQ8YEU7WIdC65ZjQ2FMCMeUQ1lXv
         CKWOvtvJ1KetswlBeRCB2qMw4LXI1ZC2jTjBC9Ff9vVmgr6Ev5F7xNelAz7JCKtiuWfV
         nfQA==
X-Forwarded-Encrypted: i=1; AJvYcCXmikUtg/JRZbWDVmRKcmmH+7v8mwlEgx/6Jb9vkElmldx8HG9kma6hNOW/aiEsKnA+puuQhO+ITW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1jy/ULeMJdM+nUKgLIdwznT6jfGtX4WXw13MUJihsNEye32k
	N8Us+22HGh5LVrgPtsLIB98ob1x/BL3lGIcyip5TI9Tz6wzWZYR4fHh1T1whjuw4QA==
X-Gm-Gg: ASbGnct64eQ5mRkThAMfb6yjF/Gz/OaqUwh+vIX3bkRTzneFNxj7LONsf2MJLsV8Ldi
	/DdLb8NJq8f+v5fs+r23Yd2iO1Xg5vd+zMIRoo77A9oyRfr0fHfHAhURVr87foGWp0MEg9WFy6Z
	KnHwBBXy0K57do4MVVlx++K2beGUyVCdaJYeHQVdELHwJR6Nmi4DhhYvFyLfF34BCknp+ihjO8s
	D4kr9BMeKC4tW84GjhA0ou6hlG3Z7Bl/prNdDxde9Mhf5PeBxB7QFtCExncju6HO6Lk6u5C8xF8
	+p9xWp5g7m4YSdXTkjnvB0DECQyHFV8gZHNLTByy6L93fhxRTh1+fIrFEcbMkjYQOeARI7bZ4Gr
	yGRWkuilCM+gmnWPoyMdBl9pjZUTw+3harhZrXswObivB+26Y8xINMw3hGdMvVmbgPMcq/U7Yuf
	5Zum7+TInvz6EvPUyND9XKCmbiGdasWsvlJb41wC8v9sms
X-Google-Smtp-Source: AGHT+IFcZkGFuY/+13Asuxe6Rkfxx3Lh350rBOGyPACyZGK4zGjjhSOeQx6OGjqSoKhnKWlQZCmWrQ==
X-Received: by 2002:a17:90b:5404:b0:32e:87fa:d975 with SMTP id 98e67ed59e1d1-3475ed7d8a1mr659726a91.34.1764029626432;
        Mon, 24 Nov 2025 16:13:46 -0800 (PST)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347447d32aasm7632740a91.2.2025.11.24.16.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 16:13:44 -0800 (PST)
Date: Tue, 25 Nov 2025 00:13:41 +0000
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
Subject: Re: [PATCH v5 1/4] usb: typec: Add mode_control field to port
 property
Message-ID: <aST0tXPULUBWSzPU@google.com>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
 <20251124124639.1101335-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IZXYd/uVQB8DWaEB"
Content-Disposition: inline
In-Reply-To: <20251124124639.1101335-2-akuchynski@chromium.org>


--IZXYd/uVQB8DWaEB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

On Mon, Nov 24, 2025 at 12:46:36PM +0000, Andrei Kuchynski wrote:
> This new field in the port properties dictates whether the Platform Policy
> Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
> active, negotiated alternate mode.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/class.c | 9 ++++++---
>  drivers/usb/typec/class.h | 1 +
>  include/linux/usb/typec.h | 2 ++
>  3 files changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9b2647cb199b..a5327e444265 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -457,11 +457,13 @@ static umode_t typec_altmode_attr_is_visible(struct=
 kobject *kobj,
>  					     struct attribute *attr, int n)
>  {
>  	struct typec_altmode *adev =3D to_typec_altmode(kobj_to_dev(kobj));
> +	struct typec_port *port =3D typec_altmode2port(adev);
> =20
>  	if (attr =3D=3D &dev_attr_active.attr)
> -		if (!is_typec_port(adev->dev.parent) &&
> -		    (!adev->ops || !adev->ops->activate))
> -			return 0444;
> +		if (!is_typec_port(adev->dev.parent)) {
> +			if (!port->mode_control || !adev->ops || !adev->ops->activate)
> +				return 0444;
> +		}
> =20
>  	return attr->mode;
>  }
> @@ -2694,6 +2696,7 @@ struct typec_port *typec_register_port(struct devic=
e *parent,
>  	}
> =20
>  	port->pd =3D cap->pd;
> +	port->mode_control =3D !cap->no_mode_control;
> =20
>  	ret =3D device_add(&port->dev);
>  	if (ret) {
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index db2fe96c48ff..2e89a83c2eb7 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -62,6 +62,7 @@ struct typec_port {
>  	struct mutex			partner_link_lock;
> =20
>  	enum typec_orientation		orientation;
> +	bool				mode_control;
>  	struct typec_switch		*sw;
>  	struct typec_mux		*mux;
>  	struct typec_retimer		*retimer;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..59d5fd7e4ff4 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -287,6 +287,7 @@ enum usb_pd_svdm_ver {
>   * @prefer_role: Initial role preference (DRP ports).
>   * @accessory: Supported Accessory Modes
>   * @usb_capability: Supported USB Modes
> + * @no_mode_control: Ability to manage Alternate Modes
>   * @fwnode: Optional fwnode of the port
>   * @driver_data: Private pointer for driver specific info
>   * @pd: Optional USB Power Delivery Support
> @@ -304,6 +305,7 @@ struct typec_capability {
>  	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
>  	unsigned int		orientation_aware:1;
>  	u8			usb_capability;
> +	bool			no_mode_control;
> =20
>  	struct fwnode_handle	*fwnode;
>  	void			*driver_data;
> --=20
> 2.52.0.rc2.455.g230fcf2819-goog
>=20

--IZXYd/uVQB8DWaEB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaST0tQAKCRBzbaomhzOw
wvAyAPsFTPOAmywnQb75krUo1aYVq4PgmKWzLzFN3HTOaNgQyAD/c/c/9MpVPVBM
qAob6yGyNUn/I13r6tOOfZsRtvj2ZgA=
=mJq0
-----END PGP SIGNATURE-----

--IZXYd/uVQB8DWaEB--

