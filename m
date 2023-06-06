Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167B7723BE8
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jun 2023 10:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236775AbjFFIem (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jun 2023 04:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbjFFIec (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Jun 2023 04:34:32 -0400
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B593E67
        for <linux-usb@vger.kernel.org>; Tue,  6 Jun 2023 01:34:06 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by a.mx.secunet.com (Postfix) with ESMTP id 63E75204D9;
        Tue,  6 Jun 2023 10:33:47 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
        by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EQbJuAJYgQ54; Tue,  6 Jun 2023 10:33:39 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by a.mx.secunet.com (Postfix) with ESMTPS id 64FB62008D;
        Tue,  6 Jun 2023 10:33:39 +0200 (CEST)
Received: from cas-essen-02.secunet.de (unknown [10.53.40.202])
        by mailout2.secunet.com (Postfix) with ESMTP id 5E03680004A;
        Tue,  6 Jun 2023 10:33:39 +0200 (CEST)
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 10:33:39 +0200
Received: from [10.36.110.53] (10.36.110.53) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 6 Jun
 2023 10:33:38 +0200
To:     Mario Limonciello <mario.limonciello@amd.com>
CC:     <linux-usb@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
From:   Torsten Hilbrich <torsten.hilbrich@secunet.com>
Autocrypt: addr=torsten.hilbrich@secunet.com; prefer-encrypt=mutual; keydata=
 mQENBFs5uIIBCAD4qbEieyT7sBmcro1VrCE1sSnV29a9ub8c0Xj0yw0Cz2N7LalBn4a+YeJN
 OMfL1MQvEiTxZNIzb1I0bRYcfhkhjN4+vAoPJ3q1OpSY+WUgphUbzseUk/Bq3gwvfa6/U+Hm
 o2lvEfN2dewBGptQ+DrWz+SPM1TQiwShKjowY/avaVgrABBGen3LgB0XZXEH8Q720kjP7htK
 tCGRt1T+qNIj3tZDZfPkqEVb8lTRcyn1hI3/FbDTysletRrCmkHSVbnxNzO6lw2G1H61wQhw
 YVbIVNohY61ieSJFhNLL6/UTGHtUE2IAicnsUAUKR8GiI1+3cTf233O5HaWYeOjBmTCLABEB
 AAG0L1RvcnN0ZW4gSGlsYnJpY2ggPHRvcnN0ZW4uaGlsYnJpY2hAc2VjdW5ldC5jb20+iQE3
 BBMBCAAhBQJbObiCAhsDBQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEJ7rXZh78/h8+tIH
 +QFYRQH4qh3WagcmjbG/zCe2RmZZePO8bmut2fAxY04aqJZGYUBxb5lfaWaHkstqM5sFD8Jo
 k1j5E7f1cnfwB21azdUO8fzYL889kdVOzatdT/uTjR7OjR59gpJMd4lx7fwFuZUg8z6rfWJ3
 ImjxxBgaJRL6pqaZ9lOst82O0qJKEFBR+HDUVvgh4n8TTOfKNv/dGPQhaed+2or98asdYRWo
 S/zc4ltTh4SxZjLd98pDxjlUyOJoMJeWdlMmLgWV3h1qjy4DxgQzvgATEaKjOuwtkCOcwHn7
 Unf0F2V9p4O7NFOuoVyqTBRX+5xKgzSM7VP1RlTT4FA9/7wkhhG+FEK5AQ0EWzm4ggEIAL9F
 IIPQYMx5x+zMjm8lDsmh12zoqCtMfn9QWrERd2gDS3GsORbe/i6DhYvzsulH8vsviPle4ocU
 +PaTwadfnEqm0FS7xCONYookDGfAiPS4cHWX7WrTNBP7mK3Gl1KaAOJJsMbCVAA9q4d8WL+A
 e+XrfOAetZq5gxLxDMYySNI1pIMJVrGECiboLa/LPPh2yw4jieAedW96CPuZs7rUY/5uIVt0
 Dn4/aSzV+Ixr52Z2McvNmH/VxDt59Z6jBztZIJBXpX3BC/UyH7rJOJTaqEF+EVWEpOmSoZ6u
 i1DWyqOBKnQrbUa0fpNd3aaOl2KnlgTH9upm70XZGpeJik/pQGcAEQEAAYkBHwQYAQgACQUC
 Wzm4ggIbDAAKCRCe612Ye/P4fEzqB/9gcM/bODO8o9YR86BLp0S8bF73lwIJyDHg5brjqAnz
 CtCdb4I+evI4iyU9zuN1x4V+Te5ej+mUu5CbIte8gQbo4cc9sbe/AEDoOh0lGoXKZiwtHqoh
 RZ4jOFrZJsEjOSUCLE8E8VR1afPf0SkFXLXWZfZDU28K80JWeV1BCtxutZ39bz6ybMbcCvMS
 UfwCTY0IJOiDga1K4H2HzHAqlvfzCurqe616S4S1ax+erg3KTEXylxmzcFjJU8AUZURy/lQt
 VElzs4Km1p3v6GUciCAb+Uhd12sQG2mL05jmEems9uRe3Wfke/RKp8A+Yq+p6E0A0ZOP+Okm
 LXB2q+ckPvZG
Subject: [thunderbolt] Regression in v6.1.30, WARNING accessing sysfs boot_acl
Message-ID: <e28465d5-95a3-d08f-3baa-fa7c6cba4a6c@secunet.com>
Date:   Tue, 6 Jun 2023 10:33:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
        boundary="------------E7E2330BF4D1B66328460ECA"
Content-Language: en-US
X-ClientProxiedBy: cas-essen-02.secunet.de (10.53.40.202) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,LOTS_OF_MONEY,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------E7E2330BF4D1B66328460ECA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello,

v6.1.31 added the following commit:

commit e16629c639d429e48c849808e59f1efcce886849
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Mon Apr 24 14:55:54 2023 -0500

    thunderbolt: Clear registers properly when auto clear isn't in use
    
    commit c4af8e3fecd03b0aedcd38145955605cfebe7e3a upstream.

This introduced a regression on some of our systems (Lenovo T490, T14G1) where a sysfs file boot_acl is found in the system.

The T14G1 has the following BIOS settings regarding thunderbolt:

ThunderboltSecurityLevel=UserAuthorization
PreBootForThunderboltDevice=Disable
ThunderboltAccess=Enable
ThunderboltBIOSAssistMode=Disable

On this system reading the boot_acl file (e.g., find /sys -name boot_acl |xargs cat) causes the following kernel warning:

[   33.245866] ------------[ cut here ]------------
[   33.245868] thunderbolt 0000:05:00.0: interrupt for TX ring 0 is already enabled
[   33.245880] WARNING: CPU: 3 PID: 259 at drivers/thunderbolt/nhi.c:137 ring_interrupt_active+0x244/0x2d0
[   33.245886] Modules linked in: dm_mod pinctrl_cannonlake pinctrl_intel intel_hid
[   33.245890] CPU: 3 PID: 259 Comm: cat Not tainted 6.1.31+ #1
[   33.245892] Hardware name: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S (3.14 ) 10/10/2020
[   33.245893] RIP: 0010:ring_interrupt_active+0x244/0x2d0
[   33.245896] Code: 08 44 89 04 24 e8 0c 8a cf ff 4c 8b 4c 24 08 44 8b 04 24 4c 89 f2 48 8b 4c 24 10 48 89 c6 48 c7 c7 50 f1 f5 95 e8 fc 74 5a ff <0f> 0b 44 8b 5c 24 04 49 8b 47 08 40 84 ed 0f 85 e9 fe ff ff f6 40
[   33.245898] RSP: 0018:ffff936e01a9fba8 EFLAGS: 00010082
[   33.245899] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   33.245900] RDX: 0000000000000004 RSI: 00000000ffffffea RDI: 00000000ffffffff
[   33.245901] RBP: 0000000000000001 R08: ffffffff9694f948 R09: 000000000004fffb
[   33.245902] R10: 0000000000000457 R11: ffffffff967cf960 R12: 0000000000000001
[   33.245903] R13: 0000000000038200 R14: ffff8f740d2ffd90 R15: ffff8f740e581cc0
[   33.245905] FS:  00007f0dbd110540(0000) GS:ffff8f7b3e8c0000(0000) knlGS:0000000000000000
[   33.245906] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.245907] CR2: 00007f0dbc815000 CR3: 000000010ec1e005 CR4: 00000000003706e0
[   33.245909] Call Trace:
[   33.245910]  <TASK>
[   33.245912]  ? __warn+0x79/0xc0
[   33.245915]  ? ring_interrupt_active+0x244/0x2d0
[   33.245916]  ? report_bug+0xee/0x170
[   33.245920]  ? handle_bug+0x3c/0x70
[   33.245922]  ? exc_invalid_op+0x14/0x70
[   33.245924]  ? asm_exc_invalid_op+0x16/0x20
[   33.245928]  ? ring_interrupt_active+0x244/0x2d0
[   33.245929]  ? ring_interrupt_active+0x244/0x2d0
[   33.245931]  tb_ring_start+0x14e/0x300
[   33.245933]  tb_ctl_start+0x22/0xa0
[   33.245936]  ? pci_add_dynid+0xe0/0xe0
[   33.245938]  tb_domain_runtime_resume+0x15/0x40
[   33.245941]  __rpm_callback+0x41/0x120
[   33.245943]  ? pci_add_dynid+0xe0/0xe0
[   33.245944]  rpm_callback+0x5d/0x70
[   33.245946]  rpm_resume+0x58c/0x7e0
[   33.245947]  ? _raw_spin_unlock_irqrestore+0x20/0x40
[   33.245949]  ? get_page_from_freelist+0xb40/0xc70
[   33.245953]  rpm_resume+0x255/0x7e0
[   33.245954]  ? __kmem_cache_alloc_node+0xbc/0x150
[   33.245957]  __pm_runtime_resume+0x4a/0x80
[   33.245959]  boot_acl_show+0x5f/0x1b0
[   33.245961]  dev_attr_show+0x16/0x40
[   33.245964]  sysfs_kf_seq_show+0xa9/0xe0
[   33.245967]  seq_read_iter+0x10c/0x490
[   33.245971]  vfs_read+0x1ec/0x2b0
[   33.245974]  ksys_read+0x5f/0xe0
[   33.245976]  do_syscall_64+0x38/0x90
[   33.245979]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   33.245981] RIP: 0033:0x7f0dbd038eae
[   33.245984] Code: c0 e9 b6 fe ff ff 50 48 8d 3d 2e 18 0a 00 e8 49 e8 01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[   33.245985] RSP: 002b:00007ffd0c19b558 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[   33.245987] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f0dbd038eae
[   33.245988] RDX: 0000000000020000 RSI: 00007f0dbc816000 RDI: 0000000000000003
[   33.245989] RBP: 00007f0dbc816000 R08: 00007f0dbc815010 R09: 0000000000000000
[   33.245990] R10: fffffffffffff1ef R11: 0000000000000246 R12: 0000000000000000
[   33.245991] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[   33.245992]  </TASK>
[   33.245993] ---[ end trace 0000000000000000 ]---
[   33.246000] ------------[ cut here ]------------

Full kernel messages are attached in kernel.log. The output of the cat is a list of 15 commas.

A similar problem exists with the original commit in kernel v6.4-rc3. See kernel-6.4-rc5.log.

Just reverting this commit let the message vanish.

With regards,

	Torsten


--------------E7E2330BF4D1B66328460ECA
Content-Type: text/x-log; charset="UTF-8"; name="kernel.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="kernel.log"

[    0.000000] microcode: microcode updated early to revision 0xf0, date =
=3D 2021-11-17
[    0.000000] Linux version 6.1.31+ (thilbrich@ws-3) (gcc (Debian 10.2.1=
-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP PREE=
MPT_DYNAMIC Tue Jun  6 09:42:33 CEST 2023
[    0.000000] Command line: loglevel=3D1 sina_toram hpet=3Ddisable i915.=
enable_gvt=3D1 console=3Dtty1 intel_iommu=3Don,igfx_off systemd.unit=3Dde=
bugshell.target
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poi=
nt registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 =
bytes, using 'standard' format.
[    0.000000] signal: max sigframe size: 1360
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000002f5fffff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000002f600000-0x000000003fdfffff] unu=
sable
[    0.000000] BIOS-e820: [mem 0x000000003fe00000-0x00000000710c8fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x00000000710c9000-0x0000000071bfefff] unu=
sable
[    0.000000] BIOS-e820: [mem 0x0000000071bff000-0x0000000072053fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x0000000072054000-0x0000000072082fff] unu=
sable
[    0.000000] BIOS-e820: [mem 0x0000000072083000-0x00000000735b3fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x00000000735b4000-0x00000000735b5fff] unu=
sable
[    0.000000] BIOS-e820: [mem 0x00000000735b6000-0x00000000944b6fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x00000000944b7000-0x0000000098694fff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000098695000-0x0000000099a1efff] ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x0000000099a1f000-0x0000000099b4efff] ACP=
I data
[    0.000000] BIOS-e820: [mem 0x0000000099b4f000-0x0000000099b4ffff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x0000000099b50000-0x000000009f7fffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000010bffffff] unu=
sable
[    0.000000] BIOS-e820: [mem 0x000000010c000000-0x000000085e7fffff] usa=
ble
[    0.000000] SMT: disabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0x72043018-0x72053057] usable =3D=3D> us=
able
[    0.000000] e820: update [mem 0x72043018-0x72053057] usable =3D=3D> us=
able
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009=
efff] usable
[    0.000000] reserve setup_data: [mem 0x000000000009f000-0x00000000000f=
ffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x000000002f5f=
ffff] usable
[    0.000000] reserve setup_data: [mem 0x000000002f600000-0x000000003fdf=
ffff] unusable
[    0.000000] reserve setup_data: [mem 0x000000003fe00000-0x00000000710c=
8fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000710c9000-0x0000000071bf=
efff] unusable
[    0.000000] reserve setup_data: [mem 0x0000000071bff000-0x000000007204=
3017] usable
[    0.000000] reserve setup_data: [mem 0x0000000072043018-0x000000007205=
3057] usable
[    0.000000] reserve setup_data: [mem 0x0000000072053058-0x000000007205=
3fff] usable
[    0.000000] reserve setup_data: [mem 0x0000000072054000-0x000000007208=
2fff] unusable
[    0.000000] reserve setup_data: [mem 0x0000000072083000-0x00000000735b=
3fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000735b4000-0x00000000735b=
5fff] unusable
[    0.000000] reserve setup_data: [mem 0x00000000735b6000-0x00000000944b=
6fff] usable
[    0.000000] reserve setup_data: [mem 0x00000000944b7000-0x000000009869=
4fff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000098695000-0x0000000099a1=
efff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x0000000099a1f000-0x0000000099b4=
efff] ACPI data
[    0.000000] reserve setup_data: [mem 0x0000000099b4f000-0x0000000099b4=
ffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000099b50000-0x000000009f7f=
ffff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000010bff=
ffff] unusable
[    0.000000] reserve setup_data: [mem 0x000000010c000000-0x0000000187ff=
ffff] usable
[    0.000000] reserve setup_data: [mem 0x0000000188000000-0x0000000189ff=
ffff] reserved
[    0.000000] reserve setup_data: [mem 0x000000018a000000-0x000000085e7f=
ffff] usable
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] user: [mem 0x000000000009f000-0x00000000000fffff] reserved=

[    0.000000] user: [mem 0x0000000000100000-0x000000002f5fffff] usable
[    0.000000] user: [mem 0x000000002f600000-0x000000003fdfffff] unusable=

[    0.000000] user: [mem 0x000000003fe00000-0x00000000710c8fff] usable
[    0.000000] user: [mem 0x00000000710c9000-0x0000000071bfefff] unusable=

[    0.000000] user: [mem 0x0000000071bff000-0x0000000072043017] usable
[    0.000000] user: [mem 0x0000000072043018-0x0000000072053057] usable
[    0.000000] user: [mem 0x0000000072053058-0x0000000072053fff] usable
[    0.000000] user: [mem 0x0000000072054000-0x0000000072082fff] unusable=

[    0.000000] user: [mem 0x0000000072083000-0x00000000735b3fff] usable
[    0.000000] user: [mem 0x00000000735b4000-0x00000000735b5fff] unusable=

[    0.000000] user: [mem 0x00000000735b6000-0x00000000944b6fff] usable
[    0.000000] user: [mem 0x00000000944b7000-0x0000000098694fff] reserved=

[    0.000000] user: [mem 0x0000000098695000-0x0000000099a1efff] ACPI NVS=

[    0.000000] user: [mem 0x0000000099a1f000-0x0000000099b4efff] ACPI dat=
a
[    0.000000] user: [mem 0x0000000099b4f000-0x0000000099b4ffff] usable
[    0.000000] user: [mem 0x0000000099b50000-0x000000009f7fffff] reserved=

[    0.000000] user: [mem 0x0000000100000000-0x000000010bffffff] unusable=

[    0.000000] user: [mem 0x000000010c000000-0x0000000187ffffff] usable
[    0.000000] user: [mem 0x0000000188000000-0x0000000189ffffff] reserved=

[    0.000000] user: [mem 0x000000018a000000-0x000000085e7fffff] usable
[    0.000000] efi: EFI v2.70 by Lenovo
[    0.000000] efi: SMBIOS=3D0x96ab8000 SMBIOS 3.0=3D0x96aab000 ACPI=3D0x=
99b4e000 ACPI 2.0=3D0x99b4e014 MEMATTR=3D0x911da018 ESRT=3D0x96965000 RNG=
=3D0x99b4d018=20
[    0.000000] random: crng init done
[    0.000000] SMBIOS 3.2.0 present.
[    0.000000] DMI: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S (3.14 ) 1=
0/10/2020
[    0.000000] tsc: Detected 2300.000 MHz processor
[    0.000000] tsc: Detected 2299.968 MHz TSC
[    0.000010] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
[    0.000014] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000030] last_pfn =3D 0x85e800 max_arch_pfn =3D 0x400000000
[    0.000173] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- =
WT =20
[    0.000194] last_pfn =3D 0x99b50 max_arch_pfn =3D 0x400000000
[    0.012694] Using GB pages for direct mapping
[    0.013532] Secure boot enabled
[    0.013533] RAMDISK: [mem 0x498c3000-0x4bcb1fff]
[    0.013540] ACPI: Early table checksum verification disabled
[    0.013543] ACPI: RSDP 0x0000000099B4E014 000024 (v02 LENOVO)
[    0.013549] ACPI: XSDT 0x0000000099B4C188 0000FC (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013557] ACPI: FACP 0x0000000096962000 000114 (v06 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013565] ACPI: DSDT 0x0000000096932000 02BFF1 (v02 LENOVO CML      =
20170001 INTL 20160422)
[    0.013570] ACPI: FACS 0x0000000099884000 000040
[    0.013574] ACPI: SSDT 0x00000000969BC000 0020AE (v02 LENOVO CpuSsdt  =
00003000 INTL 20160527)
[    0.013578] ACPI: SSDT 0x00000000969BB000 0005A1 (v02 LENOVO CtdpB    =
00001000 INTL 20160527)
[    0.013583] ACPI: SSDT 0x000000009697E000 003532 (v02 LENOVO DptfTabl =
00001000 INTL 20160527)
[    0.013587] ACPI: SSDT 0x0000000096968000 00331E (v02 LENOVO SaSsdt   =
00003000 INTL 20160527)
[    0.013592] ACPI: BOOT 0x0000000096966000 000028 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013596] ACPI: SSDT 0x0000000096963000 0005D8 (v02 LENOVO PerfTune =
00001000 INTL 20160527)
[    0.013601] ACPI: HPET 0x0000000096961000 000038 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013605] ACPI: APIC 0x0000000096960000 000164 (v03 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013610] ACPI: MCFG 0x000000009695F000 00003C (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013614] ACPI: ECDT 0x000000009695E000 000053 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013618] ACPI: SSDT 0x0000000096930000 001F31 (v02 LENOVO WHL_Tbt_ =
00001000 INTL 20160527)
[    0.013623] ACPI: SSDT 0x000000009692F000 0000A6 (v02 LENOVO PID0Ssdt =
00000010 INTL 20160527)
[    0.013627] ACPI: SSDT 0x000000009692B000 0037A1 (v02 LENOVO ProjSsdt =
00000010 INTL 20160527)
[    0.013631] ACPI: NHLT 0x0000000096929000 00189E (v00 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013636] ACPI: MSDM 0x0000000096928000 000055 (v03 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013640] ACPI: SSDT 0x000000009674B000 000EF6 (v02 LENOVO UsbCTabl =
00001000 INTL 20160527)
[    0.013644] ACPI: LPIT 0x000000009674A000 000094 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013649] ACPI: WSMT 0x0000000096749000 000028 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013653] ACPI: SSDT 0x0000000096746000 00281B (v02 LENOVO TbtTypeC =
00000000 INTL 20160527)
[    0.013657] ACPI: DBGP 0x0000000096745000 000034 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013662] ACPI: DBG2 0x0000000096744000 000054 (v00 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013666] ACPI: BATB 0x0000000096743000 00004A (v02 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013670] ACPI: DMAR 0x0000000094F3C000 0000A8 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013675] ACPI: BGRT 0x0000000094F3B000 000038 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013679] ACPI: UEFI 0x0000000099839000 00012A (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013683] ACPI: FPDT 0x0000000094F3A000 000044 (v01 LENOVO TP-N2X   =
00003140 PTEC 00003140)
[    0.013687] ACPI: Reserving FACP table memory at [mem 0x96962000-0x969=
62113]
[    0.013689] ACPI: Reserving DSDT table memory at [mem 0x96932000-0x969=
5dff0]
[    0.013691] ACPI: Reserving FACS table memory at [mem 0x99884000-0x998=
8403f]
[    0.013692] ACPI: Reserving SSDT table memory at [mem 0x969bc000-0x969=
be0ad]
[    0.013693] ACPI: Reserving SSDT table memory at [mem 0x969bb000-0x969=
bb5a0]
[    0.013695] ACPI: Reserving SSDT table memory at [mem 0x9697e000-0x969=
81531]
[    0.013696] ACPI: Reserving SSDT table memory at [mem 0x96968000-0x969=
6b31d]
[    0.013697] ACPI: Reserving BOOT table memory at [mem 0x96966000-0x969=
66027]
[    0.013699] ACPI: Reserving SSDT table memory at [mem 0x96963000-0x969=
635d7]
[    0.013700] ACPI: Reserving HPET table memory at [mem 0x96961000-0x969=
61037]
[    0.013701] ACPI: Reserving APIC table memory at [mem 0x96960000-0x969=
60163]
[    0.013703] ACPI: Reserving MCFG table memory at [mem 0x9695f000-0x969=
5f03b]
[    0.013704] ACPI: Reserving ECDT table memory at [mem 0x9695e000-0x969=
5e052]
[    0.013705] ACPI: Reserving SSDT table memory at [mem 0x96930000-0x969=
31f30]
[    0.013707] ACPI: Reserving SSDT table memory at [mem 0x9692f000-0x969=
2f0a5]
[    0.013708] ACPI: Reserving SSDT table memory at [mem 0x9692b000-0x969=
2e7a0]
[    0.013709] ACPI: Reserving NHLT table memory at [mem 0x96929000-0x969=
2a89d]
[    0.013711] ACPI: Reserving MSDM table memory at [mem 0x96928000-0x969=
28054]
[    0.013712] ACPI: Reserving SSDT table memory at [mem 0x9674b000-0x967=
4bef5]
[    0.013713] ACPI: Reserving LPIT table memory at [mem 0x9674a000-0x967=
4a093]
[    0.013715] ACPI: Reserving WSMT table memory at [mem 0x96749000-0x967=
49027]
[    0.013716] ACPI: Reserving SSDT table memory at [mem 0x96746000-0x967=
4881a]
[    0.013717] ACPI: Reserving DBGP table memory at [mem 0x96745000-0x967=
45033]
[    0.013719] ACPI: Reserving DBG2 table memory at [mem 0x96744000-0x967=
44053]
[    0.013720] ACPI: Reserving BATB table memory at [mem 0x96743000-0x967=
43049]
[    0.013722] ACPI: Reserving DMAR table memory at [mem 0x94f3c000-0x94f=
3c0a7]
[    0.013723] ACPI: Reserving BGRT table memory at [mem 0x94f3b000-0x94f=
3b037]
[    0.013724] ACPI: Reserving UEFI table memory at [mem 0x99839000-0x998=
39129]
[    0.013726] ACPI: Reserving FPDT table memory at [mem 0x94f3a000-0x94f=
3a043]
[    0.013842] Zone ranges:
[    0.013843]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.013846]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.013848]   Normal   [mem 0x0000000100000000-0x000000085e7fffff]
[    0.013851] Movable zone start for each node
[    0.013852] Early memory node ranges
[    0.013852]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.013855]   node   0: [mem 0x0000000000100000-0x000000002f5fffff]
[    0.013856]   node   0: [mem 0x000000003fe00000-0x00000000710c8fff]
[    0.013858]   node   0: [mem 0x0000000071bff000-0x0000000072053fff]
[    0.013859]   node   0: [mem 0x0000000072083000-0x00000000735b3fff]
[    0.013860]   node   0: [mem 0x00000000735b6000-0x00000000944b6fff]
[    0.013862]   node   0: [mem 0x0000000099b4f000-0x0000000099b4ffff]
[    0.013863]   node   0: [mem 0x000000010c000000-0x0000000187ffffff]
[    0.013864]   node   0: [mem 0x000000018a000000-0x000000085e7fffff]
[    0.013870] Initmem setup node 0 [mem 0x0000000000001000-0x000000085e7=
fffff]
[    0.013885] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.013918] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.017518] On node 0, zone DMA32: 34816 pages in unavailable ranges
[    0.017585] On node 0, zone DMA32: 2870 pages in unavailable ranges
[    0.017626] On node 0, zone DMA32: 47 pages in unavailable ranges
[    0.018705] On node 0, zone DMA32: 2 pages in unavailable ranges
[    0.019037] On node 0, zone DMA32: 22168 pages in unavailable ranges
[    0.023743] On node 0, zone Normal: 42160 pages in unavailable ranges
[    0.081409] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.081496] On node 0, zone Normal: 6144 pages in unavailable ranges
[    0.081610] Reserving Intel graphics memory at [mem 0x9b800000-0x9f7ff=
fff]
[    0.083473] ACPI: PM-Timer IO Port: 0x1808
[    0.083490] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.083493] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.083494] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.083495] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.083497] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.083498] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.083499] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.083500] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.083501] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.083502] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.083503] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.083504] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.083505] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.083506] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.083507] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.083508] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.083510] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.083511] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.083512] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.083513] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.083573] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI =
0-119
[    0.083579] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.083582] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level=
)
[    0.083588] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.083590] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.083595] TSC deadline timer available
[    0.083603] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.083631] [mem 0x9f800000-0xffffffff] available for PCI devices
[    0.083633] Booting paravirtualized kernel on bare hardware
[    0.083642] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.094769] setup_percpu: NR_CPUS:32 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    0.095021] percpu: Embedded 54 pages/cpu s180584 r8192 d32408 u262144=

