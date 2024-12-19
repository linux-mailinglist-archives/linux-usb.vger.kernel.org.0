Return-Path: <linux-usb+bounces-18667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CDF9F71CE
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 02:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12B0A188E52E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2024 01:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F7E4C62E;
	Thu, 19 Dec 2024 01:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RG8cO8NF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7EC1DA23
	for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2024 01:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734571966; cv=none; b=GbCKyg+82/tFn0Uox6z1UYHEkKTAr9lo6fk305BnX+CjyJq+RUq5IFyydcH+nRNPdde/TU2qHbFCo/h/zQYHkeqnJEyQQVeofVVXnG/e7wjxZZ73Lio12i8Lcc6LaWyVx3WTqoLxdkwEJmKmhR2ZKnNQ0umIP9rZij4owM30kzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734571966; c=relaxed/simple;
	bh=8blMIFWIaRAEoQhTNsLSwyGbfT66ERNtangswkpsRjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2G4+eB/yV1YnPD9UTlbaJbAF/wPYwPSCJgD0AcaIkUJPZ/ZenHnrqqwBmiFP4TvdZBHwSQ6XxAggf3dd0cEAP/fFsLMfNIlirMAZRlIG7nZyMl4QNxcTCzX8Sdlznhfu9jUagcsXaybWNCrbywCZuGOkEgQa5+GK3Yd7vW2PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RG8cO8NF; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-72739105e02so327426b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 17:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734571964; x=1735176764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vv5IuBsFycDvduWgc7NHFnRgiZfbZKV4iW9U1gRZ7o=;
        b=RG8cO8NF/+ql1IdxNCs77Gg2+N7LnjpOoNMl+zxlO4YiVvoPBZmmXLeuq0H2MBz2hm
         Tn7wkEkwi2s+nrUUGN1YjOuKoIiKsdRB1jJDHMzpy7GX7QKWxTwWQtf2S+O2zP9RQdU2
         N9AIKsX1sREnolQ5TWJT3CYFBU2P6cyI+/VxGFbbY6nVzrFU5/PUpzqlXrVRZzGnzTAO
         XfSt3zFDm//kGJKenyW/MvvCl4lZc+AxYPRAXNcmWxDai8kqs74urJQe9UYbm5+cKFva
         lLrDof1+kg7L1foR1W8T/xB6rkrlDI2MziRZOzkNqrbwgHsmVGDOeyc4MtysGyQjEExN
         VbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734571964; x=1735176764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Vv5IuBsFycDvduWgc7NHFnRgiZfbZKV4iW9U1gRZ7o=;
        b=bEIfre2U0xs9LIoOeMqFo5gP97V0KXHxlZJYoHndcMm/m1sPo722HRrp8wn6kBGULe
         jb5HSGVxfMrkf3hugkcX7T55EY8g4FM30N1N6DuuXZscUpKxoESFwWKHXEuQP0KZoeqW
         1XTLdp+rHhnK657nrGCpeKVDSssJjSWwVrv9qaRj4n1nEdGO+OaVbcNDaWPBgpd6N8QO
         IT1CvcL/nQSYPSkBi69HZcGwW/rPoP+xdo+hkZao0KbBjkCUmfECkVV0vlHItkJECsmS
         r6C5/z9ygyoJug4XLC8jIbOib70qaSkGQDr0iGfcpSmVMrJ9iJ6W5omNCocu8pVgnoMO
         aT3w==
X-Forwarded-Encrypted: i=1; AJvYcCXZpL5/+0lnBOuJ/V0bDawPAqELIZypdfDQN8zA0QaS9gTqMNiEH8VRGvXT+ZiH+JLrL9XMD9yw7CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcpC0ngkvkY7hZTDUFsB2uTGXYbDXrWThKedtRzO2jA+Wz9LS
	YFYzi5T8lg6ym33KXrtmF9zzOiGD1h/jERKuxPu2UXtmCOxv8GgDqPds8paZLA==
X-Gm-Gg: ASbGncvUo303lkUezv0H9TufJxAmtPybqFMoTR0E1YTiTWC7GLl8wF6PKEXFFNUV+vJ
	skA8Gw872FgrbHN9wbWZ6T3A8vj+wRJxD7YUfUtdyGCb5jeT7DB/PC3xPMDCUL1HS2ekK58phAL
	njwO7ivVlWGU1IZ06iFQtMqkFmxgVdTdQ9in54rVIHnxMwPoktteTiOy6tXzjT03f6b766WXEQ7
	ptqk3ii8O1noxo/S+ztV5cFhJD9Uv2yHnypri6h4ZDKcAavkmyk6zWG5hQkMUGg5DydkReB/0uf
	I6M3b9/5lafoKthf
X-Google-Smtp-Source: AGHT+IEWdcFyqngpDRkgZRR2/yfs+zFaqpUf2HE7wFRE1geSZItzQFoY3i/znViH3/xvzTMsNpqvIA==
X-Received: by 2002:a05:6a00:240d:b0:72a:8bb6:2963 with SMTP id d2e1a72fcca58-72a8d23edf6mr7811128b3a.13.1734571963776;
        Wed, 18 Dec 2024 17:32:43 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815835sm130651b3a.27.2024.12.18.17.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 17:32:42 -0800 (PST)
Date: Thu, 19 Dec 2024 01:32:38 +0000
From: Benson Leung <bleung@google.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
	badhri@google.com, rdbabiera@google.com,
	dmitry.baryshkov@linaro.org, jthies@google.com,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/8] platform/chrome: cros_ec_typec: Disable tbt on
 port
Message-ID: <Z2N3tt8O21-D6Ikq@google.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W8cAO6hx+FSI0lHc"
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>


--W8cAO6hx+FSI0lHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 03:35:49PM -0800, Abhishek Pandit-Subedi wrote:
> Altmodes with cros_ec are either automatically entered by the EC or
> entered by the AP if TBT or USB4 are supported on the system. Due to the
> security risk of PCIe tunneling, TBT modes should not be auto entered by
> the kernel at this time and will require user intervention.
>=20
> With this change, a userspace program will need to explicitly activate
> the thunderbolt mode on the port and partner in order to enter the mode
> and the thunderbolt driver will not automatically enter when a partner
> is connected.
>=20
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>=20
> (no changes since v3)
>=20
> Changes in v3:
> - Set port.inactive =3D true instead of auto-enter.
>=20
> Changes in v2:
> - Only disable auto-enter for Thunderbolt
> - Update commit message to clearly indicate the need for userspace
>   intervention to enter TBT mode
>=20
>  drivers/platform/chrome/cros_ec_typec.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 1ac5798d887f..6ee182101bc9 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -311,6 +311,7 @@ static int cros_typec_register_port_altmodes(struct c=
ros_typec_data *typec,
>  		memset(&desc, 0, sizeof(desc));
>  		desc.svid =3D USB_TYPEC_TBT_SID;
>  		desc.mode =3D TBT_MODE;
> +		desc.inactive =3D true;
>  		amode =3D cros_typec_register_thunderbolt(port, &desc);
>  		if (IS_ERR(amode))
>  			return PTR_ERR(amode);
> --=20
> 2.47.1.613.gc27f4b7a9f-goog
>=20

--W8cAO6hx+FSI0lHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ2N3tgAKCRBzbaomhzOw
woI7AP4m7+qsKf6OdfCv5MTSwIwsD2yr+IwtWh+s50egADVb0AEAh+bZVfhhc7KK
CacGzufNf3FY6eEErPLaAfAFZ27aDAQ=
=/0op
-----END PGP SIGNATURE-----

--W8cAO6hx+FSI0lHc--

