Return-Path: <linux-usb+bounces-740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE9B7B2D42
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 09:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id DD7DC1C20AEB
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 07:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF127C2D0;
	Fri, 29 Sep 2023 07:51:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C517D5
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 07:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67638C433C9;
	Fri, 29 Sep 2023 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695973908;
	bh=iyIPI73TgggZFG6vSBaLbOmkRMMZ6arLpAx8an8tRTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BdpwaCcdJvBumfQ3WeJkEtODzou/TDJNph1C0slLKec8ISoKLC312jrmBDstUtuLB
	 246SylgFSd6SlTAg2WqtQ5IL77yglU1a5bIEVTTJLjG2Aj1V5zyUYcG6lX7qabJhfz
	 7oJKZidPmkErVJT6b+YDumossOtwbAiE5gAa8JZs7KRIrfaOV3ZCbvL9oVofoEvIdi
	 a8A2V6+XxeQwyb/SeGLQyiktz0sVMaP3sP3DnwN+eV22U1xcgHREEpD1Ic1fNlveky
	 FcRZhq2xvu2UhZqdiGbeWSQJnNjhISS9s6SdydtAfWWYhubMrdr8EDSPvznP7iLGJw
	 gDmks5yiWvlFQ==
Date: Fri, 29 Sep 2023 09:51:44 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Wentong Wu <wentong.wu@intel.com>
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
	oneukum@suse.com, lee@kernel.org, kfting@nuvoton.com,
	broonie@kernel.org, linus.walleij@linaro.org, hdegoede@redhat.com,
	maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
	heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
	sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
	srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZRaCEI5EZuSx5/Lx@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
	arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
	kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
	hdegoede@redhat.com, maz@kernel.org, brgl@bgdev.pl,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
	andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
	bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
	zhifeng.wang@intel.com
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-3-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YCx/WuvTs1tSucgW"
Content-Disposition: inline
In-Reply-To: <1694890416-14409-3-git-send-email-wentong.wu@intel.com>


--YCx/WuvTs1tSucgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +static u32 ljca_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C;

You could use this here to make the driver way more useful:

return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);

Except I2C_FUNC_SMBUS_QUICK, emulated SMBUS calls work out of the box.

For I2C_FUNC_SMBUS_QUICK, you need to test zero-length transfers indeed
('i2cdetect <busnum>' will use it and is a good testcase). Which would
be good anyway, because if it is not supporting zero-length, we need to
add an adapter->quirk flag as well.

We could add this incrementally, but it will be better to have this
correct right away. i2cdetect is a good and simple testcase.


--YCx/WuvTs1tSucgW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWghAACgkQFA3kzBSg
KbY/ixAAowr8Fus+jYGKBQQGDqTL5HX4MCFiPibs8Uq0yRLrqiArAdwf0ERVpM4s
1mXpq4mA3W2cF8r1p5IrzbIsA1Zo31EmESC3KbqtPyNxvV5yOP6tqXsleODQ1fv3
eABFlCftQLjgvY6hYSaP7yjmSpQ9xiLhXUNl3CGH43kyKrJ7O4VXHR130NrDpC0q
YBbalXxrtY1M2zDBDjVznMF401w7KgGw345x93W0XztZG+queVmSKlzXK9ereUZ5
1jI9rW+2T94PwDEp/H7i2+ACbnIoPfIam/iSkwg+Myr7E7erpUBHy1kWRRbtOgVV
8Egk78ynig4pRSCplfVx4qQX9D8sC2m2NJrtY6dpWXE2K1Eka6HE+CcfDqbhoXT0
Ig4geaTomjVDdHR3/48uvu3ArEtM9OJi0EPnmXefhvoEKwmVaBEoTt96HIXYL7YN
28FYmrlZQFK7W7CK9AegOgQZp15Ghi45syaA8zsA6Qea8p4LEUK7bV+6QCfllwlI
BQpPVnqd7uqbshDGXFyhLMB/fQkDarM9nOy1Qs4D/Endva9deUz2Jo4V0vYxoDtJ
igjeYqG+ZEflIbEDa7PmeU6S+SarpC0aqcnOzaYB1T0Ohta8d88Gv5UkfYkmkjTW
uBTMWcZOfyaqqg7uLNENi0uXPSFWZzmWnieoB6c/cq9iB+j7a0A=
=+eIl
-----END PGP SIGNATURE-----

--YCx/WuvTs1tSucgW--

