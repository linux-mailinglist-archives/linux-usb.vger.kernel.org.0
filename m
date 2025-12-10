Return-Path: <linux-usb+bounces-31351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF7CB1FCB
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 06:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 828E630208CA
	for <lists+linux-usb@lfdr.de>; Wed, 10 Dec 2025 05:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A1A2FF65F;
	Wed, 10 Dec 2025 05:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN6YF3dU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971B2FFFA8
	for <linux-usb@vger.kernel.org>; Wed, 10 Dec 2025 05:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765344812; cv=none; b=qdRNCz4/LOY4bafyu86qK1fKDHNdl1rWh4YW1JDZ0c++xaWBzJ9trpSNQcqRrrScf9lEy1MVN5nBKpUjdZpDCNP1j+Bl0fz6G0IRevy6dVGj1Pqwf3FP3HfiKBsZh4JUq967j6t/I2NQtSMOUY+0mkTvm8gc6LRV2yGpOIfsi30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765344812; c=relaxed/simple;
	bh=ixuoSp0cKGSnfAmYDCMIvO36fPKPGuG6wuZ5Y8qION8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvvyQO6q1TywWUlSkmHJktrHyuMeqcFs0185Nex5FYrYMnF7sNf1w/VE3/WaP7yk8sDlk5jyBw7SuJdZ9b4CcncPLVfoDSMgNh45IIzVT2cWHGMFLGby4P0AFGTpOBlH46r3rondRkG2rwLxkr83Q1eDwm1pcCVoXv29wqj0g+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nN6YF3dU; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7f216280242so138840b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 21:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765344808; x=1765949608; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OUwVSDE+yzR8NisQvAY6zN/yONwBTAunk1nJzMTDags=;
        b=nN6YF3dUJSZhQTyavswmS72VL2EUzj5qNCB/2n4y2BBz62priYn/JaWa5n5cBu+TFw
         7mxwp4BrBuXs084shKw33xm0ZfabQANWR/4EpXmq0Qu9YZD7KHN3nqJrkAXf+GI1NgG1
         1eBsacFc4/WWAg4fjLWZ5y7RSU0J9g5andyISS22jAWVoGvmNIBDIEZB9cW/Q80yikQQ
         IVSL3FI2P4sfkC/mk6BTyTthWwzrosgA5cP1AXyGZYYd97X+OjEUExZuzUtwPwGIGBNS
         ufHTzyI42JTlhGR7O1c1xDLOBHr79nZ5OznFel1PVeLhGVa8tAanH+UsOOGBdv7wudZm
         rpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765344808; x=1765949608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUwVSDE+yzR8NisQvAY6zN/yONwBTAunk1nJzMTDags=;
        b=ZPaB2eSYJRO9cQ2JREwNpAnYTEojB6qchZKk0Gn4+5gmhLtne4SwKgKiLPkhAcpMJJ
         L9DVPsD7Ujg5ug0lKK7nI4Ws51Jvy7072xIX3OAg2hxpZyRcJj0CT/FXP6YiG1rgWxBX
         hIJYwaq8tl9RtwcOPQwFpr4yPbOwhO0ppUNbPVVUC9O0p57pa+dSKlBihgKQcM5RFc/A
         wwdvmpw0BCVF5JfYqO0m+yvfNVrPrCOLyE7Cc3C283SvG36pVGEHJbpx/H4aax6iZezy
         ddDhgrYGaxUAZ8Lqn39s4nPMMkgTE2LDE/EdASKAkyORqgYXSnMm1DLmM0iBEK6g0Hq0
         PzwA==
X-Forwarded-Encrypted: i=1; AJvYcCUdMPX0RbTC8wih9zWEEyLac3i/wiP1mGZIues6FZz7IRKiOshnqsBRkHFlDFcI8qWzfKARnDwPUkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXiGXjIXf6KY9BfbRKc0gchM8o5pu7GQ4Tuf9Aa3iyR5HBoakD
	gBlRwkIUkhP7agCvVtWZ+m6vlEdfKgTrQDV2HW0sHieyj1JuklcQVZxE
