Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E84F16084B
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 03:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgBQCpc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Feb 2020 21:45:32 -0500
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:42864 "EHLO
        1.mo69.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgBQCpc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Feb 2020 21:45:32 -0500
X-Greylist: delayed 602 seconds by postgrey-1.27 at vger.kernel.org; Sun, 16 Feb 2020 21:45:32 EST
Received: from player159.ha.ovh.net (unknown [10.108.57.153])
        by mo69.mail-out.ovh.net (Postfix) with ESMTP id D66386E0F0
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 03:45:30 +0100 (CET)
Received: from mattea.info (host221-23-dynamic.248-95-r.retail.telecomitalia.it [95.248.23.221])
        (Authenticated sender: relay@mattea.info)
        by player159.ha.ovh.net (Postfix) with ESMTPSA id 90F29F68B133
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 02:45:30 +0000 (UTC)
Received: from alby.localnet (unknown [IPv6:fc00::91ca:3bb3:4051:1ecb])
        by i-m-services.net (Postfix) with ESMTP id 1F4DD2CE3EF
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 03:45:30 +0100 (CET)
From:   Alberto Mattea <alberto@mattea.info>
To:     linux-usb@vger.kernel.org
Subject: AMD XHCI controller 1022:145c needs the XHCI_SUSPEND_DELAY quirk to suspend properly
Date:   Mon, 17 Feb 2020 03:45:30 +0100
Message-ID: <5338000.DvuYhMxLoT@alby>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Ovh-Tracer-Id: 18323458036148797280
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvufffkfgggfgtsehtufertddttddvnecuhfhrohhmpeetlhgsvghrthhoucforghtthgvrgcuoegrlhgsvghrthhosehmrghtthgvrgdrihhnfhhoqeenucfkpheptddrtddrtddrtddpfhgttddtmeemledutggrmeefsggsfeemgedthedumeduvggtsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprghlsggvrhhtohesmhgrthhtvggrrdhinhhfohdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tested with linux 5.6-rc2
Without the quirk, suspending the system fails with:

[  240.521724] xhci_hcd 0000:30:00.3: WARN: xHC save state timeout
[  240.521729] xhci_hcd 0000:30:00.3: ERROR mismatched command completion event
[  240.521738] PM: suspend_common(): xhci_pci_suspend+0x0/0xc0 returns -110
[  240.521740] PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x20 returns -110
[  240.521742] PM: dpm_run_callback(): pci_pm_suspend+0x0/0x210 returns -110
[  240.521744] PM: Device 0000:30:00.3 failed to suspend async: error -110
[  241.089628] PM: Some devices failed to suspend, or early wake event detected
[  241.090124] hub 3-0:1.0: hub_ext_port_status failed (err = -108)
[  241.090125] usb usb3-port1: cannot disable (err = -108)

The controller appears in lspci as:

30:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Family 17h (Models 00h-0fh) USB 3.0 Host Controller [1022:145c] (prog-if 30 [XHCI])
        Subsystem: ASRock Incorporation Family 17h (Models 00h-0fh) USB 3.0 Host Controller [1849:7914]
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin C routed to IRQ 64
        Region 0: Memory at fca00000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [64] Express (v2) Endpoint, MSI 00
                DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
                        ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0.000W
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                        RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 256 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 8GT/s, Width x16, TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR-, OBFF Not Supported
                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
                LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
        Capabilities: [a0] MSI: Enable+ Count=1/8 Maskable- 64bit+
                Address: 00000000fee00000  Data: 4029
        Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
        Capabilities: [150 v2] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [2a0 v1] Access Control Services
                ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
                ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
        Kernel driver in use: xhci_hcd

Thanks,

Alberto


