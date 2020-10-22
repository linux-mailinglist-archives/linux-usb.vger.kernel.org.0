Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4782B2956AA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 05:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443735AbgJVDSo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 23:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443549AbgJVDSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 23:18:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EC7C0613D2
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2020 20:18:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l18so117572pgg.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2020 20:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P8qA5pUHnKGBjO74eTgw28qvpz/XOWa+Zejw+i85ow4=;
        b=CRCBXKxKDkwMKcjlHN9A3POZTkTaS8bTyMcs/17CfG6/b59c+LbTLclewT3DqYVr4H
         FD37ykxGhiZDAOpk/nbcAyMVZF5k+LYlhH6EsTT2wbvTQ+/SAilSaX6AsHgYhpczO4iU
         Eb2SFkbO7Mj6s6OK/AUUbprAQcf8nw9Kfko5dCsQ4lBH1cWVypLlt7SbMyaPrFM0y/gb
         rb9TpIVvJnvTn39MFQA5pqsZeKuSXTmTwn3uPAopFLFmmR5D4cacdkwfeFckynPiOz39
         s8uPZgaOOjEVk5dmGKYH2FO42tda09DzZnMsLc1mZsZnnlhpL6dr1gtkg2S0jqQY08Of
         tgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P8qA5pUHnKGBjO74eTgw28qvpz/XOWa+Zejw+i85ow4=;
        b=En2vBUZ6fBqu7Saa2TUpvc01BWah9Ss1XhTPj7sDRWFOb/5GR3IsA/hWwi2uPXWO9a
         9KiKGvA10oxZ6Gc+C9cd7SheuoDPcHfSSBGya5nG+W6pBICLYthPMTQ1ABBDfMXB2dCl
         YFJYXXXufQQfCiDk4b91aVtPd19ySTtnyDazfH9ur2FDw7olb7fIDyjAL6MshpmQEy77
         fdnc9KMhiUOXCM4VPjbyPhbsZyMWzgRZf9lef+HvkYAaanDhN5qg7SCXz4nekOwFj1Kx
         Mw9Lli1ygrCTf5R6lcVLuBcqoBEfREW3iDvxIbB+Ytcuqnz0/sVwkQkhdD/g8kjtjkZf
         1i2g==
X-Gm-Message-State: AOAM5315sxEu0H2VbF/1ln/PKQMzAHMSQhp6XhGXHIeOyysn+mXjsD7s
        Rl0jWRiCU133ztJcaP2jhDGPwA==
X-Google-Smtp-Source: ABdhPJzE3zW0be+nAWcvULcrS0Tkj21nJ21CIaLYhw8xJix+eMdS5AsQ2Hv/lfv5DEMhYQrzLU7Zog==
X-Received: by 2002:a63:370f:: with SMTP id e15mr604519pga.124.1603336722480;
        Wed, 21 Oct 2020 20:18:42 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4a0f:cfff:fe66:e92e])
        by smtp.gmail.com with ESMTPSA id v13sm270619pgl.6.2020.10.21.20.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 20:18:41 -0700 (PDT)
Date:   Wed, 21 Oct 2020 20:18:36 -0700
From:   Benson Leung <bleung@google.com>
To:     Prashant Malani <pmalani@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] usb: typec: Expose Product Type VDOs via sysfs
Message-ID: <20201022031836.GA3520755@google.com>
References: <20201021211802.774854-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
In-Reply-To: <20201021211802.774854-1-pmalani@chromium.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Prashant,

On Wed, Oct 21, 2020 at 02:18:02PM -0700, Prashant Malani wrote:
> A PD-capable device can return up to 3 Product Type VDOs as part of its
> DiscoverIdentity Response (USB PD Spec, Rev 3.0, Version 2.0, Section
> 6.4.4.3.1). Add a sysfs attribute to expose these to userspace.
>=20
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/class.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 35eec707cb51..e6abb0dee9fa 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -122,10 +122,20 @@ static ssize_t product_show(struct device *dev, str=
uct device_attribute *attr,
>  }
>  static DEVICE_ATTR_RO(product);
> =20
> +static ssize_t product_type_vdo_show(struct device *dev, struct device_a=
ttribute *attr,
> +				     char *buf)
> +{
> +	struct usb_pd_identity *id =3D get_pd_identity(dev);
> +
> +	return sprintf(buf, "0x%08x\n0x%08x\n0x%08x\n", id->vdo[0], id->vdo[1],=
 id->vdo[2]);
> +}
> +static DEVICE_ATTR_RO(product_type_vdo);
> +
>  static struct attribute *usb_pd_id_attrs[] =3D {
>  	&dev_attr_id_header.attr,
>  	&dev_attr_cert_stat.attr,
>  	&dev_attr_product.attr,
> +	&dev_attr_product_type_vdo.attr,
>  	NULL
>  };
> =20
> --=20
> 2.29.0.rc1.297.gfa9743e501-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCX5D6DAAKCRBzbaomhzOw
wmjwAPsGzeQimaK7Oic2xs0bobHc3J+7KFNoMHSjsUznGjFePQEAt5kpTnt3ZoFg
a1KT8cHizDC0QFN6D543gWKy/KK/7gg=
=PBzd
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
