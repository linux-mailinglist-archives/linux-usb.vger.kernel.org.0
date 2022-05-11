Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99992522E4C
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 10:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243631AbiEKI0V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 04:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243697AbiEKI0K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 04:26:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B07D344C6
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 01:26:05 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nohfX-0003Yh-VX; Wed, 11 May 2022 10:26:03 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nohfX-0005cK-Kp; Wed, 11 May 2022 10:26:03 +0200
Date:   Wed, 11 May 2022 10:26:03 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: hub: port: add sysfs entry to switch port power
Message-ID: <20220511082603.GD27481@pengutronix.de>
References: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
 <YntM+r+rE4AC6SXt@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline
In-Reply-To: <YntM+r+rE4AC6SXt@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:25:21 up 41 days, 20:55, 74 users,  load average: 0.16, 0.13,
 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
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


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2022 at 07:43:22AM +0200, Greg KH wrote:
>On Wed, May 11, 2022 at 01:13:17AM +0200, Michael Grzeschik wrote:
>> This patch adds an sysfs switch to enable/disable a port on an power
>> switchable hub. It also ensures that the associated device gets
>> disconnected from the logical usb tree.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/core/port.c | 47 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>
>No Documentation/ABI/ update as well?  That means I can't take this
>change or even properly review it :(

I knew that I missed something. Will add it in v2.

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJ7cxsACgkQC+njFXoe
LGRrKhAAiZK+EsQmHFyLkS1jyPyyUgWIHAxpiYyTxoE6uGMq8iKF528pJSzqhnJa
v6O3pRo+BZCjAOpHQGRoxzoubCAzKHAq+mzy+O1M9rlviZ6ITb0zJZsLjJ6mr8B/
PPYaR6degWp1e0u6K3Vbf9s93yBjapy0CmiOZZ0SoPdz8Fl7YLkhWtN0kl5I2bCz
sD6XkwFFe2/FuaQnOv/kyLOeAxsvprpA1+RcOzRKh6SBexGYvEdQd/r/AYd4JII0
d22TYK5QiGV70JkfFqxbmP0jZzVJGQpQKjG/3cAKd15n3eWgzLiclQbBdQq1L4nK
AKocuAFUpgIvN6gSvcGk/7SSyeV6Md5dyHZ/2qFa/SPHpQus5TWVNaGpWZSD/3J2
cHfP9I4t7SZxB3Zd9GVvbIVpKohlNidiI4Zo1B99X71pyJrRXx3noWYtviGJQyEa
Qjhta3nhK2T8X3WQ2v3yLMkrJl625ub+v0UxUQegAgt9jsRe2utu0+VC4z0Hrntu
avOcf8x5n/lifeqGWlpt1kcKzFMyktfjIFSXX8LPwx5JI5JA36IUr3LO79lmewLa
MINT9V8aP++CZZLvxOQB18Qe5b8lWdrwFkCqE9y+zS5S03BB+/2Q4OCcDPiNoyxz
mJsGqySKPgF4IiaF+6zp+sjvyIicASQ4n7p5b2izAsL7VMMinls=
=RGZy
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
