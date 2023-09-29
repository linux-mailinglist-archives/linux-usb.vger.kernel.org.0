Return-Path: <linux-usb+bounces-816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A0B7B3AFE
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 22:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 27110B20A86
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 20:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1A266DF0;
	Fri, 29 Sep 2023 20:10:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF93020F9
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 20:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE54C433C8;
	Fri, 29 Sep 2023 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696018257;
	bh=1M4BkuC30Zeg4355NfbrbsY3DVOz7+6NsJVVtiT81CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gA5o4RmSuwc80uSa2FJJ9G6CETji9We2MVjP6A1z3+OLU0ySHC64ntj0DeAxQf4oD
	 zKRfN4JgrHjfZkD8oNVUh4n9F6pziC0HB2U89hn6v5oCyU5Kpg4pdb6Oo6yCc5eUZq
	 WFeVR4LDdLmRwobKPoEtA6MbLb5YA+CIc7YSn51RomzZ5zNFYqbGnIE24balob7DM2
	 kfnhVvowL42I3/2PE/se3SxTHhwi/gAbDq0qjj5koRgIC+whOgfovEIsWi645/7ef3
	 U1GnkhbBrsL5kGiBAsuU2F6h981v+rHhQD2LQTps6yFJZhBVZz0QMe2qGHahJ0VwjF
	 70TLeL7FRsZHA==
Date: Fri, 29 Sep 2023 22:10:48 +0200
From: Wolfram Sang <wsa@kernel.org>
To: "Wu, Wentong" <wentong.wu@intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"mka@chromium.org" <mka@chromium.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"lee@kernel.org" <lee@kernel.org>,
	"kfting@nuvoton.com" <kfting@nuvoton.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
	"Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: Re: [PATCH v19 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZRcvSI/pklsw6+mf@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	"Wu, Wentong" <wentong.wu@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"mka@chromium.org" <mka@chromium.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"lee@kernel.org" <lee@kernel.org>,
	"kfting@nuvoton.com" <kfting@nuvoton.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
	"Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
	"Wang, Zhifeng" <zhifeng.wang@intel.com>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-3-git-send-email-wentong.wu@intel.com>
 <ZRaCEI5EZuSx5/Lx@ninjato>
 <DM6PR11MB4316B740D57D4E9EFE4D5B608DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o7iWeLNBu+rG+qYi"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316B740D57D4E9EFE4D5B608DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>


--o7iWeLNBu+rG+qYi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> And with i2cdetect -q busnum, I see error on driver side which enable
> I2C_FUNC_SMBUS_EMUL and not disable I2C_FUNC_SMBUS_QUICK, I think
> it means we don't support zero-length transfer if I understand correctly.

At least, not currently. Sometimes the driver just needs updates,
sometimes the HW simply cannot do it. If it is a software issue, we can
fix it incrementally.

> static u32 ljca_i2c_func(struct i2c_adapter *adap)
> {
> 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
> }

Yes.

> static const struct i2c_adapter_quirks ljca_i2c_quirks = {
> 	.flags = I2C_AQ_NO_ZERO_LEN,
> 	.max_read_len = LJCA_I2C_MAX_XFER_SIZE,
> 	.max_write_len = LJCA_I2C_MAX_XFER_SIZE,
> };

Yes.

I think the I2C driver is good then.


--o7iWeLNBu+rG+qYi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUXL0QACgkQFA3kzBSg
KbZ+2xAAgGOyccHg6fDXYczXy+M2IiVYbUi0VhGvsFiI+tNBZTh+AUTsGwFEJq7e
smcPWBROSUVOGtrkHUuxLfx960qjGWSJ2+DL8pwp9UleGXm/Kc748IR8/zNA/UzL
FHxgymaeTNtl6m4+6FsGrZlIdK524IGzW2e9PfB3CG7qLFOME/hjdAvnpdqRLt1y
oxK32COXBkUn1nHGnFhjrx5dwZSpTsR1STtcMDeoJ8IR1pquOB0/kUSd64nfIm6T
jSfafZRCBX+7qEUxQMm+1bppZAB8nLloJMU4cdwdzhgOJx1mcs4QiMkoP8FNmBqZ
jpnzrtYPGYuNn/Y7In19UkPuerXe+TfIAdeQSBnjC9nqVjlfGRShLlo/+rTB+4We
LkZWvlKwXNE3gNbAOlJB9IFUP2KzfX6UgaVFqImvWFutKebWD5JI9KkulOAobKkA
pBTK1xcn6hmOP/znssTZWNoCDCiVEkIK1cBzXB75QTIx1iwWBwHBMCTdoHyhCr2V
+jkirMxNtY75qcXfRC0Qk+foryj/dFVbu7Hem1YvRVH51rRBz58Oyay27pEBC0uI
/OQ3eJ1F9Fdn3O28DiswzDoNpoIyK9FHCYLoA1hD5Vv5y8sA+DeWEfPTdWVik+cD
AY3NIfklZhIXgfp3Hh6YLZGNDOmOd/bSwwmVqwF2GKAXc5nv5i4=
=bpEP
-----END PGP SIGNATURE-----

--o7iWeLNBu+rG+qYi--

