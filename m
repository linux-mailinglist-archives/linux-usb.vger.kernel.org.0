Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3942790A46
	for <lists+linux-usb@lfdr.de>; Sun,  3 Sep 2023 01:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbjIBXgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Sep 2023 19:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjIBXgX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Sep 2023 19:36:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F298511A
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 16:36:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 94FC5B80906
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 23:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CA02C433C8
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693697777;
        bh=v6oEoWpWQsjo+8rp0eZia2+P+EYeNTy3flZBnsqK58I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=d/+C4WkJNXZ5lKMTeW+CKVkPfasS9KodB9fPx2nLjQmaWDHR4Tbt0NWkyPnznK9pk
         pG/BYDvxaC5FFPgKSFTcmAqGdnm70JfB2okl65f+8xNg+u/dUkZIsHwe0McBQrM689
         TSRgI+eVX8AQl/aBiuIexVYDqXAt0MieCZCbcicgBKMfC2/kZRNAPj8WKFLAzDWEJm
         kHcizalPoiKh8pajNb5rE46283pY1w1XeG4Tz3Fa2ZXJ1ETCgP1YJVq3IaCt4kzJ3r
         zfe9BhzEWrK6sQz+hTXvKzu3RQhtdDQptlp/EsSbKc1bRn3WCNebdcoBtJGnOAQv7K
         I4v2O2In17sKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0E81EC4332E; Sat,  2 Sep 2023 23:36:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] [BUG] Alauda driver causes oops when inserted with card
 in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Sat, 02 Sep 2023 23:36:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pawlick3r@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217862-208809-lVYBCtk9pG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217862-208809@https.bugzilla.kernel.org/>
References: <bug-217862-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217862

