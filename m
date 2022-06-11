Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C959B547621
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jun 2022 17:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbiFKPbR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jun 2022 11:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbiFKPbQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jun 2022 11:31:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD52E2708
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 08:31:15 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1o034w-0000wg-48; Sat, 11 Jun 2022 17:31:10 +0200
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 8CE0492ED2;
        Sat, 11 Jun 2022 15:31:05 +0000 (UTC)
Date:   Sat, 11 Jun 2022 17:31:04 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Rhett Aultman <rhett.aultman@samsara.com>
Cc:     linux-usb@vger.kernel.org, linux-can <linux-can@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: Re: [PATCH v3 1/2] drivers: usb/core/urb: Add URB_FREE_COHERENT
Message-ID: <20220611153104.sksoxn4dmo5rgnk3@pengutronix.de>
References: <20220610213335.3077375-1-rhett.aultman@samsara.com>
 <20220610213335.3077375-2-rhett.aultman@samsara.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="47q7ykpf7lf2owpj"
Content-Disposition: inline
In-Reply-To: <20220610213335.3077375-2-rhett.aultman@samsara.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--47q7ykpf7lf2owpj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 10.06.2022 17:33:35, Rhett Aultman wrote:
> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>=20
> When allocating URB memory with kmalloc(), drivers can simply set the
> URB_FREE_BUFFER flag in urb::transfer_flags and that way, the memory
> will be freed in the background when killing the URB (for example with
> usb_kill_anchored_urbs()).
>=20
> However, there are no equivalent mechanism when allocating DMA memory
> (with usb_alloc_coherent()).
>=20
> This patch adds a new flag: URB_FREE_COHERENT. Setting this flag will
> cause the kernel to automatically call usb_free_coherent() on the
> transfer buffer when the URB is killed, similarly to how
> URB_FREE_BUFFER triggers a call to kfree().
>=20
> In order to have all the flags in numerical order, URB_DIR_IN is
> renumbered from 0x0200 to 0x0400 so that URB_FREE_COHERENT can reuse
> value 0x0200.
>=20
> Co-developed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> Co-developed-by: Rhett Aultman <rhett.aultman@samsara.com>
> Signed-off-by: Rhett Aultman <rhett.aultman@samsara.com>
> Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

FWIW:
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

This patch probably goes upstream via USB. Once this is in net I'll take
the 2nd patch.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--47q7ykpf7lf2owpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmKktTYACgkQrX5LkNig
012xWggAud/IQrjk7m3IIff9REYjAT1DfUkcRSdhO3kR5Ug78OFzcpstO2hNv2xe
lDCIrHfggYTo2rJW2AvU2ZuY7r5AnDUwChDhlOuzvGmbS5ETWN9jilzORzmxN5FY
xLY4arAionrxDzUEZ1aCRIBBkVbMLPuSSbKbGn6w8tjb1bYMNRbMyQXN0d0JQk6p
9n53nH1j5PxmtkqotYtCyKF9H+Lsm6wbVp1r3ae+RWQrpSVRAJcZwLXaLpyAwRpf
QwaccDMPhhcukFvSWm/Kyvrqlu+dRiAHKJ36dK4pGhMzcx2jIkzGGYg6+Tdxaalf
Krm1wF9sJhvQtqoYQ1TYrO86vU/ohw==
=ZrrQ
-----END PGP SIGNATURE-----

--47q7ykpf7lf2owpj--
