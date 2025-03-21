Return-Path: <linux-usb+bounces-22020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B986A6C65E
	for <lists+linux-usb@lfdr.de>; Sat, 22 Mar 2025 00:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D00A483DD9
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 23:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D3C233136;
	Fri, 21 Mar 2025 23:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="083mogp6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6936C21C9ED
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 23:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742599014; cv=none; b=NBja7rv43ylg58f0DBPHw4tBk01/6Gl8pPzShCKTMe+N4xQBC1K5sxW4B+L49c+ujHNFsDA8zjdLRcP1SOfJHdEdqy3TrSFFy0b8gw3W61+zMaPydnn0g50vNjc53oKYcOJ6NY71VCaiLXP064//hI9vhSGG3Mly/tQ4TRj0H64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742599014; c=relaxed/simple;
	bh=8DKaaQsE+scs9IafPhGAEN9NCbmfrSyJ0w8/Xd4IlfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iGljls147QQcHXpvLSmJGH1pnSFOIcsmXAL2jH+uheRt4qAuQAyp1EZlr1P1RcPybKHUCKRwUIGq/I9F+zXcgfgQpqBt/9Ywsb/EA7HwHYNV4A+Nx+QpGZhwhGkKfmDr9uAFA1iybVvNYDrg/9J4NySQ/cx79lqJoPlsIEO8OWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=083mogp6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224341bbc1dso51717015ad.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 16:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742599011; x=1743203811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIH7ijeBPiqYRtbzIPfbeGjnxQWH5Tz1Ymx0+lmARm8=;
        b=083mogp6PTA20FKNijOETmLv9aZtDH212EAJBGgs6DaPl1IGtRZspiCRxofSUmVGcf
         l2aYeIdHzGFqnyBdsh16TMhHAbeUI/B8SGQkcSget+a0bPeLb2Qaj4nrX7rYmZgaYeQB
         ZuL+cr+3bTolgbfY368hH9/H+8BFSHUKzNL5Y+Wu4bDuJzy6FGMouSI4urYRnQ6wno0d
         +68tqci+8nXz7v0Qsqor0iHl+UQ68/MdE+TbegoYpCcg7VliuD2CKtcJlXnDfY96w40Y
         2kxQnoYGV5PJH7qd+YvGExYCL5tNn1Kd1W4eeD0ShKpFSwvG3U4en9gOupYUG3RZ5Z/K
         xgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742599011; x=1743203811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIH7ijeBPiqYRtbzIPfbeGjnxQWH5Tz1Ymx0+lmARm8=;
        b=MKQNJiKTuOgAd24fuZOmgGoHdl9pGCEGFccLSP+gLPcYY4EAmIda1TGVwkSnI9d31N
         IipMVMtR7BCq3RPscK/MBw0Yqx/1e3MLjHExQAiWX9XPYPW3Ew2LCjhy0WxkgYQ/amzp
         fdlK3jnc/YufJUMNJmtOG9ghX1k2T6SCou6SSY/QbDb96QjdsZkAbX7SncwM0PTVouwT
         XycY7na0rXdiLL9NmD0DsCYcIMWdYnno7W3pAADe3Jy8PjYmeE4Omioa/E0PQEvf3VtY
         p16vjhLaoRqi1MhuqKqkqdtEr+SGiIMRXupsjv+guZub5SActJvj3APavK55MBPigrvz
         ezVg==
X-Forwarded-Encrypted: i=1; AJvYcCX/4XKrVyS2JsQ4veMrBq9xmr5iGY4lfQFsEYEqKVHhHIzqKaLjLWxoRQYPa+UvPmoYsg2vU8CEKdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNRU8SZfxILUniV8mBoS7cLyDkELEwEQ+Hk9K4Sv+h4DJAaPmY
	TrQMX4AVU9a1vq/ztF4agStiSu3RiPEFUW8FIfAgxlpjNPj2B1wHAXiJBjlCkQ==
X-Gm-Gg: ASbGnctHXu2DkcQUPYx770SotonoK8JUHKlJmhsyGgK5sVtPqD7VK0CsYc0lsUhO8uX
	Ogrg9XWC2ZjXyfo+OPnjCHl2qkDjeodyxZjGoVN7glPC1xJhGaR+gSqI9Wekii9h9xqotc38HIm
	n7722gYkcjyzwHxdx6s/Ee1iOb/X2zigL7qvzIMlCVfPapfT68r9LFuwWTONUagVvjUJD7+oca4
	+sJpykPPSFPh5uTm19HrDFXGv64UKnswSLnHeejdU4mwpD6wRXRcGgo8nfzm/RTA/N02m8ICIv4
	Q5jOqFxwL3/rDkZjd3ooisnm73C9k0Gm0lACm/Q4paWZsv3Vj3lX8ObrLn/D1mtQUsPMOIt/oDf
	iFQ2wnOY=
X-Google-Smtp-Source: AGHT+IG+S/vbJZ8UdHGhIlmSLgyiSEb9xnXeh1Dx5wYWoCCxNEnUuuhrUbiG8myJeH5qClc9kzs0uw==
X-Received: by 2002:a05:6a00:1393:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-7390599a142mr8273307b3a.8.1742599010047;
        Fri, 21 Mar 2025 16:16:50 -0700 (PDT)
