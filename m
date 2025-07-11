Return-Path: <linux-usb+bounces-25696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04540B011C9
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 05:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5DB644FA5
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 03:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D87E1A0712;
	Fri, 11 Jul 2025 03:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fc6ITQgD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0B19F130
	for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 03:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752206111; cv=none; b=dKvRhYh6v7c6NLxHDYhh5DK/BAn20NP5lcYKjzw+uqbtQqqBUnItXxgjMeNm0wJXpz4t1PNfFaY2M/DPsJ1xHt1/HJsaLBk5ni+nEGAYIUJIhvy/3kQyepbgaHs/CGN+uZoTehpQyF2K7DKvoRCV6fdzlTO32Raop69s6MH0QFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752206111; c=relaxed/simple;
	bh=NDje9bOdp8AzTpC90jznImgD45ucYADrs47Q1ejDu/w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=deqBUNcGQcosH8cu5m9t0r7Ab/4u5xjeVhhcwarV1lZv8hmDOyDUMzet0YZE3sgghi05Z1QkcwY6OqxVmlSbBHoomqEVPR6WL/eklSESfWRck/Z/JEiDoSA9w23UFd3oFfg7hN5lJU8+h6IVx5wz5gmbdMb+mgv6306n8kbMtcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fc6ITQgD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 31DC03F641
	for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 03:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752206099;
	bh=0znNgBCdi7THsCdSYhfRbcoXCKk4Ik3hbPTHHr884JY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	b=fc6ITQgDBQkCfyvARDLcu80cPI6JEsAIKv4f7Lz4qnFk0JvOPsCyn/kNNH+mYCkMr
	 KSesa2rKkm2/NFZCGkswbCIbeJ9DtfKLL4G/5DxoRC0+o3Z63ZMfGdIsktlWmXHQtR
	 BsgWDZM6lE/yae8z0MKzmi/as8g3K9e5vIeG7NNb8RZcJjzyS4E6E8Wf8CXj8qq+L2
	 +OoUQ7pwNQJNDwKhBUx2WY/VVvvJCbkYkcG3RW/HoDJ9iIgw7RUu9o7F4Aw7HP6ZXV
	 JMPuSUMIUiMJ7gLzRHp2Hh36Qw255Jd7LeYVyiCTFSj/83xx2qoWs3MioI3tHkjvTA
	 k2dy9t2mRz8Yw==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d290d542so9788005e9.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 20:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206099; x=1752810899;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0znNgBCdi7THsCdSYhfRbcoXCKk4Ik3hbPTHHr884JY=;
        b=YwnKtoFBp5oGajNh02hXn1wtT5TQMv0Za41DeFKuFjXLr9K82jvn3MRuB26bxFkoUw
         Hv+DVq/PPzXTScR99rwg+9F6qUkNup8oyk1qdQloVjkhJNVZckRIf81QYGFbQ31LQRwy
         2PubyV0+1TazsK4lgrwFnlZ1rKtORVpPVId7hu75yqW9YekK81A1wnYTrt6+CoQm2uWm
         DQve93JU82T/jC1KfuT7JWu/5tk2PhQY2KNUzp3p4Wzvdqed4H8FBcDzbOFYl03WWNmw
         h71yNCiCcTYObLUCrKn1h6Ydxnz0dFqcCglYsFD5f1clXjg5VLWlxVINzv1L+k746G5K
         akCg==
X-Forwarded-Encrypted: i=1; AJvYcCVeU5TOC3+Xl5138sPk5S6g9cDKY2t19vUprMBioBMwtuKZMgIdfFj5e+RGvyTGxtYef2j/Ftwl/nA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCcHfe11KfPxfL0EHbRE6YQwXwp+mTE0fAChT4P2q6e59iXojy
	clZmom+2kMM1vqg+sLyNCeMn1MbWRu0aOrJD4/cIxFL4Yz7ARolHb828uqBv/GpZC+Afnzix2h+
	egYocVhdkoyApkqKIDzkqyajo/Jr8GFWlG+F70kIJKfggtSfAMj3UICBSlPo3UgPbek0hlscTOs
	n+OwpCeFG7SgiAS+9KYZmAB5yA0RZSgHZoXgoZhygkqfCkBMtvSFA6
