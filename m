Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBED963BDCD
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 11:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbiK2KTS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 05:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiK2KTQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 05:19:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9788D4E41C
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 02:19:15 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ozxhi-0000g8-OK; Tue, 29 Nov 2022 11:19:06 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1ozxhg-0004Wa-Fa; Tue, 29 Nov 2022 11:19:04 +0100
Date:   Tue, 29 Nov 2022 11:19:04 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 2/23]
 drivers/usb/gadget/function/uvc_v4l2.c:266:3: warning: unannotated
 fall-through between switch labels
Message-ID: <20221129101904.GM18924@pengutronix.de>
References: <202211290734.P9mHcjpl-lkp@intel.com>
 <Y4W6/0Ql3dI+ePXF@kroah.com>
 <Y4W7Xw6OA9GLzXmH@kroah.com>
 <Y4W7yKbiKzK4yKoV@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RNRUMt0ZF5Yaq/Aq"
Content-Disposition: inline
In-Reply-To: <Y4W7yKbiKzK4yKoV@kroah.com>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--RNRUMt0ZF5Yaq/Aq
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2022 at 08:59:04AM +0100, Greg Kroah-Hartman wrote:
>On Tue, Nov 29, 2022 at 08:57:19AM +0100, Greg Kroah-Hartman wrote:
>> On Tue, Nov 29, 2022 at 08:55:43AM +0100, Greg Kroah-Hartman wrote:
>> > On Tue, Nov 29, 2022 at 07:22:43AM +0800, kernel test robot wrote:
>> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.g=
it usb-testing
>> > > head:   465d4dd073f72a6348577ed0f7aa4aa00c9264bc
>> > > commit: a6f523ee41bfe7ef71110d4ae556339d0520efdd [2/23] usb: gadget:=
 uvc: add validate and fix function for uvc response
>> >
>> > Michael, I'll drop this commit from my tree now, please fix up and
>> > resend.
>>
>> Nevermind, I fixed it up myself, it was trivial.
>
>And now ignore this, I've dropped it again based on Laurent's review.
>

Did you drop it because of the question why this is a good idea?

If so I will improve the commit message. IMHO it totally makes sense to
have some sort of validation in the uvc gadget.

The version v7 he commented on was not the one you took on the
usb-testing tree.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--RNRUMt0ZF5Yaq/Aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmOF3JgACgkQC+njFXoe
LGSQlBAAqMIsMoLkAxkdCfnbkxn0lrFU7XXvsc0TK+EzfP5SyRm9jZMe/O3OFR6G
LrcT5KVth0gCI58tEFjY8Y9FtfWkSkPQwx7flWs1y7+qFhiiklXZlj3BFLSmLnZk
xpuqxFUavNLVgAx6QI2AnhQVfLTx4ScYt7V5vKOnRbtLJeV14TpKTKwLlEHGpB39
iD8EWiqWtlmDc1SItJ4IEBy1mUf+Kl+b2zII35EwVbn7LbXPQAaIbg9JJwYB3cjx
OUyGqNyS041XB+rU4KegWwwvl7N5Dzptq1a++ipWZLT+I9vCxH+MlRpONK2AZt0d
ZK/jmz1uI0tbXSoHynojRTXCYBUW0pijXg1E8EGV0HIQYFlwr9nEk05YSB/2ALO1
oXm4WbBk/1bF8NGAXvcnNDuLcWt4Yk7uag9JBLqh+QhJk8aj/IvHDqXDJpja/7bC
ymONiW1x2yOiGwnia9aheJRRlE0TbKRepVyGNCmd+3YfrLUJead7H7k0EBg8ff26
H53xnUTT6LXin0Ql1K7lBonVvYS2GKyNED3MfIor9wwh+dx6go32YqoBNw2Qh8m8
OUxlX8wu4b8g8oJtPwB9OQPSyEWu0yfvnWlHdYjpRD7kw26XSMg8v79MLHE2Kfin
HwiPZGBZuI3Ue61DW0bPFKS6vFCm05e0DG6Ybcg7Cbt0s90ZVg8=
=BT1P
-----END PGP SIGNATURE-----

--RNRUMt0ZF5Yaq/Aq--
