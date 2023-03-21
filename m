Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBBB6C352B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 16:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjCUPKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 11:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjCUPKG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 11:10:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BE81C32D
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 08:09:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pedcW-0006QR-9R; Tue, 21 Mar 2023 16:09:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pedcV-005iSZ-Kg; Tue, 21 Mar 2023 16:09:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pedcU-006n4f-TY; Tue, 21 Mar 2023 16:09:50 +0100
Date:   Tue, 21 Mar 2023 16:09:50 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: ftdi-elan: Delete driver
Message-ID: <20230321150950.u3uc2xe5pvofxogy@pengutronix.de>
References: <20230321114508.345825-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bfre3daeecmj3fux"
Content-Disposition: inline
In-Reply-To: <20230321114508.345825-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--bfre3daeecmj3fux
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Mar 21, 2023 at 12:45:08PM +0100, Uwe Kleine-K=F6nig wrote:
> This driver didn't see real maintainance since several years. It has
> several trivial issues (check $(scripts/checkpatch.pl -f
> drivers/usb/misc/ftdi-elan.c)) and some harder ones (difficult locking,
> explict kref handling, ...). Also today it's hard to find hardware to
> make actually use of such a card and I suspect the driver is completely
> unused.
>=20
> So remove it.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/misc/ftdi-elan.c | 2780 ----------------------------------

This patch is incomplete, just sent a v2.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bfre3daeecmj3fux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQZyL0ACgkQj4D7WH0S
/k6Uggf/XFv4CMqbLSULM89hHPF+SV+WG5U3cy9mINoxdupq+jl5iHMgIUGhe3eq
jTRpYBUG585nRFsajZgMKbnvm5jmsyjj34IUYe1wLFKVielFkX61bzbz64z0+AfK
/brpCT9+BMLw2z5qA7u+2RU+Kmqks1PAvOyhfbMPXkvqjiJvcWBs3uPcChoJ1Cbh
ciGFF2T4WxoRcTL3v8PX193ZrrHRwrr165DXkAum9uxbU9E6V7uajQema5jc6oLX
WsRCSqSKxvOxxMYHq5bjddOptfuTNykeMBYNMbESSqMhZKI5RqEhrYpKg9+aK8oY
oRLoc1zY1MdvwHvnOGT91taWAH7NBg==
=iE5E
-----END PGP SIGNATURE-----

--bfre3daeecmj3fux--