X-Gm-Gg: ASbGnctwBSFFExw9gOkT+y0dCzGebKfVdmn7OA9dHHFID7OzDAU8t0ifVMflb0OkXwf
	8yAEN7CtGUHKIOgY9qbIV+IsliQe2CelYoAbvwlSeIcPj4NA6iIrWitLD0smG78VSZ199nO/j7t
	tCSOKfG94Et/NS1WqeIK4Gbg==
X-Received: by 2002:a05:6000:290b:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b5f359d08dmr502718f8f.59.1752206098304;
        Thu, 10 Jul 2025 20:54:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKum5WkaNfMwvYnbv4f82Dn8gGMA/YEYNKjthkXLnnOlOhUE51+wXx88MNwzxlj3uTiy1Xc/PDtttiNe9NGKs=
X-Received: by 2002:a05:6000:290b:b0:3b3:9c75:acc6 with SMTP id
 ffacd0b85a97d-3b5f359d08dmr502701f8f.59.1752206097848; Thu, 10 Jul 2025
 20:54:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: En-Wei WU <en-wei.wu@canonical.com>
Date: Fri, 11 Jul 2025 11:54:46 +0800
X-Gm-Features: Ac12FXxU4q2aygiaU6YTJvRqFjXh60KRNzzkfEv-p7tOG5QNDHCGO62sXb8-A-Y
Message-ID: <CAMqyJG2QceTyAONn_5m956zF_rpHLpognYYWnivm7J+w6Cw=RQ@mail.gmail.com>
Subject: Thunderbolt call trace occurs on hot-plug
To: westeri@kernel.org, michael.jamet@intel.com, andreas.noever@gmail.com, 
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm seeing an issue on a Dell Pro Max 16 with Intel Arrow Lake CPU --
Hot-plugging a thunderbolt 4 cable into a thunderbolt 4 port (backed
by Intel iGPU) and connecting it to a Dell U2725QE monitor triggers
the following call trace. The issue reproduces approximately 60% of
the time.

