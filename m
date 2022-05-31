Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748CE539A2B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 01:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348740AbiEaXpr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 19:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348857AbiEaXpi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 19:45:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA9D9E9C0
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 16:45:34 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwBYK-0004VK-Sp; Wed, 01 Jun 2022 01:45:32 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nwBYJ-0006vP-Pi; Wed, 01 Jun 2022 01:45:31 +0200
Date:   Wed, 1 Jun 2022 01:45:31 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: hub: port: add sysfs entry to switch port power
Message-ID: <20220531234531.GA12543@pengutronix.de>
References: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
 <YnvDlhlcVGoerhLz@rowland.harvard.edu>
 <20220511203727.GG27481@pengutronix.de>
 <YnxgvcOIVMWhDbi9@rowland.harvard.edu>
 <YoAIeQJAvFBs6YNq@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <YoAIeQJAvFBs6YNq@rowland.harvard.edu>
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


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2022 at 03:52:25PM -0400, Alan Stern wrote:
>On Wed, May 11, 2022 at 09:19:57PM -0400, Alan Stern wrote:
>> On Wed, May 11, 2022 at 10:37:27PM +0200, Michael Grzeschik wrote:
>
>> > > > +		if (udev) {
>> > > > +			port_dev->child =3D NULL;
>> > >
>> > > That assignment is not necessary; usb_disconnect() will take care of=
 it.
>> >
>> > Here are two things that are in play.
>> >
>> > First I have to set port_dev->child =3D NULL before calling
>> > usb_disconnect. Otherwise the following automatic hub_suspend call (in
>> > case this was the last operational port of the hub) will print the
>> > message "device x-y not suspended yet" and will fail the hub to
>> > suspend.
>> >
>> > When calling usb_autoresume_device(udev) instead and before calling
>> > usb_disconnect, this is no longer the case. The hub will be succesfully
>> > suspended.
>> >
>> > The second thing is the assignment. I still have to explicitly assign =
NULL to
>> > port_dev->child. Otherwise a following enable of this port via this sy=
sfs will
>> > run into an hub_event with the usb_disonnect for the device on that po=
rt. But
>> > this will spit out a ugly traceback leading with the following error:
>> >
>> > [   21.718574] usb 2-1.1: USB disconnect, device number -1
>> >
>> > [   21.719100] Unable to handle kernel paging request at virtual addre=
ss 96d628cc24e2e078
>> > [   21.719807] Mem abort info:
>> > [   21.720065]   ESR =3D 0x96000044
>> > [   21.720348]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>> > [   21.720827]   SET =3D 0, FnV =3D 0
>> > [   21.721109]   EA =3D 0, S1PTW =3D 0
>> > [   21.721447]   FSC =3D 0x04: level 0 translation fault
>> > [   21.721891] Data abort info:
>> > [   21.722157]   ISV =3D 0, ISS =3D 0x00000044
>> > [   21.722505]   CM =3D 0, WnR =3D 1
>> > [   21.722779] [96d628cc24e2e078] address between user and kernel addr=
ess ranges
>> > [   21.723429] Internal error: Oops: 96000044 [#1] PREEMPT SMP
>> > [   21.723927] Modules linked in: uio_pdrv_genirq fuse
>> > [   21.724380] CPU: 0 PID: 58 Comm: kworker/0:3 Not tainted 5.18.0-rc6=
+ #93
>> > [   21.724977] Hardware name: Radxa ROCK3 Model A (DT)
>> > [   21.725412] Workqueue: usb_hub_wq hub_event
>> > [   21.725802] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS B=
TYPE=3D--)
>> > [   21.726419] pc : usb_disable_endpoint+0x7c/0xdc
>> > [   21.726832] lr : usb_disable_device_endpoints+0xbc/0xe0
>> > [   21.727301] sp : ffffffc009b33b30
>> > [   21.727597] x29: ffffffc009b33b30 x28: ffffff8003ad4ed8 x27: 000000=
0000000001
>> > [   21.728239] x26: ffffff8004344928 x25: 0000000000000000 x24: ffffff=
c0096eb8e0
>> > [   21.728885] x23: ffffff80043448a8 x22: ffffff8003961800 x21: 000000=
0000000001
>> > [   21.729527] x20: 96d628cc24e2e034 x19: ffffff8004344800 x18: ffffff=
ffffffffff
>> > [   21.730168] x17: 0000000000000001 x16: 0000000000000001 x15: ffffff=
c089b33857
>> > [   21.730810] x14: 0000000000000000 x13: 312d207265626d75 x12: 6e2065=
6369766564
>> > [   21.731452] x11: 00000000fffff7ff x10: 00000000fffff7ff x9 : ffffff=
c00871b8dc
>> > [   21.732093] x8 : 000000000000bfe8 x7 : ffffffc009b33a38 x6 : 000000=
0000000001
>> > [   21.732733] x5 : ffffffc009569000 x4 : ffffffc009569050 x3 : ffffff=
8004344878
>> > [   21.733374] x2 : 0000000000000001 x1 : 000000000000008f x0 : 000000=
0000000001
>> > [   21.734015] Call trace:
>> > [   21.734235]  usb_disable_endpoint+0x7c/0xdc
>> > [   21.734616]  usb_disable_device_endpoints+0xbc/0xe0
>> > [   21.735054]  usb_disable_device+0x1c0/0x260
>> > [   21.735432]  usb_disconnect+0x108/0x300
>> > [   21.735778]  hub_event+0x1378/0x19c0
>> > [   21.736102]  process_one_work+0x220/0x49c
>> > [   21.736469]  worker_thread+0x154/0x450
>> > [   21.736810]  kthread+0xfc/0x110
>> > [   21.737096]  ret_from_fork+0x10/0x20
>> > [   21.737429] Code: f941c474 340001e0 f901c47f b4ffff14 (b900469f)
>> > [   21.737970] ---[ end trace 0000000000000000 ]---
>> >
>> > Did I miss something?
>>
>> No: You found a real bug in the hub driver!  usb_disconnect() really
>> is supposed to set port_dev->child to NULL at some point, but it
>> doesn't.  In fact, port_dev->child never gets set back to NULL (except
>> in the trivial case where a newly attached device fails to initialize
>> and enumerate).
>>
>> I'll work on a patch to fix this, and I'll CC: you when it's ready.
>
>I take it back.  This isn't a bug; it's a mistake in the way you called
>usb_disconnect().  Your patch did:
>
>		if (udev) {
>			port_dev->child =3D NULL;
>			usb_disconnect(&udev);
>		}
>
>The argument to usb_disconnect() is supposed to be &port_dev->child, not
>&udev.  You can see near the end of the function that it sets *pdev to
>NULL; this is where port_dev->child gets cleared.

