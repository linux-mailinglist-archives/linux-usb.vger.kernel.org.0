Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542AA64C500
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 09:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237531AbiLNIZa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 03:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236681AbiLNIZ3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 03:25:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E431BE3
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 00:25:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D97461842
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 08:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07B55C433F0
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671006328;
        bh=QfZoDmuoVtzTLHra4eh1/0prvaVXsAV+saOAo/WBgvw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bWfTjFwxQgvuTSt8wlviUT+Rs3wxITQD8nCiC8iu5IAnTVVEWQZmHC/s5o5V32qqR
         fYLDExwxmC8HkLWtRBy8gRrolBbFH7yinyMPwAMbUnlORPgtAeilQB1+t8Gptxxhbs
         s5+hjgsIafMPu7EogX/fmEvgI4KWUAV05hKBxednSLAvKE9lDMTWCMnegxd2vflkaz
         +SJYHUqV2y7IQEZW0R8XoCQNq1j5iDRp8sKnbWwQZSoO5egNQAuhpRsUpIurakd4Xu
         Fp332ergDEyTstSZgc0MYtCk48zfF9E6/U8cro2BMx/a2w99EqDL4kR5oPTeF3XAGr
         pbRWvYTdjpXeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AE70AC43143; Wed, 14 Dec 2022 08:25:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 14 Dec 2022 08:25:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-fLO3TVEBC1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #18 from Chris Chiu (chris.chiu@canonical.com) ---
ODM claims they can still reproduce even with the "Wake on Dell USB-C dock"
disabled in BIOS.
And they still see the power transition problem in dmesg of the fail case

[  330.481613] ACPI: EC: interrupt unblocked
[  332.132772] xhci_hcd 0000:38:00.0: can't change power state from D3cold =
to
D0 (config space inaccessible)
[  332.203642] xhci_hcd 0000:38:00.0: can't change power state from D3cold =
to
D0 (config space inaccessible)
[  332.203652] xhci_hcd 0000:38:00.0: Controller not ready at resume -19
[  332.203654] xhci_hcd 0000:38:00.0: PCI post-resume error -19!
[  332.203655] xhci_hcd 0000:38:00.0: HC died; cleaning up
[  332.203658] PM: dpm_run_callback(): pci_pm_resume+0x0/0x100 returns -19
[  332.203664] xhci_hcd 0000:38:00.0: PM: failed to resume async: error -19
[  332.210099] nvme nvme0: 8/0/0 default/read/poll queues
[  332.439757] OOM killer enabled.
[  332.439759] Restarting tasks ...

Do I need to turn on the ACPI log for the power transition problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