--- Comment #3 from pawlick3r@proton.me ---
(In reply to Alan Stern from comment #2)
> Please try this again after applying the commit in
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/
> ?id=3Da6ff6e7a9dd69364547751db0f626a10a6d628d2

The commit is included in Kernel 6.5 already, which my system is currently
running.=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/usb/storage/alauda.c?h=3Dv6.5

On previous versions of the kernel before this patch, the card reader repor=
ted
no media and generated an error about how the transfer buffer is on stack.
Chances are this broke 6 or so years ago when the kernel behavior was chang=
ed
to block drivers that did that behavior (see:
https://linux.kernel.narkive.com/YOK3Jf56/patch-v2-usb-core-warn-if-an-urb-=
s-transfer-buffer-is-on-stack)
but I might have to do some testing to see what Linux version in particular
broke it. Here is the error on Kernel 5.15 as an example on Ubuntu 22.04:

[   43.057770] usb 1-1: new full-speed USB device number 5 using xhci_hcd
[   43.221275] usb 1-1: New USB device found, idVendor=3D0584, idProduct=3D=
0008,
bcdDevice=3D 1.02
[   43.221284] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[   43.221288] usb 1-1: Product: USB SmartMedia Adapter
[   43.221291] usb 1-1: Manufacturer: YAMAICHI ELECTRONICS Co.,Ltd.
[   43.307610] usbcore: registered new interface driver usb-storage
[   43.310782] ums-alauda 1-1:1.0: USB Mass Storage device detected
[   43.315826] scsi host1: usb-storage 1-1:1.0
[   43.316038] usbcore: registered new interface driver ums-alauda
[   44.316803] scsi 1:0:0:0: Direct-Access     Fujifilm DPC-R1 (Alauda)  01=
02
PQ: 0 ANSI: 0 CCS
[   44.316936] scsi 1:0:0:1: Direct-Access     Fujifilm DPC-R1 (Alauda)  01=
02
PQ: 0 ANSI: 0 CCS
[   44.317379] ------------[ cut here ]------------
[   44.317381] transfer buffer is on stack
[   44.317400] sd 1:0:0:0: Attached scsi generic sg0 type 0
[   44.317404] WARNING: CPU: 0 PID: 3177 at drivers/usb/core/hcd.c:1498
usb_hcd_map_urb_for_dma+0x4a9/0x4f0
[   44.317421] Modules linked in: ums_alauda usb_storage ccm rfcomm cmac
algif_hash algif_skcipher af_alg bnep snd_soc_skl snd_soc_hdac_hda
snd_hda_ext_core snd_soc_sst_ipc snd_hda_codec_hdmi snd_soc_sst_dsp
snd_soc_acpi_intel_match snd_ctl_led snd_hda_codec_conexant snd_soc_acpi
snd_hda_codec_generic ledtrig_audio intel_rapl_msr snd_soc_core snd_compress
ac97_bus snd_pcm_dmaengine snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi
snd_hda_codec mei_hdcp snd_hda_core snd_hwdep snd_pcm uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 snd_seq_midi btusb btrtl
videobuf2_common btbcm btintel videodev snd_seq_midi_event mc intel_rapl_co=
mmon
intel_tcc_cooling snd_rawmidi x86_pkg_temp_thermal intel_powerclamp coretemp
binfmt_misc bluetooth kvm_intel kvm ecdh_generic ecc rapl snd_seq nls_iso88=
59_1
intel_cstate hp_wmi snd_seq_device sparse_keymap platform_profile iwlmvm
intel_wmi_thunderbolt snd_timer joydev input_leds snd mac80211 serio_raw
wmi_bmof libarc4 iwlwifi ee1004 soundcore
[   44.317549]  cfg80211 mei_me intel_pch_thermal intel_xhci_usb_role_switch
mei hp_accel mac_hid lis3lv02d wireless_hotkey tpm_infineon acpi_pad
sch_fq_codel msr parport_pc ppdev lp ramoops parport reed_solomon pstore_blk
pstore_zone efi_pstore ip_tables x_tables autofs4 i915 i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops rtsx_pci_sdmmc=
 cec
crct10dif_pclmul crc32_pclmul rc_core i2c_i801 nvme ghash_clmulni_intel
aesni_intel crypto_simd cryptd psmouse e1000e i2c_smbus drm nvme_core xhci_=
pci
xhci_pci_renesas rtsx_pci ahci intel_lpss_pci intel_lpss libahci idma64 wmi
video pinctrl_sunrisepoint
[   44.317637] CPU: 0 PID: 3177 Comm: usb-storage Not tainted 5.15.0-82-gen=
eric
#91-Ubuntu
[   44.317643] Hardware name: HP HP EliteBook 840 G3/8079, BIOS N75 Ver. 01=
.57
07/28/2022
[   44.317646] RIP: 0010:usb_hcd_map_urb_for_dma+0x4a9/0x4f0
[   44.317654] Code: ff 4c 89 f2 48 c7 c7 00 e5 84 87 48 89 c6 e8 8f 60 37 =
00
0f 0b eb c1 48 c7 c7 25 3b 8a 87 c6 05 fb 7b 85 01 01 e8 78 60 37 00 <0f> 0=
b 41
be f5 ff ff ff 41 8b 54 24 5c e9 3d fc ff ff 0f 0b 41 be
[   44.317658] RSP: 0018:ffffa3e3410a3bc0 EFLAGS: 00010282
[   44.317663] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000027
[   44.317667] RDX: ffff910623820588 RSI: 0000000000000001 RDI:
ffff910623820580
[   44.317670] RBP: ffffa3e3410a3bf8 R08: 0000000000000003 R09:
fffffffffffd1a70
[   44.317673] R10: 000000000000001d R11: 0000000000000001 R12:
ffff91040aec6540
[   44.317676] R13: ffff910400ca0000 R14: 0000000000000000 R15:
0000000000000c00
[   44.317680] FS:  0000000000000000(0000) GS:ffff910623800000(0000)
knlGS:0000000000000000
[   44.317684] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   44.317688] CR2: 00007fd828fc8ae0 CR3: 0000000043410006 CR4:
00000000003706f0
[   44.317692] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   44.317695] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   44.317698] Call Trace:
[   44.317700]  <TASK>
[   44.317710]  xhci_map_urb_for_dma+0x149/0x170
[   44.317717]  usb_hcd_submit_urb+0x81/0x300
[   44.317724]  usb_submit_urb+0x254/0x6d0
[   44.317734]  usb_stor_msg_common+0xa3/0x150 [usb_storage]
[   44.317747]  usb_stor_ctrl_transfer+0xa0/0xd0 [usb_storage]
[   44.317757]  alauda_check_media+0x68/0x190 [ums_alauda]
[   44.317765]  alauda_transport+0x119/0x36c [ums_alauda]
[   44.317771]  ? schedule+0x69/0x110
[   44.317783]  usb_stor_invoke_transport+0x3b/0x550 [usb_storage]
[   44.317793]  ? __wait_for_common+0xf7/0x150
[   44.317798]  ? usleep_range_state+0x90/0x90
[   44.317806]  usb_stor_transparent_scsi_command+0xe/0x20 [usb_storage]
[   44.317812]  usb_stor_control_thread+0x195/0x290 [usb_storage]
[   44.317819]  ? storage_probe+0xe0/0xe0 [usb_storage]
[   44.317826]  kthread+0x127/0x150
[   44.317832]  ? set_kthread_struct+0x50/0x50
[   44.317837]  ret_from_fork+0x1f/0x30
[   44.317845]  </TASK>
[   44.317847] ---[ end trace 09f7f04fe1319ab9 ]---
[   44.317943] sd 1:0:0:0: [sda] Media removed, stopped polling
[   44.317966] sd 1:0:0:1: [sdb] Media removed, stopped polling
[   44.318106] sd 1:0:0:1: Attached scsi generic sg1 type 0
[   44.322084] sd 1:0:0:0: [sda] Attached SCSI removable disk
[   44.322208] sd 1:0:0:1: [sdb] Attached SCSI removable disk

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
