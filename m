Return-Path: <linux-usb+bounces-8086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C48387FD04
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 12:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FE42819A2
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 11:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBF47EF00;
	Tue, 19 Mar 2024 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jn2+hoiP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524711CD13
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 11:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710848258; cv=none; b=uA+C9pqW+2GVUjza+qgtFlTFjhbOzljI6F/WliSZPLqrWKVZcdU3zfIzGyJ4KEYtB+NVn5kS4MtZtqLDuj3oGDlfEEzIzyTG32K9c/ZZmO9L3zNOR50Cmp4YQ4TJ5y6EznrvwYoH+og6Z+LIy3JSXV7nGqWraZc3gk0nZGvef7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710848258; c=relaxed/simple;
	bh=rnLSiRh8vWPaiQuJF/eJ9b9imjLOosOSwooUu7yfpt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0mdiAoQFQI4drnkicT+77CUTBqmfThEgLfFIpnlYl+CGgJQ+TDejzBIyrOsELaPUIVyMz+gjJ+60v/cgHBwcKdCCSPPshwwZ561TYJFve4wAek6ybav16WwqzBrHA+VQUI1cXs6Fs/xM6vmSzyHGvzg2iTzCHmjCTCARYR2Svc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jn2+hoiP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9B3C433C7;
	Tue, 19 Mar 2024 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710848258;
	bh=rnLSiRh8vWPaiQuJF/eJ9b9imjLOosOSwooUu7yfpt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jn2+hoiPITrazOXc6gjXLlF2/Zou3h/1FK0rx+H0og+s4AHK7oC5kBIoDjM4PbVYv
	 /doY34G90AiMQE+K7FUXoAdblhICKi504AHUHdqG3TCkr1bNNKgVa2dK/Ev00daEVK
	 c2BkEfqDKkDhlO5C9h/2yeznkKphBFsc74r8N1IwdtPkB81ZcXrA0DTkDXO94YOYLy
	 Mrc9c3f7OADD3pBdv0UjUKJ9DW6t3ICNX/v3thUBkxFOOJqTG9rUqvdoqEDH6rMkm1
	 NjJpcruSh74RnA3QzLD376JbC6hxdRmJBor250ex0oWqsBUlTouKASC1ZXlRB2K3mF
	 7r1bPkg1n0/gg==
Date: Tue, 19 Mar 2024 11:37:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Aishwarya TCV <aishwarya.tcv@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld
 pointer
Message-ID: <26b94fe8-8fe9-4eb8-8e3a-61aebe571fba@sirena.org.uk>
References: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
 <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
 <1b67d844-440a-52c3-b9e7-d12c6fe5dad2@linux.intel.com>
 <f0039c32-e670-455c-8d64-d7b706c6ad7a@sirena.org.uk>
 <19ec72e2-8273-43a0-bbeb-706565e926f2@rowland.harvard.edu>
 <1ef6601b-bdb3-41f1-b3ce-07418dd9c031@sirena.org.uk>
 <0f633317-4996-83a7-7b77-cca2868c762d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oeYYWb1XXyqeYuAq"
Content-Disposition: inline
In-Reply-To: <0f633317-4996-83a7-7b77-cca2868c762d@linux.intel.com>
X-Cookie: You were s'posed to laugh!


--oeYYWb1XXyqeYuAq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 19, 2024 at 09:29:22AM +0200, Mathias Nyman wrote:
> On 18.3.2024 17.10, Mark Brown wrote:
> > On Mon, Mar 18, 2024 at 10:55:54AM -0400, Alan Stern wrote:

> > > Greg is away on vacation until this weekend.  If the bug is all that
> > > serious, you could consider sending the fix directly to Linus.

> > I can do that, or Mathias do you want to resend it?  Boot breaks in -rc1
> > tend to be pretty miserable for testing since a lot of people use it as
> > a base for their branches.

> Linus hasn't pulled usb-next yet so it won't apply.
> I'll send it directly to Linus if usb-next is pulled before Greg notices this.

Great, thanks.

--oeYYWb1XXyqeYuAq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX5eP0ACgkQJNaLcl1U
h9BlbAf/Xg6SSOVfBgmms8mLVfIububUT0TT96YoC7+F2t9Ymv4Kdxe6DtGjM6WF
XHviZa6B9Oixu3XtnuA8DC20hyBpCyMO9k8AgOxLuU7QuYbSUFQAt2Az0EYVuwKo
rwO3vdLde8Ele7PGPdrPa2G227MwTKrXqwmKUBPzNEW5lpA7gHeE7dKqYHS6b0Rk
bAyYh1j1q7e5PrHRcg130fEF6a6FrxOT8JL8wjZY7Qp7vrUYOMoCUJXDT3xhuZl+
PSMZ8lkAluyldA5tBllsHr4oL8/9IWCK9YbI6v05THHmJfC6lN+2TrR7L2r/HB85
0SFLHwxQhAlTvrqbfJbsaqy3wGLljQ==
=j/uO
-----END PGP SIGNATURE-----

--oeYYWb1XXyqeYuAq--

