Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAAC78F549
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 00:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347665AbjHaWM6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 18:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjHaWM5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 18:12:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A1EC0
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 15:12:51 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qbpu7-0006uh-Rl; Fri, 01 Sep 2023 00:12:43 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qbpu7-0001UI-02; Fri, 01 Sep 2023 00:12:43 +0200
Date:   Fri, 1 Sep 2023 00:12:42 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh.Nguyen@synopsys.com
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while multiplier
 set on Superspeed
Message-ID: <20230831221242.GC20651@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thinh!

I just stumbled over a similar issue we already solved for the High
Speed Case when streaming ISOC packages and using a multiplier higher
then one. Last time we saw some bad frame artefacts when using the
higher multiplier value. The Frames were distorted due to truncated
transfers.

Since the last case we have patch

8affe37c525d ("usb: dwc3: gadget: fix high speed multiplier setting")

that fixes the calculation of the mult PCM1 parameter when using high
speed transfers. After that no truncations were reported again.

However I came across a similar issue which is just a little less easy
to trigger and only occurs with Superspeed. Now, while the memory
bandwidth of the machine runs on higher load, the UVC frames are
similarly distorted when we use a multiplier higher then one.

I looked over the implications the multiplier has on the Superspeed case
in the dwc3 gadget driver, but could only find some TXFIFO adjustments
and no other extra bits e.g. in the transfer descriptors. Do you have
some pointers how the multiplier parameter of the endpoint is used in
hardware?

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmTxEFgACgkQC+njFXoe
LGQbDg//RhtrJo3262cD3aFxCq5EOmUF2tGAmS5a3+WxbEHwGcIjkxMxppQzxXEe
qCCjqsO3lZBcfpW8VKBFa5KkamYvNgPL8Oue3h02jtv97om2QpmE0NTWBzS7odyw
dprD0vilgA6w4252bhkdbN+ddaehe5kHmaHAwjxuOKA8SKwxUlObqAeDn11RV7vP
dkq9YXeJfRgoEw3zFR6gxR+saGfS6PsgxnTHE6asHfJhj6SIrMvSzhMivn1e86Jj
QRXUu6sF8G4tvt5eMlzk6wiaOC/kqS6i98TUf0TbrTvs4zXRYAV3kl32gCwN19/g
USqG5H24j77C/01DOmFjjmthoZ9ED4GrK9P+2Vo09DqdrE1gdA2NnsPRyGRHQUwc
N7yLZyCRrTw20mzXi8lpRN2RCn/gnbr3S6sDAFGJP3Zqe7yuhPGJGIaT/k0SLhQ7
sX60CHerlBEZovslfvrXkKbYqT4+tUOPdniv8r7/Rv0pcgDGPS+Oei9m1/jsbHFU
WyC7NEsr/aX30UmQsAeT+238pgTWxGiYUugj50Ug01OwD+MQjVvx/vLRz4jxxqEa
G9ZkvHjsN6JpW3lqY1oMrBuzSMg3bZMj8OPOZULdjNQLZcN7Os9RLoAFNXFM3394
Z7yBHRl6Nw3VVguCE/hGmlJop8l2vURbbt/BRyl4pFIGOyzQlUw=
=8Vbp
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
