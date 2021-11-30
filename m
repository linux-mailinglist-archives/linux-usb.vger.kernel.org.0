Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA1F4636B1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 15:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242206AbhK3Oed (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 09:34:33 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37300 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242199AbhK3Oec (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 09:34:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A74B5B819D9
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55907C53FC1
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638282671;
        bh=Uc7qI4t2NpKMqYFK/DuDzYYWmJ6REC+oYcYx9pwTcO0=;
        h=From:To:Subject:Date:From;
        b=hTmXXZL2C0YXa7kCtDnXGnAT7OsEfUmoeYaiDAHVJ8u0b8NRz3V03x6ZlQ7U8920d
         pNuT2YWHdAHX4/3ZTAFJHVODvPfBhli4NGRpXhtZvxhB6c2Uka82Jx9dCyLc1aO9N3
         zOVvkXHL/0Amnd4ViOQdO1HUwS6GA+dkU5F2su5JkJo4YtdiUr+uVFwKpt6An8B1Ug
         T3iPPhKMg8NB/bS2JVtH+M6g5z/1j3rgXOscNewsMEnjZJlKKDPwJg1qNC0EpLCTi4
         6RwNiKsyhfZt1pAi/aAvRCxbagjDNlrPiSOwt68fJ3b0YxJ4rTBVC1SleDcRjMJPS8
         U/bPKOf1tO8pg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2D2B360F3A; Tue, 30 Nov 2021 14:31:11 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215175] New: thunderbolt: consistent system freezes with Dell
 U4021QW, general protection fault, probably for non-canonical address
 0xdead000000000108, Workqueue: events tb_cfg_request_work [thunderbolt]
Date:   Tue, 30 Nov 2021 14:31:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leho@kraav.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215175-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215175

            Bug ID: 215175
           Summary: thunderbolt: consistent system freezes with Dell
                    U4021QW, general protection fault, probably for
                    non-canonical address 0xdead000000000108, Workqueue:
                    events tb_cfg_request_work [thunderbolt]
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: leho@kraav.com
        Regression: No

I haven't been able to identify any specific pattern to reproduce it. After=
 a
while into any given session connected to this DELL U4021QW 5k2k monitor, G=
PF
is triggered, soon hanging all operations and requiring a full reboot. Any
thoughts on what to try or test here would be very welcome, as this is a
show-stopper for work.

Context: machine otherwise works perfectly fine on various USB-C monitors, =
like
DELL U4320Q and U4919DW, which otoh might not have relevance to these latest
uberpowered Thunderbolt screens like U4021QW.

nov   30 14:13:24 papaya syncthing[1559]: ...
nov   30 14:18:09 papaya kernel: general protection fault, probably for
non-canonical address 0xdead000000000108: 0000 [#1] PREEMPT SMP NOPTI
nov   30 14:18:09 papaya kernel: CPU: 0 PID: 95013 Comm: kworker/0:4 Not
tainted 5.15.5-gentoo+ #52
nov   30 14:18:09 papaya kernel: Hardware name: Dell Inc. XPS 13 7390
2-in-1/06CDVY, BIOS 1.11.0 10/07/2021
nov   30 14:18:09 papaya kernel: Workqueue: events tb_cfg_request_work
[thunderbolt]
nov   30 14:18:09 papaya kernel: RIP: 0010:tb_cfg_request_dequeue+0x23/0x80
[thunderbolt]
nov   30 14:18:09 papaya kernel: Code: 00 00 00 00 00 66 90 55 53 48 89 fb =
48
8b 47 08 48 8d 68 70 48 89 ef e8 1b fd 10 df 48 8b 83 b0 00 00 00 48 8b 93 =
a8
00 00 00 <48> 89 42 08 48 89 10 48 >
nov   30 14:18:09 papaya kernel: RSP: 0018:ffff9187c5b13e80 EFLAGS: 00010246
nov   30 14:18:09 papaya kernel: RAX: dead000000000122 RBX: ffff88e583a50180
RCX: ffff88e5ef6296a0
nov   30 14:18:09 papaya kernel: RDX: dead000000000100 RSI: 807fffffffffffff
RDI: ffff88de8b9d5070
nov   30 14:18:09 papaya kernel: RBP: ffff88de8b9d5070 R08: ffff88de80058eb0
R09: 0000000000000018
nov   30 14:18:09 papaya kernel: R10: 0000000000000018 R11: fefefefefefefeff
R12: ffff88e5ef629680
nov   30 14:18:09 papaya kernel: R13: ffff88e5ef62d800 R14: 0000000000000000
R15: ffff88e5ef62d815
nov   30 14:18:09 papaya kernel: FS:  0000000000000000(0000)
GS:ffff88e5ef600000(0000) knlGS:0000000000000000
nov   30 14:18:09 papaya kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
nov   30 14:18:09 papaya kernel: CR2: 00000958b0a8e000 CR3: 000000016b71a001
CR4: 0000000000770ef0
nov   30 14:18:09 papaya kernel: PKRU: 55555554
nov   30 14:18:09 papaya kernel: Call Trace:
nov   30 14:18:09 papaya kernel:  <TASK>
nov   30 14:18:09 papaya kernel:  tb_cfg_request_work+0x25/0x30 [thunderbol=
t]
nov   30 14:18:09 papaya kernel:  process_one_work+0x1be/0x3d0
nov   30 14:18:09 papaya kernel:  worker_thread+0x48/0x3d0
nov   30 14:18:09 papaya kernel:  ? rescuer_thread+0x360/0x360
nov   30 14:18:09 papaya kernel:  kthread+0x12a/0x160
nov   30 14:18:09 papaya kernel:  ? set_kthread_struct+0x40/0x40
nov   30 14:18:09 papaya kernel:  ret_from_fork+0x1f/0x30
nov   30 14:18:09 papaya kernel:  </TASK>
nov   30 14:18:09 papaya kernel: Modules linked in: wireguard curve25519_x8=
6_64
libchacha20poly1305 chacha_x86_64 libchacha poly1305_x86_64 libblake2s
blake2s_x86_64 libblake2s_generic libcur>
nov   30 14:18:09 papaya kernel:  mac80211 libarc4 snd_hda_intel
snd_intel_dspcfg btusb btrtl i2c_i801 snd_hda_codec btbcm i2c_smbus btintel
snd_hda_core iwlwifi snd_pcm bluetooth snd_timer i>
nov   30 14:18:09 papaya kernel:  crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel aesni_intel crypto_simd i915 i2c_algo_bit intel_gtt ttm
drm_kms_helper cfbfillrect syscopyarea>
nov   30 14:18:09 papaya kernel: ---[ end trace 446fa67136e501af ]---
nov   30 14:18:09 papaya kernel: ------------[ cut here ]------------
nov   30 14:18:09 papaya kernel: Voluntary context switch within RCU read-s=
ide
critical section!
nov   30 14:18:09 papaya kernel: WARNING: CPU: 0 PID: 95013 at
kernel/rcu/tree_plugin.h:316 rcu_note_context_switch+0x442/0x4a0
nov   30 14:18:09 papaya kernel: Modules linked in: wireguard curve25519_x8=
6_64
libchacha20poly1305 chacha_x86_64 libchacha poly1305_x86_64 libblake2s
blake2s_x86_64 libblake2s_generic libcur>
nov   30 14:18:09 papaya kernel:  mac80211 libarc4 snd_hda_intel
snd_intel_dspcfg btusb btrtl i2c_i801 snd_hda_codec btbcm i2c_smbus btintel
snd_hda_core iwlwifi snd_pcm bluetooth snd_timer i>nov   30 14:18:09 papaya
kernel:  crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel
aesni_intel crypto_simd i915 i2c_algo_bit intel_gtt ttm drm_kms_helper
cfbfillrect syscopyarea>
nov   30 14:18:09 papaya kernel: CPU: 0 PID: 95013 Comm: kworker/0:4 Tainte=
d: G
     D           5.15.5-gentoo+ #52
nov   30 14:18:09 papaya kernel: Hardware name: Dell Inc. XPS 13 7390
2-in-1/06CDVY, BIOS 1.11.0 10/07/2021
nov   30 14:18:09 papaya kernel: Workqueue: events tb_cfg_request_work
[thunderbolt]
nov   30 14:18:09 papaya kernel: RIP: 0010:rcu_note_context_switch+0x442/0x=
4a0
nov   30 14:18:09 papaya kernel: Code: 89 91 98 03 00 00 48 89 32 e9 02 fe =
ff
ff 48 8b 95 a8 00 00 00 eb da 48 c7 c7 30 2c f9 9f c6 05 d6 19 31 01 01 e8 =
71
32 81 00 <0f> 0b e9 0b fc ff ff c6 >
nov   30 14:18:09 papaya kernel: RSP: 0018:ffff9187c5b138a8 EFLAGS: 00010086
nov   30 14:18:09 papaya kernel: RAX: 0000000000000000 RBX: ffff88e5ef62a9c0
RCX: ffff88e5ef61b558
nov   30 14:18:09 papaya kernel: RDX: 00000000ffffffd8 RSI: 0000000000000027
RDI: ffff88e5ef61b550
nov   30 14:18:09 papaya kernel: RBP: ffff9187c5b13968 R08: ffffffffa03220e8
R09: 00000000ffffdfff
nov   30 14:18:09 papaya kernel: R10: ffffffffa02ff1f8 R11: ffffffffa0242100
R12: 0000000000000000
nov   30 14:18:09 papaya kernel: R13: ffff88e06fe00000 R14: ffff88e5ef629d00
R15: ffff88de87bdb000
nov   30 14:18:09 papaya kernel: FS:  0000000000000000(0000)
GS:ffff88e5ef600000(0000) knlGS:0000000000000000
nov   30 14:18:09 papaya kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
nov   30 14:18:09 papaya kernel: CR2: 00000958b0a8e000 CR3: 000000016b71a001
CR4: 0000000000770ef0
nov   30 14:18:09 papaya kernel: PKRU: 55555554
nov   30 14:18:09 papaya kernel: Call Trace:
nov   30 14:18:09 papaya kernel:  <TASK>
nov   30 14:18:09 papaya kernel:  __schedule+0x6d/0x1380
nov   30 14:18:09 papaya kernel:  ? symbol_string+0x97/0x130
nov   30 14:18:09 papaya kernel:  ? enqueue_task_fair+0x183/0x5e0
nov   30 14:18:09 papaya kernel:  schedule+0x54/0xc0
nov   30 14:18:09 papaya kernel:  schedule_timeout+0xca/0x160
nov   30 14:18:09 papaya kernel:  wait_for_completion+0x84/0xe0
nov   30 14:18:09 papaya kernel:  virt_efi_query_variable_info+0x13c/0x150
nov   30 14:18:09 papaya kernel:  efi_query_variable_store+0x47/0x180
nov   30 14:18:09 papaya kernel:  efivar_entry_set_safe+0xb5/0x210
nov   30 14:18:09 papaya kernel:  efi_pstore_write+0x13a/0x1a0
nov   30 14:18:09 papaya kernel:  pstore_dump+0x178/0x350
nov   30 14:18:09 papaya kernel:  kmsg_dump+0x3e/0x60
nov   30 14:18:09 papaya kernel:  oops_end+0x41/0x90
nov   30 14:18:09 papaya kernel:  exc_general_protection+0x1a5/0x330
nov   30 14:18:09 papaya kernel:  asm_exc_general_protection+0x1e/0x30
nov   30 14:18:09 papaya kernel: RIP: 0010:tb_cfg_request_dequeue+0x23/0x80
[thunderbolt]
nov   30 14:18:09 papaya kernel: Code: 00 00 00 00 00 66 90 55 53 48 89 fb =
48
8b 47 08 48 8d 68 70 48 89 ef e8 1b fd 10 df 48 8b 83 b0 00 00 00 48 8b 93 =
a8
00 00 00 <48> 89 42 08 48 89 10 48 >
nov   30 14:18:09 papaya kernel: RSP: 0018:ffff9187c5b13e80 EFLAGS: 00010246
nov   30 14:18:09 papaya kernel: RAX: dead000000000122 RBX: ffff88e583a50180
RCX: ffff88e5ef6296a0
nov   30 14:18:09 papaya kernel: RDX: dead000000000100 RSI: 807fffffffffffff
RDI: ffff88de8b9d5070
nov   30 14:18:09 papaya kernel: RBP: ffff88de8b9d5070 R08: ffff88de80058eb0
R09: 0000000000000018
nov   30 14:18:09 papaya kernel: R10: 0000000000000018 R11: fefefefefefefeff
R12: ffff88e5ef629680
nov   30 14:18:09 papaya kernel: R13: ffff88e5ef62d800 R14: 0000000000000000
R15: ffff88e5ef62d815
nov   30 14:18:09 papaya kernel:  tb_cfg_request_work+0x25/0x30 [thunderbol=
t]
nov   30 14:18:09 papaya kernel:  process_one_work+0x1be/0x3d0
nov   30 14:18:09 papaya kernel:  worker_thread+0x48/0x3d0
nov   30 14:18:09 papaya kernel:  ? rescuer_thread+0x360/0x360
nov   30 14:18:09 papaya kernel:  kthread+0x12a/0x160
nov   30 14:18:09 papaya kernel:  ? set_kthread_struct+0x40/0x40
nov   30 14:18:09 papaya kernel:  ret_from_fork+0x1f/0x30
nov   30 14:18:09 papaya kernel:  </TASK>
nov   30 14:18:09 papaya kernel: ---[ end trace 446fa67136e501b0 ]---
nov   30 14:18:11 papaya kernel: RIP: 0010:tb_cfg_request_dequeue+0x23/0x80
[thunderbolt]
nov   30 14:18:11 papaya kernel: Code: 00 00 00 00 00 66 90 55 53 48 89 fb =
48
8b 47 08 48 8d 68 70 48 89 ef e8 1b fd 10 df 48 8b 83 b0 00 00 00 48 8b 93 =
a8
00 00 00 <48> 89 42 08 48 89 10 48 >
nov   30 14:18:11 papaya kernel: RSP: 0018:ffff9187c5b13e80 EFLAGS: 00010246
nov   30 14:18:11 papaya kernel: RAX: dead000000000122 RBX: ffff88e583a50180
RCX: ffff88e5ef6296a0
nov   30 14:18:11 papaya kernel: RDX: dead000000000100 RSI: 807fffffffffffff
RDI: ffff88de8b9d5070
nov   30 14:18:11 papaya kernel: RBP: ffff88de8b9d5070 R08: ffff88de80058eb0
R09: 0000000000000018
nov   30 14:18:11 papaya kernel: R10: 0000000000000018 R11: fefefefefefefeff
R12: ffff88e5ef629680
nov   30 14:18:11 papaya kernel: R13: ffff88e5ef62d800 R14: 0000000000000000
R15: ffff88e5ef62d815
nov   30 14:18:11 papaya kernel: FS:  0000000000000000(0000)
GS:ffff88e5ef600000(0000) knlGS:0000000000000000
nov   30 14:18:11 papaya kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
nov   30 14:18:11 papaya kernel: CR2: 00007fa284aae000 CR3: 0000000169f5e006
CR4: 0000000000770ef0
nov   30 14:18:11 papaya kernel: PKRU: 55555554
nov   30 14:18:32 papaya gnome-shell[1643]: ...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
