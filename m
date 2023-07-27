Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5027E765355
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 14:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbjG0MKw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 08:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233693AbjG0MKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 08:10:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B217F2D76
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 05:10:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F5E661E51
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADD6AC433C7
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690459837;
        bh=fMfSAQc/V7bWG603kIqDEureISxp/QeHAqobY6hdZMM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RnINgk8qA4vUOOGmzss6u2G6rQDbVmTMOE4jx521uZryAA7oy78V9yWOxq2U4al8b
         MfxeKIj4rmX66kZxTbYzNJO3MOtI3DwuzIiKZf9BbVRasrRCKrRaVu1iLH3LVERcsl
         80e9EsMjhxqKBpGcezAqnuvj4r8rZxwxTOtKS3xI9dwGWc5qxmcgc6Pw0Zf2pv1HzC
         OAFhi7fjMIolUomr/zALyOKGsXcIG47VUUoOyPheuU6LPc0GNWU2oAcS6DA6dakMkB
         f0CZoOgnvzPCOMy87q97zY1o4g02MxpbjCtEI34RES1DzvUg96y0k5cjyKsvQOEMSk
         lq+wM//Zw9cGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8E37BC4332E; Thu, 27 Jul 2023 12:10:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217715] USB from Thunderbolt 2 dock disconnects (xHCI host not
 responding)
Date:   Thu, 27 Jul 2023 12:10:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217715-208809-sIz4NUaew6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217715-208809@https.bugzilla.kernel.org/>
References: <bug-217715-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217715

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to youp1one1 from comment #0)
> System details:
>=20
> Operating System: openSUSE Tumbleweed=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
>           Kernel: Linux 6.4.4-1-default
>     Architecture: x86-64
>  Hardware Vendor: Lenovo
>   Hardware Model: ThinkPad P72
> Firmware Version: N2CET65W (1.48 )
>    Firmware Date: Mon 2022-08-01
>=20
>=20
> I have an old Elgato Thunderbolt 2 dock connected to my laptop's Thunderb=
olt
> 3 port via the Apple TB2->TB3 adapter
> (https://www.apple.com/shop/product/MMEL2AM/A/thunderbolt-3-usb-c-to-
> thunderbolt-2-adapter).
>=20
> I have some USB devices connected to that dock: keyboard, speakers (using
> USB audio).
> The USB subsystem of the dock randomly disconnects with the following tra=
ce:
>=20
> [50410.012153] xhci_hcd 0000:09:00.0: xHCI host controller not responding,
> assume dead
> [50410.012191] xhci_hcd 0000:09:00.0: HC died; cleaning up
> [50410.012231] usb 5-4: USB disconnect, device number 2
>=20
> It disconnects randomly less than one hour after fresh boot or hours late=
r,
> there is no identifiable pattern. It happens out of the blue while I'm us=
ing
> the machine normally, usually playing audio to the connected speaker via =
USB
> audio.
> Replugging the TB3 cable usually makes USB work again for a while until it
> disconnects again. A monitor is connected to this dock via DisplayPort and
> is unaffected.
> I noticed that issue starting with Kernel 6.3.4, although it could have
> happened before.
>=20
> Here's my initial bug report on openSUSE Tumbleweed issue tracker:
> https://bugzilla.opensuse.org/show_bug.cgi?id=3D1212019
>=20
> I can provide any additional info required.

* Show the full dmesg and lspci output.
* Does this issue occurs on v6.1.y stable series? If none, can you also che=
ck
latest mainline (currently v6.5-rc3)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
