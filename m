Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01AB4790495
	for <lists+linux-usb@lfdr.de>; Sat,  2 Sep 2023 03:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351461AbjIBBFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 21:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240134AbjIBBFf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 21:05:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F1C91
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 18:05:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D4EF5B825C2
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 01:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D395BC433C8
        for <linux-usb@vger.kernel.org>; Sat,  2 Sep 2023 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693616727;
        bh=RBmuNHAy8DiqcnGFncLzZHGQ7pZmZPRF5QdfIK65+Gg=;
        h=From:To:Subject:Date:From;
        b=coFCToJjRlSmbw9wjbrQ95L1vONrTLjd8nfvkq/XmWGpzKCznC3Nfe9F/2fZosUvK
         9P39QwHTgLxvSgYYNi9Pu/cV33PyV2B/VUpDL0QzFsvve5Pa180rwP3vHD3mzFZ43J
         ZJn6I078T2FoMpiUYoI+JpUET5jCqdXa1Uh1TadsyL8D1iDsl4AOqLbSYsgWr+GnLc
         XzUoe0EmyaehA67S0/3Gc0TqqAvZLEu2os3Lk+bsmK1j/O3j73vMy/giJ0vQvWBM2e
         Kgido+V6TOX0xd6TPL9idKtr7tvOj9w6I6qsKhttmvwrgHUsy7Q5jeIr8NzqugXUTT
         bnFR1cS7I/0ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B9136C4332E; Sat,  2 Sep 2023 01:05:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217862] New: [BUG] Alauda driver causes oops when inserted with
 card in with transfer buffer is on stack, throws errors if card is inserted
 afterwards.
Date:   Sat, 02 Sep 2023 01:05:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217862-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 217862
           Summary: [BUG] Alauda driver causes oops when inserted with
                    card in with transfer buffer is on stack, throws
                    errors if card is inserted afterwards.
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pawlick3r@proton.me
        Regression: No

Created attachment 305021
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305021&action=3Dedit
full oops error

When using the Fujifilm DPC-R1 SmartMedia/XD card reader on OpenSUSE Tumble=
weed
with kernel "Linux 6.5.0-1.gbf01b3b-vanilla #1 SMP PREEMPT_DYNAMIC Mon Aug =
28
10:16:25 UTC 2023 (bf01b3b) x86_64 x86_64 x86_64 GNU/Linux" and the card is
inserted into the reader when the reader is connected, the driver generates=
 an
oops error in dmesg:

[  160.158491] usbcore: registered new interface driver ums-alauda
[  161.176864] scsi 0:0:0:0: Direct-Access     Fujifilm DPC-R1 (Alauda)  01=
02
PQ: 0 ANSI: 0 CCS
[  161.176978] scsi 0:0:0:1: Direct-Access     Fujifilm DPC-R1 (Alauda)  01=
02
PQ: 0 ANSI: 0 CCS
[  161.177570] sd 0:0:0:0: Attached scsi generic sg0 type 0
[  161.178131] sd 0:0:0:0: [sda] Media removed, stopped polling
[  161.178253] sd 0:0:0:1: Attached scsi generic sg1 type 0
[  161.178934] sd 0:0:0:0: [sda] Attached SCSI removable disk
[  192.930444] usb 1-1: reset full-speed USB device number 5 using xhci_hcd
[  193.076866] sd 0:0:0:1: [sdb] 16000 512-byte logical blocks: (8.19 MB/7.=
81
MiB)
[  193.076974] sd 0:0:0:1: [sdb] Test WP failed, assume Write Enabled
[  193.077051] sd 0:0:0:1: [sdb] Asking for cache data failed
[  193.077067] sd 0:0:0:1: [sdb] Assuming drive cache: write through
[  193.081354] ------------[ cut here ]------------
[  193.081366] transfer buffer is on stack
[  193.081554] WARNING: CPU: 2 PID: 2349 at drivers/usb/core/hcd.c:1499
usb_hcd_map_urb_for_dma+0x316/0x490 [usbcore]
[  193.081801] Modules linked in: ums_alauda uas usb_storage rfcomm
snd_seq_dummy snd_hrtimer snd_seq snd_seq_device ccm cmac af_packet algif_h=
ash
algif_skcipher af_alg bnep btusb btrtl btbcm btintel btmtk uvcvideo bluetoo=
th
videobuf2_vmalloc uvc videobuf2_memops videobuf2_v4l2 videodev videobuf2_co=
mmon
mc qrtr ecdh_generic snd_sof_pci_intel_skl snd_sof_intel_hda_common
soundwire_intel snd_sof_intel_hda_mlink soundwire_cadence snd_sof_intel_hda
snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils
soundwire_generic_allocation soundwire_bus ath10k_pci snd_hda_codec_hdmi
snd_soc_avs ath10k_core snd_soc_hda_codec snd_soc_skl snd_soc_hdac_hda ath
snd_hda_ext_core snd_soc_sst_ipc snd_ctl_led snd_soc_sst_dsp
snd_soc_acpi_intel_match snd_soc_acpi mac80211 snd_hda_codec_realtek
snd_soc_core snd_hda_codec_generic intel_tcc_cooling x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel nls_iso8859_1 snd_compress
snd_pcm_dmaengine snd_hda_intel nls_cp437 dell_laptop snd_intel_dspcfg iTCO=
_wdt
vfat intel_pmc_bxt snd_intel_sdw_acpi
[  193.082146]  libarc4 kvm mei_hdcp mei_pxp intel_rapl_msr mei_wdt
iTCO_vendor_support fat dell_smm_hwmon snd_hda_codec cfg80211 snd_hda_core
snd_hwdep dell_wmi processor_thermal_device_pci_legacy irqbypass snd_pcm
dell_smbios processor_thermal_device dcdbas snd_timer processor_thermal_rfim
processor_thermal_mbox ledtrig_audio dell_wmi_descriptor wmi_bmof pcspkr
intel_wmi_thunderbolt snd processor_thermal_rapl rfkill intel_rapl_common
mei_me i2c_i801 soundcore intel_lpss_pci i2c_smbus intel_soc_dts_iosf mei
intel_lpss thermal intel_xhci_usb_role_switch intel_pch_thermal idma64
tiny_power_button intel_vbtn soc_button_array int3403_thermal
int340x_thermal_zone int3400_thermal acpi_thermal_rel intel_pmc_core intel_=
hid
button sparse_keymap ac acpi_pad joydev fuse efi_pstore configfs dmi_sysfs
ip_tables x_tables xfs libcrc32c hid_multitouch hid_generic usbhid i915
crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic
gf128mul i2c_algo_bit drm_buddy ghash_clmulni_intel ttm rtsx_pci_sdmmc xhci=
_pci
[  193.082512]  sha512_ssse3 xhci_pci_renesas xhci_hcd mmc_core
drm_display_helper aesni_intel nvme cec ucsi_acpi typec_ucsi crypto_simd
usbcore nvme_core cryptd rtsx_pci roles rc_core typec battery i2c_hid_acpi
i2c_hid video wmi pinctrl_sunrisepoint serio_raw sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua msr efivarfs
[  193.082674] CPU: 2 PID: 2349 Comm: usb-storage Not tainted
6.5.0-1.gbf01b3b-vanilla #1 d7537ea507f01ffba47b56f5e49ba886098a8e7a
[  193.082698] Hardware name: Dell Inc. XPS 13 9360/0T9VPC, BIOS 2.20.0
03/20/2022
[  193.082708] RIP: 0010:usb_hcd_map_urb_for_dma+0x316/0x490 [usbcore]
[  193.082942] Code: 37 80 3d 5c d9 01 00 00 b8 f5 ff ff ff 0f 85 e1 fd ff =
ff
48 c7 c7 ba ae 77 c0 89 44 24 04 c6 05 3f d9 01 00 01 e8 5a 40 79 f1 <0f> 0=
b 8b
53 5c 8b 44 24 04 e9 bc fd ff ff 4c 89 f7 4c 8b 7d 08 45
[  193.082955] RSP: 0018:ffffbba580e17b18 EFLAGS: 00010286
[  193.082973] RAX: 0000000000000000 RBX: ffff916d1a7d4480 RCX:
0000000000000027
[  193.082985] RDX: ffff916e365274c8 RSI: 0000000000000001 RDI:
ffff916e365274c0
[  193.082995] RBP: ffff916cc6e9b000 R08: 0000000000000000 R09:
ffffbba580e179c0
[  193.083005] R10: 0000000000000003 R11: ffffffffb3d58568 R12:
0000000000000001
[  193.083037] R13: 0000000000000c00 R14: ffffbba580e17cae R15:
0000000000000000
[  193.083049] FS:  0000000000000000(0000) GS:ffff916e36500000(0000)
knlGS:0000000000000000
[  193.083063] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  193.083073] CR2: 00007f0acd77d000 CR3: 0000000256236006 CR4:
00000000003706e0
[  193.083087] Call Trace:
[  193.083100]  <TASK>
[  193.083108]  ? usb_hcd_map_urb_for_dma+0x316/0x490 [usbcore
6eded20889f0aac7c62d26a64446b38b4fd378cd]
[  193.083357]  ? __warn+0x81/0x130
[  193.083385]  ? usb_hcd_map_urb_for_dma+0x316/0x490 [usbcore
6eded20889f0aac7c62d26a64446b38b4fd378cd]
[  193.083614]  ? report_bug+0x171/0x1a0
[  193.083646]  ? handle_bug+0x3c/0x80
[  193.083666]  ? exc_invalid_op+0x17/0x70
[  193.083685]  ? asm_exc_invalid_op+0x1a/0x20
[  193.083720]  ? usb_hcd_map_urb_for_dma+0x316/0x490 [usbcore
6eded20889f0aac7c62d26a64446b38b4fd378cd]
[  193.083951]  ? usb_hcd_map_urb_for_dma+0x316/0x490 [usbcore
6eded20889f0aac7c62d26a64446b38b4fd378cd]
[  193.084190]  usb_hcd_submit_urb+0xa0/0xbc0 [usbcore
6eded20889f0aac7c62d26a64446b38b4fd378cd]
[  193.084432]  ? __schedule+0x3e6/0x14b0
[  193.084455]  usb_stor_msg_common+0x99/0x140 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.084522]  usb_stor_bulk_transfer_buf+0x55/0xf0 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.084590]  alauda_ensure_map_for_zone+0x1ac/0x390 [ums_alauda
1de42de49fcaa66d1135d9a7443ffc81a6348f1d]
[  193.084640]  alauda_transport+0x383/0xe40 [ums_alauda
1de42de49fcaa66d1135d9a7443ffc81a6348f1d]
[  193.084680]  ? __schedule+0x3e6/0x14b0
[  193.084699]  ? try_to_wake_up+0x23b/0x5f0
[  193.084727]  ? __pfx_usb_stor_control_thread+0x10/0x10 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.084782]  usb_stor_invoke_transport+0x3e/0x4d0 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.084836]  ? schedule_timeout+0x147/0x160
[  193.084855]  ? __blk_mq_end_request+0x46/0xf0
[  193.084876]  ? scsi_end_request+0x102/0x1c0
[  193.084934]  ? wait_for_completion_interruptible+0x194/0x1b0
[  193.084956]  usb_stor_control_thread+0x1d9/0x2a0 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.085024]  kthread+0xe5/0x120
[  193.085046]  ? __pfx_kthread+0x10/0x10
[  193.085064]  ret_from_fork+0x31/0x50
[  193.085087]  ? __pfx_kthread+0x10/0x10
[  193.085104]  ret_from_fork_asm+0x1b/0x30
[  193.085144]  </TASK>
[  193.085150] ---[ end trace 0000000000000000 ]---
[  193.085173] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[  193.085193] #PF: supervisor read access in kernel mode
[  193.085208] #PF: error_code(0x0000) - not-present page
[  193.085220] PGD 0 P4D 0
[  193.085240] Oops: 0000 [#1] PREEMPT SMP PTI
[  193.085258] CPU: 2 PID: 2349 Comm: usb-storage Tainted: G        W=20=20=
=20=20=20=20=20=20=20
6.5.0-1.gbf01b3b-vanilla #1 d7537ea507f01ffba47b56f5e49ba886098a8e7a
[  193.085282] Hardware name: Dell Inc. XPS 13 9360/0T9VPC, BIOS 2.20.0
03/20/2022
[  193.085293] RIP: 0010:alauda_transport+0x3e8/0xe40 [ums_alauda]
[  193.085330] Code: 24 41 d3 e3 48 8b 92 98 00 00 00 44 89 5c 24 2c 48 8d =
14
52 48 c1 e2 04 48 03 90 f8 01 00 00 44 89 e0 48 8b 4a 20 48 8b 04 c1 <42> 0=
f b7
34 68 66 83 fe ff 0f 84 1c ff ff ff 44 8b 3c 24 44 8b 52
[  193.085350] RSP: 0018:ffffbba580e17cf8 EFLAGS: 00010282
[  193.085370] RAX: 0000000000000000 RBX: ffff916cc5c9e000 RCX:
ffff916cc50e0d90
[  193.085385] RDX: ffff916cfd6e5bb0 RSI: 000000000cbc2002 RDI:
0000000000000000
[  193.085400] RBP: 0000000000000008 R08: 0000000000000000 R09:
0000000000000000
[  193.085412] R10: 0000000000000003 R11: 0000000000001000 R12:
0000000000000000
[  193.085427] R13: 0000000000000000 R14: 0000000000001200 R15:
ffff916cc2dcf138
[  193.085441] FS:  0000000000000000(0000) GS:ffff916e36500000(0000)
knlGS:0000000000000000
[  193.085460] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  193.085475] CR2: 0000000000000000 CR3: 0000000256236006 CR4:
00000000003706e0
[  193.085491] Call Trace:
[  193.085504]  <TASK>
[  193.085517]  ? __die+0x23/0x70
[  193.085546]  ? page_fault_oops+0x14d/0x490
[  193.085571]  ? __schedule+0x3e6/0x14b0
[  193.085593]  ? exc_page_fault+0x71/0x160
[  193.085613]  ? asm_exc_page_fault+0x26/0x30
[  193.085652]  ? alauda_transport+0x3e8/0xe40 [ums_alauda
1de42de49fcaa66d1135d9a7443ffc81a6348f1d]
[  193.085697]  ? alauda_transport+0x383/0xe40 [ums_alauda
1de42de49fcaa66d1135d9a7443ffc81a6348f1d]
[  193.085749]  ? try_to_wake_up+0x23b/0x5f0
[  193.085783]  ? __pfx_usb_stor_control_thread+0x10/0x10 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.085843]  usb_stor_invoke_transport+0x3e/0x4d0 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.085904]  ? schedule_timeout+0x147/0x160
[  193.085929]  ? __blk_mq_end_request+0x46/0xf0
[  193.085953]  ? scsi_end_request+0x102/0x1c0
[  193.085979]  ? wait_for_completion_interruptible+0x194/0x1b0
[  193.086007]  usb_stor_control_thread+0x1d9/0x2a0 [usb_storage
27b51054c9ccd44d5b2bef47d5f1d95dd33359cc]
[  193.086071]  kthread+0xe5/0x120
[  193.086090]  ? __pfx_kthread+0x10/0x10
[  193.086110]  ret_from_fork+0x31/0x50
[  193.086130]  ? __pfx_kthread+0x10/0x10
[  193.086148]  ret_from_fork_asm+0x1b/0x30
[  193.086184]  </TASK>
[  193.086193] Modules linked in: ums_alauda uas usb_storage rfcomm
snd_seq_dummy snd_hrtimer snd_seq snd_seq_device ccm cmac af_packet algif_h=
ash
algif_skcipher af_alg bnep btusb btrtl btbcm btintel btmtk uvcvideo bluetoo=
th
videobuf2_vmalloc uvc videobuf2_memops videobuf2_v4l2 videodev videobuf2_co=
mmon
mc qrtr ecdh_generic snd_sof_pci_intel_skl snd_sof_intel_hda_common
soundwire_intel snd_sof_intel_hda_mlink soundwire_cadence snd_sof_intel_hda
snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils
soundwire_generic_allocation soundwire_bus ath10k_pci snd_hda_codec_hdmi
snd_soc_avs ath10k_core snd_soc_hda_codec snd_soc_skl snd_soc_hdac_hda ath
snd_hda_ext_core snd_soc_sst_ipc snd_ctl_led snd_soc_sst_dsp
snd_soc_acpi_intel_match snd_soc_acpi mac80211 snd_hda_codec_realtek
snd_soc_core snd_hda_codec_generic intel_tcc_cooling x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel nls_iso8859_1 snd_compress
snd_pcm_dmaengine snd_hda_intel nls_cp437 dell_laptop snd_intel_dspcfg iTCO=
_wdt
vfat intel_pmc_bxt snd_intel_sdw_acpi
[  193.086501]  libarc4 kvm mei_hdcp mei_pxp intel_rapl_msr mei_wdt
iTCO_vendor_support fat dell_smm_hwmon snd_hda_codec cfg80211 snd_hda_core
snd_hwdep dell_wmi processor_thermal_device_pci_legacy irqbypass snd_pcm
dell_smbios processor_thermal_device dcdbas snd_timer processor_thermal_rfim
processor_thermal_mbox ledtrig_audio dell_wmi_descriptor wmi_bmof pcspkr
intel_wmi_thunderbolt snd processor_thermal_rapl rfkill intel_rapl_common
mei_me i2c_i801 soundcore intel_lpss_pci i2c_smbus intel_soc_dts_iosf mei
intel_lpss thermal intel_xhci_usb_role_switch intel_pch_thermal idma64
tiny_power_button intel_vbtn soc_button_array int3403_thermal
int340x_thermal_zone int3400_thermal acpi_thermal_rel intel_pmc_core intel_=
hid
button sparse_keymap ac acpi_pad joydev fuse efi_pstore configfs dmi_sysfs
ip_tables x_tables xfs libcrc32c hid_multitouch hid_generic usbhid i915
crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_generic
gf128mul i2c_algo_bit drm_buddy ghash_clmulni_intel ttm rtsx_pci_sdmmc xhci=
_pci
[  193.086850]  sha512_ssse3 xhci_pci_renesas xhci_hcd mmc_core
drm_display_helper aesni_intel nvme cec ucsi_acpi typec_ucsi crypto_simd
usbcore nvme_core cryptd rtsx_pci roles rc_core typec battery i2c_hid_acpi
i2c_hid video wmi pinctrl_sunrisepoint serio_raw sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua msr efivarfs
[  193.087016] CR2: 0000000000000000
[  193.087030] ---[ end trace 0000000000000000 ]---
[  193.087041] RIP: 0010:alauda_transport+0x3e8/0xe40 [ums_alauda]
[  193.087080] Code: 24 41 d3 e3 48 8b 92 98 00 00 00 44 89 5c 24 2c 48 8d =
14
52 48 c1 e2 04 48 03 90 f8 01 00 00 44 89 e0 48 8b 4a 20 48 8b 04 c1 <42> 0=
f b7
34 68 66 83 fe ff 0f 84 1c ff ff ff 44 8b 3c 24 44 8b 52
[  193.087098] RSP: 0018:ffffbba580e17cf8 EFLAGS: 00010282
[  193.087116] RAX: 0000000000000000 RBX: ffff916cc5c9e000 RCX:
ffff916cc50e0d90
[  193.087130] RDX: ffff916cfd6e5bb0 RSI: 000000000cbc2002 RDI:
0000000000000000
[  193.087143] RBP: 0000000000000008 R08: 0000000000000000 R09:
0000000000000000
[  193.087155] R10: 0000000000000003 R11: 0000000000001000 R12:
0000000000000000
[  193.087167] R13: 0000000000000000 R14: 0000000000001200 R15:
ffff916cc2dcf138
[  193.087181] FS:  0000000000000000(0000) GS:ffff916e36500000(0000)
knlGS:0000000000000000
[  193.087197] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  193.087211] CR2: 0000000000000000 CR3: 0000000256236006 CR4:
00000000003706e0
[  193.087225] note: usb-storage[2349] exited with irqs disabled