[    0.095031] pcpu-alloc: s180584 r8192 d32408 u262144 alloc=3D1*2097152=

[    0.095035] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.095076] Built 1 zonelists, mobility grouping on.  Total pages: 807=
7291
[    0.095079] Kernel command line: memmap=3D0x2000000$0x188000000 ramoop=
s.mem_address=3D0x188000000 ramoops.mem_size=3D0x2000000 ramoops.ecc=3D1 =
ramoops.record_size=3D0x200000 ramoops.console_size=3D0 ramoops.ftrace_si=
ze=3D0 ramoops.pmsg_size=3D0 mem_sleep_default=3Ddeep mitigations=3Dauto =
nosmt loglevel=3D1 sina_toram hpet=3Ddisable i915.enable_gvt=3D1 console=3D=
tty1 intel_iommu=3Don,igfx_off systemd.unit=3Ddebugshell.target
[    0.095226] DMAR: IOMMU enabled
[    0.095227] DMAR: Disable GFX device mapping
[    0.095247] Unknown kernel command line parameters "sina_toram", will =
be passed to user space.
[    0.097790] Dentry cache hash table entries: 4194304 (order: 13, 33554=
432 bytes, linear)
[    0.099059] Inode-cache hash table entries: 2097152 (order: 12, 167772=
16 bytes, linear)
[    0.099207] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.099249] software IO TLB: area num 8.
[    0.197674] Memory: 32101884K/32826300K available (18443K kernel code,=
 9333K rwdata, 6544K rodata, 2028K init, 2984K bss, 724156K reserved, 0K =
cma-reserved)
[    0.197731] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8,=
 Nodes=3D1
[    0.197739] ftrace: allocating 57150 entries in 224 pages
[    0.213107] ftrace: allocated 224 pages with 3 groups
[    0.214616] Dynamic Preempt: voluntary
[    0.214657] rcu: Preemptible hierarchical RCU implementation.
[    0.214658] rcu: 	RCU event tracing is enabled.
[    0.214659] rcu: 	RCU restricting CPUs from NR_CPUS=3D32 to nr_cpu_ids=
=3D8.
[    0.214661] 	Trampoline variant of Tasks RCU enabled.
[    0.214662] 	Rude variant of Tasks RCU enabled.
[    0.214662] 	Tracing variant of Tasks RCU enabled.
[    0.214663] rcu: RCU calculated value of scheduler-enlistment delay is=
 100 jiffies.
[    0.214664] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D8
[    0.221686] NR_IRQS: 4352, nr_irqs: 2048, preallocated irqs: 16
[    0.222019] rcu: srcu_init: Setting srcu_struct sizes based on content=
ion.
[    0.222295] Console: colour dummy device 80x25
[    0.222328] printk: console [tty1] enabled
[    0.222341] ACPI: Core revision 20220331
[    0.222807] APIC: Switch to symmetric I/O mode setup
[    0.225332] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.238392] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycle=
s: 0x212717146a7, max_idle_ns: 440795291431 ns
[    0.238411] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 4599.93 BogoMIPS (lpj=3D2299968)
[    0.238415] pid_max: default: 32768 minimum: 301
[    0.238436] LSM: Security Framework initializing
[    0.238522] Mount-cache hash table entries: 65536 (order: 7, 524288 by=
tes, linear)
[    0.238589] Mountpoint-cache hash table entries: 65536 (order: 7, 5242=
88 bytes, linear)
[    0.239131] CPU0: Thermal monitoring enabled (TM1)
[    0.239406] process: using mwait in idle threads
[    0.239406] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.239406] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.239406] Spectre V1 : Mitigation: usercopy/swapgs barriers and __us=
er pointer sanitization
[    0.239406] Spectre V2 : Mitigation: Enhanced IBRS
[    0.239406] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling R=
SB on context switch
[    0.239406] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CAL=
L on VMEXIT
[    0.239406] RETBleed: Mitigation: Enhanced IBRS
[    0.239406] Spectre V2 : mitigation: Enabling conditional Indirect Bra=
nch Prediction Barrier
[    0.239406] Speculative Store Bypass: Mitigation: Speculative Store By=
pass disabled via prctl
[    0.239406] MMIO Stale Data: Mitigation: Clear CPU buffers
[    0.239406] SRBDS: Vulnerable: No microcode
[    0.239406] Freeing SMP alternatives memory: 44K
[    0.239406] smpboot: CPU0: Intel(R) Core(TM) i7-10510U CPU @ 1.80GHz (=
family: 0x6, model: 0x8e, stepping: 0xc)
[    0.239406] cblist_init_generic: Setting adjustable number of callback=
 queues.
[    0.239406] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.239406] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.239406] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.239406] Performance Events: Skylake events, 32-deep LBR, full-widt=
h counters, Intel PMU driver.
[    0.239406] ... version:                4
[    0.239406] ... bit width:              48
[    0.239406] ... generic registers:      4
[    0.239406] ... value mask:             0000ffffffffffff
[    0.239406] ... max period:             00007fffffffffff
[    0.239406] ... fixed-purpose events:   3
[    0.239406] ... event mask:             000000070000000f
[    0.239406] rcu: Hierarchical SRCU implementation.
[    0.239406] rcu: 	Max phase no-delay instances is 400.
[    0.239884] NMI watchdog: Enabled. Permanently consumes one hw-PMU cou=
nter.
[    0.239995] smp: Bringing up secondary CPUs ...
[    0.240133] x86: Booting SMP configuration:
[    0.240134] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.273077] smp: Brought up 1 node, 4 CPUs
[    0.273083] smpboot: Max logical packages: 2
[    0.273085] smpboot: Total of 4 processors activated (18399.74 BogoMIP=
S)
[    0.273560] devtmpfs: initialized
[    0.273628] ACPI: PM: Registering ACPI NVS region [mem 0x98695000-0x99=
a1efff] (20488192 bytes)
[    0.273806] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 1911260446275000 ns
[    0.273811] futex hash table entries: 2048 (order: 5, 131072 bytes, li=
near)
[    0.273855] pinctrl core: initialized pinctrl subsystem
[    0.274422] PM: RTC time: 07:58:27, date: 2023-06-06
[    0.275000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.275149] ramoops: using module parameters
[    0.275920] pstore: Registered ramoops as persistent store backend
[    0.275922] ramoops: using 0x2000000@0x188000000, ecc: 16
[    0.275999] thermal_sys: Registered thermal governor 'step_wise'
[    0.276001] thermal_sys: Registered thermal governor 'user_space'
[    0.276015] cpuidle: using governor menu
[    0.276094] Simple Boot Flag at 0x47 set to 0x1
[    0.276145] ACPI FADT declares the system doesn't support PCIe ASPM, s=
o disable it
[    0.276147] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.276283] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf00000=
00-0xf7ffffff] (base 0xf0000000)
[    0.276289] PCI: not using MMCONFIG
[    0.276294] PCI: Using configuration type 1 for base access
[    0.276617] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.280540] kprobes: kprobe jump-optimization is enabled. All kprobes =
are optimized if possible.
[    0.280548] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pa=
ges
[    0.280548] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.280548] ACPI: Added _OSI(Module Device)
[    0.280548] ACPI: Added _OSI(Processor Device)
[    0.280548] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.280548] ACPI: Added _OSI(Processor Aggregator Device)
[    0.346188] ACPI: 11 ACPI AML tables successfully acquired and loaded
[    0.347902] ACPI: EC: EC started
[    0.347903] ACPI: EC: interrupt blocked
[    0.350589] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.350592] ACPI: EC: Boot ECDT EC used to handle transactions
[    0.353240] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.415972] ACPI: Dynamic OEM Table Load:
[    0.415972] ACPI: SSDT 0xFFFF8F740D0F0700 0000FC (v02 PmRef  Cpu0Psd  =
00003000 INTL 20160527)
[    0.416837] ACPI: \_SB_.PR00: _OSC native thermal LVT Acked
[    0.417314] ACPI: Dynamic OEM Table Load:
[    0.417319] ACPI: SSDT 0xFFFF8F740D139400 000400 (v02 PmRef  Cpu0Cst  =
00003001 INTL 20160527)
[    0.418015] ACPI: Dynamic OEM Table Load:
[    0.418019] ACPI: SSDT 0xFFFF8F740D141000 00061E (v02 PmRef  Cpu0Ist  =
00003000 INTL 20160527)
[    0.418741] ACPI: Dynamic OEM Table Load:
[    0.418745] ACPI: SSDT 0xFFFF8F740D0BA000 00016C (v02 PmRef  Cpu0Hwp  =
00003000 INTL 20160527)
[    0.419390] ACPI: Dynamic OEM Table Load:
[    0.419395] ACPI: SSDT 0xFFFF8F740D133000 000BEA (v02 PmRef  HwpLvt   =
00003000 INTL 20160527)
[    0.420159] ACPI: Dynamic OEM Table Load:
[    0.420164] ACPI: SSDT 0xFFFF8F740D142800 000778 (v02 PmRef  ApIst    =
00003000 INTL 20160527)
[    0.420904] ACPI: Dynamic OEM Table Load:
[    0.420908] ACPI: SSDT 0xFFFF8F740D139800 0003D7 (v02 PmRef  ApHwp    =
00003000 INTL 20160527)
[    0.421633] ACPI: Dynamic OEM Table Load:
[    0.421638] ACPI: SSDT 0xFFFF8F740D134000 000D22 (v02 PmRef  ApPsd    =
00003000 INTL 20160527)
[    0.422622] ACPI: Dynamic OEM Table Load:
[    0.422626] ACPI: SSDT 0xFFFF8F740D139C00 0003CA (v02 PmRef  ApCst    =
00003000 INTL 20160527)
[    0.424454] ACPI: Interpreter enabled
[    0.424473] ACPI: PM: (supports S0 S3 S5)
[    0.424474] ACPI: Using IOAPIC for interrupt routing
[    0.424493] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf00000=
00-0xf7ffffff] (base 0xf0000000)
[    0.425001] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in A=
CPI motherboard resources
[    0.425009] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
[    0.425010] PCI: Using E820 reservations for host bridge windows
[    0.425220] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.427042] ACPI: PM: Power Resource [PUBS]
[    0.429068] ACPI: PM: Power Resource [BTPR]
[    0.429789] ACPI: PM: Power Resource [USBC]
[    0.430657] ACPI: PM: Power Resource [PXP]
[    0.432125] ACPI: PM: Power Resource [PXP]
[    0.435045] ACPI: PM: Power Resource [V0PR]
[    0.435130] ACPI: PM: Power Resource [V1PR]
[    0.435210] ACPI: PM: Power Resource [V2PR]
[    0.435866] ACPI: PM: Power Resource [WRST]
[    0.438236] ACPI: PM: Power Resource [PIN]
[    0.438250] ACPI: PM: Power Resource [PINP]
[    0.438616] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7e])
[    0.438620] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig Segment=
s MSI HPX-Type3]
[    0.438621] acpi PNP0A08:00: _OSC: not requesting OS control; OS requi=
res [ExtendedConfig ASPM ClockPM MSI]
[    0.438661] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using=
 BIOS configuration
[    0.440263] PCI host bridge to bus 0000:00
[    0.440264] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
[    0.440266] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
[    0.440267] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
[    0.440268] pci_bus 0000:00: root bus resource [mem 0x9f800000-0xeffff=
fff window]
[    0.440268] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7ff=
fff window]
[    0.440269] pci_bus 0000:00: root bus resource [bus 00-7e]
[    0.440317] pci 0000:00:00.0: [8086:9b61] type 00 class 0x060000
[    0.440669] pci 0000:00:02.0: [8086:9b41] type 00 class 0x030000
[    0.440738] pci 0000:00:02.0: reg 0x10: [mem 0xe9000000-0xe9ffffff 64b=
it]
[    0.440782] pci 0000:00:02.0: reg 0x18: [mem 0xa0000000-0xbfffffff 64b=
it pref]
[    0.440811] pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
[    0.440902] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.440915] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0=
x000c0000-0x000dffff]
[    0.441422] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.441499] pci 0000:00:04.0: reg 0x10: [mem 0xeb730000-0xeb737fff 64b=
it]
[    0.442096] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[    0.442162] pci 0000:00:08.0: reg 0x10: [mem 0xeb742000-0xeb742fff 64b=
it]
[    0.442744] pci 0000:00:12.0: [8086:02f9] type 00 class 0x118000
[    0.442862] pci 0000:00:12.0: reg 0x10: [mem 0xeb743000-0xeb743fff 64b=
it]
[    0.443564] pci 0000:00:14.0: [8086:02ed] type 00 class 0x0c0330
[    0.443685] pci 0000:00:14.0: reg 0x10: [mem 0xeb720000-0xeb72ffff 64b=
it]
[    0.444151] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.444554] pci 0000:00:14.2: [8086:02ef] type 00 class 0x050000
[    0.444662] pci 0000:00:14.2: reg 0x10: [mem 0xeb740000-0xeb741fff 64b=
it]
[    0.444732] pci 0000:00:14.2: reg 0x18: [mem 0xeb744000-0xeb744fff 64b=
it]
[    0.445452] pci 0000:00:14.3: [8086:02f0] type 00 class 0x028000
[    0.445799] pci 0000:00:14.3: reg 0x10: [mem 0xeb738000-0xeb73bfff 64b=
it]
[    0.447451] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.448582] pci 0000:00:16.0: [8086:02e0] type 00 class 0x078000
[    0.448718] pci 0000:00:16.0: reg 0x10: [mem 0xeb745000-0xeb745fff 64b=
it]
[    0.449217] pci 0000:00:16.0: PME# supported from D3hot
[    0.449828] pci 0000:00:1c.0: [8086:02b8] type 01 class 0x060400
[    0.450430] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.451298] pci 0000:00:1c.4: [8086:02bc] type 01 class 0x060400
[    0.451881] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.452686] pci 0000:00:1d.0: [8086:02b0] type 01 class 0x060400
[    0.453231] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.453835] pci 0000:00:1d.4: [8086:02b4] type 01 class 0x060400
[    0.454480] pci 0000:00:1d.4: PME# supported from D0 D3hot D3cold
[    0.455354] pci 0000:00:1f.0: [8086:0284] type 00 class 0x060100
[    0.456639] pci 0000:00:1f.3: [8086:02c8] type 00 class 0x040380
[    0.456834] pci 0000:00:1f.3: reg 0x10: [mem 0xeb73c000-0xeb73ffff 64b=
it]
[    0.457082] pci 0000:00:1f.3: reg 0x20: [mem 0xeaa00000-0xeaafffff 64b=
it]
[    0.457556] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.457993] pci 0000:00:1f.4: [8086:02a3] type 00 class 0x0c0500
[    0.458216] pci 0000:00:1f.4: reg 0x10: [mem 0xeb746000-0xeb7460ff 64b=
it]
[    0.458491] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[    0.458982] pci 0000:00:1f.5: [8086:02a4] type 00 class 0x0c8000
[    0.459076] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
[    0.459652] pci 0000:00:1f.6: [8086:0d4f] type 00 class 0x020000
[    0.459832] pci 0000:00:1f.6: reg 0x10: [mem 0xeb700000-0xeb71ffff]
[    0.460754] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    0.461322] pci 0000:02:00.0: [10ec:522a] type 00 class 0xff0000
[    0.461484] pci 0000:02:00.0: reg 0x10: [mem 0xeb600000-0xeb600fff]
[    0.462636] pci 0000:02:00.0: supports D1 D2
[    0.462637] pci 0000:02:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.463615] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.463640] pci 0000:00:1c.0:   bridge window [mem 0xeb600000-0xeb6fff=
ff]
[    0.464012] pci 0000:03:00.0: [8086:15c0] type 01 class 0x060400
[    0.464388] pci 0000:03:00.0: enabling Extended Tags
[    0.464947] pci 0000:03:00.0: supports D1 D2
[    0.464948] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.465851] pci 0000:00:1c.4: PCI bridge to [bus 03-2b]
[    0.465877] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.465901] pci 0000:00:1c.4:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.466300] pci 0000:04:00.0: [8086:15c0] type 01 class 0x060400
[    0.466703] pci 0000:04:00.0: enabling Extended Tags
[    0.467267] pci 0000:04:00.0: supports D1 D2
[    0.467268] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.468168] pci 0000:04:01.0: [8086:15c0] type 01 class 0x060400
[    0.468570] pci 0000:04:01.0: enabling Extended Tags
[    0.469142] pci 0000:04:01.0: supports D1 D2
[    0.469143] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.470042] pci 0000:04:02.0: [8086:15c0] type 01 class 0x060400
[    0.470438] pci 0000:04:02.0: enabling Extended Tags
[    0.471001] pci 0000:04:02.0: supports D1 D2
[    0.471002] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.471899] pci 0000:03:00.0: PCI bridge to [bus 04-2b]
[    0.471952] pci 0000:03:00.0:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.471988] pci 0000:03:00.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.472393] pci 0000:05:00.0: [8086:15bf] type 00 class 0x088000
[    0.472507] pci 0000:05:00.0: reg 0x10: [mem 0xe8100000-0xe813ffff]
[    0.472561] pci 0000:05:00.0: reg 0x14: [mem 0xe8140000-0xe8140fff]
[    0.472888] pci 0000:05:00.0: enabling Extended Tags
[    0.473534] pci 0000:05:00.0: supports D1 D2
[    0.473535] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.474449] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.474505] pci 0000:04:00.0:   bridge window [mem 0xe8100000-0xe81fff=
ff]
[    0.474768] pci 0000:04:01.0: PCI bridge to [bus 06-2a]
[    0.474822] pci 0000:04:01.0:   bridge window [mem 0xdc100000-0xe80fff=
ff]
[    0.474859] pci 0000:04:01.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.475307] pci 0000:2b:00.0: [8086:15c1] type 00 class 0x0c0330
[    0.475457] pci 0000:2b:00.0: reg 0x10: [mem 0xdc000000-0xdc00ffff]
[    0.476000] pci 0000:2b:00.0: enabling Extended Tags
[    0.476674] pci 0000:2b:00.0: supports D1 D2
[    0.476675] pci 0000:2b:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.477211] pci 0000:2b:00.0: 8.000 Gb/s available PCIe bandwidth, lim=
ited by 2.5 GT/s PCIe x4 link at 0000:04:02.0 (capable of 31.504 Gb/s wit=
h 8.0 GT/s PCIe x4 link)
[    0.477767] pci 0000:04:02.0: PCI bridge to [bus 2b]
[    0.477822] pci 0000:04:02.0:   bridge window [mem 0xdc000000-0xdc0fff=
ff]
[    0.478216] pci 0000:00:1d.0: PCI bridge to [bus 2d]
[    0.478230] pci 0000:00:1d.0:   bridge window [io  0x3000-0x3fff]
[    0.478244] pci 0000:00:1d.0:   bridge window [mem 0xeac00000-0xeb5fff=
ff]
[    0.478270] pci 0000:00:1d.0:   bridge window [mem 0xea000000-0xea9fff=
ff 64bit pref]
[    0.478575] pci 0000:2e:00.0: [15b7:5006] type 00 class 0x010802
[    0.478720] pci 0000:2e:00.0: reg 0x10: [mem 0xeab00000-0xeab03fff 64b=
it]
[    0.478932] pci 0000:2e:00.0: reg 0x20: [mem 0xeab04000-0xeab040ff 64b=
it]
[    0.480130] pci 0000:00:1d.4: PCI bridge to [bus 2e]
[    0.480156] pci 0000:00:1d.4:   bridge window [mem 0xeab00000-0xeabfff=
ff]
[    0.480311] pci_bus 0000:00: on NUMA node 0
[    0.482001] ACPI: EC: interrupt unblocked
[    0.482002] ACPI: EC: event unblocked
[    0.482018] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.482019] ACPI: EC: GPE=3D0x16
[    0.482020] ACPI: \_SB_.PCI0.LPCB.EC__: Boot ECDT EC initialization co=
mplete
[    0.482021] ACPI: \_SB_.PCI0.LPCB.EC__: EC: Used to handle transaction=
s and events
[    0.482076] iommu: Default domain type: Translated=20
[    0.482077] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    0.482120] SCSI subsystem initialized
[    0.482594] libata version 3.00 loaded.
[    0.482594] ACPI: bus type USB registered
[    0.482594] usbcore: registered new interface driver usbfs
[    0.482934] usbcore: registered new interface driver hub
[    0.482934] usbcore: registered new device driver usb
[    0.482934] pps_core: LinuxPPS API ver. 1 registered
[    0.482934] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
[    0.482934] PTP clock support registered
[    0.482934] Advanced Linux Sound Architecture Driver Initialized.
[    0.482934] NetLabel: Initializing
[    0.482934] NetLabel:  domain hash size =3D 128
[    0.482934] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.482934] NetLabel:  unlabeled traffic allowed by default
[    0.482934] PCI: Using ACPI for IRQ routing
[    0.546710] PCI: pci_cache_line_size set to 64 bytes
[    0.547216] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.547218] e820: reserve RAM buffer [mem 0x2f600000-0x2fffffff]
[    0.547218] e820: reserve RAM buffer [mem 0x710c9000-0x73ffffff]
[    0.547219] e820: reserve RAM buffer [mem 0x72043018-0x73ffffff]
[    0.547220] e820: reserve RAM buffer [mem 0x72054000-0x73ffffff]
[    0.547220] e820: reserve RAM buffer [mem 0x735b4000-0x73ffffff]
[    0.547221] e820: reserve RAM buffer [mem 0x944b7000-0x97ffffff]
[    0.547221] e820: reserve RAM buffer [mem 0x99b50000-0x9bffffff]
[    0.547222] e820: reserve RAM buffer [mem 0x85e800000-0x85fffffff]
[    0.548411] clocksource: Switched to clocksource tsc-early
[    0.548411] pnp: PnP ACPI init
[    0.548705] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.548707] system 00:00: [mem 0xfd000000-0xfd69ffff] has been reserve=
d
[    0.548709] system 00:00: [mem 0xfd6b0000-0xfd6cffff] has been reserve=
d
[    0.548710] system 00:00: [mem 0xfd6f0000-0xfdffffff] has been reserve=
d
[    0.548711] system 00:00: [mem 0xfe000000-0xfe01ffff] could not be res=
erved
[    0.548712] system 00:00: [mem 0xfe200000-0xfe7fffff] has been reserve=
d
[    0.548712] system 00:00: [mem 0xff000000-0xffffffff] has been reserve=
d
[    0.548845] system 00:01: [io  0x2000-0x20fe] has been reserved
[    0.549215] system 00:02: [io  0x0680-0x069f] has been reserved
[    0.549217] system 00:02: [io  0x164e-0x164f] has been reserved
[    0.549283] system 00:04: [io  0x1854-0x1857] has been reserved
[    0.549337] system 00:07: [io  0x1800-0x189f] could not be reserved
[    0.549338] system 00:07: [io  0x0800-0x087f] has been reserved
[    0.549339] system 00:07: [io  0x0880-0x08ff] has been reserved
[    0.549340] system 00:07: [io  0x0900-0x097f] has been reserved
[    0.549341] system 00:07: [io  0x0980-0x09ff] has been reserved
[    0.549342] system 00:07: [io  0x0a00-0x0a7f] has been reserved
[    0.549342] system 00:07: [io  0x0a80-0x0aff] has been reserved
[    0.549343] system 00:07: [io  0x0b00-0x0b7f] has been reserved
[    0.549344] system 00:07: [io  0x0b80-0x0bff] has been reserved
[    0.549345] system 00:07: [io  0x15e0-0x15ef] has been reserved
[    0.549346] system 00:07: [io  0x1600-0x167f] could not be reserved
[    0.549346] system 00:07: [io  0x1640-0x165f] could not be reserved
[    0.549347] system 00:07: [mem 0xf0000000-0xf7ffffff] has been reserve=
d
[    0.549348] system 00:07: [mem 0xfed10000-0xfed13fff] has been reserve=
d
[    0.549349] system 00:07: [mem 0xfed18000-0xfed18fff] has been reserve=
d
[    0.549350] system 00:07: [mem 0xfed19000-0xfed19fff] has been reserve=
d
[    0.549351] system 00:07: [mem 0xfeb00000-0xfebfffff] has been reserve=
d
[    0.549352] system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserve=
d
[    0.549353] system 00:07: [mem 0xfed90000-0xfed93fff] has been reserve=
d
[    0.549685] system 00:08: [mem 0xfed10000-0xfed17fff] could not be res=
erved
[    0.549687] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserve=
d
[    0.549688] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserve=
d
[    0.549688] system 00:08: [mem 0xf0000000-0xf7ffffff] has been reserve=
d
[    0.549689] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserve=
d
[    0.549690] system 00:08: [mem 0xfed90000-0xfed93fff] has been reserve=
d
[    0.549691] system 00:08: [mem 0xfed45000-0xfed8ffff] has been reserve=
d
[    0.549692] system 00:08: [mem 0xfee00000-0xfeefffff] has been reserve=
d
[    0.549780] system 00:09: [mem 0xfe038000-0xfe038fff] has been reserve=
d
[    0.549953] pnp 00:0a: disabling [mem 0x000c0000-0x000c3fff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.549955] pnp 00:0a: disabling [mem 0x000c8000-0x000cbfff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.549956] pnp 00:0a: disabling [mem 0x000d0000-0x000d3fff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.549957] pnp 00:0a: disabling [mem 0x000d8000-0x000dbfff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.549974] system 00:0a: [mem 0x00000000-0x0009ffff] could not be res=
erved
[    0.549975] system 00:0a: [mem 0x000e0000-0x000e3fff] could not be res=
erved
[    0.549976] system 00:0a: [mem 0x000e8000-0x000ebfff] could not be res=
erved
[    0.549977] system 00:0a: [mem 0x000f0000-0x000fffff] could not be res=
erved
[    0.549977] system 00:0a: [mem 0x00100000-0x9f7fffff] could not be res=
erved
[    0.549978] system 00:0a: [mem 0xfec00000-0xfed3ffff] could not be res=
erved
[    0.549979] system 00:0a: [mem 0xfed4c000-0xffffffff] could not be res=
erved
[    0.550008] pnp: PnP ACPI: found 11 devices
[    0.555838] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
[    0.555878] NET: Registered PF_INET protocol family
[    0.555982] IP idents hash table entries: 262144 (order: 9, 2097152 by=
tes, linear)
[    0.557805] tcp_listen_portaddr_hash hash table entries: 16384 (order:=
 6, 262144 bytes, linear)
