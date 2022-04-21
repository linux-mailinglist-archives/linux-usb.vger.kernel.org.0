Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C203D50A98B
	for <lists+linux-usb@lfdr.de>; Thu, 21 Apr 2022 21:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392107AbiDUTzS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 15:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241640AbiDUTzP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 15:55:15 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 246214D252
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 12:52:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bq30so10564378lfb.3
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=E95oCRpECrkcHgbr1XeIer+3DpyiVj3Mhfwg1Oo+6lQ=;
        b=Urk1dFHReGneYhDMjEKaoZj2U3YUZb86tmzbQ6ABYzjVn0CWNnq+LO/1X/fk0JwpYK
         K7PUtcvyvPiufGrG2y6lt/tHVYza6ObHkSZt8CIBNw13ELRNyssrlMvypAFUudyu6iKP
         5WqCfEnJJbCKDwCdKSEJAFurPQxikrtHjFxYTuQRxH8OGl38NO/0diQVedDCzshrlL5P
         OKl5vio36bCytIybsTSLq0dXbEyPYsLiTzLHpM9d3H2W+ivhFwafSZ31RxOxtw28hPpW
         NGCfnL6mvCRx4wMM/QJoHVUBgmslrg2vvCXAsuQ3KH2ToTw2GEAcunwdXPKzfaBdL+GM
         fsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=E95oCRpECrkcHgbr1XeIer+3DpyiVj3Mhfwg1Oo+6lQ=;
        b=1cDzuOtdNLnSot+5m6KPT4ulPl1oFlqLCKyde1Kcu8UvjkKj+e4HMCG88HO8CmMgab
         rtp1qk1lFykhrL8/XCDFB+U8r4EizdzyzMYrrsr0/wGca4YUi4sLo1eWALfXMME+xHYh
         0/t1/eMjgQx0I9FHXsrdsdmjqEbmdUwKck0zEpSbW7uOd/pqtZ9cpfUUNiosnk+jpoye
         tLLhX5Rf26Q2xG8bGkJ2TH4unshn4/ufggel0AWdijVNqEEZsutLVmo4zKPo2biJIQ9E
         EfC1BugdNYzhjo/FqE8rd6WJQ86ghp7I4UdNw3TsNwmTH9MY+k2Xuto6DJ9lzyfCgS+q
         teYQ==
X-Gm-Message-State: AOAM533nCL7y4YVAnr57Z3XgxMBokeU7jMAfemnQzy3ADD7n8swV/4nO
        SkEuE324jht72QxGHb/AKDdleaB1IBcy6Q==
X-Google-Smtp-Source: ABdhPJwvShaoKFhdUoxDNaoWbRDS5USG0SQzZbViQqWdLwWLeOqFMTE1qzOiEYplNFWf8r8jMhorwQ==
X-Received: by 2002:a05:6512:3b9a:b0:471:ad7e:725c with SMTP id g26-20020a0565123b9a00b00471ad7e725cmr679566lfv.415.1650570742175;
        Thu, 21 Apr 2022 12:52:22 -0700 (PDT)
Received: from [192.168.1.168] (078088109026.wroclaw.vectranet.pl. [78.88.109.26])
        by smtp.gmail.com with ESMTPSA id z27-20020a2eb53b000000b0024d9bbbb640sm2084373ljm.68.2022.04.21.12.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:52:21 -0700 (PDT)
Message-ID: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com>
Subject: Wake from Thunderbolt dock doesn't work
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Date:   Thu, 21 Apr 2022 21:52:18 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have observed that when I suspend to RAM, I cannot wakeup the host
(MacBook Pro 2019) with my low-speed USB keyboard (Microsoft Comfort
Curve Keyboard 2000) connected to Thunderbolt 3 dock (CalDigit USB-C
Pro Dock).

The host runs on Intel Core i9-9980HK and lspci shows Intel Corporation
JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] and Intel Corporation
DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C 2015].

On Windows and Mac OS the system can be successfully woken up by
pressing key on keyboard connected via the dock.

When the dock is connected to host via USB A converter, that is without
the configuration channel (so switch to thunderbolt alternate protocol
is not possible and thus the dock operates as self-powered USB hub),
the wakeup from USB keyboard works fine.

When the USB keyboard is connected directly to the host via USB-C to
USB A adapter, the wakeup from USB keyboard works fine.

I have tried enabling the wakeup from all usb devices. The only issue
is that when I enable wakeup from usb1 (xHCI Host Controller), I get
spurious wakeup immediately after suspending to RAM. When I enabled
wakeup from all USB devices (in /sys/bus/usb/devices) except the usb1,
the USB keyboard (connected via dock in thunderbolt mode) still cannot
wakeup the system.

I am not sure how to debug this further. Is it possible to mask the
thunderbolt alternate protocol capability on host? That is, to make the
host pretend that the Thunderbolt alternate mode is not supported (but
still allow DisplayPort alternate mode)?

Attached is lspci -vv output related to the dock. Included are only the
entries added after the dock is connected.

Best Regards,
Tomasz Mon