After this error is created, the computer will no longer properly shut down=
 (it
will do nothing instead of rebooting after it gets to the end of the proces=
s)
and the power button has to be held, even if the cable is disconnected.

A different error happens if the reader is connected and the card is insert=
ed,
and this retries when the card cover is opened and closed (to essentially
connect and disconnect the card). In this case, the driver is unable to read
the partition table and generates media errors as it improperly guesses the
size of the 8mb card.

[   27.898925] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   27.901911] sd 0:0:0:1: [sdb] Attached SCSI removable disk
[   88.197519] sd 0:0:0:1: [sdb] Very big device. Trying to use READ
CAPACITY(16).
[   88.197583] sd 0:0:0:1: [sdb] Using 0xffffffff as device size
[   88.197589] sd 0:0:0:1: [sdb] 4294967296 512-byte logical blocks: (2.20
TB/2.00 TiB)
[   88.197660] sdb: detected capacity change from 0 to 4294967296
[   88.197727] sd 0:0:0:1: [sdb] tag#0 FAILED Result: hostbyte=3DDID_OK
driverbyte=3DDRIVER_OK cmd_age=3D0s
[   88.197731] sd 0:0:0:1: [sdb] tag#0 Sense Key : Illegal Request [current]
[   88.197734] sd 0:0:0:1: [sdb] tag#0 Add. Sense: Invalid command operation
code
[   88.197738] sd 0:0:0:1: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 0=
0 00
00 00 00 00 08 00 00
[   88.197739] critical target error, dev sdb, sector 0 op 0x0:(READ) flags=
 0x0
