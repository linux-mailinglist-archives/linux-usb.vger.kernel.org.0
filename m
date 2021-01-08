Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC492EEA6B
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 01:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbhAHA3z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 19:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbhAHA3z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 19:29:55 -0500
X-Greylist: delayed 393 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Jan 2021 16:29:14 PST
Received: from vulcan.kevinlocke.name (vulcan.kevinlocke.name [IPv6:2001:19f0:5:727:1e84:17da:7c52:5ab4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36E5C0612F4
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 16:29:14 -0800 (PST)
Received: from kevinlocke.name (2600-6c67-5080-46fc-e707-8c1f-78ba-ee21.res6.spectrum.com [IPv6:2600:6c67:5080:46fc:e707:8c1f:78ba:ee21])
        (Authenticated sender: kevin@kevinlocke.name)
        by vulcan.kevinlocke.name (Postfix) with ESMTPSA id 4EBAB1F5C10D;
        Fri,  8 Jan 2021 00:22:39 +0000 (UTC)
Received: by kevinlocke.name (Postfix, from userid 1000)
        id B47A81304D95; Thu,  7 Jan 2021 17:22:36 -0700 (MST)
Date:   Thu, 7 Jan 2021 17:22:36 -0700
From:   Kevin Locke <kevin@kevinlocke.name>
To:     linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>
Subject: Oops from xhci_configure_endpoint on resume from S3
Message-ID: <X/elzOTOOJMAc+1e@kevinlocke.name>
Mail-Followup-To: Kevin Locke <kevin@kevinlocke.name>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On a ThinkPad T430 (2342-CTO) with an Intel 7 Series USB xHCI Host
Controller (8086:1e31) running Linux 5.11-rc2 (or torvalds master
71c061d24438, or 4.19.0-13-amd64 from Debian stable), I can provoke a
kernel Oops in code called from xhci_configure_endpoint by doing the
following (performed after booting into single-user mode):

1. Connect USB3 UAS disk drive (Seagate Backup Plus Hub - 1180:e823)
2. When "Spinning up disk..." is logged by the kernel, initiate suspend
   to memory (`echo mem >/sys/power/state`).
3. Once suspended, disconnect the drive.
4. Initiate wake then immediately plug and unplug a USB2 device (Yubikey
   1050:0406) in the same port repeatedly.

This usually causes the system to freeze (unresponsive to Magic SysRq).
If not, repeat the steps.  Relevant (decoded) dmesg (from EFI pstore):

kernel BUG at lib/list_debug.c:54!
invalid opcode: 0000 [#1] SMP PTI
CPU: 0 PID: 202 Comm: kworker/0:3 Not tainted 5.11.0-rc2 #35
Hardware name: LENOVO 2342CTO/2342CTO, BIOS G1ETC2WW (2.82 ) 08/07/2019
Workqueue: usb_hub_wq hub_event [usbcore]
RIP: 0010:__list_del_entry_valid.cold (/usr/src/linux/lib/list_debug.c:54 (discriminator 3)) 
Code: c7 c7 58 c7 8f af e8 55 1b ff ff 0f 0b 48 89 fe 48 c7 c7 e8 c7 8f af e8 44 1b ff ff 0f 0b 48 c7 c7 98 c8 8f af e8 36 1b ff ff <0f> 0b 48 89 f2 48 89 fe 48 c7 c7 58 c8 8f af e8 22 1b ff ff 0f 0b
All code
========
   0:	c7 c7 58 c7 8f af    	mov    $0xaf8fc758,%edi
   6:	e8 55 1b ff ff       	callq  0xffffffffffff1b60
   b:	0f 0b                	ud2    
   d:	48 89 fe             	mov    %rdi,%rsi
  10:	48 c7 c7 e8 c7 8f af 	mov    $0xffffffffaf8fc7e8,%rdi
  17:	e8 44 1b ff ff       	callq  0xffffffffffff1b60
  1c:	0f 0b                	ud2    
  1e:	48 c7 c7 98 c8 8f af 	mov    $0xffffffffaf8fc898,%rdi
  25:	e8 36 1b ff ff       	callq  0xffffffffffff1b60
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	48 89 f2             	mov    %rsi,%rdx
  2f:	48 89 fe             	mov    %rdi,%rsi
  32:	48 c7 c7 58 c8 8f af 	mov    $0xffffffffaf8fc858,%rdi
  39:	e8 22 1b ff ff       	callq  0xffffffffffff1b60
  3e:	0f 0b                	ud2    

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	48 89 f2             	mov    %rsi,%rdx
   5:	48 89 fe             	mov    %rdi,%rsi
   8:	48 c7 c7 58 c8 8f af 	mov    $0xffffffffaf8fc858,%rdi
   f:	e8 22 1b ff ff       	callq  0xffffffffffff1b36
  14:	0f 0b                	ud2    
RSP: 0018:ffffa4158062b8c8 EFLAGS: 00010046
RAX: 0000000000000054 RBX: ffff99b684412408 RCX: ffff99b796217a48
RDX: 0000000000000000 RSI: 0000000000000027 RDI: ffff99b796217a40
RBP: ffff99b684412498 R08: 0000000000000000 R09: ffffa4158062b700
R10: 0000000000000001 R11: 0000000000000001 R12: ffff99b680b14260
Call Trace:
xhci_drop_ep_from_interval_table (/usr/src/linux/./include/linux/list.h:132 /usr/src/linux/./include/linux/list.h:204 /usr/src/linux/drivers/usb/host/xhci.c:2678) xhci_hcd
xhci_reserve_bandwidth (/usr/src/linux/drivers/usb/host/xhci.c:2805) xhci_hcd
? __wake_up_common_lock (/usr/src/linux/kernel/sched/wait.c:141 (discriminator 1)) 
? ep_poll_callback (/usr/src/linux/fs/eventpoll.c:1197) 
? __wake_up_common (/usr/src/linux/kernel/sched/wait.c:109) 
? __wake_up_common_lock (/usr/src/linux/kernel/sched/wait.c:141 (discriminator 1)) 
? ep_poll_callback (/usr/src/linux/fs/eventpoll.c:1197) 
? __wake_up_common (/usr/src/linux/kernel/sched/wait.c:109) 
? __inode_wait_for_writeback (/usr/src/linux/fs/fs-writeback.c:1339) 
? select_collect2 (/usr/src/linux/fs/dcache.c:1501) 
? d_walk (/usr/src/linux/./include/linux/rcupdate.h:697 /usr/src/linux/fs/dcache.c:1384) 
? select_collect2 (/usr/src/linux/fs/dcache.c:1501) 
? __inode_wait_for_writeback (/usr/src/linux/fs/fs-writeback.c:1339) 
? fsnotify_grab_connector (/usr/src/linux/fs/notify/mark.c:539) 
? xhci_update_device (/usr/src/linux/./arch/x86/include/asm/jump_label.h:25 /usr/src/linux/./include/linux/jump_label.h:200 /usr/src/linux/drivers/usb/host/xhci-trace.h:50) xhci_hcd
? xhci_dbg_trace (/usr/src/linux/drivers/usb/host/xhci-dbg.c:34) xhci_hcd
xhci_configure_endpoint (/usr/src/linux/drivers/usb/host/xhci.c:2907 (discriminator 1)) xhci_hcd
xhci_check_bandwidth (/usr/src/linux/drivers/usb/host/xhci.c:3048 /usr/src/linux/drivers/usb/host/xhci.c:2988) xhci_hcd
Modules linked in: uas usb_storage nf_tables libcrc32c nfnetlink ctr ccm blowfish_generic blowfish_x86_64 blowfish_common des_generic des3_ede_x86_64 libdes cast5_avx_x86_64 cast5_generic cast_common cbc hid_generic usbhid hid aes_generic lrw gf128mul ecb camellia_generic camellia_aesni_avx_x86_64 camellia_x86_64 twofish_generic twofish_avx_x86_64 twofish_x86_64_3way twofish_x86_64 twofish_common snd_hda_codec_realtek snd_hda_codec_generic intel_rapl_msr intel_rapl_common serpent_avx_x86_64 x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel serpent_sse2_x86_64 kvm serpent_generic nls_ascii irqbypass xts crc32_pclmul i915 nls_cp437 snd_hda_intel algif_skcipher snd_intel_dspcfg vfat fat mei_wdt at24 ghash_clmulni_intel af_alg iwldvm soundwire_intel rapl wmi_bmof essiv authenc intel_cstate drm_kms_helper soundwire_generic_allocation mac80211 snd_soc_core snd_compress cec soundwire_cadence intel_uncore libarc4 snd_hda_codec drm pcspkr iwlwifi snd_hda_core iTCO_wdt
snd_hwdep sdhci_pci intel_pmc_bxt joydev xhci_pci soundwire_bus cqhci i2c_algo_bit sr_mod e1000e xhci_hcd efi_pstore ehci_pci thinkpad_acpi snd_pcm fb_sys_fops cdrom sdhci syscopyarea ehci_hcd iTCO_vendor_support tpm_tis ptp nvram mei_me sysfillrect snd_timer sg i2c_i801 watchdog cfg80211 tpm_tis_core ledtrig_audio usbcore mmc_core sysimgblt mei i2c_smbus snd pps_core tpm soundcore rfkill wmi ac rng_core battery video button loop fuse configfs efivarfs ip_tables x_tables autofs4 ext4 crc32c_generic crc16 mbcache jbd2 dm_crypt dm_mod sd_mod t10_pi crc_t10dif crct10dif_generic crct10dif_pclmul crct10dif_common crc32c_intel ahci libahci psmouse libata aesni_intel glue_helper libaes crypto_simd evdev scsi_mod serio_raw cryptd

The stacktrace tends to change, but always includes
xhci_configure_endpoint called from xhci_check_bandwidth.  The .config,
along with two full dmesg for kernel 5.11-rc2 (with different stack
traces) and one for 4.19.0-13-amd64 are hosted at
https://gitlab.com/kevinoid/linux-xhci-resume-oops-info

Let me know if there's anything else I can do to help diagnose/debug.

Thanks,
Kevin

P.S. Please CC me in responses as I am not subscribed to linux-usb.
