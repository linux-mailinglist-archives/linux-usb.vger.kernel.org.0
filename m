Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44469563BC0
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 23:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbiGAV1g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Jul 2022 17:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiGAV1f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jul 2022 17:27:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BD153D3B
        for <linux-usb@vger.kernel.org>; Fri,  1 Jul 2022 14:27:33 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o7OAk-00054l-VR; Fri, 01 Jul 2022 23:27:30 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o7OAk-0008BJ-AP; Fri, 01 Jul 2022 23:27:30 +0200
Date:   Fri, 1 Jul 2022 23:27:30 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: dwc3: gadget: fix high-speed multiplier setting
Message-ID: <20220701212730.GA7981@pengutronix.de>
References: <20220630140216.185919-1-m.grzeschik@pengutronix.de>
 <Yr6pxoV+SB/whAkF@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <Yr6pxoV+SB/whAkF@kroah.com>
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


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2022 at 10:01:10AM +0200, Greg KH wrote:
>On Thu, Jun 30, 2022 at 04:02:16PM +0200, Michael Grzeschik wrote:
>> For high-speed transfers the __dwc3_prepare_one_trb function is
>> calculating the multiplier setting for the trb based on the length of
>> the trb currently prepared. This assumption is wrong. For trbs with a
>> sglist the length of the actual request has to be taken instead.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>
>What commit id does this fix?

It would be commitish 40d829fb2ec636b6b4b0cc95e2546ab9aca04cc9 .

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmK/Zr8ACgkQC+njFXoe
LGQu+Q/+P67dF661m2Ca85Rb8eSPnDcJpZddGJfybo2tLIMtqvSQsy0cBxPOu9D/
2pppcqkQU2Evldb/kfzsbztqOJTDjvzbYc2Lfcl9+JjnUy+IWjh37yLD8mmWtXph
UHKsX0tlKui5ZbzBI6k0HZgkwSiUO0Dg36zSQYHsFCB9yvmBKcsgoQ9de3OIEBzN
E0X7BNNU9cqa0W3Q4LeCY2i4M0o9NWDi/tHVf68Vm4/s/TVCbluIge7NLyS4CCAa
EZh2uE4lrtkTIoFPXb6VIxwwBUCCzR3N5JZ1wF2bNRIZNE3M4Bp5kFC4YI5EG9fd
Eucrlyaz1dZsh1YGnbhzkNmKtwSp/DeXYrve+yZfal43OVcAZTH+uMh92EQEqPEk
LPlhrV8riOscUqxKgc0YY9voj3tOcu/SBCjjK+NIcRpW6h6AWvYTfULTSrZRcvQ+
L5JtCYQMgnQdoZkCFil7vEpRAd/TMsaaS4Q9RdjU3RNyVAHBTeZopF+OUjnbu1aG
hADC/JpVgLn20xrNBuyMrp1tv0kaXge6VCTX2BQ3EGkeSpJI2dlvLNFR2DR/97Jj
dW3/Q/Hx1/pzqk3rKYErYRcCnudzHmEZo1wXINN4g6Vx+lhzrFtm1o0bJCiDgIlJ
pWSr7v7DkbVXqksJi76Hvz2v2UYWpONEWp9VBtuGyx1fUS3MCk4=
=AeIV
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