X-Gm-Gg: ASbGncvWxDh8t6igcb+Zo54BLawC0r3t2EBt7a//PfIfkiXvJ/0F1P3hxiYvLfxTaxM
	m/e9imdIlgrBZKCaw4l3Vn87eHpoim6LrIZZ+3JIcronuBSz+jRNy/CvN4OlQdsMz+jR3U3/QM4
	ZFv/INybMWOH/8/f72Kz3hVEMdYESQiqprfQlMrpDitLfi8xQC8qr1SRuYua3EqgqSv7ypVfcOx
	OowQPhO4ub/DcKHzA8C6CLAP0rfIVR/E2YEhKtKKtW6n7tnbYiuBjm8B7+pdYkUBqJYb1tUyXQN
	R6uRgBNgfxjl7ImqEH1D6YuLjineW2GeCzf2tNvnJiRhikGjlwC17qwsHdTXVE7NzDDFsYCU03f
	Nj7sUHQ8UWYF2KNr/9D07krrW2okFQKZbVM4bUnj/9S4YXwP+/9SGD6tTBYnEGDoWpGxR37/Xgo
	3nbVaB
X-Google-Smtp-Source: AGHT+IGzvp2LArDO/xpisYofczDDu0L4W5k+NsdnDb3es5lh8FqpWeHW7bePKXmtjDhFNbLp7tOv0A==
X-Received: by 2002:a05:6a21:33aa:b0:366:14b0:4b18 with SMTP id adf61e73a8af0-366db90cf45mr1133944637.35.1765344808241;
        Tue, 09 Dec 2025 21:33:28 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae6fcc87sm18017398b3a.49.2025.12.09.21.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:33:27 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Wed, 10 Dec 2025 13:33:20 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Sanath.S@amd.com, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <64roqxsxgv7mtmftbn77hlviz45he2kf5juhk6e6oh5ol7hmhh@r56njiqyghqk>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Sanath.S@amd.com, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
 <cc9cfa46-ff93-4fff-9333-23f959e14fa8@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc9cfa46-ff93-4fff-9333-23f959e14fa8@amd.com>

On Tue, Dec 09, 2025 at 10:49:46AM -0600, Mario Limonciello wrote:
> +Sanath too
> 
> On 12/9/2025 1:06 AM, Mika Westerberg wrote:
> > +Mario since this is AMD related.
> > 
> > [Also keeping all the context].
> > 
> 
> Thanks for adding me.  A few other thoughts I have:
> 
> 1) Is it possible that the USB4 controller in the monitor is powering up or
> exiting a low power state during the first hotplug?
That's a good point. We currently only have one TB4 monitor.
I'll check with out QA to see if we have other TB4 devices to try.

The issue can't be reproduced with TB3 monitor or TB3 storage.
> 
> 2) Are you sure this only happens on AMD host?  What if you cold boot the
> monitor with Intel host?
The issue could be reproduced with Intel host, too.
I addressed this in reply to Mika's email.

> 
> 
> > On Tue, Dec 09, 2025 at 01:41:41PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > When plugging in a Dell U2725QE Thunderbolt monitor, the kernel produces
> > > a call trace during initial enumeration. The device automatically
> > > disconnects and reconnects ~3 seconds later, and works correctly on the
> > > second attempt.
> > > 
> > > Issue Description:
> > > ==================
> > > The Dell U2725QE (USB4 device 8087:b26) requires additional time during
> > > link width negotiation from single lane to dual lane. On first plug, the
> > > following sequence occurs:
> > > 
> > > 1. Port state reaches TB_PORT_UP (link established, single lane)
> > > 2. Path activation begins immediately
> > > 3. tb_path_activate() - > tb_port_write() returns -ENOTCONN (error -107)
> > > 4. Call trace is generated at tb_path_activate()
> > > 5. Device disconnects/reconnects automatically after ~3 seconds
> > > 6. Second attempt succeeds with full dual-lane bandwidth
> > > 
> > > First attempt dmesg (failure):
> > > -------------------------------
> > > [   36.030347] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 9000/9000 Mb/s
> > > [   36.030613] thunderbolt 0000:c7:00.6: 2: USB3 tunnel creation failed
> > > [   36.031530] thunderbolt 0000:c7:00.6: PCIe Down path activation failed
> > > [   36.031531] WARNING: drivers/thunderbolt/path.c:589 at 0x0, CPU#12: pool-/usr/libex/3145
> > > 
> > > Second attempt dmesg (success):
> > > --------------------------------
> > > [   40.440012] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 36000/36000 Mb/s
> > > [   40.440261] thunderbolt 0000:c7:00.6: 2:16: maximum required bandwidth for USB3 tunnel 9000 Mb/s
> > > [   40.440269] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): activating
> > > [   40.440271] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s
> > > 
> > > The bandwidth difference (9000 vs 36000 Mb/s) indicates the first attempt
> > > occurs while the link is still in single-lane mode.
> > > 
> > > Root Cause Analysis:
> > > ====================
> > > The error originates from the Thunderbolt/USB4 device hardware itself:
> > > 
> > > 1. Port config space read/write returns TB_CFG_ERROR_PORT_NOT_CONNECTED
> > > 2. This gets translated to -ENOTCONN in tb_cfg_get_error()
> > > 3. The port's control channel is temporarily unavailable during state
> > >     transition from single lane to dual lane (lane bonding)
> > > 
> > > The comment in drivers/thunderbolt/ctl.c explains this is expected:
> > >    "Port is not connected. This can happen during surprise removal.
> > >     Do not warn."
> > > 
> > > Attempted Solutions:
> > > ====================
> > > 1. Retry logic on -ENOTCONN in tb_path_activate():
> > >     Result: Caused host port (0:0) lockup with hundreds of "downstream
> > >     port is locked" errors. Rejected by user.
> > > 
> > > 2. Increased tb_port_wait_for_link_width() timeout from 100ms to 3000ms:
> > >     Result: Did not resolve the issue. The timeout increase alone is
> > >     insufficient because the port state hasn't reached TB_PORT_UP when
> > >     lane bonding is attempted.
> > > 
> > > 3. Added msleep(2000) at various points in enumeration flow:
> > >     Locations tested:
> > >     - Before tb_switch_configure(): Works ✓
> > >     - Before tb_switch_add(): Works ✓
> > >     - Before usb4_port_hotplug_enable(): Works ✓
> > >     - After tb_switch_add(): Doesn't work ✗
> > >     - In tb_configure_link(): Doesn't work ✗
> > >     - In tb_switch_lane_bonding_enable(): Doesn't work ✗
> > >     - In tb_port_wait_for_link_width(): Doesn't work ✗
> > > 
> > >     The pattern shows the delay must occur BEFORE hotplug enable, which
> > >     happens early in tb_switch_port_hotplug_enable() -> usb4_port_hotplug_enable().
> > > 
> > > Current Workaround:
> > > ===================
> > > Add a 2-second delay in tb_wait_for_port() when the port state reaches
> > > TB_PORT_UP. This is the earliest point where we know:
> > > - The link is physically established
> > > - The device is responsive
> > > - But lane width negotiation may still be in progress
> > > 
> > > This location is chosen because:
> > > 1. It's called during port enumeration before any tunnel creation
> > > 2. The port has just transitioned to TB_PORT_UP state
> > > 3. Allows sufficient time for lane bonding to complete
> > > 4. Avoids affecting other code paths
> > > 
> > > Testing Results:
> > > ================
> > > With this patch:
> > > - No call trace on first plug
> > > - Device enumerates correctly on first attempt
> > > - Full bandwidth (36000 Mb/s) available immediately
> > > - No disconnect/reconnect cycle
> > > - USB and PCIe tunnels create successfully
> > > 
> > > Without this patch:
> > > - Call trace on every first plug
> > > - Only 9000 Mb/s bandwidth (single lane) on first attempt
> > > - Automatic disconnect/reconnect after ~3 seconds
> > > - Second attempt works with 36000 Mb/s
> > > 
> > > Discussion Points for RFC:
> > > ===========================
> > > 1. Is a fixed 2-second delay acceptable, or should we poll for a
> > >     specific hardware state?
> > > 
> > > 2. Should we check PORT_CS_18_TIP (Transition In Progress) bit instead
> > >     of using a fixed delay?
> > > 
> > > 3. Is there a better location for this delay in the enumeration flow?
> > > 
> > > 4. Should this be device-specific (based on vendor/device ID) or apply
> > >     to all USB4 devices?
> > > 
> > > 5. The 100ms timeout in tb_switch_lane_bonding_enable() may be too
> > >     short for other devices as well. Should we increase it universally?
> > 
> > We should understand the issue better. This is Intel Goshen Ridge based
> > monitor which I'm pretty sure does not require additional quirks, at least
> > I have not heard any issues like this. I suspect this is combination of the
> > AMD and Intel hardware that is causing the issue.
> > 
> > Looking at your dmesg, even before your issue there is suspicious log
> > entry:
> > 
> > [    5.852476] localhost kernel: [31] thunderbolt 0000:c7:00.5: acking hot unplug event on 0:6
> > [    5.852492] localhost kernel: [12] thunderbolt 0000:c7:00.5: 0:6: DP IN resource unavailable: adapter unplug
> > 
> > This causes tearing down the DP tunnel. It is unexpected for the host
> > router to send this unless you plugged monitor directly to some of the
> > Type-C ports at this time?
> > 
> > I wonder if you could take trace logs too from the issue? Instructions:
> > 
> > https://github.com/intel/tbtools?tab=readme-ov-file#tracing
> > https://github.com/intel/tbtools/wiki/Useful-Commands#tracing
> > 
> > Please provide both full dmesg and the trace.out or the merged one. That
> > would allow us to look what is going on (hopefully).
> 
> We need to be careful trusting the LLM conclusions.
> 
> Hopefully the traces requested by Mika show what's going on.
> 
> If they don't, then I think the next step will be a USB4 analyzer.
> 
> > 
> > > Hardware Details:
> > > =================
> > > Device: Dell U2725QE Thunderbolt Monitor
> > > USB4 Router: 8087:b26 (Intel USB4 controller)
> > > Host: AMD Thunderbolt 4 controller (0000:c7:00.6)
> 
> What sort of hardware is the AMD host?  PCI BDF is meaningless.
It's a Dell's ongoing project.

