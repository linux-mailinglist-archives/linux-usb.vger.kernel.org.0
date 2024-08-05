Return-Path: <linux-usb+bounces-13112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774F948260
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 21:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A77EEB22112
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 19:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3B916B3B6;
	Mon,  5 Aug 2024 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQUiHNBL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FCB2AD13;
	Mon,  5 Aug 2024 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722886665; cv=none; b=JF5igNqoPg+7NONz726TLZNcZo8a/IYLgq0/MECp45y+Qt7NN46p2FfvlyHUextWRqzj+B8F/7VAM9LpZLDwYC6gG4qYQV6DT0Xq9esu5Rl9dvcIYxUjt7oRjnJmLe4wJGSx3StGgwZ+NMcOe6H2ZvGNEfgyK6Dj4JM4AtOkJpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722886665; c=relaxed/simple;
	bh=lgchXb1bYk3WqJn/hE8TGf4cBjrsub46cUbjwhHDqF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1mXZbg8F1nG+fmhD4MBzIIRyexc97jdSX5q0ya0/OBBInLda561N5Z7b6gSftzf3DNhvNN4DQ9g8U7h1N7ELyF/B0WJqwsFQhbkxxW/oRa49PhtUzXS7BJSXlN5SXU5FN9Fh/uMvJDpluczKwZiMrR3Bs2BDMSTzzJoCvcBzzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQUiHNBL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCD3C32782;
	Mon,  5 Aug 2024 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722886664;
	bh=lgchXb1bYk3WqJn/hE8TGf4cBjrsub46cUbjwhHDqF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQUiHNBLxlcj9+R+gylDfzBrxlaSiK3D86x/c3B/28wl6fTNNsV3jQUB7SKrCj3ap
	 +Mlx5J4ee3h5+DwaADPy3eAWp3Sjalo8yI7FC3nH3niYXr/RMjJyfxdgGCQLhWW8H3
	 pIJFBvK2EFJoBo/qAChdP7OP0QMtTlhGmLNjTxmHK4W66yut/Vv6ruNkRfhmgkpNOO
	 xlfJxlzg5f4oENlghLDWAz40c2u7v+g2G1TAPxzSSNjK0JKnvluQGKkIiz2JiPE82r
	 mKrF4D3zPnWc2+8sMwRv1K3xejPvXtub+7M9iXf2no4Ck8J9sGmTbhbroHod9hCeow
	 qiPVffrCVmdkg==
Date: Mon, 5 Aug 2024 20:37:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
Message-ID: <46b37ef3-047c-4b1b-a79b-37187a46754a@sirena.org.uk>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
 <d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZsODt8GP60oMXE9i"
Content-Disposition: inline
In-Reply-To: <d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
X-Cookie: Goodbye, cool world.


--ZsODt8GP60oMXE9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 04:04:39PM +0200, Jaroslav Kysela wrote:
> On 05. 08. 24 2:33, Kuninori Morimoto wrote:

> > Many drivers are using below code to know the Sound direction.

> > 	if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK)

> > This patch-set add snd_pcm_is_playback/capture() macro to handle it.

> NAK from my side (overdesign, no improved readability). The defines
> (SNDRV_PCM_STREAM_*) are enough to check the stream type value correctly.

I have to say I do remember this being a little bit of a confusing idiom
when I first stated looking at ALSA stuff, especially for capture only
cases. =20

--ZsODt8GP60oMXE9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaxKgMACgkQJNaLcl1U
h9CziQf/YCOXh24b4OyjkhMmIzzP6QsbfEeLXSz4lHbdfho7lUcp/8ZcPcWTccjA
8ME1VD4m03IG2W/Mo0zY056z4EMAeFRqgoUD+eHnueqxOIyHSkE/oDwmrA95LjJ7
N7vfqUv1CwQql5bCO+4AvIRtL9w8QJM2PAfHlNc9lm0VG5/GgTbGaGDGEsYt9YFy
PNBqA4bgGcynIHDIM4AB91uHUF2g6qPeHJO3QuuKflLmQDjrG96y2ni0Lz2wvuJP
GwRcz2V90XQ9a9cTGG4pOAHE/0NR+fsM286wdszwfUCz++HA1viMBLJQs2wNDlSr
gO8cdIikCG2sjXIqnS+ib0EteNuVfg==
=Jlkt
-----END PGP SIGNATURE-----

--ZsODt8GP60oMXE9i--