Thanks for the clarification.

>Not incidentally, usb_disconnect() requires that you hold hdev's device
>lock when you call it (this is mentioned in the kerneldoc, although the
>requirement that pdev points to port_dev->child isn't -- the kerneldoc
>for that function could stand to be improved).

Okay. I added the lock around the usb_disconnect.

I just added some tweaks regarding the pm handling and will send out v2.

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmKWqJgACgkQC+njFXoe
LGTalRAAvs7jtVxQNDEmXyzBD7NB/7YZt7xEdEhWyzrhGxdHUeO2KaE6iSp/9aSG
fTm3UKowxPQbSc9Z8iDDAxgZrb5j4YImJ/j2nb99uM8MmlQJxt70PUuyH8kqJZ49
/Q/8LbTHjfx/xlvsJLOiKZ3ivy2YNHGddYVCFx4ZFiZ0fW8jm2qqnp9humUoPX7q
4PozrWhTLvMgEbNFFluHhn/qF1ZYiE8zgFd2vzJBzEI+2ljMdUK2ghVB44rSEVwO
grMuxm3VVmsac9W+K6iao1zcQwzXMT1pfOywr//Rp0dLairl0JiArzgGSPtJ16zy
qEZLBcverZ8anCGI7FLZRqf2d2ies3zSgZqW1Qlwj1vgOVneydrlMAzqMZA8DYlw
/VoCbdtAayd1XUkSXmgkt9PRHp9uTqnAMl9p3wDYShblf837HFj3C6rErIa5uC2V
iE3ODdJUlLGVsgBocuROznloYjYUQiUkcZARy52LbnDjB+SeUkk/oLd1R2e0yXN5
VzX6UhaY7BUGCWjpsv0+mSpDEx2aw2X8Tdzv+7kRzgidHVAwo4B+3xczV34KZnXg
ZVOS0i57+L4kaV4ICn0XqBZjfGdPRwaM/jS542+xb+3CQxZC2UUrGQ986zi5oMZN
Vk/+IQscNZgHIy1FtVOlToKLpTzDzT7qwGAVxg72f9y0Z2B8bYA=
=Jbjr
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