[    0.557843] Table-perturb hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
[    0.557853] TCP established hash table entries: 262144 (order: 9, 2097=
152 bytes, linear)
[    0.558100] TCP bind hash table entries: 65536 (order: 9, 2097152 byte=
s, linear)
[    0.558352] TCP: Hash tables configured (established 262144 bind 65536=
)
[    0.558370] UDP hash table entries: 16384 (order: 7, 524288 bytes, lin=
ear)
[    0.558445] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes=
, linear)
[    0.558517] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.558635] pci 0000:04:01.0: bridge window [io  0x1000-0x0fff] to [bu=
s 06-2a] add_size 1000
[    0.558638] pci 0000:03:00.0: bridge window [io  0x1000-0x0fff] to [bu=
s 04-2b] add_size 1000
[    0.558639] pci 0000:00:1c.4: bridge window [io  0x1000-0x0fff] to [bu=
s 03-2b] add_size 2000
[    0.558643] pci 0000:00:1c.4: BAR 13: assigned [io  0x5000-0x6fff]
[    0.558646] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.558666] pci 0000:00:1c.0:   bridge window [mem 0xeb600000-0xeb6fff=
ff]
[    0.558703] pci 0000:03:00.0: BAR 13: assigned [io  0x5000-0x5fff]
[    0.558704] pci 0000:04:01.0: BAR 13: assigned [io  0x5000-0x5fff]
[    0.558705] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.558732] pci 0000:04:00.0:   bridge window [mem 0xe8100000-0xe81fff=
ff]
[    0.558788] pci 0000:04:01.0: PCI bridge to [bus 06-2a]
[    0.558798] pci 0000:04:01.0:   bridge window [io  0x5000-0x5fff]
[    0.558834] pci 0000:04:01.0:   bridge window [mem 0xdc100000-0xe80fff=
ff]
[    0.558852] pci 0000:04:01.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.558889] pci 0000:04:02.0: PCI bridge to [bus 2b]
[    0.558916] pci 0000:04:02.0:   bridge window [mem 0xdc000000-0xdc0fff=
ff]
[    0.558970] pci 0000:03:00.0: PCI bridge to [bus 04-2b]
[    0.558979] pci 0000:03:00.0:   bridge window [io  0x5000-0x5fff]
[    0.559006] pci 0000:03:00.0:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.559024] pci 0000:03:00.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.559059] pci 0000:00:1c.4: PCI bridge to [bus 03-2b]
[    0.559065] pci 0000:00:1c.4:   bridge window [io  0x5000-0x6fff]
[    0.559084] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.559096] pci 0000:00:1c.4:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.559121] pci 0000:00:1d.0: PCI bridge to [bus 2d]
[    0.559131] pci 0000:00:1d.0:   bridge window [io  0x3000-0x3fff]
[    0.559151] pci 0000:00:1d.0:   bridge window [mem 0xeac00000-0xeb5fff=
ff]
[    0.559164] pci 0000:00:1d.0:   bridge window [mem 0xea000000-0xea9fff=
ff 64bit pref]
[    0.559190] pci 0000:00:1d.4: PCI bridge to [bus 2e]
[    0.559210] pci 0000:00:1d.4:   bridge window [mem 0xeab00000-0xeabfff=
ff]
[    0.559248] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.559250] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.559251] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff win=
dow]
[    0.559251] pci_bus 0000:00: resource 7 [mem 0x9f800000-0xefffffff win=
dow]
[    0.559252] pci_bus 0000:00: resource 8 [mem 0xfc800000-0xfe7fffff win=
dow]
[    0.559253] pci_bus 0000:02: resource 1 [mem 0xeb600000-0xeb6fffff]
[    0.559254] pci_bus 0000:03: resource 0 [io  0x5000-0x6fff]
[    0.559255] pci_bus 0000:03: resource 1 [mem 0xdc000000-0xe81fffff]
[    0.559255] pci_bus 0000:03: resource 2 [mem 0xc0000000-0xdbffffff 64b=
it pref]
[    0.559256] pci_bus 0000:04: resource 0 [io  0x5000-0x5fff]
[    0.559257] pci_bus 0000:04: resource 1 [mem 0xdc000000-0xe81fffff]
[    0.559258] pci_bus 0000:04: resource 2 [mem 0xc0000000-0xdbffffff 64b=
it pref]
[    0.559258] pci_bus 0000:05: resource 1 [mem 0xe8100000-0xe81fffff]
[    0.559259] pci_bus 0000:06: resource 0 [io  0x5000-0x5fff]
[    0.559260] pci_bus 0000:06: resource 1 [mem 0xdc100000-0xe80fffff]
[    0.559261] pci_bus 0000:06: resource 2 [mem 0xc0000000-0xdbffffff 64b=
it pref]
[    0.559261] pci_bus 0000:2b: resource 1 [mem 0xdc000000-0xdc0fffff]
[    0.559262] pci_bus 0000:2d: resource 0 [io  0x3000-0x3fff]
[    0.559263] pci_bus 0000:2d: resource 1 [mem 0xeac00000-0xeb5fffff]
[    0.559264] pci_bus 0000:2d: resource 2 [mem 0xea000000-0xea9fffff 64b=
it pref]
[    0.559264] pci_bus 0000:2e: resource 1 [mem 0xeab00000-0xeabfffff]
[    0.560212] PCI: CLS 0 bytes, default 64
[    0.560217] DMAR: Host address width 39
[    0.560217] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.560234] Unpacking initramfs...
[    0.560234] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c406=
60462 ecap 2ff05056
[    0.560238] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.560252] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c4066=
0462 ecap f050d2
[    0.560256] DMAR: RMRR base: 0x0000009864f000 end: 0x0000009866efff
[    0.560257] DMAR: RMRR base: 0x0000009b000000 end: 0x0000009f7fffff
[    0.560261] DMAR: No ATSR found
[    0.560262] DMAR: No SATC found
[    0.560288] DMAR: dmar1: Using Queued invalidation
[    0.560388] pci 0000:00:00.0: Adding to iommu group 0
[    0.560394] pci 0000:00:04.0: Adding to iommu group 1
[    0.560400] pci 0000:00:08.0: Adding to iommu group 2
[    0.560428] pci 0000:00:12.0: Adding to iommu group 3
[    0.560438] pci 0000:00:14.0: Adding to iommu group 4
[    0.560443] pci 0000:00:14.2: Adding to iommu group 4
[    0.560449] pci 0000:00:14.3: Adding to iommu group 5
[    0.560456] pci 0000:00:16.0: Adding to iommu group 6
[    0.560478] pci 0000:00:1c.0: Adding to iommu group 7
[    0.560496] pci 0000:00:1c.4: Adding to iommu group 8
[    0.560519] pci 0000:00:1d.0: Adding to iommu group 9
[    0.560535] pci 0000:00:1d.4: Adding to iommu group 10
[    0.560552] pci 0000:00:1f.0: Adding to iommu group 11
[    0.560558] pci 0000:00:1f.3: Adding to iommu group 11
[    0.560564] pci 0000:00:1f.4: Adding to iommu group 11
[    0.560569] pci 0000:00:1f.5: Adding to iommu group 11
[    0.560575] pci 0000:00:1f.6: Adding to iommu group 11
[    0.560595] pci 0000:02:00.0: Adding to iommu group 12
[    0.560613] pci 0000:03:00.0: Adding to iommu group 13
[    0.560629] pci 0000:04:00.0: Adding to iommu group 14
[    0.560646] pci 0000:04:01.0: Adding to iommu group 15
[    0.560666] pci 0000:04:02.0: Adding to iommu group 16
[    0.560668] pci 0000:05:00.0: Adding to iommu group 14
[    0.560671] pci 0000:2b:00.0: Adding to iommu group 16
[    0.560689] pci 0000:2e:00.0: Adding to iommu group 17
[    0.561345] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.561348] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.561348] software IO TLB: mapped [mem 0x000000008d1da000-0x00000000=
911da000] (64MB)
[    0.561358] ACPI: bus type thunderbolt registered
[    0.561528] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002)
[    0.741368] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 6553=
60 ms ovfl timer
[    0.741370] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    0.741371] RAPL PMU: hw unit of domain package 2^-14 Joules
[    0.741372] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    0.741372] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    0.741372] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    0.741469] resource sanity check: requesting [mem 0xfed10000-0xfed15f=
ff], which spans more than pnp 00:07 [mem 0xfed10000-0xfed13fff]
[    0.741471] caller snb_uncore_imc_init_box+0x78/0xc0 mapping multiple =
BARs
[    0.742270] Initialise system trusted keyrings
[    0.742304] workingset: timestamp_bits=3D62 max_order=3D23 bucket_orde=
r=3D0
[    0.742989] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.743025] 9p: Installing v9fs 9p2000 file system support
[    0.748465] NET: Registered PF_ALG protocol family
[    0.748467] Key type asymmetric registered
[    0.748468] Asymmetric key parser 'x509' registered
[    0.748474] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 248)
[    0.748475] io scheduler mq-deadline registered
[    0.748476] io scheduler kyber registered
[    0.753320] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
=2E4
[    0.755584] acpiphp_ibm: ibm_acpiphp_init: acpi_walk_namespace failed
[    0.756330] ACPI: AC: AC Adapter [AC] (on-line)
[    0.756381] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0E:00/input/input0
[    0.756529] ACPI: button: Sleep Button [SLPB]
[    0.756548] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0D:00/input/input1
[    0.756697] ACPI: button: Lid Switch [LID]
[    0.756718] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input2
[    0.756765] ACPI: button: Power Button [PWRF]
[    0.761364] thermal LNXTHERM:00: registered as thermal_zone0
[    0.761365] ACPI: thermal: Thermal Zone [THM0] (47 C)
[    0.762148] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.762464] Non-volatile memory driver v1.3
[    0.762493] Linux agpgart interface v0.103
[    0.762635] ACPI: bus type drm_connector registered
[    0.762798] i915 0000:00:02.0: enabling device (0006 -> 0007)
[    0.784476] [drm] Retrieving EDID 0000000000000000 for connector 00000=
000ba221aa9 (eDP-1)!
[    0.798731] ACPI: battery: Slot [BAT0] (battery present)
[    0.811823] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on =
minor 0
[    0.814197] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no=
  post: no)
[    0.814276] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A=
08:00/LNXVIDEO:00/input/input3
[    0.847905] fbcon: i915drmfb (fb0) is primary device
[    0.860975] Console: switching to colour frame buffer device 240x67
[    0.878482] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer devic=
e
[    1.805480] tsc: Refined TSC clocksource calibration: 2303.999 MHz
[    1.805502] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
135f6faae8, max_idle_ns: 440795313647 ns
[    1.805616] clocksource: Switched to clocksource tsc
[    2.401378] Freeing initrd memory: 36796K
[    2.401500] i915 0000:00:02.0: Direct firmware load for i915/gvt/vid_0=
x8086_did_0x9b41_rid_0x02.golden_hw_state failed with error -2
[    2.401808] i915 0000:00:02.0: [drm] Finished loading DMC firmware i91=
5/kbl_dmc_ver1_04.bin (v1.4)
[    2.403516] slvmgt: GVT-based vGPU support is available.
[    2.404561] loop: module loaded
[    2.404958] nvme nvme0: pci function 0000:2e:00.0
[    2.405174] tun: Universal TUN/TAP device driver, 1.6
[    2.405199] e100: Intel(R) PRO/100 Network Driver
[    2.405200] e100: Copyright(c) 1999-2006 Intel Corporation
[    2.405205] e1000: Intel(R) PRO/1000 Network Driver
[    2.405206] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    2.405213] e1000e: Intel(R) PRO/1000 Network Driver
[    2.405213] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.405901] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) =
set to dynamic conservative mode
[    2.430260] nvme nvme0: 8/0/0 default/read/poll queues
[    2.437220]  nvme0n1: p3 p5
[    2.602272] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): register=
ed PHC clock
[    2.669866] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 5=
4:05:db:12:2a:f1
[    2.669869] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connec=
tion
[    2.669984] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No: FFFFFF=
-0FF
[    2.670004] sky2: driver version 1.30
[    2.670030] Intel(R) Wireless WiFi driver for Linux
[    2.670088] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    2.675362] iwlwifi 0000:00:14.3: api flags index 2 larger than suppor=
ted by driver
[    2.675369] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 8=
9.3.35.37
[    2.675552] iwlwifi 0000:00:14.3: loaded firmware version 72.daa05125.=
0 QuZ-a0-hr-b0-72.ucode op_mode iwlmvm
[    2.676354] modprobe (95) used greatest stack depth: 13432 bytes left
[    2.677022] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6 AX201 160M=
Hz, REV=3D0x351
[    2.677047] thermal thermal_zone1: failed to read out thermal zone (-6=
1)
[    2.806098] iwlwifi 0000:00:14.3: Detected RF HR B3, rfid=3D0x10a100
[    2.874891] iwlwifi 0000:00:14.3: base HW address: 34:2e:b7:52:c0:92
[    2.890885] usbcore: registered new interface driver r8152
[    2.890891] usbcore: registered new interface driver asix
[    2.890893] usbcore: registered new interface driver ax88179_178a
[    2.890896] usbcore: registered new interface driver cdc_ether
[    2.890899] usbcore: registered new interface driver net1080
[    2.890901] usbcore: registered new interface driver zaurus
[    2.890905] usbcore: registered new interface driver cdc_ncm
[    2.890907] usbcore: registered new interface driver qmi_wwan
[    2.890910] usbcore: registered new interface driver cdc_mbim
[    2.890912] usbcore: registered new interface driver r8153_ecm
[    2.891406] VFIO - User Level meta-driver version: 0.3
[    2.891805] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.891809] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 1
[    2.891826] xhci_hcd 0000:00:14.0: Disabled LPM!
[    2.892919] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0=
x110 quirks 0x0000000000009010
[    2.893229] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.893230] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 2
[    2.893231] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
[    2.893250] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.01
[    2.893251] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.893252] usb usb1: Product: xHCI Host Controller
[    2.893253] usb usb1: Manufacturer: Linux 6.1.31+ xhci-hcd
[    2.893254] usb usb1: SerialNumber: 0000:00:14.0
[    2.893406] hub 1-0:1.0: USB hub found
[    2.893470] hub 1-0:1.0: 12 ports detected
[    2.894502] usb usb2: We don't know the algorithms for LPM for this ho=
st, disabling LPM.
[    2.894512] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.01
[    2.894514] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.894515] usb usb2: Product: xHCI Host Controller
[    2.894516] usb usb2: Manufacturer: Linux 6.1.31+ xhci-hcd
[    2.894516] usb usb2: SerialNumber: 0000:00:14.0
[    2.894616] hub 2-0:1.0: USB hub found
[    2.894625] hub 2-0:1.0: 6 ports detected
[    2.895109] usb: port power management may be unreliable
[    2.895328] xhci_hcd 0000:2b:00.0: xHCI Host Controller
[    2.895330] xhci_hcd 0000:2b:00.0: new USB bus registered, assigned bu=
s number 3
[    2.895354] xhci_hcd 0000:2b:00.0: Disabled LPM!
[    2.896515] xhci_hcd 0000:2b:00.0: hcc params 0x200077c1 hci version 0=
x110 quirks 0x0000000200009010
[    2.896985] xhci_hcd 0000:2b:00.0: xHCI Host Controller
[    2.896986] xhci_hcd 0000:2b:00.0: new USB bus registered, assigned bu=
s number 4
[    2.896987] xhci_hcd 0000:2b:00.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
[    2.897005] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.01
[    2.897006] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.897007] usb usb3: Product: xHCI Host Controller
[    2.897007] usb usb3: Manufacturer: Linux 6.1.31+ xhci-hcd
[    2.897008] usb usb3: SerialNumber: 0000:2b:00.0
[    2.897079] hub 3-0:1.0: USB hub found
[    2.897085] hub 3-0:1.0: 2 ports detected
[    2.897960] usb usb4: We don't know the algorithms for LPM for this ho=
st, disabling LPM.
[    2.897968] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.01
[    2.897969] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    2.897970] usb usb4: Product: xHCI Host Controller
[    2.897970] usb usb4: Manufacturer: Linux 6.1.31+ xhci-hcd
[    2.897971] usb usb4: SerialNumber: 0000:2b:00.0
[    2.898038] hub 4-0:1.0: USB hub found
[    2.898044] hub 4-0:1.0: 2 ports detected
[    2.899048] usbcore: registered new interface driver cdc_acm
[    2.899049] cdc_acm: USB Abstract Control Model driver for USB modems =
and ISDN adapters
[    2.899053] usbcore: registered new interface driver usblp
[    2.899056] usbcore: registered new interface driver cdc_wdm
[    2.899149] usbcore: registered new interface driver uas
[    2.899156] usbcore: registered new interface driver usb-storage
[    2.899159] usbcore: registered new interface driver ums-datafab
[    2.899162] usbcore: registered new interface driver ums-freecom
[    2.899165] usbcore: registered new interface driver ums-isd200
[    2.899168] usbcore: registered new interface driver ums-jumpshot
[    2.899171] usbcore: registered new interface driver ums-sddr09
[    2.899173] usbcore: registered new interface driver ums-sddr55
[    2.899175] usbcore: registered new interface driver ums-usbat
[    2.907117] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
[    2.910924] serio: i8042 KBD port at 0x60,0x64 irq 1
[    2.910927] serio: i8042 AUX port at 0x60,0x64 irq 12
[    2.911176] mousedev: PS/2 mouse device common for all mice
[    2.911747] rtc_cmos 00:03: RTC can wake from S4
[    2.914295] rtc_cmos 00:03: registered as rtc0
[    2.914364] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvr=
am
[    2.914483] fail to initialize ptp_kvm
[    2.914765] input: AT Raw Set 2 keyboard as /devices/platform/i8042/se=
rio0/input/input4
[    2.914997] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    2.915113] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    2.921756] Consider using thermal netlink events interface
[    2.922538] i2c i2c-7: 2/4 memory slots populated (from DMI)
[    2.923348] i2c i2c-7: Successfully instantiated SPD at 0x51
[    2.924571] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    2.927223] intel_rapl_common: Found RAPL domain package
[    2.927224] intel_rapl_common: Found RAPL domain dram
[    2.927366] intel_pch_thermal 0000:00:12.0: enabling device (0000 -> 0=
002)
[    2.927676] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D=
6, TCOBASE=3D0x0400)
[    2.927794] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayo=
ut=3D0)
[    2.927802] intel_pstate: Intel P-state driver initializing
[    2.929404] intel_pstate: HWP enabled
[    2.929428] hid: raw HID events driver (C) Jiri Kosina
[    2.929465] usbcore: registered new interface driver usbhid
[    2.929466] usbhid: USB HID core driver
[    2.929566] fujitsu_laptop: driver 0.6.0 successfully loaded
[    2.930058] lenovo_wmi: BIOS setting (0): WakeOnLAN=3DACOnly
[    2.930554] lenovo_wmi: BIOS setting (1): WakeOnLANDock=3DEnable
[    2.930983] lenovo_wmi: BIOS setting (2): EthernetLANOptionROM=3DEnabl=
e
[    2.931431] lenovo_wmi: BIOS setting (3): IPv4NetworkStack=3DEnable
[    2.931860] lenovo_wmi: BIOS setting (4): IPv6NetworkStack=3DEnable
[    2.932285] lenovo_wmi: BIOS setting (5): UefiPxeBootPriority=3DIPv4Fi=
rst
[    2.932764] lenovo_wmi: BIOS setting (6): WirelessAutoDisconnection=3D=
Disable
[    2.933191] lenovo_wmi: BIOS setting (7): MACAddressPassThrough=3DEnab=
le
[    2.933640] lenovo_wmi: BIOS setting (8): AlwaysOnUSB=3DEnable
[    2.934067] lenovo_wmi: BIOS setting (9): TrackPoint=3DAutomatic
[    2.934544] lenovo_wmi: BIOS setting (10): TouchPad=3DAutomatic
[    2.935013] lenovo_wmi: BIOS setting (11): FnCtrlKeySwap=3DDisable
[    2.935524] lenovo_wmi: BIOS setting (12): FnSticky=3DDisable
[    2.935968] lenovo_wmi: BIOS setting (13): FnKeyAsPrimary=3DEnable
[    2.936450] lenovo_wmi: BIOS setting (14): BootDisplayDevice=3DLCD
[    2.936908] lenovo_wmi: BIOS setting (15): SharedDisplayPriority=3DUSB=
TypeC
[    2.937384] lenovo_wmi: BIOS setting (16): TotalGraphicsMemory=3D512MB=

[    2.937875] lenovo_wmi: BIOS setting (17): BootTimeExtension=3DDisable=

[    2.938341] lenovo_wmi: BIOS setting (18): SpeedStep=3DEnable
[    2.938845] lenovo_wmi: BIOS setting (19): AdaptiveThermalManagementAC=
=3DMaximizePerformance
[    2.939310] lenovo_wmi: BIOS setting (20): AdaptiveThermalManagementBa=
ttery=3DBalanced
[    2.939825] lenovo_wmi: BIOS setting (21): CPUPowerManagement=3DAutoma=
tic
[    2.940294] lenovo_wmi: BIOS setting (22): OnByAcAttach=3DDisable
[    2.940824] lenovo_wmi: BIOS setting (23): PasswordBeep=3DDisable
[    2.941326] lenovo_wmi: BIOS setting (24): KeyboardBeep=3DEnable
[    2.941845] lenovo_wmi: BIOS setting (25): HyperThreadingTechnology=3D=
Enable
[    2.942347] lenovo_wmi: BIOS setting (26): AMTControl=3DDisable
[    2.942873] lenovo_wmi: BIOS setting (27): USBKeyProvisioning=3DDisabl=
e
[    2.943377] lenovo_wmi: BIOS setting (28): ThunderboltSecurityLevel=3D=
UserAuthorization
[    2.945861] lenovo_wmi: BIOS setting (29): PreBootForThunderboltDevice=
=3DDisable
[    2.946366] lenovo_wmi: BIOS setting (30): SystemManagementPasswordCon=
trol=3DDisable
[    2.946914] lenovo_wmi: BIOS setting (31): PowerOnPasswordControl=3DDi=
sable
[    2.947838] lenovo_wmi: BIOS setting (32): HardDiskPasswordControl=3DD=
isable
[    2.950020] lenovo_wmi: BIOS setting (33): BIOSSetupConfigurations=3DD=
isable
[    2.950539] lenovo_wmi: BIOS setting (34): LockBIOSSetting=3DDisable
[    2.951040] lenovo_wmi: BIOS setting (35): MinimumPasswordLength=3DDis=
able
[    2.951560] lenovo_wmi: BIOS setting (36): BIOSPasswordAtUnattendedBoo=
t=3DDisable
[    2.952057] lenovo_wmi: BIOS setting (37): BIOSPasswordAtReboot=3DDisa=
ble
[    2.953030] lenovo_wmi: BIOS setting (38): BIOSPasswordAtBootDeviceLis=
t=3DDisable
[    2.953714] lenovo_wmi: BIOS setting (39): PasswordCountExceededError=3D=
Disable
[    2.954604] lenovo_wmi: BIOS setting (40): FingerprintPredesktopAuthen=
tication=3DDisable
[    2.956144] lenovo_wmi: BIOS setting (41): FingerprintSecurityMode=3DN=
ormal
[    2.956636] lenovo_wmi: BIOS setting (42): FingerprintPasswordAuthenti=
cation=3DEnable
[    2.957157] lenovo_wmi: BIOS setting (43): SecurityChip=3DDisable
[    2.959790] lenovo_wmi: BIOS setting (44): TXTFeature=3DDisable
[    2.961054] lenovo_wmi: BIOS setting (45): PhysicalPresenceForTpmClear=
=3DEnable
[    2.961551] lenovo_wmi: BIOS setting (46): BIOSUpdateByEndUsers=3DDisa=
ble
[    2.962828] lenovo_wmi: BIOS setting (47): SecureRollBackPrevention=3D=
Enable
[    2.963516] lenovo_wmi: BIOS setting (48): WindowsUEFIFirmwareUpdate=3D=
Enable
[    2.963978] lenovo_wmi: BIOS setting (49): DataExecutionPrevention=3DE=
nable
[    2.964471] lenovo_wmi: BIOS setting (50): VirtualizationTechnology=3D=
Enable
[    2.964942] lenovo_wmi: BIOS setting (51): VTdFeature=3DEnable
[    2.965435] lenovo_wmi: BIOS setting (52): EnhancedWindowsBiometricSec=
urity=3DDisable
[    2.965895] lenovo_wmi: BIOS setting (53): EthernetLANAccess=3DEnable
[    2.966359] lenovo_wmi: BIOS setting (54): WirelessLANAccess=3DEnable
[    2.967621] lenovo_wmi: BIOS setting (55): WirelessWANAccess=3DEnable
[    2.968094] lenovo_wmi: BIOS setting (56): BluetoothAccess=3DEnable
[    2.968581] lenovo_wmi: BIOS setting (57): USBPortAccess=3DEnable
[    2.971098] lenovo_wmi: BIOS setting (58): MemoryCardSlotAccess=3DEnab=
le
[    2.972369] lenovo_wmi: BIOS setting (59): SmartCardSlotAccess=3DEnabl=
e
[    2.972872] lenovo_wmi: BIOS setting (60): IntegratedCameraAccess=3DEn=
able
[    2.973343] lenovo_wmi: BIOS setting (61): IntegratedAudioAccess=3DEna=
ble
[    2.974743] lenovo_wmi: BIOS setting (62): MicrophoneAccess=3DEnable
[    2.975378] lenovo_wmi: BIOS setting (63): FingerprintReaderAccess=3DE=
nable
[    2.976696] lenovo_wmi: BIOS setting (64): ThunderboltAccess=3DEnable
[    2.977166] lenovo_wmi: BIOS setting (65): NfcAccess=3DEnable
[    2.977650] lenovo_wmi: BIOS setting (66): BottomCoverTamperDetected=3D=
Enable
[    2.980172] lenovo_wmi: BIOS setting (67): InternalStorageTamper=3DEna=
ble
[    2.981540] lenovo_wmi: BIOS setting (68): AbsolutePersistenceModuleAc=
tivation=3DDisable
[    2.982318] lenovo_wmi: BIOS setting (70): SecureBoot=3DEnable
[    2.982833] lenovo_wmi: BIOS setting (71): SGXControl=3DDisable
[    2.984167] lenovo_wmi: BIOS setting (72): DeviceGuard=3DDisable
[    2.986623] lenovo_wmi: BIOS setting (73): KernelDMAProtection=3DDisab=
le
[    2.987109] lenovo_wmi: BIOS setting (74): ThinkShieldsecurewipe=3DDis=
able
[    2.988191] lenovo_wmi: BIOS setting (77): BootMode=3DQuick
[    2.989111] lenovo_wmi: BIOS setting (78): StartupOptionKeys=3DEnable
[    2.991156] lenovo_wmi: BIOS setting (79): BootDeviceListF12Option=3DE=
nable
[    2.991820] lenovo_wmi: BIOS setting (80): BootOrder=3DUSBHDD:NVMe0:NV=
Me1:USBCD:USBFDD:PXEBOOT
[    2.992385] lenovo_wmi: BIOS setting (81): NetworkBoot=3DPXEBOOT
[    2.993116] lenovo_wmi: BIOS setting (82): BootOrderLock=3DDisable
[    2.994365] lenovo_wmi: BIOS setting (84): I8254ClockGating=3DAuto
[    2.995853] lenovo_wmi: BIOS setting (85): ThunderboltBIOSAssistMode=3D=
Disable
[    2.996334] lenovo_wmi: BIOS setting (86): WiFiNetworkBoot=3DDisable
[    2.996873] lenovo_wmi: BIOS setting (87): LenovoCloudServices=3DDisab=
le
[    2.999642] lenovo_wmi: BIOS setting (88): SleepState=3DLinux
[    3.001071] lenovo_wmi: BIOS setting (89): SetupUI=3DGraphical
[    3.001579] lenovo_wmi: BIOS setting (90): StrongPassword=3DDisable
[    3.003122] lenovo_wmi: BIOS setting (91): KeyboardLayout=3DEnglish_US=

