Return-Path: <linux-usb+bounces-22021-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A145A6C663
	for <lists+linux-usb@lfdr.de>; Sat, 22 Mar 2025 00:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC76483663
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 23:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A27234977;
	Fri, 21 Mar 2025 23:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZCAjuQP2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F6F2A1C9
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742599149; cv=none; b=akhmau3CgZamssjsppGF2fufVwrClnyAWnKBc7wtcY01+Mt3Ub/OpXhBLGSs5AJIadth0wRpfAbtCgFLHz7GIRZBQ/ZNSAC+pW2UDIE+DUYhFatF6CItzcl4avPnQoRGf7KUUuduY+Uo/hkG6yrmegc1QLuXzmYHNPDzchbMCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742599149; c=relaxed/simple;
	bh=7R7aUV+pTd9zyynGBCXb4GYWyEVGu6gupsqBeQ35lLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwnniBts3gnmmYsH8cGVoBUvzt0u5QBH0BGTqQT0Ljh+yy3kzyDtZ4uW/gcDF7lUaU3qAku1dmXCOLD2WcO7BpulvEOLmqVyTYggdS+L3zXELFxgrDz4DC4pu3rxLfdm41mcfUd2lm742Wgc1MzVGgiV4x5ftuPkqt3cu2YRrfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZCAjuQP2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22548a28d0cso31034625ad.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742599147; x=1743203947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLVVtEiYY62MhsiRQ4vP6SNkQCOsvwGGW3jtnlnRhnQ=;
        b=ZCAjuQP2FAacEUDfJlVLeLg/0KuuKIUUuS9g4/o7Ht+KiGjd/AzTrlxbKxTudSwmLU
         vooqOqnMpS14fuPWhFV2Yzo+06+J3mPtE7og9gRkYoQLrI3efZZKDR6tyjfmGw9I7VnD
         w8hU0mlfH4xuh3aW1C+cbN6wj+WcP5aPeF7dd/BwDQV5OkVXt5oozJ8VqAfEB9ZITW2/
         WPhGSlrzRdJMqmWO1wlptlVAvFgAJu4wGEJwYFj1l4IOu+KSISp50oBv60Khz0eMB56R
         2Ma204k/ZWRWOPYi17zXgFc9NWzrJhAjTUWX175R9b5dYTuluGoVheRVmoMRdedE6gWH
         TcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742599147; x=1743203947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLVVtEiYY62MhsiRQ4vP6SNkQCOsvwGGW3jtnlnRhnQ=;
        b=GX5jLnvShldoBDKbhK6ARd6WnwpCn4tNd8HRubT7IV/14zYtSG40vg64+fReHxJvzB
         8ZgMySK7r8gVKM++7EkA5GCgTZ8bHEp28Sj2TemVGqZfnhE1wyHCU9rgZvVQrSY5Nz0P
         lmKdws5TwYY+D/dITMAsisUajGMCNvFQlyTGqEggXS/DFlLj62km43jvoDWONgtEadNb
         PLYNRJpUW4fWK744qRs67S+rKuPJ/89F/opuLvxqL+FXFJ2eC/dcfxjDM22w5BwiCM9I
         9WTl7U7k/pR3xqZbse8qQfxaljlHbwDRjysHFEBTa/tviipWnu37HFnPMd5KoD3yKU6h
         pFBg==
X-Forwarded-Encrypted: i=1; AJvYcCXQt9O5f8CkfWtwIk+UWAHQocp09KolxtAqUlsrPdO23JxCc7yHi8XlwFniz51L9cvEpH0bqFGVwws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVhdFKyN+P/F6Kz4qOkY8vuwYmj+EZFBC5vGaSakkpiKzNwI6
	pQsvUdr61gtsfI/RehLvD+saiIn1wKODULFgTsRHO4sjqBZpijykhTr/kDx+Zb5/ZpxOVMhJkFE
	HjQ==
X-Gm-Gg: ASbGncvD88R+Q20FulHCeOg72OWx98LiqqffISwMCbUvzYJsN4MxVLaIez1IBLgaQJs
	JK+W7pI8V/sZ1VYLukHtVO3dQ9+4/UrSryeLPwzywJjax4wwSOY3HoiMgL7EGFCp5wXwj9bljcW
	v6S/ENdxNInEzbwXHlQ6sSByAg8TVmYHcmQh/cWxYYVmD+exxprA2ZMlLi9FanEDiyxunwOLICY
	BSJt2p/qOOHMkHyZNdaP0yru+YouxrsNehpOMl9AbvnUbp7syNxtrnhDsN16u5+zaoRr4SABgCH
	hm7NpCuczfeIlfZyseealYe6axEHQLKdvdqjKnQRVE9YbgVh5F/4DlCTj4nRKa9L3TpPOUEBW45
	4XXXfSbIz1OpcJ1QDeA==
X-Google-Smtp-Source: AGHT+IF195diPWEKYH6Ae8Xu5+le/VenNZhzDbi1MXz0VeJbXGBB6rQE3KK3GWeNmszmqE1ZmR6hRg==
X-Received: by 2002:a17:902:ea07:b0:224:179a:3b8f with SMTP id d9443c01a7336-22780d83b53mr70549105ad.23.1742599147135;
        Fri, 21 Mar 2025 16:19:07 -0700 (PDT)
Received: from google.com (132.111.125.34.bc.googleusercontent.com. [34.125.111.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811c1b8fsm23330555ad.154.2025.03.21.16.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 16:19:05 -0700 (PDT)
Date: Fri, 21 Mar 2025 23:19:01 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: class: Invalidate USB device pointers on
 partner unregistration
Message-ID: <Z93z5WqL-u4ZyBhH@google.com>
References: <20250321143728.4092417-1-akuchynski@chromium.org>
 <20250321143728.4092417-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cN3cAe1kDpvEvgtB"
Content-Disposition: inline
In-Reply-To: <20250321143728.4092417-3-akuchynski@chromium.org>


--cN3cAe1kDpvEvgtB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrei,

On Fri, Mar 21, 2025 at 02:37:27PM +0000, Andrei Kuchynski wrote:
> To avoid using invalid USB device pointers after a Type-C partner
> disconnects, this patch clears the pointers upon partner unregistration.
> This ensures a clean state for future connections.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 59de2a56d127 ("usb: typec: Link enumerated USB devices with Type-C=
 partner")
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/class.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index eadb150223f8..3df3e3736916 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1086,10 +1086,14 @@ void typec_unregister_partner(struct typec_partne=
r *partner)
>  	port =3D to_typec_port(partner->dev.parent);
> =20
>  	mutex_lock(&port->partner_link_lock);
> -	if (port->usb2_dev)
> +	if (port->usb2_dev) {
>  		typec_partner_unlink_device(partner, port->usb2_dev);
> -	if (port->usb3_dev)
> +		port->usb2_dev =3D NULL;
> +	}
> +	if (port->usb3_dev) {
>  		typec_partner_unlink_device(partner, port->usb3_dev);
> +		port->usb3_dev =3D NULL;
> +	}
> =20
>  	device_unregister(&partner->dev);
>  	mutex_unlock(&port->partner_link_lock);
> --=20
> 2.49.0.395.g12beb8f557-goog
>=20

--cN3cAe1kDpvEvgtB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ93z5QAKCRBzbaomhzOw
wuFRAP4tlk6s6adpSCRvWDdtv0FaODRXc1HiADy+70TI9ectMAD/bOW7B2uK9KrQ
c+EbKHzy8PaWNAxKs4biseORVjHi6gU=
=CBy0
-----END PGP SIGNATURE-----

--cN3cAe1kDpvEvgtB--

