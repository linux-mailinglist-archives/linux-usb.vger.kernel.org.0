Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 381E8480AA1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Dec 2021 16:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbhL1PFW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Dec 2021 10:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbhL1PFW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Dec 2021 10:05:22 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443D3C061574
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 07:05:21 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z9so5023579edm.10
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :references:to:from:in-reply-to:content-transfer-encoding;
        bh=6Zm1jcX8ahwEkHEYEsAhf8LtqGLabhqnCFKJW5SrfEE=;
        b=bQkTYbgCZRBOVn8XyWFfZB6B3yG2lUdj05jzjnCnMNOHpnUUCHbGJBZrUBITahQy2A
         Mcg7YWj97iaPxThVGg3mgyufbPnSZEjAenIm1OkrlkOzRUowcYEpMF141KxNe+uwt06d
         OllXLn9jRMxzsIg60iye6u17aZreXm9t3PfnGZQaF32iW0cJnClKkJBr70Cj7K4+uQ+X
         A6Rfgcd1QYDBvjg0dyLuAG8kPmocwf/SzlFQvyvhpuKOCiKjWE9KuUpElhcue1H8td4j
         Bb94Xy3WzG6x2gyo8aws/gXzZsPUlh252ZgSmrpvUiEtq/hHV1xtjcb0HlKSDSBt9j5R
         TxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:references:to:from:in-reply-to
         :content-transfer-encoding;
        bh=6Zm1jcX8ahwEkHEYEsAhf8LtqGLabhqnCFKJW5SrfEE=;
        b=vpxKOvde/6KZcjmCwwsVsF7GPdwVX1e6fDPjGfH8D0d7n4jIF8RjMDXqvhuR9KnePa
         DU5ZLvkOq7OU6gUNwc+UDB4Pe/zZfBDJ6QIEWOZkPSNqikGElbN87UMV/rcGHujkoVkR
         STVqpg9ec5V5H4tpgFgxj/ajgUgB+IBfFmh22HJh+wUXNS9+i4IZiJHroBLRS8IVwYIR
         AVQ35N5wgoJid+a/HY0nrf/ax3QNjWI8CxYknNhfxWYSn33A7P4eKM5lBcfJOqDBIhKO
         nhXoePqaGYblIU/FovTBvu0dUrfa0SRmS1nQWbUc3/2MhHbjFEt4jbrYrW22Qiq1nwiT
         Q+Sg==
X-Gm-Message-State: AOAM53206/08mQCDwefm+a7+6InqPokQxCSeDWAa2lA0yWo/0v+/WnJ6
        mYYjka2a4yZxLBX6l9hoGwWsj3KWZb4=
X-Google-Smtp-Source: ABdhPJzkVaIqyDOkO3aY6Sqn2oDF84xZdpmkoJ9sTdebsAzoX3CSA+M60ySI+/DATXxAh5tBLruptw==
X-Received: by 2002:a05:6402:2682:: with SMTP id w2mr20648383edd.393.1640703919464;
        Tue, 28 Dec 2021 07:05:19 -0800 (PST)
Received: from [192.168.178.24] (host-091-097-235-249.ewe-ip-backbone.de. [91.97.235.249])
        by smtp.gmail.com with ESMTPSA id i13sm7449513eds.72.2021.12.28.07.05.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Dec 2021 07:05:19 -0800 (PST)
Message-ID: <083d3bab-df88-d2e2-9334-c8367da39e7b@gmail.com>
Date:   Tue, 28 Dec 2021 16:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: PROBLEM: USB stops working
Content-Language: en-US
References: <2d6aeefb-97ea-c6e9-0824-a918f6ec5b4c@gmail.com>
To:     linux-usb@vger.kernel.org
From:   Christian <tostc6@gmail.com>
In-Reply-To: <2d6aeefb-97ea-c6e9-0824-a918f6ec5b4c@gmail.com>
X-Forwarded-Message-Id: <2d6aeefb-97ea-c6e9-0824-a918f6ec5b4c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[1.] One line summary of the problem: USB stops working

[2.] Full description of the problem/report:

I have this problem when using the Steam client so I'm not sure if this 
is kernel related or not, but please see my notice at the end of this 
section.

When Steam is only running in the background, my entire system sound 
usually cracks. This occurs on both Steam and non-Steam games. All my 
USB devices stop working for a second. So when I write something, some 
letters do not appear on the screen, and sometimes my mouse clicks are 
not recognized either. As soon as I close steam completely, the problems 
are gone. Sometimes my entire USB driver crashes so I have to restart my 
computer to get it working again.


Note: I've already reported this bug to Valve, but I received a response 
that this error could be a problem with the USB subsystem. Github issue: 
https://github.com/ValveSoftware/steam-for-linux/issues/8322

[3.] Keywords (i.e., modules, networking, kernel): USB subsystem

[4.] Kernel information
[4.1.] Kernel version (from /proc/version): Linux version 
5.15.7-1-MANJARO (builduser@fv-az131-228) (gcc (GCC) 11.1.0, GNU ld (GNU 
Binutils) 2.36.1) #1 SMP PREEMPT Wed Dec 8 10:09:19 UTC 2021

[4.2.] Kernel .config file: N/A

[5.] Most recent kernel version which did not have the bug: N/A
[6.] Output of Oops.. message (if applicable) with symbolic information
      resolved (see Documentation/admin-guide/bug-hunting.rst): N/A
