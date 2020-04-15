Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3B91A98D7
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 11:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895520AbgDOJ1k convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 15 Apr 2020 05:27:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:40422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895494AbgDOJ1h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 05:27:37 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 207283] New: Allen & Heath ZEDi-10 instability
Date:   Wed, 15 Apr 2020 09:27:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ben@427.org.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207283-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207283

            Bug ID: 207283
           Summary: Allen & Heath ZEDi-10 instability
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.3
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ben@427.org.uk
        Regression: No

Created attachment 288471
  --> https://bugzilla.kernel.org/attachment.cgi?id=288471&action=edit
Kernel config

I keep seeing various errors in dmesg which I will show below, and occasional
disconnects. I've tried it on two different computers and it's only happening
on one of them so I don't think the hardware itself is at fault, but I'm sure
people on the list here will know a lot more about it than I do.


Sometimes I get the error "ERROR Transfer event TRB DMA ptr not part of current
TD" as well, and occasionally "parse_audio_format_rates_v2v3(): unable to find
clock source (clock -71)" but often it's just disconnecting the port, which
then reconnects within a second or so.


It's using the xhci_hcd driver, I've looked in to disabling xHCI in the BIOS
after some searching on the web but this laptop doesn't have any option to do
that, and it's also using that driver on the other laptop that doesn't seem to
have this issue.

I am attaching the current kernel config, as well as some dmesg extracts with
'module xhci_hcd =p' set in /sys/kernel/debug/dynamic_debug/control.

Environment:

Linux tangyzizzle 5.6.3 #1 SMP Sun Apr 12 11:56:30 BST 2020 x86_64 GNU/Linux

GNU Make                4.2.1
Binutils                2.31.1
Util-linux              2.33.1
Mount                   2.33.1
Bison                   3.3.2
Flex                    2.6.4
Linux C Library         2.28
Dynamic linker (ldd)    2.28
Procps                  3.3.15
Kbd                     2.0.4
Console-tools           2.0.4
Sh-utils                8.30
Udev                    241
Modules Loaded          ac acpi_pad aesni_intel ahci ansi_cprng autofs4 battery
binfmt_misc bluetooth bnep bridge btbcm btintel btrtl btusb button ccm cdrom
cec cfg80211 cmac coretemp crc16 crc32c_generic crc32c_intel crc32_pclmul
crct10dif_pclmul ctr dm_crypt dm_mod drbg drm drm_kms_helper ecc ecdh_generic
efi_pstore efivarfs efivars evdev ext4 fat fuse ghash_clmulni_intel hid
hid_generic i2c_algo_bit i2c_i801 i915 intel_cstate intel_powerclamp
intel_rapl_common intel_rapl_msr intel_rapl_perf intel_uncore ip_tables
ipt_REJECT irqbypass iTCO_vendor_support iTCO_wdt iwlmvm iwlwifi jbd2 joydev
kvm kvm_intel ledtrig_audio libahci libarc4 libata libcrc32c libphy llc loop
mac80211 mbcache mc mei mei_me mfd_core mmc_core msr nf_conntrack
nf_defrag_ipv4 nf_defrag_ipv6 nf_nat nfnetlink nf_reject_ipv4 nf_tables
nft_chain_nat nft_compat nft_counter nls_ascii nls_cp437 pcspkr psmouse psnap
r8169 realtek rfkill rng_core rtsx_pci rtsx_pci_sdmmc scsi_mod sd_mod serio_raw
sg snd snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi
snd_hda_codec_realtek snd_hda_core snd_hda_ext_core snd_hda_intel snd_hrtimer
snd_hwdep snd_intel_dspcfg snd_pcm snd_rawmidi snd_seq snd_seq_device
snd_seq_dummy snd_soc_acpi snd_soc_acpi_intel_match snd_soc_core
snd_soc_hdac_hda snd_soc_skl snd_soc_sst_dsp snd_soc_sst_ipc snd_timer
snd_usb_audio snd_usbmidi_lib soundcore sr_mod stp sunrpc t10_pi tpm tpm_crb
tpm_tis tpm_tis_core tun usbcore usbhid uvcvideo vfat video videobuf2_common
videobuf2_memops videobuf2_v4l2 videobuf2_vmalloc videodev watchdog wmi
x86_pkg_temp_thermal xhci_hcd xhci_pci x_tables xt_CHECKSUM xt_conntrack
xt_MASQUERADE xt_tcpudp


Processor: Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz
PCI information: will be attached shortly

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
