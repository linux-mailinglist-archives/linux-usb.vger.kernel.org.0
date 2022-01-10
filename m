Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F80489BC0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 16:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbiAJPD2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 10:03:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbiAJPD1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 10:03:27 -0500
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 212ECC06173F
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 07:03:26 -0800 (PST)
Date:   Mon, 10 Jan 2022 16:03:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alujoe.com; s=key1;
        t=1641827004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=7XGb23Ev/b9HBKQVFe0sJiHIUcWyeGo3G46J30mnkms=;
        b=CjoEO/b5qjsbw3KV1Hn7bLPGFuB4jSYN6bNQpbqRnfic1ob903xd06ukIPaq6O0W4otc6T
        jmu9T9n7uMIbnL5malsU89403DxJJR9SkptlapTRb1bDfBwtLV4ua3Y2k1f3XSnf7YJXm/
        WHsEwMwiVed5ra9Xa9NlrmpA+yhS/88=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Joe Minor <joe@alujoe.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
Subject: Problem: xhci: devices can not be enumerated due to bandwidth issues
Message-ID: <YdxKuum3LFJOTSLi@trivial>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: alujoe.com
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I use an USB-C dock to connect my laptop to two external monitors and perip=
herals like mouse, keyboard, headset and webcam.
Since upgrading to kernel version 5.14.6, these devices are no longer enume=
rated after boot.
They will however function when plugged in after login.
The dock uses the DisplayLink chipset, which requires the evdi kernel modul=
e (GitHub: https://github.com/DisplayLink/evdi/).
I do not encounter this problem when blacklisting the module (which has the=
 consequence that my monitors no longer work).

Hardware:
 - Dock: Lenovo ThinkPad Hybrid USB-C with USB-A Dock
 - Laptop: Microsoft Surface Book 2

The kernel buffer contains these messages per device:
[    7.165643] usb 1-1.2.4.2.4: Not enough bandwidth for new device state.
[    7.165652] usb 1-1.2.4.2.4: can't set config #1, error -28

The last unaffected kernel version is 5.14.5.
I bisected the issue to commit 2847c46c6148 ('Revert "USB: xhci: fix U1/U2 =
handling for hardware with XHCI_INTEL_HOST quirk set"'), which also mention=
s xhci bandwidth issues.

My system information is included below. Please let me know how if you need=
 more information or if you want me to run more tests.

Thanks a lot
Joe


Kernel information:
Linux version 5.15.13-1-git (linux-git@archlinux) (gcc (GCC) 11.1.0, GNU ld=
 (GNU Binutils) 2.36.1) #13 SMP PREEMPT Sun, 09 Jan 2022 21:04:26 +0000

Output of scripts/ver_linux:
Linux trivial 5.15.13-1-git #13 SMP PREEMPT Sun, 09 Jan 2022 21:04:26 +0000=
 x86_64 GNU/Linux


GNU C               	11.1.0
GNU Make            	4.3
Binutils            	2.36.1
Util-linux          	2.37.2
Mount               	2.37.2
Module-init-tools   	29
E2fsprogs           	1.46.5
Xfsprogs            	5.14.2
PPP                 	2.4.9
Bison               	3.8.2
Flex                	2.6.4
Linux C++ Library   	6.0.29
Linux C Library     	2.33
Dynamic linker (ldd)	2.33
Procps              	3.3.17
Kbd                 	2.4.0
Console-tools       	2.4.0
Sh-utils            	9.0
Udev                	250
Modules Loaded      	8250_dw ac acpi_tad acpi_thermal_rel aesni_intel af_al=
g agpgart algif_hash algif_skcipher atomisp_gmin_platform atomisp_ov5693 bl=
uetooth bnep btbcm btintel btrtl btusb cdc_ether cec cfg80211 cmac coretemp=
 crc16 crc32c_generic crc32c_intel crc32_pclmul crct10dif_pclmul cros_ec cr=
os_ec_ishtp cryptd crypto_simd crypto_user dptf_power drm drm_kms_helper ec=
c ecdh_generic evdev evdi ext4 fat fb_sys_fops fuse ghash_clmulni_intel gpi=
o_keys hid hid_generic hid_multitouch hid_sensor_accel_3d hid_sensor_als hi=
d_sensor_gyro_3d hid_sensor_hub hid_sensor_iio_common hid_sensor_rotation h=
id_sensor_trigger i2c_algo_bit i2c_i801 i2c_smbus i915 idma64 industrialio =
industrialio_triggered_buffer input_leds int3400_thermal int3403_thermal in=
t340x_thermal_zone intel_cstate intel_gtt intel_ish_ipc intel_ishtp intel_i=
shtp_hid intel_ishtp_loader intel_lpss intel_lpss_pci intel_pch_thermal int=
el_pmc_bxt intel_powerclamp intel_rapl_common intel_rapl_msr intel_soc_dts_=
iosf intel_uncore intel_xhci_usb_role_switch ip_tables ipu3_cio2 ipu3_imgu =
irqbypass iTCO_vendor_support iTCO_wdt jbd2 joydev kfifo_buf kvm kvm_intel =
ledtrig_audio mac_hid mbcache mc mei mei_hdcp mei_me mii mousedev mwifiex m=
wifiex_pcie nls_ascii nls_cp437 pcspkr processor_thermal_device processor_t=
hermal_device_pci_legacy processor_thermal_mbox processor_thermal_rapl proc=
essor_thermal_rfim rapl rc_core rfcomm rfkill rng_core roles snd snd_hda_co=
dec snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_=
core snd_hda_intel snd_hrtimer snd_hwdep snd_intel_dspcfg snd_pcm snd_rawmi=
di snd_seq snd_seq_device snd_seq_dummy snd_seq_midi snd_seq_midi_event snd=
_timer snd_usb_audio snd_usbmidi_lib soc_button_array soundcore surfacepro3=
_button syscopyarea sysfillrect sysimgblt tpm tpm_crb tpm_tis tpm_tis_core =
ttm usbhid usbnet v4l2_async v4l2_fwnode vfat videobuf2_common videobuf2_dm=
a_sg videobuf2_memops videobuf2_v4l2 videodev x86_pkg_temp_thermal xhci_hcd=
 xhci_pci xhci_pci_renesas x_tables



CPU Info (/proc/cpuinfo):

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 3474.793
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 3784.527
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 2100.000
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 4
initial apicid	: 4
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 3391.391
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 6
initial apicid	: 6
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 4
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 2100.000
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 0
cpu cores	: 4
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 5
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 2100.000
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 1
cpu cores	: 4
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 6
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 2100.000
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 2
cpu cores	: 4
apicid		: 5
initial apicid	: 5
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:

processor	: 7
vendor_id	: GenuineIntel
cpu family	: 6
model		: 142
model name	: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
stepping	: 10
microcode	: 0xea
cpu MHz		: 2100.000
cache size	: 8192 KB
physical id	: 0
siblings	: 8
core id		: 3
cpu cores	: 4
apicid		: 7
initial apicid	: 7
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat =
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rd=
tscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons=
top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm=
2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_=
deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fa=
ult epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriorit=
y ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx =
rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm i=
da arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d
vmx flags	: vnmi preemption_timer invvpid ept_x_only ept_ad ept_1gb flexpri=
ority tsc_offset vtpr mtf vapic ept vpid unrestricted_guest ple shadow_vmcs=
 pml ept_mode_based_exec
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapg=
s taa itlb_multihit srbds
bogomips	: 4201.88
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:



Module information (/proc/modules):

snd_seq_dummy 16384 0 - Live 0x0000000000000000
snd_hrtimer 16384 1 - Live 0x0000000000000000
snd_seq_midi 20480 0 - Live 0x0000000000000000
snd_seq_midi_event 16384 1 snd_seq_midi, Live 0x0000000000000000
snd_seq 90112 9 snd_seq_dummy,snd_seq_midi,snd_seq_midi_event, Live 0x00000=
00000000000
rfcomm 90112 4 - Live 0x0000000000000000
cmac 16384 3 - Live 0x0000000000000000
algif_hash 16384 1 - Live 0x0000000000000000
algif_skcipher 16384 1 - Live 0x0000000000000000
af_alg 32768 6 algif_hash,algif_skcipher, Live 0x0000000000000000
bnep 28672 2 - Live 0x0000000000000000
btusb 65536 0 - Live 0x0000000000000000
btrtl 28672 1 btusb, Live 0x0000000000000000
btbcm 20480 1 btusb, Live 0x0000000000000000
btintel 45056 1 btusb, Live 0x0000000000000000
bluetooth 765952 33 rfcomm,bnep,btusb,btrtl,btbcm,btintel, Live 0x000000000=
0000000
ecdh_generic 16384 2 bluetooth, Live 0x0000000000000000
ecc 40960 1 ecdh_generic, Live 0x0000000000000000
cdc_ether 24576 0 - Live 0x0000000000000000
usbnet 53248 1 cdc_ether, Live 0x0000000000000000
mii 16384 1 usbnet, Live 0x0000000000000000
snd_usb_audio 356352 6 - Live 0x0000000000000000
snd_usbmidi_lib 45056 1 snd_usb_audio, Live 0x0000000000000000
snd_rawmidi 45056 2 snd_seq_midi,snd_usbmidi_lib, Live 0x0000000000000000
snd_seq_device 16384 3 snd_seq_midi,snd_seq,snd_rawmidi, Live 0x00000000000=
00000
mousedev 24576 0 - Live 0x0000000000000000
input_leds 16384 0 - Live 0x0000000000000000
joydev 28672 0 - Live 0x0000000000000000
snd_hda_codec_hdmi 73728 1 - Live 0x0000000000000000
evdi 73728 4 - Live 0x0000000000000000 (OE)
snd_hda_codec_realtek 159744 1 - Live 0x0000000000000000
snd_hda_codec_generic 98304 1 snd_hda_codec_realtek, Live 0x0000000000000000
ledtrig_audio 16384 1 snd_hda_codec_generic, Live 0x0000000000000000
hid_multitouch 32768 0 - Live 0x0000000000000000
hid_sensor_gyro_3d 20480 0 - Live 0x0000000000000000
hid_sensor_rotation 20480 0 - Live 0x0000000000000000
hid_sensor_accel_3d 20480 1 - Live 0x0000000000000000
hid_sensor_als 20480 0 - Live 0x0000000000000000
hid_sensor_trigger 20480 9 hid_sensor_gyro_3d,hid_sensor_rotation,hid_senso=
r_accel_3d,hid_sensor_als, Live 0x0000000000000000
industrialio_triggered_buffer 16384 1 hid_sensor_trigger, Live 0x0000000000=
000000
hid_sensor_iio_common 20480 5 hid_sensor_gyro_3d,hid_sensor_rotation,hid_se=
nsor_accel_3d,hid_sensor_als,hid_sensor_trigger, Live 0x0000000000000000
kfifo_buf 16384 1 industrialio_triggered_buffer, Live 0x0000000000000000
industrialio 98304 8 hid_sensor_gyro_3d,hid_sensor_rotation,hid_sensor_acce=
l_3d,hid_sensor_als,hid_sensor_trigger,industrialio_triggered_buffer,kfifo_=
buf, Live 0x0000000000000000
usbhid 65536 0 - Live 0x0000000000000000
hid_sensor_hub 24576 6 hid_sensor_gyro_3d,hid_sensor_rotation,hid_sensor_ac=
cel_3d,hid_sensor_als,hid_sensor_trigger,hid_sensor_iio_common, Live 0x0000=
000000000000
hid_generic 16384 0 - Live 0x0000000000000000
intel_ishtp_loader 24576 0 - Live 0x0000000000000000
intel_ishtp_hid 28672 0 - Live 0x0000000000000000
hid 139264 5 hid_multitouch,usbhid,hid_sensor_hub,hid_generic,intel_ishtp_h=
id, Live 0x0000000000000000
cros_ec_ishtp 20480 0 - Live 0x0000000000000000
cros_ec 20480 1 cros_ec_ishtp, Live 0x0000000000000000
mac_hid 16384 0 - Live 0x0000000000000000
nls_ascii 16384 1 - Live 0x0000000000000000
nls_cp437 20480 1 - Live 0x0000000000000000
vfat 24576 1 - Live 0x0000000000000000
fat 86016 1 vfat, Live 0x0000000000000000
8250_dw 20480 0 - Live 0x0000000000000000
iTCO_wdt 16384 0 - Live 0x0000000000000000
intel_pmc_bxt 16384 1 iTCO_wdt, Live 0x0000000000000000
iTCO_vendor_support 16384 1 iTCO_wdt, Live 0x0000000000000000
mei_hdcp 24576 0 - Live 0x0000000000000000
intel_rapl_msr 20480 0 - Live 0x0000000000000000
gpio_keys 20480 0 - Live 0x0000000000000000
i915 3051520 21 - Live 0x0000000000000000
x86_pkg_temp_thermal 20480 0 - Live 0x0000000000000000
intel_powerclamp 20480 0 - Live 0x0000000000000000
coretemp 20480 0 - Live 0x0000000000000000
kvm_intel 274432 0 - Live 0x0000000000000000
kvm 1056768 1 kvm_intel, Live 0x0000000000000000
snd_hda_intel 57344 4 - Live 0x0000000000000000
snd_intel_dspcfg 20480 1 snd_hda_intel, Live 0x0000000000000000
snd_hda_codec 176128 4 snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_cod=
ec_generic,snd_hda_intel, Live 0x0000000000000000
snd_hwdep 16384 2 snd_usb_audio,snd_hda_codec, Live 0x0000000000000000
irqbypass 16384 1 kvm, Live 0x0000000000000000
crct10dif_pclmul 16384 1 - Live 0x0000000000000000
crc32_pclmul 16384 0 - Live 0x0000000000000000
mwifiex_pcie 53248 0 - Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
mwifiex 327680 1 mwifiex_pcie, Live 0x0000000000000000
aesni_intel 380928 4 - Live 0x0000000000000000
crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000
cryptd 28672 3 ghash_clmulni_intel,crypto_simd, Live 0x0000000000000000
rapl 16384 0 - Live 0x0000000000000000
snd_hda_core 110592 5 snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_code=
c_generic,snd_hda_intel,snd_hda_codec, Live 0x0000000000000000
intel_cstate 20480 0 - Live 0x0000000000000000
intel_uncore 204800 0 - Live 0x0000000000000000
cfg80211 1048576 1 mwifiex, Live 0x0000000000000000
i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
snd_pcm 151552 5 snd_usb_audio,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_cod=
ec,snd_hda_core, Live 0x0000000000000000
intel_gtt 20480 1 i915, Live 0x0000000000000000
ttm 81920 1 i915, Live 0x0000000000000000
snd_timer 45056 3 snd_hrtimer,snd_seq,snd_pcm, Live 0x0000000000000000
pcspkr 16384 0 - Live 0x0000000000000000
ipu3_cio2 45056 0 - Live 0x0000000000000000
snd 114688 35 snd_seq,snd_usb_audio,snd_usbmidi_lib,snd_rawmidi,snd_seq_dev=
ice,snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_=
intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_timer, Live 0x0000000000000000
drm_kms_helper 311296 2 evdi,i915, Live 0x0000000000000000
ipu3_imgu 225280 0 - Live 0x0000000000000000 (C)
v4l2_fwnode 32768 1 ipu3_cio2, Live 0x0000000000000000
processor_thermal_device_pci_legacy 16384 0 - Live 0x0000000000000000
v4l2_async 28672 2 ipu3_cio2,v4l2_fwnode, Live 0x0000000000000000
i2c_i801 32768 0 - Live 0x0000000000000000
intel_soc_dts_iosf 20480 1 processor_thermal_device_pci_legacy, Live 0x0000=
000000000000
videobuf2_dma_sg 16384 2 ipu3_cio2,ipu3_imgu, Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
i2c_smbus 20480 1 i2c_i801, Live 0x0000000000000000
processor_thermal_device 20480 1 processor_thermal_device_pci_legacy, Live =
0x0000000000000000
syscopyarea 16384 2 evdi,drm_kms_helper, Live 0x0000000000000000
videobuf2_memops 20480 1 videobuf2_dma_sg, Live 0x0000000000000000
rfkill 28672 7 bluetooth,cfg80211, Live 0x0000000000000000
sysfillrect 16384 2 evdi,drm_kms_helper, Live 0x0000000000000000
videobuf2_v4l2 36864 2 ipu3_cio2,ipu3_imgu, Live 0x0000000000000000
processor_thermal_rfim 16384 1 processor_thermal_device, Live 0x00000000000=
00000
tpm_crb 20480 0 - Live 0x0000000000000000
sysimgblt 16384 2 evdi,drm_kms_helper, Live 0x0000000000000000
processor_thermal_mbox 16384 2 processor_thermal_device,processor_thermal_r=
fim, Live 0x0000000000000000
atomisp_ov5693 36864 0 - Live 0x0000000000000000 (C)
fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000
videobuf2_common 69632 5 ipu3_cio2,ipu3_imgu,videobuf2_dma_sg,videobuf2_mem=
ops,videobuf2_v4l2, Live 0x0000000000000000
processor_thermal_rapl 20480 1 processor_thermal_device, Live 0x00000000000=
00000
atomisp_gmin_platform 40960 1 atomisp_ov5693, Live 0x0000000000000000 (C)
cec 49152 2 i915,drm_kms_helper, Live 0x0000000000000000
intel_rapl_common 28672 2 intel_rapl_msr,processor_thermal_rapl, Live 0x000=
0000000000000
intel_lpss_pci 28672 0 - Live 0x0000000000000000
intel_ish_ipc 28672 0 - Live 0x0000000000000000
intel_pch_thermal 20480 0 - Live 0x0000000000000000
videodev 266240 6 ipu3_cio2,ipu3_imgu,v4l2_async,videobuf2_v4l2,atomisp_ov5=
693,videobuf2_common, Live 0x0000000000000000
rc_core 61440 1 cec, Live 0x0000000000000000
mei_me 45056 1 - Live 0x0000000000000000
intel_xhci_usb_role_switch 16384 0 - Live 0x0000000000000000
intel_lpss 16384 1 intel_lpss_pci, Live 0x0000000000000000
roles 16384 1 intel_xhci_usb_role_switch, Live 0x0000000000000000
mei 151552 3 mei_hdcp,mei_me, Live 0x0000000000000000
intel_ishtp 61440 4 intel_ishtp_loader,intel_ishtp_hid,cros_ec_ishtp,intel_=
ish_ipc, Live 0x0000000000000000
idma64 20480 0 - Live 0x0000000000000000
evdev 28672 22 - Live 0x0000000000000000
mc 65536 7 snd_usb_audio,ipu3_cio2,ipu3_imgu,videobuf2_v4l2,atomisp_ov5693,=
videobuf2_common,videodev, Live 0x0000000000000000
tpm_tis 16384 0 - Live 0x0000000000000000
tpm_tis_core 28672 1 tpm_tis, Live 0x0000000000000000
tpm 94208 3 tpm_crb,tpm_tis,tpm_tis_core, Live 0x0000000000000000
surfacepro3_button 20480 0 - Live 0x0000000000000000
rng_core 16384 1 tpm, Live 0x0000000000000000
int3400_thermal 20480 0 - Live 0x0000000000000000
acpi_thermal_rel 16384 1 int3400_thermal, Live 0x0000000000000000
int3403_thermal 20480 0 - Live 0x0000000000000000
soc_button_array 20480 0 - Live 0x0000000000000000
dptf_power 16384 0 - Live 0x0000000000000000
int340x_thermal_zone 20480 2 processor_thermal_device,int3403_thermal, Live=
 0x0000000000000000
acpi_tad 20480 0 - Live 0x0000000000000000
ac 20480 0 - Live 0x0000000000000000
drm 626688 14 evdi,i915,ttm,drm_kms_helper, Live 0x0000000000000000
fuse 151552 7 - Live 0x0000000000000000
crypto_user 16384 0 - Live 0x0000000000000000
agpgart 53248 2 ttm,drm, Live 0x0000000000000000
ip_tables 32768 0 - Live 0x0000000000000000
x_tables 53248 1 ip_tables, Live 0x0000000000000000
ext4 937984 1 - Live 0x0000000000000000
crc32c_generic 16384 0 - Live 0x0000000000000000
crc16 16384 2 bluetooth,ext4, Live 0x0000000000000000
mbcache 16384 1 ext4, Live 0x0000000000000000
jbd2 163840 1 ext4, Live 0x0000000000000000
xhci_pci 20480 0 - Live 0x0000000000000000
xhci_pci_renesas 20480 1 xhci_pci, Live 0x0000000000000000
crc32c_intel 24576 2 - Live 0x0000000000000000
xhci_hcd 315392 1 xhci_pci, Live 0x0000000000000000



Loaded driver and hardware information (/proc/ioports /proc/iomem):

0000-0000 : PCI Bus 0000:00
  0000-0000 : dma1
  0000-0000 : pic1
  0000-0000 : timer0
  0000-0000 : timer1
  0000-0000 : keyboard
  0000-0000 : keyboard
  0000-0000 : rtc0
  0000-0000 : dma page reg
  0000-0000 : pic2
  0000-0000 : dma2
  0000-0000 : fpu
  0000-0000 : iTCO_wdt
    0000-0000 : iTCO_wdt
  0000-0000 : pnp 00:03
0000-0000 : PCI conf1
0000-0000 : PCI Bus 0000:00
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
    0000-0000 : ACPI PM1a_EVT_BLK
    0000-0000 : ACPI PM1a_CNT_BLK
    0000-0000 : ACPI PM_TMR
    0000-0000 : ACPI CPU throttle
    0000-0000 : ACPI PM2_CNT_BLK
    0000-0000 : pnp 00:05
    0000-0000 : ACPI GPE0_BLK
  0000-0000 : pnp 00:02
  0000-0000 : PCI Bus 0000:02
    0000-0000 : 0000:02:00.0
  0000-0000 : 0000:00:02.0
  0000-0000 : 0000:00:1f.4
    0000-0000 : i801_smbus
  0000-0000 : pnp 00:03
    0000-0000 : pnp 00:03
      0000-0000 : pnp 00:03
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:00
    00000000-00000000 : System ROM
00000000-00000000 : System RAM
  00000000-00000000 : Kernel code
  00000000-00000000 : Kernel rodata
  00000000-00000000 : Kernel data
  00000000-00000000 : Kernel bss
00000000-00000000 : Reserved
  00000000-00000000 : pnp 00:00
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : ACPI Non-volatile Storage
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : ACPI Non-volatile Storage
00000000-00000000 : ACPI Tables
00000000-00000000 : System RAM
00000000-00000000 : Reserved
  00000000-00000000 : Graphics Stolen Memory
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : pnp 00:07
  00000000-00000000 : PCI Bus 0000:02
    00000000-00000000 : 0000:02:00.0
  00000000-00000000 : 0000:00:02.0
  00000000-00000000 : PCI Bus 0000:02
    00000000-00000000 : 0000:02:00.0
    00000000-00000000 : 0000:02:00.0
    00000000-00000000 : 0000:02:00.0
  00000000-00000000 : 0000:00:02.0
  00000000-00000000 : 0000:00:05.0
    00000000-00000000 : 0000:00:05.0
  00000000-00000000 : PCI Bus 0000:01
    00000000-00000000 : 0000:01:00.0
      00000000-00000000 : Marvell mwifiex PCIe
    00000000-00000000 : 0000:01:00.0
      00000000-00000000 : Marvell mwifiex PCIe
  00000000-00000000 : PCI Bus 0000:03
    00000000-00000000 : 0000:03:00.0
      00000000-00000000 : nvme
  00000000-00000000 : 0000:00:14.0
    00000000-00000000 : xhci-hcd
      00000000-00000000 : intel_xhci_usb_sw
  00000000-00000000 : 0000:00:14.3
    00000000-00000000 : 0000:00:14.3
  00000000-00000000 : 0000:00:1f.3
  00000000-00000000 : 0000:00:04.0
    00000000-00000000 : proc_thermal
  00000000-00000000 : 0000:00:1f.3
    00000000-00000000 : ICH HD audio
  00000000-00000000 : 0000:00:1f.2
  00000000-00000000 : 0000:00:13.0
    00000000-00000000 : intel_ish_ipc
  00000000-00000000 : 0000:00:14.2
    00000000-00000000 : Intel PCH thermal driver
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
  00000000-00000000 : 0000:00:15.2
    00000000-00000000 : lpss_dev
      00000000-00000000 : i2c_designware.2 lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.2
      00000000-00000000 : idma64.2 idma64.2
  00000000-00000000 : 0000:00:15.3
    00000000-00000000 : lpss_dev
      00000000-00000000 : i2c_designware.3 lpss_dev
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.3
      00000000-00000000 : idma64.3 idma64.3
  00000000-00000000 : 0000:00:16.0
    00000000-00000000 : mei_me
  00000000-00000000 : 0000:00:16.4
    00000000-00000000 : mei_me
  00000000-00000000 : 0000:00:1e.0
    00000000-00000000 : lpss_dev
      00000000-00000000 : serial
    00000000-00000000 : lpss_priv
    00000000-00000000 : idma64.4
      00000000-00000000 : idma64.4 idma64.4
  00000000-00000000 : 0000:00:1f.4
00000000-00000000 : PCI MMCONFIG 0000 [bus 00-ff]
  00000000-00000000 : Reserved
    00000000-00000000 : pnp 00:07
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : pnp 00:01
  00000000-00000000 : INT344B:00
    00000000-00000000 : INT344B:00 INT344B:00
  00000000-00000000 : pnp 00:01
  00000000-00000000 : INT344B:00
    00000000-00000000 : INT344B:00 INT344B:00
  00000000-00000000 : INT344B:00
    00000000-00000000 : INT344B:00 INT344B:00
  00000000-00000000 : pnp 00:01
    00000000-00000000 : iTCO_wdt
      00000000-00000000 : iTCO_wdt iTCO_wdt
  00000000-00000000 : Reserved
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:06
  00000000-00000000 : pnp 00:01
  00000000-00000000 : pnp 00:01
  00000000-00000000 : pnp 00:01
00000000-00000000 : IOAPIC 0
00000000-00000000 : HPET 0
  00000000-00000000 : PNP0103:00
00000000-00000000 : pnp 00:07
00000000-00000000 : pnp 00:07
00000000-00000000 : pnp 00:07
00000000-00000000 : pnp 00:07
00000000-00000000 : NTC0103:00
  00000000-00000000 : NTC0103:00 NTC0103:00
00000000-00000000 : pnp 00:07
00000000-00000000 : dmar0
00000000-00000000 : dmar1
00000000-00000000 : pnp 00:07
  00000000-00000000 : Local APIC
00000000-00000000 : INT0800:00
  00000000-00000000 : pnp 00:07
00000000-00000000 : System RAM
00000000-00000000 : RAM buffer


PCI information ('lspci -vvv' as root)

00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v6/7th Gen Core Process=
or Host Bridge/DRAM Registers (rev 08)
	Subsystem: Intel Corporation Device 2015
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort+ >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 0
	Capabilities: [e0] Vendor Specific Information: Len=3D10 <?>
	Kernel driver in use: skl_uncore

00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 620 (rev =
07) (prog-if 00 [VGA controller])
	Subsystem: Microsoft Corporation Device 0028
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 143
	IOMMU group: 1
	Region 0: Memory at d3000000 (64-bit, non-prefetchable) [size=3D16M]
	Region 2: Memory at b0000000 (64-bit, prefetchable) [size=3D256M]
	Region 4: I/O ports at 4000 [size=3D64]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=3D128K]
	Capabilities: [40] Vendor Specific Information: Len=3D0c <?>
	Capabilities: [70] Express (v2) Root Complex Integrated Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag- RBE+ FLReset+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
	Capabilities: [ac] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
		Address: fee00018  Data: 0000
	Capabilities: [d0] Power Management version 2
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [100 v1] Process Address Space ID (PASID)
		PASIDCap: Exec- Priv-, Max PASID Width: 14
		PASIDCtl: Enable- Exec- Priv-
	Capabilities: [200 v1] Address Translation Service (ATS)
		ATSCap:	Invalidate Queue Depth: 00
		ATSCtl:	Enable+, Smallest Translation Unit: 00
	Capabilities: [300 v1] Page Request Interface (PRI)
		PRICtl: Enable- Reset-
		PRISta: RF- UPRGI- Stopped+
		Page Request Capacity: 00008000, Page Request Allocation: 00000000
	Kernel driver in use: i915
	Kernel modules: i915

00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-=
1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
	Subsystem: Intel Corporation Device 2015
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 2
	Region 0: Memory at d47b0000 (64-bit, non-prefetchable) [size=3D32K]
	Capabilities: [90] MSI: Enable- Count=3D1/1 Maskable- 64bit-
		Address: 00000000  Data: 0000
	Capabilities: [d0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [e0] Vendor Specific Information: Len=3D0c <?>
	Kernel driver in use: proc_thermal
	Kernel modules: processor_thermal_device_pci_legacy

00:05.0 Multimedia controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5=
/6th Gen Core Processor Imaging Unit (rev 01)
	Subsystem: Intel Corporation Device 2015
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 140
	IOMMU group: 3
	Region 0: Memory at d4000000 (64-bit, non-prefetchable) [virtual] [size=3D=
4M]
	Capabilities: [90] MSI: Enable- Count=3D1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [a0] PCI Advanced Features
		AFCap: TP+ FLR+
		AFCtrl: FLR-
		AFStatus: TP-
	Capabilities: [d0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D3 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
	Kernel driver in use: ipu3-imgu
	Kernel modules: ipu3_imgu

00:13.0 Non-VGA unclassified device: Intel Corporation Sunrise Point-LP Int=
egrated Sensor Hub (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 20
	IOMMU group: 4
	Region 0: Memory at d47c0000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Kernel driver in use: intel_ish_ipc
	Kernel modules: intel_ish_ipc

00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Con=
troller (rev 21) (prog-if 30 [XHCI])
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 134
	IOMMU group: 5
	Region 0: Memory at d4780000 (64-bit, non-prefetchable) [size=3D64K]
	Capabilities: [70] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D375mA PME(D0-,D1-,D2-,D3hot+,D3c=
old+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [80] MSI: Enable+ Count=3D1/8 Maskable- 64bit+
		Address: 00000000fee00398  Data: 0000
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

00:14.2 Signal processing controller: Intel Corporation Sunrise Point-LP Th=
ermal subsystem (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Interrupt: pin C routed to IRQ 18
	IOMMU group: 5
	Region 0: Memory at d47c1000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [80] MSI: Enable- Count=3D1/1 Maskable- 64bit-
		Address: 00000000  Data: 0000
	Kernel driver in use: intel_pch_thermal
	Kernel modules: intel_pch_thermal

00:14.3 Multimedia controller: Intel Corporation CSI-2 Host Controller (rev=
 01)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Interrupt: pin A routed to IRQ 141
	IOMMU group: 5
	Region 0: Memory at d4790000 (64-bit, non-prefetchable) [size=3D64K]
	Capabilities: [90] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
		Address: 00000000fee00478  Data: 0000
	Capabilities: [d0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Kernel driver in use: ipu3-cio2
	Kernel modules: ipu3_cio2

00:15.0 Signal processing controller: Intel Corporation Sunrise Point-LP Se=
rial IO I2C Controller #0 (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 6
	Region 0: Memory at d47c2000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [90] Vendor Specific Information: Len=3D14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:15.1 Signal processing controller: Intel Corporation Sunrise Point-LP Se=
rial IO I2C Controller #1 (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 17
	IOMMU group: 6
	Region 0: Memory at d47c3000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [90] Vendor Specific Information: Len=3D14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:15.2 Signal processing controller: Intel Corporation Sunrise Point-LP Se=
rial IO I2C Controller #2 (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin C routed to IRQ 18
	IOMMU group: 6
	Region 0: Memory at d47c4000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [90] Vendor Specific Information: Len=3D14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:15.3 Signal processing controller: Intel Corporation Sunrise Point-LP Se=
rial IO I2C Controller #3 (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin D routed to IRQ 19
	IOMMU group: 6
	Region 0: Memory at d47c5000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [90] Vendor Specific Information: Len=3D14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:16.0 Communication controller: Intel Corporation Sunrise Point-LP CSME H=
ECI #1 (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 138
	IOMMU group: 7
	Region 0: Memory at d47c6000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot+,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [8c] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
		Address: 00000000fee003b8  Data: 0000
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:16.4 Communication controller: Intel Corporation Device 9d3e (rev 21)
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 139
	IOMMU group: 7
	Region 0: Memory at d47c7000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot+,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [8c] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
		Address: 00000000fee003d8  Data: 0000
	Kernel driver in use: mei_me
	Kernel modules: mei_me

00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Por=
t #1 (rev f1) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 122
	IOMMU group: 8
	Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-latency=3D0
	I/O behind bridge: 0000f000-00000fff [disabled]
	Memory behind bridge: fff00000-000fffff [disabled]
	Prefetchable memory behind bridge: 00000000d4400000-00000000d45fffff [size=
=3D2M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #1, Speed 8GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1u=
s, L1 <16us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM L0s L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (downgraded), Width x1 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #0, PowerLimit 10.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled=
, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- Equaliz=
ationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
		Address: fee00218  Data: 0000
	Capabilities: [90] Subsystem: Intel Corporation Device 7270
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0+,D1-,D2-,D3hot+,D3col=
d+)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [100 v0] Null
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl=
- DirectTrans-
		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl=
- DirectTrans-
	Capabilities: [200 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D40us PortTPowerOnTime=3D44us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
			   T_CommonMode=3D70us LTR1.2_Threshold=3D98304ns
		L1SubCtl2: T_PwrOn=3D44us
	Capabilities: [220 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Kernel driver in use: pcieport

00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Por=
t #5 (rev f1) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 123
	IOMMU group: 9
	Bus: primary=3D00, secondary=3D02, subordinate=3D02, sec-latency=3D0
	I/O behind bridge: 00003000-00003fff [size=3D4K]
	Memory behind bridge: c0000000-d2ffffff [size=3D304M]
	Prefetchable memory behind bridge: 0000000090000000-00000000a1ffffff [size=
=3D288M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 256 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #5, Speed 8GT/s, Width x4, ASPM not supported
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+
			Slot #4, PowerLimit 25.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq+ LinkChg+
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled=
, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ Equaliz=
ationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
		Address: fee00238  Data: 0000
	Capabilities: [90] Subsystem: Intel Corporation Device 7270
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0+,D1-,D2-,D3hot+,D3col=
d+)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [100 v0] Null
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl=
- DirectTrans-
		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl=
- DirectTrans-
	Capabilities: [200 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D40us PortTPowerOnTime=3D44us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
			   T_CommonMode=3D255us LTR1.2_Threshold=3D163840ns
		L1SubCtl2: T_PwrOn=3D44us
	Capabilities: [220 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Kernel driver in use: pcieport

00:1d.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Por=
t #9 (rev f1) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 124
	IOMMU group: 10
	Bus: primary=3D00, secondary=3D03, subordinate=3D03, sec-latency=3D0
	I/O behind bridge: 0000f000-00000fff [disabled]
	Memory behind bridge: d4600000-d46fffff [size=3D1M]
	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff [disa=
bled]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0
			ExtTag- RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #9, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <16us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #8, PowerLimit 25.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCap: CRSVisible-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABC, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled=
, ARIFwd+
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete+ Equaliz=
ationPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
		Address: fee00258  Data: 0000
	Capabilities: [90] Subsystem: Intel Corporation Device 7270
	Capabilities: [a0] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0+,D1-,D2-,D3hot+,D3col=
d+)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [100 v0] Null
	Capabilities: [140 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd- EgressCtrl=
- DirectTrans-
		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl=
- DirectTrans-
	Capabilities: [200 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D40us PortTPowerOnTime=3D44us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
			   T_CommonMode=3D40us LTR1.2_Threshold=3D65536ns
		L1SubCtl2: T_PwrOn=3D44us
	Capabilities: [220 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Kernel driver in use: pcieport

00:1e.0 Signal processing controller: Intel Corporation Sunrise Point-LP Se=
rial IO UART Controller #0 (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 20
	IOMMU group: 11
	Region 0: Memory at d47c8000 (64-bit, non-prefetchable) [size=3D4K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D3 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [90] Vendor Specific Information: Len=3D14 <?>
	Kernel driver in use: intel-lpss
	Kernel modules: intel_lpss_pci

00:1f.0 ISA bridge: Intel Corporation Sunrise Point LPC Controller/eSPI Con=
troller (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dmedium >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	IOMMU group: 12

00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	IOMMU group: 12
	Region 0: Memory at d47bc000 (32-bit, non-prefetchable) [disabled] [size=
=3D16K]

00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21) =
(prog-if 80)
	Subsystem: Intel Corporation Device 7270
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Interrupt: pin A routed to IRQ 154
	IOMMU group: 12
	Region 0: Memory at d47b8000 (64-bit, non-prefetchable) [size=3D16K]
	Region 4: Memory at d47a0000 (64-bit, non-prefetchable) [size=3D64K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D55mA PME(D0-,D1-,D2-,D3hot+,D3co=
ld+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [60] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
		Address: 00000000fee004d8  Data: 0000
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
	Subsystem: Intel Corporation Device 7270
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort- <TAbort=
- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 16
	IOMMU group: 12
	Region 0: Memory at d47c9000 (64-bit, non-prefetchable) [size=3D256]
	Region 4: I/O ports at efa0 [size=3D32]
	Kernel driver in use: i801_smbus
	Kernel modules: i2c_i801

01:00.0 Ethernet controller: Marvell Technology Group Ltd. 88W8897 [AVASTAR=
] 802.11ac Wireless
	Subsystem: Device 0007:045e
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 142
	IOMMU group: 13
	Region 0: Memory at d4500000 (64-bit, prefetchable) [size=3D1M]
	Region 2: Memory at d4400000 (64-bit, prefetchable) [size=3D1M]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,D2-,D3hot+,D3c=
old+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [50] MSI: Enable+ Count=3D1/32 Maskable+ 64bit+
		Address: 00000000fee004b8  Data: 0000
		Masking: fffffffe  Pending: 00000000
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <1us, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 10.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <=
1us, L1 unlimited
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L0s L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x1 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- Retimer- 2Retimers- D=
RS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- Equalizat=
ionPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+=
 ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCC=
hkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Device Serial Number 00-00-00-00-00-00-00-00
	Capabilities: [150 v1] Power Budgeting <?>
	Capabilities: [160 v1] Latency Tolerance Reporting
		Max snoop latency: 1034240ns
		Max no snoop latency: 1034240ns
	Capabilities: [168 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D70us PortTPowerOnTime=3D10us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
			   T_CommonMode=3D0us LTR1.2_Threshold=3D98304ns
		L1SubCtl2: T_PwrOn=3D44us
	Kernel driver in use: mwifiex_pcie
	Kernel modules: mwifiex_pcie

02:00.0 3D controller: NVIDIA Corporation GP106M [GeForce GTX 1060 Mobile] =
(rev a1)
	Subsystem: Microsoft Corporation Device 0024
	Physical Slot: 4
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 255
	IOMMU group: 14
	Region 0: Memory at d2000000 (32-bit, non-prefetchable) [disabled] [size=
=3D16M]
	Region 1: Memory at c0000000 (64-bit, prefetchable) [disabled] [size=3D256=
M]
	Region 3: Memory at d0000000 (64-bit, prefetchable) [disabled] [size=3D32M]
	Region 5: I/O ports at 3000 [disabled] [size=3D128]
	Expansion ROM at 90000000 [disabled] [size=3D512K]
	Capabilities: [60] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [78] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 256 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <1=
us, L1 <4us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s (ok), Width x4 (downgraded)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range AB, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Via message, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ Equalizat=
ionPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Virtual Channel
		Caps:	LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=3DFixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3Dff
			Status:	NegoPending- InProgress-
	Capabilities: [250 v1] Latency Tolerance Reporting
		Max snoop latency: 3145728ns
		Max no snoop latency: 3145728ns
	Capabilities: [258 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D255us PortTPowerOnTime=3D10us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
			   T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
		L1SubCtl2: T_PwrOn=3D10us
	Capabilities: [128 v1] Power Budgeting <?>
	Capabilities: [420 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+=
 ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCC=
hkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [600 v1] Vendor Specific Information: ID=3D0001 Rev=3D1 Len=
=3D024 <?>
	Capabilities: [900 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0

03:00.0 Non-Volatile memory controller: SK hynix PC401 NVMe Solid State Dri=
ve 256GB (prog-if 02 [NVM Express])
	Subsystem: SK hynix PC401 NVMe Solid State Drive 256GB
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 16
	NUMA node: 0
	IOMMU group: 15
	Region 0: Memory at d4600000 (64-bit, non-prefetchable) [size=3D16K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA PME(D0-,D1-,D2-,D3hot-,D3col=
d-)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [70] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unli=
mited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 25.000W
		DevCtl:	CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop- FLReset-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <64us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Via message, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp+ ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis+ LTR+ OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ Equalizat=
ionPhase1+
			 EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [b0] MSI-X: Enable+ Count=3D19 Masked-
		Vector table: BAR=3D0 offset=3D00002000
		PBA: BAR=3D0 offset=3D00003000
	Capabilities: [100 v2] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+=
 ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn+ ECRCChkCap+ ECRCC=
hkEn+
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [148 v1] Device Serial Number 00-00-00-00-00-00-00-00
	Capabilities: [158 v1] Power Budgeting <?>
	Capabilities: [168 v1] Alternative Routing-ID Interpretation (ARI)
		ARICap:	MFVC- ACS-, Next Function: 0
		ARICtl:	MFVC- ACS-, Function Group: 0
	Capabilities: [178 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [2b8 v1] Latency Tolerance Reporting
		Max snoop latency: 2097152ns
		Max no snoop latency: 2097152ns
	Capabilities: [2c0 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates+
			  PortCommonModeRestoreTime=3D10us PortTPowerOnTime=3D10us
		L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1- ASPM_L1.2+ ASPM_L1.1-
			   T_CommonMode=3D0us LTR1.2_Threshold=3D65536ns
		L1SubCtl2: T_PwrOn=3D44us
	Kernel driver in use: nvme



Output of lsusb:

Bus 002 Device 009: ID 03f0:0620 HP, Inc USB3.1 Hub
Bus 002 Device 008: ID 03f0:0620 HP, Inc USB3.1 Hub
Bus 002 Device 007: ID 17ef:a357 Lenovo USB3.1 Hub
Bus 002 Device 006: ID 17ef:a359 Lenovo ThinkPad Lan
Bus 002 Device 005: ID 17e9:6015 DisplayLink ThinkPad Hybrid USB-C with USB=
-A Dock
Bus 002 Device 004: ID 17ef:a356 Lenovo USB3.1 Hub
Bus 002 Device 003: ID 045e:0943 Microsoft Corp. L2 USB3 Gen1 Hub
Bus 002 Device 002: ID 045e:0941 Microsoft Corp. L1 USB3 Gen1 Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 045e:091e Microsoft Corp. XBOX ACC
Bus 001 Device 008: ID 1286:204c Marvell Semiconductor, Inc. Bluetooth and =
Wireless LAN Composite
Bus 001 Device 006: ID 045e:0922 Microsoft Corp. Surface Keyboard
Bus 001 Device 012: ID 1235:8212 Focusrite-Novation Scarlett 4i4 USB
Bus 001 Device 020: ID 04d9:0348 Holtek Semiconductor, Inc. Keyboard
Bus 001 Device 021: ID 046d:c07d Logitech, Inc. G502 Mouse
Bus 001 Device 013: ID 17ef:a354 Lenovo Billboard Device
Bus 001 Device 010: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 018: ID 0951:16a4 Kingston Technology HyperX 7.1 Audio
Bus 001 Device 015: ID 046d:085b Logitech, Inc. Logitech Webcam C925e
Bus 001 Device 011: ID 03f0:1647 HP, Inc Z27n G2 Monitor Hub
Bus 001 Device 009: ID 03f0:1647 HP, Inc Z27n G2 Monitor Hub
Bus 001 Device 007: ID 17ef:1029 Lenovo USB2.0 Hub
Bus 001 Device 005: ID 17ef:1028 Lenovo USB2.0 Hub
Bus 001 Device 004: ID 045e:0944 Microsoft Corp. L2 USB2 Hub
Bus 001 Device 002: ID 045e:0942 Microsoft Corp. L1 USB2 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub




