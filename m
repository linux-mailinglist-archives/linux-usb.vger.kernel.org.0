Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA8140DEB9
	for <lists+linux-usb@lfdr.de>; Thu, 16 Sep 2021 17:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239253AbhIPPzK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Sep 2021 11:55:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:42166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231702AbhIPPzK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Sep 2021 11:55:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AA26361164
        for <linux-usb@vger.kernel.org>; Thu, 16 Sep 2021 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631807629;
        bh=tn1L4N33mCcXrs4+EKWjgLKUXWyCWboQ2tAykEeJi10=;
        h=From:To:Subject:Date:From;
        b=vFe1PBTMhxAzrmD9Cy93Lm1Ini2OrP8spENMNytiVI2dWTQfI2Obu5kBalSfiyagq
         bNu/CBTg7M/BayrgjLY4fOcro1FO+mY1udAlUrpIEL2Uph10hRbEnFMyB0IAgWfUVO
         Rzy3bu/aQoiCsp3hZ7uoiTqNXd69NMUVbxDgGR7IZZ/VKQVtWTZhFVR1hu21J66hvB
         fJSacWziIoDBiu96jVHk6MolNKRPKXo5ApdkceutMpwiZuwSZ/FRz4LTLzk773wXyZ
         bHsHU5nzOoxina4Tw4aKi0D4X/pwYXQ1F9tJCPnUuI0zFM+lpIylHgIu8MhJbfocsa
         cG9/uFq7V+Wow==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 9D362610A4; Thu, 16 Sep 2021 15:53:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214437] New: usb: hid: u2fzero: buffer overrun in
 u2fzero_rng_read
Date:   Thu, 16 Sep 2021 15:53:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andrew@shadura.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214437-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214437

            Bug ID: 214437
           Summary: usb: hid: u2fzero: buffer overrun in u2fzero_rng_read
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: andrew@shadura.me
        Regression: No

Sometimes the driver crashes with a buffer overflow upon the device inserti=
on.
After the crash, often neither U2F nor RNG functionality is available.

usb 2-2: USB disconnect, device number 18
detected buffer overflow in memcpy
------------[ cut here ]------------
kernel BUG at lib/string.c:1149!
invalid opcode: 0000 [#1] SMP PTI
CPU: 1 PID: 61299 Comm: hwrng Tainted: G          IOE     5.11.0-25-generic
#27-Ubuntu
Hardware name: LENOVO 20CM001UUK/20CM001UUK, BIOS N10ET27W (1.04 ) 12/01/20=
14
RIP: 0010:fortify_panic+0x13/0x15
Code: 35 96 77 36 01 48 c7 c7 6b 01 81 8a e8 d3 c3 fe ff 41 5c 41 5d 5d c3 =
55
48 89 fe 48 c7 c7 b8 01 81 8a 48 89 e5 e8 ba c3 fe ff <0f> 0b 48 c7 c7 90 f=
7 48
8a e8 df ff ff ff 48 c7 c7 98 f7 48 8a e8
RSP: 0018:ffffb04803df3e28 EFLAGS: 00010246
RAX: 0000000000000022 RBX: 0000000000000040 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff8de3bdc58ac0 RDI: ffff8de3bdc58ac0
RBP: ffffb04803df3e28 R08: 0000000000000000 R09: ffffb04803df3c20
R10: ffffb04803df3c18 R11: ffffffff8af53588 R12: ffff8de089aa7440
R13: ffff8de2c3862598 R14: 0000000000000000 R15: ffffb0480366f428
FS:  0000000000000000(0000) GS:ffff8de3bdc40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa10098f000 CR3: 00000002bec10004 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 u2fzero_rng_read.cold+0xc/0xc [hid_u2fzero]
 hwrng_fillfn+0xd8/0x180
 kthread+0x12f/0x150
 ? enable_best_rng+0x70/0x70
 ? __kthread_bind_mask+0x70/0x70
 ret_from_fork+0x22/0x30
Modules linked in: hid_u2fzero hid_generic usbhid hid usb_serial_simple
usbserial ccm xt_nat veth nf_conntrack_netlink xfrm_user xfrm_algo xt_addrt=
ype
br_netfilter bridge stp llc vboxnetadp(OE) vboxnetflt(OE) vboxdrv(OE) bnep
snd_seq_dummy snd_hrtimer ip6t_REJECT nf_reject_ipv6 ip6t_rpfilter xt_tcpudp
ipt_REJECT nf_reject_ipv4 xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nft_counter overlay ip6_tables
nft_compat ip_set nf_tables nfnetlink nls_iso8859_1 binfmt_misc joydev
intel_rapl_msr mei_hdcp snd_hda_codec_realtek snd_hda_codec_generic
snd_hda_codec_hdmi uvcvideo snd_hda_intel btusb btrtl intel_rapl_common
snd_intel_dspcfg soundwire_intel x86_pkg_temp_thermal
soundwire_generic_allocation intel_powerclamp btbcm soundwire_cadence coret=
emp
snd_hda_codec btintel snd_hda_core cdc_mbim kvm_intel cdc_wdm snd_hwdep
bluetooth cdc_ncm cdc_ether snd_seq_midi ecdh_generic soundwire_bus
snd_seq_midi_event cdc_acm ecc usbnet mii kvm
 rmi_smbus snd_soc_core snd_compress rapl rmi_core intel_cstate ac97_bus
snd_rawmidi snd_pcm_dmaengine videobuf2_vmalloc snd_pcm input_leds iwlmvm
videobuf2_memops mac80211 serio_raw wmi_bmof efi_pstore videobuf2_v4l2 liba=
rc4
videobuf2_common snd_seq iwlwifi snd_seq_device snd_timer videodev at24
intel_pch_thermal mc cfg80211 thinkpad_acpi nvram ledtrig_audio mei_me mei =
snd
soundcore mac_hid sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp par=
port
ip_tables x_tables autofs4 btrfs blake2b_generic xor raid6_pq libcrc32c
dm_crypt crct10dif_pclmul i915 rtsx_pci_sdmmc crc32_pclmul i2c_algo_bit
ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper lpc_ich
drm_kms_helper syscopyarea sysfillrect psmouse sysimgblt fb_sys_fops cec ah=
ci
i2c_i801 libahci rc_core i2c_smbus e1000e rtsx_pci drm xhci_pci
xhci_pci_renesas wmi video
---[ end trace e7936f97d201c167 ]---
RIP: 0010:fortify_panic+0x13/0x15
Code: 35 96 77 36 01 48 c7 c7 6b 01 81 8a e8 d3 c3 fe ff 41 5c 41 5d 5d c3 =
55
48 89 fe 48 c7 c7 b8 01 81 8a 48 89 e5 e8 ba c3 fe ff <0f> 0b 48 c7 c7 90 f=
7 48
8a e8 df ff ff ff 48 c7 c7 98 f7 48 8a e8
RSP: 0018:ffffb04803df3e28 EFLAGS: 00010246
RAX: 0000000000000022 RBX: 0000000000000040 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff8de3bdc58ac0 RDI: ffff8de3bdc58ac0
RBP: ffffb04803df3e28 R08: 0000000000000000 R09: ffffb04803df3c20
R10: ffffb04803df3c18 R11: ffffffff8af53588 R12: ffff8de089aa7440
R13: ffff8de2c3862598 R14: 0000000000000000 R15: ffffb0480366f428
FS:  0000000000000000(0000) GS:ffff8de3bdc40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa10098f000 CR3: 0000000194fa6005 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
