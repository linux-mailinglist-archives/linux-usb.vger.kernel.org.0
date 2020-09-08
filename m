Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E168260C54
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 09:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbgIHHqT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 03:46:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:56462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729284AbgIHHqL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 03:46:11 -0400
Received: from saruman (91-155-214-58.elisa-laajakaista.fi [91.155.214.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE79621D43;
        Tue,  8 Sep 2020 07:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599551170;
        bh=QtVugYPPEPfDRNfErwiFNDIll+ip47wd3BUfYul+k+E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=PTAUMkARDSBgNxtEF/tN2Vb77wSDdPu1e0ZY6s5CIaHXddW+tCf45iWjSPxkCfY7N
         EyEmeTAyg3N6AKCU5fPyXbmILkiGIPzDh+32554yRkGIZvHrYmyBEnqbTn04ze2Ve5
         KGJqhuU+AjP2+rqHurmTxuyOYO8b6QJgTVeIbPRE=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL] USB: fixes for v5.9-rc4
In-Reply-To: <87y2lklnou.fsf@kernel.org>
References: <87y2lklnou.fsf@kernel.org>
Date:   Tue, 08 Sep 2020 10:46:04 +0300
Message-ID: <87pn6wlnib.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Felipe Balbi <balbi@kernel.org> writes:
> Here's my second pull request for the current -rc cycle. Not much going
> on, I wonder where are all the bugs :-p
>
> Nothing major here, simple fixes that have been around for some
> time. Let me know if you want me to change anything here.

Don't apply this yet, I'll send a V2. Mauro Chehab found a problem with
this commit.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9XNrwRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZdHQ/+IbkaIg9nf25Au36GBzNYrwJkDl4iSrqy
SwKU0GkoKvF4wjC7tzMeC/hYq3UL6n8ASbVHnzC+3U4VJygCFWTL8yxL3C46Y6Kz
JywyHK2Tl+LPErucYxUsvfXY6bQQ3Ro0nvzTQEPtGykh63Z8GcUKfV7NkQdJrZr5
CdAydHHVjiAyRoCcw/q0FZbUOdFttYS5vAN65i/GVlzQrgXIVNP/faDReVoLhAsm
v0UkdOZ8AP09Em9ubA1/LJwFdtfIDxIRbmTk/CoWRQDMFLBVHeSTfKJJCBEDekHT
GmxkqcluhfCOjhQLakbJZtEGq7S+xwPTeOitl4QUtdTW38vkoTQQuQ56YkPvF831
lYav9j1IeW4nc5yV1wtWDwHVjpwuTGUeA+ytSbtkd+Z2CuaUD/1iPCKukLTbq90A
uXIEv1XhWn+ToSvVsKTzNTEkxTvg+y1XIpQNYuu8n4wUmIN8zRwgoxPu4z26vNLd
yVrUSlULV3ufQVtycOg+W+SyhPLEIHLSRhqB1Czj9jKqXOxRSfV7xSiAiwRe+8bO
8hhRTBJn/lXC9+0ta2RYOC+LKm6Q7p5dr4Df2QR9DX6wuRse9wdkFmW9PRglczw+
ojvaXI9OajuweSeeSA1dIYAN4h0rJ22WRI/XW6y2EvIVlqciPOdU2+Ez2dIN3bws
cVWfLjKaAQk=
=P3F8
-----END PGP SIGNATURE-----
--=-=-=--