[7.] A small shell script or example program which triggers the

      problem (if possible)

Just start Steam and listen to some music or try to write something, the 
sound cracks and the letters sometimes don't appear on the screen.
[8.] Environment

[8.1.] Software (add the output of the ver_linux script here)

If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux Zimmer-PC 5.15.7-1-MANJARO #1 SMP PREEMPT Wed Dec 8 10:09:19 UTC 
2021 x86_64 GNU/Linux

GNU C                   11.1.0
GNU Make                4.3
Binutils                2.36.1
Util-linux              2.37.2
Mount                   2.37.2
Module-init-tools       29
E2fsprogs               1.46.4
Jfsutils                1.1.15
Reiserfsprogs           3.6.27
Xfsprogs                5.14.2
PPP                     2.4.9
Nfs-utils               2.5.4
Bison                   3.8.2
Flex                    2.6.4
Linux C++ Library       6.0.29
Linux C Library         2.33
Dynamic linker (ldd)    2.33
Procps                  3.3.17
Net-tools               2.10
Kbd                     2.4.0
Console-tools           2.4.0
Sh-utils                9.0
Udev                    249
Modules Loaded          acpi_cpufreq aesni_intel af_alg algif_hash 
algif_skcipher ata_generic bluetooth bnep bridge btbcm btintel btrtl 
btusb ccm ccp cdrom
cfg80211 cmac crc16 crc32c_generic crc32c_intel crc32_pclmul 
crct10dif_pclmul cryptd crypto_simd crypto_user ecdh_generic 
edac_mce_amd ext4 fam15h_power fus
e ghash_clmulni_intel i2c_piix4 ip6table_filter ip6table_mangle 
ip6table_nat ip6table_raw ip6_tables ip6table_security ipmi_devintf 
ipmi_msghandler iptable_
filter iptable_mangle iptable_nat iptable_raw ip_tables iptable_security 
ipt_REJECT irqbypass jbd2 joydev k10temp kvm kvm_amd ledtrig_audio 
libarc4 libcrc32
c libphy llc loop mac80211 mac_hid mbcache mc mdio_devres mousedev 
mxm_wmi nf_conntrack nf_conntrack_tftp nf_defrag_ipv4 nf_defrag_ipv6 
nf_nat nf_nat_tftp n
fnetlink nf_reject_ipv4 nf_reject_ipv6 nf_tables nft_chain_nat nft_ct 
nft_fib nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_objref nft_reject 
nft_reject_inet n
s ntfs3 nvidia nvidia_drm nvidia_modeset nvidia_uvm pata_acpi 
pata_atiixp pcspkr qrtr r8169 realtek rfcomm rfkill rng_core rt2800lib 
rt2800usb rt2x00lib rt2
x00usb sg snd snd_hda_codec snd_hda_codec_generic snd_hda_codec_hdmi 
snd_hda_codec_realtek snd_hda_core snd_hda_intel snd_hwdep 
snd_intel_dspcfg snd_intel_s
dw_acpi snd_pcm snd_rawmidi snd_seq_device snd_timer snd_usb_audio 
snd_usbmidi_lib soundcore sp5100_tco squashfs sr_mod stp uinput usbhid 
wmi xhci_pci x_tab
les xt_CHECKSUM xt_conntrack xt_MASQUERADE xt_tcpudp



[8.2.] Processor information (from /proc/cpuinfo):

processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 21
model           : 2
model name      : AMD FX(tm)-6300 Six-Core Processor
stepping        : 0
microcode       : 0x6000852
cpu MHz         : 1400.000
cache size      : 2048 KB
physical id     : 0
siblings        : 6
core id         : 0
cpu cores       : 3
apicid          : 16
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext 
fxsr_opt pdpe1gb rd
tscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid 
aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes 
xsave avx f16c lah
f_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 
3dnowprefetch osvw ibs xop skinit wdt fma4 tce nodeid_msr tbm topoext 
perfctr_core perfctr_nb c
pb hw_pstate ssbd ibpb vmmcall bmi1 arat npt lbrv svm_lock nrip_save 
tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold
bugs            : fxsave_leak sysret_ss_attrs null_seg spectre_v1 
spectre_v2 spec_store_bypass
bogomips        : 8403.78
TLB size        : 1536 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor       : 1
vendor_id       : AuthenticAMD
cpu family      : 21
model           : 2
model name      : AMD FX(tm)-6300 Six-Core Processor
stepping        : 0
microcode       : 0x6000852
cpu MHz         : 2106.811
cache size      : 2048 KB
physical id     : 0
siblings        : 6
core id         : 1
cpu cores       : 3
apicid          : 17
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext 
fxsr_opt pdpe1gb rd
tscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid 
aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes 
xsave avx f16c lah
f_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 
3dnowprefetch osvw ibs xop skinit wdt lwp fma4 tce nodeid_msr tbm 
topoext perfctr_core perfctr_
nb cpb hw_pstate ssbd ibpb vmmcall bmi1 arat npt lbrv svm_lock nrip_save 
tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold
bugs            : fxsave_leak sysret_ss_attrs null_seg spectre_v1 
spectre_v2 spec_store_bypass
bogomips        : 8403.78
TLB size        : 1536 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor       : 2
vendor_id       : AuthenticAMD
cpu family      : 21
model           : 2
model name      : AMD FX(tm)-6300 Six-Core Processor
stepping        : 0
microcode       : 0x6000852
cpu MHz         : 1400.000
cache size      : 2048 KB
physical id     : 0
siblings        : 6
core id         : 2
cpu cores       : 3
apicid          : 18
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext 
fxsr_opt pdpe1gb rd
tscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid 
aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes 
xsave avx f16c lah
f_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 
3dnowprefetch osvw ibs xop skinit wdt fma4 tce nodeid_msr tbm topoext 
perfctr_core perfctr_nb c
pb hw_pstate ssbd ibpb vmmcall bmi1 arat npt lbrv svm_lock nrip_save 
tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold
bugs            : fxsave_leak sysret_ss_attrs null_seg spectre_v1 
spectre_v2 spec_store_bypass
bogomips        : 8403.78
TLB size        : 1536 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor       : 3
vendor_id       : AuthenticAMD
cpu family      : 21
model           : 2
model name      : AMD FX(tm)-6300 Six-Core Processor
stepping        : 0
microcode       : 0x6000852
cpu MHz         : 2500.000
cache size      : 2048 KB
physical id     : 0
siblings        : 6
core id         : 3
cpu cores       : 3
apicid          : 19
initial apicid  : 3
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext 
fxsr_opt pdpe1gb rd
tscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid 
aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes 
xsave avx f16c lah
f_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 
3dnowprefetch osvw ibs xop skinit wdt lwp fma4 tce nodeid_msr tbm 
topoext perfctr_core perfctr_
nb cpb hw_pstate ssbd ibpb vmmcall bmi1 arat npt lbrv svm_lock nrip_save 
tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold
bugs            : fxsave_leak sysret_ss_attrs null_seg spectre_v1 
spectre_v2 spec_store_bypass
bogomips        : 8403.78
TLB size        : 1536 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor       : 4
vendor_id       : AuthenticAMD
cpu family      : 21
model           : 2
model name      : AMD FX(tm)-6300 Six-Core Processor
stepping        : 0
microcode       : 0x6000852
cpu MHz         : 2500.000
cache size      : 2048 KB
physical id     : 0
siblings        : 6
core id         : 4
cpu cores       : 3
apicid          : 20
initial apicid  : 4
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext 
fxsr_opt pdpe1gb rd
tscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid 
aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes 
xsave avx f16c lah
f_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 
3dnowprefetch osvw ibs xop skinit wdt fma4 tce nodeid_msr tbm topoext 
perfctr_core perfctr_nb c
pb hw_pstate ssbd ibpb vmmcall bmi1 arat npt lbrv svm_lock nrip_save 
tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold
bugs            : fxsave_leak sysret_ss_attrs null_seg spectre_v1 
spectre_v2 spec_store_bypass
bogomips        : 8403.78
TLB size        : 1536 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro

processor       : 5
vendor_id       : AuthenticAMD
cpu family      : 21
model           : 2
model name      : AMD FX(tm)-6300 Six-Core Processor
stepping        : 0
microcode       : 0x6000852
cpu MHz         : 1400.000
cache size      : 2048 KB
physical id     : 0
siblings        : 6
core id         : 5
cpu cores       : 3
apicid          : 21
initial apicid  : 5
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge 
mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext 
fxsr_opt pdpe1gb rd
tscp lm constant_tsc rep_good nopl nonstop_tsc cpuid extd_apicid 
aperfmperf pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 popcnt aes 
xsave avx f16c lah
f_lm cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 
3dnowprefetch osvw ibs xop skinit wdt lwp fma4 tce nodeid_msr tbm 
topoext perfctr_core perfctr_
nb cpb hw_pstate ssbd ibpb vmmcall bmi1 arat npt lbrv svm_lock nrip_save 
tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold
bugs            : fxsave_leak sysret_ss_attrs null_seg spectre_v1 
spectre_v2 spec_store_bypass
bogomips        : 8403.78
TLB size        : 1536 4K pages
clflush size    : 64
cache_alignment : 64
address sizes   : 48 bits physical, 48 bits virtual
power management: ts ttp tm 100mhzsteps hwpstate cpb eff_freq_ro



[8.3.] Module information (from /proc/modules):

