Return-Path: <linux-usb+bounces-704-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 562987B1CBE
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 14:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 84DA41C20AE7
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 12:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2506738BDA;
	Thu, 28 Sep 2023 12:43:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9178C03
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 12:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C2AC433C8;
	Thu, 28 Sep 2023 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695905036;
	bh=nCKJkBLDsYJN2+JB6FMchINp9ht48WeKEfXXmLsMaac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mR/mGzw26+OXka1xkGonbsyZD56oHHOsYro6F6Gpt8gwyQ0Qagcu7bwbuq40P8ZQ6
	 Jj9Rqc2hAoybfVZN87hd5IP53LWSJ4MgZPjclC5zZidUzb0R3hCorxC54G5VdmZ16Q
	 OtFcpBidl727OL/E+g5gspPU+hxxli/GVgPW4vbNGxtkpnml4iTSzH1JC/uvUoHaLE
	 XNHLM410ZhzpnmTfvjUMHnfGveZJ951uq9BFfsyS4BaED2c2inV6v1hUs9pggaYuVj
	 sT7H8S/E9LswpQC2JyND3CInwkhpKSoZAgn3nvVimWF8/yNT4nEVmjwTltw7vWJodB
	 wI7iZGbfLiOqg==
Date: Thu, 28 Sep 2023 14:43:53 +0200
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Oliver Neukum <oneukum@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
	Wentong Wu <wentong.wu@intel.com>, arnd@arndb.de, mka@chromium.org,
	lee@kernel.org, wsa@kernel.org, kfting@nuvoton.com,
	linus.walleij@linaro.org, maz@kernel.org, brgl@bgdev.pl,
	linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
	andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
	andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
	bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
	zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Message-ID: <ZRV1CW/QpjCUTfdm@finisterre.sirena.org.uk>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
 <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SeTSb0KJB9qsHfXr"
Content-Disposition: inline
In-Reply-To: <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
X-Cookie: Save energy:  Drive a smaller shell.


--SeTSb0KJB9qsHfXr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 02:20:04PM +0200, Hans de Goede wrote:

> I agree that at least patch 1/4 is ready for merging. I'm
> not sure if Greg should pick-up the entire series or if
> the rest should be merged through there relevant subsystems
> to also give the relevant subsys maintainer tree.

I stopped paying attention when it was obvious that the USB stuff was
struggling badly and getting lots of resends, I've not checked the SPI=20
stuff in a while.

--SeTSb0KJB9qsHfXr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUVdPoACgkQJNaLcl1U
h9Bk8wf/VXNcs84lq/tAoXmnr/TduF6HArdLh07P4ByQp8OOhW6VHFl8hdub9L8y
HW8C6+2Vi+nVmqQP6Vaka+eDehH9iaC/enuVWe0KSMTXwFzkJ04bQiI0XW/BrXHw
drA0xqOIihqtHXXEW8gObSnsgvU7AciMtVOxQwNahAK/0snz3bqIGLCq4Ds5MGMR
pKYBerSpaRRagFWX06dyJhfGSEfuhtP94Q75V8w2vhilQjzJi+duTwi2/Uyjn5Mi
tk5cetmxM9ipFjFkrH8fGLdZo4FydOnH0v+7kar2iC+EjCOKlcXKicajWWJGTzkN
a3wF1jybaLwc/+BrHBl61EUG2oNWuA==
=3Esk
-----END PGP SIGNATURE-----

--SeTSb0KJB9qsHfXr--

