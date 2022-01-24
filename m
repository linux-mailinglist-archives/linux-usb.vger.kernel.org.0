Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAF449AAAC
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 05:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350930AbiAYDot (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 22:44:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3414978AbiAYAyv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 19:54:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D6AC095436
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 14:37:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 286A5B81255
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 22:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6076C340E5
        for <linux-usb@vger.kernel.org>; Mon, 24 Jan 2022 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643063862;
        bh=dPC/wnagXgx2586ZCqthw2ps4345tZlVTGn2+/E4sJ0=;
        h=From:To:Subject:Date:From;
        b=FMUrWQt+Nk72iAPAQ96fxR2UNPcX3DBCx42pHjFKU6nv40MFs51gGyiqaF5GC/u/P
         VqF8Yqw8Kprm2bPR961FbTt1qw9HLdej+lp0Y5vqVIJ8SY/ynK04cJC9VJefW/3M2k
         aPNPwnAM4pKa7tI2BdMRjhPq15lWuI5B9rMX8k7Ts+ADoYFRSAEUd8b8PowzpWS/nH
         RpsJeHHjuX0r7bzojWsJag5MPniIquuae8WBxzirZ2Qal1qOjQJqf2J+qM/74ONrGI
         8UrccubewcXXTyw/kMo5ubsay2tC34u9oT2khO5mquv6vOve8gkzOEVZzZo/Vju85Y
         +X0OZt6mhYbSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B2894CC13B0; Mon, 24 Jan 2022 22:37:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215529] New: REGRESSION kernel NULL pointer crash in
 typec_link_ports
Date:   Mon, 24 Jan 2022 22:37:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lenb@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215529-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215529

            Bug ID: 215529
           Summary: REGRESSION kernel NULL pointer crash in
                    typec_link_ports
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17.0-rc1-00032-gdd81e1c7d5fb
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: lenb@kernel.org
        Regression: No

Created attachment 300311
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300311&action=3Dedit
typec patch from lkml that does NOT help

Booting 5.17-rc1 (plus a couple of commits) fails on two of my systems,

Dell XPS 13 9360 (FWIW, Linux Torvalds has one of these)
Dell XPS 13 9310 (Intel's latest Tiger Lake system)

[    2.965017] ath11k_pci 0000:72:00.0 wlp114s0: renamed from wlan0
[    3.046448] systemd-journald[302]: File
/var/log/journal/5ce4de201d294a6db31ace17ae52adb8/user-1000.journal corrupt=
ed
or uncleanly shut down, renaming and replacing.
[    3.111468] BUG: kernel NULL pointer dereference, address: 0000000000000=
008
[    3.111472] #PF: supervisor read access in kernel mode
[    3.111474] #PF: error_code(0x0000) - not-present page
[    3.111475] PGD 0 P4D 0
[    3.111477] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    3.111479] CPU: 4 PID: 314 Comm: kworker/4:2 Not tainted
5.17.0-rc1-00032-gdd81e1c7d5fb-dirty #10
[    3.111481] Hardware name: Dell Inc. XPS 13 9310/0202R4, BIOS 3.2.0
09/30/2021
[    3.111483] Workqueue: events_long ucsi_init_work [typec_ucsi]
[    3.111489] RIP: 0010:component_master_add_with_match+0x19/0x100
[    3.111494] Code: 5b 41 5c 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f =
1f
44 00 00 55 48 89 e5 41 56 49 89 fe 41 55 49 89 d5 41 54 53 48 89 f3 <48> 8=
b 72
08 48 3b 32 74 10 48 89 d7 e8 06 fd ff ff 85 c0 0f 85 a0
[    3.111496] RSP: 0018:ffffb26080a57d88 EFLAGS: 00010296
[    3.111498] RAX: 0000000000000000 RBX: ffffffffc03dea30 RCX:
0000000000000000
[    3.111499] RDX: 0000000000000000 RSI: ffffffffc03dea30 RDI:
ffff932988db7808
[    3.111500] RBP: ffffb26080a57da8 R08: ffff9329802aaaa0 R09:
ffff932981f8f030
[    3.111502] R10: ffff93299e85b000 R11: 0000000000000000 R12:
ffff932988db7800
[    3.111503] R13: 0000000000000000 R14: ffff932988db7808 R15:
ffff932988db7808
[    3.111504] FS:  0000000000000000(0000) GS:ffff9330ef700000(0000)
knlGS:0000000000000000
[    3.111505] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.111507] CR2: 0000000000000008 CR3: 0000000256e10002 CR4:
0000000000770ee0
[    3.111508] PKRU: 55555554
[    3.111509] Call Trace:
[    3.111511]  <TASK>
[    3.111514]  typec_link_ports+0x6f/0x90 [typec]
[    3.111520]  typec_register_port+0x1d4/0x2d0 [typec]
[    3.111525]  ucsi_init_work+0x401/0x720 [typec_ucsi]
[    3.111529]  process_one_work+0x21a/0x3f0
[    3.111533]  worker_thread+0x50/0x3d0
[    3.111535]  ? rescuer_thread+0x360/0x360
[    3.111537]  kthread+0xfa/0x120
[    3.111539]  ? kthread_complete_and_exit+0x20/0x20
[    3.111541]  ret_from_fork+0x1f/0x30
[    3.111545]  </TASK>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