Received: from google.com (132.111.125.34.bc.googleusercontent.com. [34.125.111.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa92dfsm2639905b3a.5.2025.03.21.16.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 16:16:48 -0700 (PDT)
Date: Fri, 21 Mar 2025 23:16:44 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: typec: class: Fix NULL pointer access
Message-ID: <Z93zXHJPO3UHY_YF@google.com>
References: <20250321143728.4092417-1-akuchynski@chromium.org>
 <20250321143728.4092417-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oA1blLjyxrjfEY96"
Content-Disposition: inline
In-Reply-To: <20250321143728.4092417-2-akuchynski@chromium.org>


--oA1blLjyxrjfEY96
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrei,


On Fri, Mar 21, 2025 at 02:37:26PM +0000, Andrei Kuchynski wrote:
> Concurrent calls to typec_partner_unlink_device can lead to a NULL pointer
> dereference. This patch adds a mutex to protect USB device pointers and
> prevent this issue. The same mutex protects both the device pointers and
> the partner device registration.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 59de2a56d127 ("usb: typec: Link enumerated USB devices with Type-C=
 partner")      =20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/class.c | 15 +++++++++++++--
>  drivers/usb/typec/class.h |  1 +
>  2 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9c76c3d0c6cf..eadb150223f8 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1052,6 +1052,7 @@ struct typec_partner *typec_register_partner(struct=
 typec_port *port,
>  		partner->usb_mode =3D USB_MODE_USB3;
>  	}
> =20
> +	mutex_lock(&port->partner_link_lock);
>  	ret =3D device_register(&partner->dev);
>  	if (ret) {
>  		dev_err(&port->dev, "failed to register partner (%d)\n", ret);
> @@ -1063,6 +1064,7 @@ struct typec_partner *typec_register_partner(struct=
 typec_port *port,
>  		typec_partner_link_device(partner, port->usb2_dev);
>  	if (port->usb3_dev)
>  		typec_partner_link_device(partner, port->usb3_dev);
> +	mutex_unlock(&port->partner_link_lock);
> =20
>  	return partner;
>  }
> @@ -1083,12 +1085,14 @@ void typec_unregister_partner(struct typec_partne=
r *partner)
> =20
>  	port =3D to_typec_port(partner->dev.parent);
> =20
> +	mutex_lock(&port->partner_link_lock);
>  	if (port->usb2_dev)
>  		typec_partner_unlink_device(partner, port->usb2_dev);
>  	if (port->usb3_dev)
>  		typec_partner_unlink_device(partner, port->usb3_dev);
> =20
>  	device_unregister(&partner->dev);
> +	mutex_unlock(&port->partner_link_lock);
>  }
>  EXPORT_SYMBOL_GPL(typec_unregister_partner);
> =20
> @@ -2041,10 +2045,11 @@ static struct typec_partner *typec_get_partner(st=
ruct typec_port *port)
>  static void typec_partner_attach(struct typec_connector *con, struct dev=
ice *dev)
>  {
>  	struct typec_port *port =3D container_of(con, struct typec_port, con);
> -	struct typec_partner *partner =3D typec_get_partner(port);
> +	struct typec_partner *partner;
>  	struct usb_device *udev =3D to_usb_device(dev);
>  	enum usb_mode usb_mode;
> =20
> +	mutex_lock(&port->partner_link_lock);
>  	if (udev->speed < USB_SPEED_SUPER) {
>  		usb_mode =3D USB_MODE_USB2;
>  		port->usb2_dev =3D dev;
> @@ -2053,18 +2058,22 @@ static void typec_partner_attach(struct typec_con=
nector *con, struct device *dev
>  		port->usb3_dev =3D dev;
>  	}
> =20
> +	partner =3D typec_get_partner(port);
>  	if (partner) {
>  		typec_partner_set_usb_mode(partner, usb_mode);
>  		typec_partner_link_device(partner, dev);
>  		put_device(&partner->dev);
>  	}
> +	mutex_unlock(&port->partner_link_lock);
>  }
> =20
>  static void typec_partner_deattach(struct typec_connector *con, struct d=
evice *dev)
>  {
>  	struct typec_port *port =3D container_of(con, struct typec_port, con);
> -	struct typec_partner *partner =3D typec_get_partner(port);
> +	struct typec_partner *partner;
> =20
> +	mutex_lock(&port->partner_link_lock);
> +	partner =3D typec_get_partner(port);
>  	if (partner) {
>  		typec_partner_unlink_device(partner, dev);
>  		put_device(&partner->dev);
> @@ -2074,6 +2083,7 @@ static void typec_partner_deattach(struct typec_con=
nector *con, struct device *d
>  		port->usb2_dev =3D NULL;
>  	else if (port->usb3_dev =3D=3D dev)
>  		port->usb3_dev =3D NULL;
> +	mutex_unlock(&port->partner_link_lock);
>  }
> =20
>  /**
> @@ -2614,6 +2624,7 @@ struct typec_port *typec_register_port(struct devic=
e *parent,
> =20
>  	ida_init(&port->mode_ids);
>  	mutex_init(&port->port_type_lock);
> +	mutex_init(&port->partner_link_lock);
> =20
>  	port->id =3D id;
>  	port->ops =3D cap->ops;
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index b3076a24ad2e..db2fe96c48ff 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -59,6 +59,7 @@ struct typec_port {
>  	enum typec_port_type		port_type;
>  	enum usb_mode			usb_mode;
>  	struct mutex			port_type_lock;
> +	struct mutex			partner_link_lock;
> =20
>  	enum typec_orientation		orientation;
>  	struct typec_switch		*sw;
> --=20
> 2.49.0.395.g12beb8f557-goog
>=20

--oA1blLjyxrjfEY96
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ93zWwAKCRBzbaomhzOw
whHhAQD+8sY8h9MFvLXXJX6m474QUzZ0HHuNX40P6R8IYKKqagD9GKf8CySd6Duo
INhWr5qPzNJGGbEPtJO1uox4DHWFuQg=
=yS43
-----END PGP SIGNATURE-----

--oA1blLjyxrjfEY96--