[    3.003752] lenovo_wmi: BIOS setting (92): ChargeInBatteryMode=3DDisab=
le
[    3.004233] lenovo_wmi: BIOS setting (93): Reserved=3DEnable
[    3.004735] lenovo_wmi: BIOS setting (94): WakeUponAlarm=3DDisable
[    3.005225] lenovo_wmi: BIOS setting (95): AlarmTime=3D00:00:00
[    3.005728] lenovo_wmi: BIOS setting (96): AlarmDate=3D01\01\2020
[    3.006221] lenovo_wmi: BIOS setting (97): AlarmDayofWeek=3DSunday
[    3.006739] lenovo_wmi: BIOS setting (98): UserDefinedAlarmSunday=3DDi=
sable
[    3.007246] lenovo_wmi: BIOS setting (99): UserDefinedAlarmMonday=3DDi=
sable
[    3.008747] lenovo_wmi: BIOS setting (100): UserDefinedAlarmTuesday=3D=
Disable
[    3.009227] lenovo_wmi: BIOS setting (101): UserDefinedAlarmWednesday=3D=
Disable
[    3.009734] lenovo_wmi: BIOS setting (102): UserDefinedAlarmThursday=3D=
Disable
[    3.012243] lenovo_wmi: BIOS setting (103): UserDefinedAlarmFriday=3DD=
isable
[    3.013600] lenovo_wmi: BIOS setting (104): UserDefinedAlarmSaturday=3D=
Disable
[    3.014139] lenovo_wmi: BIOS setting (105): UserDefinedAlarmTime=3D00:=
00:00
[    3.088669] lenovo_wmi: BIOS capabilities: 0xff
[    3.088779] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[    3.088780] thinkpad_acpi: http://ibm-acpi.sf.net/
[    3.088780] thinkpad_acpi: ThinkPad BIOS N2XET24S (3.14 ), EC N2XHT25W=

[    3.088781] thinkpad_acpi: Lenovo ThinkPad T14 Gen 1, model 20S1S19N00=

[    3.088899] thinkpad_acpi: radio switch found; radios are enabled
[    3.088928] thinkpad_acpi: This ThinkPad has standard ACPI backlight b=
rightness control, supported by the ACPI video driver
[    3.088928] thinkpad_acpi: Disabling thinkpad-acpi brightness events b=
y default...
[    3.092753] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is=
 unblocked
[    3.092902] thinkpad_acpi: Forcing WWAN always present
[    3.093929] ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get u=
sb role switch
[    3.096108] thinkpad_acpi: rfkill switch tpacpi_wwan_sw: radio is bloc=
ked
[    3.119031] thinkpad_acpi: battery 1 registered (start 0, stop 100, be=
haviours: 0x7)
[    3.119036] ACPI: battery: new extension: ThinkPad Battery Extension
[    3.124256] input: ThinkPad Extra Buttons as /devices/platform/thinkpa=
d_acpi/input/input7
[    3.125605] intel_rapl_common: Found RAPL domain package
[    3.125608] intel_rapl_common: Found RAPL domain core
[    3.125610] intel_rapl_common: Found RAPL domain uncore
[    3.125613] intel_rapl_common: Found RAPL domain dram
[    3.125615] intel_rapl_common: Found RAPL domain psys
[    3.126267] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/su=
bclass/prog-if info 0x040380
[    3.126301] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+=
 platform, using SOF driver
[    3.126317] usbcore: registered new interface driver snd-usb-audio
[    3.126360] snd_soc_skl 0000:00:1f.3: DSP detected with PCI class/subc=
lass/prog-if info 0x040380
[    3.126393] snd_soc_skl 0000:00:1f.3: Digital mics found on Skylake+ p=
latform, using SOF driver
[    3.126446] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PC=
I class/subclass/prog-if info 0x040380
[    3.126479] sof-audio-pci-intel-cnl 0000:00:1f.3: Digital mics found o=
n Skylake+ platform, using SOF driver
[    3.126509] sof-audio-pci-intel-cnl 0000:00:1f.3: enabling device (000=
4 -> 0006)
[    3.126618] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PC=
I class/subclass/prog-if 0x040380
[    3.126648] sof-audio-pci-intel-cnl 0000:00:1f.3: bound 0000:00:02.0 (=
ops i915_audio_component_bind_ops)
[    3.127075] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    3.127145] Initializing XFRM netlink socket
[    3.127148] IPsec XFRM device driver
[    3.127213] NET: Registered PF_INET6 protocol family
[    3.127474] Segment Routing with IPv6
[    3.127478] In-situ OAM (IOAM) with IPv6
[    3.127497] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    3.127609] NET: Registered PF_PACKET protocol family
[    3.127611] NET: Registered PF_KEY protocol family
[    3.127614] 8021q: 802.1Q VLAN Support v1.8
[    3.127629] 9pnet: Installing 9P2000 support
[    3.128222] microcode: sig=3D0x806ec, pf=3D0x4, revision=3D0xf0
[    3.128289] microcode: Microcode Update Driver: v2.2.
[    3.128293] IPI shorthand broadcast: enabled
[    3.128306] sched_clock: Marking stable (3111966637, 16161958)->(31852=
10988, -57082393)
[    3.128548] Loading compiled-in X.509 certificates
[    3.130547] Loaded X.509 cert 'Build time autogenerated kernel key: 85=
4b2eca7c94c6635bd6df892eb39995346d66aa'
[    3.130638] pstore: Using crash dump compression: deflate
[    3.131374] PM:   Magic number: 11:632:975
[    3.131451] platform PNP0C0E:00: hash matches
[    3.131463] button PNP0C0E:00: hash matches
[    3.131507] cfg80211: Loading compiled-in X.509 certificates for regul=
atory database
[    3.132883] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'=

[    3.132890] ALSA device list:
[    3.132891]   No soundcards found.
[    3.133284] sof-audio-pci-intel-cnl 0000:00:1f.3: use msi interrupt mo=
de
[    3.133618] Freeing unused kernel image (initmem) memory: 2028K
[    3.137615] Write protecting the kernel read-only data: 28672k
[    3.137617] usb 1-1: new full-speed USB device number 2 using xhci_hcd=

[    3.137668] ucsi_acpi USBC000:00: PPM init failed (-19)
[    3.138063] Freeing unused kernel image (text/rodata gap) memory: 2036=
K
[    3.138317] Freeing unused kernel image (rodata/data gap) memory: 1648=
K
[    3.138746] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    3.138750] Run /init as init process
[    3.138751]   with arguments:
[    3.138751]     /init
[    3.138752]     sina_toram
[    3.138752]   with environment:
[    3.138753]     HOME=3D/
[    3.138753]     TERM=3Dlinux
[    3.144092] sof-audio-pci-intel-cnl 0000:00:1f.3: hda codecs found, ma=
sk 5
[    3.144094] sof-audio-pci-intel-cnl 0000:00:1f.3: using HDA machine dr=
iver skl_hda_dsp_generic now
[    3.144097] sof-audio-pci-intel-cnl 0000:00:1f.3: DMICs detected in NH=
LT tables: 2
[    3.144205] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: versi=
on 2:2:0-57864
[    3.144207] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:22:1=
 Kernel ABI 3:23:0
[    3.144210] sof-audio-pci-intel-cnl 0000:00:1f.3: unknown sof_ext_man =
header type 3 size 0x30
[    3.261869] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: versi=
on 2:2:0-57864
[    3.261872] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:22:1=
 Kernel ABI 3:23:0
[    3.262138] sof-audio-pci-intel-cnl 0000:00:1f.3: Topology: ABI 3:22:1=
 Kernel ABI 3:23:0
[    3.262290] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card=
 not yet available, widget card binding deferred
[    3.274761] ACPI Error: Needed [Integer/String/Buffer], found [Package=
] 00000000e717e677 (20220331/exresop-469)
[    3.274766] ACPI Error: AE_AML_OPERAND_TYPE, While resolving operands =
for [OpcodeName unavailable] (20220331/dswexec-431)
[    3.274768] ACPI Error: Aborting method \ADBG due to previous error (A=
E_AML_OPERAND_TYPE) (20220331/psparse-529)
[    3.274771] ACPI Error: Aborting method \_SB.HIDD._DSM due to previous=
 error (AE_AML_OPERAND_TYPE) (20220331/psparse-529)
[    3.274776] ACPI: \_SB_.HIDD: failed to evaluate _DSM b356ecee-4244-8f=
40-a792-4edd4d758054 (0x3003)
[    3.274802] input: Intel HID events as /devices/platform/INT33D5:00/in=
put/input8
[    3.277628] usb 1-1: New USB device found, idVendor=3D058f, idProduct=3D=
9540, bcdDevice=3D 1.20
[    3.277631] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    3.277632] usb 1-1: Product: EMV Smartcard Reader
[    3.277633] usb 1-1: Manufacturer: Generic
[    3.282670] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC257: =
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    3.282673] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=3D0 (0x=
0/0x0/0x0/0x0/0x0)
[    3.282674] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=3D1 (0x21/0x=
0/0x0/0x0/0x0)
[    3.282675] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=3D0x0=

[    3.282676] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    3.282677] snd_hda_codec_realtek ehdaudio0D0:      Mic=3D0x19
[    3.331816] snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1T=
X overwritten
[    3.331822] snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF=
1RX overwritten
[    3.331914] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 hifi3 overwritten
[    3.331919] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 hifi2 overwritten
[    3.331922] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 hifi1 overwritten
[    3.331925] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Codec Output Pin1 overwritten
[    3.331928] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Codec Input Pin1 overwritten
[    3.331932] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Analog Codec Playback overwritten
[    3.331935] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Digital Codec Playback overwritten
[    3.331939] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Alt Analog Codec Playback overwritten
[    3.331944] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Analog Codec Capture overwritten
[    3.331948] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Digital Codec Capture overwritten
[    3.331952] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Alt Analog Codec Capture overwritten
[    3.348621] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3=
/skl_hda_dsp_generic/sound/card0/input9
[    3.348657] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:0=
0:1f.3/skl_hda_dsp_generic/sound/card0/input10
[    3.348682] input: sof-hda-dsp HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input11
[    3.348706] input: sof-hda-dsp HDMI/DP,pcm=3D4 as /devices/pci0000:00/=
0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input12
[    3.348739] input: sof-hda-dsp HDMI/DP,pcm=3D5 as /devices/pci0000:00/=
0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input13
[    3.382592] usb 2-4: new SuperSpeed USB device number 2 using xhci_hcd=

[    3.395449] usb 2-4: New USB device found, idVendor=3D0781, idProduct=3D=
558b, bcdDevice=3D 1.00
[    3.395452] usb 2-4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    3.395454] usb 2-4: Product: Extreme
[    3.395455] usb 2-4: Manufacturer: SanDisk
[    3.395456] usb 2-4: SerialNumber: 4C530001100407111532
[    3.396487] usb-storage 2-4:1.0: USB Mass Storage device detected
[    3.396791] scsi host0: usb-storage 2-4:1.0
[    3.508760] usb 1-7: new high-speed USB device number 3 using xhci_hcd=

[    3.801371] psmouse serio1: synaptics: queried max coordinates: x [..5=
678], y [..4694]
[    3.839821] psmouse serio1: synaptics: queried min coordinates: x [126=
6..], y [1162..]
[    3.839840] psmouse serio1: synaptics: Trying to set up SMBus access
[    3.846946] rmi4_smbus 7-002c: registering SMbus-connected sensor
[    3.967644] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Syn=
aptics, product: TM3471-010, fw id: 2867793
[    4.071091] input: Synaptics TM3471-010 as /devices/pci0000:00/0000:00=
:1f.4/i2c-7/7-002c/rmi4-00/input/input14
[    4.083826] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
[    4.208711] psmouse serio2: trackpoint: Elan TrackPoint firmware: 0x11=
, buttons: 3/3
[    4.252657] input: TPPS/2 Elan TrackPoint as /devices/pci0000:00/0000:=
00:1f.4/i2c-7/7-002c/rmi4-00/rmi4-00.fn03/serio2/input/input15
[    4.431112] scsi 0:0:0:0: Direct-Access     SanDisk  Extreme          =
1.00 PQ: 0 ANSI: 6
[    4.432745] sd 0:0:0:0: [sda] 122552320 512-byte logical blocks: (62.7=
 GB/58.4 GiB)
[    4.434052] sd 0:0:0:0: [sda] Write Protect is off
[    4.434063] sd 0:0:0:0: [sda] Mode Sense: 43 00 00 00
[    4.434944] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabl=
ed, doesn't support DPO or FUA
[    4.441294]  sda: sda1
[    4.441688] sd 0:0:0:0: [sda] Attached SCSI removable disk
[    5.861795] usb 1-7: New USB device found, idVendor=3D2cb7, idProduct=3D=
0007, bcdDevice=3D 3.33
[    5.861810] usb 1-7: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    5.861816] usb 1-7: Product: L850-GL
[    5.861820] usb 1-7: Manufacturer: Fibocom Wireless Inc.
[    5.861824] usb 1-7: SerialNumber: 004999010640000
[    5.919578] cdc_mbim 1-7:1.0: setting rx_max =3D 16384
[    5.921142] cdc_mbim 1-7:1.0: cdc-wdm0: USB WDM device
[    5.921908] cdc_mbim 1-7:1.0 wwan0: register 'cdc_mbim' at usb-0000:00=
:14.0-7, CDC MBIM, 0a:ab:e7:8b:63:c5
[    5.926090] cdc_acm 1-7:1.2: ttyACM0: USB ACM device
[    5.930050] cdc_acm 1-7:1.4: ttyACM1: USB ACM device
[    5.934039] cdc_acm 1-7:1.6: ttyACM2: USB ACM device
[    6.050007] usb 1-8: new high-speed USB device number 4 using xhci_hcd=

[    6.198654] usb 1-8: New USB device found, idVendor=3D04ca, idProduct=3D=
7070, bcdDevice=3D 0.25
[    6.198668] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    6.198673] usb 1-8: Product: Integrated Camera
[    6.198678] usb 1-8: Manufacturer: 8SSC20F27068L1GZ04LE286
[    6.315879] usb 1-10: new full-speed USB device number 5 using xhci_hc=
d
[    6.445132] usb 1-10: New USB device found, idVendor=3D8087, idProduct=
=3D0026, bcdDevice=3D 0.02
[    6.445147] usb 1-10: New USB device strings: Mfr=3D0, Product=3D0, Se=
rialNumber=3D0
[    6.567501] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialise=
d: dm-devel@redhat.com
[   10.581130] (udev-worker) (168) used greatest stack depth: 13424 bytes=
 left
[   10.581147] (udev-worker) (166) used greatest stack depth: 13160 bytes=
 left
[   17.060992] loop8: detected capacity change from 0 to 1907400
[   17.495071] systemd[1]: Failed to find module 'autofs4'
[   17.523713] systemd[1]: systemd 253-3-g9ac6bc9 running in system mode =
(-PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS -OPE=
NSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTS=
ETUP -LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2 -LZ4 -XZ =
-ZLIB -ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP -SYSVINIT default-hierarchy=3D=
unified)
[   17.523717] systemd[1]: Detected architecture x86-64.
[   17.523747] systemd[1]: Detected first boot.
[   17.523815] systemd[1]: No hostname configured, using default hostname=
=2E
[   17.523829] systemd[1]: Hostname set to <localhost>.
[   17.529818] systemd[1]: Failed to configure loopback network device: O=
peration not permitted
[   17.642501] systemd[1]: Failed to populate /etc with preset unit setti=
ngs, ignoring: File exists
[   17.700118] systemd[1]: Started debugshell.service.
[   17.700305] systemd[1]: Reached target debugshell.target.
[   17.705590] systemd[1]: Startup finished in 17.395s (kernel) + 294ms (=
userspace) =3D 17.689s.
[   17.705702] systemd[1]: System is tainted: unmerged-usr
[   33.245866] ------------[ cut here ]------------
[   33.245868] thunderbolt 0000:05:00.0: interrupt for TX ring 0 is alrea=
dy enabled
[   33.245880] WARNING: CPU: 3 PID: 259 at drivers/thunderbolt/nhi.c:137 =
ring_interrupt_active+0x244/0x2d0
[   33.245886] Modules linked in: dm_mod pinctrl_cannonlake pinctrl_intel=
 intel_hid
[   33.245890] CPU: 3 PID: 259 Comm: cat Not tainted 6.1.31+ #1
[   33.245892] Hardware name: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S=
 (3.14 ) 10/10/2020
[   33.245893] RIP: 0010:ring_interrupt_active+0x244/0x2d0
[   33.245896] Code: 08 44 89 04 24 e8 0c 8a cf ff 4c 8b 4c 24 08 44 8b 0=
4 24 4c 89 f2 48 8b 4c 24 10 48 89 c6 48 c7 c7 50 f1 f5 95 e8 fc 74 5a ff=
 <0f> 0b 44 8b 5c 24 04 49 8b 47 08 40 84 ed 0f 85 e9 fe ff ff f6 40
[   33.245898] RSP: 0018:ffff936e01a9fba8 EFLAGS: 00010082
[   33.245899] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000000
[   33.245900] RDX: 0000000000000004 RSI: 00000000ffffffea RDI: 00000000f=
fffffff
[   33.245901] RBP: 0000000000000001 R08: ffffffff9694f948 R09: 000000000=
004fffb
[   33.245902] R10: 0000000000000457 R11: ffffffff967cf960 R12: 000000000=
0000001
[   33.245903] R13: 0000000000038200 R14: ffff8f740d2ffd90 R15: ffff8f740=
e581cc0
[   33.245905] FS:  00007f0dbd110540(0000) GS:ffff8f7b3e8c0000(0000) knlG=
S:0000000000000000
[   33.245906] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.245907] CR2: 00007f0dbc815000 CR3: 000000010ec1e005 CR4: 000000000=
03706e0
[   33.245909] Call Trace:
[   33.245910]  <TASK>
[   33.245912]  ? __warn+0x79/0xc0
[   33.245915]  ? ring_interrupt_active+0x244/0x2d0
[   33.245916]  ? report_bug+0xee/0x170
[   33.245920]  ? handle_bug+0x3c/0x70
[   33.245922]  ? exc_invalid_op+0x14/0x70
[   33.245924]  ? asm_exc_invalid_op+0x16/0x20
[   33.245928]  ? ring_interrupt_active+0x244/0x2d0
[   33.245929]  ? ring_interrupt_active+0x244/0x2d0
[   33.245931]  tb_ring_start+0x14e/0x300
[   33.245933]  tb_ctl_start+0x22/0xa0
[   33.245936]  ? pci_add_dynid+0xe0/0xe0
[   33.245938]  tb_domain_runtime_resume+0x15/0x40
[   33.245941]  __rpm_callback+0x41/0x120
[   33.245943]  ? pci_add_dynid+0xe0/0xe0
[   33.245944]  rpm_callback+0x5d/0x70
[   33.245946]  rpm_resume+0x58c/0x7e0
[   33.245947]  ? _raw_spin_unlock_irqrestore+0x20/0x40
[   33.245949]  ? get_page_from_freelist+0xb40/0xc70
[   33.245953]  rpm_resume+0x255/0x7e0
[   33.245954]  ? __kmem_cache_alloc_node+0xbc/0x150
[   33.245957]  __pm_runtime_resume+0x4a/0x80
[   33.245959]  boot_acl_show+0x5f/0x1b0
[   33.245961]  dev_attr_show+0x16/0x40
[   33.245964]  sysfs_kf_seq_show+0xa9/0xe0
[   33.245967]  seq_read_iter+0x10c/0x490
[   33.245971]  vfs_read+0x1ec/0x2b0
[   33.245974]  ksys_read+0x5f/0xe0
[   33.245976]  do_syscall_64+0x38/0x90
[   33.245979]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   33.245981] RIP: 0033:0x7f0dbd038eae
[   33.245984] Code: c0 e9 b6 fe ff ff 50 48 8d 3d 2e 18 0a 00 e8 49 e8 0=
1 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05=
 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[   33.245985] RSP: 002b:00007ffd0c19b558 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000000
[   33.245987] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f0db=
d038eae
[   33.245988] RDX: 0000000000020000 RSI: 00007f0dbc816000 RDI: 000000000=
0000003
[   33.245989] RBP: 00007f0dbc816000 R08: 00007f0dbc815010 R09: 000000000=
0000000
[   33.245990] R10: fffffffffffff1ef R11: 0000000000000246 R12: 000000000=
0000000
[   33.245991] R13: 0000000000000003 R14: 0000000000020000 R15: 000000000=
0020000
[   33.245992]  </TASK>
[   33.245993] ---[ end trace 0000000000000000 ]---
[   33.246000] ------------[ cut here ]------------
[   33.246001] thunderbolt 0000:05:00.0: interrupt for RX ring 0 is alrea=
dy enabled
[   33.246008] WARNING: CPU: 3 PID: 259 at drivers/thunderbolt/nhi.c:137 =
ring_interrupt_active+0x244/0x2d0
[   33.246010] Modules linked in: dm_mod pinctrl_cannonlake pinctrl_intel=
 intel_hid
[   33.246013] CPU: 3 PID: 259 Comm: cat Tainted: G        W          6.1=
=2E31+ #1
[   33.246014] Hardware name: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S=
 (3.14 ) 10/10/2020
[   33.246015] RIP: 0010:ring_interrupt_active+0x244/0x2d0
[   33.246017] Code: 08 44 89 04 24 e8 0c 8a cf ff 4c 8b 4c 24 08 44 8b 0=
4 24 4c 89 f2 48 8b 4c 24 10 48 89 c6 48 c7 c7 50 f1 f5 95 e8 fc 74 5a ff=
 <0f> 0b 44 8b 5c 24 04 49 8b 47 08 40 84 ed 0f 85 e9 fe ff ff f6 40
[   33.246018] RSP: 0018:ffff936e01a9fba8 EFLAGS: 00010082
[   33.246019] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000000
[   33.246020] RDX: 0000000000000004 RSI: 00000000ffffffea RDI: 00000000f=
fffffff
[   33.246021] RBP: 0000000000000001 R08: ffffffff9694f948 R09: 000000000=
004fffb
[   33.246022] R10: 0000000000000491 R11: ffffffff967cf960 R12: 000000000=
0001000
[   33.246023] R13: 0000000000038200 R14: ffff8f740d2ffd90 R15: ffff8f740=
e581d80
[   33.246024] FS:  00007f0dbd110540(0000) GS:ffff8f7b3e8c0000(0000) knlG=
S:0000000000000000
[   33.246025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   33.246026] CR2: 00007f0dbc815000 CR3: 000000010ec1e005 CR4: 000000000=
03706e0
[   33.246027] Call Trace:
[   33.246028]  <TASK>
[   33.246028]  ? __warn+0x79/0xc0
[   33.246030]  ? ring_interrupt_active+0x244/0x2d0
[   33.246031]  ? report_bug+0xee/0x170
[   33.246034]  ? handle_bug+0x3c/0x70
[   33.246035]  ? exc_invalid_op+0x14/0x70
[   33.246037]  ? asm_exc_invalid_op+0x16/0x20
[   33.246040]  ? ring_interrupt_active+0x244/0x2d0
[   33.246042]  ? ring_interrupt_active+0x244/0x2d0
[   33.246044]  tb_ring_start+0x14e/0x300
[   33.246045]  tb_ctl_start+0x2c/0xa0
[   33.246047]  ? pci_add_dynid+0xe0/0xe0
[   33.246049]  tb_domain_runtime_resume+0x15/0x40
[   33.246050]  __rpm_callback+0x41/0x120
[   33.246052]  ? pci_add_dynid+0xe0/0xe0
[   33.246053]  rpm_callback+0x5d/0x70
[   33.246054]  rpm_resume+0x58c/0x7e0
[   33.246056]  ? _raw_spin_unlock_irqrestore+0x20/0x40
[   33.246058]  ? get_page_from_freelist+0xb40/0xc70
[   33.246060]  rpm_resume+0x255/0x7e0
[   33.246061]  ? __kmem_cache_alloc_node+0xbc/0x150
[   33.246064]  __pm_runtime_resume+0x4a/0x80
[   33.246066]  boot_acl_show+0x5f/0x1b0
[   33.246067]  dev_attr_show+0x16/0x40
[   33.246069]  sysfs_kf_seq_show+0xa9/0xe0
[   33.246072]  seq_read_iter+0x10c/0x490
[   33.246075]  vfs_read+0x1ec/0x2b0
[   33.246077]  ksys_read+0x5f/0xe0
[   33.246080]  do_syscall_64+0x38/0x90
[   33.246081]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   33.246084] RIP: 0033:0x7f0dbd038eae
[   33.246085] Code: c0 e9 b6 fe ff ff 50 48 8d 3d 2e 18 0a 00 e8 49 e8 0=
1 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05=
 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[   33.246086] RSP: 002b:00007ffd0c19b558 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000000
[   33.246087] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f0db=
d038eae
[   33.246088] RDX: 0000000000020000 RSI: 00007f0dbc816000 RDI: 000000000=
0000003
[   33.246089] RBP: 00007f0dbc816000 R08: 00007f0dbc815010 R09: 000000000=
0000000
[   33.246090] R10: fffffffffffff1ef R11: 0000000000000246 R12: 000000000=
0000000
[   33.246091] R13: 0000000000000003 R14: 0000000000020000 R15: 000000000=
0020000
[   33.246093]  </TASK>
[   33.246093] ---[ end trace 0000000000000000 ]---
[   33.272230] cat (259) used greatest stack depth: 12904 bytes left

