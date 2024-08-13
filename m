Return-Path: <linux-usb+bounces-13354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 212559500FE
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 11:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB45B1F244E9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 09:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F0E17BB34;
	Tue, 13 Aug 2024 09:10:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6452186E5C
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723540256; cv=none; b=IJsWOedjvO8CfKEaUEJ/pRyvcJG5tRfNoaRGc4OOtqC1ODH6IqcT4RRJPxdChSNOqYSPu5QdUuqeVNgZPepcPcSqT1vKHJ0Ze5RBa+E6O0KUn1gL1az49IwielEae+Jou9U82+fARoNkH9VeBzImnsBU6NTfNoAs7Sxj+CwXfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723540256; c=relaxed/simple;
	bh=uq+T3EINNxRTXSs8/aHYthjMxmBKRzZAf7Kll6Pufg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVygTpiuDS0x83S10bWBGDxzNHiHaR12nWOe4mlNskrcXi5oas6L2ZW9IJH5UvdtqRyXnBsyRyU0UAysmOdv9DGa28mcikC33LXm2KhQDFnPW7xoJaA+N+qGhvCh3HXhJPh6/N22Q/T/4iPHchcNuR0lCRnh7fWuLIROecjqGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1sdnYK-0002Q5-1M; Tue, 13 Aug 2024 11:10:52 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1sdnYJ-0005pK-KQ; Tue, 13 Aug 2024 11:10:51 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1sdnYJ-000cGA-1b;
	Tue, 13 Aug 2024 11:10:51 +0200
Date: Tue, 13 Aug 2024 11:10:51 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Avichal Rakesh <arakesh@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/10] usb: gadget: uvc: remove pump worker and
 enqueue all buffers per frame in qbuf
Message-ID: <ZrsjG0b3XFeSRefH@pengutronix.de>
References: <20240403-uvc_request_length_by_interval-v3-0-4da7033dd488@pengutronix.de>
 <20240403-uvc_request_length_by_interval-v3-3-4da7033dd488@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8j8oXWU2QAY203fW"
Content-Disposition: inline
In-Reply-To: <20240403-uvc_request_length_by_interval-v3-3-4da7033dd488@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--8j8oXWU2QAY203fW
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sat, Jul 27, 2024 at 12:02:38AM +0200, Michael Grzeschik wrote:
>Since we now have at least the amount of requests to fill every frame
>into the isoc queue that is requested with the REQBUFS ioctl, we can
>directly encode all incoming frames into the available requests.
>
>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>---
>v1 -> v3: new patch
>---
> drivers/usb/gadget/function/f_uvc.c     |  4 ---
> drivers/usb/gadget/function/uvc.h       |  5 +---
> drivers/usb/gadget/function/uvc_queue.c |  3 +++
> drivers/usb/gadget/function/uvc_v4l2.c  |  3 ---
> drivers/usb/gadget/function/uvc_video.c | 46 +++++-----------------------=
-----
> drivers/usb/gadget/function/uvc_video.h |  1 +
> 6 files changed, 12 insertions(+), 50 deletions(-)
>

This patch is introducing a bug that I have queued in the next series.

I just saw that you picked this series. Could you please drop it and
pick v4 instead? I will just send it out now.

https://lore.kernel.org/r/20240403-uvc_request_length_by_interval-v4-0-ca22=
f334226e@pengutronix.de

Besid the mentioned fix, the series is identical.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--8j8oXWU2QAY203fW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAma7IxgACgkQC+njFXoe
LGTXGg//RXAC8POR52MgotKY/b2f79a4B9XRIJCOFtcK5H+xRJ/ZUEzNyagprS5B
b8GptQ4iu+fXOK3p/V9oJ+ywiOsJK4Qq/3JGtgntEr+WCsK/Yat7/xa1WrB4PstD
gGri0S0DARZgu+J/w4WLR5NO8wcqr/2b8KXe6U+jjJ7NRqeP67mV+RTFbCkKdZ/G
ylnf/sWWJ/ZoKXKsKGb53bKufClgiBU8qxes8mfZueauvmUpsEzTYf2sNXFW1iSO
9kmC5RzI1XrzG5bmw88Btp1U2tyYZqnaKq+X99bs+th7Qa2cy1IvzBQ9SgPrLAbB
mJIPpDHcIJHyDtljmnO7Cl+8PdUmXReV561PtEpcI7v5UlQisP4EAHoXp69pDRQZ
xjznDO7ej0M5NBRIzsZ1d/fNmDj0ODTIUy7Q3o9H97Fw4+1ZtAyENrU3lPL4F5PJ
poAfSodkR0tjq4hjKlPzuJU/m+5MgB27g+UtbOSt0LGxSygLKvCM4Ee2u7re43yZ
C2lwC6SYH5e2BFWFcu38SHZZAqOvks6I5zpep9Z5FXwopzH19oX5iqYryM5bXJue
qrEx6tw5hl5C3C1issTTOLBi0Zgccv8/bxt6k587XXxz00wPpYvkRF5ZRZINI9r5
DmR44iWywWSdeGyFFfaTQpj9XA2et8XAo5YY8qnlIZFLNHa9OT0=
=X5Qu
-----END PGP SIGNATURE-----

--8j8oXWU2QAY203fW--

