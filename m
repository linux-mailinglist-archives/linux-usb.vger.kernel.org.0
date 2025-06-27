Return-Path: <linux-usb+bounces-25181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84071AEBB3D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 17:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A83677ACACE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9E62E9EBD;
	Fri, 27 Jun 2025 15:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTKNomC0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97D2C325C
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037037; cv=none; b=PAyI22sZFaFwD+3lIXrICURgrGIucOj/DxZVeY6vdja+Q9ufeLnsHuUaDdz17QnKDAqYG6m+YRaKqVv4wLO9/plebKJ1/zN0Lk+u3cpIhufYjWYICB2TNL1fNgZtwpJyA6w43F8B7diGmm5ML56K9rBbBA+xJQpRduFmuAEXQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037037; c=relaxed/simple;
	bh=j4E0zwyXpJ2E/68G1tU3ntUFyN2FgBUxyxH9BZTvhCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eeZhPeZTS81Khwxt9B4Qq75rgsAo32mYFjTjBcxCQL6e31yo/j2xyNTohQVRz0SeOvL6uYe3ThzR9p/ddZHwaIKwcy9145tFRtqzj3Jze2TTiNJhppWYDdXsfeoBXGWF0DF+8Z4xJzqcxeP8E5htR8mCC5wtDJRRg/bYCtjHDf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTKNomC0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F91C4CEE3;
	Fri, 27 Jun 2025 15:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751037037;
	bh=j4E0zwyXpJ2E/68G1tU3ntUFyN2FgBUxyxH9BZTvhCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jTKNomC0Pnts+d/AFSmGfE4vAVgWEdEDtMSVrVWikwQmaGCrI0GoBzlQ/ukzTwyZH
	 8nLCjS0YdN+7TDrXyZ6sHMzp25alwJs4rxuPQZlXraTPHCOul45844QcFwkYtqNP6S
	 6Hmu5eDF3NlNpCVE3/zhBqfTRDBkY4mp8VF7G5wr2yGxgGcwjSVkZmthqJ6xgc2qyc
	 6xQG26O7Vvk93TfdPaUKKZnQYrSVH2EFMUGbqwt0HmSUXLhtvBqlVOdRy+/OClM48X
	 ggNaC8nCg/9KTjqg/acR6Wj81JWAsbXSViKlHBp4d5xQUkeVec+psHFRO4MdxyOzVm
	 rSPYrVP4YFtJw==
Date: Fri, 27 Jun 2025 16:10:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu, oneukum@suse.com,
	konrad.dybcio@oss.qualcomm.com, stable@kernel.org
Subject: Re: [RFT PATCH v2 1/1] usb: hub: Fix flushing and scheduling of
 delayed work tuning runtime pm
Message-ID: <865971d4-2c1f-4930-980d-951568e64fdf@sirena.org.uk>
References: <20250627142044.3872229-1-mathias.nyman@linux.intel.com>
 <20250627142044.3872229-2-mathias.nyman@linux.intel.com>
 <e42dad63-cb3c-4bc8-9b1e-d43c8e976313@sirena.org.uk>
 <6f251f36-cdfb-4cf3-9066-e84d5842c875@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QCeod6TRaBMtbPfu"
Content-Disposition: inline
In-Reply-To: <6f251f36-cdfb-4cf3-9066-e84d5842c875@linux.intel.com>
X-Cookie: Avoid contact with eyes.


--QCeod6TRaBMtbPfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 05:52:14PM +0300, Mathias Nyman wrote:
> On 27.6.2025 17.34, Mark Brown wrote:

> > This doesn't apply for me against any of mainline, pending-fixes or
> > -next.

> Ah, right, -next of course already has version 1 of  "usb: hub: Fix
> flushing and scheduling of delayed work that tunes runtime pm"

> I'll rebase this patch on top of that

No problem, that's why I tried mainline as well but I guess there's some
other dependency.  I was able to get this version applied directly on
the Fixes: commit (which I should've thought of before sending that
mail, sorry) - a test result should emerge at some point in the next
half hour or so.

--QCeod6TRaBMtbPfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhetGgACgkQJNaLcl1U
h9CKnwf/VnsS8B91oDYvrTpM3eCbzuDdXSgdK+XoU2wfqnso8SvMbHYvggPzxL+v
JHMGtRKjuLv2wWhAisIdnaVrY1CQ8IVYq0Iabkou7+oJdq+lkfCpbaMOFE8QwU8K
KbETpdJwj5pk4hGN1Tl92f/M+1n9tpJxEShjY25ivhJ1+UfxHewuMftv6krx4/Ul
wg9s+K1RwY7g2si+4oOzwDSfF7E83Wg3keJyyS6edCG/wnfF49wscIxFFTf33BU4
yNDV94XUpWIP4Tc/OMI4YTnRTcxsphNl5HAT09YfCdcRw/pQA8MLC+0Bbg6SbNH4
/J+tmT0H0fXI5TS4oZ55ARx1p16Adg==
=vFPg
-----END PGP SIGNATURE-----

--QCeod6TRaBMtbPfu--