phys_seg 1 prio class 2
[   88.197747] Buffer I/O error on dev sdb, logical block 0, async page read
[   88.197770] sd 0:0:0:1: [sdb] tag#0 FAILED Result: hostbyte=3DDID_OK
driverbyte=3DDRIVER_OK cmd_age=3D0s
[   88.197773] sd 0:0:0:1: [sdb] tag#0 Sense Key : Illegal Request [current]
[   88.197775] sd 0:0:0:1: [sdb] tag#0 Add. Sense: Invalid command operation
code
[   88.197777] sd 0:0:0:1: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 0=
0 00
00 00 00 00 08 00 00
[   88.197779] critical target error, dev sdb, sector 0 op 0x0:(READ) flags=
 0x0
phys_seg 1 prio class 2
[   88.197783] Buffer I/O error on dev sdb, logical block 0, async page read
....
[   88.198057] critical target error, dev sdb, sector 24 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 2
[   88.198061] Buffer I/O error on dev sdb, logical block 3, async page read
[   88.198097]  sdb: unable to read partition table
[  121.418464] usb 1-1: reset full-speed USB device number 5 using xhci_hcd
[  152.128094] usb 1-1: reset full-speed USB device number 5 using xhci_hcd
[  152.274733] sdb: detected capacity change from 4294967296 to 0
[  152.340792] sd 0:0:0:1: [sdb] 16000 512-byte logical blocks: (8.19 MB/7.=
81
MiB)
[  152.340885] sdb: detected capacity change from 0 to 16000
[  152.341031] scsi_io_completion_action: 4 callbacks suppressed
[  152.341052] sd 0:0:0:1: [sdb] tag#0 FAILED Result: hostbyte=3DDID_OK
driverbyte=3DDRIVER_OK cmd_age=3D0s
[  152.341066] sd 0:0:0:1: [sdb] tag#0 Sense Key : Illegal Request [current]
[  152.341075] sd 0:0:0:1: [sdb] tag#0 Add. Sense: Invalid command operation
code
[  152.341083] sd 0:0:0:1: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 0=
0 00
00 00 00 00 08 00 00
[  152.341087] blk_print_req_error: 4 callbacks suppressed
[  152.341091] critical target error, dev sdb, sector 0 op 0x0:(READ) flags=
 0x0
