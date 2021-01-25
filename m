Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC830356C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 06:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbhAZFlE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 00:41:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbhAYKTb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jan 2021 05:19:31 -0500
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD54C0613ED
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 02:18:26 -0800 (PST)
Received: from [195.4.92.123] (helo=sub4.freenet.de)
        by mout1.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l3yww-00026z-Sx; Mon, 25 Jan 2021 11:18:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:References:To:From:Sender:Reply-To:Cc:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ulLjty9ZuinLfFXYnoUTiDxgHrddVW2mBXYVrdk3YfQ=; b=yfLKTCGGf49oNXbtbLa/+B5IZ
        oG5LsAzbYC2xyAuuJYvZ+g0w7K3eePp8QHg7nt9cTazz24AubGu0jYHOzG8XCuZwag3F6008EPqwy
        n5VR9zthX+SLkdM5F9zdSLemyquiZVGgmAMkVyXhrDUJNAFOhcc2mpesP14KJ/zwykLRRuOAiNZQo
        zNP33QLmOxUqugIRAW2hTDECga6mW/p4wqJnGW1Lfep4F0PBB/V5EX53IQugKdRAaG6aoFPGbsoiP
        +BnMq/THGTAwLsmlc78ZAM+GlDvywYtn9MZ6AxQrzw64xZIYoNgSwWeIls02Nt4CaJ+YxtjuF9p4w
        MREUcxePg==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:56424 helo=mail.maya.org)
        by sub4.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l3yww-0004h7-Ru; Mon, 25 Jan 2021 11:18:22 +0100
Received: internal info suppressed
From:   Andreas Hartmann <andihartmann@01019freenet.de>
To:     linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
Message-ID: <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
Date:   Mon, 25 Jan 2021 11:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
Content-Type: multipart/mixed;
 boundary="------------23D0A518B3314DAAF21E25EB"
Content-Language: en-US
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!56424
X-FNSign: v=2 s=D2DB334A4C792FEF5FE966B9B79817808469EA5A167E10F0444C4ECA8938F6C2
X-Scan-TS: Mon, 25 Jan 2021 11:18:22 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------23D0A518B3314DAAF21E25EB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hello!

Meanwhile I found the culprit:

https://www.spinics.net/lists/linux-usb/msg141467.html
and
https://www.spinics.net/lists/linux-usb/msg141468.html

Especially the last change breaks things here completely. After removing them by 
the attached patch, problems are gone and device works again as expected (I tested 
with the original 24 kB bulk size which was horribly broken w/o the attached 
patch). This means: the additional repair steps are not just breaking things but 
are even unnecessary (it's working perfectly without those changes) here.


I tested with 2 USB 3.1 host controllers:

USB controller: Advanced Micro Devices, Inc. [AMD] Raven USB 3.1 (prog-if 30 [XHCI])

05:00.3 0c03: 1022:15e0 (prog-if 30 [XHCI])
         Subsystem: 1043:201f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin D routed to IRQ 37
         Region 0: Memory at f7300000 (64-bit, non-prefetchable) [size=1M]
         Capabilities: [48] Vendor Specific Information: Len=08 <?>
         Capabilities: [50] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [64] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 
unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 0.000W
                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
                 LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit 
Latency L0s <64ns, L1 <1us
                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 8GT/s, Width x16, TrErr- Train- SlotClk+ DLActive- 
BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+, 
OBFF Not Supported
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, 
OBFF Disabled
                          AtomicOpsCtl: ReqEn-
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete-, EqualizationPhase1-
                          EqualizationPhase2-, EqualizationPhase3-, 
LinkEqualizationRequest-
         Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
                 Vector table: BAR=0 offset=000fe000
                 PBA: BAR=0 offset=000ff000
         Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
         Kernel driver in use: xhci_hcd
         Kernel modules: xhci_pci

The 2. device on the same machine has the PCI-ID 1022:15e1


Another USB3.1 host device tested with was:
USB controller: Advanced Micro Devices, Inc. [AMD] X370 Series Chipset USB 3.1 
xHCI Controller (rev 02) (prog-if 30 [XHCI])

00:06.0 0c03: 1022:43b9 (rev 02) (prog-if 30 [XHCI])
         Subsystem: 1b21:1142
         Physical Slot: 6
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR+ FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 29
         Region 0: Memory at febd0000 (64-bit, non-prefetchable) [size=32K]
         Capabilities: [50] MSI: Enable+ Count=1/8 Maskable- 64bit+
                 Address: 00000000fee0e000  Data: 4023
         Capabilities: [78] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA 
PME(D0-,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [80] Express (v2) Legacy Endpoint, MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s <64ns, L1 <2us
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
                 DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L0s L1, Exit Latency 
L0s <2us, L1 unlimited
                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                 LnkSta: Speed 8GT/s, Width x4, TrErr- Train- SlotClk+ DLActive- 
BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+, 
OBFF Not Supported
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, 
OBFF Disabled
                          AtomicOpsCtl: ReqEn-
                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+, 
EqualizationPhase1+
                          EqualizationPhase2-, EqualizationPhase3-, 
LinkEqualizationRequest-
         Kernel driver in use: xhci_hcd
         Kernel modules: xhci_pci


Please fix those changes or disable them for the mentioned devices or add an 
option to disable this additional alignment feature.


Thanks
Andreas

--------------23D0A518B3314DAAF21E25EB
Content-Type: text/x-patch; charset=UTF-8;
 name="xhci-ring-no-alignment.c.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="xhci-ring-no-alignment.c.diff"

--- 1/drivers/usb/host/xhci-ring.c	2021-01-25 08:57:52.199210954 +0100
+++ 2/drivers/usb/host/xhci-ring.c	2021-01-25 08:59:29.450511420 +0100
@@ -3250,6 +3250,10 @@ static int xhci_align_td(struct xhci_hcd
 	/* we got lucky, last normal TRB data on segment is packet aligned */
 	if (unalign =3D=3D 0)
 		return 0;
+	else {
+		xhci_dbg(xhci, "unaligned - but ignored\n");
+		return 0;
+	}
=20
 	xhci_dbg(xhci, "Unaligned %d bytes, buff len %d\n",
 		 unalign, *trb_buff_len);

--------------23D0A518B3314DAAF21E25EB--