ubuntu@localhost:~$ lscpu
Architecture:                x86_64
  CPU op-mode(s):            32-bit, 64-bit
  Address sizes:             48 bits physical, 48 bits virtual
  Byte Order:                Little Endian
CPU(s):                      24
  On-line CPU(s) list:       0-23
Vendor ID:                   AuthenticAMD
  Model name:                AMD Ryzen AI 9 HX PRO 370 w/ Radeon 890M
    CPU family:              26
    Model:                   36
    Thread(s) per core:      2
    Core(s) per socket:      12
    Socket(s):               1
    Stepping:                0
    Frequency boost:         enabled
    CPU(s) scaling MHz:      24%
    CPU max MHz:             5157.8950
    CPU min MHz:             605.2640
    BogoMIPS:                3992.19
    Flags:                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxe
                             xt fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good amd_lbr_v2 nopl xtopology nonstop_tsc cpuid extd_apicid aperfmpe
                             rf rapl pni pclmulqdq monitor ssse3 fma cx16 sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand lahf_lm cmp_legacy
                              svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw ibs skinit wdt tce topoext perfctr_core perfctr_nb 
                             bpext perfctr_llc mwaitx cpuid_fault cpb cat_l3 cdp_l3 hw_pstate ssbd mba perfmon_v2 ibrs ibpb stibp ibrs_enhanced v
                             mmcall fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid cqm rdt_a avx512f avx512dq adx smap avx512ifma clflushop
                             t clwb avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves cqm_llc cqm_occup_llc cqm_mbm_total cqm_mbm_
                             local user_shstk avx_vnni avx512_bf16 clzero irperf xsaveerptr rdpru wbnoinvd cppc arat npt lbrv svm_lock nrip_save 
                             tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold avic v_vmsave_vmload vgif x2avic v_spec_ctrl 
                             vnmi avx512vbmi umip pku ospke avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid bu
                             s_lock_detect movdiri movdir64b overflow_recov succor smca fsrm avx512_vp2intersect flush_l1d amd_lbr_pmc_freeze
