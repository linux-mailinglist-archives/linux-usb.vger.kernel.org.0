Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C80E723CC0
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jun 2023 11:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237194AbjFFJOk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jun 2023 05:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237327AbjFFJOU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jun 2023 05:14:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBFE10FB
        for <linux-usb@vger.kernel.org>; Tue,  6 Jun 2023 02:14:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6SlN-0003UL-PN; Tue, 06 Jun 2023 11:14:01 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6SlL-005TNd-An; Tue, 06 Jun 2023 11:13:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q6SlK-00BeyZ-KN; Tue, 06 Jun 2023 11:13:58 +0200
Date:   Tue, 6 Jun 2023 11:13:58 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Raviteja Garimella <raviteja.garimella@broadcom.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/snps_udc_plat: Fix a signedness bug in probe
Message-ID: <20230606091358.arfvedcsyq6ivkxs@pengutronix.de>
References: <ZH7sIkbSZg1rAJpJ@moroto>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ga5t4udi7cbi7tyn"
Content-Disposition: inline
In-Reply-To: <ZH7sIkbSZg1rAJpJ@moroto>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ga5t4udi7cbi7tyn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 11:19:46AM +0300, Dan Carpenter wrote:
> The irq_of_parse_and_map() function returns negative error codes
> but "udc->irq" is an unsigned int so the error handling doesn't work.
>=20
> Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ga5t4udi7cbi7tyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR++NUACgkQj4D7WH0S
/k6Jpgf/WRl7XGTTZ5Z48rb2/48/YRgUSFLfHywG20iSgzpfSPokW0Ipww68QAAC
EYBV8YHqlCdUxfkBhkEO0bzGqsamGTbgVzojaSi3rNSsNpM1jqjp3afumw7fh8j7
n3eCHvlTqloOBTqU42Cf4mchPaP5/s4S2XihE6dFxd5ypTbfPrJPZvbhUa46H3xd
TP3vxRh3r3xIZSkTbkxfpAaZurXbrf+UeaX0NtII3vEFtpEhcHacMgN5rP/ML/AV
koGoI+feL7tH7UmiGA/nOJtz3JskwxZW9Tr9zZdpghaSlACQyCOXzfeoyY3OIK8+
6cSfTWYiMpSHG2JHOtrTBXTKoEug6w==
=/m45
-----END PGP SIGNATURE-----

--ga5t4udi7cbi7tyn--