--------------E7E2330BF4D1B66328460ECA
Content-Type: text/x-log; charset="UTF-8"; name="kernel-6.4-rc5.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="kernel-6.4-rc5.log"

[    0.000000] microcode: updated early: 0xd6 -> 0xf0, date =3D 2021-11-1=
7
[    0.000000] Linux version 6.4.0-devel+ (thilbrich@ws-3) (gcc (Debian 1=
0.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP=
 PREEMPT_DYNAMIC Tue Jun  6 09:50:55 CEST 2023
[    0.000000] Command line: BOOT_IMAGE=3D/isolinux/bzImage loglevel=3D1 =
sina_toram console=3Dtty1 intel_iommu=3Don,igfx_off
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poi=
nt registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds regis=
ters'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960=
 bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 1616
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000944b6fff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x00000000944b7000-0x000000009456efff] typ=
e 20
[    0.000000] BIOS-e820: [mem 0x000000009456f000-0x0000000098694fff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000098695000-0x0000000099a1efff] ACP=
I NVS
[    0.000000] BIOS-e820: [mem 0x0000000099a1f000-0x0000000099b4efff] ACP=
I data
[    0.000000] BIOS-e820: [mem 0x0000000099b4f000-0x0000000099b4ffff] usa=
ble
[    0.000000] BIOS-e820: [mem 0x0000000099b50000-0x000000009f7fffff] res=
erved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000085e7fffff] usa=
ble
[    0.000000] SMT: disabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.000000] user: [mem 0x000000000009f000-0x00000000000fffff] reserved=

[    0.000000] user: [mem 0x0000000000100000-0x00000000944b6fff] usable
[    0.000000] user: [mem 0x00000000944b7000-0x000000009456efff] type 20
[    0.000000] user: [mem 0x000000009456f000-0x0000000098694fff] reserved=

[    0.000000] user: [mem 0x0000000098695000-0x0000000099a1efff] ACPI NVS=

[    0.000000] user: [mem 0x0000000099a1f000-0x0000000099b4efff] ACPI dat=
a
[    0.000000] user: [mem 0x0000000099b4f000-0x0000000099b4ffff] usable
[    0.000000] user: [mem 0x0000000099b50000-0x000000009f7fffff] reserved=

[    0.000000] user: [mem 0x0000000100000000-0x0000000187ffffff] usable
[    0.000000] user: [mem 0x0000000188000000-0x0000000189ffffff] reserved=

[    0.000000] user: [mem 0x000000018a000000-0x000000085e7fffff] usable
[    0.000000] efi: EFI v2.7 by Lenovo
[    0.000000] efi: SMBIOS=3D0x96ab8000 SMBIOS 3.0=3D0x96aab000 ACPI=3D0x=
99b4e000 ACPI 2.0=3D0x99b4e014 MEMATTR=3D0x911da018 ESRT=3D0x96965000=20
[    0.000000] SMBIOS 3.2.0 present.
[    0.000000] DMI: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S (3.14 ) 1=
0/10/2020
[    0.000000] tsc: Detected 2300.000 MHz processor
[    0.000000] tsc: Detected 2299.968 MHz TSC
[    0.000009] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
[    0.000014] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000024] last_pfn =3D 0x85e800 max_arch_pfn =3D 0x400000000
[    0.000030] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- =
WT =20
[    0.000576] last_pfn =3D 0x99b50 max_arch_pfn =3D 0x400000000
[    0.013165] Using GB pages for direct mapping
[    0.013553] Secure boot enabled
[    0.013554] RAMDISK: [mem 0x33883000-0x35c38fff]
[    0.013560] ACPI: Early table checksum verification disabled
[    0.013564] ACPI: RSDP 0x0000000099B4E014 000024 (v02 LENOVO)
[    0.013570] ACPI: XSDT 0x0000000099B4C188 0000FC (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013578] ACPI: FACP 0x0000000096962000 000114 (v06 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013586] ACPI: DSDT 0x0000000096932000 02BFF1 (v02 LENOVO CML      =
20170001 INTL 20160422)
[    0.013590] ACPI: FACS 0x0000000099884000 000040
[    0.013594] ACPI: SSDT 0x00000000969BC000 0020AE (v02 LENOVO CpuSsdt  =
00003000 INTL 20160527)
[    0.013599] ACPI: SSDT 0x00000000969BB000 0005A1 (v02 LENOVO CtdpB    =
00001000 INTL 20160527)
[    0.013603] ACPI: SSDT 0x000000009697E000 003532 (v02 LENOVO DptfTabl =
00001000 INTL 20160527)
[    0.013607] ACPI: SSDT 0x0000000096968000 00331E (v02 LENOVO SaSsdt   =
00003000 INTL 20160527)
[    0.013612] ACPI: BOOT 0x0000000096966000 000028 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013616] ACPI: SSDT 0x0000000096963000 0005D8 (v02 LENOVO PerfTune =
00001000 INTL 20160527)
[    0.013620] ACPI: HPET 0x0000000096961000 000038 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013624] ACPI: APIC 0x0000000096960000 000164 (v03 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013629] ACPI: MCFG 0x000000009695F000 00003C (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013633] ACPI: ECDT 0x000000009695E000 000053 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013637] ACPI: SSDT 0x0000000096930000 001F31 (v02 LENOVO WHL_Tbt_ =
00001000 INTL 20160527)
[    0.013641] ACPI: SSDT 0x000000009692F000 0000A6 (v02 LENOVO PID0Ssdt =
00000010 INTL 20160527)
[    0.013645] ACPI: SSDT 0x000000009692B000 0037A1 (v02 LENOVO ProjSsdt =
00000010 INTL 20160527)
[    0.013650] ACPI: NHLT 0x0000000096929000 00189E (v00 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013654] ACPI: MSDM 0x0000000096928000 000055 (v03 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013658] ACPI: SSDT 0x000000009674B000 000EF6 (v02 LENOVO UsbCTabl =
00001000 INTL 20160527)
[    0.013662] ACPI: LPIT 0x000000009674A000 000094 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013667] ACPI: WSMT 0x0000000096749000 000028 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013671] ACPI: SSDT 0x0000000096746000 00281B (v02 LENOVO TbtTypeC =
00000000 INTL 20160527)
[    0.013675] ACPI: DBGP 0x0000000096745000 000034 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013679] ACPI: DBG2 0x0000000096744000 000054 (v00 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013684] ACPI: BATB 0x0000000096743000 00004A (v02 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013688] ACPI: DMAR 0x0000000094F3C000 0000A8 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013692] ACPI: BGRT 0x0000000094F3B000 000038 (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013696] ACPI: UEFI 0x0000000099839000 00012A (v01 LENOVO TP-N2X   =
00003140 PTEC 00000002)
[    0.013700] ACPI: FPDT 0x0000000094F3A000 000044 (v01 LENOVO TP-N2X   =
00003140 PTEC 00003140)
[    0.013704] ACPI: Reserving FACP table memory at [mem 0x96962000-0x969=
62113]
[    0.013706] ACPI: Reserving DSDT table memory at [mem 0x96932000-0x969=
5dff0]
[    0.013708] ACPI: Reserving FACS table memory at [mem 0x99884000-0x998=
8403f]
[    0.013709] ACPI: Reserving SSDT table memory at [mem 0x969bc000-0x969=
be0ad]
[    0.013710] ACPI: Reserving SSDT table memory at [mem 0x969bb000-0x969=
bb5a0]
[    0.013712] ACPI: Reserving SSDT table memory at [mem 0x9697e000-0x969=
81531]
[    0.013713] ACPI: Reserving SSDT table memory at [mem 0x96968000-0x969=
6b31d]
[    0.013714] ACPI: Reserving BOOT table memory at [mem 0x96966000-0x969=
66027]
[    0.013715] ACPI: Reserving SSDT table memory at [mem 0x96963000-0x969=
635d7]
[    0.013717] ACPI: Reserving HPET table memory at [mem 0x96961000-0x969=
61037]
[    0.013718] ACPI: Reserving APIC table memory at [mem 0x96960000-0x969=
60163]
[    0.013719] ACPI: Reserving MCFG table memory at [mem 0x9695f000-0x969=
5f03b]
[    0.013720] ACPI: Reserving ECDT table memory at [mem 0x9695e000-0x969=
5e052]
[    0.013722] ACPI: Reserving SSDT table memory at [mem 0x96930000-0x969=
31f30]
[    0.013723] ACPI: Reserving SSDT table memory at [mem 0x9692f000-0x969=
2f0a5]
[    0.013724] ACPI: Reserving SSDT table memory at [mem 0x9692b000-0x969=
2e7a0]
[    0.013725] ACPI: Reserving NHLT table memory at [mem 0x96929000-0x969=
2a89d]
[    0.013727] ACPI: Reserving MSDM table memory at [mem 0x96928000-0x969=
28054]
[    0.013728] ACPI: Reserving SSDT table memory at [mem 0x9674b000-0x967=
4bef5]
[    0.013729] ACPI: Reserving LPIT table memory at [mem 0x9674a000-0x967=
4a093]
[    0.013730] ACPI: Reserving WSMT table memory at [mem 0x96749000-0x967=
49027]
[    0.013731] ACPI: Reserving SSDT table memory at [mem 0x96746000-0x967=
4881a]
[    0.013733] ACPI: Reserving DBGP table memory at [mem 0x96745000-0x967=
45033]
[    0.013734] ACPI: Reserving DBG2 table memory at [mem 0x96744000-0x967=
44053]
[    0.013735] ACPI: Reserving BATB table memory at [mem 0x96743000-0x967=
43049]
[    0.013736] ACPI: Reserving DMAR table memory at [mem 0x94f3c000-0x94f=
3c0a7]
[    0.013738] ACPI: Reserving BGRT table memory at [mem 0x94f3b000-0x94f=
3b037]
[    0.013739] ACPI: Reserving UEFI table memory at [mem 0x99839000-0x998=
39129]
[    0.013740] ACPI: Reserving FPDT table memory at [mem 0x94f3a000-0x94f=
3a043]
[    0.013800] Zone ranges:
[    0.013801]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.013804]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.013807]   Normal   [mem 0x0000000100000000-0x000000085e7fffff]
[    0.013809] Movable zone start for each node
[    0.013810] Early memory node ranges
[    0.013811]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.013813]   node   0: [mem 0x0000000000100000-0x00000000944b6fff]
[    0.013815]   node   0: [mem 0x0000000099b4f000-0x0000000099b4ffff]
[    0.013816]   node   0: [mem 0x0000000100000000-0x0000000187ffffff]
[    0.013818]   node   0: [mem 0x000000018a000000-0x000000085e7fffff]
[    0.013823] Initmem setup node 0 [mem 0x0000000000001000-0x000000085e7=
fffff]
[    0.013828] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.013864] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.018925] On node 0, zone DMA32: 22168 pages in unavailable ranges
[    0.023694] On node 0, zone Normal: 25776 pages in unavailable ranges
[    0.081085] On node 0, zone Normal: 8192 pages in unavailable ranges
[    0.081155] On node 0, zone Normal: 6144 pages in unavailable ranges
[    0.081173] Reserving Intel graphics memory at [mem 0x9b800000-0x9f7ff=
fff]
[    0.081468] ACPI: PM-Timer IO Port: 0x1808
[    0.081478] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.081480] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.081481] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.081483] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.081484] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.081485] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.081486] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.081487] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.081488] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.081489] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.081490] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.081491] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.081492] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.081494] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.081495] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.081496] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.081497] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.081498] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.081499] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.081501] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.081537] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI =
0-119
[    0.081542] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.081544] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level=
)
[    0.081551] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.081552] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.081557] TSC deadline timer available
[    0.081559] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.081572] [mem 0x9f800000-0xffffffff] available for PCI devices
[    0.081574] Booting paravirtualized kernel on bare hardware
[    0.081577] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.094134] setup_percpu: NR_CPUS:32 nr_cpumask_bits:8 nr_cpu_ids:8 nr=
_node_ids:1
[    0.094608] percpu: Embedded 56 pages/cpu s189480 r8192 d31704 u262144=

[    0.094615] pcpu-alloc: s189480 r8192 d31704 u262144 alloc=3D1*2097152=

[    0.094619] pcpu-alloc: [0] 0 1 2 3 4 5 6 7=20
[    0.094644] Kernel command line: memmap=3D0x2000000$0x188000000 ramoop=
s.mem_address=3D0x188000000 ramoops.mem_size=3D0x2000000 ramoops.ecc=3D1 =
ramoops.record_size=3D0x200000 ramoops.console_size=3D0 ramoops.ftrace_si=
ze=3D0 ramoops.pmsg_size=3D0 mem_sleep_default=3Ddeep mitigations=3Dauto =
nosmt BOOT_IMAGE=3D/isolinux/bzImage loglevel=3D1 sina_toram console=3Dtt=
y1 intel_iommu=3Don,igfx_off
[    0.094787] DMAR: IOMMU enabled
[    0.094788] DMAR: Disable GFX device mapping
[    0.094791] Unknown kernel command line parameters "sina_toram BOOT_IM=
AGE=3D/isolinux/bzImage", will be passed to user space.
[    0.094852] random: crng init done
[    0.098885] Dentry cache hash table entries: 4194304 (order: 13, 33554=
432 bytes, linear)
[    0.100911] Inode-cache hash table entries: 2097152 (order: 12, 167772=
16 bytes, linear)
[    0.101045] Built 1 zonelists, mobility grouping on.  Total pages: 819=
5845
[    0.101047] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.101056] software IO TLB: area num 8.
[    0.196336] Memory: 32572492K/33304920K available (20480K kernel code,=
 9282K rwdata, 8240K rodata, 3464K init, 3640K bss, 732168K reserved, 0K =
cma-reserved)
[    0.196391] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8,=
 Nodes=3D1
[    0.196414] ftrace: allocating 57404 entries in 225 pages
[    0.211680] ftrace: allocated 225 pages with 4 groups
[    0.213039] Dynamic Preempt: voluntary
[    0.213074] rcu: Preemptible hierarchical RCU implementation.
[    0.213075] rcu: 	RCU event tracing is enabled.
[    0.213076] rcu: 	RCU restricting CPUs from NR_CPUS=3D32 to nr_cpu_ids=
=3D8.
[    0.213078] 	Trampoline variant of Tasks RCU enabled.
[    0.213079] 	Rude variant of Tasks RCU enabled.
[    0.213079] 	Tracing variant of Tasks RCU enabled.
[    0.213080] rcu: RCU calculated value of scheduler-enlistment delay is=
 100 jiffies.
[    0.213081] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D8
[    0.218078] NR_IRQS: 4352, nr_irqs: 2048, preallocated irqs: 16
[    0.218365] rcu: srcu_init: Setting srcu_struct sizes based on content=
ion.
[    0.218648] Console: colour dummy device 80x25
[    0.218651] printk: console [tty1] enabled
[    0.218692] ACPI: Core revision 20230331
[    0.219131] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.219133] APIC: Switch to symmetric I/O mode setup
[    0.220897] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.226713] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycle=
s: 0x212717146a7, max_idle_ns: 440795291431 ns
[    0.226724] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 4599.93 BogoMIPS (lpj=3D2299968)
[    0.226729] pid_max: default: 32768 minimum: 301
[    0.226749] LSM: initializing lsm=3Dcapability,sina
[    0.226826] Mount-cache hash table entries: 65536 (order: 7, 524288 by=
tes, linear)
[    0.226887] Mountpoint-cache hash table entries: 65536 (order: 7, 5242=
88 bytes, linear)
[    0.227089] CPU0: Thermal monitoring enabled (TM1)
[    0.227158] process: using mwait in idle threads
[    0.227163] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
[    0.227165] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
[    0.227181] Spectre V1 : Mitigation: usercopy/swapgs barriers and __us=
er pointer sanitization
[    0.227186] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.227187] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling R=
SB on context switch
[    0.227188] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CAL=
L on VMEXIT
[    0.227189] RETBleed: Mitigation: Enhanced IBRS
[    0.227192] Spectre V2 : mitigation: Enabling conditional Indirect Bra=
nch Prediction Barrier
[    0.227195] Speculative Store Bypass: Mitigation: Speculative Store By=
pass disabled via prctl
[    0.227204] MMIO Stale Data: Mitigation: Clear CPU buffers
[    0.227206] SRBDS: Mitigation: Microcode
[    0.227720] Freeing SMP alternatives memory: 44K
[    0.227720] smpboot: CPU0: Intel(R) Core(TM) i7-10510U CPU @ 1.80GHz (=
family: 0x6, model: 0x8e, stepping: 0xc)
[    0.227720] cblist_init_generic: Setting adjustable number of callback=
 queues.
[    0.227720] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.227720] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.227720] cblist_init_generic: Setting shift to 3 and lim to 1.
[    0.227720] Performance Events: PEBS fmt3+, Skylake events, 32-deep LB=
R, full-width counters, Intel PMU driver.
[    0.227720] ... version:                4
[    0.227720] ... bit width:              48
[    0.227720] ... generic registers:      4
[    0.227720] ... value mask:             0000ffffffffffff
[    0.227720] ... max period:             00007fffffffffff
[    0.227720] ... fixed-purpose events:   3
[    0.227720] ... event mask:             000000070000000f
[    0.227720] Estimated ratio of average max frequency by base frequency=
 (times 1024): 1914
[    0.227724] rcu: Hierarchical SRCU implementation.
[    0.227726] rcu: 	Max phase no-delay instances is 400.
[    0.229097] NMI watchdog: Enabled. Permanently consumes one hw-PMU cou=
nter.
[    0.229777] smp: Bringing up secondary CPUs ...
[    0.229859] x86: Booting SMP configuration:
[    0.229861] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.273855] smp: Brought up 1 node, 4 CPUs
[    0.273861] smpboot: Max logical packages: 2
[    0.273862] smpboot: Total of 4 processors activated (18399.74 BogoMIP=
S)
[    0.276725] devtmpfs: initialized
[    0.276917] ACPI: PM: Registering ACPI NVS region [mem 0x98695000-0x99=
a1efff] (20488192 bytes)
[    0.277857] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 1911260446275000 ns
[    0.277863] futex hash table entries: 2048 (order: 5, 131072 bytes, li=
near)
[    0.277904] pinctrl core: initialized pinctrl subsystem
[    0.278722] PM: RTC time: 08:29:49, date: 2023-06-06
[    0.279780] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.279912] ramoops: using module parameters
[    0.281834] pstore: Registered ramoops as persistent store backend
[    0.281836] ramoops: using 0x2000000@0x188000000, ecc: 16
[    0.281912] thermal_sys: Registered thermal governor 'step_wise'
[    0.281913] thermal_sys: Registered thermal governor 'user_space'
[    0.281927] cpuidle: using governor menu
[    0.281982] Simple Boot Flag at 0x47 set to 0x1
[    0.281982] ACPI FADT declares the system doesn't support PCIe ASPM, s=
o disable it
[    0.281982] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.282737] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf00000=
00-0xf7ffffff] (base 0xf0000000)
[    0.282744] PCI: not using MMCONFIG
[    0.282746] PCI: Using configuration type 1 for base access
[    0.283036] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.283724] kprobes: kprobe jump-optimization is enabled. All kprobes =
are optimized if possible.
[    0.283764] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pa=
ges
[    0.283764] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.283811] ACPI: Added _OSI(Module Device)
[    0.283811] ACPI: Added _OSI(Processor Device)
[    0.283811] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.283811] ACPI: Added _OSI(Processor Aggregator Device)
[    0.440969] ACPI: 11 ACPI AML tables successfully acquired and loaded
[    0.444069] ACPI: EC: EC started
[    0.444071] ACPI: EC: interrupt blocked
[    0.446790] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.446792] ACPI: EC: Boot ECDT EC used to handle transactions
[    0.451837] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.519884] ACPI: Dynamic OEM Table Load:
[    0.519891] ACPI: SSDT 0xFFFF88F9C03E4800 0000FC (v02 PmRef  Cpu0Psd  =
00003000 INTL 20160527)
[    0.520982] ACPI: \_SB_.PR00: _OSC native thermal LVT Acked
[    0.522023] ACPI: Dynamic OEM Table Load:
[    0.522028] ACPI: SSDT 0xFFFF88F9C0BAE400 000400 (v02 PmRef  Cpu0Cst  =
00003001 INTL 20160527)
[    0.523755] ACPI: Dynamic OEM Table Load:
[    0.523759] ACPI: SSDT 0xFFFF88F9C1209000 00061E (v02 PmRef  Cpu0Ist  =
00003000 INTL 20160527)
[    0.524924] ACPI: Dynamic OEM Table Load:
[    0.524927] ACPI: SSDT 0xFFFF88F9C03BFE00 00016C (v02 PmRef  Cpu0Hwp  =
00003000 INTL 20160527)
[    0.526026] ACPI: Dynamic OEM Table Load:
[    0.526030] ACPI: SSDT 0xFFFF88F9C1201000 000BEA (v02 PmRef  HwpLvt   =
00003000 INTL 20160527)
[    0.527829] ACPI: Dynamic OEM Table Load:
[    0.527834] ACPI: SSDT 0xFFFF88F9C120A800 000778 (v02 PmRef  ApIst    =
00003000 INTL 20160527)
[    0.529010] ACPI: Dynamic OEM Table Load:
[    0.529014] ACPI: SSDT 0xFFFF88F9C0BAE800 0003D7 (v02 PmRef  ApHwp    =
00003000 INTL 20160527)
[    0.530771] ACPI: Dynamic OEM Table Load:
[    0.530776] ACPI: SSDT 0xFFFF88F9C1202000 000D22 (v02 PmRef  ApPsd    =
00003000 INTL 20160527)
[    0.532784] ACPI: Dynamic OEM Table Load:
[    0.532788] ACPI: SSDT 0xFFFF88F9C0BAEC00 0003CA (v02 PmRef  ApCst    =
00003000 INTL 20160527)
[    0.536764] ACPI: Interpreter enabled
[    0.536787] ACPI: PM: (supports S0 S3 S5)
[    0.536788] ACPI: Using IOAPIC for interrupt routing
[    0.536807] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf00000=
00-0xf7ffffff] (base 0xf0000000)
[    0.537823] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved as A=
CPI motherboard resource
[    0.537839] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
[    0.537842] PCI: Using E820 reservations for host bridge windows
[    0.538033] ACPI: Enabled 7 GPEs in block 00 to 7F
[    0.542048] ACPI: \_SB_.PCI0.LPCB.EC__.PUBS: New power resource
[    0.546805] ACPI: \_SB_.PCI0.XHC_.RHUB.HS10.BTPR: New power resource
[    0.548012] ACPI: \_SB_.PCI0.XDCI.USBC: New power resource
[    0.549989] ACPI: \_SB_.PCI0.RP05.PXP_: New power resource
[    0.553083] ACPI: \_SB_.PCI0.RP07.PXP_: New power resource
[    0.559898] ACPI: \_SB_.PCI0.SAT0.VOL0.V0PR: New power resource
[    0.559976] ACPI: \_SB_.PCI0.SAT0.VOL1.V1PR: New power resource
[    0.560050] ACPI: \_SB_.PCI0.SAT0.VOL2.V2PR: New power resource
[    0.561828] ACPI: \_SB_.PCI0.CNVW.WRST: New power resource
[    0.566934] ACPI: \PIN_: New power resource
[    0.566947] ACPI: \PINP: New power resource
[    0.567760] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-7e])
[    0.567764] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig Segment=
s MSI HPX-Type3]
[    0.567766] acpi PNP0A08:00: _OSC: not requesting OS control; OS requi=
res [ExtendedConfig ASPM ClockPM MSI]
[    0.567803] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using=
 BIOS configuration