ntfs3 274432 0 - Live 0x0000000000000000
rfcomm 90112 16 - Live 0x0000000000000000
ccm 20480 9 - Live 0x0000000000000000
xt_CHECKSUM 16384 1 - Live 0x0000000000000000
xt_MASQUERADE 20480 3 - Live 0x0000000000000000
xt_conntrack 16384 1 - Live 0x0000000000000000
ipt_REJECT 16384 2 - Live 0x0000000000000000
xt_tcpudp 20480 9 - Live 0x0000000000000000
nf_nat_tftp 16384 0 - Live 0x0000000000000000
nft_objref 16384 1 - Live 0x0000000000000000
nf_conntrack_tftp 20480 3 nf_nat_tftp, Live 0x0000000000000000
nft_fib_inet 16384 1 - Live 0x0000000000000000
nft_fib_ipv4 16384 1 nft_fib_inet, Live 0x0000000000000000
nft_fib_ipv6 16384 1 nft_fib_inet, Live 0x0000000000000000
nft_fib 16384 3 nft_fib_inet,nft_fib_ipv4,nft_fib_ipv6, Live 
0x0000000000000000
nft_reject_inet 16384 7 - Live 0x0000000000000000
nf_reject_ipv4 16384 2 ipt_REJECT,nft_reject_inet, Live 0x0000000000000000
nf_reject_ipv6 24576 1 nft_reject_inet, Live 0x0000000000000000
mousedev 24576 0 - Live 0x0000000000000000
joydev 28672 0 - Live 0x0000000000000000
nft_reject 16384 1 nft_reject_inet, Live 0x0000000000000000
nft_ct 20480 19 - Live 0x0000000000000000
nft_chain_nat 16384 2 - Live 0x0000000000000000
nf_tables 274432 328 
nft_objref,nft_fib_inet,nft_fib_ipv4,nft_fib_ipv6,nft_fib,nft_reject_inet,nft_reject,nft_ct,nft_chain_nat, 
Live 0x0000000000000000
bridge 356352 0 - Live 0x0000000000000000
stp 16384 1 bridge, Live 0x0000000000000000
llc 16384 2 bridge,stp, Live 0x0000000000000000
ip6table_nat 16384 1 - Live 0x0000000000000000
usbhid 73728 0 - Live 0x0000000000000000
ip6table_mangle 16384 1 - Live 0x0000000000000000
ip6table_raw 16384 0 - Live 0x0000000000000000
ip6table_security 16384 0 - Live 0x0000000000000000
iptable_nat 16384 1 - Live 0x0000000000000000
nf_nat 57344 5 
xt_MASQUERADE,nf_nat_tftp,nft_chain_nat,ip6table_nat,iptable_nat, Live 
0x0000000000000000
nf_conntrack 180224 6 
xt_MASQUERADE,xt_conntrack,nf_nat_tftp,nf_conntrack_tftp,nft_ct,nf_nat, 
Live 0x0000000000000000
nf_defrag_ipv6 24576 1 nf_conntrack, Live 0x0000000000000000
nf_defrag_ipv4 16384 1 nf_conntrack, Live 0x0000000000000000
libcrc32c 16384 3 nf_tables,nf_nat,nf_conntrack, Live 0x0000000000000000
iptable_mangle 16384 1 - Live 0x0000000000000000
iptable_raw 16384 0 - Live 0x0000000000000000
iptable_security 16384 0 - Live 0x0000000000000000
cmac 16384 2 - Live 0x0000000000000000
algif_hash 16384 1 - Live 0x0000000000000000
algif_skcipher 16384 1 - Live 0x0000000000000000
af_alg 36864 6 algif_hash,algif_skcipher, Live 0x0000000000000000
bnep 32768 2 - Live 0x0000000000000000
rt2800usb 32768 0 - Live 0x0000000000000000
nfnetlink 20480 2 nf_tables, Live 0x0000000000000000
rt2x00usb 28672 1 rt2800usb, Live 0x0000000000000000
rt2800lib 147456 1 rt2800usb, Live 0x0000000000000000
rt2x00lib 98304 3 rt2800usb,rt2x00usb,rt2800lib, Live 0x0000000000000000
ip6table_filter 16384 1 - Live 0x0000000000000000
ip6_tables 36864 5 
ip6table_nat,ip6table_mangle,ip6table_raw,ip6table_security,ip6table_filter, 
Live 0x0000000000000000
mac80211 1236992 3 rt2x00usb,rt2800lib,rt2x00lib, Live 0x0000000000000000
iptable_filter 16384 1 - Live 0x0000000000000000
btusb 65536 0 - Live 0x0000000000000000
libarc4 16384 1 mac80211, Live 0x0000000000000000
btrtl 28672 1 btusb, Live 0x0000000000000000
btbcm 24576 1 btusb, Live 0x0000000000000000
snd_usb_audio 385024 4 - Live 0x0000000000000000
cfg80211 1073152 2 rt2x00lib,mac80211, Live 0x0000000000000000
btintel 45056 1 btusb, Live 0x0000000000000000
snd_usbmidi_lib 45056 1 snd_usb_audio, Live 0x0000000000000000
snd_rawmidi 53248 1 snd_usbmidi_lib, Live 0x0000000000000000
bluetooth 749568 37 rfcomm,bnep,btusb,btrtl,btbcm,btintel, Live 
0x0000000000000000
snd_seq_device 16384 1 snd_rawmidi, Live 0x0000000000000000
mc 65536 1 snd_usb_audio, Live 0x0000000000000000
ecdh_generic 16384 1 bluetooth, Live 0x0000000000000000
rfkill 32768 9 rt2x00lib,cfg80211,bluetooth, Live 0x0000000000000000
qrtr 24576 4 - Live 0x0000000000000000
ns 36864 1 qrtr, Live 0x0000000000000000
edac_mce_amd 53248 0 - Live 0x0000000000000000
kvm_amd 159744 0 - Live 0x0000000000000000
ccp 131072 1 kvm_amd, Live 0x0000000000000000
rng_core 16384 1 ccp, Live 0x0000000000000000
mxm_wmi 16384 0 - Live 0x0000000000000000
kvm 1097728 1 kvm_amd, Live 0x0000000000000000
irqbypass 16384 1 kvm, Live 0x0000000000000000
crct10dif_pclmul 16384 1 - Live 0x0000000000000000
crc32_pclmul 16384 0 - Live 0x0000000000000000
uinput 20480 0 - Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
nvidia_uvm 2576384 0 - Live 0x0000000000000000 (POE)
r8169 106496 0 - Live 0x0000000000000000
aesni_intel 380928 9 - Live 0x0000000000000000
crypto_simd 16384 1 aesni_intel, Live 0x0000000000000000
cryptd 28672 3 ghash_clmulni_intel,crypto_simd, Live 0x0000000000000000
snd_hda_codec_realtek 159744 1 - Live 0x0000000000000000
snd_hda_codec_generic 98304 1 snd_hda_codec_realtek, Live 
0x0000000000000000
realtek 36864 1 - Live 0x0000000000000000
ledtrig_audio 16384 1 snd_hda_codec_generic, Live 0x0000000000000000
snd_hda_codec_hdmi 81920 1 - Live 0x0000000000000000
mdio_devres 16384 1 r8169, Live 0x0000000000000000
libphy 167936 3 r8169,realtek,mdio_devres, Live 0x0000000000000000
pcspkr 16384 0 - Live 0x0000000000000000
snd_hda_intel 61440 4 - Live 0x0000000000000000
snd_intel_dspcfg 32768 1 snd_hda_intel, Live 0x0000000000000000
k10temp 16384 0 - Live 0x0000000000000000
fam15h_power 16384 0 - Live 0x0000000000000000
snd_intel_sdw_acpi 20480 1 snd_intel_dspcfg, Live 0x0000000000000000
nvidia_drm 73728 9 - Live 0x0000000000000000 (POE)
snd_hda_codec 184320 4 
snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel, 
Live 0x0000000000000000
snd_hda_core 118784 5 
snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec, 
Live 0x0000000000000000
snd_hwdep 16384 2 snd_usb_audio,snd_hda_codec, Live 0x0000000000000000
nvidia_modeset 1159168 23 nvidia_drm, Live 0x0000000000000000 (POE)
sp5100_tco 20480 0 - Live 0x0000000000000000
snd_pcm 163840 6 
snd_usb_audio,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_core, 
Live 0x0000000000000000
snd_timer 49152 1 snd_pcm, Live 0x0000000000000000
snd 126976 27 
snd_usb_audio,snd_usbmidi_lib,snd_rawmidi,snd_seq_device,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_
codec,snd_hwdep,snd_pcm,snd_timer, Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
i2c_piix4 36864 0 - Live 0x0000000000000000
nvidia 36966400 1393 nvidia_uvm,nvidia_modeset, Live 0x0000000000000000 
(POE)
mac_hid 16384 0 - Live 0x0000000000000000
wmi 45056 1 mxm_wmi, Live 0x0000000000000000
acpi_cpufreq 32768 0 - Live 0x0000000000000000
squashfs 77824 9 - Live 0x0000000000000000
loop 40960 18 - Live 0x0000000000000000
ipmi_devintf 20480 0 - Live 0x0000000000000000
ipmi_msghandler 77824 1 ipmi_devintf, Live 0x0000000000000000
sg 45056 0 - Live 0x0000000000000000
crypto_user 24576 0 - Live 0x0000000000000000
fuse 176128 9 - Live 0x0000000000000000
ip_tables 36864 5 
iptable_nat,iptable_mangle,iptable_raw,iptable_security,iptable_filter, 
Live 0x0000000000000000
x_tables 57344 17 
xt_CHECKSUM,xt_MASQUERADE,xt_conntrack,ipt_REJECT,xt_tcpudp,ip6table_nat,ip6table_mangle,ip6table_raw,ip6table_security,iptable_nat,iptabl
e_mangle,iptable_raw,iptable_security,ip6table_filter,ip6_tables,iptable_filter,ip_tables, 
Live 0x0000000000000000
ext4 1003520 2 - Live 0x0000000000000000
crc32c_generic 16384 0 - Live 0x0000000000000000
crc16 16384 2 bluetooth,ext4, Live 0x0000000000000000
mbcache 16384 1 ext4, Live 0x0000000000000000
jbd2 192512 1 ext4, Live 0x0000000000000000
ata_generic 16384 0 - Live 0x0000000000000000
pata_acpi 16384 0 - Live 0x0000000000000000
sr_mod 28672 0 - Live 0x0000000000000000
crc32c_intel 24576 5 - Live 0x0000000000000000
pata_atiixp 16384 1 - Live 0x0000000000000000
cdrom 81920 1 sr_mod, Live 0x0000000000000000
xhci_pci 20480 0 - Live 0x0000000000000000


[8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)

0000-0000 : PCI Bus 0000:00
  0000-0000 : dma1
  0000-0000 : pic1
  0000-0000 : timer0
  0000-0000 : timer1
  0000-0000 : keyboard
  0000-0000 : PNP0800:00
  0000-0000 : keyboard
  0000-0000 : rtc0
  0000-0000 : dma page reg
  0000-0000 : pic2
  0000-0000 : dma2
  0000-0000 : PNP0C04:00
    0000-0000 : fpu
  0000-0000 : 0000:00:14.1
    0000-0000 : pata_atiixp
  0000-0000 : 0000:00:14.1
    0000-0000 : pata_atiixp
  0000-0000 : pnp 00:04
  0000-0000 : 0000:00:14.1
    0000-0000 : pata_atiixp
0000-0000 : PCI Bus 0000:00
  0000-0000 : vesafb
0000-0000 : PCI Bus 0000:00
  0000-0000 : 0000:00:14.1
    0000-0000 : pata_atiixp
  0000-0000 : serial
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:06
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
    0000-0000 : ACPI PM1a_EVT_BLK
    0000-0000 : ACPI PM1a_CNT_BLK
    0000-0000 : ACPI PM_TMR
    0000-0000 : ACPI CPU throttle
    0000-0000 : ACPI GPE0_BLK
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : piix4_smbus
  0000-0000 : pnp 00:03
    0000-0000 : piix4_smbus
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
  0000-0000 : pnp 00:03