kern :info : [ 370.181263] usb 5-11: New USB device found,
idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
kern :info : [ 370.181265] usb 5-11: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
kern :info : [ 370.181266] usb 5-11: Product: USB2.0 Hub
kern :info : [ 370.181267] usb 5-11: Manufacturer: Fresco Logic, Inc.
kern :info : [ 370.182473] hub 5-11:1.0: USB hub found
kern :debug : [ 370.182958] i915 0000:00:02.0:
[drm:intel_power_well_disable [i915]] disabling PW_2
kern :info : [ 370.183853] hub 5-11:1.0: 6 ports detected
kern :debug : [ 370.212505] [375]
thunderbolt:tb_maximum_bandwidth:788: thunderbolt 0000:00:0d.2: 0:1:
link maximum bandwidth 36000/36000 Mb/s
kern :info : [ 370.215094] usb 5-11: USB disconnect, device number 29
kern :debug : [ 370.218522] [165] thunderbolt:tb_cfg_ack_plug:842:
thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1
kern :debug : [ 370.297820] i915 0000:00:02.0: [drm:intel_dpt_create
[i915]] Allocating dpt from smem
kern :debug : [ 370.298136] i915 0000:00:02.0:
[drm:drm_mode_addfb2_ioctl] [FB:263]
kern :debug : [ 370.320677] [375]
thunderbolt:tb_maximum_bandwidth:788: thunderbolt 0000:00:0d.2: 1:1:
link maximum bandwidth 36000/36000 Mb/s
kern :debug : [ 370.320810] [375] thunderbolt:tb_tunnel_usb3:952:
thunderbolt 0000:00:0d.2: 1:16: available bandwidth for new USB3
tunnel 36000/36000 Mb/s
kern :warn : [ 370.321640] thunderbolt 0000:00:0d.2: 1: USB3 tunnel
creation failed
kern :debug : [ 370.322322] [3599]
thunderbolt:tb_tunnel_activate:2367: thunderbolt 0000:00:0d.2: 0:8 <->
1:9 (PCI): activating
kern :debug : [ 370.322328] [3599] thunderbolt:tb_path_activate:512:
thunderbolt 0000:00:0d.2: activating PCIe Down path from 0:8 to 1:9
kern :debug : [ 370.322479] [3599] thunderbolt:tb_path_activate:573:
thunderbolt 0000:00:0d.2: 1:1: Writing hop 1
kern :debug : [ 370.322481] [3599] thunderbolt:tb_dump_hop:20:
thunderbolt 0000:00:0d.2: 1:1: In HopID: 8 => Out port: 9 Out HopID: 8
kern :debug : [ 370.322483] [3599] thunderbolt:tb_dump_hop:22:
thunderbolt 0000:00:0d.2: 1:1: Weight: 1 Priority: 3 Credits: 32 Drop:
0 PM: 0
kern :debug : [ 370.322486] [3599] thunderbolt:tb_dump_hop:25:
thunderbolt 0000:00:0d.2: 1:1: Counter enabled: 0 Counter index: 2047
kern :debug : [ 370.322488] [3599] thunderbolt:tb_dump_hop:27:
thunderbolt 0000:00:0d.2: 1:1: Flow Control (In/Eg): 1/0 Shared Buffer
(In/Eg): 0/0
kern :debug : [ 370.322490] [3599] thunderbolt:tb_dump_hop:30:
thunderbolt 0000:00:0d.2: 1:1: Unknown1: 0x0 Unknown2: 0x0 Unknown3:
0x0
kern :warn : [ 370.322984] thunderbolt 0000:00:0d.2: 1:1: hop
deactivation failed for hop 1, index 8
kern :warn : [ 370.322986] ------------[ cut here ]------------
kern :warn : [ 370.322987] thunderbolt 0000:00:0d.2: PCIe Down path
activation failed
kern :warn : [ 370.323072] WARNING: CPU: 4 PID: 3599 at
drivers/thunderbolt/path.c:587 tb_path_activate+0x129/0x530
[thunderbolt]
kern :warn : [ 370.323247] CPU: 4 UID: 0 PID: 3599 Comm:
pool-/usr/libex Not tainted 6.16.0-061600rc4drmtip20250702-generic
#202507020208 PREEMPT(voluntary)
kern :warn : [ 370.323250] Hardware name: Dell Inc. Dell Pro Max 16
Plus MB16250/, BIOS 1.0.0 05/23/2025
kern :warn : [ 370.323252] RIP: 0010:tb_path_activate+0x129/0x530 [thunderbolt]
kern :warn : [ 370.323279] Code: 4d 85 e4 0f 84 ee 00 00 00 48 81 c7
c8 00 00 00 e8 fc af d1 d3 4c 89 e9 4c 89 e2 48 c7 c7 78 3e 54 c0 48
89 c6 e8 57 e0 18 d3 <0f> 0b 48 8b 45 d0 65 48 2b 05 b1 4b d2 d5 0f 85
e0 03 00 00 48 8d
kern :warn : [ 370.323281] RSP: 0018:ffffce70a3c2f928 EFLAGS: 00010246
kern :warn : [ 370.323284] RAX: 0000000000000000 RBX: 00000000ffffff95
RCX: 0000000000000000
kern :warn : [ 370.323286] RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000000
kern :warn : [ 370.323287] RBP: ffffce70a3c2f968 R08: 0000000000000000
R09: 0000000000000000
kern :warn : [ 370.323289] R10: 0000000000000000 R11: 0000000000000000
R12: ffff8bb8033b1380
kern :warn : [ 370.323290] R13: ffffffffc05472fc R14: 0000000000000001
R15: ffffce70a3c2f930
kern :warn : [ 370.323291] FS: 0000747c76bfe6c0(0000)
GS:ffff8bbfe0888000(0000) knlGS:0000000000000000
kern :warn : [ 370.323293] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern :warn : [ 370.323295] CR2: 000000c000a35000 CR3: 0000000130f59003
CR4: 0000000000f72ef0
kern :warn : [ 370.323296] PKRU: 55555554
kern :warn : [ 370.323298] Call Trace:
kern :warn : [ 370.323299] <TASK>
kern :warn : [ 370.323302] tb_tunnel_activate+0xba/0x2d0 [thunderbolt]
kern :warn : [ 370.323329] ? tb_tunnel_alloc_pci+0xb2/0x110 [thunderbolt]
kern :warn : [ 370.323354] tb_tunnel_pci+0xde/0x170 [thunderbolt]
kern :warn : [ 370.323377] tb_domain_approve_switch+0x3b/0x70 [thunderbolt]
kern :warn : [ 370.323402] authorized_store+0x282/0x2c0 [thunderbolt]
kern :warn : [ 370.323423] dev_attr_store+0x14/0x40
kern :warn : [ 370.323429] sysfs_kf_write+0x6f/0x90
kern :warn : [ 370.323433] kernfs_fop_write_iter+0x151/0x200
kern :warn : [ 370.323437] vfs_write+0x26b/0x490
kern :warn : [ 370.323440] ksys_write+0x6f/0xf0
kern :warn : [ 370.323441] __x64_sys_write+0x19/0x30
kern :warn : [ 370.323443] x64_sys_call+0x29a/0x2320
kern :warn : [ 370.323447] do_syscall_64+0x80/0xe80
kern :warn : [ 370.323450] ? get_signal+0x6da/0x7e0
kern :warn : [ 370.323454] ? vfs_write+0x26b/0x490
kern :warn : [ 370.323456] ? arch_do_signal_or_restart+0x38/0x110
kern :warn : [ 370.323461] ? exit_to_user_mode_loop+0x91/0x170
kern :warn : [ 370.323465] ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
kern :warn : [ 370.323468] ? do_syscall_64+0xb6/0xe80
kern :warn : [ 370.323470] ? sysfs_kf_write+0x6f/0x90
kern :warn : [ 370.323472] ? dequeue_signal+0x7e/0x190
kern :warn : [ 370.323474] ? get_signal+0x6da/0x7e0
kern :warn : [ 370.323476] ? vfs_write+0x26b/0x490
kern :warn : [ 370.323478] ? arch_do_signal_or_restart+0x38/0x110
kern :warn : [ 370.323481] ? exit_to_user_mode_loop+0x91/0x170
kern :warn : [ 370.323484] ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
kern :warn : [ 370.323487] ? do_syscall_64+0xb6/0xe80
kern :warn : [ 370.323488] ? do_syscall_64+0xb6/0xe80
kern :warn : [ 370.323490] entry_SYSCALL_64_after_hwframe+0x76/0x7e
kern :warn : [ 370.323492] RIP: 0033:0x747c7a51c5ad
kern :warn : [ 370.323495] Code: e5 48 83 ec 20 48 89 55 e8 48 89 75
f0 89 7d f8 e8 b8 bf f7 ff 48 8b 55 e8 48 8b 75 f0 41 89 c0 8b 7d f8
b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 33 44 89 c7 48 89 45 f8 e8
0f c0 f7 ff 48 8b
kern :warn : [ 370.323497] RSP: 002b:0000747c76bfdb70 EFLAGS: 00000293
ORIG_RAX: 0000000000000001
kern :warn : [ 370.323499] RAX: ffffffffffffffda RBX: 00006508223c9860
RCX: 0000747c7a51c5ad
kern :warn : [ 370.323500] RDX: 0000000000000001 RSI: 0000747c76bfdc20
RDI: 000000000000000a
kern :warn : [ 370.323502] RBP: 0000747c76bfdb90 R08: 0000000000000000
R09: 0000747c76bfda80
kern :warn : [ 370.323503] R10: 0000000000000000 R11: 0000000000000293
R12: 0000747c76bfdc20
kern :warn : [ 370.323504] R13: 000000000000000a R14: 0000747c76bfdc18
R15: 0000747c6c00a830
kern :warn : [ 370.323506] </TASK>
kern :warn : [ 370.323507] ---[ end trace 0000000000000000 ]---
kern :warn : [ 370.323509] thunderbolt 0000:00:0d.2: 0:8 <-> 1:9
(PCI): activation failed
kern :debug : [ 370.323512] [3599]
thunderbolt:tb_tunnel_deactivate:2420: thunderbolt 0000:00:0d.2: 0:8
<-> 1:9 (PCI): deactivating
kern :info : [ 370.323831] thunderbolt 0000:00:0d.2: 1:9: PCIe tunnel
activation failed, aborting
kern :debug : [ 370.323843] [375] thunderbolt:tb_handle_hotplug:2496:
thunderbolt 0000:00:0d.2: 0:2: got plug event for connected port,
ignoring
kern :debug : [ 370.323850] [375] thunderbolt:tb_handle_hotplug:2443:
thunderbolt 0000:00:0d.2: hotplug event for upstream port 1:2 (unplug:
0)
kern :debug : [ 370.323853] [375] thunderbolt:tb_handle_hotplug:2492:
thunderbolt 0000:00:0d.2: 0:2: got unplug event for disconnected port,
ignoring
kern :debug : [ 370.323856] [375] thunderbolt:tb_handle_hotplug:2443:
thunderbolt 0000:00:0d.2: hotplug event for upstream port 1:2 (unplug:
1)
kern :info : [ 370.323859] thunderbolt 0-0:1.1: retimer disconnected
kern :debug : [ 370.323948] [375] thunderbolt:tb_handle_hotplug:2454:
thunderbolt 0000:00:0d.2: 0:1: switch unplugged
kern :info : [ 370.324578] thunderbolt 0-1: device disconnected
kern :debug : [ 370.324802] [375]
thunderbolt:tb_recalc_estimated_bandwidth:1512: thunderbolt
0000:00:0d.2: bandwidth consumption changed, re-calculating estimated
bandwidth
kern :debug : [ 370.324804] [375]
thunderbolt:tb_recalc_estimated_bandwidth:1521: thunderbolt
0000:00:0d.2: bandwidth re-calculation done
kern :debug : [ 370.324807] [375] thunderbolt:tb_tunnel_dp:2069:
thunderbolt 0000:00:0d.2: looking for DP IN <-> DP OUT pairs:
kern :debug : [ 370.324982] [375] thunderbolt:tb_tunnel_dp:2083:
thunderbolt 0000:00:0d.2: 0:5: DP IN available
kern :debug : [ 370.324985] [375] thunderbolt:tb_tunnel_dp:2089:
thunderbolt 0000:00:0d.2: 0:5: no suitable DP OUT adapter available,
not tunneling
kern :debug : [ 370.325145] [375] thunderbolt:tb_tunnel_dp:2083:
thunderbolt 0000:00:0d.2: 0:6: DP IN available
kern :debug : [ 370.325147] [375] thunderbolt:tb_tunnel_dp:2089:
thunderbolt 0000:00:0d.2: 0:6: no suitable DP OUT adapter available,
not tunneling