[    0.569960] PCI host bridge to bus 0000:00
[    0.569961] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
[    0.569963] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
[    0.569964] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
[    0.569965] pci_bus 0000:00: root bus resource [mem 0x9f800000-0xeffff=
fff window]
[    0.569965] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7ff=
fff window]
[    0.569966] pci_bus 0000:00: root bus resource [bus 00-7e]
[    0.569986] pci 0000:00:00.0: [8086:9b61] type 00 class 0x060000
[    0.570044] pci 0000:00:02.0: [8086:9b41] type 00 class 0x030000
[    0.570052] pci 0000:00:02.0: reg 0x10: [mem 0xe9000000-0xe9ffffff 64b=
it]
[    0.570056] pci 0000:00:02.0: reg 0x18: [mem 0xa0000000-0xbfffffff 64b=
it pref]
[    0.570060] pci 0000:00:02.0: reg 0x20: [io  0x4000-0x403f]
[    0.570070] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.570072] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0=
x000c0000-0x000dffff]
[    0.570762] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
[    0.570769] pci 0000:00:04.0: reg 0x10: [mem 0xeb730000-0xeb737fff 64b=
it]
[    0.570940] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000
[    0.570948] pci 0000:00:08.0: reg 0x10: [mem 0xeb742000-0xeb742fff 64b=
it]
[    0.571051] pci 0000:00:12.0: [8086:02f9] type 00 class 0x118000
[    0.571067] pci 0000:00:12.0: reg 0x10: [mem 0xeb743000-0xeb743fff 64b=
it]
[    0.571779] pci 0000:00:14.0: [8086:02ed] type 00 class 0x0c0330
[    0.571793] pci 0000:00:14.0: reg 0x10: [mem 0xeb720000-0xeb72ffff 64b=
it]
[    0.571846] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.572047] pci 0000:00:14.2: [8086:02ef] type 00 class 0x050000
[    0.572062] pci 0000:00:14.2: reg 0x10: [mem 0xeb740000-0xeb741fff 64b=
it]
[    0.572072] pci 0000:00:14.2: reg 0x18: [mem 0xeb744000-0xeb744fff 64b=
it]
[    0.572772] pci 0000:00:14.3: [8086:02f0] type 00 class 0x028000
[    0.572788] pci 0000:00:14.3: reg 0x10: [mem 0xeb738000-0xeb73bfff 64b=
it]
[    0.572879] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.573014] pci 0000:00:16.0: [8086:02e0] type 00 class 0x078000
[    0.573033] pci 0000:00:16.0: reg 0x10: [mem 0xeb745000-0xeb745fff 64b=
it]
[    0.573102] pci 0000:00:16.0: PME# supported from D3hot
[    0.573896] pci 0000:00:1c.0: [8086:02b8] type 01 class 0x060400
[    0.573958] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.574837] pci 0000:00:1c.4: [8086:02bc] type 01 class 0x060400
[    0.574898] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.575773] pci 0000:00:1d.0: [8086:02b0] type 01 class 0x060400
[    0.575834] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.576093] pci 0000:00:1d.4: [8086:02b4] type 01 class 0x060400
[    0.576753] pci 0000:00:1d.4: PME# supported from D0 D3hot D3cold
[    0.577041] pci 0000:00:1f.0: [8086:0284] type 00 class 0x060100
[    0.577963] pci 0000:00:1f.3: [8086:02c8] type 00 class 0x040380
[    0.577993] pci 0000:00:1f.3: reg 0x10: [mem 0xeb73c000-0xeb73ffff 64b=
it]
[    0.578029] pci 0000:00:1f.3: reg 0x20: [mem 0xeaa00000-0xeaafffff 64b=
it]
[    0.578101] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.578896] pci 0000:00:1f.4: [8086:02a3] type 00 class 0x0c0500
[    0.578919] pci 0000:00:1f.4: reg 0x10: [mem 0xeb746000-0xeb7460ff 64b=
it]
[    0.578947] pci 0000:00:1f.4: reg 0x20: [io  0xefa0-0xefbf]
[    0.579104] pci 0000:00:1f.5: [8086:02a4] type 00 class 0x0c8000
[    0.579118] pci 0000:00:1f.5: reg 0x10: [mem 0xfe010000-0xfe010fff]
[    0.579811] pci 0000:00:1f.6: [8086:0d4f] type 00 class 0x020000
[    0.579840] pci 0000:00:1f.6: reg 0x10: [mem 0xeb700000-0xeb71ffff]
[    0.579983] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
[    0.580093] pci 0000:02:00.0: [10ec:522a] type 00 class 0xff0000
[    0.580113] pci 0000:02:00.0: reg 0x10: [mem 0xeb600000-0xeb600fff]
[    0.580821] pci 0000:02:00.0: supports D1 D2
[    0.580822] pci 0000:02:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.580945] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.580949] pci 0000:00:1c.0:   bridge window [mem 0xeb600000-0xeb6fff=
ff]
[    0.580999] pci 0000:03:00.0: [8086:15c0] type 01 class 0x060400
[    0.581045] pci 0000:03:00.0: enabling Extended Tags
[    0.581115] pci 0000:03:00.0: supports D1 D2
[    0.581116] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.581839] pci 0000:00:1c.4: PCI bridge to [bus 03-2b]
[    0.581842] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.581845] pci 0000:00:1c.4:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.581901] pci 0000:04:00.0: [8086:15c0] type 01 class 0x060400
[    0.581951] pci 0000:04:00.0: enabling Extended Tags
[    0.582023] pci 0000:04:00.0: supports D1 D2
[    0.582023] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.582728] pci 0000:04:01.0: [8086:15c0] type 01 class 0x060400
[    0.582777] pci 0000:04:01.0: enabling Extended Tags
[    0.582850] pci 0000:04:01.0: supports D1 D2
[    0.582850] pci 0000:04:01.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.582962] pci 0000:04:02.0: [8086:15c0] type 01 class 0x060400
[    0.583011] pci 0000:04:02.0: enabling Extended Tags
[    0.583083] pci 0000:04:02.0: supports D1 D2
[    0.583083] pci 0000:04:02.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.583806] pci 0000:03:00.0: PCI bridge to [bus 04-2b]
[    0.583813] pci 0000:03:00.0:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.583818] pci 0000:03:00.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.583875] pci 0000:05:00.0: [8086:15bf] type 00 class 0x088000
[    0.583891] pci 0000:05:00.0: reg 0x10: [mem 0xe8100000-0xe813ffff]
[    0.583899] pci 0000:05:00.0: reg 0x14: [mem 0xe8140000-0xe8140fff]
[    0.583941] pci 0000:05:00.0: enabling Extended Tags
[    0.584028] pci 0000:05:00.0: supports D1 D2
[    0.584029] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.584740] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.584747] pci 0000:04:00.0:   bridge window [mem 0xe8100000-0xe81fff=
ff]
[    0.584785] pci 0000:04:01.0: PCI bridge to [bus 06-2a]
[    0.584792] pci 0000:04:01.0:   bridge window [mem 0xdc100000-0xe80fff=
ff]
[    0.584797] pci 0000:04:01.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.584861] pci 0000:2b:00.0: [8086:15c1] type 00 class 0x0c0330
[    0.584881] pci 0000:2b:00.0: reg 0x10: [mem 0xdc000000-0xdc00ffff]
[    0.584952] pci 0000:2b:00.0: enabling Extended Tags
[    0.585045] pci 0000:2b:00.0: supports D1 D2
[    0.585045] pci 0000:2b:00.0: PME# supported from D0 D1 D2 D3hot D3col=
d
[    0.585105] pci 0000:2b:00.0: 8.000 Gb/s available PCIe bandwidth, lim=
ited by 2.5 GT/s PCIe x4 link at 0000:04:02.0 (capable of 31.504 Gb/s wit=
h 8.0 GT/s PCIe x4 link)
[    0.585789] pci 0000:04:02.0: PCI bridge to [bus 2b]
[    0.585796] pci 0000:04:02.0:   bridge window [mem 0xdc000000-0xdc0fff=
ff]
[    0.585863] pci 0000:00:1d.0: PCI bridge to [bus 2d]
[    0.585865] pci 0000:00:1d.0:   bridge window [io  0x3000-0x3fff]
[    0.585867] pci 0000:00:1d.0:   bridge window [mem 0xeac00000-0xeb5fff=
ff]
[    0.585871] pci 0000:00:1d.0:   bridge window [mem 0xea000000-0xea9fff=
ff 64bit pref]
[    0.585918] pci 0000:2e:00.0: [15b7:5006] type 00 class 0x010802
[    0.585936] pci 0000:2e:00.0: reg 0x10: [mem 0xeab00000-0xeab03fff 64b=
it]
[    0.585962] pci 0000:2e:00.0: reg 0x20: [mem 0xeab04000-0xeab040ff 64b=
it]
[    0.586121] pci 0000:00:1d.4: PCI bridge to [bus 2e]
[    0.586124] pci 0000:00:1d.4:   bridge window [mem 0xeab00000-0xeabfff=
ff]
[    0.586735] pci_bus 0000:00: on NUMA node 0
[    0.590051] ACPI: EC: interrupt unblocked
[    0.590052] ACPI: EC: event unblocked
[    0.590067] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.590069] ACPI: EC: GPE=3D0x16
[    0.590070] ACPI: \_SB_.PCI0.LPCB.EC__: Boot ECDT EC initialization co=
mplete
[    0.590071] ACPI: \_SB_.PCI0.LPCB.EC__: EC: Used to handle transaction=
s and events
[    0.590101] iommu: Default domain type: Translated=20
[    0.590101] iommu: DMA domain TLB invalidation policy: lazy mode=20
[    0.590728] SCSI subsystem initialized
[    0.590732] libata version 3.00 loaded.
[    0.590734] ACPI: bus type USB registered
[    0.590740] usbcore: registered new interface driver usbfs
[    0.590742] usbcore: registered new interface driver hub
[    0.590742] usbcore: registered new device driver usb
[    0.590766] pps_core: LinuxPPS API ver. 1 registered
[    0.590766] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
[    0.590767] PTP clock support registered
[    0.590785] Advanced Linux Sound Architecture Driver Initialized.
[    0.590897] NetLabel: Initializing
[    0.590897] NetLabel:  domain hash size =3D 128
[    0.590898] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.590906] NetLabel:  unlabeled traffic allowed by default
[    0.590914] PCI: Using ACPI for IRQ routing
[    0.629741] PCI: pci_cache_line_size set to 64 bytes
[    0.629866] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.629868] e820: reserve RAM buffer [mem 0x944b7000-0x97ffffff]
[    0.629869] e820: reserve RAM buffer [mem 0x99b50000-0x9bffffff]
[    0.629869] e820: reserve RAM buffer [mem 0x85e800000-0x85fffffff]
[    0.632859] clocksource: Switched to clocksource tsc-early
[    0.632909] pnp: PnP ACPI init
[    0.633027] system 00:00: [io  0x1800-0x18fe] has been reserved
[    0.633029] system 00:00: [mem 0xfd000000-0xfd69ffff] has been reserve=
d
[    0.633031] system 00:00: [mem 0xfd6b0000-0xfd6cffff] has been reserve=
d
[    0.633032] system 00:00: [mem 0xfd6f0000-0xfdffffff] has been reserve=
d
[    0.633033] system 00:00: [mem 0xfe000000-0xfe01ffff] could not be res=
erved
[    0.633034] system 00:00: [mem 0xfe200000-0xfe7fffff] has been reserve=
d
[    0.633034] system 00:00: [mem 0xff000000-0xffffffff] has been reserve=
d
[    0.633034] system 00:01: [io  0x2000-0x20fe] has been reserved
[    0.633436] system 00:02: [io  0x0680-0x069f] has been reserved
[    0.633438] system 00:02: [io  0x164e-0x164f] has been reserved
[    0.633502] system 00:04: [io  0x1854-0x1857] has been reserved
[    0.633553] system 00:07: [io  0x1800-0x189f] could not be reserved
[    0.633554] system 00:07: [io  0x0800-0x087f] has been reserved
[    0.633555] system 00:07: [io  0x0880-0x08ff] has been reserved
[    0.633555] system 00:07: [io  0x0900-0x097f] has been reserved
[    0.633556] system 00:07: [io  0x0980-0x09ff] has been reserved
[    0.633557] system 00:07: [io  0x0a00-0x0a7f] has been reserved
[    0.633558] system 00:07: [io  0x0a80-0x0aff] has been reserved
[    0.633558] system 00:07: [io  0x0b00-0x0b7f] has been reserved
[    0.633559] system 00:07: [io  0x0b80-0x0bff] has been reserved
[    0.633560] system 00:07: [io  0x15e0-0x15ef] has been reserved
[    0.633561] system 00:07: [io  0x1600-0x167f] could not be reserved
[    0.633561] system 00:07: [io  0x1640-0x165f] could not be reserved
[    0.633562] system 00:07: [mem 0xf0000000-0xf7ffffff] has been reserve=
d
[    0.633563] system 00:07: [mem 0xfed10000-0xfed13fff] has been reserve=
d
[    0.633564] system 00:07: [mem 0xfed18000-0xfed18fff] has been reserve=
d
[    0.633565] system 00:07: [mem 0xfed19000-0xfed19fff] has been reserve=
d
[    0.633566] system 00:07: [mem 0xfeb00000-0xfebfffff] has been reserve=
d
[    0.633566] system 00:07: [mem 0xfed20000-0xfed3ffff] has been reserve=
d
[    0.633567] system 00:07: [mem 0xfed90000-0xfed93fff] has been reserve=
d
[    0.633840] system 00:08: [mem 0xfed10000-0xfed17fff] could not be res=
erved
[    0.633841] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserve=
d
[    0.633842] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserve=
d
[    0.633843] system 00:08: [mem 0xf0000000-0xf7ffffff] has been reserve=
d
[    0.633844] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserve=
d
[    0.633845] system 00:08: [mem 0xfed90000-0xfed93fff] has been reserve=
d
[    0.633845] system 00:08: [mem 0xfed45000-0xfed8ffff] has been reserve=
d
[    0.633846] system 00:08: [mem 0xfee00000-0xfeefffff] has been reserve=
d
[    0.633931] system 00:09: [mem 0xfe038000-0xfe038fff] has been reserve=
d
[    0.634044] pnp 00:0a: disabling [mem 0x000c0000-0x000c3fff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.634046] pnp 00:0a: disabling [mem 0x000c8000-0x000cbfff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.634047] pnp 00:0a: disabling [mem 0x000d0000-0x000d3fff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.634048] pnp 00:0a: disabling [mem 0x000d8000-0x000dbfff] because i=
t overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.634062] system 00:0a: [mem 0x00000000-0x0009ffff] could not be res=
erved
[    0.634063] system 00:0a: [mem 0x000e0000-0x000e3fff] could not be res=
erved
[    0.634064] system 00:0a: [mem 0x000e8000-0x000ebfff] could not be res=
erved
[    0.634064] system 00:0a: [mem 0x000f0000-0x000fffff] could not be res=
erved
[    0.634065] system 00:0a: [mem 0x00100000-0x9f7fffff] could not be res=
erved
[    0.634066] system 00:0a: [mem 0xfec00000-0xfed3ffff] could not be res=
erved
[    0.634067] system 00:0a: [mem 0xfed4c000-0xffffffff] could not be res=
erved
[    0.634094] pnp: PnP ACPI: found 11 devices
[    0.639278] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
[    0.639313] NET: Registered PF_INET protocol family
[    0.639424] IP idents hash table entries: 262144 (order: 9, 2097152 by=
tes, linear)
[    0.641207] tcp_listen_portaddr_hash hash table entries: 16384 (order:=
 6, 262144 bytes, linear)
[    0.641234] Table-perturb hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
[    0.641241] TCP established hash table entries: 262144 (order: 9, 2097=
152 bytes, linear)
[    0.641489] TCP bind hash table entries: 65536 (order: 9, 2097152 byte=
s, linear)
[    0.641722] TCP: Hash tables configured (established 262144 bind 65536=
)
[    0.641740] UDP hash table entries: 16384 (order: 7, 524288 bytes, lin=
ear)
[    0.641800] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes=
, linear)
[    0.641890] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.642030] pci 0000:04:01.0: bridge window [io  0x1000-0x0fff] to [bu=
s 06-2a] add_size 1000
[    0.642033] pci 0000:03:00.0: bridge window [io  0x1000-0x0fff] to [bu=
s 04-2b] add_size 1000
[    0.642034] pci 0000:00:1c.4: bridge window [io  0x1000-0x0fff] to [bu=
s 03-2b] add_size 2000
[    0.642038] pci 0000:00:1c.4: BAR 7: assigned [io  0x5000-0x6fff]
[    0.642040] pci 0000:00:1c.0: PCI bridge to [bus 02]
[    0.642044] pci 0000:00:1c.0:   bridge window [mem 0xeb600000-0xeb6fff=
ff]
[    0.642049] pci 0000:03:00.0: BAR 7: assigned [io  0x5000-0x5fff]
[    0.642050] pci 0000:04:01.0: BAR 7: assigned [io  0x5000-0x5fff]
[    0.642051] pci 0000:04:00.0: PCI bridge to [bus 05]
[    0.642055] pci 0000:04:00.0:   bridge window [mem 0xe8100000-0xe81fff=
ff]
[    0.642062] pci 0000:04:01.0: PCI bridge to [bus 06-2a]
[    0.642064] pci 0000:04:01.0:   bridge window [io  0x5000-0x5fff]
[    0.642068] pci 0000:04:01.0:   bridge window [mem 0xdc100000-0xe80fff=
ff]
[    0.642071] pci 0000:04:01.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.642076] pci 0000:04:02.0: PCI bridge to [bus 2b]
[    0.642080] pci 0000:04:02.0:   bridge window [mem 0xdc000000-0xdc0fff=
ff]
[    0.642087] pci 0000:03:00.0: PCI bridge to [bus 04-2b]
[    0.642089] pci 0000:03:00.0:   bridge window [io  0x5000-0x5fff]
[    0.642093] pci 0000:03:00.0:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.642096] pci 0000:03:00.0:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.642100] pci 0000:00:1c.4: PCI bridge to [bus 03-2b]
[    0.642102] pci 0000:00:1c.4:   bridge window [io  0x5000-0x6fff]
[    0.642104] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xe81fff=
ff]
[    0.642106] pci 0000:00:1c.4:   bridge window [mem 0xc0000000-0xdbffff=
ff 64bit pref]
[    0.642109] pci 0000:00:1d.0: PCI bridge to [bus 2d]
[    0.642113] pci 0000:00:1d.0:   bridge window [io  0x3000-0x3fff]
[    0.642116] pci 0000:00:1d.0:   bridge window [mem 0xeac00000-0xeb5fff=
ff]
[    0.642118] pci 0000:00:1d.0:   bridge window [mem 0xea000000-0xea9fff=
ff 64bit pref]
[    0.642122] pci 0000:00:1d.4: PCI bridge to [bus 2e]
[    0.642124] pci 0000:00:1d.4:   bridge window [mem 0xeab00000-0xeabfff=
ff]
[    0.642131] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.642132] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.642133] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff win=
dow]
[    0.642134] pci_bus 0000:00: resource 7 [mem 0x9f800000-0xefffffff win=
dow]
[    0.642135] pci_bus 0000:00: resource 8 [mem 0xfc800000-0xfe7fffff win=
dow]
[    0.642136] pci_bus 0000:02: resource 1 [mem 0xeb600000-0xeb6fffff]
[    0.642136] pci_bus 0000:03: resource 0 [io  0x5000-0x6fff]
[    0.642137] pci_bus 0000:03: resource 1 [mem 0xdc000000-0xe81fffff]
[    0.642138] pci_bus 0000:03: resource 2 [mem 0xc0000000-0xdbffffff 64b=
it pref]
[    0.642138] pci_bus 0000:04: resource 0 [io  0x5000-0x5fff]
[    0.642139] pci_bus 0000:04: resource 1 [mem 0xdc000000-0xe81fffff]
[    0.642140] pci_bus 0000:04: resource 2 [mem 0xc0000000-0xdbffffff 64b=
it pref]
[    0.642141] pci_bus 0000:05: resource 1 [mem 0xe8100000-0xe81fffff]
[    0.642141] pci_bus 0000:06: resource 0 [io  0x5000-0x5fff]
[    0.642142] pci_bus 0000:06: resource 1 [mem 0xdc100000-0xe80fffff]
[    0.642143] pci_bus 0000:06: resource 2 [mem 0xc0000000-0xdbffffff 64b=
it pref]
[    0.642143] pci_bus 0000:2b: resource 1 [mem 0xdc000000-0xdc0fffff]
[    0.642144] pci_bus 0000:2d: resource 0 [io  0x3000-0x3fff]
[    0.642145] pci_bus 0000:2d: resource 1 [mem 0xeac00000-0xeb5fffff]
[    0.642145] pci_bus 0000:2d: resource 2 [mem 0xea000000-0xea9fffff 64b=
it pref]
[    0.642146] pci_bus 0000:2e: resource 1 [mem 0xeab00000-0xeabfffff]
[    0.642615] PCI: CLS 0 bytes, default 64
[    0.642619] DMAR: Host address width 39
[    0.642620] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
[    0.642626] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c406=
60462 ecap 19e2ff0505e
[    0.642628] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
[    0.642632] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c4066=
0462 ecap f050da
[    0.642633] DMAR: RMRR base: 0x0000009864f000 end: 0x0000009866efff
[    0.642634] Unpacking initramfs...
[    0.642634] DMAR: RMRR base: 0x0000009b000000 end: 0x0000009f7fffff
[    0.642639] DMAR: No ATSR found
[    0.642640] DMAR: No SATC found
[    0.642644] DMAR: dmar1: Using Queued invalidation
[    0.642689] pci 0000:00:00.0: Adding to iommu group 0
[    0.642696] pci 0000:00:04.0: Adding to iommu group 1
[    0.642702] pci 0000:00:08.0: Adding to iommu group 2
[    0.642711] pci 0000:00:12.0: Adding to iommu group 3
[    0.642722] pci 0000:00:14.0: Adding to iommu group 4
[    0.642727] pci 0000:00:14.2: Adding to iommu group 4
[    0.642733] pci 0000:00:14.3: Adding to iommu group 5
[    0.642741] pci 0000:00:16.0: Adding to iommu group 6
[    0.642748] pci 0000:00:1c.0: Adding to iommu group 7
[    0.642756] pci 0000:00:1c.4: Adding to iommu group 8
[    0.642765] pci 0000:00:1d.0: Adding to iommu group 9
[    0.642779] pci 0000:00:1d.4: Adding to iommu group 10
[    0.642798] pci 0000:00:1f.0: Adding to iommu group 11
[    0.642805] pci 0000:00:1f.3: Adding to iommu group 11
[    0.642810] pci 0000:00:1f.4: Adding to iommu group 11
[    0.642816] pci 0000:00:1f.5: Adding to iommu group 11
[    0.642822] pci 0000:00:1f.6: Adding to iommu group 11
[    0.642830] pci 0000:02:00.0: Adding to iommu group 12
[    0.642837] pci 0000:03:00.0: Adding to iommu group 13
[    0.642844] pci 0000:04:00.0: Adding to iommu group 14
[    0.642850] pci 0000:04:01.0: Adding to iommu group 15
[    0.642859] pci 0000:04:02.0: Adding to iommu group 16
[    0.642861] pci 0000:05:00.0: Adding to iommu group 14
[    0.642864] pci 0000:2b:00.0: Adding to iommu group 16
[    0.642872] pci 0000:2e:00.0: Adding to iommu group 17
[    0.643658] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.643659] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.643659] software IO TLB: mapped [mem 0x000000008d1da000-0x00000000=
911da000] (64MB)
[    0.643664] ACPI: bus type thunderbolt registered
[    0.643733] thunderbolt 0000:05:00.0: enabling device (0000 -> 0002)
[    0.821115] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 6553=
60 ms ovfl timer
[    0.821117] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    0.821118] RAPL PMU: hw unit of domain package 2^-14 Joules
[    0.821118] RAPL PMU: hw unit of domain dram 2^-14 Joules
[    0.821119] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    0.821119] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    0.821169] resource: resource sanity check: requesting [mem 0x0000000=
0fed10000-0x00000000fed15fff], which spans more than pnp 00:07 [mem 0xfed=
10000-0xfed13fff]
[    0.821171] caller snb_uncore_imc_init_box+0x7c/0xd0 mapping multiple =
BARs
[    0.821906] Initialise system trusted keyrings
[    0.821927] workingset: timestamp_bits=3D62 max_order=3D23 bucket_orde=
r=3D0
[    0.821962] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.821967] 9p: Installing v9fs 9p2000 file system support
[    0.827144] NET: Registered PF_ALG protocol family
[    0.827145] Key type asymmetric registered
[    0.827145] Asymmetric key parser 'x509' registered
[    0.827151] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 249)
[    0.827152] io scheduler mq-deadline registered
[    0.827153] io scheduler kyber registered
[    0.827927] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
=2E4
[    0.830048] acpiphp_ibm: ibm_acpiphp_init: acpi_walk_namespace failed
[    0.830645] ACPI: AC: AC Adapter [AC] (on-line)
[    0.830684] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0E:00/input/input0
[    0.830702] ACPI: button: Sleep Button [SLPB]
[    0.830719] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0D:00/input/input1
[    0.830730] ACPI: button: Lid Switch [LID]
[    0.830745] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input2
[    0.830756] ACPI: button: Power Button [PWRF]
[    0.834151] thermal LNXTHERM:00: registered as thermal_zone0
[    0.834153] ACPI: thermal: Thermal Zone [THM0] (48 C)
[    0.836200] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.837136] Non-volatile memory driver v1.3
[    0.837163] Linux agpgart interface v0.103
[    0.837273] ACPI: bus type drm_connector registered
[    0.837387] i915 0000:00:02.0: enabling device (0006 -> 0007)
[    0.866185] ACPI: battery: Slot [BAT0] (battery present)
[    0.886675] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on =
minor 0
[    0.888650] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no=
  post: no)
