Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC58516CAE
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 11:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381121AbiEBJDf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 05:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383985AbiEBJDe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 05:03:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417C058381
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 02:00:06 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nlRuW-0002z8-L8; Mon, 02 May 2022 11:00:04 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nlRuV-000570-Dp; Mon, 02 May 2022 11:00:03 +0200
Date:   Mon, 2 May 2022 11:00:03 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Dan Vacura <w36195@motorola.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/5] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <20220502090003.GH7671@pengutronix.de>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-4-m.grzeschik@pengutronix.de>
 <Yl8fwdOuxYDVrujW@pendragon.ideasonboard.com>
 <YmwzxIV5/a+ZNLXI@p1g3>
 <20220429200137.GE7671@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fmEUq8M7S0s+Fl0V"
Content-Disposition: inline
In-Reply-To: <20220429200137.GE7671@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:51:06 up 32 days, 21:20, 91 users,  load average: 0.24, 0.20,
 0.21
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


--fmEUq8M7S0s+Fl0V
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Fri, Apr 29, 2022 at 10:01:37PM +0200, Michael Grzeschik wrote:
>On Fri, Apr 29, 2022 at 01:51:48PM -0500, Dan Vacura wrote:
>>Thanks for this change it improves the performance with the DWC3
>>controller on QCOM chips in an Android 5.10 kernel. I haven't tested the
>>scatter/gather path, so memcpy was used here via
>>uvc_video_encode_isoc(). I was able to get around 30% improvement (fps
>>on host side). I did modify the alloc to only set the WQ_HIGHPRI flag.

I missed to ask you to try the WQ_CPU_INTENSIVE flag. It would be
interesting if you can see further improvement.

Regards,
Michael


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--fmEUq8M7S0s+Fl0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmJvnZAACgkQC+njFXoe
LGQZoA//YWrpLSjXqB/O2zsGF9l6/pya2egg2gUfdoYxJMyU2FtogmLiGltvOK+c
nEYa78nihT+NadT7pBsUBPRx2RrZ/45lg55crPlRQL9TEOYFVPcEG0hoffbiiuup
4Qs6TkUeadTdJuIdy9p6klqCu/Butu0CrkMjx2mLfWlpCquNoNOhIxQ6LeE5jcgP
fpagLD2uAzo1lzX5JaIQXMtAkCZ/2WVjHY7ON5Aor8lf+Rw2DwtEEjX7SAk8spW6
UQibfM+yOyKuSAvTjD5lFV4hBw9lRboTcZ3UH7GUm/4MHJGgXDkzOhneUvbIjCw/
gzan4NrvmBjl5gXSYdq6TZRuBN1gMd/a5k0YXemxCkgMuriwXk5T6pk0GaUjfNQt
U1TiBZM0ADMU1VMeQYzjni+Jn3Nd+vY4dq9WErSnxuzIYDp35onafkNw+NzzAMLE
2IJn1rqhmvHdqFRFHiltHlktCBki8WXylRNVtpFDxtq734EToEKxTPBLHuRmNqWj
ksoa4LHVq/NluDNOO95oqn5nH0janCJ3kze2DO0jghgsTup0P51X9TahYplZDo8A
gBJKOCf3urovWSjzchmMBWF7ILhN0wxEZl96zoEDaLBGnaHlKG8MgR63OWtvat1e
ikWPprdn5ETVLpyGM06lhSxZPzE8+p4GEuqc+YP7q2p01KWLfko=
=8bUQ
-----END PGP SIGNATURE-----

--fmEUq8M7S0s+Fl0V--