Virtualization features:     
  Virtualization:            AMD-V
Caches (sum of all):         
  L1d:                       576 KiB (12 instances)
  L1i:                       384 KiB (12 instances)
  L2:                        12 MiB (12 instances)
  L3:                        24 MiB (2 instances)
NUMA:                        
  NUMA node(s):              1
  NUMA node0 CPU(s):         0-23
Vulnerabilities:             
  Gather data sampling:      Not affected
  Ghostwrite:                Not affected
  Indirect target selection: Not affected
  Itlb multihit:             Not affected
  L1tf:                      Not affected
  Mds:                       Not affected
  Meltdown:                  Not affected
  Mmio stale data:           Not affected
  Old microcode:             Not affected
  Reg file data sampling:    Not affected
  Retbleed:                  Not affected
  Spec rstack overflow:      Mitigation; IBPB on VMEXIT only
  Spec store bypass:         Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:                Mitigation; Enhanced / Automatic IBRS; IBPB conditional; STIBP always-on; PBRSB-eIBRS Not affected; BHI Not affected
  Srbds:                     Not affected
  Tsa:                       Not affected
  Tsx async abort:           Not affected
  Vmscape:                   Mitigation; IBPB on VMEXIT

ubuntu@localhost:~$ sudo lspci -vvnns c7:00.6
c7:00.6 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Device [1022:151d] (prog-if 40 [USB4 Host Interface])
        Subsystem: Advanced Micro Devices, Inc. [AMD] Device [1022:151d]
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 47
        IOMMU group: 32
        Region 0: Memory at b0c80000 (64-bit, non-prefetchable) [size=512K]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [64] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
                DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
                LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 16GT/s, Width x16
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
                         10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
                         EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
                         FRS- TPHComp- ExtTPHComp-
                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
                         AtomicOpsCtl: ReqEn-
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
                         EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
                         Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [a0] MSI: Enable- Count=1/16 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [c0] MSI-X: Enable+ Count=16 Masked-
                Vector table: BAR=0 offset=0007e000
                PBA: BAR=0 offset=0007f000
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Kernel driver in use: thunderbolt
        Kernel modules: thunderbolt

> 
> > > 
> > > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > > ---
> > > Full dmesg log available at: https://paste.ubuntu.com/p/CXs2T4XzZ3/
> > > ---
> > >   drivers/thunderbolt/switch.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> > > index b3948aad0b955..e0c65e5fb0dca 100644
> > > --- a/drivers/thunderbolt/switch.c
> > > +++ b/drivers/thunderbolt/switch.c
> > > @@ -530,6 +530,8 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
> > >   			return 0;
> > >   		case TB_PORT_UP:
> > > +			msleep(2000);
> > > +			fallthrough;
> > >   		case TB_PORT_TX_CL0S:
> > >   		case TB_PORT_RX_CL0S:
> > >   		case TB_PORT_CL1:
> > > -- 
> > > 2.43.0
> 

