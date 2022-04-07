Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD2454F8884
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 22:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiDGUao (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 16:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiDGUa2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 16:30:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81ECE48C252
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 13:16:36 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ncYCb-0001zy-Fp; Thu, 07 Apr 2022 21:53:57 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ncYCb-0001vX-4f; Thu, 07 Apr 2022 21:53:57 +0200
Date:   Thu, 7 Apr 2022 21:53:57 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v7 0/7] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20220407195357.GB11432@pengutronix.de>
References: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
 <20220407143429.GC27216@pengutronix.de>
 <Yk76l8XLvDuln++E@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <Yk76l8XLvDuln++E@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:47:46 up 8 days,  8:17, 64 users,  load average: 0.08, 0.09, 0.08
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


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 04:52:07PM +0200, Greg KH wrote:
>A: http://en.wikipedia.org/wiki/Top_post
>Q: Were do I find info about this thing called top-posting?
>A: Because it messes up the order in which people normally read text.
>Q: Why is top-posting such a bad thing?
>A: Top-posting.
>Q: What is the most annoying thing in e-mail?
>
>A: No.
>Q: Should I include quotations after my reply?
>
>http://daringfireball.net/2007/07/on_top

I usually don't do that. I will pay more attention next time. Thanks.

>On Thu, Apr 07, 2022 at 04:34:29PM +0200, Michael Grzeschik wrote:
>> This series is laying around another two weeks after it was sent.
>
>The merge window happened when we can not do anything.  You know that :(

Yes. You are right. However, I just tried to draw some attention
as the previous versions where also very much ignored.

>> Some feedback would be appreciated to get this code mainline.
>
>Why did you not cc: the v4l mailing list as well?

Good point. I added the list.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJPQVQACgkQC+njFXoe
LGRBoA//SfYdNrkRXsWIncyG2cluAKTrXssodzdiK5W/jWm+qEltg/JFh5S0qpLd
ZhDeskmqxBl82CNl7GGD+CzYTeyfS4fNWZMMn83MDSUJgFTor87Zdqy8rJbDR00R
3i836VUK1vQYgA4fEXJWHi/82A+weIVZaM+CbVoEIxbHNghDSopzrTx0Z4t29Lgw
0Moh76M8lGvSZQzLMz/9TH0UlIunBBC7WdO3FYGUYcC96tWzxWV0xls1oVH3IhsD
MUbcy8GMpHxgs/xABVaZzCNNyKgH1J47YOgE+YVC2MGcoS0ma6POLEg+eYGFCJjP
QPeO2B9z8yqGWRn2Ndd+O9Wm9FaChf+79NEVoqSX+agZAtVIvcaQfldN7qOvuB9t
UgSAwtUppiU8rO9lAp6IQPoMQ5ht09bvpAcxaIk19i4FbI3RhoHvSfeAzNYbIBxD
IOT9nRmf+538vyfopMZ9i8lkCcRIY1bV0ozB93gOKozQmfDHt0J5z28/v387oWel
HZ0w4cjTSRtr+CSyfF2MTSS92O15T+gqn5iJzELnCIb866RPGk84llqEVHiUkAef
g14EhKCsWRIM0jMflO2rk0vdNQt23WZOPMUh+LbGmVRS5GMXkhPm/lYalpkNK+3D
PvT0dUpmX/3o5ZtiyVGnQg0H44hGzmCzrWW9EsgHo/qXAcxeAvE=
=ikjm
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
