Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5912C4F1587
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 15:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348539AbiDDNKC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 09:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbiDDNKA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 09:10:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B82233A1C
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 06:08:01 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nbMR5-00046a-JX; Mon, 04 Apr 2022 15:07:59 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nbMR4-0001kk-U2; Mon, 04 Apr 2022 15:07:58 +0200
Date:   Mon, 4 Apr 2022 15:07:58 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH 5/5] usb: gadget: uvc: stop the pump on more conditions
Message-ID: <20220404130758.GB6952@pengutronix.de>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-6-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20220402233914.3625405-6-m.grzeschik@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:04:43 up 5 days,  1:34, 69 users,  load average: 0.14, 0.23, 0.18
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


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I think we can skip this patch for now, since it is depending on this serie=
s:

https://lore.kernel.org/linux-usb/20220315143356.3919911-1-m.grzeschik@peng=
utronix.de/

The other Patches of this series have no dependencies.

Michael

On Sun, Apr 03, 2022 at 01:39:14AM +0200, Michael Grzeschik wrote:
>While looping in the pump, there are more conditions to stop handling
>requests. The streamoff event that will disable the endpoint and
>the vb2_queue is called early. We add the variables into account.
>
>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>---
> drivers/usb/gadget/function/uvc_video.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/=
function/uvc_video.c
>index 8b3116d48d2bd8..b1d7083d07846e 100644
>--- a/drivers/usb/gadget/function/uvc_video.c
>+++ b/drivers/usb/gadget/function/uvc_video.c
>@@ -368,7 +368,7 @@ static void uvcg_video_pump(struct work_struct *work)
> 	unsigned long flags;
> 	int ret;
>
>-	while (video->ep->enabled) {
>+	while (video->ep->enabled || queue->queue.streaming || video->uvc->strea=
mon) {
> 		/* Retrieve the first available USB request, protected by the
> 		 * request lock.
> 		 */
>--=20
>2.30.2
>
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJK7asACgkQC+njFXoe
LGRQ5Q/8Cm4PUW2EHt9RPC/v7IDDAqbyo65A8aruaTdUiddk/29BnD3lpbjHswWe
ANgrr5TBHCIR5RsdOwo9BHc5Tr9CWa251tdoUCu9IhlyMLknYnzGtuKUovWFK8TC
G/bFDdBH/xfsLTaNRzJDggvTXtdyM3ZLDAcamreQqL2qdtb1EiSoaWUVCbZQhC7g
GYO2W8ZP/hCPxZ3hpPVCiKg0004UduKGYfoD3n0zFIVTe7KRh0XlpcLSZIbzGk5V
z9uSstrIrnXw23ZqpFsZRejRlOZo1n7DY5imfey4AT0NXwYWsyhjdHeWaxYBcf+2
QOa12SLZ+IQ1SytxiGzZqxkPIsDK4o2RGsop3tWCMDHTtY8RLGO2QHfVXU7/HCnx
cIpJdcpqTX4H0xw6e67eZwub8dpQIBR6KmGu0OaZXafg1fLO9OZBei+9TMidyr1/
pnfanJZXzYD7LyYUuDIXt1ZLZtoS38Fuwpx+i3qKkJGszJZkB3f6M+7/MD4/HIbf
zvwYDI5X2+BqeJs+1fuDzHpkmmUAmOylzXUF25xqLg08QMw63ggjMo7yTBrP3oOj
vAHtwyLYTx/0oerhPiNW8JK/h739GytdiozDIADdyd0xskFNxy0bV3/4+GAUmgUu
4Znq0wG1BYDgYbiRRW9xF4cnLr/sDt6ieCacDK/h5jjYiVV6t8Q=
=5P8J
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
