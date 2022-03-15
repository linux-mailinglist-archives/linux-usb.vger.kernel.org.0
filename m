Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4321F4D9DC2
	for <lists+linux-usb@lfdr.de>; Tue, 15 Mar 2022 15:36:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238658AbiCOOhV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Mar 2022 10:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbiCOOhU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 10:37:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CBD5548A
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 07:36:08 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nU8HP-0005ne-Ad; Tue, 15 Mar 2022 15:36:07 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nU8HP-0000Cv-1O; Tue, 15 Mar 2022 15:36:07 +0100
Date:   Tue, 15 Mar 2022 15:36:07 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v6 1/7] media: v4l: move helper functions for fractions
 from uvc to v4l2-common
Message-ID: <20220315143606.GE11246@pengutronix.de>
References: <20220105115527.3592860-1-m.grzeschik@pengutronix.de>
 <20220105115527.3592860-2-m.grzeschik@pengutronix.de>
 <YjCh3Eu821f4FKhO@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VdOwlNaOFKGAtAAV"
Content-Disposition: inline
In-Reply-To: <YjCh3Eu821f4FKhO@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:28:19 up 94 days, 23:13, 94 users,  load average: 0.01, 0.04,
 0.08
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--VdOwlNaOFKGAtAAV
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2022 at 03:25:32PM +0100, Greg KH wrote:
>On Wed, Jan 05, 2022 at 12:55:21PM +0100, Michael Grzeschik wrote:
>> The functions uvc_simplify_fraction and uvc_fraction_to_interval are
>> generic helpers which are also useful for other v4l2 drivers. This patch
>> moves them to v4l2-common.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2: -
>> v2 -> v3: -
>> v3 -> v4: -
>> v4 -> v5: -
>> v5 -> v6: -
>
>What ever happened to this series?  Should it be rebased and
>resubmitted?

Yes, v7 was just send.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--VdOwlNaOFKGAtAAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIwpFQACgkQC+njFXoe
LGRlMRAAhN67SKLo8/+Fla0wsarI4tcLvqz6N8YCe/eUy1L0tnY+Ewb6P7+qBcsZ
cdR/S+xuxRUWUXd7i8BrOFL5wxVmY7oab4K1BH/rWfux5VBt9+8jt/0J47S5b+ko
VgYLaDlD5Ae3heWuWyefu5uBrjcEgVzyhXLerHl9CmZVST0RXWENgmKUEAbrWxuH
AjrFcEhhOhEx0HKyyz3FuUJ/38DDGWxQRZxumnkIeKyCTtfh1IpFAT2dDtPAxMYg
1Azdg4+kfOtcUiHQR+oXte6QgNKZjbTp9wHnOsDiyIgsTMlfETuTa3d1c45I421X
GAc4iNN6uvnbYzGFnee9tniaJh2qD7dMahe1Ix03I2O22uffd0rqaFJZ6HpwsAh3
3SAT97q6aZAl6WO4s14Yb4dilPsdqLBUiznPb/Gah/910Qaf7wzvB4IBB9bnIIqR
Pz1sk9rWWKOFl4RUWhF5mNFuQG2mofHB8l9GRXBpw8jcC5CcKR9uFBT5+/uWkcTg
BaGomspwU8oKJIJgMX/zGiOVn+TBtQyPci/W3mUspOpFDoHuSGFc3QruX/Ifn9wA
AL57vzLu69PvQUWiFXEcVjkaVNBkIyUVVm7HQpGspDKNB/tL0XbpUYDzAwc82b8w
VvyjDOHJ8pUgO2ix87v+topHgWSV5QdxylyUmjEBhQAunwKwdog=
=2AQr
-----END PGP SIGNATURE-----

--VdOwlNaOFKGAtAAV--