[    0.888728] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A=
08:00/LNXVIDEO:00/input/input3
[    0.889517] loop: module loaded
[    0.889706] nvme nvme0: pci function 0000:2e:00.0
[    0.889832] tun: Universal TUN/TAP device driver, 1.6
[    0.890007] e100: Intel(R) PRO/100 Network Driver
[    0.890008] e100: Copyright(c) 1999-2006 Intel Corporation
[    0.890012] e1000: Intel(R) PRO/1000 Network Driver
[    0.890013] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.890018] e1000e: Intel(R) PRO/1000 Network Driver
[    0.890018] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.890160] e1000e 0000:00:1f.6: Interrupt Throttling Rate (ints/sec) =
set to dynamic conservative mode
[    0.898152] nvme nvme0: 8/0/0 default/read/poll queues
[    0.911639]  nvme0n1: p3 p5
[    0.914326] fbcon: i915drmfb (fb0) is primary device
[    0.919270] Console: switching to colour frame buffer device 240x67
[    0.936747] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer devic=
e
[    1.125602] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): register=
ed PHC clock
[    1.190346] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width x1) 5=
4:05:db:12:2a:f1
[    1.190348] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network Connec=
tion
[    1.190462] e1000e 0000:00:1f.6 eth0: MAC: 13, PHY: 12, PBA No: FFFFFF=
-0FF
[    1.190475] sky2: driver version 1.30
[    1.190494] Intel(R) Wireless WiFi driver for Linux
[    1.190521] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    1.191998] iwlwifi 0000:00:14.3: Detected crf-id 0x3617, cnv-id 0x200=
00302 wfpm id 0x80000000
[    1.192016] iwlwifi 0000:00:14.3: PCI dev 02f0/0074, rev=3D0x351, rfid=
=3D0x10a100
[    1.192072] usbcore: registered new device driver r8152-cfgselector
[    1.192076] usbcore: registered new interface driver r8152
[    1.192078] usbcore: registered new interface driver asix
[    1.192080] usbcore: registered new interface driver ax88179_178a
[    1.192083] usbcore: registered new interface driver cdc_ether
[    1.192085] usbcore: registered new interface driver net1080
[    1.192087] usbcore: registered new interface driver zaurus
[    1.192090] usbcore: registered new interface driver cdc_ncm
[    1.192092] usbcore: registered new interface driver qmi_wwan
[    1.192094] usbcore: registered new interface driver cdc_mbim
[    1.192097] usbcore: registered new interface driver r8153_ecm
[    1.192370] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.192388] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 1
[    1.192403] xhci_hcd 0000:00:14.0: Disabled LPM!
[    1.193495] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0=
x110 quirks 0x0000000000009010
[    1.193641] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.193686] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 2
[    1.193687] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
[    1.193709] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.04
[    1.193711] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    1.193712] usb usb1: Product: xHCI Host Controller
[    1.193713] usb usb1: Manufacturer: Linux 6.4.0-devel+ xhci-hcd
[    1.193713] usb usb1: SerialNumber: 0000:00:14.0
[    1.193838] hub 1-0:1.0: USB hub found
[    1.193851] hub 1-0:1.0: 12 ports detected
[    1.194832] usb usb2: We don't know the algorithms for LPM for this ho=
st, disabling LPM.
[    1.194840] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.04
[    1.194841] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    1.194842] usb usb2: Product: xHCI Host Controller
[    1.194843] usb usb2: Manufacturer: Linux 6.4.0-devel+ xhci-hcd
[    1.194843] usb usb2: SerialNumber: 0000:00:14.0
[    1.194911] hub 2-0:1.0: USB hub found
[    1.194921] hub 2-0:1.0: 6 ports detected
[    1.195427] usb: port power management may be unreliable
[    1.195587] xhci_hcd 0000:2b:00.0: xHCI Host Controller
[    1.195636] xhci_hcd 0000:2b:00.0: new USB bus registered, assigned bu=
s number 3
[    1.195651] xhci_hcd 0000:2b:00.0: Disabled LPM!
[    1.196778] xhci_hcd 0000:2b:00.0: hcc params 0x200077c1 hci version 0=
x110 quirks 0x0000000200009010
[    1.196987] xhci_hcd 0000:2b:00.0: xHCI Host Controller
[    1.197031] xhci_hcd 0000:2b:00.0: new USB bus registered, assigned bu=
s number 4
[    1.197032] xhci_hcd 0000:2b:00.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
[    1.197050] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.04
[    1.197051] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    1.197052] usb usb3: Product: xHCI Host Controller
[    1.197053] usb usb3: Manufacturer: Linux 6.4.0-devel+ xhci-hcd
[    1.197053] usb usb3: SerialNumber: 0000:2b:00.0
[    1.197098] hub 3-0:1.0: USB hub found
[    1.197104] hub 3-0:1.0: 2 ports detected
[    1.197922] usb usb4: We don't know the algorithms for LPM for this ho=
st, disabling LPM.
[    1.197930] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.04
[    1.197931] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
[    1.197932] usb usb4: Product: xHCI Host Controller
[    1.197932] usb usb4: Manufacturer: Linux 6.4.0-devel+ xhci-hcd
[    1.197933] usb usb4: SerialNumber: 0000:2b:00.0
[    1.197999] hub 4-0:1.0: USB hub found
[    1.198006] hub 4-0:1.0: 2 ports detected
[    1.198948] usbcore: registered new interface driver cdc_acm
[    1.198949] cdc_acm: USB Abstract Control Model driver for USB modems =
and ISDN adapters
[    1.198952] usbcore: registered new interface driver usblp
[    1.198954] usbcore: registered new interface driver cdc_wdm
[    1.199036] usbcore: registered new interface driver uas
[    1.199044] usbcore: registered new interface driver usb-storage
[    1.199046] usbcore: registered new interface driver ums-datafab
[    1.199048] usbcore: registered new interface driver ums-freecom
[    1.199051] usbcore: registered new interface driver ums-isd200
[    1.199053] usbcore: registered new interface driver ums-jumpshot
[    1.199056] usbcore: registered new interface driver ums-sddr09
[    1.199058] usbcore: registered new interface driver ums-sddr55
[    1.199061] usbcore: registered new interface driver ums-usbat
[    1.207017] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
[    1.212729] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.212732] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.216079] mousedev: PS/2 mouse device common for all mice
[    1.217671] rtc_cmos 00:03: RTC can wake from S4
[    1.219214] rtc_cmos 00:03: registered as rtc0
[    1.219232] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvr=
am
[    1.219266] fail to initialize ptp_kvm
[    1.219394] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    1.219429] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    1.219793] input: AT Raw Set 2 keyboard as /devices/platform/i8042/se=
rio0/input/input4
[    1.219891] i2c i2c-7: 2/4 memory slots populated (from DMI)
[    1.220368] Consider using thermal netlink events interface
[    1.220658] i2c i2c-7: Successfully instantiated SPD at 0x51
[    1.222467] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
[    1.225092] intel_rapl_common: Found RAPL domain package
[    1.225094] intel_rapl_common: Found RAPL domain dram
[    1.225309] intel_pch_thermal 0000:00:12.0: enabling device (0000 -> 0=
002)
[    1.225558] intel_pstate: Intel P-state driver initializing
[    1.225782] intel_pstate: HWP enabled
[    1.225790] hid: raw HID events driver (C) Jiri Kosina
[    1.225822] usbcore: registered new interface driver usbhid
[    1.225823] usbhid: USB HID core driver
[    1.225925] fujitsu_laptop: driver 0.6.0 successfully loaded
[    1.226420] lenovo_wmi: BIOS setting (0): WakeOnLAN=3DACOnly
[    1.226868] lenovo_wmi: BIOS setting (1): WakeOnLANDock=3DEnable
[    1.227314] lenovo_wmi: BIOS setting (2): EthernetLANOptionROM=3DEnabl=
e
[    1.227751] lenovo_wmi: BIOS setting (3): IPv4NetworkStack=3DEnable
[    1.228258] lenovo_wmi: BIOS setting (4): IPv6NetworkStack=3DEnable
[    1.228697] lenovo_wmi: BIOS setting (5): UefiPxeBootPriority=3DIPv4Fi=
rst
[    1.229123] lenovo_wmi: BIOS setting (6): WirelessAutoDisconnection=3D=
Disable
[    1.229602] lenovo_wmi: BIOS setting (7): MACAddressPassThrough=3DEnab=
le
[    1.230032] lenovo_wmi: BIOS setting (8): AlwaysOnUSB=3DEnable
[    1.230476] lenovo_wmi: BIOS setting (9): TrackPoint=3DAutomatic
[    1.231089] lenovo_wmi: BIOS setting (10): TouchPad=3DAutomatic
[    1.231550] lenovo_wmi: BIOS setting (11): FnCtrlKeySwap=3DDisable
[    1.231987] lenovo_wmi: BIOS setting (12): FnSticky=3DDisable
[    1.232439] lenovo_wmi: BIOS setting (13): FnKeyAsPrimary=3DEnable
[    1.232885] lenovo_wmi: BIOS setting (14): BootDisplayDevice=3DLCD
[    1.233361] lenovo_wmi: BIOS setting (15): SharedDisplayPriority=3DUSB=
TypeC
[    1.233830] lenovo_wmi: BIOS setting (16): TotalGraphicsMemory=3D512MB=

[    1.234299] lenovo_wmi: BIOS setting (17): BootTimeExtension=3DDisable=

[    1.234773] lenovo_wmi: BIOS setting (18): SpeedStep=3DEnable
[    1.235343] lenovo_wmi: BIOS setting (19): AdaptiveThermalManagementAC=
=3DMaximizePerformance
[    1.235810] lenovo_wmi: BIOS setting (20): AdaptiveThermalManagementBa=
ttery=3DBalanced
[    1.236391] lenovo_wmi: BIOS setting (21): CPUPowerManagement=3DAutoma=
tic
[    1.236861] lenovo_wmi: BIOS setting (22): OnByAcAttach=3DDisable
[    1.237330] lenovo_wmi: BIOS setting (23): PasswordBeep=3DDisable
[    1.237797] lenovo_wmi: BIOS setting (24): KeyboardBeep=3DEnable
[    1.238269] lenovo_wmi: BIOS setting (25): HyperThreadingTechnology=3D=
Enable
[    1.238737] lenovo_wmi: BIOS setting (26): AMTControl=3DDisable
[    1.241369] lenovo_wmi: BIOS setting (27): USBKeyProvisioning=3DDisabl=
e
[    1.241925] lenovo_wmi: BIOS setting (28): ThunderboltSecurityLevel=3D=
UserAuthorization
[    1.242848] lenovo_wmi: BIOS setting (29): PreBootForThunderboltDevice=
=3DDisable
[    1.244937] lenovo_wmi: BIOS setting (30): SystemManagementPasswordCon=
trol=3DDisable
[    1.245410] lenovo_wmi: BIOS setting (31): PowerOnPasswordControl=3DDi=
sable
[    1.245884] lenovo_wmi: BIOS setting (32): HardDiskPasswordControl=3DD=
isable
[    1.246358] lenovo_wmi: BIOS setting (33): BIOSSetupConfigurations=3DD=
isable
[    1.246830] lenovo_wmi: BIOS setting (34): LockBIOSSetting=3DDisable
[    1.247380] lenovo_wmi: BIOS setting (35): MinimumPasswordLength=3DDis=
able
[    1.247902] lenovo_wmi: BIOS setting (36): BIOSPasswordAtUnattendedBoo=
t=3DDisable
[    1.248414] lenovo_wmi: BIOS setting (37): BIOSPasswordAtReboot=3DDisa=
ble
[    1.249309] lenovo_wmi: BIOS setting (38): BIOSPasswordAtBootDeviceLis=
t=3DDisable
[    1.251008] lenovo_wmi: BIOS setting (39): PasswordCountExceededError=3D=
Disable
[    1.251688] lenovo_wmi: BIOS setting (40): FingerprintPredesktopAuthen=
tication=3DDisable
[    1.254397] lenovo_wmi: BIOS setting (41): FingerprintSecurityMode=3DN=
ormal
[    1.255762] lenovo_wmi: BIOS setting (42): FingerprintPasswordAuthenti=
cation=3DEnable
[    1.256247] lenovo_wmi: BIOS setting (43): SecurityChip=3DDisable
[    1.257668] lenovo_wmi: BIOS setting (44): TXTFeature=3DDisable
[    1.258203] lenovo_wmi: BIOS setting (45): PhysicalPresenceForTpmClear=
=3DEnable
[    1.258676] lenovo_wmi: BIOS setting (46): BIOSUpdateByEndUsers=3DDisa=
ble
[    1.259152] lenovo_wmi: BIOS setting (47): SecureRollBackPrevention=3D=
Enable
[    1.259634] lenovo_wmi: BIOS setting (48): WindowsUEFIFirmwareUpdate=3D=
Enable
[    1.260095] lenovo_wmi: BIOS setting (49): DataExecutionPrevention=3DE=
nable
[    1.261515] lenovo_wmi: BIOS setting (50): VirtualizationTechnology=3D=
Enable
[    1.261980] lenovo_wmi: BIOS setting (51): VTdFeature=3DEnable
[    1.262482] lenovo_wmi: BIOS setting (52): EnhancedWindowsBiometricSec=
urity=3DDisable
[    1.265110] lenovo_wmi: BIOS setting (53): EthernetLANAccess=3DEnable
[    1.266509] lenovo_wmi: BIOS setting (54): WirelessLANAccess=3DEnable
[    1.267082] lenovo_wmi: BIOS setting (55): WirelessWANAccess=3DEnable
[    1.268929] lenovo_wmi: BIOS setting (56): BluetoothAccess=3DEnable
[    1.269559] lenovo_wmi: BIOS setting (57): USBPortAccess=3DEnable
[    1.270999] lenovo_wmi: BIOS setting (58): MemoryCardSlotAccess=3DEnab=
le
[    1.271489] lenovo_wmi: BIOS setting (59): SmartCardSlotAccess=3DEnabl=
e
[    1.271943] lenovo_wmi: BIOS setting (60): IntegratedCameraAccess=3DEn=
able
[    1.274635] lenovo_wmi: BIOS setting (61): IntegratedAudioAccess=3DEna=
ble
[    1.276074] lenovo_wmi: BIOS setting (62): MicrophoneAccess=3DEnable
[    1.276628] lenovo_wmi: BIOS setting (63): FingerprintReaderAccess=3DE=
nable
[    1.278072] lenovo_wmi: BIOS setting (64): ThunderboltAccess=3DEnable
[    1.278930] lenovo_wmi: BIOS setting (65): NfcAccess=3DEnable
[    1.281580] lenovo_wmi: BIOS setting (66): BottomCoverTamperDetected=3D=
Enable
[    1.282041] lenovo_wmi: BIOS setting (67): InternalStorageTamper=3DEna=
ble
[    1.282507] lenovo_wmi: BIOS setting (68): AbsolutePersistenceModuleAc=
tivation=3DDisable
[    1.285396] lenovo_wmi: BIOS setting (70): SecureBoot=3DEnable
[    1.285860] lenovo_wmi: BIOS setting (71): SGXControl=3DDisable
[    1.286383] lenovo_wmi: BIOS setting (72): DeviceGuard=3DDisable
[    1.286901] lenovo_wmi: BIOS setting (73): KernelDMAProtection=3DDisab=
le
[    1.287364] lenovo_wmi: BIOS setting (74): ThinkShieldsecurewipe=3DDis=
able
[    1.289942] lenovo_wmi: BIOS setting (77): BootMode=3DQuick
[    1.292518] lenovo_wmi: BIOS setting (78): StartupOptionKeys=3DEnable
[    1.293702] lenovo_wmi: BIOS setting (79): BootDeviceListF12Option=3DE=
nable
[    1.294317] lenovo_wmi: BIOS setting (80): BootOrder=3DUSBHDD:NVMe0:NV=
Me1:USBCD:USBFDD:PXEBOOT
[    1.295625] lenovo_wmi: BIOS setting (81): NetworkBoot=3DPXEBOOT
[    1.296138] lenovo_wmi: BIOS setting (82): BootOrderLock=3DDisable
[    1.296818] lenovo_wmi: BIOS setting (84): I8254ClockGating=3DAuto
[    1.297247] lenovo_wmi: BIOS setting (85): ThunderboltBIOSAssistMode=3D=
Disable
[    1.297671] lenovo_wmi: BIOS setting (86): WiFiNetworkBoot=3DDisable
[    1.298100] lenovo_wmi: BIOS setting (87): LenovoCloudServices=3DDisab=
le
[    1.299268] lenovo_wmi: BIOS setting (88): SleepState=3DLinux
[    1.299695] lenovo_wmi: BIOS setting (89): SetupUI=3DGraphical
[    1.300123] lenovo_wmi: BIOS setting (90): StrongPassword=3DDisable
[    1.302583] lenovo_wmi: BIOS setting (91): KeyboardLayout=3DEnglish_US=

[    1.303914] lenovo_wmi: BIOS setting (92): ChargeInBatteryMode=3DDisab=
le
[    1.304352] lenovo_wmi: BIOS setting (93): Reserved=3DEnable
[    1.305557] lenovo_wmi: BIOS setting (94): WakeUponAlarm=3DDisable
[    1.306063] lenovo_wmi: BIOS setting (95): AlarmTime=3D00:00:00
[    1.308382] lenovo_wmi: BIOS setting (96): AlarmDate=3D01\01\2020
[    1.308833] lenovo_wmi: BIOS setting (97): AlarmDayofWeek=3DSunday
[    1.309640] lenovo_wmi: BIOS setting (98): UserDefinedAlarmSunday=3DDi=
sable
[    1.311837] lenovo_wmi: BIOS setting (99): UserDefinedAlarmMonday=3DDi=
sable
[    1.312279] lenovo_wmi: BIOS setting (100): UserDefinedAlarmTuesday=3D=
Disable
[    1.312734] lenovo_wmi: BIOS setting (101): UserDefinedAlarmWednesday=3D=
Disable
[    1.313154] lenovo_wmi: BIOS setting (102): UserDefinedAlarmThursday=3D=
Disable
[    1.313998] lenovo_wmi: BIOS setting (103): UserDefinedAlarmFriday=3DD=
isable
[    1.315639] lenovo_wmi: BIOS setting (104): UserDefinedAlarmSaturday=3D=
Disable
[    1.316098] lenovo_wmi: BIOS setting (105): UserDefinedAlarmTime=3D00:=
00:00
[    1.383231] ucsi_acpi USBC000:00: error -ENODEV: con1: failed to get u=
sb role switch
[    1.389642] lenovo_wmi: BIOS capabilities: 0xff
[    1.389755] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[    1.389756] thinkpad_acpi: http://ibm-acpi.sf.net/
[    1.389757] thinkpad_acpi: ThinkPad BIOS N2XET24S (3.14 ), EC N2XHT25W=

[    1.389758] thinkpad_acpi: Lenovo ThinkPad T14 Gen 1, model 20S1S19N00=

[    1.389870] thinkpad_acpi: radio switch found; radios are enabled
[    1.389874] thinkpad_acpi: This ThinkPad has standard ACPI backlight b=
rightness control, supported by the ACPI video driver
[    1.389875] thinkpad_acpi: Disabling thinkpad-acpi brightness events b=
y default...
[    1.391896] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is=
 unblocked
[    1.392030] thinkpad_acpi: Forcing WWAN always present
[    1.395207] thinkpad_acpi: rfkill switch tpacpi_wwan_sw: radio is bloc=
ked
[    1.411547] thinkpad_acpi: battery 1 registered (start 0, stop 100, be=
haviours: 0x7)
[    1.411552] ACPI: battery: new extension: ThinkPad Battery Extension
[    1.416842] input: ThinkPad Extra Buttons as /devices/platform/thinkpa=
d_acpi/input/input7
[    1.418042] intel_rapl_common: Found RAPL domain package
[    1.418043] intel_rapl_common: Found RAPL domain core
[    1.418044] intel_rapl_common: Found RAPL domain uncore
[    1.418045] intel_rapl_common: Found RAPL domain dram
[    1.418046] intel_rapl_common: Found RAPL domain psys
[    1.418448] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/su=
bclass/prog-if info 0x040380
[    1.418478] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+=
 platform, using SOF driver
[    1.418491] usbcore: registered new interface driver snd-usb-audio
[    1.418531] snd_soc_skl 0000:00:1f.3: DSP detected with PCI class/subc=
lass/prog-if info 0x040380
[    1.418559] snd_soc_skl 0000:00:1f.3: Digital mics found on Skylake+ p=
latform, using SOF driver
[    1.418583] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PC=
I class/subclass/prog-if info 0x040380
[    1.418612] sof-audio-pci-intel-cnl 0000:00:1f.3: Digital mics found o=
n Skylake+ platform, using SOF driver
[    1.418621] sof-audio-pci-intel-cnl 0000:00:1f.3: enabling device (000=
4 -> 0006)
[    1.418687] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PC=
I class/subclass/prog-if 0x040380
[    1.418717] sof-audio-pci-intel-cnl 0000:00:1f.3: bound 0000:00:02.0 (=
ops i915_audio_component_bind_ops)
[    1.419136] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    1.419208] Initializing XFRM netlink socket
[    1.419211] IPsec XFRM device driver
[    1.419221] NET: Registered PF_INET6 protocol family
[    1.419514] Segment Routing with IPv6
[    1.419518] In-situ OAM (IOAM) with IPv6
[    1.419537] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.419664] NET: Registered PF_PACKET protocol family
[    1.419666] NET: Registered PF_KEY protocol family
[    1.419667] 8021q: 802.1Q VLAN Support v1.8
[    1.419676] 9pnet: Installing 9P2000 support
[    1.419956] microcode: Microcode Update Driver: v2.2.
[    1.419959] IPI shorthand broadcast: enabled
[    1.421486] sched_clock: Marking stable (1413000694, 8129219)->(123393=
0824, 187199089)
[    1.421559] ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
[    1.421649] Loading compiled-in X.509 certificates
[    1.424892] sof-audio-pci-intel-cnl 0000:00:1f.3: use msi interrupt mo=
de
[    1.435089] sof-audio-pci-intel-cnl 0000:00:1f.3: hda codecs found, ma=
sk 5
[    1.435091] sof-audio-pci-intel-cnl 0000:00:1f.3: using HDA machine dr=
iver skl_hda_dsp_generic now
[    1.435093] sof-audio-pci-intel-cnl 0000:00:1f.3: DMICs detected in NH=
LT tables: 2
[    1.438174] usb 1-1: new full-speed USB device number 2 using xhci_hcd=

[    1.573552] usb 1-1: New USB device found, idVendor=3D058f, idProduct=3D=
9540, bcdDevice=3D 1.20
[    1.573555] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    1.573556] usb 1-1: Product: EMV Smartcard Reader
[    1.573557] usb 1-1: Manufacturer: Generic
[    1.688171] usb 1-4: new high-speed USB device number 3 using xhci_hcd=

[    1.814876] usb 1-4: New USB device found, idVendor=3D8564, idProduct=3D=
1000, bcdDevice=3D10.75
[    1.814878] usb 1-4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    1.814879] usb 1-4: Product: Mass Storage Device
[    1.814880] usb 1-4: Manufacturer: JetFlash
[    1.814881] usb 1-4: SerialNumber: 3395704885
[    1.858174] tsc: Refined TSC clocksource calibration: 2303.999 MHz
[    1.858178] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
135f6faae8, max_idle_ns: 440795313647 ns
[    1.858239] clocksource: Switched to clocksource tsc
[    1.929134] usb 1-7: new high-speed USB device number 4 using xhci_hcd=

[    2.039608] psmouse serio1: synaptics: queried max coordinates: x [..5=
678], y [..4694]
[    2.071583] psmouse serio1: synaptics: queried min coordinates: x [126=
6..], y [1162..]
[    2.071587] psmouse serio1: synaptics: Trying to set up SMBus access
[    2.075315] rmi4_smbus 7-002c: registering SMbus-connected sensor
[    2.172307] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Syn=
aptics, product: TM3471-010, fw id: 2867793
[    2.257059] input: Synaptics TM3471-010 as /devices/pci0000:00/0000:00=
:1f.4/i2c-7/7-002c/rmi4-00/input/input8
[    2.267483] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
[    2.390378] psmouse serio2: trackpoint: Elan TrackPoint firmware: 0x11=
, buttons: 3/3
[    2.429244] input: TPPS/2 Elan TrackPoint as /devices/pci0000:00/0000:=
00:1f.4/i2c-7/7-002c/rmi4-00/rmi4-00.fn03/serio2/input/input9
[    2.731937] Freeing initrd memory: 36568K
[    2.732385] i915 0000:00:02.0: [drm] Finished loading DMC firmware i91=
5/kbl_dmc_ver1_04.bin (v1.4)
[    2.732665] modprobe (107) used greatest stack depth: 13432 bytes left=

[    2.733889] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: versi=
on 2:2:0-57864
[    2.733891] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:22:1=
 Kernel ABI 3:23:0
[    2.733895] sof-audio-pci-intel-cnl 0000:00:1f.3: unknown sof_ext_man =
header type 3 size 0x30
[    2.733932] Loaded X.509 cert 'Build time autogenerated kernel key: 73=
46c5d640191dd9249babd6d391b7784bb2c866'
[    2.734027] iwlwifi 0000:00:14.3: Direct firmware load for iwlwifi-QuZ=
-a0-hr-b0-78.ucode failed with error -2
[    2.734531] pstore: Using crash dump compression: deflate
[    2.734715] PM:   Magic number: 11:223:472
[    2.734779] acpi LNXSYSTM:00: hash matches
[    2.734816] cfg80211: Loading compiled-in X.509 certificates for regul=
atory database
[    2.736353] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    2.736360] clk: Disabling unused clocks
[    2.736361] ALSA device list:
[    2.736362]   No soundcards found.
[    2.737046] Freeing unused kernel image (initmem) memory: 3464K
[    2.738666] iwlwifi 0000:00:14.3: api flags index 2 larger than suppor=
ted by driver
[    2.738674] iwlwifi 0000:00:14.3: TLV_FW_FSEQ_VERSION: FSEQ Version: 8=
9.3.35.37
[    2.738872] iwlwifi 0000:00:14.3: loaded firmware version 77.2dda880d.=
0 QuZ-a0-hr-b0-77.ucode op_mode iwlmvm
[    2.740180] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 6 AX201 160M=
Hz, REV=3D0x351
[    2.740213] thermal thermal_zone7: failed to read out thermal zone (-6=
1)
[    2.746195] Write protecting the kernel read-only data: 30720k
[    2.746646] Freeing unused kernel image (rodata/data gap) memory: 2000=
K
[    2.747056] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    2.747060] Run /init as init process
[    2.747060]   with arguments:
[    2.747061]     /init
[    2.747062]     sina_toram
[    2.747062]   with environment:
[    2.747063]     HOME=3D/
[    2.747063]     TERM=3Dlinux
[    2.747063]     BOOT_IMAGE=3D/isolinux/bzImage
[    2.836431] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: versi=
on 2:2:0-57864
[    2.836434] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:22:1=
 Kernel ABI 3:23:0
[    2.836784] sof-audio-pci-intel-cnl 0000:00:1f.3: Topology: ABI 3:22:1=
 Kernel ABI 3:23:0
[    2.836948] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Parent card=
 not yet available, widget card binding deferred
[    2.847529] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC257: =
line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    2.847532] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=3D0 (0x=
0/0x0/0x0/0x0/0x0)
[    2.847533] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=3D1 (0x21/0x=
0/0x0/0x0/0x0)
[    2.847535] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=3D0x0=

[    2.847535] snd_hda_codec_realtek ehdaudio0D0:    inputs:
[    2.847536] snd_hda_codec_realtek ehdaudio0D0:      Mic=3D0x19
[    2.852894] ACPI Error: Needed [Integer/String/Buffer], found [Package=
] 000000006f3bd2d3 (20230331/exresop-469)
[    2.852900] ACPI Error: AE_AML_OPERAND_TYPE, While resolving operands =
for [OpcodeName unavailable] (20230331/dswexec-433)
[    2.852902] ACPI Error: Aborting method \ADBG due to previous error (A=
E_AML_OPERAND_TYPE) (20230331/psparse-529)
[    2.852905] ACPI Error: Aborting method \_SB.HIDD._DSM due to previous=
 error (AE_AML_OPERAND_TYPE) (20230331/psparse-529)
[    2.852909] ACPI: \_SB_.HIDD: failed to evaluate _DSM b356ecee-4244-8f=
40-a792-4edd4d758054 (0x3003)
[    2.852940] input: Intel HID events as /devices/platform/INT33D5:00/in=
put/input10
[    2.860473] iwlwifi 0000:00:14.3: Detected RF HR B3, rfid=3D0x10a100
[    2.887503] snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1T=
X overwritten
[    2.887508] snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF=
1RX overwritten
[    2.887583] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 hifi3 overwritten
[    2.887587] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 hifi2 overwritten
[    2.887589] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 hifi1 overwritten
[    2.887592] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Codec Output Pin1 overwritten
[    2.887594] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Codec Input Pin1 overwritten
[    2.887597] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Analog Codec Playback overwritten
[    2.887601] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Digital Codec Playback overwritten
[    2.887604] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget=
 Alt Analog Codec Playback overwritten
[    2.887608] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Analog Codec Capture overwritten
[    2.887611] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Digital Codec Capture overwritten
[    2.887614] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widg=
et Alt Analog Codec Capture overwritten
[    2.899482] input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3=
/skl_hda_dsp_generic/sound/card0/input11
[    2.899522] input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:0=
0:1f.3/skl_hda_dsp_generic/sound/card0/input12
[    2.899547] input: sof-hda-dsp HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input13
[    2.899594] input: sof-hda-dsp HDMI/DP,pcm=3D4 as /devices/pci0000:00/=
0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input14
[    2.899755] input: sof-hda-dsp HDMI/DP,pcm=3D5 as /devices/pci0000:00/=
0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input15
[    2.925707] iwlwifi 0000:00:14.3: base HW address: 34:2e:b7:52:c0:92
[    4.311061] usb 1-7: New USB device found, idVendor=3D2cb7, idProduct=3D=
0007, bcdDevice=3D 3.33
[    4.311074] usb 1-7: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[    4.311079] usb 1-7: Product: L850-GL
[    4.311083] usb 1-7: Manufacturer: Fibocom Wireless Inc.
[    4.311086] usb 1-7: SerialNumber: 004999010640000
[    4.371530] cdc_mbim 1-7:1.0: setting rx_max =3D 16384
[    4.372780] cdc_mbim 1-7:1.0: cdc-wdm0: USB WDM device
[    4.373025] wwan wwan0: port wwan0mbim0 attached
[    4.373413] cdc_mbim 1-7:1.0 wwan0: register 'cdc_mbim' at usb-0000:00=
:14.0-7, CDC MBIM, be:bf:52:8c:63:79
[    4.376789] cdc_acm 1-7:1.2: ttyACM0: USB ACM device
[    4.379862] cdc_acm 1-7:1.4: ttyACM1: USB ACM device
[    4.383079] cdc_acm 1-7:1.6: ttyACM2: USB ACM device
[    4.498296] usb 1-8: new high-speed USB device number 5 using xhci_hcd=

