Return-Path: <linux-usb+bounces-25182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB67AEBB83
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 17:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB79E642A4C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9972E54C8;
	Fri, 27 Jun 2025 15:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej9rgalO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A211B425C
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037548; cv=none; b=bIsp59xXP049W+wb/bSwysGDzcYE44U/MxMA+zl897ORz6KLB3cNGW6Net94g6PEZlOnBoXR3G5ww2mVtUiHY8mugZpdCSh8iCaU4t0f9rGHJ+PmU99zrJubchTO70wbUilaXJ26K8fzDY0y96WWDM74svtvqPu3Q91IrAIXpJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037548; c=relaxed/simple;
	bh=iOmMdYR4iO5U/L89M4bG6bVSuKs90B8cc7DAldPhqD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AF4JDkXfuTNiFhlNl9Ej9f3NxS5AanXcxrhenJsUS8u+q43MaVKG+AMN8fZtuNTVLyxP1/nuYHltTB7QwD/DoeaRDA0BoIWDsXkyflHiSgEMkuybq/yKT+vr8DP8YbSVWuAh7Hc9vRa4P1PD1ERMol9cAk7/cLhIirYJCLzG+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej9rgalO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF5DC4CEE3;
	Fri, 27 Jun 2025 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751037547;
	bh=iOmMdYR4iO5U/L89M4bG6bVSuKs90B8cc7DAldPhqD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ej9rgalODbEgm/4XAwa9HvrQVWJ59nnik5BUOB1OUFfslHma0OURrKj8/qDtS884R
	 t3Br7iWqLGZmvXiBNr1ZLbxVsgXRYfVo39sIKvh5myg3yn1CXJaD3yWG37yxaDgyUs
	 gGrJ/mJ3godsq7mT7a9lMbkvvD/enZu7GmSbHoeB5R1fJ+wvb/kTOBb6C3Q13QfYBj
	 k5bV7mCChq8Li7QMFa0tlz4n73JXfyvhBCgYRgH2mXunIeWp8x4qNVP1KQDuTDHP2G
	 jfWR/5wyD+BVWXihRzKZVpENV7GWVfnjmRjFZwvZwZ5wrz4iGQw/D7KdkEL4P6EYxb
	 dg7i31TyuyCkA==
Date: Fri, 27 Jun 2025 16:19:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, stable@kernel.org
Subject: Re: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of
 delayed work tuning runtime pm
Message-ID: <3f24a333-48d9-4bb6-8180-fc0b8e8a9e43@sirena.org.uk>
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
 <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K5wcPGwrRw82X/RW"
Content-Disposition: inline
In-Reply-To: <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
X-Cookie: Avoid contact with eyes.


--K5wcPGwrRw82X/RW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 05:20:44PM +0300, Mathias Nyman wrote:
> Delayed work to prevent USB3 hubs from runtime-suspending immediately
> after resume was added in commit 8f5b7e2bec1c ("usb: hub: fix detection
> of high tier USB3 devices behind suspended hubs").

...

> Cc: stable@kernel.org
> Fixes: 8f5b7e2bec1c ("usb: hub: fix detection of high tier USB3 devices behind suspended hubs")

Tested-by: Mark Brown <broonie@kernel.org>

applied directly on the above commit, I'm happy to also test a rebased
version.

--K5wcPGwrRw82X/RW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhetmYACgkQJNaLcl1U
h9BXVgf7BVNibQBoygpwX70op82RMYQqNs9WWZCS1qWXoNndl3eBM9gM0s61Kpob
V8uRaI+3VM28k8Ii2i0Gw5ozCalLNv0/SVkshHEa6iGFF6ZiAj1eg3/ZKoHf/WPI
phl6kwjzLQ6gK8h9jQAWnM+3ZiOZbtCZ/NWSJ+JJsgHKwdwqxpKS9K98AEahidRe
3dacHVeTUSvE91YSOT1/oqQty4cOQY4KP7d8rT1KzpefWrMMIGjlkCHzehJ1VXRO
7rCPm3Ol2xzSHFo/RlY+PKGjIN2wPGmlorGy9tDjR3YHj3ECfLsSfxCypv1Jttv0
0t5DYaRu2anuy+vtFN5XC7NVc8ZGBA==
=JGrO
-----END PGP SIGNATURE-----

--K5wcPGwrRw82X/RW--

