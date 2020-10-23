Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B398296FD5
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 15:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372136AbgJWNBQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 09:01:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:35641 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S372126AbgJWNBQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Oct 2020 09:01:16 -0400
IronPort-SDR: I4GVGFqWBeCvDtymr0tTxPULHIFYTCElpD8/BXwMt0zfSqHY3xGuwGNHJvkGJ9Bgh5IuZe5k8L
 gvPvYlD4aW2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="185369021"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; 
   d="scan'208";a="185369021"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2020 06:00:57 -0700
IronPort-SDR: 9Z+q96Hy9kKnWr3mkGtYWLdpCb8XfCgfSbrC+rzbHdF7YKZ4Xcmia+eCQ5B10YxrkeA3Xn2YzZ
 JumzFKMqC4QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; 
   d="scan'208";a="302756182"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga007.fm.intel.com with ESMTP; 23 Oct 2020 06:00:54 -0700
Subject: Re: PROBLEM: connecting a USB flash drive deactivates entire USB
 subsystem after a few seconds
To:     fenugrec@mail.com
References: <trinity-b4eaf418-90d9-4a48-9f51-79e7d807924e-1603306195637@3c-app-mailcom-lxa12>
Cc:     USB <linux-usb@vger.kernel.org>,
        "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>
From:   Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <3bc727f5-3cc7-09e3-0935-ffaf04a4702d@intel.com>
Date:   Fri, 23 Oct 2020 16:02:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <trinity-b4eaf418-90d9-4a48-9f51-79e7d807924e-1603306195637@3c-app-mailcom-lxa12>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.10.2020 21.49, fenugrec@mail.com wrote:
> Hi,
> just following the guide from https://www.kernel.org/doc/html/latest/admin-guide/reporting-bugs.html --
> Do you prefer bug reports be sent to the mailing list, via bugzilla or right here ?

Mailing list is fine (added)

> 
> Here's a copy in case.
> Thanks,
> Chris
> 
> ****************
> [1.] Summary: connecting a USB flash drive deactivates entire USB subsystem after a few seconds
> [2.] Full description :
> Connecting this possibly defective (although functional on Windows machines) USB flash drive, Silicon Power SP064GBUF3J80, results in either of two outcomes :
> A- if left connected for more than about 30 seconds, entire system becomes "unresponsive", or at least doesn't take any input from the USB keyboard. Cannot reboot via sysreq of course.
>  dmesg shows:
> 14:04:39 raisin kernel: usb 2-6: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> 14:04:39 raisin kernel: usb 2-6: New USB device found, idVendor=090c, idProduct=3267, bcdDevice=11.00
> 14:04:39 raisin kernel: usb 2-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> 14:04:39 raisin kernel: usb 2-6: Product: Flash Disk
> 14:04:39 raisin kernel: usb 2-6: Manufacturer: USB
> 14:04:39 raisin kernel: usb-storage 2-6:1.0: USB Mass Storage device detected
> 14:04:39 raisin kernel: scsi host10: usb-storage 2-6:1.0
> 14:04:40 raisin kernel: scsi 10:0:0:0: Direct-Access     USB      Flash Disk       1100 PQ: 0 ANSI: 6
> 14:04:40 raisin kernel: sd 10:0:0:0: Attached scsi generic sg3 type 0
> 14:04:40 raisin kernel: sd 10:0:0:0: [sdc] 125829120 512-byte logical blocks: (64.4 GB/60.0 GiB)
> 14:04:40 raisin kernel: sd 10:0:0:0: [sdc] Write Protect is off
> 14:04:40 raisin kernel: sd 10:0:0:0: [sdc] Mode Sense: 43 00 00 00
> 14:04:40 raisin kernel: sd 10:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> 14:04:40 raisin kernel:  sdc: sdc1
> 14:04:40 raisin kernel: sd 10:0:0:0: [sdc] Attached SCSI removable disk
> **** system doesn't respond to keyboard after this point
> 14:05:22 raisin kernel: xhci_hcd 0000:01:00.0: Abort failed to stop command ring: -110
> 14:05:22 raisin kernel: xhci_hcd 0000:01:00.0: xHCI host controller not responding, assume dead
> 14:05:22 raisin kernel: xhci_hcd 0000:01:00.0: HC died; cleaning up
> 14:05:22 raisin kernel: xhci_hcd 0000:01:00.0: Timeout while waiting for setup device command

