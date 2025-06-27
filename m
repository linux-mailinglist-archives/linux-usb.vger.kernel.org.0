Return-Path: <linux-usb+bounces-25200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3738AEC234
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 23:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8F4A564D07
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 21:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE1128A1DE;
	Fri, 27 Jun 2025 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWC75QS7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E93171092
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060533; cv=none; b=KIPQNdu/p1CAknw8agy+szIefg13TzPs0DJ6x48OyEBY/yWVPYyW1UDQrHfFhjAMmHILG9GvAZ8FVP6WE3O2jydytRDAR3YN/Ozgc4LTHS8hsC1USHEuwKKcXCqu1/6aKX3zz7m7c2joJhqt3e8mEsWOBEo3sV8yeZppPpxy/qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060533; c=relaxed/simple;
	bh=25OUc9RKLtmwb5aCT5ukMuv8dz0jrYjR37FzRc1xc+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwYrgoOwYcmGI7M3uyDmTpta/tgNilvNAMT90YES3bPAfINgxImHa783d8PQQKtj8JTNxT92YYer4UjLcx9pMf6P+H5Ds6YsrGfpT3slv82OhD/T777m9iwijHTVSKAT/HnDrUCdzEE41fx8JfH41rxgg2Vw4kFx5C7/FyGK43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWC75QS7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15B9C4CEE3;
	Fri, 27 Jun 2025 21:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060533;
	bh=25OUc9RKLtmwb5aCT5ukMuv8dz0jrYjR37FzRc1xc+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWC75QS77ioJBbKUc0z3WP5T893DAEchkBsR9bPj5MUIfl4FiHFSHcfbm94GLFDSX
	 JyPu88V3nVR6XtaAwtSw7b5MGVojA7eS2oFzTRm+LWad+8NeVthQHGfLOlk93dcQ2A
	 Ns/9hyVxYMX4VQ1xGPLsrlRiiPlVNrdNNIq+kME9oLu3XaZTY1drQjw0VZt+VNKhKD
	 pT6P46zEBYLYqFmjn4FDY3iilhWVYpNdtKOKi0r+X42t/iJeOdhcUvIDb+lkGZJa2z
	 6hSIrFJg1gzXHm+wDJwChhymgbt989oblhzfpTXnOQ/qmwXg9EOsO+W4FmA2KgsX8H
	 kPYLuepWfQMsw==
Date: Fri, 27 Jun 2025 22:42:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, stable@kernel.org
Subject: Re: [RFT PATCH v3 1/1] usb: hub: Fix flushing of delayed work used
 for post resume purposes
Message-ID: <91e7b842-d23f-4adc-8912-4f2028152227@sirena.org.uk>
References: <20250627164348.3982628-1-mathias.nyman@linux.intel.com>
 <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zoKC4889cQkJiSLd"
Content-Disposition: inline
In-Reply-To: <20250627164348.3982628-2-mathias.nyman@linux.intel.com>
X-Cookie: Avoid contact with eyes.


--zoKC4889cQkJiSLd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 07:43:48PM +0300, Mathias Nyman wrote:
> Delayed work that prevents USB3 hubs from runtime-suspending too early
> needed to be flushed in hub_quiesce() to resolve issues detected on
> QC SC8280XP CRD board during suspend resume testing.

Tested-by: Mark Brown <broonie@kernel.org>

on both the Raspberry Pi 3B+ and Libretech Alta.

--zoKC4889cQkJiSLd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhfECwACgkQJNaLcl1U
h9CnSwf/U7Z5TmwIDh0Y9Zm2jo8nFQLGs4tTUfGebmqp4BXHHGsWBvnLM1UWjDAi
wSACDtuAXEZMNzCq7+1T2LYJ/tDOPjKy1YSiUFSRNjEvDkNXsmscjBnJpvpa8X5o
CBxsM+5ap8RmT604XloOidf6voNr05BGLQeA+Vq1WdfijDAfTePvCnf3pnfi0jHL
N/Btpixan9o285g7gHPeKg30i1NaUjQ2qz4KntfwDGmLNZv+JUZo3gXqE8eIn12r
EQerqgVtnT0WhzmT87JohfM/dI5Esd1yzcKbaYIWmdYFCsbxY1HqiL3Wfu79zYpq
z07MwQISZ+kaKuItq3GtbP+edtxCsA==
=ZWyV
-----END PGP SIGNATURE-----

--zoKC4889cQkJiSLd--