[    4.637832] usb 1-8: New USB device found, idVendor=3D04ca, idProduct=3D=
7070, bcdDevice=3D 0.25
[    4.637845] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    4.637850] usb 1-8: Product: Integrated Camera
[    4.637854] usb 1-8: Manufacturer: 8SSC20F27068L1GZ04LE286
[    4.754495] usb 1-10: new full-speed USB device number 6 using xhci_hc=
d
[    4.882046] usb 1-10: New USB device found, idVendor=3D8087, idProduct=
=3D0026, bcdDevice=3D 0.02
[    4.882059] usb 1-10: New USB device strings: Mfr=3D0, Product=3D0, Se=
rialNumber=3D0
[    4.884784] usb-storage 1-4:1.0: USB Mass Storage device detected
[    4.885460] scsi host0: usb-storage 1-4:1.0
[    5.013743] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialise=
d: dm-devel@redhat.com
[    5.088768] ISO 9660 Extensions: Microsoft Joliet Level 3
[    5.088911] ISO 9660 Extensions: RRIP_1991A
[    5.093361] ISO 9660 Extensions: Microsoft Joliet Level 3
[    5.093512] ISO 9660 Extensions: RRIP_1991A
[    5.097451] ISO 9660 Extensions: Microsoft Joliet Level 3
[    5.097588] ISO 9660 Extensions: RRIP_1991A
[    5.101759] ISO 9660 Extensions: Microsoft Joliet Level 3
[    5.101908] ISO 9660 Extensions: RRIP_1991A
[    5.891466] scsi 0:0:0:0: Direct-Access     JetFlash Transcend 64GB   =
1.00 PQ: 0 ANSI: 6
[    5.892763] sd 0:0:0:0: [sda] 123527168 512-byte logical blocks: (63.2=
 GB/58.9 GiB)
[    5.893051] sd 0:0:0:0: [sda] Write Protect is off
[    5.893063] sd 0:0:0:0: [sda] Mode Sense: 23 00 00 00
[    5.893245] sd 0:0:0:0: [sda] Write cache: disabled, read cache: disab=
led, doesn't support DPO or FUA
[    5.896069]  sda: sda1
[    5.896341] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   10.129783] udevd (134) used greatest stack depth: 13184 bytes left
[   10.129898] udevd (138) used greatest stack depth: 13128 bytes left
[   36.571923] loop8: detected capacity change from 0 to 1897568
[   36.972632] systemd[1]: Failed to find module 'autofs4'
[   36.993416] systemd[1]: systemd 251-3-g8eb56f4 running in system mode =
(-PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS -OPE=
NSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD -LIBCRYPTS=
ETUP -LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2 -LZ4 -XZ =
-ZLIB -ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP -SYSVINIT default-hierarchy=3D=
unified)
[   36.993420] systemd[1]: Detected architecture x86-64.
[   36.993423] systemd[1]: Detected first boot.
[   36.996579] systemd[1]: No hostname configured, using default hostname=
=2E
[   36.996597] systemd[1]: Hostname set to <localhost>.
[   37.005288] systemd[1]: Failed to configure loopback device: Operation=
 not permitted
[   37.071553] systemd[1]: Failed to populate /etc with preset unit setti=
ngs, ignoring: File exists
[   37.141074] systemd[1]: Queued start job for default target The SINA w=
orkstation.
[   37.155649] systemd[1]: Created slice Slice /system/net-ns.
[   37.156086] systemd[1]: Created slice Slice /system/net-ns-id.
[   37.157093] systemd[1]: Reached target Slice Units.
[   37.159410] systemd[1]: Listening on LVM2 metadata daemon socket.
[   37.160353] systemd[1]: Listening on Syslog Socket.
[   37.162954] systemd[1]: Listening on Process Core Dump Socket.
[   37.164024] systemd[1]: Journal Audit Socket was skipped because of a =
failed condition check (ConditionSecurity=3Daudit).
[   37.164591] systemd[1]: Listening on Journal Socket (/dev/log).
[   37.164709] systemd[1]: Listening on Journal Socket.
[   37.166141] systemd[1]: Listening on udev Control Socket.
[   37.166980] systemd[1]: Listening on udev Kernel Socket.
[   37.174338] systemd[1]: Mounting System mountpoint (/media)...
[   37.174908] systemd[1]: Mounting Container Data Exchange...
[   37.175842] systemd[1]: Mounting Dynamic Kernel Debugging...
[   37.177929] systemd[1]: Mounting USB filter filesystem...
[   37.178558] systemd[1]: Mounting Machines mountpoint...
[   37.182789] systemd[1]: Starting Dump bootsplash log...
[   37.184570] systemd[1]: Started Debug Shell.
[   37.185168] systemd[1]: Reached target Debug Mode.
[   37.186267] systemd[1]: Starting EFI Runtime Services Detection...
[   37.187334] systemd[1]: Starting Reserves memory for gpt-update...
[   37.188618] systemd[1]: Starting pstore util...
[   37.190277] systemd[1]: Starting Journal Service...
[   37.205647] systemd[1]: Starting Load Kernel Modules...
[   37.207110] systemd[1]: Starting Rule-based Manager for Device Events =
and Files...
[   37.210681] systemd[1]: Starting Setup Virtual Console...
[   37.212221] systemd[1]: Finished EFI Runtime Services Detection.
[   37.259327] cryptoapi_plugger: loading out-of-tree module taints kerne=
l.
[   37.263369] chiasmus: module license 'SECUNET' taints kernel.
[   37.263371] Disabling lock debugging due to kernel taint
[   37.263372] chiasmus: module license taints kernel.
[   37.270259] systemd[1]: Received SIGRTMIN+20 from PID 117 (plymouthd).=

[   37.281532] systemd[1]: bootsplash-log.service: Deactivated successful=
ly.
[   37.281605] systemd[1]: Finished Dump bootsplash log.
[   37.294395] systemd[1]: Mounted System mountpoint (/media).
[   37.294475] systemd[1]: Mounted Container Data Exchange.
[   37.295361] systemd[1]: Mounted Dynamic Kernel Debugging.
[   37.295443] systemd[1]: Mounted Machines mountpoint.
[   37.302262] systemd[1]: Mounted USB filter filesystem.
[   37.314201] systemd[1]: Starting Early USB filter rules initialization=
=2E..
[   37.314281] systemd[1]: Started Journal Service.
[   37.565725] Cipher test completed
[   37.592453] mcd_drv_init: PCI device not found
[   37.600928] Module modstop-test-unload has been loaded
[   37.673017] vboxdrv: Found 4 processor cores
[   37.688441] vboxdrv: TSC mode is Invariant, tentative frequency 230399=
9119 Hz
[   37.688443] vboxdrv: Successfully loaded version 6.1.44 r156814 (inter=
face 0x00320000)
[   37.694784] vtx: Detected Intel cpu
[   37.694789] vtx: HAS_VTX: 1, VTX_ENABLED: 1
[   37.741359] udevadm (241) used greatest stack depth: 13048 bytes left
[   38.070604] SUPR0GipMap: fGetGipCpu=3D0x1b
[   38.191631] usb 1-7: reset high-speed USB device number 4 using xhci_h=
cd
[   38.277109] vboxdrv: 00000000d28a8ec6 VMMR0.r0
[   38.295285] vboxdrv: 00000000e6ce262d VBoxDDR0.r0
[   38.487357] EXT4-fs (dm-3): mounted filesystem d09303c7-bcaf-46a9-9b98=
-c081ca6753c4 r/w with ordered data mode. Quota mode: disabled.
[   38.598871] EXT2-fs (sda): error: can't find an ext2 filesystem on dev=
 sda.
[   38.664164] usb 1-4: USB filter disconnects USB device number 3 from d=
river usb-storage
[   41.720147] ip (745) used greatest stack depth: 12696 bytes left
[   43.624969] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=3D=
1 'systemd'
[   44.995950] dm-253:36: Device is   /dev/sinavw/FQBPCZIK
[   44.995953] dm-253:36: Current Key is 0
[   44.995954] dm-253:36: using HMAC
[   44.995954] dm-253:36: using XTS IV
[   44.995955] dm-253:36: Using aead
[   44.995955] dm-253:36: Crypto : authenc(hmac(sha256),xts(aes))
[   44.995955] dm-253:36: Hash   : sha256
[   44.995956] dm-253:36: Hmac   : hmac(sha256)
[   44.995957] dm-253:36: keysize of 1. Key is 400
[   44.998620] dm-253:36: keysize of 2. Key is 400
[   44.998629] dm-253:36: new Key set
[   44.998641] dm-253:36: using unbound io wq with 1 jobs
[   44.998654] dm-253:36: using unbound crypto wq with 0 jobs
[   44.998673] dm-253:36: IVSize: 16
[   44.998673] dm-253:36: HMACSize: 32
[   44.998674] dm-253:36: Hashsize: 32
[   44.998674] dm-253:36: Setting authsize: 32
[   44.998675] dm-253:36: Logical blocksize: 4096
[   44.998675] dm-253:36: Blocksize: 16
[   44.998676] Logical blocksize: 4096
               Blocksize: 16
[   44.998676] dm-253:36: Data per sector is 448
[   44.998677] dm-253:36: Real Bytes per logical block is 5120
[   44.998677] dm-253:36: sector count=3D31128, real =3D40958
[   44.998684] dm-253:36: Sectorsize: 512
[   44.998685] dm-253:36:  device size=3D40960
[   45.042373] EXT4-fs (dm-36): mounted filesystem 4b1dfe8f-c9c3-4ed8-bb7=
f-fb3f8e6eb757 r/w with ordered data mode. Quota mode: disabled.
[   45.758238] smpboot: Booting Node 0 Processor 4 APIC 0x1
[   45.759379] MMIO Stale Data CPU bug present and SMT on, data leak poss=
ible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/proc=
essor_mmio_stale_data.html for more details.
[   45.759614] smpboot: Booting Node 0 Processor 5 APIC 0x3
[   45.761515] smpboot: Booting Node 0 Processor 6 APIC 0x5
[   45.764074] smpboot: Booting Node 0 Processor 7 APIC 0x7
[   45.860254] e1000e 0000:00:1f.6 enp0s31f6: renamed from eth0
[   45.906569] dm-253:37: Device is   /dev/sinaswap
[   45.906571] dm-253:37: using XTS IV
[   45.906572] dm-253:37: Using aead
[   45.906572] dm-253:37: Crypto : authenc(digest_null,xts(aes))
[   45.906573] dm-253:37: Hash   : rmd160
[   45.906573] dm-253:37: Hmac   : hmac(rmd160)
[   45.906575] dm-253:37: keysize of 1. Key is 400
[   45.908500] dm-253:37: new Key set
[   45.908519] dm-253:37: using unbound io wq with 1 jobs
[   45.908534] dm-253:37: using unbound crypto wq with 0 jobs
[   45.908556] dm-253:37: IVSize: 16
[   45.908557] dm-253:37: HMACSize: 20
[   45.908557] dm-253:37: Hashsize: 20
[   45.908558] dm-253:37: Logical blocksize: 4096
[   45.908559] dm-253:37: Blocksize: 16
[   45.908559] Logical blocksize: 4096
               Blocksize: 16
[   45.908560] dm-253:37: Data per sector is 496
[   45.908561] dm-253:37: Real Bytes per logical block is 4608
[   45.908562] dm-253:37: sector count=3D1864128, real =3D2097144
[   45.908567] dm-253:37: Sectorsize: 512
[   45.908568] dm-253:37:  device size=3D2097152
[   45.910691] Adding 932060k swap on /dev/mapper/swapUCWU.  Priority:-2 =
extents:1 across:932060k SS
[   46.276524] iwlwifi 0000:00:14.3: Registered PHC clock: iwlwifi-PTP, w=
ith index: 1
[   46.279388] ip (1638) used greatest stack depth: 12096 bytes left
[   47.092317] IPv6: ADDRCONF(NETDEV_CHANGE): veth1: link becomes ready
[   47.092334] IPv6: ADDRCONF(NETDEV_CHANGE): veth2: link becomes ready
[   47.094422] sbridge: port 1(veth1) entered blocking state
[   47.094430] sbridge: port 1(veth1) entered disabled state
[   47.094435] veth1: entered allmulticast mode
[   47.094471] veth1: entered promiscuous mode
[   47.099612] sbridge: port 2(dummy-slave) entered blocking state
[   47.099614] sbridge: port 2(dummy-slave) entered disabled state
[   47.099618] dummy-slave: entered allmulticast mode
[   47.099634] dummy-slave: entered promiscuous mode
[   47.100544] sbridge: port 2(dummy-slave) entered blocking state
[   47.100547] sbridge: port 2(dummy-slave) entered forwarding state
[   47.100551] sbridge: port 1(veth1) entered blocking state
[   47.100551] sbridge: port 1(veth1) entered forwarding state
[   47.129575] xfrm: renamed from xfrm-grademgmt
[   47.306529] sbridge: entered promiscuous mode
[   47.337028] [mgmt|v6] filter: drop:IN=3Dveth2 OUT=3D MAC=3D33:33:00:00=
:00:01:02:01:00:00:07:77:86:dd SRC=3Dfe80:0000:0000:0000:0001:00ff:fe00:0=
777 DST=3Dff02:0000:0000:0000:0000:0000:0000:0001 LEN=3D64 TC=3D0 HOPLIMI=
T=3D255 FLOWLBL=3D297800 PROTO=3DICMPv6 TYPE=3D134 CODE=3D0=20
[   51.906457] [mgmt|v6] filter: drop:IN=3Dveth2 OUT=3D MAC=3D5a:6f:4d:8f=
:3a:10:02:01:00:00:07:77:86:dd SRC=3Dfe80:0000:0000:0000:0001:00ff:fe00:0=
777 DST=3Dfe80:0000:0000:0000:586f:4dff:fe8f:3a10 LEN=3D64 TC=3D0 HOPLIMI=
T=3D255 FLOWLBL=3D630894 PROTO=3DICMPv6 TYPE=3D134 CODE=3D0=20
[   55.170189] 8021q: adding VLAN 0 to HW filter on device wwan0
[   61.122581] [mgmt|v6] filter: drop:IN=3Dveth2 OUT=3D MAC=3D5a:6f:4d:8f=
:3a:10:02:01:00:00:07:77:86:dd SRC=3Dfe80:0000:0000:0000:0001:00ff:fe00:0=
777 DST=3Dfe80:0000:0000:0000:586f:4dff:fe8f:3a10 LEN=3D64 TC=3D0 HOPLIMI=
T=3D255 FLOWLBL=3D630894 PROTO=3DICMPv6 TYPE=3D134 CODE=3D0=20
[   63.044576] ------------[ cut here ]------------
[   63.044579] thunderbolt 0000:05:00.0: interrupt for TX ring 0 is alrea=
dy enabled
[   63.044589] WARNING: CPU: 3 PID: 1794 at drivers/thunderbolt/nhi.c:137=
 ring_interrupt_active+0x244/0x2d0
[   63.044595] Modules linked in: vtx(O) vboxdrv(O) modstop_test_unload(O=
) mcd_drv(O) wacom dm_crypt_sina(O) chiasmus(PO) cryptoapi_plugger(O) dm_=
mod pinctrl_cannonlake pinctrl_intel intel_hid
[   63.044604] CPU: 3 PID: 1794 Comm: cat Tainted: P           O       6.=
4.0-devel+ #1
[   63.044606] Hardware name: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S=
 (3.14 ) 10/10/2020
[   63.044607] RIP: 0010:ring_interrupt_active+0x244/0x2d0
[   63.044610] Code: 08 44 89 04 24 e8 ac 87 c9 ff 4c 8b 4c 24 08 44 8b 0=
4 24 4c 89 f2 48 8b 4c 24 10 48 89 c6 48 c7 c7 20 2a f2 a2 e8 0c c6 48 ff=
 <0f> 0b 44 8b 5c 24 04 49 8b 47 08 40 84 ed 0f 85 e9 fe ff ff f6 40
[   63.044612] RSP: 0018:ffff93a986befba8 EFLAGS: 00010082
[   63.044613] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff8900f=
e4dc588
[   63.044614] RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI: ffff8900f=
e4dc580
[   63.044615] RBP: 0000000000000001 R08: ffffffffa394fd68 R09: 000000000=
004fffb
[   63.044616] R10: 00000000000004af R11: ffffffffa37cfd80 R12: 000000000=
0000001
[   63.044617] R13: 0000000000038200 R14: ffff88f9c1439320 R15: ffff88f9c=
2754b40
[   63.044618] FS:  00007f9a1dc92540(0000) GS:ffff8900fe4c0000(0000) knlG=
S:0000000000000000
[   63.044620] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   63.044621] CR2: 00007f9a1d397000 CR3: 0000000108022006 CR4: 000000000=
03706e0
[   63.044622] Call Trace:
[   63.044623]  <TASK>
[   63.044625]  ? __warn+0x84/0x140
[   63.044628]  ? ring_interrupt_active+0x244/0x2d0
[   63.044630]  ? report_bug+0x198/0x1b0
[   63.044634]  ? handle_bug+0x3c/0x70
[   63.044636]  ? exc_invalid_op+0x18/0x70
[   63.044637]  ? asm_exc_invalid_op+0x1a/0x20
[   63.044642]  ? ring_interrupt_active+0x244/0x2d0
[   63.044644]  ? ring_interrupt_active+0x244/0x2d0
[   63.044645]  tb_ring_start+0x152/0x300
[   63.044648]  tb_ctl_start+0x26/0xa0
[   63.044650]  ? __pfx_pci_pm_runtime_resume+0x10/0x10
[   63.044653]  tb_domain_runtime_resume+0x19/0x40
[   63.044657]  __rpm_callback+0x41/0x120
[   63.044659]  ? __pfx_pci_pm_runtime_resume+0x10/0x10
[   63.044661]  rpm_callback+0x5d/0x70
[   63.044662]  rpm_resume+0x51b/0x770
[   63.044664]  rpm_resume+0x255/0x770
[   63.044665]  ? __kmem_cache_alloc_node+0xd8/0x1b0
[   63.044668]  __pm_runtime_resume+0x4e/0x80
[   63.044670]  boot_acl_show+0x63/0x1b0
[   63.044672]  dev_attr_show+0x1a/0x60
[   63.044675]  sysfs_kf_seq_show+0xad/0xf0
[   63.044678]  seq_read_iter+0x110/0x4b0
[   63.044682]  ? __handle_mm_fault+0x5e7/0xc00
[   63.044684]  vfs_read+0x197/0x2b0
[   63.044687]  ksys_read+0x63/0xe0
[   63.044690]  do_syscall_64+0x3c/0x90
[   63.044692]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[   63.044695] RIP: 0033:0x7f9a1dbbaeae
[   63.044697] Code: c0 e9 b6 fe ff ff 50 48 8d 3d 2e 18 0a 00 e8 49 e8 0=
1 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05=
 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[   63.044698] RSP: 002b:00007fff68bc4358 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000000
[   63.044700] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f9a1=
dbbaeae
[   63.044701] RDX: 0000000000020000 RSI: 00007f9a1d398000 RDI: 000000000=
0000003
[   63.044702] RBP: 00007f9a1d398000 R08: 00007f9a1d397010 R09: 000000000=
0000000
[   63.044702] R10: fffffffffffff1ef R11: 0000000000000246 R12: 000000000=
0000000
[   63.044703] R13: 0000000000000003 R14: 0000000000020000 R15: 000000000=
0020000
[   63.044705]  </TASK>
[   63.044705] ---[ end trace 0000000000000000 ]---
[   63.044713] ------------[ cut here ]------------
[   63.044713] thunderbolt 0000:05:00.0: interrupt for RX ring 0 is alrea=
dy enabled
[   63.044720] WARNING: CPU: 3 PID: 1794 at drivers/thunderbolt/nhi.c:137=
 ring_interrupt_active+0x244/0x2d0
[   63.044723] Modules linked in: vtx(O) vboxdrv(O) modstop_test_unload(O=
) mcd_drv(O) wacom dm_crypt_sina(O) chiasmus(PO) cryptoapi_plugger(O) dm_=
mod pinctrl_cannonlake pinctrl_intel intel_hid
[   63.044728] CPU: 3 PID: 1794 Comm: cat Tainted: P        W  O       6.=
4.0-devel+ #1
[   63.044730] Hardware name: LENOVO 20S1S19N00/20S1S19N00, BIOS N2XET24S=
 (3.14 ) 10/10/2020
[   63.044730] RIP: 0010:ring_interrupt_active+0x244/0x2d0
[   63.044732] Code: 08 44 89 04 24 e8 ac 87 c9 ff 4c 8b 4c 24 08 44 8b 0=
4 24 4c 89 f2 48 8b 4c 24 10 48 89 c6 48 c7 c7 20 2a f2 a2 e8 0c c6 48 ff=
 <0f> 0b 44 8b 5c 24 04 49 8b 47 08 40 84 ed 0f 85 e9 fe ff ff f6 40
[   63.044733] RSP: 0018:ffff93a986befba8 EFLAGS: 00010082
[   63.044734] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff8900f=
e4dc588
[   63.044735] RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI: ffff8900f=
e4dc580
[   63.044736] RBP: 0000000000000001 R08: ffffffffa394fd68 R09: 000000000=
004fffb
[   63.044737] R10: 00000000000004e8 R11: ffffffffa37cfd80 R12: 000000000=
0001000
[   63.044738] R13: 0000000000038200 R14: ffff88f9c1439320 R15: ffff88f9c=
2c55300
[   63.044739] FS:  00007f9a1dc92540(0000) GS:ffff8900fe4c0000(0000) knlG=
S:0000000000000000
[   63.044740] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   63.044741] CR2: 00007f9a1d397000 CR3: 0000000108022006 CR4: 000000000=
03706e0
[   63.044742] Call Trace:
[   63.044742]  <TASK>
[   63.044743]  ? __warn+0x84/0x140
[   63.044744]  ? ring_interrupt_active+0x244/0x2d0
[   63.044746]  ? report_bug+0x198/0x1b0
[   63.044749]  ? handle_bug+0x3c/0x70
[   63.044750]  ? exc_invalid_op+0x18/0x70
[   63.044751]  ? asm_exc_invalid_op+0x1a/0x20
[   63.044754]  ? ring_interrupt_active+0x244/0x2d0
[   63.044756]  ? ring_interrupt_active+0x244/0x2d0
[   63.044758]  tb_ring_start+0x152/0x300
[   63.044760]  tb_ctl_start+0x30/0xa0
[   63.044762]  ? __pfx_pci_pm_runtime_resume+0x10/0x10
[   63.044764]  tb_domain_runtime_resume+0x19/0x40
[   63.044766]  __rpm_callback+0x41/0x120
[   63.044768]  ? __pfx_pci_pm_runtime_resume+0x10/0x10
[   63.044769]  rpm_callback+0x5d/0x70
[   63.044771]  rpm_resume+0x51b/0x770
[   63.044772]  rpm_resume+0x255/0x770
[   63.044774]  ? __kmem_cache_alloc_node+0xd8/0x1b0
[   63.044776]  __pm_runtime_resume+0x4e/0x80
[   63.044777]  boot_acl_show+0x63/0x1b0
[   63.044779]  dev_attr_show+0x1a/0x60
[   63.044782]  sysfs_kf_seq_show+0xad/0xf0
[   63.044784]  seq_read_iter+0x110/0x4b0
[   63.044786]  ? __handle_mm_fault+0x5e7/0xc00
[   63.044788]  vfs_read+0x197/0x2b0
[   63.044790]  ksys_read+0x63/0xe0
[   63.044792]  do_syscall_64+0x3c/0x90
[   63.044794]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[   63.044796] RIP: 0033:0x7f9a1dbbaeae
[   63.044797] Code: c0 e9 b6 fe ff ff 50 48 8d 3d 2e 18 0a 00 e8 49 e8 0=
1 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f 05=
 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[   63.044798] RSP: 002b:00007fff68bc4358 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000000
[   63.044800] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f9a1=
dbbaeae
[   63.044800] RDX: 0000000000020000 RSI: 00007f9a1d398000 RDI: 000000000=
0000003
[   63.044801] RBP: 00007f9a1d398000 R08: 00007f9a1d397010 R09: 000000000=
0000000
[   63.044802] R10: fffffffffffff1ef R11: 0000000000000246 R12: 000000000=
0000000
[   63.044803] R13: 0000000000000003 R14: 0000000000020000 R15: 000000000=
0020000
[   63.044804]  </TASK>
[   63.044805] ---[ end trace 0000000000000000 ]---
[   63.338031] [mgmt|v6] filter: drop:IN=3Dveth2 OUT=3D MAC=3D33:33:00:00=
:00:01:02:01:00:00:07:77:86:dd SRC=3Dfe80:0000:0000:0000:0001:00ff:fe00:0=
777 DST=3Dff02:0000:0000:0000:0000:0000:0000:0001 LEN=3D64 TC=3D0 HOPLIMI=
T=3D255 FLOWLBL=3D297800 PROTO=3DICMPv6 TYPE=3D134 CODE=3D0=20
[   74.904349] usb-storage 1-4:1.0: USB Mass Storage device detected
[   74.904749] scsi host0: usb-storage 1-4:1.0
[   75.907563] scsi 0:0:0:0: Direct-Access     JetFlash Transcend 64GB   =
1.00 PQ: 0 ANSI: 6
[   75.908555] sd 0:0:0:0: [sda] 123527168 512-byte logical blocks: (63.2=
 GB/58.9 GiB)
[   75.908784] sd 0:0:0:0: [sda] Write Protect is off
[   75.908795] sd 0:0:0:0: [sda] Mode Sense: 23 00 00 00
[   75.909057] sd 0:0:0:0: [sda] Write cache: disabled, read cache: disab=
led, doesn't support DPO or FUA
[   75.911075]  sda: sda1
[   75.911145] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   78.530702] [mgmt|v6] filter: drop:IN=3Dveth2 OUT=3D MAC=3D5a:6f:4d:8f=
:3a:10:02:01:00:00:07:77:86:dd SRC=3Dfe80:0000:0000:0000:0001:00ff:fe00:0=
777 DST=3Dfe80:0000:0000:0000:586f:4dff:fe8f:3a10 LEN=3D64 TC=3D0 HOPLIMI=
T=3D255 FLOWLBL=3D630894 PROTO=3DICMPv6 TYPE=3D134 CODE=3D0=20

--------------E7E2330BF4D1B66328460ECA--

