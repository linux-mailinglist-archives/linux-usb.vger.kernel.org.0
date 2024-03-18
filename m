Return-Path: <linux-usb+bounces-8048-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6228D87EBBA
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 16:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D90281034
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 15:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454E34EB5D;
	Mon, 18 Mar 2024 15:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6K0lFRc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32704EB50
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710774607; cv=none; b=llwVsWUvCp2ddVlIJAxRXWZbnLIyQoMgZnar1AzlkJxBDEbrUun6Y4L9a+YBh8EfuiU16bzMW2ZnHGXrbV9rAMW1kC5wb7qlNip5Mv0Jgj1Dzo86ibEQalC+T5emQ3+O/iDF4xm8L8e6gF2VUqgwQPtNjjYGxdpOsdVhO5geGto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710774607; c=relaxed/simple;
	bh=6ubgJcbceGX7Iqvnn5bIy3z8s6iWEB5nPul/za8qqCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coyMJJcOSx/PC6bHobmOg6HiKvgFs5muOyg+wAQ8CwLk4aKcFgcSbfEV6Bu4SurPBug2kzUPY56nf6m9Aimlvkdse4eYd7bgjCqc1eXv3/Ad8J8nf0BAWOpSkmm93naJko7m0dRTBNZxtoS44I3YdQ3KBMtOp4Eql4m8xu/opqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6K0lFRc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517FCC433F1;
	Mon, 18 Mar 2024 15:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710774607;
	bh=6ubgJcbceGX7Iqvnn5bIy3z8s6iWEB5nPul/za8qqCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6K0lFRcaveRDMoNcbfWGD7DXimd4VnM/H0fGx1eWjaOz+c8eCHoIC0KtExhgbxy+
	 hylQRliyOrqt4Vb9uFkhdiQrulkuVpRQLZsWVPieAM2ZElqcNTiFSmLYe1WYkonjL4
	 0bhWt6DGAoUx3Yhc8gujGhg6TBQZGMYskyAbK+7/LkmnIYA4Me2ZaDlpfnmyu78olP
	 GRsPTlv3s2gBhPVGUCSyrva6QRsWybjELh9nEm8M7EgpD6UWFj/n5tV93KINPlaMwL
	 6+HGwnGB4pi2Viak6FcigTfzSMU4K3VgMOHfVtdAaigb/pWfF+o38nT0OuEDP7bDR/
	 PQcwJUoAYkXGw==
Date: Mon, 18 Mar 2024 15:10:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Aishwarya TCV <aishwarya.tcv@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld
 pointer
Message-ID: <1ef6601b-bdb3-41f1-b3ce-07418dd9c031@sirena.org.uk>
References: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
 <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
 <1b67d844-440a-52c3-b9e7-d12c6fe5dad2@linux.intel.com>
 <f0039c32-e670-455c-8d64-d7b706c6ad7a@sirena.org.uk>
 <19ec72e2-8273-43a0-bbeb-706565e926f2@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k+olrj424WxTyTpT"
Content-Disposition: inline
In-Reply-To: <19ec72e2-8273-43a0-bbeb-706565e926f2@rowland.harvard.edu>
X-Cookie: Alaska:


--k+olrj424WxTyTpT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 10:55:54AM -0400, Alan Stern wrote:
> On Mon, Mar 18, 2024 at 02:40:31PM +0000, Mark Brown wrote:
> > On Mon, Mar 18, 2024 at 04:36:24PM +0200, Mathias Nyman wrote:

> > > We are already mid merge window.
> > > Not sure if there's some way Greg can still get this in, otherwise I'm
> > > afraid we need wait for rc1, and try to get this into rc2.

> > Given that it's a bug fix for a fairly serious issue (it's causing boot
> > failures) it should be perfectly fine to apply during the merge window?

> Greg is away on vacation until this weekend.  If the bug is all that=20
> serious, you could consider sending the fix directly to Linus.

I can do that, or Mathias do you want to resend it?  Boot breaks in -rc1
tend to be pretty miserable for testing since a lot of people use it as
a base for their branches.

--k+olrj424WxTyTpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX4WUoACgkQJNaLcl1U
h9D5rQf44xPOn6uZz/O3aUk0sCgJVx7gJFYsE7y6tCKwNOL2MJA4vLvuqGI1Hr/I
iy533CeUJybxco5E+n4R7Cbiu4hgZz3cupDjPlPoQ0y5bX2PdQp41HhqwMd4sQB3
0MONv4+4ZszZxd8NM5fqH+QF2sL3mHU/yV0Gn8xzxHeP6ZGsWEJKh1Mq1273kFdb
2FblKnl1mcmrVcS5hPrbpF+H8faBDolYAf46m77/Ew7kszuONP5HWPx4deioJcio
B1XKqWEXmZ9xOaL5TEyX3OwRVjbILqSBTMSnH+Eqgt1d8snYhkLficOcfwS0l43B
ALQRyGzoDehIwzaCDd3VJ1q10ceh
=918Q
-----END PGP SIGNATURE-----

--k+olrj424WxTyTpT--

