Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B32D752142
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jul 2023 14:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234382AbjGMM1g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jul 2023 08:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234349AbjGMM1f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jul 2023 08:27:35 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82326AA
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 05:27:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-314172bac25so769124f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 13 Jul 2023 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1689251252; x=1691843252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCFLho9QXkZyks8BPwXY6c/YjMDOZgknNdKIPljSeJ0=;
        b=HKxSNiChklA3TsWLMZ6ndk1VDCe+R4tzUz0NpA1CTj1mUQ0kCmVjMrfx+B+o79qMD9
         V3tzFnTc0vUoyM43NxqND+xNepjArcYUP7eqzzscFxcSk0s7ejd5Jhs0WsE9RVduzRWn
         e7wRkkyilWB9VKmtNFuQezEQKyQuK2Jppi1z6tPwE7S6bYZcZ81j6dF4+5wunY7KEsQu
         e9XyEj+jwCNUl5Im6AtQbjrcAUlmiWrrDSXFh1AhY7iXxbpXBHCo/wFzEMRamEydbI0Q
         qMvu96qBoQsTIJ9ulPfWUAo0EQ/hfkwMWyplhXeieen917BKH6RFJznp+HBOFD8F7O9t
         7P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689251252; x=1691843252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCFLho9QXkZyks8BPwXY6c/YjMDOZgknNdKIPljSeJ0=;
        b=YwTO/knQ1Ed3QNMldJkDHB9AVZieVveOl+R8SDVURCZC4tpdLt5Xr+HSLV1XwmmN8v
         lH+cwDogvK9rko1b/8FOncD6nccnyZb1tWdTOLI+O8cQIrofrzQbygKJdIeed/znJPf/
         LeBvGvHEYptlH/xubntwz4daaz/bpQE9nA8xHcm/vtrHQFIh2BT11CHazMSRB9ZN6gsY
         5gka7wWU8kNfKFONrwzz9Cbh5BSCC0RLV6sYRrj8GezlZtpecEuqCu8JhylXlWL4KB1p
         Sdq1440lx07Jwyn3/d0krv3KkRVXqRIhFZSM+Uxmyx9tNfEOJpCR8UkBGpUIMn/GlTEA
         sSxw==
X-Gm-Message-State: ABy/qLb/R0+FMtCmHgC7pFmTqU4YMPz+duvqOg26G+QXhTJCD5Nt1pnm
        THra65JUlSIvIGdE3hkKIF+y9zez1HhniKFMECVNn8PEgjHuj126bOE=
X-Google-Smtp-Source: APBJJlHem5bjiJ+hvWYJsUhMqni22Zx7fWHxILVp+bq/5PBcUyqrVVKVR190Pr9HCNstho7NZzuVmGlLJ1snbuPnLT8=
X-Received: by 2002:adf:de12:0:b0:315:8a13:ef16 with SMTP id
 b18-20020adfde12000000b003158a13ef16mr1405836wrm.69.1689251251948; Thu, 13
 Jul 2023 05:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230713112830.21773-1-oneukum@suse.com>
In-Reply-To: <20230713112830.21773-1-oneukum@suse.com>
From:   Jonathan Bell <jonathan@raspberrypi.com>
Date:   Thu, 13 Jul 2023 13:27:20 +0100
Message-ID: <CADQZjwcF14dme4yT39pkGE8Xg+0i5Tb2vz8apb8M1RoB42CQjg@mail.gmail.com>
Subject: Re: [PATCH] Revert "xhci: add quirk for host controllers that don't
 update endpoint DCS"
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 13 Jul 2023 at 12:28, Oliver Neukum <oneukum@suse.com> wrote:
>
> This reverts commit 5255660b208aebfdb71d574f3952cf48392f4306.
>
> This quirk breaks at least the following hardware:
>
> 0b:00.0 0c03: 1106:3483 (rev 01) (prog-if 30 [XHCI])
>         Subsystem: 1106:3483
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 66
>         Region 0: Memory at fb400000 (64-bit, non-prefetchable) [size=4K]
>         Capabilities: [80] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [90] MSI: Enable+ Count=1/4 Maskable- 64bit+
>                 Address: 00000000fee007b8  Data: 0000
>         Capabilities: [c4] Express (v2) Endpoint, MSI 00
>                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <64ns, L1 <1us
>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 89W
>                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr+ TransPend-
>                 LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <2us, L1 <16us
>                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
>                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>                 LnkSta: Speed 5GT/s, Width x1
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                 DevCap2: Completion Timeout: Range B, TimeoutDis+ NROPrPrP- LTR-
>                          10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                          FRS- TPHComp- ExtTPHComp-
>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
>                          AtomicOpsCtl: ReqEn-
>                 LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>                          Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>                          Compliance Preset/De-emphasis: -6dB de-emphasis, 0dB preshoot
>                 LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                          Retimer- 2Retimers- CrosslinkRes: unsupported
>        Capabilities: [100 v1] Advanced Error Reporting
>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
>                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
>                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                 HeaderLog: 00000000 00000000 00000000 00000000
>         Kernel driver in use: xhci_hcd
>         Kernel modules: xhci_pci

Odd. There are many third party VLI cards in the field and this is the
first I've heard of an incompatibility.
Can you please report the output of
lspci -s 0b:00.0 -xxx
and pastebin a dmesg trace with xhci debug printks (and the quirk) turned on?

Regards
Jonathan

(cc Greg K-H as the previous email address was typo'd).
