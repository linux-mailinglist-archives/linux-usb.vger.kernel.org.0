Return-Path: <linux-usb+bounces-7683-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA1875499
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 17:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BAC91C232C4
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 16:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB8D12F5B0;
	Thu,  7 Mar 2024 16:52:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94BC12DDBE
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 16:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709830325; cv=none; b=JEQQ3GgYKurTldSWoJkJEQ8ITkqks/QVARCtaNVAFcOpB5T8BvUdp23rlGE3ngFa3y0tguDseEEwTfBj47MZm9CvWSHOXiaixMgWg2p9b2OUdJjvWz+Ze7Zco27Bpvf0InTOND8cUHv2w+BMEaCAQt/OWEaA9kJoEIcCwEWpPBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709830325; c=relaxed/simple;
	bh=i9CCT9j7BCqV2bE+0gCx3jMpwRqeW581xksody4aj88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BcCOZancUywRkpygTUaojrxWLD2WNkul7HaE849gHrBNOBb2WhpwZIZVNOaLWVqlqBIaefCnFMBw4hXPxskfi6YadXI+/WFLkxgV3Ol+QS+0r6hEkHovfjBoeAAR1DNxf+e8K4b/6Z9m0bTzDmLgsR3/cukt+n8lltZuqk/F39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1riGyO-00019r-AR; Thu, 07 Mar 2024 17:52:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1riGyN-004yht-Qw; Thu, 07 Mar 2024 17:51:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1riGyN-001PCL-2O;
	Thu, 07 Mar 2024 17:51:59 +0100
Date: Thu, 7 Mar 2024 17:51:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] usb: gadget: net2272: remove redundant variable
 irqflags
Message-ID: <mywsgq453muhggv5y7pfrsg7zrodtuebcpo5rbc4kus5h2ameo@fhnpemjuntaz>
References: <20240307105135.1981060-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gewgcxuilb6kaoqd"
Content-Disposition: inline
In-Reply-To: <20240307105135.1981060-1-colin.i.king@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--gewgcxuilb6kaoqd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 10:51:35AM +0000, Colin Ian King wrote:
> The variable irqflags is being initialized and being bit-or'd with
> values but it is never read afterwards. The variable is redundant
> and can be removed.
>=20
> Cleans up clang scan build warning:
> drivers/usb/gadget/udc/net2272.c:2610:15: warning: variable 'irqflags'
> set but not used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

this "problem" exists since the driver was introduced in commit
ceb80363b2ec ("USB: net2272: driver for PLX NET2272 USB device
controller"). Might be worth a Fixes: line.

I wonder if the better fix would be:

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2=
272.c
index 12e76bb62c20..19bbc38f3d35 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -2650,7 +2650,7 @@ net2272_plat_probe(struct platform_device *pdev)
 		goto err_req;
 	}
=20
-	ret =3D net2272_probe_fin(dev, IRQF_TRIGGER_LOW);
+	ret =3D net2272_probe_fin(dev, irqflags);
 	if (ret)
 		goto err_io;
=20

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gewgcxuilb6kaoqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXp8K4ACgkQj4D7WH0S
/k726wgApuSl5j8yqZxfz0r/ljO+iYK/Mkfds9vddxUBRxPq16H/WB7iqdlAAj6L
Z3+ZTxiXgsExqYh+ZEeU4lKwHa8DYotgoQZOxkANsqjJBIK+JQoDj73w+UvraCEv
sGi0Uv606kD8zV1Nb8pYq5O9n8G24XWwH9f1y96zKlt+IAnwLnDrq0D8d6SfIfd4
VJFvrVTl2oNsWky9RS74vRfGEkc2H9R3UrwRRyD1Sv2PpZOpyKJKru621qHw1kv/
+aPOIxHEty7nTu87lQJZ1RwRX7rmwYwqlPChOoL6hLD4KM1fkcsihbGqSr/3pMqz
EKbgDXH/dFyvvnrWghAoTkEkjujmmQ==
=8zp0
-----END PGP SIGNATURE-----

--gewgcxuilb6kaoqd--

