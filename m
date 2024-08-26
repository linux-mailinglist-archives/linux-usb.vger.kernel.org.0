Return-Path: <linux-usb+bounces-14091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD895EC53
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 10:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C45E31C21127
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 08:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6807F13AD22;
	Mon, 26 Aug 2024 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM5gfjBJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E273E55898
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662146; cv=none; b=m76uKtAHxeuLjrIoxeAIjia0IMOF8aUBSUCxy/uR2Y0E7TuF/yooiLKPp/g2oFk8InyFl8gJKjUj3ZQMXlohUBeaa/8FbFW6y974l3HmXcJpAnx2pIAg36PfR/sULyzgcn3bWfDHW+CMkvCCsiegLuPyLoz9jXUoyW1ZXC8ELYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662146; c=relaxed/simple;
	bh=GUoj9hzDbeDJJ3MszA+sy5qd0Lk8A+pw5389iHAvX7Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uznJyYni4WYuErhT7zwRzdfmX/MZNcVL+mJIaWUTCiGcAiH1U0D/xuToeCP2U3YqDebzKX5fGljswEIx4/BRwOEWIwMRPgd4o9H2CbEgCqJfpjR245/j/vrL4jEoMhvmv4M/O5Ume4b9VZ/e7XKmvoiAuSyJdn66djZQWt9+oNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM5gfjBJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54105C8CDC5
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724662145;
	bh=GUoj9hzDbeDJJ3MszA+sy5qd0Lk8A+pw5389iHAvX7Q=;
	h=From:To:Subject:Date:From;
	b=LM5gfjBJAZx0nQY8l+13wi5chyBwRCrQ/6rlZnma38sN2CKqmgqHCa6VueyARh3hQ
	 0Z0gVoCkBR5GBhplJlJe9WwjFlz3Q5iPwIbwhPAz4/KpgFOWKliF0/g8KWu4WbawbT
	 yx9kQZpRT8/RTAQtZcmH5ySTHuOev7PNtSVXuEQnFMv2egYxPBhW9MxFM8a8Ix99ci
	 LSwe2bJOXBl79JLBzPdZ5qvJM1Ixpf5m16IvpwOLN3ne3V7CAeY44SdUQhlRmumGQs
	 vTXQF2hTdXfSJ6RPZBf0A2q2eAF91it95FTfbz0KAwc81OaoeYHPLivN4k9Cnj2gF9
	 4dxml50yzOBiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40196C53B7E; Mon, 26 Aug 2024 08:49:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] New: usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 08:49:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219198-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

            Bug ID: 219198
           Summary: usb on Dell WD19TB Thunderbolt Dock stop working
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: maggu2810@gmail.com
        Regression: No

USB is working on my Dell WD19TB Thunderbolt Dock with Fedora kernel build
6.10.0-64.fc41.x86_64

It does not work with 6.11.0-0.rc4.38.fc41.x86_64 anymore.

Here is the kernel log after plug-in it while the system is running:

----
Aug 26 10:33:26 foobar kernel: thunderbolt 0-0:1.1: new retimer found,
vendor=3D0x8087 device=3D0x15ee
Aug 26 10:33:26 foobar kernel: thunderbolt 0-0:1.2: new retimer found,
vendor=3D0x8087 device=3D0x15ee
Aug 26 10:33:26 foobar kernel: thunderbolt 0-1: new device found, vendor=3D=
0xd4
device=3D0xb070
Aug 26 10:33:26 foobar kernel: thunderbolt 0-1: Dell WD19TB Thunderbolt Dock
Aug 26 10:33:28 foobar kernel: pcieport 0000:00:07.0: pciehp: Slot(3): Card
present
Aug 26 10:33:28 foobar kernel: pcieport 0000:00:07.0: pciehp: Slot(3): Link=
 Up
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: [8086:15ef] type 01 class
0x060400 PCIe Switch Upstream Port
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: PCI bridge to [bus 00]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0:   bridge window [io=20
0x0000-0x0fff]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0:   bridge window [mem
0x00000000-0x000fffff]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0:   bridge window [mem
0x00000000-0x000fffff 64bit pref]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: enabling Extended Tags
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: supports D1 D2
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: PME# supported from D0 D1 =
D2
D3hot D3cold
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: PTM enabled, 4ns granulari=
ty
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: 8.000 Gb/s available PCIe
bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:00:07.0 (capable of 31.=
504
Gb/s with 8.0 GT/s PCIe x4 link)
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: Adding to iommu group 18
Aug 26 10:33:28 foobar kernel: pcieport 0000:00:07.0: ASPM: current common
clock configuration is inconsistent, reconfiguring
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: bridge configuration inval=
id
([bus 00-00]), reconfiguring
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: [8086:15ef] type 01 class
0x060400 PCIe Switch Downstream Port
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: PCI bridge to [bus 00]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0:   bridge window [io=20
0x0000-0x0fff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0:   bridge window [mem
0x00000000-0x000fffff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0:   bridge window [mem
0x00000000-0x000fffff 64bit pref]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: enabling Extended Tags
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: supports D1 D2
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: PME# supported from D0 D1 =
D2
D3hot D3cold
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: Adding to iommu group 19
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: [8086:15ef] type 01 class
0x060400 PCIe Switch Downstream Port
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: PCI bridge to [bus 00]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0:   bridge window [io=20
0x0000-0x0fff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0:   bridge window [mem
0x00000000-0x000fffff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0:   bridge window [mem
0x00000000-0x000fffff 64bit pref]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: enabling Extended Tags
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: supports D1 D2
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: PME# supported from D0 D1 =
D2
D3hot D3cold
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: Adding to iommu group 20
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: PCI bridge to [bus 03-52]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: bridge configuration inval=
id
([bus 00-00]), reconfiguring
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: bridge configuration inval=
id
([bus 00-00]), reconfiguring
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: [8086:15f0] type 00 class
0x0c0330 PCIe Endpoint
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: BAR 0 [mem
0x00000000-0x0000ffff]
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: enabling Extended Tags
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: supports D1 D2
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: PME# supported from D0 D1 =
D2
D3hot D3cold
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: 8.000 Gb/s available PCIe
bandwidth, limited by 2.5 GT/s PCIe x4 link at 0000:00:07.0 (capable of 31.=
504
Gb/s with 8.0 GT/s PCIe x4 link)
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: Adding to iommu group 21
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: PCI bridge to [bus 04-52]
Aug 26 10:33:28 foobar kernel: pci_bus 0000:04: busn_res: [bus 04-52] end is
updated to 04
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: PCI bridge to [bus 05-52]
Aug 26 10:33:28 foobar kernel: pci_bus 0000:05: busn_res: [bus 05-52] end is
updated to 52
Aug 26 10:33:28 foobar kernel: pci_bus 0000:03: busn_res: [bus 03-52] end is
updated to 52
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: bridge window [mem
0x00100000-0x001fffff 64bit pref] to [bus 05-52] add_size 100000 add_align
100000
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: bridge window [mem
0x00100000-0x001fffff] to [bus 05-52] add_size 100000 add_align 100000
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: bridge window [mem
0x00100000-0x002fffff 64bit pref] to [bus 03-52] add_size 100000 add_align
100000
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: bridge window [mem
0x00100000-0x002fffff] to [bus 03-52] add_size 100000 add_align 100000
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: bridge window [mem
0x98000000-0xba0fffff]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: bridge window [mem
0x6210000000-0x6245ffffff 64bit pref]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: bridge window [io=20
0x5000-0x6fff]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: bridge window [mem
0x98000000-0x980fffff]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: bridge window [mem
0x6210000000-0x62100fffff 64bit pref]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: bridge window [mem
0x98100000-0xba0fffff]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: bridge window [mem
0x6210100000-0x6245ffffff 64bit pref]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: bridge window [io=20
0x5000-0x5fff]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: bridge window [io=20
0x6000-0x6fff]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: BAR 0 [mem
0x98000000-0x9800ffff]: assigned
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0: PCI bridge to [bus 04]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0:   bridge window [io=20
0x5000-0x5fff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0:   bridge window [mem
0x98000000-0x980fffff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:02.0:   bridge window [mem
0x6210000000-0x62100fffff 64bit pref]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0: PCI bridge to [bus 05-52]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0:   bridge window [io=20
0x6000-0x6fff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0:   bridge window [mem
0x98100000-0xba0fffff]
Aug 26 10:33:28 foobar kernel: pci 0000:03:04.0:   bridge window [mem
0x6210100000-0x6245ffffff 64bit pref]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0: PCI bridge to [bus 03-52]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0:   bridge window [io=20
0x5000-0x6fff]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0:   bridge window [mem
0x98000000-0xba0fffff]
Aug 26 10:33:28 foobar kernel: pci 0000:02:00.0:   bridge window [mem
0x6210000000-0x6245ffffff 64bit pref]
Aug 26 10:33:28 foobar kernel: pcieport 0000:00:07.0: PCI bridge to [bus 02=
-52]
Aug 26 10:33:28 foobar kernel: pcieport 0000:00:07.0:   bridge window [io=20
0x5000-0x6fff]
Aug 26 10:33:28 foobar kernel: pcieport 0000:00:07.0:   bridge window [mem
0x98000000-0xba0fffff]
Aug 26 10:33:28 foobar kernel: pcieport 0000:00:07.0:   bridge window [mem
0x6210000000-0x6245ffffff 64bit pref]
Aug 26 10:33:28 foobar kernel: pcieport 0000:02:00.0: enabling device (0000=
 ->
0003)
Aug 26 10:33:28 foobar kernel: pcieport 0000:03:02.0: enabling device (0000=
 ->
0003)
Aug 26 10:33:28 foobar kernel: pcieport 0000:03:04.0: enabling device (0000=
 ->
0003)
Aug 26 10:33:28 foobar kernel: pcieport 0000:03:04.0: pciehp: Slot #4 AttnB=
tn-
PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+
IbPresDis- LLActRep+
Aug 26 10:33:28 foobar kernel: pci 0000:04:00.0: enabling device (0000 -> 0=
002)
Aug 26 10:33:28 foobar kernel: xhci_hcd 0000:04:00.0: xHCI Host Controller
Aug 26 10:33:28 foobar kernel: xhci_hcd 0000:04:00.0: new USB bus registere=
d,
assigned bus number 5
Aug 26 10:33:28 foobar kernel: xhci_hcd 0000:04:00.0: hcc params 0x200077c1=
 hci
version 0x110 quirks 0x0000000200009810
Aug 26 10:33:28 foobar kernel: xhci_hcd 0000:04:00.0: xHCI Host Controller
Aug 26 10:33:28 foobar kernel: xhci_hcd 0000:04:00.0: new USB bus registere=
d,
assigned bus number 6
Aug 26 10:33:28 foobar kernel: xhci_hcd 0000:04:00.0: Host supports USB 3.1
Enhanced SuperSpeed
Aug 26 10:33:28 foobar kernel: usb usb5: New USB device found, idVendor=3D1=
d6b,
idProduct=3D0002, bcdDevice=3D 6.11
Aug 26 10:33:28 foobar kernel: usb usb5: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Aug 26 10:33:28 foobar kernel: usb usb5: Product: xHCI Host Controller
Aug 26 10:33:28 foobar kernel: usb usb5: Manufacturer: Linux
6.11.0-0.rc4.38.fc41.x86_64 xhci-hcd
Aug 26 10:33:28 foobar kernel: usb usb5: SerialNumber: 0000:04:00.0
Aug 26 10:33:28 foobar kernel: DMAR: DRHD: handling fault status reg 2
Aug 26 10:33:28 foobar kernel: DMAR: [DMA Read NO_PASID] Request device
[04:00.0] fault addr 0xffffb000 [fault reason 0x06] PTE Read access is not =
set
Aug 26 10:33:28 foobar kernel: hub 5-0:1.0: USB hub found
Aug 26 10:33:28 foobar kernel: hub 5-0:1.0: 2 ports detected
Aug 26 10:33:28 foobar kernel: usb usb6: New USB device found, idVendor=3D1=
d6b,
idProduct=3D0003, bcdDevice=3D 6.11
Aug 26 10:33:28 foobar kernel: usb usb6: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Aug 26 10:33:28 foobar kernel: usb usb6: Product: xHCI Host Controller
Aug 26 10:33:28 foobar kernel: usb usb6: Manufacturer: Linux
6.11.0-0.rc4.38.fc41.x86_64 xhci-hcd
Aug 26 10:33:28 foobar kernel: usb usb6: SerialNumber: 0000:04:00.0
Aug 26 10:33:28 foobar kernel: hub 6-0:1.0: USB hub found
Aug 26 10:33:28 foobar kernel: hub 6-0:1.0: 2 ports detected
Aug 26 10:33:29 foobar kernel: DMAR: DRHD: handling fault status reg 2
Aug 26 10:33:29 foobar kernel: DMAR: [DMA Read NO_PASID] Request device
[04:00.0] fault addr 0xffffe000 [fault reason 0x06] PTE Read access is not =
set
Aug 26 10:33:33 foobar kernel: usb usb2-port1: attempt power cycle
Aug 26 10:33:49 foobar kernel: watchdog: Watchdog detected hard LOCKUP on c=
pu 0
Aug 26 10:33:49 foobar kernel: Modules linked in: uhid uinput rfcomm
snd_seq_dummy snd_hrtimer xt_comment nft_compat bridge stp llc
nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reje=
ct
nft_ct sunrpc nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ip=
v4
ip_set nvidia_drm(POE) nvidia_modeset(POE) nf_tables nvidia_uvm(POE) bnep
snd_hda_codec_hdmi nvidia(POE) binfmt_misc vfat fat snd_sof_pci_intel_tgl
snd_sof_pci_intel_cnl snd_sof_intel_hda_generic soundwire_intel
soundwire_cadence snd_sof_intel_hda_common iwlmvm snd_sof_intel_hda_mlink
snd_sof_intel_hda snd_sof_pci snd_sof_xtensa_dsp snd_sof mac80211 snd_sof_u=
tils
snd_soc_hdac_hda snd_soc_acpi_intel_match snd_ctl_led
soundwire_generic_allocation snd_soc_acpi soundwire_bus snd_hda_codec_realt=
ek
snd_soc_avs snd_hda_codec_generic snd_soc_hda_codec snd_hda_scodec_component
snd_hda_ext_core libarc4 snd_soc_core snd_compress dell_pc ac97_bus
platform_profile snd_pcm_dmaengine snd_hda_intel
Aug 26 10:33:49 foobar kernel:  snd_usb_audio snd_intel_dspcfg
snd_intel_sdw_acpi intel_uncore_frequency snd_hda_codec
intel_uncore_frequency_common snd_usbmidi_lib x86_pkg_temp_thermal dell_rbtn
snd_hda_core intel_powerclamp snd_ump snd_rawmidi snd_hwdep coretemp uvcvid=
eo
btusb snd_seq iTCO_wdt btrtl uvc mei_wdt intel_pmc_bxt r8153_ecm snd_seq_de=
vice
iwlwifi videobuf2_vmalloc btintel processor_thermal_device_pci videobuf2_me=
mops
iTCO_vendor_support spi_nor hid_sensor_als kvm_intel dell_laptop mei_pxp
snd_pcm cdc_ether mei_hdcp processor_thermal_device btbcm dell_wmi usbnet
videobuf2_v4l2 hid_sensor_trigger hid_sensor_iio_common
processor_thermal_wt_hint mtd intel_rapl_msr kvm dell_smbios videobuf2_comm=
on
snd_timer dell_wmi_sysman btmtk dcdbas rapl intel_cstate intel_uncore pcspkr
cfg80211 dell_smm_hwmon dell_wmi_ddv firmware_attributes_class
dell_wmi_descriptor videodev wmi_bmof bluetooth processor_thermal_rfim
industrialio_triggered_buffer kfifo_buf r8152 mei_me snd processor_thermal_=
rapl
i2c_i801 intel_rapl_common spi_intel_pci mc
Aug 26 10:33:49 foobar kernel:  mii thunderbolt mei industrialio i2c_smbus
spi_intel idma64 processor_thermal_wt_req soundcore rfkill
processor_thermal_power_floor processor_thermal_mbox igen6_edac int3403_the=
rmal
dptf_power joydev int340x_thermal_zone intel_pmc_core intel_vsec intel_hid
pmt_telemetry int3400_thermal sparse_keymap pmt_class acpi_thermal_rel acpi=
_pad
acpi_tad loop nfnetlink zram dm_crypt xe drm_ttm_helper gpu_sched
drm_suballoc_helper drm_gpuvm drm_exec hid_sensor_hub intel_ishtp_hid hid_j=
abra
i915 nvme nvme_core nvme_auth crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni polyval_generic i2c_algo_bit drm_buddy rtsx_pci_sdmmc ttm
mmc_core ghash_clmulni_intel drm_display_helper ucsi_acpi sha512_ssse3
typec_ucsi intel_ish_ipc sha256_ssse3 hid_multitouch sha1_ssse3 rtsx_pci vi=
deo
cec intel_ishtp typec vmd i2c_hid_acpi i2c_hid wmi pinctrl_tigerlake serio_=
raw
ip6_tables ip_tables fuse i2c_dev
Aug 26 10:33:49 foobar kernel: CPU: 0 UID: 0 PID: 6646 Comm: kworker/0:0
Tainted: P           OE     -------  ---  6.11.0-0.rc4.38.fc41.x86_64 #1
Aug 26 10:33:49 foobar kernel: Tainted: [P]=3DPROPRIETARY_MODULE, [O]=3DOOT=
_MODULE,
[E]=3DUNSIGNED_MODULE
Aug 26 10:33:49 foobar kernel: Hardware name: Dell Inc. Precision 5570/04ND=
TC,
BIOS 1.25.0 07/11/2024
Aug 26 10:33:49 foobar kernel: Workqueue: events xhci_handle_command_timeout
Aug 26 10:33:49 foobar kernel: RIP: 0010:xhci_handshake_check_state+0x52/0x=
100
Aug 26 10:33:49 foobar kernel: Code: 14 24 8b 06 21 c2 39 d1 0f 84 85 00 00=
 00
4d 85 e4 49 89 f7 41 89 ce 0f 95 44 24 07 eb 16 f3 90 48 81 eb e9 03 00 00 =
41
8b 07 <8b> 14 24 21 c2 44 39 f2 74 5f 83 f8 ff 74 42 89 ea 41 23 95 88 09
Aug 26 10:33:49 foobar kernel: RSP: 0018:ffff9a920cdf3c00 EFLAGS: 00000016
Aug 26 10:33:49 foobar kernel: RAX: 0000000000000008 RBX: 00000000247309b7 =
RCX:
0000000000000000
Aug 26 10:33:49 foobar kernel: RDX: 0000000000000041 RSI: 0000000000000018 =
RDI:
000002e7154a8710
Aug 26 10:33:49 foobar kernel: RBP: 0000000000000004 R08: 00000000004c4b40 =
R09:
0000000000000004
Aug 26 10:33:49 foobar kernel: R10: 0000000000000007 R11: 0000000000000007 =
R12:
00000000004c4b40
Aug 26 10:33:49 foobar kernel: R13: ffff8f90225df250 R14: 0000000000000000 =
R15:
ffff9a9203a40098
Aug 26 10:33:49 foobar kernel: FS:  0000000000000000(0000)
GS:ffff8f96eee00000(0000) knlGS:0000000000000000
Aug 26 10:33:49 foobar kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 26 10:33:49 foobar kernel: CR2: 00000c24048ca048 CR3: 000000058742a000 =
CR4:
0000000000f50ef0
Aug 26 10:33:49 foobar kernel: PKRU: 55555554
Aug 26 10:33:49 foobar kernel: Call Trace:
Aug 26 10:33:49 foobar kernel:  <NMI>
Aug 26 10:33:49 foobar kernel:  ? watchdog_hardlockup_check.cold+0x149/0x14e
Aug 26 10:33:49 foobar kernel:  ? __perf_event_overflow+0x10c/0x320
Aug 26 10:33:49 foobar kernel:  ? x86_perf_event_set_period+0xdc/0x1c0
Aug 26 10:33:49 foobar kernel:  ? handle_pmi_common+0x1a5/0x400
Aug 26 10:33:49 foobar kernel:  ? intel_pmu_handle_irq+0x10b/0x510
Aug 26 10:33:49 foobar kernel:  ? perf_event_nmi_handler+0x2a/0x50
Aug 26 10:33:49 foobar kernel:  ? nmi_handle+0x65/0x130
Aug 26 10:33:49 foobar kernel:  ? default_do_nmi+0x40/0x130
Aug 26 10:33:49 foobar kernel:  ? exc_nmi+0x122/0x1a0
Aug 26 10:33:49 foobar kernel:  ? end_repeat_nmi+0xf/0x53
Aug 26 10:33:49 foobar kernel:  ? xhci_handshake_check_state+0x52/0x100
Aug 26 10:33:49 foobar kernel:  ? xhci_handshake_check_state+0x52/0x100
Aug 26 10:33:49 foobar kernel:  ? xhci_handshake_check_state+0x52/0x100
Aug 26 10:33:49 foobar kernel:  </NMI>
Aug 26 10:33:49 foobar kernel:  <TASK>
Aug 26 10:33:49 foobar kernel:  xhci_handle_command_timeout+0x3ec/0x530
Aug 26 10:33:49 foobar kernel:  process_one_work+0x176/0x330
Aug 26 10:33:49 foobar kernel:  worker_thread+0x256/0x390
Aug 26 10:33:49 foobar kernel:  ? __pfx_worker_thread+0x10/0x10
Aug 26 10:33:49 foobar kernel:  kthread+0xcf/0x100
Aug 26 10:33:49 foobar kernel:  ? __pfx_kthread+0x10/0x10
Aug 26 10:33:49 foobar kernel:  ret_from_fork+0x31/0x50
Aug 26 10:33:49 foobar kernel:  ? __pfx_kthread+0x10/0x10
Aug 26 10:33:49 foobar kernel:  ret_from_fork_asm+0x1a/0x30
Aug 26 10:33:49 foobar kernel:  </TASK>
Aug 26 10:33:49 foobar kernel: xhci_hcd 0000:04:00.0: Abort failed to stop
command ring: -110
Aug 26 10:33:49 foobar kernel: xhci_hcd 0000:04:00.0: xHCI host controller =
not
responding, assume dead
Aug 26 10:33:49 foobar kernel: xhci_hcd 0000:04:00.0: HC died; cleaning up
Aug 26 10:33:49 foobar kernel: xhci_hcd 0000:04:00.0: Error while assigning
device slot ID: Command Aborted
Aug 26 10:33:49 foobar kernel: xhci_hcd 0000:04:00.0: Max number of devices
this xHCI host supports is 64.
Aug 26 10:33:49 foobar kernel: usb usb5-port2: couldn't allocate usb_device
Aug 26 10:33:49 foobar kernel: usb usb6-port2: couldn't allocate usb_device
Aug 26 10:33:57 foobar kernel: usb usb2-port1: unable to enumerate USB devi=
ce
----

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

