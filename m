Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613D61A8BA0
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2020 21:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505298AbgDNT5Q convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 14 Apr 2020 15:57:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2505265AbgDNT4c (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Apr 2020 15:56:32 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 205841] Lenovo USB-C dock audio NULL pointer
Date:   Tue, 14 Apr 2020 19:56:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: serg@podtynnyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205841-208809-ErKBbAs3uv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205841-208809@https.bugzilla.kernel.org/>
References: <bug-205841-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=205841

Serg Podtynnyi (serg@podtynnyi.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |serg@podtynnyi.com

--- Comment #10 from Serg Podtynnyi (serg@podtynnyi.com) ---
The same on 5.6.4 on Dell XPS 7390 2 in 1 while connecting D6000 USB-c dock
station


```
[ 8101.565555] WARNING: CPU: 0 PID: 11422 at kernel/module.c:1158
module_put.part.0+0xc9/0xd0
[ 8101.565560] Modules linked in: rfcomm bnep xt_nat veth nf_conntrack_netlink
xt_addrtype joydev hid_multitouch btusb btrtl btbcm btintel bluetooth
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT ip6table_mangle ip6table_nat
iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
nf_tables ip6table_filter ip6_tables iptable_filter ip_tables bpfilter overlay
algif_aead mei_hdcp des_generic libdes md4 wmi_bmof dell_wmi
intel_wmi_thunderbolt dell_laptop dell_smbios dell_wmi_descriptor
snd_hda_codec_hdmi dcdbas dell_smm_hwmon snd_sof_pci snd_sof_intel_byt
snd_sof_intel_ipc snd_sof_intel_hda_common snd_sof_xtensa_dsp snd_sof
snd_sof_nocodec snd_soc_acpi_intel_match snd_hda_codec_realtek snd_soc_acpi
snd_hda_codec_generic snd_soc_core snd_compress snd_pcm_dmaengine ac97_bus
ledtrig_audio snd_hda_intel psmouse snd_intel_dspcfg typec_displayport
serio_raw snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore
i2c_i801 mei_me hid_sensor_magn_3d hid_sensor_rotation
[ 8101.565601]  mei hid_sensor_incl_3d hid_sensor_gyro_3d iwlmvm
hid_sensor_custom hid_sensor_als intel_lpss_pci iwlwifi intel_lpss idma64
cros_ec_ishtp virt_dma cros_ec thunderbolt processor_thermal_device
intel_soc_dts_iosf wmi battery i2c_hid int3403_thermal int340x_thermal_zone
soc_button_array intel_hid intel_pmc_core sparse_keymap int3400_thermal ac
acpi_thermal_rel pkcs8_key_parser atkbd libps2 i8042
[ 8101.565621] CPU: 0 PID: 11422 Comm: kworker/0:2 Tainted: G     U  W        
5.6.4-7937.native #1
[ 8101.565623] Hardware name: Dell Inc. XPS 13 7390 2-in-1/06CDVY, BIOS 1.3.1
03/02/2020
[ 8101.565629] Workqueue: events ucsi_handle_connector_change
[ 8101.565633] RIP: 0010:module_put.part.0+0xc9/0xd0
[ 8101.565636] Code: 24 48 85 c0 75 e3 65 ff 0d ac 15 df 46 75 8c e8 a3 b7 dd
ff eb 85 e8 84 b7 dd ff 5b 31 c0 41 5c 41 5d 5d 89 c2 89 c6 89 c7 c3 <0f> 0b e9
61 ff ff ff 48 85 ff 74 0d 55 48 89 e5 e8 22 ff ff ff 5d
[ 8101.565638] RSP: 0000:ffff96f303d63c78 EFLAGS: 00010297
[ 8101.565640] RAX: 0000000000000000 RBX: ffffffffc05a8140 RCX:
0000000000000000
[ 8101.565641] RDX: 00000000ffffffff RSI: 0000000000000000 RDI:
0000000000000000
[ 8101.565643] RBP: ffff96f303d63c90 R08: 0000000000000000 R09:
0000000000000000
[ 8101.565644] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff928b5ff59008
[ 8101.565645] R13: 0000000000000000 R14: 0000000000000001 R15:
ffff928d69dee2a8
[ 8101.565647] FS:  0000000000000000(0000) GS:ffff928e7f600000(0000)
knlGS:0000000000000000
[ 8101.565649] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8101.565650] CR2: 00007f5bbb9328a9 CR3: 00000002bfa60003 CR4:
0000000000760ef0
[ 8101.565652] PKRU: 55555554
[ 8101.565653] Call Trace:
[ 8101.565660]  module_put+0xe/0x20
[ 8101.565664]  typec_altmode_update_active+0x4c/0xf0
[ 8101.565669]  typec_remove+0x86/0x90
[ 8101.565674]  device_release_driver_internal+0xf3/0x1c0
[ 8101.565677]  device_release_driver+0xd/0x20
[ 8101.565680]  bus_remove_device+0xdc/0x150
[ 8101.565684]  device_del+0x171/0x3f0
[ 8101.565688]  device_unregister+0x16/0x60
[ 8101.565690]  typec_unregister_altmode+0x2b/0x40
[ 8101.565694]  ucsi_unregister_altmodes+0x41/0x90
[ 8101.565697]  ucsi_unregister_partner.part.0+0x12/0x30
[ 8101.565700]  ucsi_handle_connector_change+0x221/0x311
[ 8101.565705]  ? kfree+0x256/0x270
[ 8101.565709]  process_one_work+0x19c/0x3a0
[ 8101.565712]  worker_thread+0x4b/0x3b0
[ 8101.565716]  kthread+0x101/0x140
[ 8101.565718]  ? process_one_work+0x3a0/0x3a0
[ 8101.565721]  ? kthread_park+0xa0/0xa0
[ 8101.565726]  ret_from_fork+0x1f/0x40
[ 8101.565729] ---[ end trace 227b0e97c6c80051 ]---
```

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