43:00.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan R=
idge DD 2018] (rev 06) (prog-if 00 [Normal decode])
	Physical Slot: 4
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 81
	Bus: primary=3D43, secondary=3D44, subordinate=3D45, sec-latency=3D0
	I/O behind bridge: 00007000-00008fff [size=3D8K]
	Memory behind bridge: 88a00000-8f9fffff [size=3D112M]
	Prefetchable memory behind bridge: 00000000c8700000-00000000cf6fffff [size=
=3D112M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,D2+,D3hot+,D3c=
old+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [88] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
		Address: 00000000fee00978  Data: 0000
	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
	Capabilities: [c0] Express (v2) Upstream Port, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 0.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #3, Speed 8GT/s, Width x4, ASPM L1, Exit Latency L1 <2us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (downgraded), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: Routing-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled=
,
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- Equaliz=
ationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [50] Capability ID 0x15 [0000]
	Capabilities: [100 v1] Device Serial Number 6a-4b-80-20-b3-b7-d0-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+=
 ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCC=
hkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=3DFixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3Dff
			Status:	NegoPending- InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=3D1234 Rev=3D1 Len=
=3D100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=3D8086 Rev=3D2 Len=
=3D04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [800 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Capabilities: [a00 v1] L1 PM Substates
		L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ L1_PM_Substates=
+
			  PortCommonModeRestoreTime=3D0us PortTPowerOnTime=3D10us
		L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
			   T_CommonMode=3D0us LTR1.2_Threshold=3D0ns
		L1SubCtl2: T_PwrOn=3D10us
	Capabilities: [b00 v1] Precision Time Measurement
		PTMCap: Requester:+ Responder:+ Root:-
		PTMClockGranularity: Unimplemented
		PTMControl: Enabled:- RootSelected:-
		PTMEffectiveGranularity: Unknown
	Kernel driver in use: pcieport

44:02.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan R=
idge DD 2018] (rev 06) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 82
	Bus: primary=3D44, secondary=3D45, subordinate=3D45, sec-latency=3D0
	I/O behind bridge: 00007000-00008fff [size=3D8K]
	Memory behind bridge: 88a00000-8f9fffff [size=3D112M]
	Prefetchable memory behind bridge: 00000000c8700000-00000000cf6fffff [size=
=3D112M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,D2+,D3hot+,D3c=
old+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [88] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
		Address: 00000000fee00998  Data: 0000
	Capabilities: [ac] Subsystem: Intel Corporation Device 0000
	Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #2, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
		LnkCtl:	ASPM Disabled; Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt+ ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- ARIFwd-
			 AtomicOpsCap: Routing-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled=
, ARIFwd-
			 AtomicOpsCtl: EgressBlck-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-, Selectab=
le De-emphasis: -6dB
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- Equaliz=
ationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [50] Capability ID 0x15 [0000]
	Capabilities: [100 v1] Device Serial Number 6a-4b-80-20-b3-b7-d0-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+=
 ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCC=
hkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=3DFixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTrans-
			Arb:	Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3Dff
			Status:	NegoPending- InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=3D1234 Rev=3D1 Len=
=3D100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=3D8086 Rev=3D2 Len=
=3D04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [900 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir- CmpltRedir- UpstreamFwd+ EgressCtrl=
- DirectTrans-
		ACSCtl:	SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl=
- DirectTrans-
	Kernel driver in use: pcieport

45:00.0 USB controller: Intel Corporation JHL7540 Thunderbolt 3 USB Control=
ler [Titan Ridge DD 2018] (rev 06) (prog-if 30 [XHCI])
	Subsystem: Intel Corporation Device 0000
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Steppi=
ng- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <TAbort- =
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 256 bytes
	Interrupt: pin A routed to IRQ 83
	Region 0: Memory at 88a00000 (32-bit, non-prefetchable) [size=3D64K]
	Capabilities: [80] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=3D375mA PME(D0+,D1+,D2+,D3hot+,D3c=
old+)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 PME-
	Capabilities: [88] MSI: Enable+ Count=3D1/8 Maskable- 64bit+
		Address: 00000000fee009b8  Data: 0000
	Capabilities: [c0] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 unli=
mited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit Latency L1 <1us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR+ OBFF Disabled=
,
			 AtomicOpsCtl: ReqEn-
		LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- Retimer- 2Retimers-=
 DRS-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- Compl=
ianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- Equaliz=
ationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Device Serial Number 6a-4b-80-20-b3-b7-d0-00
	Capabilities: [200 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- =
ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+=
 ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCC=
hkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [300 v1] Virtual Channel
		Caps:	LPEVC=3D0 RefClk=3D100ns PATEntryBits=3D1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=3DFixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=3D00 MaxTimeSlots=3D1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=3D0 ArbSelect=3DFixed TC/VC=3Dff
			Status:	NegoPending- InProgress-
	Capabilities: [400 v1] Power Budgeting <?>
	Capabilities: [500 v1] Vendor Specific Information: ID=3D1234 Rev=3D1 Len=
=3D100 <?>
	Capabilities: [600 v1] Vendor Specific Information: ID=3D8086 Rev=3D2 Len=
=3D04c <?>
	Capabilities: [700 v1] Secondary PCI Express
		LnkCtl3: LnkEquIntrruptEn- PerformEqu-
		LaneErrStat: 0
	Capabilities: [800 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Kernel driver in use: xhci_hcd

