Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DCD4DBA48
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 22:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358182AbiCPVqC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 17:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358163AbiCPVp6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 17:45:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07D213CCE
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 14:44:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nUbRh-00011n-DG; Wed, 16 Mar 2022 22:44:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nUbRg-00185T-ET; Wed, 16 Mar 2022 22:44:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nUbRe-009dKa-1A; Wed, 16 Mar 2022 22:44:38 +0100
Date:   Wed, 16 Mar 2022 22:44:37 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: refcount underflow on stm32mp1
Message-ID: <20220316214437.iawmafmard7sed5w@pengutronix.de>
References: <20220316164724.uic3azim4mhp6jvl@pengutronix.de>
 <YjIZuY2qXGD/Toqf@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a27awqdjjjh3u3n6"
Content-Disposition: inline
In-Reply-To: <YjIZuY2qXGD/Toqf@kroah.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
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


--a27awqdjjjh3u3n6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Wed, Mar 16, 2022 at 06:09:13PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 16, 2022 at 05:47:24PM +0100, Uwe Kleine-K=F6nig wrote:
> > on an stm32mp157a based machine I encounter the following problem during
> > boot:
> >=20
> > [    2.031752] using random self ethernet address
> > [    2.034869] using random host ethernet address
> > [    2.039329] using random self ethernet address
> > [    2.043986] using random host ethernet address
> > [    2.049186] usb0: HOST MAC 6a:74:a8:25:a5:f9
> > [    2.052482] usb0: MAC f6:83:b5:19:02:4f
> > [    2.056631] Mass Storage Function, version: 2009/09/11
> > [    2.061408] LUN: removable file: (no medium)
> > [    2.065652] no file given for LUN0
> > [    2.111423] g_multi 49000000.usb-otg: failed to start g_multi: -22
> > [    2.116359] ------------[ cut here ]------------
> > [    2.120762] WARNING: CPU: 0 PID: 7 at lib/refcount.c:28 dwc2_hsotg_r=
emove+0x1c/0x2c
> > [    2.128541] refcount_t: underflow; use-after-free.
> > [    2.133214] Modules linked in:
> > [    2.136229] CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 5.17.0-rc8-=
dirty #10
> > [    2.143351] Hardware name: STM32 (Device Tree Support)
> > [    2.148482] Workqueue: events_unbound deferred_probe_work_func
> > [    2.154314]  unwind_backtrace from show_stack+0x18/0x1c
> > [    2.159515]  show_stack from dump_stack_lvl+0x40/0x4c
> > [    2.164555]  dump_stack_lvl from __warn+0xd8/0x17c
> > [    2.169334]  __warn from warn_slowpath_fmt+0x98/0xc8
> > [    2.174287]  warn_slowpath_fmt from dwc2_hsotg_remove+0x1c/0x2c
> > [    2.180196]  dwc2_hsotg_remove from dwc2_driver_probe+0x59c/0x790
> > [    2.186278]  dwc2_driver_probe from platform_probe+0x64/0xc0
> > [    2.191926]  platform_probe from really_probe+0x1ac/0x470
> > [    2.197312]  really_probe from __driver_probe_device+0xa8/0x20c
> > [    2.203220]  __driver_probe_device from driver_probe_device+0x3c/0xcc
> > [    2.209650]  driver_probe_device from __device_attach_driver+0xac/0x=
124
> > [    2.216254]  __device_attach_driver from bus_for_each_drv+0x84/0xc8
> > [    2.222511]  bus_for_each_drv from __device_attach+0xcc/0x1d4
> > [    2.228245]  __device_attach from bus_probe_device+0x8c/0x94
> > [    2.233894]  bus_probe_device from deferred_probe_work_func+0x9c/0xdc
> > [    2.240324]  deferred_probe_work_func from process_one_work+0x210/0x=
584
> > [    2.246929]  process_one_work from worker_thread+0x214/0x544
> > [    2.252576]  worker_thread from kthread+0xf0/0x120
> > [    2.257356]  kthread from ret_from_fork+0x14/0x2c
> > [    2.262047] Exception stack(0xc190ffb0 to 0xc190fff8)
> > [    2.267089] ffa0:                                     00000000 00000=
000 00000000 00000000
> > [    2.275260] ffc0: 00000000 00000000 00000000 00000000 00000000 00000=
000 00000000 00000000
> > [    2.283426] ffe0: 00000000 00000000 00000000 00000000 00000013 00000=
000
> > [    2.290196] ---[ end trace 0000000000000000 ]---
> >=20
> > This happens on v5.15 and on v5.17-rc8.
> >=20
> > I didn't try to debug this further, just wanted to let you know ...
>=20
> So it's always been an issue?
>=20
> git bisect?

I don't believe this is the easiest approach to tackle that problem.
Support for stm32mp157a was added around v5.5, but I failed to get this
version up on my machine. v5.15 is the oldest kernel I had running on
that machine.

The problem is that after usb_add_gadget_udc() failed in
dwc2_driver_probe(), dwc2_hsotg_remove() -> usb_del_gadget_udc() ->
usb_put_gadget() -> put_device() results in that underflow.

With that information I'd expect that someone understanding how
reference counting works with usb gadgets should be able to come up with
a fix.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--a27awqdjjjh3u3n6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIyWkIACgkQwfwUeK3K
7Al8+ggAoGL3tr23C5gcAwrR0yLkW6Idneeik+858kJqimnT03drNBarwGWOkzwE
w6CZP6y0GFEX+1b1H2NV9SEY1Ui0gKTLIiaqCH07aCq7/rjHiifPRgQlunhX9bYc
pe8lx4Kqdcb4ltLVQAl7JdytJ18O5GAKsCDWjH5rb7XpryVZI/QjGWBXvFSK4Jzf
3jtf7g2YAeRBBQ/KHUsrYH8tdG6OvwNYKUxpORHdAaYf62dIW2YRksL9d0X0Rr/9
Fro92sZ9PqdExv7PMC/ZOg5E5WSpKRVL/Rqp9u7Zixsqxeg7babC/w1Ma3EdhniV
UQaPQDYgR5lneL/b0edqy2EUm683rw==
=3wGC
-----END PGP SIGNATURE-----

--a27awqdjjjh3u3n6--
