Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15A401611BF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 13:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgBQMLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 07:11:52 -0500
Received: from foss.arm.com ([217.140.110.172]:34802 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbgBQMLw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 07:11:52 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C685530E;
        Mon, 17 Feb 2020 04:11:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48F1D3F703;
        Mon, 17 Feb 2020 04:11:51 -0800 (PST)
Date:   Mon, 17 Feb 2020 12:11:49 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     balbi@kernel.org, lee.jones@linaro.org, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [RFC 1/9] regmap: Add USB support
Message-ID: <20200217121149.GB9304@sirena.org.uk>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <20200216172117.49832-2-noralf@tronnes.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2020 at 06:21:09PM +0100, Noralf Tr=F8nnes wrote:

> Add support for regmap over USB for use with the Multifunction USB Device.
> Two endpoints IN/OUT are used. Up to 255 regmaps are supported on one USB
> interface. The register index width is always 32-bit, but the register
> value can be 8, 16 or 32 bits wide. LZ4 compression is supported on bulk
> transfers.

This looks like a custom thing for some particular devices rather than a
thing that will work for any USB device?  If that is the case then this
should have a more specific name.

> +++ b/drivers/base/regmap/regmap-usb.c
> @@ -0,0 +1,1026 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Register map access API - USB support

Why is this GPL-2.0-or-later?  The rest of the code is just plain old
GPL-2.0.

Please also make the entire comment a C++ one so things look more
intentional.

> +
> +	ktime_t start; /* FIXME: Temporary debug/perf aid */

Add tracepoints, most of your debugging stuff looks like you want to use
tracepoints - you can easily work out time differences with them by
postprocessing the log, they get very fine grained timestamps.

> +	mutex_lock(&regmap_usb_interfaces_lock);
> +	list_for_each_entry(entry, &regmap_usb_interfaces, link)
> +		if (entry->interface =3D=3D interface) {
> +			ruif =3D entry;
> +			ruif->refcount++;
> +			goto out_unlock;
> +		}
> +

You're missing some { } here.

> +static long mud_drm_throughput(ktime_t begin, ktime_t end, size_t len)
> +{
> +	long throughput;
> +
> +	throughput =3D ktime_us_delta(end, begin);
> +	throughput =3D throughput ? (len * 1000) / throughput : 0;
> +	throughput =3D throughput * 1000 / 1024;

Please write normal conditional statements to improve legibility.

> +static int regmap_usb_gather_write(void *context,
> +				   const void *reg, size_t reg_len,
> +				   const void *val, size_t val_len)
> +{
> +	return regmap_usb_transfer(context, false, reg, (void *)val, val_len);
> +}

Why are we casting away a const here?  If we really need to modify the
raw data that's being transmitted take a copy.

> +static int regmap_usb_write(void *context, const void *data, size_t coun=
t)
> +{
> +	struct regmap_usb_context *ctx =3D context;
> +	size_t val_len =3D count - sizeof(u32);
> +	void *val;
> +	int ret;
> +
> +	/* buffer needs to be properly aligned for DMA use */
> +	val =3D kmemdup(data + sizeof(u32), val_len, GFP_KERNEL);
> +	if (!val)
> +		return -ENOMEM;
> +
> +	ret =3D regmap_usb_gather_write(ctx, data, sizeof(u32), val, val_len);
> +	kfree(val);
> +
> +	return ret;
> +}

This looks like you just don't support a straight write operation, if
you need to do this emulation push it up the stack.

> +		regmap_usb_debugfs_init(map);
> +
> +	return map;
> +}
> +EXPORT_SYMBOL(__devm_regmap_init_usb);

No, this needs to be EXPORT_SYMBOL_GPL - the regmap core is and this
isn't going to be useful without those bits of the code anyway.

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KgwUACgkQJNaLcl1U
h9AiOggAhrrPTyqyl7EjImBldvWxC++TP7CFFDgVq1bctdTq9VfZtq7MBF6r/m1a
wbKbe7KmEulyPfJroA1hwrPqHJ2bJ3w5brb1eJA33Uqgmox0wXRZznYA1RZEIRNS
6PIBjaMCyZjPTV+prYeKljuKb6hbGpyqC3dYHXMyVq+3oyFEBfKFpLVcmG7TdYTQ
R6GYhwmTbomy5zgcUoNww+cKtaQEZWQfOCvLPcSEoSWflFIWjSAbfn443GK87/eF
GxFBnI3+E1+kutbaOznK9qsa73vvJfITO2j53ZPzbv23eKpJ4o9uIDT/Fyn27WuS
6NwU5ifj0T5U5JvNiWM4Py28wp7G1A==
=STDo
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
