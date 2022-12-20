Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5156528C7
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 23:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbiLTWNH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 17:13:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLTWNF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 17:13:05 -0500
Received: from mx0a-00445d01.pphosted.com (mx0a-00445d01.pphosted.com [205.220.171.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4715C1F636
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 14:13:02 -0800 (PST)
Received: from pps.filterd (m0303598.ppops.net [127.0.0.1])
        by mx0a-00445d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BKCuptj031228
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 17:13:02 -0500
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by mx0a-00445d01.pphosted.com (PPS) with ESMTPS id 3mhxxvhf0f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 17:13:01 -0500
Received: by mail-il1-f199.google.com with SMTP id e9-20020a056e020b2900b003036757d5caso9087990ilu.10
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 14:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bostondynamics.com; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4TvPB6YZD0uUw/I9w/EE9anSRZjnBPWvDENEnqaIiL8=;
        b=rOngq2bqsSyiawZ+D4BsWkV3ei5k8Add5wwx15ht4Dgv9igRzPBOPDn81HZGn903rr
         nVkR9VG4uUF4/pvVHxE26XezH3hA3+3c1ouH2+lt5/MbhogUvHidONMIgSaMs8+cPzD5
         ND2RwHuzt3SYmdIwAUQLZZUQqZAsdENnjImfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4TvPB6YZD0uUw/I9w/EE9anSRZjnBPWvDENEnqaIiL8=;
        b=48pa+26iO/L/9obnehCw3xapTqJtSGm52svLlfGZCXKrQThyUHlNv/tm02QR4USXNJ
         jUanVqkfefhfwfoehpxsQp0BsBwmAKwFnM6binVIzhpeo0xuhj0S4sPRQuEgEuVbEUpR
         GX3OE99uqZQGsGf8Ymq/3hRMD+YT3ZB4XB9EC71OR3saLWoEe2L+L6P4MNQbWMhQuK+B
         mRXuUevMF+B1wUE+LNIj26nWWdfewHmtZ3gmHeg+mP4BDdOALGNzMLzgZWZQ0TON2UTQ
         rPouvAzjyzxJ5BT8iJ/1sbiviQh+KubwRaKbzNtmYhwCeYcqtjMuSMJHxIR6RSUOwKnc
         kwvQ==
X-Gm-Message-State: ANoB5pmQX1MsUU2wHyzdH/MOFX9yKxKejDwURfPXfsW+ymoY/ASdGhNt
        GFRxsVA3T6khdN3ErUo8ql662d5VG1VD2WVlmBtGu1kpMo3Vgl7ViHyq2hYGJOg8+dZ/yD1vjwD
        taINjQ/eMXxoycfuXXq+31GxE3pYaliNNZ2eN
X-Received: by 2002:a05:6638:120f:b0:38a:be79:2d7c with SMTP id n15-20020a056638120f00b0038abe792d7cmr2608329jas.134.1671574379467;
        Tue, 20 Dec 2022 14:12:59 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JVr15AZeKgTC9cSrrlJnh1YuFD15xFSAqP6He4N8N81abM5DpT2T8WlciKBjGtmgf3TTcuy0m7DaZPOI06C4=
X-Received: by 2002:a05:6638:120f:b0:38a:be79:2d7c with SMTP id
 n15-20020a056638120f00b0038abe792d7cmr2608324jas.134.1671574378707; Tue, 20
 Dec 2022 14:12:58 -0800 (PST)
MIME-Version: 1.0
From:   Joe Bolling <jbolling@bostondynamics.com>
Date:   Tue, 20 Dec 2022 17:12:47 -0500
Message-ID: <CAHPEz-1J=PU1Qgyw9=gWbC_Z71muoXQx=jYCvB2XE=_qZySCqQ@mail.gmail.com>
Subject: PROBLEM: Error 110 from ASMedia Host Controller
To:     Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 0eKhmpSOri3dN4tZnidJFEtMivjQMlNU
X-Proofpoint-ORIG-GUID: 0eKhmpSOri3dN4tZnidJFEtMivjQMlNU
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[1.] One line summary of the problem: Error 110 from ASMedia Host Controller

[2.] Full description of the problem/report: I'm seeing a failure from
XHCI_HCD when I stream video from Intel Realsense D435 cameras through
an ASMedia ASM3042 USB host controller. The issue usually manifests as
repeated Error 110s from the camera as long as I'm trying to stream
data:
[  100.227800] usb 4-1: Failed to query (SET_CUR) UVC control 1 on
unit 3: -110 (exp. 1024).
Followed by a bit of a lockup from XHCI_HCD. lsusb will hang and I
can't get any image data from the camera. This problem seems to happen
sooner when there are multiple cameras connected and streaming. In the
logs below, I'm streaming from four cameras, two connected to an
ASM3042 and two via an Intel host controller. It seems to happen when
I stop and re-start streaming from the cameras repeatedly. dmesg and
tracing output are located in this folder:
https://bostondynamics1.box.com/s/qtn28it8avda6pvve5sowyaeff4jzlyr

[3.] Keywords (i.e., modules, networking, kernel): xhci_hcd, ASMedia,
ASM3042, Intel Realsense

[4.] Kernel version (from /proc/version): 6.1.0-rc8

[5.] Output of Oops.. message (if applicable) with symbolic information
     resolved (see Documentation/oops-tracing.txt): N/A

[6.] A small shell script or example program which triggers the
     problem (if possible): This requires the ASMedia host controller
and Intel Realsense cameras to reproduce.

[7.] Environment
[7.1.] Software (add the output of the ver_linux script here):
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux spot-Default-string 6.1.0-rc8 #1 SMP PREEMPT_DYNAMIC Wed Dec  7
21:20:21 EST 2022 x86_64 x86_64 x86_64 GNU/Linux

GNU C                   11
GNU Make                4.3
Binutils                2.38
Util-linux              2.37.2
Mount                   2.37.2
Module-init-tools       29
E2fsprogs               1.46.5
Pcmciautils             018
PPP                     2.4.9
Bison                   3.8.2
Flex                    2.6.4
Linux C++ Library       6.0.30
Dynamic linker (ldd)    2.35
Procps                  3.3.17
Kbd                     2.3.0
Console-tools           2.3.0
Sh-utils                8.32
Udev                    249
Wireless-tools          30
Modules Loaded          ac97_bus acpi_pad acpi_tad aesni_intel ahci
autofs4 binfmt_misc ccm cec cfg80211 coretemp cqhci crc32_pclmul
crct10dif_pclmul cryptd crypto_simd drm drm_buddy drm_display_helper
drm_kms_helper e1000e efi_pstore fb_sys_fops ghash_clmulni_intel
i2c_algo_bit i2c_i801 i2c_scmi i2c_smbus i915 idma64 intel_cstate
intel_lpss intel_lpss_pci intel_pch_thermal intel_powerclamp
intel_rapl_common intel_rapl_msr intel_tcc_cooling ip_tables kvm
kvm_intel ledtrig_audio libahci libarc4 lp mac80211 mac_hid mei
mei_hdcp mei_me msr nls_iso8859_1 parport parport_pc
pinctrl_cannonlake ppdev pstore_blk pstore_zone ramoops rapl rc_core
reed_solomon rt2800lib rt2800usb rt2x00lib rt2x00usb sch_fq_codel
sdhci sdhci_pci sha512_ssse3 snd snd_compress snd_hda_codec
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_codec_realtek
snd_hda_core snd_hda_ext_core snd_hda_intel snd_hwdep snd_intel_dspcfg
snd_intel_sdw_acpi snd_pcm snd_pcm_dmaengine snd_rawmidi snd_seq
snd_seq_device snd_seq_midi snd_seq_midi_event snd_soc_acpi
snd_soc_acpi_intel_match snd_soc_core snd_soc_hdac_hda snd_sof
snd_sof_intel_hda snd_sof_intel_hda_common snd_sof_pci
snd_sof_pci_intel_cnl snd_sof_utils snd_sof_xtensa_dsp snd_timer
soundcore soundwire_bus soundwire_cadence soundwire_generic_allocation
soundwire_intel syscopyarea sysfillrect sysimgblt tls ttm video wmi
wmi_bmof x86_pkg_temp_thermal xhci_pci xhci_pci_renesas x_tables

[7.2.] Processor information (from /proc/cpuinfo):
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 0
cpu cores       : 6
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 799.916
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 1
cpu cores       : 6
apicid          : 2
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 2
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 2
cpu cores       : 6
apicid          : 4
initial apicid  : 4
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 3
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 800.002
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 3
cpu cores       : 6
apicid          : 6
initial apicid  : 6
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 4
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 800.121
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 4
cpu cores       : 6
apicid          : 8
initial apicid  : 8
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 5
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 5
cpu cores       : 6
apicid          : 10
initial apicid  : 10
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 6
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 0
cpu cores       : 6
apicid          : 1
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 7
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 1
cpu cores       : 6
apicid          : 3
initial apicid  : 3
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 8
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 2
cpu cores       : 6
apicid          : 5
initial apicid  : 5
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 9
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 3
cpu cores       : 6
apicid          : 7
initial apicid  : 7
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 10
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 4
cpu cores       : 6
apicid          : 9
initial apicid  : 9
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 11
vendor_id       : GenuineIntel
cpu family      : 6
model           : 158
model name      : Intel(R) Xeon(R) E-2276ME  CPU @ 2.80GHz
stepping        : 10
microcode       : 0xf0
cpu MHz         : 2800.000
cache size      : 12288 KB
physical id     : 0
siblings        : 12
core id         : 5
cpu cores       : 6
apicid          : 11
initial apicid  : 11
fpu             : yes
fpu_exception   : yes
cpuid level     : 22
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb
invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority
ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid
mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves
dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear
flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer invvpid ept_x_only ept_ad
ept_1gb flexpriority tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest ple shadow_vmcs pml ept_mode_based_exec
bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass
l1tf mds swapgs taa itlb_multihit srbds mmio_stale_data retbleed
bogomips        : 5599.85
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

[7.3.] Module information (from /proc/modules):
uvcvideo 114688 0 - Live 0x0000000000000000
videobuf2_vmalloc 20480 1 uvcvideo, Live 0x0000000000000000
videobuf2_memops 20480 1 videobuf2_vmalloc, Live 0x0000000000000000
videobuf2_v4l2 32768 1 uvcvideo, Live 0x0000000000000000
videobuf2_common 81920 4
uvcvideo,videobuf2_vmalloc,videobuf2_memops,videobuf2_v4l2, Live
0x0000000000000000
videodev 274432 3 uvcvideo,videobuf2_v4l2,videobuf2_common, Live
0x0000000000000000
mc 73728 4 uvcvideo,videobuf2_v4l2,videobuf2_common,videodev, Live
0x0000000000000000
tls 122880 0 - Live 0x0000000000000000
ccm 20480 6 - Live 0x0000000000000000
rt2800usb 32768 0 - Live 0x0000000000000000
rt2x00usb 24576 1 rt2800usb, Live 0x0000000000000000
rt2800lib 167936 1 rt2800usb, Live 0x0000000000000000
rt2x00lib 73728 3 rt2800usb,rt2x00usb,rt2800lib, Live 0x0000000000000000
mac80211 1355776 3 rt2x00usb,rt2800lib,rt2x00lib, Live 0x0000000000000000
cfg80211 1060864 2 rt2x00lib,mac80211, Live 0x0000000000000000
libarc4 16384 1 mac80211, Live 0x0000000000000000
snd_hda_codec_hdmi 77824 1 - Live 0x0000000000000000
snd_hda_codec_realtek 159744 1 - Live 0x0000000000000000
snd_hda_codec_generic 102400 1 snd_hda_codec_realtek, Live 0x0000000000000000
ledtrig_audio 16384 1 snd_hda_codec_generic, Live 0x0000000000000000
i915 3330048 10 - Live 0x0000000000000000
snd_sof_pci_intel_cnl 16384 0 - Live 0x0000000000000000
snd_sof_intel_hda_common 172032 1 snd_sof_pci_intel_cnl, Live 0x0000000000000000
soundwire_intel 45056 1 snd_sof_intel_hda_common, Live 0x0000000000000000
soundwire_generic_allocation 16384 1 soundwire_intel, Live 0x0000000000000000
soundwire_cadence 40960 1 soundwire_intel, Live 0x0000000000000000
snd_sof_intel_hda 20480 1 snd_sof_intel_hda_common, Live 0x0000000000000000
snd_sof_pci 24576 2 snd_sof_pci_intel_cnl,snd_sof_intel_hda_common,
Live 0x0000000000000000
snd_sof_xtensa_dsp 16384 1 snd_sof_intel_hda_common, Live 0x0000000000000000
snd_sof 258048 2 snd_sof_intel_hda_common,snd_sof_pci, Live 0x0000000000000000
snd_sof_utils 20480 1 snd_sof, Live 0x0000000000000000
snd_soc_hdac_hda 24576 1 snd_sof_intel_hda_common, Live 0x0000000000000000
snd_hda_ext_core 36864 2 snd_sof_intel_hda_common,snd_soc_hdac_hda,
Live 0x0000000000000000
snd_soc_acpi_intel_match 73728 2
snd_sof_pci_intel_cnl,snd_sof_intel_hda_common, Live
0x0000000000000000
snd_soc_acpi 16384 2
snd_sof_intel_hda_common,snd_soc_acpi_intel_match, Live
0x0000000000000000
soundwire_bus 94208 3
soundwire_intel,soundwire_generic_allocation,soundwire_cadence, Live
0x0000000000000000
snd_soc_core 356352 4
snd_sof_intel_hda_common,soundwire_intel,snd_sof,snd_soc_hdac_hda,
Live 0x0000000000000000
snd_compress 24576 1 snd_soc_core, Live 0x0000000000000000
ac97_bus 16384 1 snd_soc_core, Live 0x0000000000000000
snd_pcm_dmaengine 20480 1 snd_soc_core, Live 0x0000000000000000
intel_rapl_msr 20480 0 - Live 0x0000000000000000
snd_hda_intel 53248 3 - Live 0x0000000000000000
intel_rapl_common 40960 1 intel_rapl_msr, Live 0x0000000000000000
snd_intel_dspcfg 36864 3
snd_sof_intel_hda_common,snd_sof,snd_hda_intel, Live
0x0000000000000000
intel_tcc_cooling 16384 0 - Live 0x0000000000000000
snd_intel_sdw_acpi 20480 2 snd_sof_intel_hda_common,snd_intel_dspcfg,
Live 0x0000000000000000
x86_pkg_temp_thermal 20480 0 - Live 0x0000000000000000
snd_hda_codec 167936 6
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_sof_intel_hda,snd_soc_hdac_hda,snd_hda_intel,
Live 0x0000000000000000
intel_powerclamp 20480 0 - Live 0x0000000000000000
coretemp 24576 0 - Live 0x0000000000000000
snd_hda_core 114688 9
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_sof_intel_hda_common,snd_sof_intel_hda,snd_soc_hdac_hda,snd_hda_ext_core,snd_hda_intel,snd_hda_codec,
Live 0x0000000000000000
snd_hwdep 16384 1 snd_hda_codec, Live 0x0000000000000000
kvm_intel 421888 0 - Live 0x0000000000000000
snd_pcm 151552 11
snd_hda_codec_hdmi,snd_sof_intel_hda_common,soundwire_intel,snd_sof,snd_sof_utils,snd_soc_core,snd_compress,snd_pcm_dmaengine,snd_hda_intel,snd_hda_codec,snd_hda_core,
Live 0x0000000000000000
drm_buddy 20480 1 i915, Live 0x0000000000000000
snd_seq_midi 20480 0 - Live 0x0000000000000000
binfmt_misc 24576 1 - Live 0x0000000000000000
ttm 94208 1 i915, Live 0x0000000000000000
snd_seq_midi_event 16384 1 snd_seq_midi, Live 0x0000000000000000
drm_display_helper 212992 1 i915, Live 0x0000000000000000
snd_rawmidi 45056 1 snd_seq_midi, Live 0x0000000000000000
kvm 1114112 1 kvm_intel, Live 0x0000000000000000
cec 65536 2 i915,drm_display_helper, Live 0x0000000000000000
snd_seq 73728 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000
rc_core 61440 1 cec, Live 0x0000000000000000
drm_kms_helper 221184 2 i915,drm_display_helper, Live 0x0000000000000000
snd_seq_device 16384 3 snd_seq_midi,snd_rawmidi,snd_seq, Live 0x0000000000000000
crct10dif_pclmul 16384 1 - Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
snd_timer 40960 2 snd_pcm,snd_seq, Live 0x0000000000000000
sha512_ssse3 49152 0 - Live 0x0000000000000000
i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
nls_iso8859_1 16384 1 - Live 0x0000000000000000
mei_hdcp 24576 0 - Live 0x0000000000000000
aesni_intel 389120 4 - Live 0x0000000000000000
fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000
crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000
cryptd 24576 2 ghash_clmulni_intel,crypto_simd, Live 0x0000000000000000
syscopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000
snd 114688 20 snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_sof,snd_soc_core,snd_compress,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_seq_device,snd_timer,
Live 0x0000000000000000
mei_me 49152 1 - Live 0x0000000000000000
sysfillrect 20480 1 drm_kms_helper, Live 0x0000000000000000
rapl 20480 0 - Live 0x0000000000000000
mei 139264 3 mei_hdcp,mei_me, Live 0x0000000000000000
sysimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
intel_cstate 20480 0 - Live 0x0000000000000000
wmi_bmof 16384 0 - Live 0x0000000000000000
intel_pch_thermal 20480 0 - Live 0x0000000000000000
mac_hid 16384 0 - Live 0x0000000000000000
acpi_tad 20480 0 - Live 0x0000000000000000
acpi_pad 184320 0 - Live 0x0000000000000000
sch_fq_codel 24576 6 - Live 0x0000000000000000
msr 16384 0 - Live 0x0000000000000000
drm 622592 9 i915,drm_buddy,ttm,drm_display_helper,drm_kms_helper,
Live 0x0000000000000000
parport_pc 53248 1 - Live 0x0000000000000000
ppdev 24576 0 - Live 0x0000000000000000
lp 28672 0 - Live 0x0000000000000000
parport 73728 3 parport_pc,ppdev,lp, Live 0x0000000000000000
ramoops 28672 0 - Live 0x0000000000000000
pstore_blk 16384 0 - Live 0x0000000000000000
reed_solomon 28672 1 ramoops, Live 0x0000000000000000
pstore_zone 32768 1 pstore_blk, Live 0x0000000000000000
efi_pstore 16384 0 - Live 0x0000000000000000
ip_tables 32768 0 - Live 0x0000000000000000
x_tables 53248 1 ip_tables, Live 0x0000000000000000
autofs4 45056 2 - Live 0x0000000000000000
sdhci_pci 69632 0 - Live 0x0000000000000000
e1000e 299008 0 - Live 0x0000000000000000
cqhci 36864 1 sdhci_pci, Live 0x0000000000000000
crc32_pclmul 16384 0 - Live 0x0000000000000000
ahci 49152 2 - Live 0x0000000000000000
i2c_i801 36864 0 - Live 0x0000000000000000
intel_lpss_pci 28672 0 - Live 0x0000000000000000
sdhci 81920 1 sdhci_pci, Live 0x0000000000000000
xhci_pci 24576 0 - Live 0x0000000000000000
libahci 49152 1 ahci, Live 0x0000000000000000
intel_lpss 16384 1 intel_lpss_pci, Live 0x0000000000000000
i2c_smbus 20480 1 i2c_i801, Live 0x0000000000000000
idma64 20480 0 - Live 0x0000000000000000
xhci_pci_renesas 20480 1 xhci_pci, Live 0x0000000000000000
video 65536 1 i915, Live 0x0000000000000000
i2c_scmi 20480 0 - Live 0x0000000000000000
wmi 32768 2 wmi_bmof,video, Live 0x0000000000000000
pinctrl_cannonlake 36864 2 - Live 0x0000000000000000
[7.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
spot@spot-Default-string:~$ cat /proc/ioports
0000-0000 : PCI Bus 0000:00
  0000-0000 : dma1
  0000-0000 : pic1
  0000-0000 : timer0
  0000-0000 : timer1
  0000-0000 : keyboard
  0000-0000 : keyboard
  0000-0000 : rtc_cmos
    0000-0000 : rtc0
  0000-0000 : dma page reg
  0000-0000 : pic2
  0000-0000 : dma2
  0000-0000 : fpu
    0000-0000 : PNP0C04:00
  0000-0000 : serial
  0000-0000 : serial
  0000-0000 : serial
  0000-0000 : parport0
  0000-0000 : parport0
  0000-0000 : serial
  0000-0000 : iTCO_wdt
  0000-0000 : pnp 00:07
  0000-0000 : pnp 00:01
0000-0000 : PCI conf1
0000-0000 : PCI Bus 0000:00
  0000-0000 : pnp 00:07
  0000-0000 : ACPI PM1a_EVT_BLK
  0000-0000 : ACPI PM1a_CNT_BLK
  0000-0000 : ACPI PM_TMR
  0000-0000 : ACPI PM2_CNT_BLK
  0000-0000 : pnp 00:08
  0000-0000 : ACPI GPE0_BLK
  0000-0000 : pnp 00:0b
  0000-0000 : 0000:00:02.0
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : 0000:00:17.0
    0000-0000 : ahci
  0000-0000 : 0000:00:16.3
    0000-0000 : serial
  0000-0000 : 0000:00:1f.4
    0000-0000 : i801_smbus
~$ cat /proc/iomem
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
    00000000-00000000 : System ROM
00000000-00000000 : System RAM
00000000-00000000 : System RAM
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : ACPI Tables
00000000-00000000 : ACPI Non-volatile Storage
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
  00000000-00000000 : Graphics Stolen Memory
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : 0000:00:02.0
  00000000-00000000 : 0000:00:02.0
  00000000-00000000 : 0000:00:1f.3
  00000000-00000000 : PCI Bus 0000:01
    00000000-00000000 : 0000:01:00.0
      00000000-00000000 : xhci-hcd
  00000000-00000000 : 0000:00:1f.6
    00000000-00000000 : e1000e
  00000000-00000000 : 0000:00:14.0
    00000000-00000000 : xhci-hcd
  00000000-00000000 : 0000:00:1f.3
    00000000-00000000 : ICH HD audio
  00000000-00000000 : 0000:00:17.0
    00000000-00000000 : ahci
  00000000-00000000 : 0000:00:14.2
  00000000-00000000 : 0000:00:1f.4
  00000000-00000000 : 0000:00:17.0
    00000000-00000000 : ahci
  00000000-00000000 : 0000:00:17.0
    00000000-00000000 : ahci
  00000000-00000000 : 0000:00:16.3
  00000000-00000000 : 0000:00:16.0
    00000000-00000000 : mei_me
  00000000-00000000 : 0000:00:15.0
    00000000-00000000 : lpss_dev
      00000000-00000000 : i2c_designware.0 lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.0
      00000000-00000000 : idma64.0 idma64.0
  00000000-00000000 : 0000:00:15.1
    00000000-00000000 : lpss_dev
      00000000-00000000 : i2c_designware.1 lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.1
      00000000-00000000 : idma64.1 idma64.1
  00000000-00000000 : 0000:00:14.5
    00000000-00000000 : mmc0
  00000000-00000000 : 0000:00:14.2
  00000000-00000000 : 0000:00:12.0
    00000000-00000000 : Intel PCH thermal driver
  00000000-00000000 : 0000:00:08.0
00000000-00000000 : PCI MMCONFIG 0000 [bus 00-ff]
  00000000-00000000 : Reserved
    00000000-00000000 : pnp 00:09
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : pnp 00:0a
  00000000-00000000 : INT3450:00
    00000000-00000000 : INT3450:00 INT3450:00
  00000000-00000000 : INT3450:00
    00000000-00000000 : INT3450:00 INT3450:00
  00000000-00000000 : pnp 00:0a
  00000000-00000000 : INT3450:00
    00000000-00000000 : INT3450:00 INT3450:00
  00000000-00000000 : INT3450:00
    00000000-00000000 : INT3450:00 INT3450:00
  00000000-00000000 : pnp 00:0a
  00000000-00000000 : Reserved
    00000000-00000000 : 0000:00:1f.5
  00000000-00000000 : pnp 00:0a
00000000-00000000 : Reserved
  00000000-00000000 : IOAPIC 0
00000000-00000000 : Reserved
  00000000-00000000 : HPET 0
    00000000-00000000 : PNP0103:00
00000000-00000000 : pnp 00:09
00000000-00000000 : pnp 00:09
00000000-00000000 : pnp 00:09
00000000-00000000 : pnp 00:09
00000000-00000000 : pnp 00:09
00000000-00000000 : dmar0
00000000-00000000 : dmar1
00000000-00000000 : Local APIC
  00000000-00000000 : Reserved
00000000-00000000 : Reserved
  00000000-00000000 : pnp 00:0a
00000000-00000000 : System RAM
  00000000-00000000 : Kernel code
  00000000-00000000 : Kernel rodata
  00000000-00000000 : Kernel data
  00000000-00000000 : Kernel bss

[7.5.] PCI information ('lspci -vvv' as root)
~$ sudo lspci -vvv
00:00.0 Host bridge: Intel Corporation 8th Gen Core Processor Host
Bridge/DRAM Registers (rev 07)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation 8th Gen Core Processor Host
Bridge/DRAM Registers
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ >SERR- <PERR- INTx-
        Latency: 0
        Capabilities: [e0] Vendor Specific Information: Len=10 <?>
        Kernel driver in use: skl_uncore

00:02.0 VGA compatible controller: Intel Corporation Device 3e94
(prog-if 00 [VGA controller])
        DeviceName: Onboard - Video
        Subsystem: Intel Corporation Device 2212
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 136
        Region 0: Memory at a0000000 (64-bit, non-prefetchable) [size=16M]
        Region 2: Memory at 90000000 (64-bit, prefetchable) [size=256M]
        Region 4: I/O ports at 3000 [size=64]
        Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
        Capabilities: [40] Vendor Specific Information: Len=0c <?>
        Capabilities: [70] Express (v2) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+ FLReset+
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr- TransPend-
                DevCap2: Completion Timeout: Not Supported,
TimeoutDis- NROPrPrP- LTR-
                         10BitTagComp- 10BitTagReq- OBFF Not
Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
LTR- OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
        Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
                Address: fee00018  Data: 0000
        Capabilities: [d0] Power Management version 2
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D3 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Process Address Space ID (PASID)
                PASIDCap: Exec- Priv-, Max PASID Width: 14
                PASIDCtl: Enable- Exec- Priv-
        Capabilities: [200 v1] Address Translation Service (ATS)
                ATSCap: Invalidate Queue Depth: 00
                ATSCtl: Enable-, Smallest Translation Unit: 00
        Capabilities: [300 v1] Page Request Interface (PRI)
                PRICtl: Enable- Reset-
                PRISta: RF- UPRGI- Stopped+
                Page Request Capacity: 00008000, Page Request
Allocation: 00000000
        Kernel driver in use: i915
        Kernel modules: i915

00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 /
E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 /
6th/7th/8th Gen Core Processor Gaussian Mixture Model
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 255
        Region 0: Memory at a1242000 (64-bit, non-prefetchable)
[disabled] [size=4K]
        Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [dc] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [f0] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-

00:12.0 Signal processing controller: Intel Corporation Cannon Lake
PCH Thermal Controller (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH Thermal Controller
        Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at a1241000 (64-bit, non-prefetchable) [size=4K]
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Kernel driver in use: intel_pch_thermal
        Kernel modules: intel_pch_thermal

00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI
Host Controller (rev 10) (prog-if 30 [XHCI])
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host
Controller
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 124
        Region 0: Memory at a1220000 (64-bit, non-prefetchable) [size=64K]
        Capabilities: [70] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0-,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
                Address: 00000000fee00278  Data: 0000
        Capabilities: [90] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH Shared SRAM
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Region 0: Memory at a1236000 (64-bit, non-prefetchable)
[disabled] [size=8K]
        Region 2: Memory at a1240000 (64-bit, non-prefetchable)
[disabled] [size=4K]
        Capabilities: [80] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

00:14.5 SD Host controller: Intel Corporation Device a375 (rev 10) (prog-if 01)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Device 7270
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin D routed to IRQ 19
        Region 0: Memory at a123f000 (64-bit, non-prefetchable) [size=4K]
        Capabilities: [80] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [90] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: sdhci-pci
        Kernel modules: sdhci_pci

00:15.0 Serial bus controller: Intel Corporation Cannon Lake PCH
Serial IO I2C Controller #0 (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH Serial IO I2C Controller
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at a123d000 (64-bit, non-prefetchable)
[virtual] [size=4K]
        Capabilities: [80] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [90] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: intel-lpss
        Kernel modules: intel_lpss_pci

00:15.1 Serial bus controller: Intel Corporation Cannon Lake PCH
Serial IO I2C Controller #1 (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH Serial IO I2C Controller
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 17
        Region 0: Memory at a123e000 (64-bit, non-prefetchable)
[virtual] [size=4K]
        Capabilities: [80] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [90] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: intel-lpss
        Kernel modules: intel_lpss_pci

00:16.0 Communication controller: Intel Corporation Cannon Lake PCH
HECI Controller (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH HECI Controller
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 135
        Region 0: Memory at a123c000 (64-bit, non-prefetchable) [size=4K]
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot+,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee003d8  Data: 0000
        Capabilities: [a4] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: mei_me
        Kernel modules: mei_me

00:16.3 Serial controller: Intel Corporation Cannon Lake PCH Active
Management Technology - SOL (rev 10) (prog-if 02 [16550])
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH Active Management
Technology - SOL
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin D routed to IRQ 19
        Region 0: I/O ports at 30a0 [size=8]
        Region 1: Memory at a123b000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [40] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: serial

00:17.0 SATA controller: Intel Corporation Cannon Lake Mobile PCH SATA
AHCI Controller (rev 10) (prog-if 01 [AHCI 1.0])
        DeviceName: Onboard - SATA
        Subsystem: Intel Corporation Cannon Lake Mobile PCH SATA AHCI Controller
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 123
        Region 0: Memory at a1234000 (32-bit, non-prefetchable) [size=8K]
        Region 1: Memory at a123a000 (32-bit, non-prefetchable) [size=256]
        Region 2: I/O ports at 3090 [size=8]
        Region 3: I/O ports at 3080 [size=4]
        Region 4: I/O ports at 3060 [size=32]
        Region 5: Memory at a1239000 (32-bit, non-prefetchable) [size=2K]
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
                Address: fee00258  Data: 0000
        Capabilities: [70] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot+,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004
        Kernel driver in use: ahci
        Kernel modules: ahci

00:1d.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root
Port #9 (rev f0) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 122
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        I/O behind bridge: 0000f000-00000fff [disabled]
        Memory behind bridge: a1100000-a11fffff [size=1M]
        Prefetchable memory behind bridge:
00000000fff00000-00000000000fffff [disabled]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 256 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr+ TransPend-
                LnkCap: Port #9, Speed 8GT/s, Width x1, ASPM not supported
                        ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s (ok), Width x1 (ok)
                        TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
                SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
HotPlug- Surprise-
                        Slot #12, PowerLimit 10.000W; Interlock- NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet-
CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Unknown, PwrInd Unknown,
Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt-
PresDet+ Interlock-
                        Changed: MRL- PresDet- LinkState+
                RootCap: CRSVisible-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
PMEIntEna+ CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range ABC, TimeoutDis+
NROPrPrP- LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not
Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS- LN System CLS Not Supported, TPHComp-
ExtTPHComp- ARIFwd+
                         AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
LTR+ OBFF Disabled, ARIFwd-
                         AtomicOpsCtl: ReqEn- EgressBlck-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
                Address: fee00218  Data: 0000
        Capabilities: [90] Subsystem: Intel Corporation Cannon Lake
PCH PCI Express Root Port
        Capabilities: [a0] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt+ RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap-
ECRCGenEn- ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
                RootCmd: CERptEn+ NFERptEn+ FERptEn+
                RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                         FirstFatal- NonFatalMsg- FatalMsg- IntMsg 0
                ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
        Capabilities: [140 v1] Access Control Services
                ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
UpstreamFwd- EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
UpstreamFwd- EgressCtrl- DirectTrans-
        Capabilities: [150 v1] Precision Time Measurement
                PTMCap: Requester:- Responder:+ Root:+
                PTMClockGranularity: 4ns
                PTMControl: Enabled:+ RootSelected:+
                PTMEffectiveGranularity: Unknown
        Capabilities: [220 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [250 v1] Downstream Port Containment
                DpcCap: INT Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP
PIO Log 4, DL_ActiveErr+
                DpcCtl: Trigger:1 Cmpl- INT+ ErrCor- PoisonedTLP-
SwTrigger- DL_ActiveErr-
                DpcSta: Trigger- Reason:00 INT- RPBusy- TriggerExt:00
RP PIO ErrPtr:1f
                Source: 0000
        Kernel driver in use: pcieport

00:1f.0 ISA bridge: Intel Corporation Cannon Lake LPC Controller (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake LPC Controller
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0

00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
        DeviceName: Onboard - Sound
        Subsystem: Intel Corporation Cannon Lake PCH cAVS
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 137
        Region 0: Memory at a1230000 (64-bit, non-prefetchable) [size=16K]
        Region 4: Memory at a1000000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA
PME(D0-,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [80] Vendor Specific Information: Len=14 <?>
        Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee003f8  Data: 0000
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel, snd_sof_pci_intel_cnl

00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH SMBus Controller
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at a1238000 (64-bit, non-prefetchable) [size=256]
        Region 4: I/O ports at efa0 [size=32]
        Kernel driver in use: i801_smbus
        Kernel modules: i2c_i801

00:1f.5 Serial bus controller: Intel Corporation Cannon Lake PCH SPI
Controller (rev 10)
        DeviceName: Onboard - Other
        Subsystem: Intel Corporation Cannon Lake PCH SPI Controller
        Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Region 0: Memory at fe010000 (32-bit, non-prefetchable) [size=4K]

00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (7)
I219-LM (rev 10)
        DeviceName: Onboard - Ethernet
        Subsystem: Intel Corporation Ethernet Connection (7) I219-LM
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 125
        Region 0: Memory at a1200000 (32-bit, non-prefetchable) [size=128K]
        Capabilities: [c8] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
        Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee00298  Data: 0000
        Kernel driver in use: e1000e
        Kernel modules: e1000e

01:00.0 USB controller: ASMedia Technology Inc. Device 3042 (prog-if 30 [XHCI])
        Subsystem: ASMedia Technology Inc. Device 2142
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at a1100000 (64-bit, non-prefetchable) [size=32K]
        Capabilities: [50] MSI: Enable- Count=1/8 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [68] MSI-X: Enable+ Count=8 Masked-
                Vector table: BAR=0 offset=00002000
                PBA: BAR=0 offset=00002080
        Capabilities: [78] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [80] Express (v2) Legacy Endpoint, MSI 00
                DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s
<64ns, L1 <2us
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x2, ASPM L0s L1,
Exit Latency L0s <2us, L1 unlimited
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s (ok), Width x1 (downgraded)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported,
TimeoutDis- NROPrPrP- LTR+
                         10BitTagComp- 10BitTagReq- OBFF Not
Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                         FRS-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
LTR+ OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
Retimer- 2Retimers- DRS-
                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -6dB,
EqualizationComplete+ EqualizationPhase1+
                         EqualizationPhase2+ EqualizationPhase3+
LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
                AERCap: First Error Pointer: 00, ECRCGenCap+
ECRCGenEn- ECRCChkCap- ECRCChkEn-
                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [200 v1] Secondary PCI Express
                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                LaneErrStat: 0
        Capabilities: [300 v1] Latency Tolerance Reporting
                Max snoop latency: 3145728ns
                Max no snoop latency: 3145728ns
        Capabilities: [400 v1] L1 PM Substates
                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
ASPM_L1.1+ L1_PM_Substates+
                          PortCommonModeRestoreTime=0us PortTPowerOnTime=10us
                L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                           T_CommonMode=0us LTR1.2_Threshold=81920ns
                L1SubCtl2: T_PwrOn=10us
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

[7.6.] SCSI information (from /proc/scsi/scsi)
~$ cat /proc/scsi/scsi
Attached devices:
Host: scsi1 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: SFSA480GU4AA4TO- Rev: 2055
  Type:   Direct-Access                    ANSI  SCSI revision: 05

[7.7.] Other information that might be relevant to the problem
       (please look in /proc and include all information that you
       think to be relevant):

[X.] Other notes, patches, fixes, workarounds:

Thanks,
Joe Bolling
