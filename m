Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F412464EE
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 12:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgHQK4P convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 17 Aug 2020 06:56:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:38882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbgHQKzY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 06:55:24 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208911] Renesas USB controller - FW has invalid version :8224
Date:   Mon, 17 Aug 2020 10:55:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: code-kernel@bnavigator.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-208911-208809-4IA1U2QTvA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208911-208809@https.bugzilla.kernel.org/>
References: <bug-208911-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208911

Ben Greiner (code-kernel@bnavigator.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |code-kernel@bnavigator.de

--- Comment #8 from Ben Greiner (code-kernel@bnavigator.de) ---
I get the same error with :8215. Is this related?

Kernel version: 5.8.1-arch1-1


system journal (happens before cryptsetup):

    Aug 17 12:31:33 archlinux kernel: xhci_hcd 0000:03:00.0: FW has invalid
version :8215
    Aug 17 12:31:33 archlinux kernel: xhci_hcd 0000:03:00.0: Direct firmware
load for renesas_usb_fw.mem failed with error -2
    Aug 17 12:31:33 archlinux kernel: xhci_hcd 0000:03:00.0: request_firmware
failed: -2
    Aug 17 12:31:33 archlinux kernel: xhci_hcd: probe of 0000:03:00.0 failed
with error -2

The USB3 controller is on the mainboard of a Samsung Series 9 Ultrabook
NP900X4D

    # lspci -vv -s 03:0.0
    03:00.0 USB controller: Renesas Technology Corp. uPD720202 USB 3.0 Host
Controller (rev 02) (prog-if 30 [XHCI])
        Subsystem: Samsung Electronics Co Ltd Device c0cd
        Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at f0500000 (64-bit, non-prefetchable) [size=8K]
        Capabilities: [50] Power Management version 3
            Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
            Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [70] MSI: Enable- Count=1/8 Maskable- 64bit+
            Address: 0000000000000000  Data: 0000
        Capabilities: [90] MSI-X: Enable- Count=8 Masked-
            Vector table: BAR=0 offset=00001000
            PBA: BAR=0 offset=00001080
        Capabilities: [a0] Express (v2) Endpoint, MSI 00
            DevCap:     MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
                ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit
0.000W
            DevCtl:     CorrErr- NonFatalErr- FatalErr- UnsupReq-
                RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                MaxPayload 128 bytes, MaxReadReq 512 bytes
            DevSta:     CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+
TransPend-
            LnkCap:     Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <4us, L1 unlimited
                ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
            LnkCtl:     ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
                ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
            LnkSta:     Speed 5GT/s (ok), Width x1 (ok)
                TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
            DevCap2: Completion Timeout: Not Supported, TimeoutDis+ NROPrPrP-
LTR+
                10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt-
EETLPPrefix-
                EmergencyPowerReduction Not Supported,
EmergencyPowerReductionInit-
                FRS- TPHComp- ExtTPHComp-
                AtomicOpsCap: 32bit- 64bit- 128bitCAS-
            DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF
Disabled,
                AtomicOpsCtl: ReqEn-
            LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                Compliance De-emphasis: -6dB
            LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-
EqualizationPhase1-
                EqualizationPhase2- EqualizationPhase3-
LinkEqualizationRequest-
                Retimer- 2Retimers- CrosslinkRes: unsupported
        Capabilities: [100 v1] Advanced Error Reporting
            UESta:      DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
            UEMsk:      DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
            UESvrt:     DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
            CESta:      RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr-
            CEMsk:      RxErr- BadTLP- BadDLLP- Rollover- Timeout-
AdvNonFatalErr+
            AERCap:     First Error Pointer: 00, ECRCGenCap- ECRCGenEn-
ECRCChkCap- ECRCChkEn-
                MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
            HeaderLog: 00000000 00000000 00000000 00000000
        Capabilities: [150 v1] Latency Tolerance Reporting
            Max snoop latency: 0ns
            Max no snoop latency: 0ns
        Kernel modules: xhci_pci



I am currently booting into LTS kernel as workaround.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
