Return-Path: <linux-usb+bounces-25168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB30DAEB952
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98F5D3A8607
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349C92DA745;
	Fri, 27 Jun 2025 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoYN7Ydb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A308460
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032575; cv=none; b=q77GPgpSjAtve950gKQkmWOYFXFyrXLIsX5wcW2Q2CzURBMHOtUnDZCV0tbyITqdpQxaQz97VD2sNGDKjiJoxeYqpy/G/O7PL0v7uHgpBbCCNhnEz1XIhDDexppFvjGivfQMRJqD2nclrPH81V0xIrLjnZbV1lqQatjhg/fSBy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032575; c=relaxed/simple;
	bh=Ph3+8sN0YO+rRfWU59xQ0Ksx83eeoqrTCxno/6rSNsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8iKV8RTBCAo1pkvormLIj5ttKqZaOyesgGFQQEEFQPtoYB3c3A++9bIVX61v/V4tDDjrrHgl8RPirMHNStAp5IlE71iDE6pZ31EAoS31hWbPgrcDZ6BDDWIFsgYZD2ctWRxoQ6wxZi2A33zJmVqnMmymZUXEmogpUKABe+QLuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoYN7Ydb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB697C4CEE3;
	Fri, 27 Jun 2025 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751032575;
	bh=Ph3+8sN0YO+rRfWU59xQ0Ksx83eeoqrTCxno/6rSNsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OoYN7YdbjVlMqyYUlH9DXbdgyr+A0aur/Ca1QUv7eJuIuSJ0A4EKdvDDQ/FYs147L
	 cM5LZBi5zEa79IRvGsxfLvELbGe4GNScKl8Mpo4EA8ywKBS4EdkFMyKl8thnd9Nq3r
	 X4LoeAEBXfumyG48H4XxCYU3aGqQhMZ3wy/w7ec/+mYNGL0bM1Fc9BDGpha5LHs6dd
	 eaoOM5QErE0lQce0ieCGvNLgL7ahBYLhEPuV6gQSxdSQZzXImFZDjiSHETxx4ix6eX
	 30KI5/pSF+njsqXCQE6pUjS/wLIPZoVMxjINge2va5Shdd8FBp3ijZLdGElF7JtGu0
	 2aaD+RaRtILhg==
Date: Fri, 27 Jun 2025 14:56:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH 1/1] usb: hub: Fix flushing and scheduling of delayed
 work that tunes runtime pm
Message-ID: <3ef15061-d06c-4fc7-a91a-92b54cca791c@sirena.org.uk>
References: <20250626130102.3639861-1-mathias.nyman@linux.intel.com>
 <20250626130102.3639861-2-mathias.nyman@linux.intel.com>
 <aF5rNp1l0LWITnEB@finisterre.sirena.org.uk>
 <50cbe7a8-c103-4922-b06b-d183a37ee08d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MJ/793XozXHKYtAf"
Content-Disposition: inline
In-Reply-To: <50cbe7a8-c103-4922-b06b-d183a37ee08d@linux.intel.com>
X-Cookie: Avoid contact with eyes.


--MJ/793XozXHKYtAf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 04:51:34PM +0300, Mathias Nyman wrote:

> If I write a v2 patch that puts this post resume work into its own
> dedicated work item, and only flushes that, could you try it out
> on the Raspberry Pi 3B+

Sure (and if it turns in -next it'll get tested regardless of if I take
active steps!).

--MJ/793XozXHKYtAf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmheovoACgkQJNaLcl1U
h9DzCwf/X071lQaYuI4fHu5gmgMvBWc9VjrqF18CvkeLLBLzsV0YLYCXHpVJ7Gf/
zow1vxy7BS6+hir4xk9ruorbz4jrke2gKsKRHCe9vdqHKj8DHPU0X/5JYzcy1d1S
Dd25iFvYfD7esWAWz4ztUc10hWHDaveP2SmhhPwZyrG/Et0QpwFCE0z6VtkLL6ki
0QlqMngxpLZPmJRJftyxIFqCjB1QT1ZCKluiKKBKr8i4Dswfk4tnvDh8EBwo9LM4
Q5e2STbouxkqanV/r8D+070vB3ipBUfdPG9WLph1hvzQZ60dyILcaFDdESaXEcFj
M4nDGYzzD2MKs8/+0KU/QzSydYGjbw==
=BIxK
-----END PGP SIGNATURE-----

--MJ/793XozXHKYtAf--

