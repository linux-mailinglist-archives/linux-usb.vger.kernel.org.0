Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 258485EFD75
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 20:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiI2Sxx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 14:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiI2Sxt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 14:53:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47AD214329A
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 11:53:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A28AD620E0
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 18:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F202C433D6
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664477627;
        bh=wbGuRXpaXEtAasKwQOvPML6Xwoh+bfhz4MM3eMOTh8I=;
        h=From:To:Subject:Date:From;
        b=MI3MFhnFUSY2J72nY1AFI2wSbtVz5JZ5S8SajyNMa8jW69ROzIS4CRPh1hN6z09/F
         RfFL38Tflm2NUfAff+34alJkICz+TZDquO1KWoE9QiAH9zk+OYpVkkufkMc+8h7THa
         h5sis4MJtBboIcdgQblC5YRzs++AxTiXpktHk+P8MlYyI6QMsR6OYTuUIHWWKhU2pb
         CvoB3Nb6w0oRoiHXr/FfFXI6cFLl0kZlYho5CTSxqkE0qnUW7LgaGRbVdNpHhZY3rv
         gV64/6t/p6m0VpPzWNwjkYriZUlFLZa6NjGLJ/nm2SKuEUx+zuwvpQBwTEBc4vA2Bv
         /jZwGZDjJN54g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E73C5C433E6; Thu, 29 Sep 2022 18:53:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] New: kernel NULL pointer dereference
 usb_hcd_alloc_bandwidth
Date:   Thu, 29 Sep 2022 18:53:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nazar@mokrynskyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216543-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216543

            Bug ID: 216543
           Summary: kernel NULL pointer dereference
                    usb_hcd_alloc_bandwidth
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.10
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nazar@mokrynskyi.com
        Regression: No

With a flaky USB 3.0 cable (3m extension + 2m cable + 90 degree adapter) and
Logitech BRIO webcam I got exactly the same null pointer dereference twice
already.

I'm sorry for not using vanilla kernel upfront, but I strongly doubt someth=
ing
as fundamental as this would be different in Xanmod kernel.

Call traces are quite similar at the top, so while triggered from different
places, the actual bug must be the same.

