Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D272D6B1F
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 00:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404366AbgLJWb3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 17:31:29 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38481 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405138AbgLJW1W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Dec 2020 17:27:22 -0500
Received: by mail-pf1-f193.google.com with SMTP id d2so5514720pfq.5
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 14:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yHl87IgAwVQoYoagthZ9K6a/Dr4/brkjWA6ojIJaWFU=;
        b=DC2SJndkmcxWqxcWX8gv6J4dMLFjJnRPQfIfVCfoUYpMTEHl04QyifHIy9Vh9RNPPk
         82v3vP0Fkwdy1V8Zm/Xp3LrgX99BWgA/9aWaiYHuYeLNSGDMm5u9VmAlTQflJORTPZXD
         UmEdezQsYjtlOknlXbAboERncpvnccSoJqxjcCfyh9mv4B4UWB7fDM3d5tD4p/OWUNV8
         wkfuqFmA9gBFpSV0qSa2TAR4i7nN//pbL1qrzKTsWz5g2kM1UI3yRceDzTpBUssRgTCd
         XnkkBqbs4ZOeB4yZ6FAiE2NyG5uaNrihLkMg8mcicVXMoTFJTSYOfFQKHKFD9FLJYhLx
         T5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=yHl87IgAwVQoYoagthZ9K6a/Dr4/brkjWA6ojIJaWFU=;
        b=Z1IqGAWAfM5D8z19JBAYX3KAZRNqp0V9a6+TeYQxslQtSyyi5xuoaHOtl+/4SqWVw7
         FbZ8uIhz6zMj+/bfC53/RILLzp4rF+tKbxO0PAibLM62sg23608Azaor08h88fvV8cec
         M7jpFZs0JAcLp4hZFs8R845pMqaHz/rSADBCw8iT5qEAH6y3TbeAJqXPmGl/IXegzr1y
         Jv9OA7SLMVhh5z2TEIqe2uPRo7gqRCfj2otBiZSOeAto4aVBuMH7LlTaytHnFZ48UUol
         TfnA+X/jww0UjF9fwmF2jc+fioFFsrg/aRIjtDxrtATtEo/Ab32BqZSQO1WT/ugQf5x/
         6vxw==
X-Gm-Message-State: AOAM532z9gtpOGc6HAwQDODiRZYZ5Rd+8jCL4VHRh9U7qZbM6ZzxVj7a
        P1grCef2LwETOolT7Dem3vFfTcMyTsN5ew==
X-Google-Smtp-Source: ABdhPJwWfg7WCFYjszwuiAYhvdg+Tvt+4qdj4VsNug6NwHXasrEYU0Vi0j1HB6R+csgzNxt5bJPigw==
X-Received: by 2002:a63:6442:: with SMTP id y63mr8550827pgb.35.1607636879347;
        Thu, 10 Dec 2020 13:47:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id o123sm490866pfd.197.2020.12.10.13.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 13:47:58 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date:   Thu, 10 Dec 2020 13:47:53 -0800
From:   Benson Leung <bleung@chromium.org>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, bleung@chromium.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: typec: Add class for plug alt mode device
Message-ID: <X9KXiaM4wYKkxJw5@google.com>
References: <20201210211653.879044-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RU8k2+weiVsy+tlv"
Content-Disposition: inline
In-Reply-To: <20201210211653.879044-1-pmalani@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--RU8k2+weiVsy+tlv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prashant,

On Thu, Dec 10, 2020 at 01:16:54PM -0800, Prashant Malani wrote:
> Add the Type C class for plug alternate mode devices which are being
> registered by the Type C connector class. This ensures that udev events
> get generated when the plug alt modes are registered.
>=20
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>=20
> Changes in v2:
> - Changed code to set the class member instead of bus.
> - Removed the alteration to typec_bus.rst since it's not longer
>   required.
> - Updated the commit message and subject to reflect the change in code.
>=20
> v1: https://lore.kernel.org/linux-usb/20201203030846.51669-1-pmalani@chro=
mium.org/
>=20
>  drivers/usb/typec/class.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 35eec707cb51..29d05b45cc9d 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -482,6 +482,10 @@ typec_register_altmode(struct device *parent,
>  	if (is_typec_partner(parent))
>  		alt->adev.dev.bus =3D &typec_bus;
> =20
> +	/* Plug alt modes need a class to generate udev events. */
> +	if (is_typec_plug(parent))
> +		alt->adev.dev.class =3D typec_class;
> +
>  	ret =3D device_register(&alt->adev.dev);
>  	if (ret) {
>  		dev_err(parent, "failed to register alternate mode (%d)\n",
> --=20
> 2.29.2.576.ga3fc446d84-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--RU8k2+weiVsy+tlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCX9KXiQAKCRBzbaomhzOw
wqZCAQCi/xKD0wLN6g2DzIVBSg0o0Hc2CW2jHeWGQnQsba37ZQEAzgLtAoXD/h4M
ClPZa6GNUKvK/rMXG0niMxQagt6o2QA=
=Qzf0
-----END PGP SIGNATURE-----

--RU8k2+weiVsy+tlv--