0000-0000 : PCI conf1
0000-0000 : PCI Bus 0000:00
  0000-0000 : PCI Bus 0000:06
    0000-0000 : 0000:06:00.0
  0000-0000 : PCI Bus 0000:01
    0000-0000 : 0000:01:00.0
  0000-0000 : 0000:00:14.1
    0000-0000 : pata_atiixp
  0000-0000 : 0000:00:11.0
    0000-0000 : ahci
  0000-0000 : 0000:00:11.0
    0000-0000 : ahci
  0000-0000 : 0000:00:11.0
    0000-0000 : ahci
  0000-0000 : 0000:00:11.0
    0000-0000 : ahci
  0000-0000 : 0000:00:11.0
    0000-0000 : ahci
  0000-0000 : pnp 00:03



00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : PCI Bus 0000:00
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : Video ROM
00000000-00000000 : Reserved
  00000000-00000000 : System ROM
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : ACPI Non-volatile Storage
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : ACPI Non-volatile Storage
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : RAM buffer
00000000-00000000 : PCI Bus 0000:00
  00000000-00000000 : PCI Bus 0000:01
    00000000-00000000 : 0000:01:00.0
    00000000-00000000 : 0000:01:00.0
      00000000-00000000 : vesafb
  00000000-00000000 : PCI Bus 0000:06
    00000000-00000000 : 0000:06:00.0
  00000000-00000000 : PCI MMCONFIG 0000 [bus 00-ff]
    00000000-00000000 : pnp 00:00
  00000000-00000000 : PCI Bus 0000:01
    00000000-00000000 : 0000:01:00.0
      00000000-00000000 : nvidia
    00000000-00000000 : 0000:01:00.1
      00000000-00000000 : ICH HD audio
  00000000-00000000 : PCI Bus 0000:06
    00000000-00000000 : 0000:06:00.0
      00000000-00000000 : r8169
  00000000-00000000 : PCI Bus 0000:05
    00000000-00000000 : 0000:05:00.0
      00000000-00000000 : xhci-hcd
  00000000-00000000 : PCI Bus 0000:02
    00000000-00000000 : 0000:02:00.0
      00000000-00000000 : xhci-hcd
  00000000-00000000 : 0000:00:14.2
    00000000-00000000 : ICH HD audio
  00000000-00000000 : 0000:00:16.2
    00000000-00000000 : ehci_hcd
  00000000-00000000 : 0000:00:16.0
    00000000-00000000 : ohci_hcd
  00000000-00000000 : 0000:00:14.5
    00000000-00000000 : ohci_hcd
  00000000-00000000 : 0000:00:13.2
    00000000-00000000 : ehci_hcd
  00000000-00000000 : 0000:00:13.0
    00000000-00000000 : ohci_hcd
  00000000-00000000 : 0000:00:12.2
    00000000-00000000 : ehci_hcd
  00000000-00000000 : 0000:00:12.0
    00000000-00000000 : ohci_hcd
  00000000-00000000 : 0000:00:11.0
    00000000-00000000 : ahci
  00000000-00000000 : amd_iommu
  00000000-00000000 : Reserved
    00000000-00000000 : IOAPIC 0
  00000000-00000000 : Reserved
    00000000-00000000 : pnp 00:03
  00000000-00000000 : Reserved
    00000000-00000000 : IOAPIC 1
  00000000-00000000 : Reserved
    00000000-00000000 : HPET 0
      00000000-00000000 : PNP0103:00
  00000000-00000000 : Reserved
    00000000-00000000 : pnp 00:03
  00000000-00000000 : Reserved
    00000000-00000000 : pnp 00:03
      00000000-00000000 : SB800 TCO
  00000000-00000000 : Local APIC
    00000000-00000000 : pnp 00:03
  00000000-00000000 : Reserved
    00000000-00000000 : pnp 00:03
00000000-00000000 : System RAM
  00000000-00000000 : Kernel code
  00000000-00000000 : Kernel rodata
  00000000-00000000 : Kernel data
  00000000-00000000 : Kernel bss


[8.5.] PCI information ('lspci -vvv' as root)

00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD9x0/RX980 
Host Bridge (rev 02)
        Subsystem: ASRock Incorporation Device 5a14
        Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ >SERR- <PERR- INTx-
        NUMA node: 0
        IOMMU group: 0
        Capabilities: <access denied>

00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 I/O 
Memory Management Unit (IOMMU)
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 
I/O Memory Management Unit (IOMMU)
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 26
        NUMA node: 0
        Capabilities: <access denied>