I'm not a thunderbolt expert, but it looks like the thunderbolt
controller on the host failed to establish USB3 tunneling with the
screen's internal USB 3 hub, followed by the PCIe link activation
failure.

For more information:
Linux version: vanilla 6.16.0-rc4-drm-tip (commit
4f74a027c8664ae79344bf711acfab9cd2f8edab)

Machine: Dell Pro Max 16 Plus MB16250, BIOS 1.2.0 06/19/2025

CPU model name: Intel(R) Core(TM) Ultra 7 265HX (Arrow Lake)

Lspci-vt:
-+-[0000:00]-+-00.0 Intel Corporation Device 7d2d
  |                  +-01.0-[01]----00.0 Sandisk Corp Device 5049
  |                  +-02.0 Intel Corporation Arrow Lake-U [Intel Graphics]
  |                  +-04.0 Intel Corporation Device ad03
  |                  +-06.0-[02]----00.0 Sandisk Corp Device 5049
  |
+-06.1-[03-2f]----00.0-[04-2f]--+-00.0-[05]----00.0 Intel Corporation
Thunderbolt 80/120G NHI [Barlow Ridge Host 80G 2023]
  |                  |
+-01.0-[06-19]----00.0-[07-19]--+-00.0-[08]----00.0 Intel Corporation
Thunderbolt 4 USB Controller [Goshen Ridge 2020]
  |                  |                                               |

