Return-Path: <linux-usb+bounces-25174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1C2AEBA00
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49C6C4A4520
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 14:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E988C2E2667;
	Fri, 27 Jun 2025 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FS73qVK3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127E2E2656
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034897; cv=none; b=jUG63qr3lKxB8W1HoALGyC9WzLWJPje2q4GLZp5XFsDN4lqgogBtUZ2h83+iZuESkH58dI9y3xUDx2IKSxTodLKW52C2fJhI5YLyaqWer0nd6kWbpR2K9yrP0FjuMCJRdbZyfx6JJcX/YSEjozwhudavQRrA8TyqfhV7lywEyU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034897; c=relaxed/simple;
	bh=MQ6Lgf5Zb/d6eVyZqpe8FRnABCHPl4J4myOuFZtoZAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTeuxnrBymce7VrVF6NkRbM0YJuTWo2KijL1VK9rguI+wRzSpMFPDTJlDLhOtheJT33BjpSxKcM3fL3zKv86RGofMkc4jsdCfJNzBmCX5TvRcOp+kO3UKALO4WufQEZIYDLrPm22+ScxxfX/LIECwOTIDDdvo3UYrP5KL8ApUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FS73qVK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793E1C4CEE3;
	Fri, 27 Jun 2025 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751034895;
	bh=MQ6Lgf5Zb/d6eVyZqpe8FRnABCHPl4J4myOuFZtoZAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FS73qVK3PoQbdeKzLGnlPP1An4L7dKj1X4fLPouzelKp/syRe7bx+TEQOT4tNGgFx
	 JX5f5368PDkMGot6f8ekCd2j80Or9PsmMZivGZ6+30+h27+QP+9adS0Tzkkkxc1x9R
	 aKZankJBB1raz9eGILNlh9/mN4huLNIiPYlapfrvyqKOCl0JqU1w3SAMVtgGMJrXfO
	 jcQwx7/vBBdJq7QiCtQt+gqXi9bL8hSXQWM1ml0sbxFuTbbTGU/9egg0Si7SyKI/MV
	 7568TMyHGAOQahl2pP8glRutZvtqOeJEvIaMlChKJMA3Qf89+Wi5qwwgUPokpZay06
	 U1fKIYN3igQlw==
Date: Fri, 27 Jun 2025 15:34:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, stable@kernel.org
Subject: Re: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of
 delayed work tuning runtime pm
Message-ID: <e42dad63-cb3c-4bc8-9b1e-d43c8e976313@sirena.org.uk>
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
 <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1CiIpXkTJB8pPKkX"
Content-Disposition: inline
In-Reply-To: <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
X-Cookie: Avoid contact with eyes.


--1CiIpXkTJB8pPKkX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 05:20:44PM +0300, Mathias Nyman wrote:
> Delayed work to prevent USB3 hubs from runtime-suspending immediately
> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
> of high tier USB3 devices behind suspended hubs").

This doesn't apply for me against any of mainline, pending-fixes or
-next.

--1CiIpXkTJB8pPKkX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmherAkACgkQJNaLcl1U
h9BHzQf+K+GmAVpywL8ZOMOkOabPymj7xEtoAEjU0XbchDd3b2DStPkECF5iqzSl
dpSy+tJ5JTcDo1yc4DzKwgqdEKNMK4kns2izidXWlW/70NfcTZ+NJhn/vCiZ0rpA
YM9H5tPuTS6NsUxQ5d9ErpLwVH+/uSFGW5V+cauUnLtH8cwKzVI0kzjyrDXHYQiQ
SzqKwM9SF5ebGYOLE0wfZnQn4a1rISNXHwC53Hsu8kDY7sPoa5gWqUz7mrxWHKe8
ulIeItQzBv1TDbBtTsvyUCBeZ1vxs/c7KTjQwhiNqIOkqQxLB5NwurQElzm3dPbo
iRHzIe+t5+r2Q8BwKqSB1ZxqyMkMKw==
=y1Up
-----END PGP SIGNATURE-----

--1CiIpXkTJB8pPKkX--

