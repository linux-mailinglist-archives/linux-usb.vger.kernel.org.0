Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93B5B76B280
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 13:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbjHALCB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 07:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbjHALBV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 07:01:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0406E5FFC
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 03:55:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D14E061531
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E015C433C9
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 10:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690887351;
        bh=RHAd5LP6OhnNqh2/6+0WZC1d0hZzHs7HoxfKDD3uoPU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kuNI99VrslDRT44GOa0kPYl8g9SF6fmlmmuumjZg8utQ7ta96slIT/yJc6dQ+llpO
         UFnLBBp13fhTntNRz5NjTOE4c1GQv9NzqlWkbrSQEnxR6Vg03qTR1nJ9gxOmDsb5QW
         mlhNILA7oOfyvuEKF+gvFyY8I7dK6YssNFnTh7pH7QFrp7B7/OH1nCDJCM6+vaHRS5
         9UvhS3aqm24YaBthxPm77ssUk57+RO6tyhBb1Jt9XxpiU0Mj0KIlccVCgNse1vT3/9
         7ycXjuRI48wTim1y3Q2+3wOgqLJZg89W8Q4/NKKQQ1d25eupX+QeM1QofRHDr01BYw
         CaD5lD6UsoLRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 28C31C53BD0; Tue,  1 Aug 2023 10:55:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217744] Resume: "usb usb2-port3: Cannot enable. Maybe the USB
 cable is bad?" Tiger Lake-LP Thunderbolt 4 [8086:9a13]
Date:   Tue, 01 Aug 2023 10:55:50 +0000
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
Message-ID: <bug-217744-208809-HtgdJEQK18@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217744-208809@https.bugzilla.kernel.org/>
References: <bug-217744-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217744

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #3 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to TJ from comment #0)
> Created attachment 304746 [details]
> kernel log v6.5-rc4
>=20
> On resume from suspend, since at least v6.1 and including v6.5-rc4 - an
> external USB Ethernet device fails to resume due to:
>=20
> usb usb2-port3: Cannot enable. Maybe the USB cable is bad?
>=20
> Linux version 6.5.0-rc4+debian+tj (root@linux-builder) (gcc (Debian
> 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #67 SMP
> PREEMPT_DYNAMIC Mon Jul 31 22:25:03 BST 2023
>=20
> DMI: LENOVO 20W6001WUS/20W6001WUS, BIOS N34ET53W (1.53 ) 08/31/2022
>=20
> The affected owner (nickname 'Chosen_') and myself worked in Matrix Linux
> room to narrow down the cause by building and testing v6.5-rc4 when the
> Debian distro v6.1 showed the problem. There is no difference in the
> symptoms or the kernel messages between the versions.
>=20
> Attached is the kernel log, `lspci -nnk` and `lsusb -vt`. The device is:
>=20
> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
>     |__ Port 3: Dev 5, If 0, Class=3DHub, Driver=3Dhub/4p, 10000M
>         ID 17ef:30ab Lenovo=20
>         |__ Port 1: Dev 6, If 0, Class=3DVendor Specific Class, Driver=3D=
r8152,
> 5000M
>             ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit
> Ethernet Adapter
>         |__ Port 3: Dev 7, If 0, Class=3DHub, Driver=3Dhub/4p, 10000M
>             ID 17ef:30ad Lenovo=20
>=20
> Which seems to be connected via the host controller on
>=20
> 00:0d.0 USB controller [0c03]: Intel Corporation Tiger Lake-LP Thunderbol=
t 4
> USB Controller [8086:9a13] (rev 01)
>         Subsystem: Lenovo Tiger Lake-LP Thunderbolt 4 USB Controller
> [17aa:22c9]
>         Kernel driver in use: xhci_hcd

Does v6.0 not have this issue? Or is it hardware issue too?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