+-01.0-[09-0e]----00.0-[0a-0b]----01.0-[0b]----00.0 Samsung
Electronics Co Ltd NVMe SSD Controller 980 (DRAM-less)
  |                  |                                               |
                                               +-02.0-[0f-14]--
  |                  |                                               |
                                               +-03.0-[15-18]--
  |                  |                                               |
                                                \-04.0-[19]--
  |                  |
+-02.0-[1a]----00.0 Intel Corporation Thunderbolt 80/120G USB
Controller [Barlow Ridge Host 80G 2023]
  |                  |
\-03.0-[1b-2f]--
  |                  +-06.3-[30]--+-00.0 NVIDIA Corporation Device 2f38
 |                   |                    \-00.1 NVIDIA Corporation Device 2f80
 |                   +-07.0-[31-45]--
 |                   +-07.1-[46-5a]--
 |                   +-08.0 Intel Corporation Device ae4c
 |                   +-0a.0 Intel Corporation Device ad0d
 |                   +-0b.0 Intel Corporation Arrow Lake NPU
 |                   +-0d.0 Intel Corporation Meteor Lake-P
Thunderbolt 4 USB Controller
 |                   +-0d.2 Intel Corporation Meteor Lake-P Thunderbolt 4 NHI #0
 |                   +-14.0 Intel Corporation Device ae7f
 |                   +-1f.0 Intel Corporation Device ae10
 |                    \-1f.5 Intel Corporation Device ae23
\-[0000:80]-+-12.0 Intel Corporation Device 7f78
                   +-14.0 Intel Corporation Device 7f6e
                   +-14.5 Intel Corporation Device 7f2f
                   +-15.0 Intel Corporation Device 7f4c
                   +-15.1 Intel Corporation Device 7f4d
                   +-15.3 Intel Corporation Device 7f4f
                   +-16.0 Intel Corporation Device 7f68
                  +-16.3 Intel Corporation Device 7f6b
                  +-19.0 Intel Corporation Device 7f7a
                  +-19.1 Intel Corporation Device 7f7b
                  +-1c.0-[81]----00.0 Intel Corporation Wi-Fi
7(802.11be) AX1775*/AX1790*/BE20*/BE401/BE1750* 2x2
                  +-1c.4-[82-83]----00.0 Realtek Semiconductor Co.,
Ltd. Device 5264
                  +-1d.0-[84]----00.0 Intel Corporation Ethernet
Controller I226-LM
                  +-1f.0 Intel Corporation Device 7f12
                  +-1f.3 Intel Corporation Device 7f50
                  +-1f.4 Intel Corporation Device 7f23
                  \-1f.5 Intel Corporation Device 7f24

Thank you for your time.

Best regards,
En-Wei.

