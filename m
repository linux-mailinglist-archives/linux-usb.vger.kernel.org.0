Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8132914E987
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 09:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgAaI1S convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 31 Jan 2020 03:27:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:33520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728099AbgAaI1S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jan 2020 03:27:18 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206365] kernel NULL pointer dereference when charger is
 unplugged
Date:   Fri, 31 Jan 2020 08:27:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andrea.lagala@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206365-208809-qy3ZPDxKrh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206365-208809@https.bugzilla.kernel.org/>
References: <bug-206365-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206365

--- Comment #1 from Andrea Gagliardi La Gala (andrea.lagala@gmail.com) ---
1. Did it work previously in Fedora? If so, what kernel version did the issue
   *first* appear?  Old kernels are available for download at
   https://koji.fedoraproject.org/koji/packageinfo?packageID=8 :

I only tried Fedora 30 and 31; both have the issue. Interestingly, I used
Manjaro before and never had this specific problem.


2. Can you reproduce this issue? If so, please provide the steps to reproduce
   the issue below:

Boot on AC power, unplug the charger. ``dmesg -w`` shows the oops the second I
unplug the charger.


3. Does this problem occur with the latest Rawhide kernel? To install the
   Rawhide kernel, run ``sudo dnf install fedora-repos-rawhide`` followed by
   ``sudo dnf update --enablerepo=rawhide kernel``:

I cannot download it; dnf complains about keys for rawhide not matching the
repo (signing with Fedora 32 keys).


4. Are you running any modules that not shipped with directly Fedora's kernel?:

I enabled Intel's GuC firmware loading but disabled it, thinking this issue
appeared after this modification. With the kernel completely untainted the
issue remains.


5. Please attach the kernel logs. You can get the complete kernel log
   for a boot with ``journalctl --no-hostname -k > dmesg.txt``. If the
   issue occurred on a previous boot, use the journalctl ``-b`` flag.


Here's the oops:

[ 1110.200260] BUG: kernel NULL pointer dereference, address: 0000000000000080
[ 1110.200268] #PF: supervisor read access in kernel mode
[ 1110.200271] #PF: error_code(0x0000) - not-present page
[ 1110.200274] PGD 0 P4D 0 
[ 1110.200281] Oops: 0000 [#1] SMP PTI
[ 1110.200288] CPU: 0 PID: 12998 Comm: kworker/0:0 Kdump: loaded Not tainted
5.3.4-300.fc31.x86_64 #1
[ 1110.200291] Hardware name: ASUSTeK COMPUTER INC. UX370UAR/UX370UAR, BIOS
UX370UAR.310 04/17/2019
[ 1110.200303] Workqueue: events ucsi_connector_change [typec_ucsi]
[ 1110.200312] RIP: 0010:ucsi_displayport_remove_partner+0xa/0x20 [typec_ucsi]
[ 1110.200318] Code: 38 00 c7 43 28 00 00 00 00 48 83 c7 10 5b e9 2d 9b 01 d3
66 66 2e 0f 1f 84 00 00 00 00 00 66 90 0f 1f 44 00 00 48 85 ff 74 0f <48> 8b 47
78 48 c7 00 00 00 00 00 c6 40 3d 00 c3 66 0f 1f 44 00 00
[ 1110.200322] RSP: 0018:ffff9e2d84ec7df8 EFLAGS: 00010202
[ 1110.200326] RAX: 0000000000000008 RBX: ffff90fe43b70170 RCX:
00000000000056d3
[ 1110.200329] RDX: 00000000000056d2 RSI: 0000000000000001 RDI:
0000000000000008
[ 1110.200332] RBP: 0000000000000000 R08: ffffffff94528880 R09:
ffff9e2d84ec7cf0
[ 1110.200334] R10: ffff90fecc3be1ff R11: 0000000000000000 R12:
ffff90fe43b70170
[ 1110.200337] R13: 0000000000000001 R14: ffff90fe43b702c0 R15:
ffff90fe43b70038
[ 1110.200341] FS:  0000000000000000(0000) GS:ffff90fe4ea00000(0000)
knlGS:0000000000000000
[ 1110.200344] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1110.200348] CR2: 0000000000000080 CR3: 000000038e40a001 CR4:
00000000003606f0
[ 1110.200350] Call Trace:
[ 1110.200361]  ucsi_unregister_altmodes+0x7b/0x90 [typec_ucsi]
[ 1110.200370]  ucsi_unregister_partner.part.0+0x13/0x30 [typec_ucsi]
[ 1110.200377]  ucsi_connector_change+0x247/0x340 [typec_ucsi]
[ 1110.200389]  process_one_work+0x19d/0x340
[ 1110.200397]  worker_thread+0x50/0x3b0
[ 1110.200404]  kthread+0xfb/0x130
[ 1110.200411]  ? process_one_work+0x340/0x340
[ 1110.200416]  ? kthread_park+0x80/0x80
[ 1110.200425]  ret_from_fork+0x35/0x40
[ 1110.200431] Modules linked in: squashfs zstd_decompress loop rfcomm fuse ccm
xt_CHECKSUM xt_MASQUERADE nf_nat_tftp nf_conntrack_tftp tun bridge stp llc
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_ipv6
ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ip_set nfnetlink ebtable_filter ebtables cmac ip6table_filter
ip6_tables iptable_filter bnep sunrpc vfat fat uvcvideo btusb btrtl btbcm
btintel videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 bluetooth
videobuf2_common videodev mc ecdh_generic ecc snd_soc_skl snd_soc_hdac_hda
snd_hda_ext_core snd_soc_skl_ipc joydev snd_soc_sst_ipc iwlmvm
snd_hda_codec_hdmi snd_soc_sst_dsp snd_soc_acpi_intel_match snd_soc_acpi
x86_pkg_temp_thermal intel_powerclamp coretemp mac80211 snd_soc_core
snd_hda_codec_realtek
[ 1110.200494]  snd_hda_codec_generic ledtrig_audio snd_compress
spi_pxa2xx_platform kvm_intel ac97_bus mei_hdcp dw_dmac iTCO_wdt hid_multitouch
snd_pcm_dmaengine snd_hda_intel typec_displayport iTCO_vendor_support libarc4
intel_rapl_msr snd_hda_codec gpio_keys kvm iwlwifi snd_hda_core snd_hwdep
irqbypass snd_seq intel_cstate intel_uncore snd_seq_device snd_pcm
intel_rapl_perf cfg80211 asus_nb_wmi hid_sensor_accel_3d snd_timer asus_wmi
sparse_keymap wmi_bmof hid_sensor_trigger snd hid_sensor_iio_common
industrialio_triggered_buffer mei_me kfifo_buf soundcore
intel_xhci_usb_role_switch rfkill i2c_i801 mei industrialio roles idma64
processor_thermal_device ucsi_acpi typec_ucsi intel_rapl_common cros_ec_ishtp
intel_lpss_pci cros_ec_core intel_lpss intel_soc_dts_iosf intel_pch_thermal
typec int3403_thermal int340x_thermal_zone soc_button_array int3400_thermal
asus_wireless acpi_pad acpi_thermal_rel binfmt_misc ip_tables xfs libcrc32c
dm_crypt hid_sensor_hub intel_ishtp_loader intel_ishtp_hid i915
[ 1110.200553]  i2c_algo_bit drm_kms_helper crct10dif_pclmul crc32_pclmul
crc32c_intel drm nvme ghash_clmulni_intel serio_raw nvme_core intel_ish_ipc
intel_ishtp wmi i2c_hid video pinctrl_sunrisepoint pinctrl_intel
[ 1110.200575] CR2: 0000000000000080

I attached my lshw output and vmcore-dmesg.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
