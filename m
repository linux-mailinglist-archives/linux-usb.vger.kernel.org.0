Return-Path: <linux-usb+bounces-1383-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62017C048C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 21:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EFE72825CD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 19:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7699A3218D;
	Tue, 10 Oct 2023 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOwfP2fo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CCD32181
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 19:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D001FC433C8;
	Tue, 10 Oct 2023 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696965954;
	bh=6aGhe1D5Wpj/8nF2yBk8kzHR/8H7Y4/7mQ/EMQzjmyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOwfP2fov2jcIzLLP17wHLF+HmzM3aTpZLSBV39SGPOGCUVMLPfu/KPStQqQPTdI0
	 jpU1qdXxy0odrCzyEmkl6iZdAepSOMBvejbxx/MaRbuOMA0j2PNWip+k16ymjKm3VJ
	 /VezTXco3ori5AoHBTAqYE0BEJnCYCQemaNBxbD6IRANXhA5IFnHaHJemrO6cZ4bsD
	 HUbP5lJ3Gb1hnhfbyQun7Eq42gyOco4Y5fLDWRtqDujKNwy98dJkjB4P7xtQbPap5N
	 GhioGt8cD7+nyoF5EaurZmjJZ9Omn5jj9ivqXfZ5zhYCQbKjwP9ACNwrmfCN8xhg4U
	 BMdGFdPFGRUMw==
Date: Tue, 10 Oct 2023 21:25:50 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Wentong Wu <wentong.wu@intel.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com,
	andi.shyti@linux.intel.com, broonie@kernel.org,
	bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
	hdegoede@redhat.com, linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZSWlPgSZi6uIxPGo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
	oneukum@suse.com, andi.shyti@linux.intel.com, broonie@kernel.org,
	bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
	hdegoede@redhat.com, linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-3-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/TB0LcZbcuX4Yi1j"
Content-Disposition: inline
In-Reply-To: <1696833205-16716-3-git-send-email-wentong.wu@intel.com>


--/TB0LcZbcuX4Yi1j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 02:33:23PM +0800, Wentong Wu wrote:
> Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
> module with specific protocol through interfaces exported by LJCA
> USB driver.
>=20
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

I2C driver looks good. Waiting for the USB part to be applied.

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--/TB0LcZbcuX4Yi1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlpT4ACgkQFA3kzBSg
KbYxOxAAsDXYCq218NxgOF4H39GK+e75fDBqUtXaRoVRmMDuicJ7o2TgosOBATKp
28lDHoPzJRms2rspOSpYNREXtAIRXctqJk/74FgsxY9SsBnwoPaCN5CiQUutm3wM
PBkWYa4Z3fxm0wrh2xkyQ4a0l3aj18vviRaKOqrVnoiHleXPeyxPyVdD1q3gGlwy
b8PlFtn/bG2XwOWMs0YP8hnn0+GontIB2+JkgzMpZxZ5wZeL3vmxdAPGZYSUqMWt
0thfutaZjfOz0/0Chhm+3JyaUyziWtbdgRAGAI/jV5gq22hN89sKhQaFTBdMuSYo
de3ucneZivSjhGcHR4ABKGsisbn4tDQs6XRo5CkN/jbZH+FIWYuOTtux4gOJcAi7
hEPZdXmaL/1o7/usQWTXZY7D0241qrD5BYeyrQ9ljA5ME6UgNFlIhjGTucV6JxoM
5fXdS7F+HqkT+yWsZBll/FLWX6mrYnbK/brMpL9OGa/WUQt2WO6uoI3WAsYXW0uw
T5v3ldtvK0nYpPXoMiEp8P7hbzOZkn5J/1iaUpzisP5OkrAghl8Fa2FSlr3zcDRb
epIJQWOLi5MHQzEZT4XE0ub4yrRO+zFZTXmDiLmBGqxQcRPbPYCuVduh1OQ77hvX
puBFbTpnv5yKGMHAhRpfWOKwYGlX095XYfiuWkor6caGqM396wo=
=4737
-----END PGP SIGNATURE-----

--/TB0LcZbcuX4Yi1j--

