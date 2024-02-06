Return-Path: <linux-usb+bounces-5975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A36A584BF38
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 22:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E9E2B2619F
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 21:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9BD1B978;
	Tue,  6 Feb 2024 21:30:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2580D1B946
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 21:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707255026; cv=none; b=UVxt+bBXMobbQl63axH1IAlkuB3h8A+twvp/xcZnqg6bGnYq9C0SBUpoqv2ibLJigxCRbfLxhhTFcQBnXTHGwn02BSSSOY5CKin5U+8fnWx6dwc12GSaSkr98vXoy6xS8+eeLS/kXxOyg4q+8TUBtbG+PKoypUohbopNY+W4snU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707255026; c=relaxed/simple;
	bh=Qa7jhZJJ6qa4mQ7ze76AeuzBQ/7QDoZ/wMhuH/ohcy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4aZWwWFirwnmXV8U2yoKNw3lzWJe27BEzrucFERQLZfGOVm0sWzc9rijme2g9skvkWG2UApQT6oIn2Z/z609CdF1VIjxF4MthTBKsEOXT/yQDCp8i0oHqHg186OGbsAy39zJAhc6SQ3yHTUkRft46EQxgCQ+jaU0PyGmG2Hq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1rXT1G-0001hH-Ie; Tue, 06 Feb 2024 22:30:18 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1rXT1F-004tny-I7; Tue, 06 Feb 2024 22:30:17 +0100
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1rXT1F-00EJpQ-1V;
	Tue, 06 Feb 2024 22:30:17 +0100
Date: Tue, 6 Feb 2024 22:30:17 +0100
From: Michael Grzeschik <mgr@pengutronix.de>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: duplicate requests on host side while streaming via uvcvideo
 gadget
Message-ID: <ZcKk6QJXfGGo2DH9@pengutronix.de>
References: <ZcFx7P30Su_Mx4AV@pengutronix.de>
 <20240206032301.6e4tmbvmk7vs72gg@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lZ2nk/6fFAtZkSwG"
Content-Disposition: inline
In-Reply-To: <20240206032301.6e4tmbvmk7vs72gg@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--lZ2nk/6fFAtZkSwG
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 06, 2024 at 03:23:17AM +0000, Thinh Nguyen wrote:
>On Tue, Feb 06, 2024, Michael Grzeschik wrote:
>> Hi Thinh
>>
>> I found some strange situation while streaming via uvc-gadget to some
>> usb host. It happens when some requests are missed due to higher load on
>> the gadget machine. In some cases some requests will reach the host
>> twice. In my special case, I added the following changes [1] for the
>> host and gadget side.
>
>Does this only happen to some specific hosts?

>Are all the data of the duplicate requests matching or just some bits of
>the transfer? Were you able to confirm from some usb analyzer/sniffer
>that the data out the wire is actually duplicate?

Turns out, this duplicates are just misinterpretations.

The linux uvcvideo driver will parse the uvc header payload twice. (If
the FID was incremented inbetween). This led to those double misleading
outputs. Although this means that there is a bug in
uvc_video_stats_decode for incrementing the error count.

Anyway, so just ignore this whole thread and be thanked for even having any
thoghts on this.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--lZ2nk/6fFAtZkSwG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmXCpOYACgkQC+njFXoe
LGRyhA/+PWoSLMRAgimPA9pVguJJcQucVmDEsL42OinP52U74EYK/lVnfDL1xhnT
8XmPh9yUnnvtDlZKUmTMzeqkU27IzwtFGbZYr/5M7vxgmpdvZ3B+h0cy9/g41Bht
fjV1DI5cJs49IvcW52tLaQJIJj34mSG3i9XeG7lM4m6SACnNGp+APegHBFrmSpv3
EusP4NcM0PWpQbhTXn/iYnPFEXZUQOgdEdiN4voYbhHiZ1qLeg38v5kDOk35wwKJ
Y7Ru5P1Zq7xRSkmBFG6fVLnqHunUEcyJnn3pURmRTXYKt0xBjpZN5sOEM7jC85Mq
VidIFRGJdBPK66Lda00bLuF2UTWYuK505/glmzsow4o3JnZTt+6GQhwFtiMelSjA
t4xC2lRmbhiiCVHMWZurR1zhvYcUD8KqpB918RAhqAR59jnlOQYAn3GTXYN8/WZT
qgpqVL0Rus+M4If4Sy8MZLDo1itAm+yX/5qKO9n2gTyamlKY8pGLbhpL8lVQUEEh
/FqX0+MD+iU0ULT3An8RO7IPiZKZGh7sd8V2xzLknw5KBT+oWaztJQuSEJVaElyU
Y1AA5Kkrpb7dqI0jSx+hfuWowi2Wc8chjQ8jrcqsChvMPItOQjYc+M0MS3o3mXji
I+iectvgFaMvJj8+gmjaqpmGN2kVufbnbIu8MJvfFDiH2do5l+8=
=MSIJ
-----END PGP SIGNATURE-----

--lZ2nk/6fFAtZkSwG--