Here are two instances (from different boots):
[64977.148098] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[64977.148101] #PF: supervisor read access in kernel mode
[64977.148102] #PF: error_code(0x0000) - not-present page
[64977.148103] PGD 101370067 P4D 101370067 PUD 0
[64977.148105] Oops: 0000 [#1] SMP NOPTI
[64977.148107] CPU: 14 PID: 27951 Comm: VideoCapture Not tainted
5.19.10-xanmod1-x64v2 #0~20220920.git017c598
[64977.148109] Hardware name: Gigabyte Technology Co., Ltd. B550 VISION D/B=
550
VISION D, BIOS F15d 07/20/2022
[64977.148109] RIP: 0010:usb_ifnum_to_if+0x34/0x60
[64977.148113] Code: 74 33 0f b6 4a 04 84 c9 74 33 83 e9 01 48 8d 82 98 00 =
00
00 48 8d bc ca a0 00 00 00 eb 09 48 83 c0 08 48 39 f8 74 16 48 8b 10 <48> 8=
b 0a
0f b6 49 02 39 f1 75 e9 48 89 d0 c3 cc cc cc cc 31 d2 48
[64977.148114] RSP: 0018:ffffb20951407bb0 EFLAGS: 00010202
[64977.148115] RAX: ffff8cfbbc618098 RBX: ffff8ceb844cc800 RCX:
0000000000000004
[64977.148116] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff8cfbbc6180c0
[64977.148117] RBP: 0000000000000000 R08: 0000000080000000 R09:
ffffffff8f590de8
[64977.148117] R10: 0000000000000001 R11: 0000000000000001 R12:
ffff8cf67c70f398
[64977.148118] R13: 0000000000000000 R14: ffff8cf67c70f208 R15:
ffff8ceb8123c000
[64977.148119] FS:  00007f5f51379640(0000) GS:ffff8d0a3ed80000(0000)
knlGS:0000000000000000
[64977.148120] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[64977.148120] CR2: 0000000000000000 CR3: 000000023b842000 CR4:
0000000000750ee0
[64977.148121] PKRU: 55555554
[64977.148122] Call Trace:
[64977.148123]  <TASK>
[64977.148124]  usb_hcd_alloc_bandwidth+0x241/0x360
[64977.148127]  usb_set_interface+0x11d/0x340
[64977.148130]  uvc_video_start_transfer+0x17b/0x4b0 [uvcvideo]
[64977.148134]  uvc_video_start_streaming+0x6f/0xc0 [uvcvideo]
[64977.148137]  uvc_start_streaming+0x25/0xe0 [uvcvideo]
[64977.148139]  vb2_start_streaming+0x7f/0x120 [videobuf2_common]
[64977.148142]  vb2_core_streamon+0x53/0xb0 [videobuf2_common]
[64977.148144]  uvc_queue_streamon+0x22/0x40 [uvcvideo]
[64977.148146]  uvc_ioctl_streamon+0x33/0x50 [uvcvideo]
[64977.148148]  __video_do_ioctl+0x197/0x3e0 [videodev]
[64977.148153]  ? kernel_clone+0xfb/0x3d0
[64977.148156]  video_usercopy+0x2b3/0x670 [videodev]
[64977.148160]  ? v4l_print_control+0x20/0x20 [videodev]
[64977.148163]  ? handle_mm_fault+0xcb/0x2b0
[64977.148166]  v4l2_ioctl+0x44/0x50 [videodev]
[64977.148169]  __x64_sys_ioctl+0x8b/0xc0
[64977.148171]  do_syscall_64+0x5b/0x80
[64977.148174]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[64977.148176] RIP: 0033:0x7f5f8c300aff
[64977.148177] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00
00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 8=
9 c0
3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[64977.148178] RSP: 002b:00007f5f51378320 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[64977.148179] RAX: ffffffffffffffda RBX: 00007f5f513783a0 RCX:
00007f5f8c300aff
[64977.148180] RDX: 00007f5f513783c0 RSI: 0000000040045612 RDI:
0000000000000178
[64977.148180] RBP: 00007f5f51378630 R08: 00007f5f331b1640 R09:
00007f5f5137811f
[64977.148181] R10: 0000000000000008 R11: 0000000000000246 R12:
00007f5f513783c0
[64977.148181] R13: 00007f5d8c8eb390 R14: 00007f5d8c8eb000 R15:
0000000000000000
[64977.148182]  </TASK>
[64977.148183] Modules linked in: xt_nat veth nf_conntrack_netlink xfrm_user
xfrm_algo xt_addrtype br_netfilter xt_CHECKSUM xt_MASQUERADE xt_conntrack
ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp l=
lc
overlay nvme_fabrics binfmt_misc nls_iso8859_1 iwlmvm snd_hda_codec_hdmi
sch_fq_codel intel_rapl_msr snd_hda_intel intel_rapl_common uvcvideo
snd_intel_dspcfg mac80211 snd_usb_audio libarc4 videobuf2_vmalloc
snd_intel_sdw_acpi edac_mce_amd videobuf2_memops snd_hda_codec snd_usbmidi_=
lib
videobuf2_v4l2 snd_hda_core videobuf2_common snd_rawmidi nct6775_core snd_h=
wdep
snd_seq_device videodev iwlwifi btusb hwmon_vid kvm_amd btrtl vfio_pci
input_leds joydev snd_pcm btbcm mc btintel vfio_pci_core iwlmei snd_timer k=
vm
vfio_virqfd btmtk cfg80211 irqbypass bluetooth snd ucsi_ccg cuse mei ccp
typec_ucsi soundcore lp k10temp serio_raw wmi_bmof typec ecdh_generic ecc
gigabyte_wmi rapl mac_hid parport msr bfq
[64977.148209]  ramoops reed_solomon pstore_blk pstore_zone efi_pstore
ip_tables x_tables autofs4 btrfs blake2b_generic dm_crypt raid10 raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq
libcrc32c raid1 raid0 multipath linear uas usb_storage hid_generic usbhid h=
id
amdgpu iommu_v2 gpu_sched drm_ttm_helper ttm drm_display_helper cec rc_core
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops crct10dif_pclm=
ul
crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd igb cryptd psmouse
i2c_nvidia_gpu drm i2c_piix4 nvme ahci i2c_ccgx_ucsi dca xhci_pci i2c_algo_=
bit
thunderbolt nvme_core libahci xhci_pci_renesas wmi gpio_amdpt
[64977.148231] CR2: 0000000000000000
[64977.148232] ---[ end trace 0000000000000000 ]---
[64977.308559] RIP: 0010:usb_ifnum_to_if+0x34/0x60
[64977.308566] Code: 74 33 0f b6 4a 04 84 c9 74 33 83 e9 01 48 8d 82 98 00 =
00
00 48 8d bc ca a0 00 00 00 eb 09 48 83 c0 08 48 39 f8 74 16 48 8b 10 <48> 8=
b 0a
0f b6 49 02 39 f1 75 e9 48 89 d0 c3 cc cc cc cc 31 d2 48
[64977.308568] RSP: 0018:ffffb20951407bb0 EFLAGS: 00010202
[64977.308570] RAX: ffff8cfbbc618098 RBX: ffff8ceb844cc800 RCX:
0000000000000004
[64977.308571] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff8cfbbc6180c0
[64977.308572] RBP: 0000000000000000 R08: 0000000080000000 R09:
ffffffff8f590de8
[64977.308574] R10: 0000000000000001 R11: 0000000000000001 R12:
ffff8cf67c70f398
[64977.308574] R13: 0000000000000000 R14: ffff8cf67c70f208 R15:
ffff8ceb8123c000
[64977.308576] FS:  00007f5f51379640(0000) GS:ffff8d0a3ed80000(0000)
knlGS:0000000000000000
[64977.308577] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[64977.308578] CR2: 0000000000000000 CR3: 000000023b842000 CR4:
0000000000750ee0
[64977.308579] PKRU: 55555554


[112221.564394] usb 10-4: USB disconnect, device number 8
[112222.544520] BUG: kernel NULL pointer dereference, address: 000000000000=
0000
[112222.544524] #PF: supervisor read access in kernel mode
[112222.544525] #PF: error_code(0x0000) - not-present page
[112222.544526] PGD 0 P4D 0
[112222.544528] Oops: 0000 [#1] SMP NOPTI
[112222.544530] CPU: 9 PID: 9584 Comm: VideoCapture Not tainted
5.19.10-xanmod1-x64v2 #0~20220920.git017c598
[112222.544533] Hardware name: Gigabyte Technology Co., Ltd. B550 VISION D/=
B550
VISION D, BIOS F15d 07/20/2022
[112222.544533] RIP: 0010:usb_ifnum_to_if+0x34/0x60
[112222.544538] Code: 74 33 0f b6 4a 04 84 c9 74 33 83 e9 01 48 8d 82 98 00=
 00
00 48 8d bc ca a0 00 00 00 eb 09 48 83 c0 08 48 39 f8 74 16 48 8b 10 <48> 8=
b 0a
0f b6 49 02 39 f1 75 e9 48 89 d0 c3 cc cc cc cc 31 d2 48
[112222.544540] RSP: 0018:ffffb3bb10eb7b70 EFLAGS: 00010206
[112222.544541] RAX: ffff91ccf8026898 RBX: ffff91ccc45b9800 RCX:
0000000000000005
[112222.544542] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff91ccf80268c8
[112222.544543] RBP: 0000000000000000 R08: 0000000080000000 R09:
ffffffffaff90de8
[112222.544544] R10: 0000000000000001 R11: 0000000000000001 R12:
ffff91ccdf4484f8
[112222.544544] R13: 0000000000000000 R14: ffff91ccdf448408 R15:
ffff91ccdef7e000
[112222.544545] FS:  00007f8f9efae640(0000) GS:ffff91eb7ec40000(0000)
knlGS:0000000000000000
[112222.544546] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[112222.544547] CR2: 0000000000000000 CR3: 0000000110eb8000 CR4:
0000000000750ee0
[112222.544548] PKRU: 55555554
[112222.544549] Call Trace:
[112222.544550]  <TASK>
[112222.544551]  usb_hcd_alloc_bandwidth+0x241/0x360
[112222.544555]  usb_set_interface+0x11d/0x340
[112222.544558]  uvc_video_start_transfer+0x17b/0x4b0 [uvcvideo]
[112222.544563]  uvc_video_start_streaming+0x6f/0xc0 [uvcvideo]
[112222.544566]  uvc_start_streaming+0x25/0xe0 [uvcvideo]
[112222.544570]  vb2_start_streaming+0x7f/0x120 [videobuf2_common]
[112222.544573]  vb2_core_streamon+0x53/0xb0 [videobuf2_common]
[112222.544575]  uvc_queue_streamon+0x22/0x40 [uvcvideo]
[112222.544578]  uvc_ioctl_streamon+0x33/0x50 [uvcvideo]
[112222.544581]  __video_do_ioctl+0x197/0x3e0 [videodev]
[112222.544588]  ? __do_sys_clone3+0xc2/0x100
[112222.544590]  video_usercopy+0x2b3/0x670 [videodev]
[112222.544596]  ? v4l_print_control+0x20/0x20 [videodev]
[112222.544600]  ? sigprocmask+0xa0/0xd0
[112222.544602]  ? sigprocmask+0xa0/0xd0
[112222.544602]  ? exit_to_user_mode_prepare+0x2b/0x130
[112222.544605]  ? syscall_exit_to_user_mode+0x22/0x50
[112222.544607]  ? do_syscall_64+0x67/0x80
[112222.544609]  v4l2_ioctl+0x44/0x50 [videodev]
[112222.544613]  __x64_sys_ioctl+0x8b/0xc0
[112222.544616]  do_syscall_64+0x5b/0x80
[112222.544618]  ? syscall_exit_to_user_mode+0x22/0x50
[112222.544619]  ? exit_to_user_mode_prepare+0x2b/0x130
[112222.544620]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[112222.544622] RIP: 0033:0x7f8fdc256aff
[112222.544624] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00=
 00
00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 8=
9 c0
3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[112222.544625] RSP: 002b:00007f8f9efad320 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[112222.544626] RAX: ffffffffffffffda RBX: 00007f8f9efad3a0 RCX:
00007f8fdc256aff
[112222.544627] RDX: 00007f8f9efad3c0 RSI: 0000000040045612 RDI:
000000000000003b
[112222.544628] RBP: 00007f8f9efad630 R08: 00007f8f800c7640 R09:
00007f8f9efad11f
[112222.544629] R10: 0000000000000008 R11: 0000000000000246 R12:
00007f8f9efad3c0
[112222.544629] R13: 00007f8f267c8390 R14: 00007f8f267c8000 R15:
0000000000000000
[112222.544631]  </TASK>
[112222.544631] Modules linked in: xt_CHECKSUM xt_MASQUERADE xt_conntrack
ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink bridge stp l=
lc
overlay nvme_fabrics binfmt_misc nls_iso8859_1 snd_hda_codec_hdmi sch_fq_co=
del
intel_rapl_msr snd_hda_intel iwlmvm uvcvideo intel_rapl_common
videobuf2_vmalloc mac80211 snd_intel_dspcfg libarc4 videobuf2_memops
snd_usb_audio snd_intel_sdw_acpi videobuf2_v4l2 edac_mce_amd snd_hda_codec
nct6775_core snd_usbmidi_lib btusb videobuf2_common btrtl snd_rawmidi
snd_hda_core hwmon_vid videodev btbcm snd_seq_device snd_hwdep iwlwifi btin=
tel
kvm_amd snd_pcm btmtk vfio_pci joydev input_leds mc iwlmei kvm bluetooth
cfg80211 snd_timer vfio_pci_core ucsi_ccg snd typec_ucsi mei ccp ecdh_gener=
ic
typec soundcore serio_raw gigabyte_wmi ecc k10temp rapl wmi_bmof mac_hid
vfio_virqfd irqbypass cuse lp parport msr bfq ramoops reed_solomon pstore_b=
lk
pstore_zone efi_pstore ip_tables x_tables
[112222.544663]  autofs4 btrfs blake2b_generic dm_crypt raid10 raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq
libcrc32c raid1 raid0 multipath linear uas usb_storage hid_generic usbhid
amdgpu hid iommu_v2 gpu_sched drm_ttm_helper ttm drm_display_helper cec rc_=
core
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops crct10dif_pclm=
ul
crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd igb cryptd
i2c_nvidia_gpu dca psmouse drm i2c_piix4 i2c_ccgx_ucsi nvme i2c_algo_bit
thunderbolt ahci xhci_pci nvme_core libahci xhci_pci_renesas wmi gpio_amdpt
[112222.544683] CR2: 0000000000000000
[112222.544684] ---[ end trace 0000000000000000 ]---
[112222.711095] RIP: 0010:usb_ifnum_to_if+0x34/0x60
[112222.711101] Code: 74 33 0f b6 4a 04 84 c9 74 33 83 e9 01 48 8d 82 98 00=
 00
00 48 8d bc ca a0 00 00 00 eb 09 48 83 c0 08 48 39 f8 74 16 48 8b 10 <48> 8=
b 0a
0f b6 49 02 39 f1 75 e9 48 89 d0 c3 cc cc cc cc 31 d2 48
[112222.711103] RSP: 0018:ffffb3bb10eb7b70 EFLAGS: 00010206
[112222.711104] RAX: ffff91ccf8026898 RBX: ffff91ccc45b9800 RCX:
0000000000000005
[112222.711105] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff91ccf80268c8
[112222.711106] RBP: 0000000000000000 R08: 0000000080000000 R09:
ffffffffaff90de8
[112222.711106] R10: 0000000000000001 R11: 0000000000000001 R12:
ffff91ccdf4484f8
[112222.711107] R13: 0000000000000000 R14: ffff91ccdf448408 R15:
ffff91ccdef7e000
[112222.711108] FS:  00007f8f9efae640(0000) GS:ffff91eb7ec40000(0000)
knlGS:0000000000000000
[112222.711109] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[112222.711109] CR2: 0000000000000000 CR3: 0000000110eb8000 CR4:
0000000000750ee0
[112222.711110] PKRU: 55555554

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
