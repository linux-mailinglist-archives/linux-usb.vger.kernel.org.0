Return-Path: <linux-usb+bounces-8046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419887EB31
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 15:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9349B21947
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 14:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6778F4DA0D;
	Mon, 18 Mar 2024 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWeK8PFe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3811433AA
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 14:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710772836; cv=none; b=Ra4w0JlmRtZhBVyirbDJMvajeWbOlP5Joa7YCgEBKEQvef5DW2IGDp9zBHMHUs8i6hL17SZRLxCH6HLjFC9RXRdyvGb5HbLUEem509+Nrvhq88zLe1cPKmwn2JklmbsfxxTMWrf94dQJhzMM9zAwpPOkPTKxaM3zibUgn46cA98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710772836; c=relaxed/simple;
	bh=FgYufKlQqR9ghPIqQ/mtCDJqemnCKSYILWn3WNlik1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxenI3feSlxqBNvOIh9Hc2JvGITwY4SB2e7kllz0uO5ZEgDP2nDDDiMAm4qein+GC3eRbkhKZKoyMu6YnwAGEcxtVCG2drCTE1nsmYJIqGt2guRBLTnxRw1JLo2kZYU/wr9H8gEsKRhVd0kKcoBT6zKeD6vEH0NEkbh6o+qLt5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWeK8PFe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E85C433F1;
	Mon, 18 Mar 2024 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710772835;
	bh=FgYufKlQqR9ghPIqQ/mtCDJqemnCKSYILWn3WNlik1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWeK8PFej/6EavX6PEP8Mi2Vh7OdWFAu4ehF/UAPZBsYRF5+PJ4SsLkBKj6U1NMDZ
	 qKzZXEZ/XRkIqhP3FhgEsgyhljnlqYIRaqoF8YOn5qeTzpEckqXTtGKj62X4MhNWfI
	 tbLD5+bGCADI2ZQrYHJZfRDVSCQWoltD/6zlZiJ1bStUfmtyp/czDpR9sOzM4PMbOf
	 mBRsA+tcH/nLxUzVBWD4jEZN7Ax2ScUKUSgm3NI9dxk5c4jKZg74SgnYZNIO5SLunc
	 /PkYoL5NFB/aKK9MaAVfOSczpwl7T7SbK9c0CwDMJ7KbkVF3uKyfWTzQZ4zF4ETiEK
	 JMKnBa/OyP1Mg==
Date: Mon, 18 Mar 2024 14:40:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Aishwarya TCV <aishwarya.tcv@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>, stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org, Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld
 pointer
Message-ID: <f0039c32-e670-455c-8d64-d7b706c6ad7a@sirena.org.uk>
References: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
 <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
 <1b67d844-440a-52c3-b9e7-d12c6fe5dad2@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nNQFh9VlSh/AdSCc"
Content-Disposition: inline
In-Reply-To: <1b67d844-440a-52c3-b9e7-d12c6fe5dad2@linux.intel.com>
X-Cookie: Alaska:


--nNQFh9VlSh/AdSCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 18, 2024 at 04:36:24PM +0200, Mathias Nyman wrote:
> On 18.3.2024 15.30, Aishwarya TCV wrote:
> > On 08/03/2024 11:34, Mathias Nyman wrote:

> > When booting the kernel against next-master(next-20240318) with Arm64 on
> > JUNO using ACPI, the kernel is resulting in boot failures for our CI.

> > A bisect identified f3ac348e6e04 ("usb: usb-acpi: Set port connect type
> > of not connectable ports correctly") as introducing the failure.
> > Bisected it on the tag "next-20240308" at repo
> > "https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".

> > I believe this is the patch to fix the issue. Kindly note that the
> > failure is seen on next-master runs from the past week. Any chance that
> > you could get this merged into next-master sooner?

> We are already mid merge window.
> Not sure if there's some way Greg can still get this in, otherwise I'm
> afraid we need wait for rc1, and try to get this into rc2.

Given that it's a bug fix for a fairly serious issue (it's causing boot
failures) it should be perfectly fine to apply during the merge window?

--nNQFh9VlSh/AdSCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX4Ul4ACgkQJNaLcl1U
h9AZ/Af8CgtZrga+PIw+wbekyW9+8mrvWAZ+fjwWcI2uVl7QYKFZ+ddqwFF/FEQW
a1lZshAuuaOjrBbsKmjFKnB76XJMb81mbRt29sGwd7WcJGzjOVo1zvdUks3RbMyo
VDj4GDHQTEwigCbTFL7710Zb1+p++g9ttCoEoDhbOXaKCxk6Qdgf7TkdQDvLa8MS
uuMMnZzVPxDJNVjNqIcODVlyPeRACgXr2L8s0iVkBSaH9Ylh8DNL7Gx7wZ1frgtG
J/DHJ/SBmvg4ijh/wWaXRLOy/er1eFi80HiLV2FqFYsfiBqsMMmtEx9tMTafoihO
86JpNPWny80EWvVLb0Vwcg0JT8bsSw==
=CwS7
-----END PGP SIGNATURE-----

--nNQFh9VlSh/AdSCc--

