Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BF256BA17
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238024AbiGHMwH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 08:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbiGHMwG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 08:52:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD124183BA
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 05:52:04 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o9nSl-0005NJ-6M; Fri, 08 Jul 2022 14:52:03 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o9nSg-0002nX-MQ; Fri, 08 Jul 2022 14:51:58 +0200
Date:   Fri, 8 Jul 2022 14:51:58 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de,
        Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v2 2/2] usb: dwc3: gadget: fix high speed multiplier
 setting
Message-ID: <20220708125158.GA8524@pengutronix.de>
References: <20220704141812.1532306-1-m.grzeschik@pengutronix.de>
 <20220704141812.1532306-3-m.grzeschik@pengutronix.de>
 <Ysgm6nD02TKEYJeq@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <Ysgm6nD02TKEYJeq@kroah.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
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


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cc: Thinh.Nguyen@synopsys.com

On Fri, Jul 08, 2022 at 02:45:30PM +0200, Greg KH wrote:
>On Mon, Jul 04, 2022 at 04:18:12PM +0200, Michael Grzeschik wrote:
>> For High-Speed Transfers the prepare_one_trb function is calculating the
>> multiplier setting for the trb based on the length parameter of the trb
>> currently prepared. This assumption is wrong. For trbs with a sg list,
>> the length of the actual request has to be taken instead.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>> v1 -> v2: - added refactor patch before this patch
>>           - using req->request.length as condition value
>
>Does this need to be backported to older kernels or is it ok for
>5.20-rc1?

We can add this line to the patch.

Fixes: 40d829fb2ec6 ("usb: dwc3: gadget: Correct ISOC DATA PIDs for short p=
ackets")

I would say this could be backported.

Thinh?

>thanks,
>
>greg k-h
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmLIKGsACgkQC+njFXoe
LGTdKw/8CVxsBo4TbJHTPoOLpkeEDWpHZcT/8lEL0jkaavZei90SthQM9AlG6pAU
YRWKoK7XqZvE3j0jClbP7vKknQKxaZNlLS0EFFgaM4dYJRN/xz83Y68JaZPnZDz4
WGQwpAWi/2xc/o6GmkTKCXudxcjQtL5yCwvMT8K1Od785N9O8RQpPH8bslq42wyQ
EpPAvjDnMa/sXztLj5GdzXcNi6KchuGFZn4cZOYG8WMGIKZmyYxtrfi494rXX85h
XEZhdPVnJ8CWfJzksMZpoIBuJ3Uebh9m7b6IutXBfKzHlS6ACaXUr3SvQj1NQFZO
7SpI6SZYzCHht9sN9LyEPL6Q0L+v3qZ4+tQhJQwOHOIxi84sr4iM1GenJSxcOdup
bEnCU1jbe6n3Xe28Jl18fxq/yJC9b0fynnLGTZoogrZP3dU9cEGhONEfFwVWQ6oB
0V1QImvodKWIhua3s68kop745zzSR6kZbDB0udURYXcUtReaxFUH46ZRJv85u9yR
XVLoy17HaR4ZyReF9M05GG5aA+ybsXITDVbRDcD5RMpFBJTQ3eA3gyvNb5xg7q8h
oVQsZg1qzfxO4OlaRh+rl/jAQ3lemNRNZpGZF4vVY6APuLnb+CmB4TNhmK4Fy1ye
Mij407HIzEE++a4+ys69l/SNcrpfn4Jt5g0qO9SibpGsztSg/l4=
=kDNU
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
