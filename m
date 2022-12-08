Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547E86468EB
	for <lists+linux-usb@lfdr.de>; Thu,  8 Dec 2022 07:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiLHGLg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 01:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLHGLd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 01:11:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEEA950D7
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 22:11:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0CD9AB82235
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 06:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED58C433C1;
        Thu,  8 Dec 2022 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670479889;
        bh=1eVQo4a00p3DthTwZMPMqcjI91cjHdoWid/yu7ZUu9E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gM25xh7003oGRWjVDl6BjTDf/kdsYOQoJhT+OBdfcGKaed0j3k09KC3T0/8OQ1VQv
         m0fa2f9HYxvkDt/55LiVgYBJ1IQcHpbayqVIhTtBNf4myNr1cmybgm2392L7Ra7zVJ
         PsWyt45a/V37hJbERCVjglvHGyp+SiVLHXElJww7hjARXc4Kc3Lgy0A/7VPamEBYN6
         A0yqpN0/QogUOY5ejK+2IHb9r2BBUs2A2k//jBpn5LDLXZ/m6CMMMWe+JcseAtGMdx
         53WjFO5r4IPMq1TtMY2vpWXSnnSYPzkSl4kKw1PlJy3Xj/k29faTI3SEFKZFBtviG2
         zCg4VAVEzGSrw==
From:   Felipe Balbi <balbi@kernel.org>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-usb@vger.kernel.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: dwc3 38100000.usb: No resource for ep1in
In-Reply-To: <1c187708-be86-0391-6cbd-3466cf0478fe@ideasonboard.com>
References: <1c187708-be86-0391-6cbd-3466cf0478fe@ideasonboard.com>
Date:   Thu, 08 Dec 2022 08:11:07 +0200
Message-ID: <87a63ymnlw.fsf@balbi.sh>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Dan Scally <dan.scally@ideasonboard.com> writes:
> I'm having an issue with DWC3 which I'm hoping you might be able to shed=
=20
> light on. I'm using the UVC gadget function to stream video from an=20
> imx8mp platform, which works just fine. Once I have stopped streaming=20
> however and after some time has passed (the exact duration seems to vary=
=20
> quite a lot from 1-2 minutes to 15+ mins) I get a kernel warning like so:

As Greg mentioned, please add Thinh, the new maintainer, to the loop.

> [ =C2=A0737.996842] configfs-gadget gadget.0: uvc: uvc_function_disable()
> [ =C2=A0738.519582] configfs-gadget gadget.0: uvc: uvc_function_set_alt(0=
, 0)
> [ =C2=A0738.526060] configfs-gadget gadget.0: uvc: reset UVC interrupt en=
dpoint
> [ =C2=A0738.532713] ------------[ cut here ]------------
> [ =C2=A0738.537683] dwc3 38100000.usb: No resource for ep1in
> [ =C2=A0738.542712] WARNING: CPU: 0 PID: 645 at drivers/usb/dwc3/gadget.c=
:384=20
> dwc3_send_gadget_ep_cmd+0x478/0x580
> [ =C2=A0738.552314] Modules linked in:
> [ =C2=A0738.555402] CPU: 0 PID: 645 Comm: irq/208-dwc3 Not tainted=20
> 5.19.0-00034-gf017ce943b32 #82
> [ =C2=A0738.563601] Hardware name: Polyhex Debix Model A i.MX8MPlus board=
 (DT)