00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] 
RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GFX port 0) (prog-if 00 
[Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 28
        NUMA node: 0
        IOMMU group: 1
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        I/O behind bridge: 0000e000-0000efff [size=4K]
        Memory behind bridge: fd000000-fe0fffff [size=17M]
        Prefetchable memory behind bridge: 
00000000c0000000-00000000d1ffffff [size=288M]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA+ VGA16+ MAbort- >Reset- 
FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: <access denied>
        Kernel driver in use: pcieport

00:09.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] 
RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP Port 4) (prog-if 00 
[Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 29
        NUMA node: 0
        IOMMU group: 2
        Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
        I/O behind bridge: 0000f000-00000fff [disabled]
        Memory behind bridge: fe300000-fe3fffff [size=1M]
        Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- 
FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: <access denied>
        Kernel driver in use: pcieport

00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 SATA Controller [AHCI mode] (rev 40) (prog-if 01 [AHCI 
1.0])
        Subsystem: ASRock Incorporation Device 4391
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32
        Interrupt: pin A routed to IRQ 19
        NUMA node: 0
        IOMMU group: 3
        Region 0: I/O ports at f090 [size=8]
        Region 1: I/O ports at f080 [size=4]
        Region 2: I/O ports at f070 [size=8]
        Region 3: I/O ports at f060 [size=4]
        Region 4: I/O ports at f050 [size=16]
        Region 5: Memory at fe40b000 (32-bit, non-prefetchable) [size=1K]
        Capabilities: <access denied>
        Kernel driver in use: ahci

00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
        Subsystem: ASRock Incorporation Device 4397
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 18
        NUMA node: 0
        IOMMU group: 4
        Region 0: Memory at fe40a000 (32-bit, non-prefetchable) [size=4K]
        Kernel driver in use: ohci-pci

00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
        Subsystem: ASRock Incorporation Device 4396
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 17
        NUMA node: 0
        IOMMU group: 4
        Region 0: Memory at fe409000 (32-bit, non-prefetchable) [size=256]
        Capabilities: <access denied>
        Kernel driver in use: ehci-pci

00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
        Subsystem: ASRock Incorporation Device 4397
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 18
        NUMA node: 0
        IOMMU group: 5
        Region 0: Memory at fe408000 (32-bit, non-prefetchable) [size=4K]
        Kernel driver in use: ohci-pci

00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
        Subsystem: ASRock Incorporation Device 4396
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 17
        NUMA node: 0
        IOMMU group: 5
        Region 0: Memory at fe407000 (32-bit, non-prefetchable) [size=256]
        Capabilities: <access denied>
        Kernel driver in use: ehci-pci

00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus 
Controller (rev 42)
        Subsystem: ASRock Incorporation Device 4385
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0
        IOMMU group: 6
        Kernel driver in use: piix4_smbus
        Kernel modules: i2c_piix4, sp5100_tco

00:14.1 IDE interface: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 IDE Controller (rev 40) (prog-if 8a [ISA Compatibility 
mode controller, supp
orts both channels switched to PCI native mode, supports bus mastering])
        Subsystem: ASRock Incorporation Device 439c
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32
        Interrupt: pin B routed to IRQ 17
        NUMA node: 0
        IOMMU group: 7
        Region 0: I/O ports at 01f0 [size=8]
        Region 1: I/O ports at 03f4
        Region 2: I/O ports at 0170 [size=8]
        Region 3: I/O ports at 0374
        Region 4: I/O ports at f000 [size=16]
        Kernel driver in use: pata_atiixp
        Kernel modules: pata_atiixp, pata_acpi, ata_generic

00:14.2 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 
Azalia (Intel HDA) (rev 40)
        Subsystem: ASRock Incorporation Device 1151
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=slow >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        NUMA node: 0
        IOMMU group: 8
        Region 0: Memory at fe400000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: <access denied>
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel

00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 LPC host controller (rev 40)
        Subsystem: ASRock Incorporation Device 439d
        Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        NUMA node: 0
        IOMMU group: 9

00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to 
PCI Bridge (rev 40) (prog-if 01 [Subtractive decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop+ 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 64
        NUMA node: 0
        IOMMU group: 10
        Bus: primary=00, secondary=03, subordinate=03, sec-latency=64
        I/O behind bridge: 0000f000-00000fff [disabled]
        Memory behind bridge: fff00000-000fffff [disabled]
        Prefetchable memory behind bridge: fff00000-000fffff [disabled]
        Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- 
FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 USB OHCI2 Controller (prog-if 10 [OHCI])
        Subsystem: ASRock Incorporation Device 4399
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin C routed to IRQ 18
        NUMA node: 0
        IOMMU group: 11
        Region 0: Memory at fe406000 (32-bit, non-prefetchable) [size=4K]
        Kernel driver in use: ohci-pci

00:15.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] 
SB700/SB800/SB900 PCI to PCI bridge (PCIE port 0) (prog-if 00 [Normal 
decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 30
        NUMA node: 0
        IOMMU group: 12
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
        I/O behind bridge: 0000f000-00000fff [disabled]
        Memory behind bridge: fff00000-000fffff [disabled]
        Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- 
FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: <access denied>
        Kernel driver in use: pcieport

00:15.2 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB900 PCI to 
PCI bridge (PCIE port 2) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 31
        NUMA node: 0
        IOMMU group: 12
        Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
        I/O behind bridge: 0000f000-00000fff [disabled]
        Memory behind bridge: fe200000-fe2fffff [size=1M]
        Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- 
FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: <access denied>
        Kernel driver in use: pcieport

00:15.3 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB900 PCI to 
PCI bridge (PCIE port 3) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 32
        NUMA node: 0
        IOMMU group: 12
        Bus: primary=00, secondary=06, subordinate=06, sec-latency=0
        I/O behind bridge: 0000d000-0000dfff [size=4K]
        Memory behind bridge: fe100000-fe1fffff [size=1M]
        Prefetchable memory behind bridge: 
00000000d2100000-00000000d21fffff [size=1M]
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16+ MAbort- >Reset- 
FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: <access denied>
        Kernel driver in use: pcieport

00:16.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
        Subsystem: ASRock Incorporation Device 4397
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 18
        NUMA node: 0
        IOMMU group: 13
        Region 0: Memory at fe405000 (32-bit, non-prefetchable) [size=4K]
        Kernel driver in use: ohci-pci

00:16.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] 
SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
        Subsystem: ASRock Incorporation Device 4396
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 17
        NUMA node: 0
        IOMMU group: 13
        Region 0: Memory at fe404000 (32-bit, non-prefetchable) [size=256]
        Capabilities: <access denied>
        Kernel driver in use: ehci-pci

00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h 
Processor Function 0
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0
        Capabilities: <access denied>

00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h 
Processor Function 1
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0

00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h 
Processor Function 2
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0

00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h 
Processor Function 3
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0
        Capabilities: <access denied>
        Kernel driver in use: k10temp
        Kernel modules: k10temp

00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h 
Processor Function 4
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0
        Kernel driver in use: fam15h_power
        Kernel modules: fam15h_power

00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 15h 
Processor Function 5
        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        NUMA node: 0

01:00.0 VGA compatible controller: NVIDIA Corporation GM107 [GeForce GTX 
750 Ti] (rev a2) (prog-if 00 [VGA controller])
        Subsystem: Gigabyte Technology Co., Ltd Device 36ca
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 45
        NUMA node: 0
        IOMMU group: 14
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at d0000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at e000 [size=128]
        Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
        Capabilities: <access denied>
        Kernel driver in use: nvidia
        Kernel modules: nouveau, nvidia_drm, nvidia

01:00.1 Audio device: NVIDIA Corporation GM107 High Definition Audio 
Controller [GeForce 940MX] (rev a1)
        Subsystem: Gigabyte Technology Co., Ltd Device 36ca
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin B routed to IRQ 43
        NUMA node: 0
        IOMMU group: 14
        Region 0: Memory at fe080000 (32-bit, non-prefetchable) [size=16K]
        Capabilities: <access denied>
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel

02:00.0 USB controller: ASMedia Technology Inc. ASM1143 USB 3.1 Host 
Controller (prog-if 30 [XHCI])
        Subsystem: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 33
        NUMA node: 0
        IOMMU group: 15
        Region 0: Memory at fe300000 (64-bit, non-prefetchable) [size=32K]
        Capabilities: <access denied>
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

05:00.0 USB controller: Etron Technology, Inc. EJ188/EJ198 USB 3.0 Host 
Controller (prog-if 30 [XHCI])
        Subsystem: ASRock Incorporation QC5000-ITX/PH
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 41
        NUMA node: 0
        IOMMU group: 12
        Region 0: Memory at fe200000 (64-bit, non-prefetchable) [size=32K]
        Capabilities: <access denied>
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci

06:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 11)
        Subsystem: ASRock Incorporation Motherboard (one of many)
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 19
        NUMA node: 0
        IOMMU group: 12
        Region 0: I/O ports at d000 [size=256]
        Region 2: Memory at fe100000 (64-bit, non-prefetchable) [size=4K]
        Region 4: Memory at d2100000 (64-bit, prefetchable) [size=16K]
        Capabilities: <access denied>
        Kernel driver in use: r8169
        Kernel modules: r8169



[8.6.] SCSI information (from /proc/scsi/scsi)

Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: ADATA SP550      Rev: 3AB
  Type:   Direct-Access                    ANSI  SCSI revision: 05
Host: scsi1 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: TOSHIBA DT01ACA3 Rev: ABB0
  Type:   Direct-Access                    ANSI  SCSI revision: 05
Host: scsi2 Channel: 00 Id: 00 Lun: 00
  Vendor: HL-DT-ST Model: DVDRAM GH24NSD1  Rev: LG00
  Type:   CD-ROM                           ANSI  SCSI revision: 05
Host: scsi4 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: ST500LM012 HN-M5 Rev: 0002
  Type:   Direct-Access                    ANSI  SCSI revision: 05

[8.7.] Other information that might be relevant to the problem
        (please look in /proc and include all information that you
        think to be relevant): N/A

[8.8] Content of lsusb:

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 011 Device 003: ID 2109:0815 VIA Labs, Inc. USB3.0 Hub
Bus 011 Device 002: ID 2109:0815 VIA Labs, Inc. USB3.0 Hub
Bus 011 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 010 Device 006: ID 0d8c:0012 C-Media Electronics, Inc. USB Audio Device
Bus 010 Device 005: ID 2109:2815 VIA Labs, Inc. USB2.0 Hub
Bus 010 Device 004: ID 093a:2521 Pixart Imaging, Inc. Optical Mouse
Bus 010 Device 003: ID 046d:c328 Logitech, Inc. Corded Keyboard K280e
Bus 010 Device 002: ID 2109:2815 VIA Labs, Inc. USB2.0 Hub
Bus 010 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 003: ID 07d1:3c0a D-Link System DWA-140 RangeBooster N 
Adapter(rev.B2) [Ralink RT3072]
Bus 001 Device 002: ID 0bda:4938 Realtek Semiconductor Corp. Realtek 
Audio USB
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 009 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 008 Device 002: ID 0a5c:2101 Broadcom Corp. BCM2045 Bluetooth
Bus 008 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

