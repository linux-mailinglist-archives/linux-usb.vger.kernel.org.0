Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF0CE64CC21
	for <lists+linux-usb@lfdr.de>; Wed, 14 Dec 2022 15:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238316AbiLNO0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Dec 2022 09:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238488AbiLNO0Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Dec 2022 09:26:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C302035F
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 06:26:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 24256B818DC
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 14:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD5FAC433D2
        for <linux-usb@vger.kernel.org>; Wed, 14 Dec 2022 14:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671027971;
        bh=rjzAu1NhN7JM9oeonZYcP0C0VUNyUy8uWWRE1tArpu8=;
        h=From:To:Subject:Date:From;
        b=kr2Im9GtO5gitj7bDqTRQy6sgBFvu+afIqKa8kcvrxLiUvj4cmpPvroJx1+aPj1Cf
         jlS9IShDIxZBi6AGQ2zq1wZITSVM+GN8dSPBvrIwtptw/3Os9xrNhQtyBZ7nx9QBHl
         Vzmm5feQW/3xnN8saL2CgKjD/xPiN1XnEz495jVorGeUwQ+DGwE5xepLNh0NdYYCs5
         x7ReFBcUlGlriRP5+1FpOvDJUviG3cSxCb6raHLj9u+66iJrGkwF8mA9DCQNB1mM9L
         lw9KgiwZlp1G8+q9l9cCGXo+BO42EG8/8UVXnQ0NM/K5QdGyJxyrcMfe0N7fIE0/Bh
         7S6XbtBRjkVbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 82422C43141; Wed, 14 Dec 2022 14:26:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216810] New: uvc_video: 0010:uvc_video_decode_meta+0x29a/0x2b0
 [uvcvideo]
Date:   Wed, 14 Dec 2022 14:26:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216810-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216810

            Bug ID: 216810
           Summary: uvc_video: 0010:uvc_video_decode_meta+0x29a/0x2b0
                    [uvcvideo]
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.0
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

Hi Kernel Team,

I notice this issue today with latest kernel version: 6.1.0 vanilla.

[ 2504.610289] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2514.857461] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2514.967938] ------------[ cut here ]------------
[ 2514.967944] memcpy: detected field-spanning write (size 12) of single fi=
eld
"&meta->length" at drivers/media/usb/uvc/uvc_video.c:1355 (size 1)
[ 2514.967969] WARNING: CPU: 4 PID: 0 at drivers/media/usb/uvc/uvc_video.c:=
1355
uvc_video_decode_meta+0x29a/0x2b0 [uvcvideo]
[ 2514.967999] Modules linked in: uvcvideo veth nf_conntrack_netlink xfrm_u=
ser
xfrm_algo xt_addrtype br_netfilter ccm rfcomm xt_CHECKSUM xt_MASQUERADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp nft_compat nft_chain_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables libcrc32c nfnet=
link
bridge stp llc cmac algif_hash algif_skcipher af_alg bnep overlay binfmt_mi=
sc
snd_hda_codec_hdmi snd_sof_pci_intel_tgl snd_sof_intel_hda_common
soundwire_intel snd_hda_codec_realtek soundwire_generic_allocation
snd_hda_codec_generic soundwire_cadence ledtrig_audio snd_sof_intel_hda
snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_soc_hdac_hda
snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi soundwire_bus
snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_hda_intel
snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core intel_rapl_m=
sr
snd_hwdep intel_rapl_common intel_tcc_cooling x86_pkg_temp_thermal
intel_powerclamp snd_pcm iwlmvm coretemp snd_seq_midi
[ 2514.968089]  snd_seq_midi_event kvm_intel mac80211 i915 snd_rawmidi kvm
libarc4 crct10dif_pclmul drm_buddy ghash_clmulni_intel snd_seq btusb ttm
sha512_ssse3 btrtl snd_seq_device drm_display_helper aesni_intel btbcm
hid_sensor_accel_3d hid_sensor_gyro_3d snd_timer btintel crypto_simd
videobuf2_vmalloc cec hid_sensor_trigger cryptd tps6598x pmt_telemetry
industrialio_triggered_buffer btmtk videobuf2_memops mei_pxp mei_hdcp iwlwi=
fi
rc_core spi_nor rapl kfifo_buf typec pmt_class bluetooth nls_iso8859_1 snd
videobuf2_v4l2 hid_sensor_iio_common intel_cstate wmi_bmof drm_kms_helper
ecdh_generic industrialio videobuf2_common i2c_algo_bit ecc mtd ee1004
soundcore mei_me fb_sys_fops cfg80211 syscopyarea sysfillrect mei sysimgblt
intel_vsec igen6_edac serial_multi_instantiate ov13858 v4l2_fwnode v4l2_asy=
nc
videodev acpi_tad mc acpi_pad mac_hid sch_fq_codel ipmi_devintf ipmi_msghan=
dler
msr parport_pc ppdev lp parport ramoops reed_solomon drm pstore_blk pstore_=
zone
efi_pstore ip_tables x_tables
[ 2514.968196]  autofs4 hid_sensor_custom hid_sensor_hub hid_generic usbhid=
 hid
nvme crc32_pclmul spi_intel_pci intel_lpss_pci ahci thunderbolt igc i2c_i801
spi_intel intel_lpss xhci_pci nvme_core libahci i2c_smbus idma64
xhci_pci_renesas video wmi pinctrl_tigerlake [last unloaded: uvcvideo]
[ 2514.968229] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G        W=20=20=20=
=20=20=20=20=20=20
6.1.0-amd64-vanilla #3
[ 2514.968235] Hardware name: Intel(R) Client Systems NUC12WSKi7/NUC12WSBi7,
BIOS WSADL357.0073.2022.0302.1157 03/02/2022
[ 2514.968238] RIP: 0010:uvc_video_decode_meta+0x29a/0x2b0 [uvcvideo]
[ 2514.968256] Code: ff ff ff 48 8b 75 c8 b9 01 00 00 00 4c 89 45 b0 48 c7 =
c2
18 cb 1f c1 48 c7 c7 58 cb 1f c1 c6 05 84 14 01 00 01 e8 cb 96 e4 ee <0f> 0=
b 4c
8b 45 b0 e9 e3 fe ff ff 66 66 2e 0f 1f 84 00 00 00 00 00
[ 2514.968260] RSP: 0018:ffffb031c02ccd90 EFLAGS: 00010246
[ 2514.968271] RAX: 0000000000000000 RBX: ffff9c4dbe4b0400 RCX:
0000000000000000
[ 2514.968274] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[ 2514.968276] RBP: ffffb031c02ccde8 R08: 0000000000000000 R09:
0000000000000000
[ 2514.968278] R10: 0000000000000000 R11: 0000000000000000 R12:
ffffb031c8100000
[ 2514.968281] R13: 000000000000000c R14: ffff9c4d549c8000 R15:
ffff9c4d80198000
[ 2514.968283] FS:  0000000000000000(0000) GS:ffff9c50c7700000(0000)
knlGS:0000000000000000
[ 2514.968286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2514.968289] CR2: 0000562523d26450 CR3: 0000000113762004 CR4:
0000000000770ee0
[ 2514.968293] PKRU: 55555554
[ 2514.968295] Call Trace:
[ 2514.968298]  <IRQ>
[ 2514.968301]  ? uvc_video_decode_start+0x5d7/0x770 [uvcvideo]
[ 2514.968320]  uvc_video_decode_bulk+0xe4/0x280 [uvcvideo]
[ 2514.968335]  ? xhci_td_cleanup.isra.0+0x10e/0x160
[ 2514.968345]  uvc_video_complete+0xe4/0x1c0 [uvcvideo]
[ 2514.968360]  __usb_hcd_giveback_urb+0xa6/0x130
[ 2514.968369]  usb_giveback_urb_bh+0xa8/0x140
[ 2514.968376]  tasklet_action_common.constprop.0+0xd2/0x100
[ 2514.968384]  tasklet_action+0x22/0x30
[ 2514.968388]  __do_softirq+0xd6/0x346
[ 2514.968394]  ? handle_irq_event+0x52/0x80
[ 2514.968403]  ? handle_edge_irq+0xda/0x250
[ 2514.968408]  __irq_exit_rcu+0xa2/0xd0
[ 2514.968412]  irq_exit_rcu+0xe/0x20
[ 2514.968416]  common_interrupt+0xa4/0xb0
[ 2514.968422]  </IRQ>
[ 2514.968423]  <TASK>
[ 2514.968425]  asm_common_interrupt+0x27/0x40
[ 2514.968433] RIP: 0010:cpuidle_enter_state+0xde/0x6f0
[ 2514.968442] Code: 6b 2d 50 e8 84 dd 5f ff 8b 53 04 49 89 c7 0f 1f 44 00 =
00
31 ff e8 42 fd 5e ff 80 7d d0 00 0f 85 eb 00 00 00 fb 0f 1f 44 00 00 <45> 8=
5 f6
0f 88 12 02 00 00 4d 63 ee 49 83 fd 09 0f 87 c7 04 00 00
[ 2514.968445] RSP: 0018:ffffb031c019be38 EFLAGS: 00000246
[ 2514.968449] RAX: 0000000000000000 RBX: ffffd031bfb00c00 RCX:
0000000000000000
[ 2514.968451] RDX: 0000000000000004 RSI: 0000000000000000 RDI:
0000000000000000
[ 2514.968453] RBP: ffffb031c019be88 R08: 0000000000000000 R09:
0000000000000000
[ 2514.968455] R10: 0000000000000000 R11: 0000000000000000 R12:
ffffffffb0ebc560
[ 2514.968457] R13: 0000000000000001 R14: 0000000000000001 R15:
000002498fc42f9c
[ 2514.968463]  ? cpuidle_enter_state+0xce/0x6f0
[ 2514.968471]  cpuidle_enter+0x2e/0x50
[ 2514.968477]  do_idle+0x216/0x2a0
[ 2514.968482]  cpu_startup_entry+0x1d/0x20
[ 2514.968487]  start_secondary+0x122/0x160
[ 2514.968496]  secondary_startup_64_no_verify+0xe5/0xeb
[ 2514.968506]  </TASK>
[ 2514.968508] ---[ end trace 0000000000000000 ]---
[ 2515.109208] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2515.312109] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2515.613012] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2515.701035] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2515.814113] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2641.135066] uvcvideo 4-3:1.1: Non-zero status (-71) in video completion
handler.
[ 2641.154228] uvcvideo 4-3:1.4: Non-zero status (-71) in video completion
handler.
[ 2641.433401] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2641.483979] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2641.635312] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.088780] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.240022] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.290838] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.442048] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.492849] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.644173] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.694891] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.846380] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2642.897155] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2643.048379] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2643.098805] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).
[ 2646.251713] usb 4-3: Failed to query (GET_CUR) UVC control 1 on unit 3: =
-32
(exp. 1024).


lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    |__ Port 3: Dev 11, If 0, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 3: Dev 11, If 1, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 3: Dev 11, If 2, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 3: Dev 11, If 3, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 3: Dev 11, If 4, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 3: Dev 11, If 5, Class=3DHuman Interface Device, Driver=3Dusbh=
id,
5000M
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 480M
    |__ Port 10: Dev 2, If 0, Class=3DWireless, Driver=3Dbtusb, 12M
    |__ Port 10: Dev 2, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/3p, 20000M/x2
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/1p, 480M

dmesg | grep DMI
[    0.000000] DMI: Intel(R) Client Systems NUC12WSKi7/NUC12WSBi7, BIOS
WSADL357.0073.2022.0302.1157 03/02/2022

usb 4-3: Manufacturer: Intel(R) RealSense(TM) Depth Camera 435

lsusb -s 4:11 -v | grep USB
  bcdUSB               3.20
        wTerminalType      0x0101 USB Streaming
        wTerminalType      0x0101 USB Streaming
        wTerminalType      0x0101 USB Streaming
  SuperSpeed USB Device Capability:
  USB 2.0 Extension Device Capability:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
