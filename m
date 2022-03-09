Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030054D3DA7
	for <lists+linux-usb@lfdr.de>; Thu, 10 Mar 2022 00:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbiCIXlr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Mar 2022 18:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiCIXlp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Mar 2022 18:41:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9C6A2504
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 15:40:45 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nS5v8-00064Q-RA; Thu, 10 Mar 2022 00:40:42 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nS5v5-0000c3-13; Thu, 10 Mar 2022 00:40:39 +0100
Date:   Thu, 10 Mar 2022 00:40:38 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Give some time to schedule isoc
Message-ID: <20220309234038.GA28594@pengutronix.de>
References: <deb8146b8e1f7f8495ef2d5647017270934cb2d8.1646708142.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <deb8146b8e1f7f8495ef2d5647017270934cb2d8.1646708142.git.Thinh.Nguyen@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 00:38:45 up 89 days,  8:24, 76 users,  load average: 0.08, 0.08,
 0.06
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


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 06:59:56PM -0800, Thinh Nguyen wrote:
>Currently the driver will schedule isoc transfers immediately on the
>next interval, which is quite aggressive when the interval is 125us.
>There's report that some platforms may need more time to process the
>transfer, otherwise the controller may miss the first interval. Let's
>keep it simple and give the controller at least 500us to schedule the
>isoc transfer.
>
>Link: https://lore.kernel.org/linux-usb/20220302143539.GI11577@pengutronix=
=2Ede/
>Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Tested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

>---
> drivers/usb/dwc3/gadget.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>index a0c883f19a41..eb88ef5dd16f 100644
>--- a/drivers/usb/dwc3/gadget.c
>+++ b/drivers/usb/dwc3/gadget.c
>@@ -1830,7 +1830,13 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep =
*dep)
> 	}
>
> 	for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>-		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);
>+		int future_interval =3D i + 1;
>+
>+		/* Give the controller at least 500us to schedule transfers */
>+		if (desc->bInterval < 3)
>+			future_interval +=3D 3 - desc->bInterval;
>+
>+		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, future_interval);
>
> 		ret =3D __dwc3_gadget_kick_transfer(dep);
> 		if (ret !=3D -EAGAIN)
>
>base-commit: 98d107b84614a1c6b0b8009feae49c5fb0ef4758
>--=20
>2.28.0
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIpOvMACgkQC+njFXoe
LGTqMg/+LhlwJuFwERQ3iClbw2GAwICiWqymUm+8KmFymT5GqPLHOzXDbNeGMPVf
feuOqqDJwwZoQIwdMrA74buaeBzz6GEzd0Ikdpbyqij2pkYeSmwbICNbSO+oB+w3
P65OOKLFxP7EITNwSmRALy1KD/Pw+YlZhXyU0O2Pit6exC8zGUr6+H2EK3yZ19dF
koEq7EYcpRRIKoQV3ei3ERQak1Gcb89LyuU3Fwi9B6e/ZqObU4o90jkBg5sgAdiE
VS0Wuur1+deM52gIM+jE2xhnXml9glTiNkO9eVK8DJ72ps+zWfJOQaMtq8B3CheW
FsxNAEfBSG81URRmzFUWNaLw/MwQ0dEkX5Fj54rHNG67Kn9B6aMbhz6eGnhniYFS
qd8IsMP8aG4U8dGhDH0xgJFKVfIJiQJsG9HwKrH6+P3qz1DxbungMhucumKUg/zw
IxqKPStLMrzzx5M67ElHQVFBM3SNL4SCBzAbSJ7ZDNZsJSEPM7BH5HY1uGMVXQti
k3bS9JrwjcXJDhKNP216yXRN/i/8uDEb68NXxTTs1blifw2b0jh/oTBf8iKHIpdc
xN9NqYpvwnRIf8K7KHRupcdEw/UbNA3idKhVYr52eNO9LW3cenRbPd5CVKk+8NTJ
Q8KbHiIRtd7VJMROTQi/MBBFNHM+HgzSaJbZllKo5aGmp0I3m4U=
=aDQN
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