Hmm.. command doesn't complete in five seconds, and aborting command fails as well.

Any chance you could take more detailed logs and xhci traces of this issue?

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
< Trigger the issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

trace file will be huge

(keeping rest of mail for other linux-usb readers.)
-Mathias

> 14:05:22 raisin kernel: usb 1-5: USB disconnect, device number 2
> 14:05:22 raisin kernel: usb 2-6: USB disconnect, device number 0
> 14:05:22 raisin kernel: usb 1-8: USB disconnect, device number 3
> 14:05:22 raisin kernel: usb 1-9: USB disconnect, device number 4
> 14:05:22 raisin kernel: usb 1-10: USB disconnect, device number 5
> 14:05:22 raisin kernel: usb 2-6: device not accepting address 2, error -22
> 14:05:22 raisin kernel: sd 10:0:0:0: [sdc] tag#0 FAILED Result: hostbyte=DID_TIME_OUT driverbyte=DRIVER_OK cmd_age=41s
> 14:05:22 raisin kernel: sd 10:0:0:0: [sdc] tag#0 CDB: Read(10) 28 00 07 7f ff fc 00 00 01 00
> 14:05:22 raisin kernel: blk_update_request: I/O error, dev sdc, sector 125829116 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
> 14:05:22 raisin kernel: blk_update_request: I/O error, dev sdc, sector 125829112 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> 14:05:22 raisin kernel: Buffer I/O error on dev sdc, logical block 15728639, async page read
> 
> B- if disconnected quickly, any attempted operation (mount, fdisk, whatever) on the drive aborts and dmesg shows:
> 
> [ 1157.471933] usb 2-5: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [ 1157.509912] usb 2-5: New USB device found, idVendor=090c, idProduct=3267, bcdDevice=11.00
> [ 1157.509916] usb 2-5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 1157.509918] usb 2-5: Product: Flash Disk
> [ 1157.509920] usb 2-5: Manufacturer: USB
> [ 1157.540178] usb-storage 2-5:1.0: USB Mass Storage device detected
> [ 1157.540312] scsi host10: usb-storage 2-5:1.0
> [ 1157.540356] usbcore: registered new interface driver usb-storage
> [ 1157.542113] usbcore: registered new interface driver uas
> [ 1158.676430] scsi 10:0:0:0: Direct-Access     USB      Flash Disk       1100 PQ: 0 ANSI: 6
> [ 1158.676829] sd 10:0:0:0: Attached scsi generic sg3 type 0
> [ 1158.677491] sd 10:0:0:0: [sdc] 125829120 512-byte logical blocks: (64.4 GB/60.0 GiB)
> [ 1158.678149] sd 10:0:0:0: [sdc] Write Protect is off
> [ 1158.678152] sd 10:0:0:0: [sdc] Mode Sense: 43 00 00 00
> [ 1158.678787] sd 10:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [ 1158.774836]  sdc: sdc1
> [ 1158.881981] sd 10:0:0:0: [sdc] Attached SCSI removable disk
> **** physical disconnect here
> [ 1165.500579] usb 2-5: USB disconnect, device number 2
> [ 1165.500866] sd 10:0:0:0: [sdc] tag#0 FAILED Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [ 1165.500870] sd 10:0:0:0: [sdc] tag#0 CDB: Read(10) 28 00 07 7f ff fb 00 00 01 00
> [ 1165.500875] blk_update_request: I/O error, dev sdc, sector 125829115 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 0
> [ 1165.501027] blk_update_request: I/O error, dev sdc, sector 125829112 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [ 1165.501034] Buffer I/O error on dev sdc, logical block 15728639, async page read
> 
> [3.] Keywords: usb flash drive unresponsive xhci
> 
> 
> [4.1.] Kernel version (from /proc/version):
> Linux version 5.4.72-1-lts (linux-lts@artixlinux) (gcc version 10.2.0 (GCC)) #1 SMP Sat, 17 Oct 2020 19:32:15 +0000
> Also tested 5.4.66-lts, and 5.9.1 on a separate computer.
> 
> [5.] Most recent kernel version which did not have the bug:
> Unknown, sorry.
> 
> [7.] Reproducing
> 100% reproducible from a clean boot, before even running startx run "dmesg -w" then connect the drive.
> 
> [8.1.] Software (add the output of the ver_linux script here)
> Linux raisin 5.4.72-1-lts #1 SMP Sat, 17 Oct 2020 19:32:15 +0000 x86_64 GNU/Linux
> 
> GNU C               	10.2.0
> GNU Make            	4.3
> Binutils            	2.35.1
> Util-linux          	2.36
> Mount               	2.36
> Module-init-tools   	27
> E2fsprogs           	1.45.6
> Jfsutils            	1.1.15
> Reiserfsprogs       	3.6.27
> Xfsprogs            	5.8.0
> Pcmciautils         	018
> Linux C Library     	2.32
> Dynamic linker (ldd)	2.32
> Linux C++ Library   	6.0.28
> Procps              	3.3.16
> Kbd                 	2.3.0
> Console-tools       	2.3.0
> Sh-utils            	8.32
> Udev                	243
> Modules Loaded      	8021q acpi_cpufreq aesni_intel agpgart ahci amdgpu ccp cdrom cfg80211 cifs cmac crc16 crc32c_generic crc32c_intel crc32_pclmul crct10dif_pclmul cryptd crypto_simd dca dns_resolver drm drm_kms_helper edac_mce_amd evdev ext4 fb_sys_fops fscache garp ghash_clmulni_intel glue_helper gpio_amdpt gpu_sched hid hid_generic i2c_algo_bit i2c_piix4 igb input_leds irqbypass jbd2 joydev k10temp kvm kvm_amd ledtrig_audio libahci libarc4 libata libdes llc mac_hid mbcache mc md4 md_mod mousedev mrp mxm_wmi nls_utf8 pcspkr pinctrl_amd raid10 rfkill rng_core scsi_mod sd_mod sg snd snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_core snd_hda_intel snd_hwdep snd_intel_nhlt snd_pcm snd_rawmidi snd_seq_device snd_timer snd_usb_audio snd_usbmidi_lib soundcore sp5100_tco sr_mod stp syscopyarea sysfillrect sysimgblt ttm usbhid vboxdrv vboxnetadp vboxnetflt wacom wmi wmi_bmof xhci_hcd xhci_pci
> 
> [8.2.] Processor information (from /proc/cpuinfo):
> (trimmed, 8 nearly-identical copies of this block)
> processor	: 0
> vendor_id	: AuthenticAMD
> cpu family	: 23
> model		: 8
> model name	: AMD Ryzen 7 2700 Eight-Core Processor
> stepping	: 2
> microcode	: 0x800820d
> cpu MHz		: 1336.228
> cache size	: 512 KB
> physical id	: 0
> siblings	: 16
> core id		: 0
> cpu cores	: 8
> apicid		: 0
> initial apicid	: 0
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 13
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw skinit wdt tce topoext perfctr_core perfctr_nb bpext perfctr_llc mwaitx cpb hw_pstate sme ssbd sev ibpb vmmcall fsgsbase bmi1 avx2 smep bmi2 rdseed adx smap clflushopt sha_ni xsaveopt xsavec xgetbv1 xsaves clzero irperf xsaveerptr arat npt lbrv svm_lock nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif overflow_recov succor smca
> bugs		: sysret_ss_attrs null_seg spectre_v1 spectre_v2 spec_store_bypass
> bogomips	: 6399.52
> TLB size	: 2560 4K pages
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 43 bits physical, 48 bits virtual
> power management: ts ttp tm hwpstate cpb eff_freq_ro [13] [14]
> 
> [8.3.] Module information (from /proc/modules):
> uas 32768 0 - Live 0x0000000000000000
> usb_storage 81920 1 uas, Live 0x0000000000000000
> md4 16384 0 - Live 0x0000000000000000
> cmac 16384 1 - Live 0x0000000000000000
> nls_utf8 16384 4 - Live 0x0000000000000000
> cifs 1114112 3 - Live 0x0000000000000000
> libarc4 16384 1 cifs, Live 0x0000000000000000
> dns_resolver 16384 1 cifs, Live 0x0000000000000000
> fscache 393216 1 cifs, Live 0x0000000000000000
> libdes 24576 1 cifs, Live 0x0000000000000000
> cfg80211 843776 0 - Live 0x0000000000000000
> rfkill 28672 1 cfg80211, Live 0x0000000000000000
> 8021q 40960 0 - Live 0x0000000000000000
> garp 16384 1 8021q, Live 0x0000000000000000
> mrp 20480 1 8021q, Live 0x0000000000000000
> stp 16384 1 garp, Live 0x0000000000000000
> llc 16384 2 garp,stp, Live 0x0000000000000000
> joydev 28672 0 - Live 0x0000000000000000
> wmi_bmof 16384 0 - Live 0x0000000000000000
> mxm_wmi 16384 0 - Live 0x0000000000000000
> snd_hda_codec_realtek 143360 1 - Live 0x0000000000000000
> snd_hda_codec_generic 94208 1 snd_hda_codec_realtek, Live 0x0000000000000000
> ledtrig_audio 16384 2 snd_hda_codec_realtek,snd_hda_codec_generic, Live 0x0000000000000000
> snd_hda_codec_hdmi 73728 1 - Live 0x0000000000000000
> snd_hda_intel 53248 6 - Live 0x0000000000000000
> snd_intel_nhlt 20480 1 snd_hda_intel, Live 0x0000000000000000
> snd_hda_codec 159744 4 snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel, Live 0x0000000000000000
> snd_usb_audio 307200 2 - Live 0x0000000000000000
> amdgpu 5160960 6 - Live 0x0000000000000000
> snd_usbmidi_lib 40960 1 snd_usb_audio, Live 0x0000000000000000
> snd_hda_core 102400 5 snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec, Live 0x0000000000000000
> snd_rawmidi 45056 1 snd_usbmidi_lib, Live 0x0000000000000000
> edac_mce_amd 32768 0 - Live 0x0000000000000000
> kvm_amd 110592 0 - Live 0x0000000000000000
> snd_hwdep 16384 2 snd_hda_codec,snd_usb_audio, Live 0x0000000000000000
> snd_seq_device 16384 1 snd_rawmidi, Live 0x0000000000000000
> mc 61440 1 snd_usb_audio, Live 0x0000000000000000
> gpu_sched 36864 1 amdgpu, Live 0x0000000000000000
> snd_pcm 143360 5 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_usb_audio,snd_hda_core, Live 0x0000000000000000
> kvm 794624 1 kvm_amd, Live 0x0000000000000000
> snd_timer 40960 1 snd_pcm, Live 0x0000000000000000
> ttm 118784 1 amdgpu, Live 0x0000000000000000
> irqbypass 16384 1 kvm, Live 0x0000000000000000
> mousedev 24576 0 - Live 0x0000000000000000
> snd 110592 28 snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_usb_audio,snd_usbmidi_lib,snd_rawmidi,snd_hwdep,snd_seq_device,snd_pcm,snd_timer, Live 0x0000000000000000
> wacom 126976 0 - Live 0x0000000000000000
> drm_kms_helper 221184 1 amdgpu, Live 0x0000000000000000
> soundcore 16384 1 snd, Live 0x0000000000000000
> input_leds 16384 0 - Live 0x0000000000000000
> drm 520192 10 amdgpu,gpu_sched,ttm,drm_kms_helper, Live 0x0000000000000000
> vboxnetflt 32768 0 - Live 0x0000000000000000 (OE)
> crct10dif_pclmul 16384 1 - Live 0x0000000000000000
> agpgart 53248 2 ttm,drm, Live 0x0000000000000000
> crc32_pclmul 16384 0 - Live 0x0000000000000000
> syscopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000
> igb 258048 0 - Live 0x0000000000000000
> sysfillrect 16384 1 drm_kms_helper, Live 0x0000000000000000
> vboxnetadp 28672 0 - Live 0x0000000000000000 (OE)
> ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
> sysimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000
> vboxdrv 503808 2 vboxnetflt,vboxnetadp, Live 0x0000000000000000 (OE)
> aesni_intel 372736 1 - Live 0x0000000000000000
> fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000
> sp5100_tco 20480 0 - Live 0x0000000000000000
> i2c_algo_bit 16384 2 amdgpu,igb, Live 0x0000000000000000
> ccp 106496 1 kvm_amd, Live 0x0000000000000000
> rng_core 16384 1 ccp, Live 0x0000000000000000
> dca 16384 1 igb, Live 0x0000000000000000
> k10temp 16384 0 - Live 0x0000000000000000
> wmi 36864 2 wmi_bmof,mxm_wmi, Live 0x0000000000000000
> crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000
> pcspkr 16384 0 - Live 0x0000000000000000
> evdev 28672 11 - Live 0x0000000000000000
> sg 40960 0 - Live 0x0000000000000000
> gpio_amdpt 20480 0 - Live 0x0000000000000000
> cryptd 24576 2 ghash_clmulni_intel,crypto_simd, Live 0x0000000000000000
> pinctrl_amd 32768 0 - Live 0x0000000000000000
> i2c_piix4 28672 0 - Live 0x0000000000000000
> mac_hid 16384 0 - Live 0x0000000000000000
> glue_helper 16384 1 aesni_intel, Live 0x0000000000000000
> acpi_cpufreq 28672 0 - Live 0x0000000000000000
> ext4 778240 1 - Live 0x0000000000000000
> crc32c_generic 16384 0 - Live 0x0000000000000000
> crc16 16384 1 ext4, Live 0x0000000000000000
> mbcache 16384 1 ext4, Live 0x0000000000000000
> jbd2 131072 1 ext4, Live 0x0000000000000000
> raid10 65536 1 - Live 0x0000000000000000
> sr_mod 28672 0 - Live 0x0000000000000000
> cdrom 77824 1 sr_mod, Live 0x0000000000000000
> md_mod 180224 2 raid10, Live 0x0000000000000000
> hid_generic 16384 0 - Live 0x0000000000000000
> usbhid 65536 1 wacom, Live 0x0000000000000000
> hid 143360 3 wacom,hid_generic,usbhid, Live 0x0000000000000000
> sd_mod 61440 3 - Live 0x0000000000000000
> ahci 40960 2 - Live 0x0000000000000000
> libahci 40960 1 ahci, Live 0x0000000000000000
> libata 278528 2 ahci,libahci, Live 0x0000000000000000
> xhci_pci 20480 0 - Live 0x0000000000000000
> scsi_mod 253952 6 uas,usb_storage,sg,sr_mod,sd_mod,libata, Live 0x0000000000000000
> crc32c_intel 24576 1 - Live 0x0000000000000000
> xhci_hcd 278528 1 xhci_pci, Live 0x0000000000000000
> 
> [8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : dma1
>   0000-0000 : pic1
>   0000-0000 : timer0
>   0000-0000 : timer1
>   0000-0000 : keyboard
>   0000-0000 : PNP0800:00
>   0000-0000 : keyboard
>   0000-0000 : rtc0
>   0000-0000 : dma page reg
>   0000-0000 : pic2
>   0000-0000 : dma2
>   0000-0000 : fpu
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : vesafb
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>     0000-0000 : ACPI PM1a_EVT_BLK
>     0000-0000 : ACPI PM1a_CNT_BLK
>     0000-0000 : ACPI PM_TMR
>     0000-0000 : ACPI CPU throttle
>     0000-0000 : ACPI GPE0_BLK
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:02
>   0000-0000 : pnp 00:02
>   0000-0000 : pnp 00:02
>   0000-0000 : pnp 00:03
>     0000-0000 : piix4_smbus
>   0000-0000 : pnp 00:03
>     0000-0000 : piix4_smbus
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
>   0000-0000 : pnp 00:03
> 0000-0000 : PCI conf1
> 0000-0000 : PCI Bus 0000:00
>   0000-0000 : PCI Bus 0000:09
>     0000-0000 : 0000:09:00.0
>   0000-0000 : PCI Bus 0000:01
>     0000-0000 : PCI Bus 0000:02
>       0000-0000 : PCI Bus 0000:06
>         0000-0000 : 0000:06:00.0
> ************* iomem
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : PCI Bus 0000:00
> 00000000-00000000 : PCI Bus 0000:00
>   00000000-00000000 : Video ROM
> 00000000-00000000 : Reserved
>   00000000-00000000 : System ROM
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : ACPI Non-volatile Storage
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : ACPI Non-volatile Storage
> 00000000-00000000 : Reserved
> 00000000-00000000 : System RAM
> 00000000-00000000 : Reserved
> 00000000-00000000 : PCI Bus 0000:00
>   00000000-00000000 : PCI Bus 0000:09
>     00000000-00000000 : 0000:09:00.0
>     00000000-00000000 : 0000:09:00.0
>   00000000-00000000 : PCI MMCONFIG 0000 [bus 00-3f]
>     00000000-00000000 : Reserved
>       00000000-00000000 : pnp 00:00
>   00000000-00000000 : Reserved
>   00000000-00000000 : PCI Bus 0000:0a
>     00000000-00000000 : 0000:0a:00.3
>       00000000-00000000 : xhci-hcd
>     00000000-00000000 : 0000:0a:00.2
>       00000000-00000000 : ccp
>     00000000-00000000 : 0000:0a:00.2
>       00000000-00000000 : ccp
>   00000000-00000000 : PCI Bus 0000:01
>     00000000-00000000 : PCI Bus 0000:02
>       00000000-00000000 : PCI Bus 0000:08
>         00000000-00000000 : 0000:08:00.0
>           00000000-00000000 : xhci-hcd
>       00000000-00000000 : PCI Bus 0000:06
>         00000000-00000000 : 0000:06:00.0
>           00000000-00000000 : igb
>         00000000-00000000 : 0000:06:00.0
>           00000000-00000000 : igb
>     00000000-00000000 : 0000:01:00.1
>     00000000-00000000 : 0000:01:00.1
>       00000000-00000000 : ahci
>     00000000-00000000 : 0000:01:00.0
>       00000000-00000000 : xhci-hcd
>   00000000-00000000 : PCI Bus 0000:0b
>     00000000-00000000 : 0000:0b:00.3
>       00000000-00000000 : ICH HD audio
>     00000000-00000000 : 0000:0b:00.2
>       00000000-00000000 : ahci
>   00000000-00000000 : PCI Bus 0000:09
>     00000000-00000000 : 0000:09:00.0
>     00000000-00000000 : 0000:09:00.1
>       00000000-00000000 : ICH HD audio
>   00000000-00000000 : Reserved
>   00000000-00000000 : SB800 TCO
>   00000000-00000000 : Reserved
>     00000000-00000000 : amd_iommu
>     00000000-00000000 : IOAPIC 0
>     00000000-00000000 : IOAPIC 1
>   00000000-00000000 : Reserved
>     00000000-00000000 : pnp 00:03
> 00000000-00000000 : Reserved
>   00000000-00000000 : AMDIF030:00
>     00000000-00000000 : AMDIF030:00 AMDIF030:00
> 00000000-00000000 : Reserved
>   00000000-00000000 : HPET 0
>     00000000-00000000 : PNP0103:00
> 00000000-00000000 : Reserved
> 00000000-00000000 : Reserved
>   00000000-00000000 : AMDI0030:00
> 00000000-00000000 : pnp 00:03
> 00000000-00000000 : Reserved
> 00000000-00000000 : Reserved
> 00000000-00000000 : PCI Bus 0000:00
>   00000000-00000000 : Reserved
>     00000000-00000000 : Local APIC
>       00000000-00000000 : pnp 00:03
>   00000000-00000000 : Reserved
>     00000000-00000000 : pnp 00:03
> 00000000-00000000 : System RAM
>   00000000-00000000 : Kernel code
>   00000000-00000000 : Kernel data
>   00000000-00000000 : Kernel bss
> 00000000-00000000 : RAM buffe
> 
> [8.5.] PCI information ('lspci -vvv' as root)
> Massive, 1600 lines pasted here https://pastebin.com/AT38HeKs
> 
> [8.6.] SCSI information (from /proc/scsi/scsi)
> Attached devices:
> Host: scsi0 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD3200AAKS-7 Rev: 1B02
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi1 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD3200KS-00P Rev: 0M21
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi3 Channel: 00 Id: 00 Lun: 00
>   Vendor: HL-DT-ST Model: DVDRAM GSA-H62N  Rev: CL01
>   Type:   CD-ROM                           ANSI  SCSI revision: 05
> 
> [8.7.] Other information that might be relevant to the problem
> Uneducated speculation : the USB drive does something strange in its setup phase that windows tolerates but is lethal to the USB subsystem? I can run usbpcap if that helps. My hardware logic analyzer can't do high-speed USB2 unfortunately.
> 
> 
> Regards,
> Chris
> 

