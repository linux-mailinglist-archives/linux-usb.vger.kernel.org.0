Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14B96B50C2
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 20:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjCJTM2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 14:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjCJTM0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 14:12:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5E611F2F5
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 11:12:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DF3761B8F
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 19:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0AA3C4339B
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 19:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678475544;
        bh=rQq4cxhZoafwfA7k8fITJlJhEuzdUCBmDkyHOezSYRA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NuojvMMNG8NsoA6hi2t9f/BP3muCtQVaoHZ9YbD3QfxdC45z2wpp8yxMB6Wxxd9K8
         ebj1lBmzvINBCz9sx0EzaRG/5eSVNxEq/wSLcloQ0v88sz8KCjULW6oEQ74GX5mFG9
         VLsJonyQWTUz+IgVVXIo4bM9/lgGLDlFVX4fIqpZvwBQb+3zcX+O1hrT4Kn9eyaTo8
         58oyIBHQsKMgIjOxwwnwhJOdLiyfp9nL7tpn1P7MTZgMHBg0MgPkmJ/3tV4GOotF/B
         854C1BSXDPgpA0ePXimOPumOkFbgBIHFMS9oVjr7an3o2Dgp0NyDcOux23KPkDVt76
         9j8FHIXu7GjDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8BD56C43141; Fri, 10 Mar 2023 19:12:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217174] Plugging in usb external drive, mount and umount causes
 kernel Oops
Date:   Fri, 10 Mar 2023 19:12:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: gjunk2@sapience.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217174-208809-YeWQ5XIp9O@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217174-208809@https.bugzilla.kernel.org/>
References: <bug-217174-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217174

Gene (gjunk2@sapience.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gjunk2@sapience.com

--- Comment #1 from Gene (gjunk2@sapience.com) ---
I had same problem while doing some lvm changes - trace simmilar happens in
6.2.3


 BUG: kernel NULL pointer dereference, address: 0000000000000028
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0=20
 Oops: 0000 [#1] PREEMPT SMP PTI
 CPU: 9 PID: 1118 Comm: lvcreate Tainted: G                T  6.2.3-1>
 Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./Z370 Ex>
 RIP: 0010:blk_throtl_update_limit_valid+0x1f/0x110
 Code: 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 49 89 fc>
 RSP: 0018:ffffb5fd01b47bb8 EFLAGS: 00010046
 RAX: 0000000000000000 RBX: ffff9d09040d8000 RCX: 0000000000000000
 RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
 RBP: ffffffff97b2f648 R08: 0000000000000000 R09: 0000000000000000
 R10: 0000000000000000 R11: 0000000000000000 R12: ffff9d090fce2c00
 R13: ffff9d090aedf060 R14: ffff9d090aedf1c8 R15: ffff9d090aedf0d8
 FS:  00007f3896fc7240(0000) GS:ffff9d109f040000(0000) knlGS:00000000>
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033=20
 CR2: 0000000000000028 CR3: 0000000111ce4003 CR4: 00000000003706e0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 Call Trace:
  <TASK>
  throtl_pd_offline+0x40/0x70
  blkcg_deactivate_policy+0xab/0x140
  ? __pfx_dev_remove+0x10/0x10 [dm_mod]
  blk_throtl_exit+0x45/0x80
  disk_release+0x4a/0xf0
  device_release+0x34/0x90
  kobject_put+0x97/0x1d0
  cleanup_mapped_device+0xe0/0x170 [dm_mod]
  __dm_destroy+0x120/0x1e0 [dm_mod]
  dev_remove+0x11b/0x190 [dm_mod]
  ctl_ioctl+0x302/0x5b0 [dm_mod]
  dm_ctl_ioctl+0xe/0x20 [dm_mod]
  __x64_sys_ioctl+0x9c/0xe0
  do_syscall_64+0x5c/0x90
  entry_SYSCALL_64_after_hwframe+0x72/0xdc
 RIP: 0033:0x7f389745653f
 Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48>
 RSP: 002b:00007ffe5499e4f0 EFLAGS: 00000246 ORIG_RAX: 00000000000000>
 RAX: ffffffffffffffda RBX: 000055d198c3bec0 RCX: 00007f389745653f
 RDX: 000055d1994501b0 RSI: 00000000c138fd04 RDI: 0000000000000003
 RBP: 0000000000000006 R08: 000055d197547088 R09: 00007ffe5499e3a0
 R10: 0000000000000000 R11: 0000000000000246 R12: 000055d1974d10d6
 R13: 000055d199450260 R14: 000055d1974d10c7 R15: 000055d197545bbb
  </TASK>
 Modules linked in: dm_cache_smq dm_cache dm_persistent_data dm_bio_p>
  soundcore pcspkr intel_wmi_thunderbolt i2c_smbus mei sysimgblt inpu>
 CR2: 0000000000000028
 ---[ end trace 0000000000000000 ]---
 RIP: 0010:blk_throtl_update_limit_valid+0x1f/0x110
 Code: 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 49 89 fc>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