> [ =C2=A0738.570145] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS=
=20
> BTYPE=3D--)
> [ =C2=A0738.577128] pc : dwc3_send_gadget_ep_cmd+0x478/0x580
> [ =C2=A0738.582116] lr : dwc3_send_gadget_ep_cmd+0x478/0x580
> [ =C2=A0738.587102] sp : ffffffc00c3c39e0
> [ =C2=A0738.590433] x29: ffffffc00c3c39e0 x28: 0000000000031006 x27:=20
> 00000000ffffffea
> [ =C2=A0738.597618] x26: 0000000000000006 x25: ffffff8004f32880 x24:=20
> ffffffc00c3c3abc
> [ =C2=A0738.604801] x23: 0000000000000406 x22: ffffffffffff3f00 x21:=20
> ffffffffffff3f0c
> [ =C2=A0738.611984] x20: ffffff8003872600 x19: 0000000000000001 x18:=20
> ffffffffffffffff
> [ =C2=A0738.619166] x17: 000000000000001c x16: 00000000c99c42a5 x15:=20
> ffffffc08c3c36b7
> [ =C2=A0738.626347] x14: 0000000000000000 x13: 6e6931706520726f x12:=20
> 6620656372756f73
> [ =C2=A0738.633528] x11: 00000000000c02a7 x10: ffffffc009af1ac0 x9 :=20
> ffffffc0080c42bc
> [ =C2=A0738.640710] x8 : 00000000ffffefff x7 : ffffffc009af1ac0 x6 :=20
> 0000000000000000
> [ =C2=A0738.647891] x5 : ffffff807fb2eb08 x4 : 0000000000000000 x3 :=20
> 0000000000000027
> [ =C2=A0738.655072] x2 : 0000000000000000 x1 : 0000000000000000 x0 :=20
> ffffff80158a8000
> [ =C2=A0738.662255] Call trace:
> [ =C2=A0738.664721] =C2=A0dwc3_send_gadget_ep_cmd+0x478/0x580
> [ =C2=A0738.669362] =C2=A0__dwc3_gadget_ep_enable+0x4f4/0x714
> [ =C2=A0738.674004] =C2=A0dwc3_gadget_ep_enable+0x6c/0x15c
> [ =C2=A0738.678382] =C2=A0usb_ep_enable+0x4c/0x1bc
> [ =C2=A0738.682067] =C2=A0uvc_function_set_alt+0xcc/0x264
> [ =C2=A0738.686362] =C2=A0composite_setup+0x7ec/0x195c
> [ =C2=A0738.690395] =C2=A0configfs_composite_setup+0x90/0xc0
> [ =C2=A0738.694950] =C2=A0dwc3_ep0_interrupt+0x834/0x9e0
> [ =C2=A0738.699156] =C2=A0dwc3_thread_interrupt+0x994/0xd70
> [ =C2=A0738.703624] =C2=A0irq_thread_fn+0x38/0xa4
> [ =C2=A0738.707221] =C2=A0irq_thread+0x184/0x230
> [ =C2=A0738.710733] =C2=A0kthread+0x118/0x120
> [ =C2=A0738.713981] =C2=A0ret_from_fork+0x10/0x20
> [ =C2=A0738.717582] irq event stamp: 41021
> [ =C2=A0738.720998] hardirqs last =C2=A0enabled at (41019): [<ffffffc0080=
82858>]=20
> finish_task_switch.isra.0+0xe8/0x264
> [ =C2=A0738.730501] hardirqs last disabled at (41021): [<ffffffc008f15058=
>]=20
> _raw_spin_lock_irqsave+0xc4/0x170
> [ =C2=A0738.739747] softirqs last =C2=A0enabled at (41014): [<ffffffc008a=
25b90>]=20
> dwc3_thread_interrupt+0x1c0/0xd70
> [ =C2=A0738.748988] softirqs last disabled at (41020): [<ffffffc008a259dc=
>]=20
> dwc3_thread_interrupt+0xc/0xd70
>
>
> ep1in in this instance refers to a Status Interrupt Endpoint under the=20
> UVC specification, which is being "reset" by uvc_function_set_alt()=20
> against the VideoControl interface (meaning a call to usb_ep_disable()=20
> followed by usb_ep_enable(), see [1]). The isochronous endpoint that=20
> data is streamed across is treated similarly in the same function (when=20
> called for the VideoStreaming interface) and never seems to show the=20
> same warning and as far as I can tell the operation ought to be safe, so=
=20
> I'm struggling to see anything in the f_uvc code that's misbehaving to=20
> cause the problem. I wondered if you might be able to take a look at the=
=20
> trace and regdump of the dwc3 (which was taken immediately after the=20
> warning is thrown) and see if that sheds any light on what might be=20
> going on?

Best way forward is to collect dwc3 trace points, so we can see what the
HW is doing. For details, see [1].

[1] https://kernel.org/doc/html/latest/driver-api/usb/dwc3.html#reporting-b=
ugs

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEEg3wK/NVnD14JZqsmho6y4DXKpEQFAmORf/sRHGJhbGJpQGtl
cm5lbC5vcmcACgkQho6y4DXKpERl8hAApDNyfZWbJGLPJBOTUGy3HHD/Z+PWUxaW
c33/Fn13OEKnHcMpiiI/EHGSTme0d/f1R91rBjngEiW7sXbGaZxe0d+C2YuLt5fZ
U2UcvF3YHqZ9fzrRNSWKWKtjRxZs4DGjPv2B4WuLNN7Uv/fi/3BqXEFevvzFt4TW
OM1qyvsCheBxEOpUG6rkXVMuyOxTeNPuvzFpWQdBOrixW+WrIgstCZRyTNedsJ+I
Kt10KZedVILn3L7LucAZQjvYYp95MytVWgf05l9N3+YDBB8VfQ7xVozEPaZrlmOV
OTZdZJR8+bYKQJN8+4haA2sRj/1ueELiHkjaqurgtnPgrSRWaDab7FkZhwvb2kKv
KxKgSlWytGvtP4omaKRH/SPq6vjM3ISTky0kOmbmXOcwtvRX6ZUpAx9kpREN7TJi
bPOZaWmtCqQ6JMmikBoVa9o9IHD+QiogWSmS8gbYIqZ3VqSQOORpFl8ZxjV1PPiy
Q35IkP/VnECFCQ8y54XLGK+HSHWb5oSif4VV8G9KxD9pOaX4hDdrazO/YWw/8OxH
sl8iwptOIWOSlWg8fXPQj5jrhISQo4IeqmmqoMAVlj8tq/cVC2hZ+C6ssqBgOSvr
Rdnlg3W+G2y2tLibH9Qdfm62dyswQQ63+5IYJd3IkcXwAqia/4njX2xhltb3V8mP
dZRrScYhI3I=
=HKyd
-----END PGP SIGNATURE-----
--=-=-=--
