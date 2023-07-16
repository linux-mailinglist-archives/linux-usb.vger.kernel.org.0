Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6490754E6F
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jul 2023 13:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjGPLQC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jul 2023 07:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjGPLQB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 07:16:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD5810DC
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 04:16:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBE1760C88
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 11:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40152C433C8
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 11:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689506159;
        bh=qGZXGcWDAsc20yiU4CrOmVB1c0HTDIRpuCakaz0E6Ow=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LP4kwsNpc1SyTPHH7mgFMajnaPaXW+akooULSEZZy89fNcM29PZTQsFSRsIsa5U9s
         kWQzeAkpLdJekyhjmOEMIIdy0Uwhf5U058MnGZDdSReOEkDzKx6BCzEvne6kI6j3tD
         drdN2N3HgY6+ygvUk002BXKQ2p9HZEA81+2La/EotL6WJLndTjaeaLd1q0zsXQuBzx
         /svimwxokXrC+MOFQtPOykeca1EEo7YynbI3RhBCEt5NAwc9zNfpiKxspT6zrvpUvl
         GvWa+gnYuBO/YvEzDEGS3Ei5lXAQmHlE3INUoz4oS7VhGwOuhrCEfxe1T0cVWBPOg/
         x3DA7CsvPyANQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 25A4BC53BCD; Sun, 16 Jul 2023 11:15:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217674] Thunderbolt dock does not recognize displays connected
 via DP->HDMI cable
Date:   Sun, 16 Jul 2023 11:15:58 +0000
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
Message-ID: <bug-217674-208809-HCmKZEPsTl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217674-208809@https.bugzilla.kernel.org/>
References: <bug-217674-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217674

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #3 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Andew Marshall from comment #0)
> Created attachment 304641 [details]
> lspci -v output
>=20
> Summary
> -------
>=20
> When using a thunderbolt dock with 2x DisplayPort connectors, the display=
ys
> are not recognized when connected with DP->HDMI cables. Connecting over
> DP->DP cables work as expected.
>=20
> Expected Behaviour
> ------------------
>=20
> Displays connected to the dock via DP->HDMI cables should be recognized.
>=20
> Actual Behaviour
> ----------------
>=20
> Displays connected to the dock via DP->HDMI cables are not recognized. The
> following messages are reported in `dmesg`
>=20
> ```
> [68022.156971] thunderbolt 0-2: new device found, vendor=3D0x6f device=3D=
0x12
> [68022.156977] thunderbolt 0-2: StarTech.com TB3CDK2DP
> ...various USB connection messages...
> [68139.834086] [drm] DMUB HPD callback: link_index=3D2
> [68139.834859] [drm] DPIA AUX failed on 0x0(1), error 3
> [68139.836167] [drm] DPIA AUX failed on 0x0(1), error 3
> (etc)
> ```
> USB ports and network connection functions as expected.
>=20
>=20
> Steps to Reproduce
> ------------------
>=20
> Laptop used is Asus G14 (2023) model GA402NV
> Dock is Startech TB3CDK2DP
> Reproduced on Linux Kernel 6.4.3 from stable repo
>=20
> 1. Connect laptop to dock over USB-C
> 2. Connect an external display with DP->HDMI cable
> 3. Open appropriate display settings to see if external display is
> recognized.

Do you have this issue on v6.1 stable series?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
