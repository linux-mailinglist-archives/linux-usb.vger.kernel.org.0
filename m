Return-Path: <linux-usb+bounces-1026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5637B673E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 13:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 8AE3D2817AE
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88E42110F;
	Tue,  3 Oct 2023 11:09:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C9A1548D
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 11:09:13 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF77A1
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 04:09:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1qndH1-0007AZ-J3; Tue, 03 Oct 2023 13:09:07 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qndH0-00AkW9-Ql; Tue, 03 Oct 2023 13:09:06 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1qndH0-00CEck-HF; Tue, 03 Oct 2023 13:09:06 +0200
Date: Tue, 3 Oct 2023 13:09:06 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Avichal Rakesh <arakesh@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	jchowdhary@google.com, etalvala@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] usb: gadget: uvc: stability fixes on STREAMOFF.
Message-ID: <ZRv2UnKztgyqk2pt@pengutronix.de>
References: <20230930184821.310143-1-arakesh@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3n3R417MIroSViGx"
Content-Disposition: inline
In-Reply-To: <20230930184821.310143-1-arakesh@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net


--3n3R417MIroSViGx
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Sep 30, 2023 at 11:48:18AM -0700, Avichal Rakesh wrote:
>We have been seeing two main stability issues that uvc gadget driver
>runs into when stopping streams:
> 1. Attempting to queue usb_requests to a disabled usb_ep
> 2. use-after-free issue for inflight usb_requests
>
>The three patches below fix the two issues above. Patch 1/3 fixes the
>first issue, and Patch 2/3 and 3/3 fix the second issue.
>
>Avichal Rakesh (3):
>  usb: gadget: uvc: prevent use of disabled endpoint
>  usb: gadget: uvc: Allocate uvc_requests one at a time
>  usb: gadget: uvc: Fix use-after-free for inflight usb_requests
>
> drivers/usb/gadget/function/f_uvc.c     |  11 +-
> drivers/usb/gadget/function/f_uvc.h     |   2 +-
> drivers/usb/gadget/function/uvc.h       |   6 +-
> drivers/usb/gadget/function/uvc_v4l2.c  |  21 ++-
> drivers/usb/gadget/function/uvc_video.c | 189 +++++++++++++++++-------
> 5 files changed, 164 insertions(+), 65 deletions(-)

These patches are not applying on gregkh/usb-testing since
Greg did take my patches first. I have already rebased them.

In the updated version I the stack runs into the
following error, when enabling lockdep. Could you
try your version with lockdep enabled?

[   41.278520] configfs-gadget.vz gadget.0: uvc: reset UVC
[   47.156261] configfs-gadget.vz gadget.0: uvc: uvc_function_set_alt(2, 0)
[   47.169177]
[   47.170903] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   47.176857] WARNING: possible recursive locking detected
[   47.182798] 6.5.0-20230919-1+ #19 Tainted: G         C
[   47.189323] --------------------------------------------
[   47.195256] vzuvcd/412 is trying to acquire lock:
[   47.200511] ffffff8009560928 (&video->req_lock){....}-{3:3}, at: uvc_vid=
eo_complete+0x44/0x2e0
[   47.210172]
[   47.210172] but task is already holding lock:
[   47.216687] ffffff8009560928 (&video->req_lock){....}-{3:3}, at: uvcg_vi=
deo_enable+0x2d0/0x5c0
[   47.226333]
[   47.226333] other info that might help us debug this:
[   47.233625]  Possible unsafe locking scenario:
[   47.233625]
[   47.240242]        CPU0
[   47.242974]        ----
[   47.245709]   lock(&video->req_lock);
[   47.249802]   lock(&video->req_lock);
[   47.253897]
[   47.253897]  *** DEADLOCK ***
[   47.253897]
[   47.260511]  May be due to missing lock nesting notation
[   47.260511]


Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--3n3R417MIroSViGx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUb9k8ACgkQC+njFXoe
LGS0IhAA0EfBq14KaSppb+uv/B+a8J749PHsk/54+/+5gLWaigYkUAYu10sVMk7R
kn2KidBdSA757yaWm/ST6Vpap6MZJTV83c6YvqCZUE1GQxjreiU7YufHdfeRsKQh
pw/c/2XreyruLGso/KYbOU916LNBeBfLVzobfBw9paxECke5Oy0eVi1yz85WHoHH
9vmHFLrfH/ofdYLYbedOvqRqlabCq5FFH6KsOLQLq0KCKqFZXOYwd4Vz3lDDjzC0
wuME9Y6SUVMkZNjMTXqp5sig9VLEtFhBMer9NQJeTo9P5BWpUA4N0WwQnUCUAOEf
hinJSeEAhlPQhaC8GbDTDsapfw3iad/pKVuRxZ+ssnju5i63/A0dFNmWu5Hujh0I
yfe7GtFxyhywPAscKyjEURbmsS0tDmgPsqp1Gnbf4fgo8gvLGW6vWldWjthrK9UG
61iWmJ6+3cAioI0ItN7wJuHaTdwCU3T2C/nKI37pyQw1KZrzLPZipByJ3KwE2tdw
z8wYNuqltsPMwqHohdxNe2KeatmYySwSEUFyQKlQG5GWC6D5rR888Bkz5ywotdo3
pCvyJ5QgXkE5WFA2jn5YsujmFLnVkG5nYEuq9YEnOC82wbENq6CmmB3X+xMUKk+M
IJ7KkuefSOv0F1UT5dI7XPdL6wl555Fxx9LGoKo/5Si1XV0sNxM=
=JYIa
-----END PGP SIGNATURE-----

--3n3R417MIroSViGx--

