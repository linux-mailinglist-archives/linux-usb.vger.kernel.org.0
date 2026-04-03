Return-Path: <linux-usb+bounces-35956-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPkkJBhE0Gk45QYAu9opvQ
	(envelope-from <linux-usb+bounces-35956-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:50:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4AE398D9E
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 909333081370
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 22:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4157F361DA9;
	Fri,  3 Apr 2026 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qpdsOvAb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808B3043CF
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256466; cv=none; b=iYu8kBNTPwIkLfztfJ/+WCb0VU5d4RVJvdoO13tHPDT5BW9SrQ35/MVq/HFNom8mwbyLqb0swDhIugJhdvoBYC+Nj2g+ts8vt+JRrl2QVzA3QKPQsSdo/bP7UJERfGyfchDMPHhKE3iA5Zf9Hiwen/V5l+VwBLK/OVDARyVaZ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256466; c=relaxed/simple;
	bh=23jZLb1BbMRl4vVbPZVhrG0tF5G2ahmVNt+nZWQBrj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doQ6Tcuox79CDARcN5lnnGlh+G7SlPfPi61Fl4iankq+0OvtgXLTYc1I3ZEF6diqBqtwBEDhJNifsZHkXi+Lbe8UAt3VCdcsLd1CfgYAase9HMuKmLXQqszl6FNz8cUpFnGEs6Y3RFwsxGI+sRcBRcy7FRmlAf1dy9wgH99Psu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpdsOvAb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cdb4ab547so1143055b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775256464; x=1775861264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4z6d+6/MCDVIyWyvyF5t9cjT1g5478mQCP1zANwoYI0=;
        b=qpdsOvAb9prwkBf8sHnfkAfPCbqeS5S68zMQvfzvQfqx32SdxDgNyV1YkdSDMzre2Y
         0hRlRlVQykT+rOwtTlNRTFI7Hn8M4nMKmn6eo7nvhbnTkmpKWn6L5F/o9n7z0cl2Ia3G
         jAUlrvc78fcTR834FewogEyRfdCKBu3f1iu/lYG0F0Re/kxdqM8EcqlXAPZMIhaTOd6A
         9OW032fC5iifd675TW0F3A4pjBMM85gRtAzcBpjsa/IOAq0zip1Zd4znb/u+et0VMpjM
         eW4PD5cKn+DdX8raFSKhZ4GYeLHIcv0OXScoqi9WZH/5Ad8bprk8KOfvVI3yQ/JkZHD3
         VFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256464; x=1775861264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4z6d+6/MCDVIyWyvyF5t9cjT1g5478mQCP1zANwoYI0=;
        b=dPCRo7v6WnneYtNyoCsKyeUsjJJ4V3vDifsMDL2alp3dZ4fjaWo2xPq1Qm7hjDhXBD
         cano0aqgv/h7buh4JUpzYPciV5VrOFxoUZBO4fgQiFp52sPxXwoglPaXKV9lGqzNBdJJ
         FI5FpiM7pod9N0gfdrYbVmrLLpRwWQ0Or1QBNe/AU0MJhpJTYY2k+FWrqM94V5vtDAn3
         OG8t9021fKV6OY6sHmGJJZCqofPC9IVdO6jkZPqOvbITDLikQhBUKTiQvX7MV6TQO1wE
         cQI7xYuotrspFoiiJOAtEdWLLuuAiilm5ZUUYhQBcMQqFvzQWK306+xKBrh6x5NEJ8mi
         L6ag==
X-Forwarded-Encrypted: i=1; AJvYcCVjPF3QeI+BAdLPvHezVG7y5rg1qx0XT6wgZG8EFaWZ56BgTUQEFwyohpxHvscP7m8MrSd6ojgkGc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6pYIOeyuGX1VJTRl3wvzO1QY0b+V5cj1JursbWS+WdP44CQVZ
	g7K5cpxF/SylLtF5EZXHN2zoXywdJZzh96qgfsMTr1zsgOWn0402fJ8txaaLzpx8j0eXRid4zDQ
	mNLy+gg==
X-Gm-Gg: AeBDieukp0j457dkewBrQQ8fI+/6WHDFrBexuGx4S04ynZd8TerdN7oY/O9u37JmHDE
	zPs0wLxq4nzL/QXzCGq0GAiL2T2Irh61TKQ7AIz8JJ0shjrZ4NKh7R/GEolYhea2B7mqf7j2+us
	A87XlVtcu5OBXg2kUB87dg83YJsQNo+G2Zmawt3zTSMZ3pun0/Bjp9TQro8l66opsnQNyg4vF1A
	dn74xNL01fF3tdHsOOJNHMiEh/iv9Er50GKBk3vwBUPQZjfDFvN8RTE2NactuovI3DMoFlXZuqv
	aLLggBl8dGc5XD8IKg98Khv2t8fM1Rdzrj1L0pNSRDbHojFW12KvJwCtnDgh2IDdgU2CcH3GApp
	Jv4Dlz+v6i6zpbl7b4ra4lJmLdmELIVzniW3Xj0hoBrMxtCawNWifPHX72kvh5xh4ikPFCfawWw
	VJn2xgSfHZdZZxQmjDPhYMCAzdXfggL3LaHb4VPEa4AQL/tjg3t2UaMnD6qBTMqor8ouE=
X-Received: by 2002:a05:6a00:27a4:b0:82c:ebbd:9eca with SMTP id d2e1a72fcca58-82d0da3d529mr3892740b3a.11.1775256463733;
        Fri, 03 Apr 2026 15:47:43 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9a24039sm6887661b3a.0.2026.04.03.15.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:47:42 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:47:39 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abhishekpandit@chromium.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
Message-ID: <adBDi6Yk8ebiGwPF@google.com>
References: <20260403223357.1896403-1-jthies@google.com>
 <20260403223357.1896403-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g0BQnNgQsp6LXI7n"
Content-Disposition: inline
In-Reply-To: <20260403223357.1896403-3-jthies@google.com>
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35956-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bleung@google.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: EE4AE398D9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--g0BQnNgQsp6LXI7n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 10:33:27PM +0000, Jameson Thies wrote:
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index 6bca2dce211c..251aa7251ce6 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -5,11 +5,13 @@
>   * Copyright 2024 Google LLC.
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
>  #include <linux/jiffies.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -257,7 +259,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *=
udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> -	struct cros_ec_dev *ec_data =3D dev_get_drvdata(dev->parent);
>  	struct cros_ucsi_data *udata;
>  	int ret;
> =20
> @@ -265,9 +266,16 @@ static int cros_ucsi_probe(struct platform_device *p=
dev)
>  	if (!udata)
>  		return -ENOMEM;
> =20
> +	/* ACPI and OF FW nodes for cros_ec_ucsi are children of the ChromeOS E=
C. If the
> +	 * cros_ec_ucsi device has an ACPI or OF FW node, its parent is the Chr=
omeOS EC device.
> +	 * Platforms without a FW node for cros_ec_ucsi may add it as a subdevi=
ce of cros_ec_dev.
> +	 */
>  	udata->dev =3D dev;
> +	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
> +		udata->ec =3D dev_get_drvdata(dev->parent);
> +	else
> +		udata->ec =3D ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec=
_dev;
> =20
> -	udata->ec =3D ec_data->ec_dev;
>  	if (!udata->ec)
>  		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
> =20
> @@ -348,10 +356,24 @@ static const struct platform_device_id cros_ucsi_id=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> =20
> +static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] =3D {
> +	{ "GOOG0021", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
> +
> +static const struct of_device_id cros_ucsi_of_match[] =3D {
> +	{ .compatible =3D "google,cros-ec-ucsi", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
> +
>  static struct platform_driver cros_ucsi_driver =3D {
>  	.driver =3D {
>  		.name =3D KBUILD_MODNAME,
>  		.pm =3D &cros_ucsi_pm_ops,
> +		.acpi_match_table =3D cros_ec_ucsi_acpi_device_ids,
> +		.of_match_table =3D cros_ucsi_of_match,
>  	},
>  	.id_table =3D cros_ucsi_id,
>  	.probe =3D cros_ucsi_probe,
> --=20
> 2.53.0.1213.gd9a14994de-goog
>=20

--g0BQnNgQsp6LXI7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCadBDiwAKCRBzbaomhzOw
woFGAQCVsZvOh86t3yXOAhw5d8edARY9zTI1JOnJ37uMGnJSaQEAiaxqyGhDdjUP
8/3JD9T1+a3vPCb+6DOOeB4GNbHyrAw=
=rXtP
-----END PGP SIGNATURE-----

--g0BQnNgQsp6LXI7n--

