Return-Path: <linux-usb+bounces-13090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92A947A01
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 12:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDF3AB212D4
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 10:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586C8154BE2;
	Mon,  5 Aug 2024 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j68zn0ij"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161513AD11;
	Mon,  5 Aug 2024 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854588; cv=none; b=F+A+NjGtmyTABPleNTzDjINwKpL43Pv1wywFWiulNAqNEwh+Io+CQ9e+2dgLft8iYrr0jGlnVNIh7S3NOL68pTzsmS/AuEmWsp/p87K+Fb1mKGZi4F7JGNA4J50/EwmNSSI0TE6GBzP2umOuo19cEqL2vpyjV2wglrAX2D+XNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854588; c=relaxed/simple;
	bh=9BMNAe8AQGch6QfXhgjEJH61vOGani0bKSdAc5nQTtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVQqdMU1xMoP3CAh2hT0veIUdnMypb0dje2pgOezXeTfkzbvITvfsoD1YS6UB5W95VFqZCsSrg6jlwbh42p6GwDraz0ODxKpAkqly1vI4pvFtEhdxToVmQ5hNNDR9L6G69YzozZiA9sHGblSPqg7UC6/RiLWObZBQlM4bl7nZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j68zn0ij; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C512C32782;
	Mon,  5 Aug 2024 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722854588;
	bh=9BMNAe8AQGch6QfXhgjEJH61vOGani0bKSdAc5nQTtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j68zn0ijTzW/PEHDREz6JEnLp1ljRhD1cSR/K+vwZXnTGQ5wsoK29scXrURc60Hxe
	 MGDHqItscaWhN7enOD/mvFxbSSImeeXsHAbnGvYJ5sTOASjMOgFDjEJMtLkGKi1H3Q
	 G+UqsX6tQP7T90DSwHcwIHMFQ52Qq7R5oXaOGEgtBjR5CUtq0umEZsFDgQnFbxPkcu
	 ILDRojuuhZ9mlC78j7bU9AII3N/ZU3X7TiLDRAleKDJ0jIVvovHhIQVYviXG/q1Kn6
	 9Wrv+3eu31FVuxn/oAs/8MlcrVEx03oRjeJQALAnMQAjV3MC9L89ZtzUD0BD+7JokN
	 /rzIu/4/GVF+w==
Date: Mon, 5 Aug 2024 11:43:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
Message-ID: <8a4d449b-0748-45e9-b313-9af0d349a776@sirena.org.uk>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R+fjNSCnhNXUq53X"
Content-Disposition: inline
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Goodbye, cool world.


--R+fjNSCnhNXUq53X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 12:33:38AM +0000, Kuninori Morimoto wrote:

> Many drivers are using below code to know the Sound direction.
>=20
> 	if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
>=20
> This patch-set add snd_pcm_is_playback/capture() macro to handle it.

Acked-by: Mark Brown <broonie@kernel.org>

--R+fjNSCnhNXUq53X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmawrLcACgkQJNaLcl1U
h9AcgQf9Fn7Ei9EEes+luzQ6AqPvwv4Lu+O5M76EWwCcdI5FZWwjJyaPiyC4gK8v
0sWrOVgmAopHSqmjhvznqNdnGXW6imWz/lGjvVwWpl1FBWocTcjoVbUF7H9y2Kx/
Ie7k1gpkvljD777PPDOo1ZXhcOeiFCPSsQh3H5w5U+qS6n6X7xi9KsPjPeV37TDN
TFzr0Jrv+zgPCmJaii0ruRUiCCWuVK35MdNqYHwpMurA9/0Rb55yTVSGQ3G+XDzd
YPxZ4DfvmHWWbHTtoRFjihjki0maZcwEEWAgk5N81pY+d3ZYaULDxeQACzXloZ3k
4Kw9mDfIWMdHNtaez+0RGqsikTuPgw==
=vRs4
-----END PGP SIGNATURE-----

--R+fjNSCnhNXUq53X--