phys_seg 1 prio class 2
[  152.341112] buffer_io_error: 3 callbacks suppressed
[  152.341115] Buffer I/O error on dev sdb, logical block 0, async page read
[  152.341254] sd 0:0:0:1: [sdb] tag#0 FAILED Result: hostbyte=3DDID_OK
driverbyte=3DDRIVER_OK cmd_age=3D0s
[  152.341268] sd 0:0:0:1: [sdb] tag#0 Sense Key : Illegal Request [current]
[  152.341277] sd 0:0:0:1: [sdb] tag#0 Add. Sense: Invalid command operation
code
[  152.341284] sd 0:0:0:1: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 0=
0 00
00 00 00 00 08 00 00
[  152.341289] critical target error, dev sdb, sector 0 op 0x0:(READ) flags=
 0x0
phys_seg 1 prio class 2
[  152.341308] Buffer I/O error on dev sdb, logical block 0, async page read
...
[  152.342144] sd 0:0:0:1: [sdb] tag#0 Add. Sense: Invalid command operation
code
[  152.342150] sd 0:0:0:1: [sdb] tag#0 CDB: Read(16) 88 00 00 00 00 00 00 0=
0 00
18 00 00 00 08 00 00
[  152.342154] critical target error, dev sdb, sector 24 op 0x0:(READ) flags
0x0 phys_seg 1 prio class 2
[  152.342164] Buffer I/O error on dev sdb, logical block 3, async page read
[  152.342268]  sdb: unable to read partition table

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
