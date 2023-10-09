Return-Path: <linux-usb+bounces-1265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAC7BDCCF
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 14:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB0282816F6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 12:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BB5179A6;
	Mon,  9 Oct 2023 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OvK3rnOo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9CD1118C
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 12:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925C4C433C9;
	Mon,  9 Oct 2023 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855833;
	bh=am1r6BTG/XmXtORcHF6USty0gqCaUscj0/AmTY4W23A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvK3rnOotvxVgvWV5m5YztYaMp2e1yGXx1dGKQ2ORtvR9KAO92CJJAkD6pZHwmRi/
	 eg49JuXXQkuAl4Gwno+ECJVWLVVXnwNWX318d8s4p7XqIFR5NwIrNi+W5aBgwU99NP
	 s7YF4eomr70lkkOCcSggSGbSh87R6WLg38KuoZgsGLufrY4rqavHZw0dt9xVOgqH6n
	 K/fvGLhz21qqZO4K2/oel5ypPIfMRsmLgHiuvFasSVq9Rwjfg8SrpNHXsqmGTLY4eS
	 nQImGOTjYxFWAK2kORMmef+Dyh3LLQUsON1l0JvHXdybTG/dKJlvW9dcWfESIV8EUq
	 EyeTSQNh5Tqhg==
Date: Mon, 9 Oct 2023 13:50:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Wentong Wu <wentong.wu@intel.com>
Cc: gregkh@linuxfoundation.org, oneukum@suse.com, wsa@kernel.org,
	andi.shyti@linux.intel.com, bartosz.golaszewski@linaro.org,
	linus.walleij@linaro.org, hdegoede@redhat.com,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, sakari.ailus@linux.intel.com,
	zhifeng.wang@intel.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 3/4] spi: Add support for Intel LJCA USB SPI driver
Message-ID: <6084346e-48d7-4f70-b49a-46b5aeda2c9a@sirena.org.uk>
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-4-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="et45qnm/EusVI4JP"
Content-Disposition: inline
In-Reply-To: <1696833205-16716-4-git-send-email-wentong.wu@intel.com>
X-Cookie: What is the sound of one hand clapping?


--et45qnm/EusVI4JP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 09, 2023 at 02:33:24PM +0800, Wentong Wu wrote:
> Implements the SPI function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA SPI
> module with specific protocol through interfaces exported by LJCA USB
> driver.

Reviewed-by: Mark Brown <broonie@kernel.org>

--et45qnm/EusVI4JP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUj9xAACgkQJNaLcl1U
h9AHpAf+Lcv/GJXaWMla2DduP+3qig0ZxjVPLwTRsDGNWY7btA80cDUxQBWMjvRC
hDzi621fgKj33PT6wws2CVq+GwZhhLAYrtSh6+0bpXWusY2TRIwLxnfo96cKN6tk
p5T8hdfRGYUyFZEAXtWBGd0+5aObdIWc/a+CtwzmXqpjY7+YHLnD4Fc+2HqTapyL
EZ2nhADF0KSaRkJ/VLtSSIj+Rr+DHPYVG2Zzsm4i3rALtrwL3DFoBK9ZDmhQ7/GN
Dhyf3HAcc6kGD/10SCbRtJVN3nzzTEm+1yVrPGQUT65BK0YsjzVIp0KS1s5mKb1s
iYidXdqI15muRrJUH6XSUjr21nkEgw==
=hHSh
-----END PGP SIGNATURE-----

--et45qnm/EusVI4JP--

