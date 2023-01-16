Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBDF66BA63
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jan 2023 10:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjAPJcF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Jan 2023 04:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjAPJcE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Jan 2023 04:32:04 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF93672BE
        for <linux-usb@vger.kernel.org>; Mon, 16 Jan 2023 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673861522; x=1705397522;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=GYePyBllWmbAP6QsI2cqaLtcaWfibYI2igFzYr0AhdQ=;
  b=S08uhoDSckFnhCHboTZ9d8z+DgqTQcoAwq3IHzz9nI/8Z9zCeA2Z1Soq
   Gbg3UwUHNGcuA20pfrCiw4cH+BbzG5van28Co7/veGwzA+9/yS8Rk+PO8
   Di/T9YJ9BkOv57iSL8qCpgP42JZE4/HnAgAADrI5hCnecvY+nNcUpM7d6
   3lM9XFJFx8GGB4708QCDF+s73V2lu1x4/uBu28ROxjvBPWWcYRg2Hji/l
   jgU4GVo3GWg8jJ5zHWVUtXBe0mhxg1wD4yzj5WGZGLNG0EzCi3ZWEPGqf
   L9rMqUJFTtnpKdL3uPsiXydmpTVMha9kPOGU3KrQwD/UBBZlC41+JTBP9
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="323125397"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="323125397"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2023 01:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="722249036"
X-IronPort-AV: E=Sophos;i="5.97,220,1669104000"; 
   d="scan'208";a="722249036"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2023 01:32:01 -0800
Message-ID: <9c3ac4ea-805f-9753-90f8-b0c24e3b91ba@linux.intel.com>
Date:   Mon, 16 Jan 2023 11:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <8276aace-c02e-ec19-aa64-d3bccb3a4966@suse.com>
Content-Language: en-US
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: XHCI port shutting down on new laptop while on battery power
In-Reply-To: <8276aace-c02e-ec19-aa64-d3bccb3a4966@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.1.2023 18.18, Oliver Neukum wrote:
> Hi,
> 
> this is my new laptop and I am fishing for ideas.
> If the port has no device attached and the laptop
> is on battery power
> 
> The device in question is:
> 
> linux:/usr/lib/udev/rules.d # lspci -vvvn -s 06:00.3
> 06:00.3 0c03: 1022:15e0 (prog-if 30 [XHCI])
>          Subsystem: 17aa:5125
>          Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Latency: 0, Cache Line Size: 32 bytes
>          Interrupt: pin D routed to IRQ 41
>          IOMMU group: 16
>          Region 0: Memory at d0200000 (64-bit, non-prefetchable) [size=1M]
>          Capabilities: [48] Vendor Specific Information: Len=08 <?>
>          Capabilities: [50] Power Management version 3
>                  Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                  Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>          Capabilities: [64] Express (v2) Endpoint, MSI 00
>                  DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
>                          ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
>                  DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>                          RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>                          MaxPayload 128 bytes, MaxReadReq 512 bytes
>                  DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
>                  LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
>                          ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>                  LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
>                          ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>                  LnkSta: Speed 8GT/s, Width x16
>                          TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                  DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR+
>                           10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>                           EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>                           FRS- TPHComp- ExtTPHComp-
>                           AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                  DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
>                           AtomicOpsCtl: ReqEn-
>                  LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
>                           EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>                           Retimer- 2Retimers- CrosslinkRes: unsupported
>          Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
>                  Address: 0000000000000000  Data: 0000
>          Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
>                  Vector table: BAR=0 offset=000fe000
>                  PBA: BAR=0 offset=000ff000
>          Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
>          Kernel driver in use: xhci_hcd
>          Kernel modules: xhci_pci
> 
> When I disconnect the device on the port I get:
> 
>   [  417.723677] usb 2-2: USB disconnect, device number 3
> [  417.961659] xhci_hcd 0000:06:00.3: saving config space at offset 0x0 (reading 0x15e01022)
> [  417.961676] xhci_hcd 0000:06:00.3: saving config space at offset 0x4 (reading 0x100403)
> [  417.961681] xhci_hcd 0000:06:00.3: saving config space at offset 0x8 (reading 0xc033000)
> [  417.961684] xhci_hcd 0000:06:00.3: saving config space at offset 0xc (reading 0x800008)
> [  417.961687] xhci_hcd 0000:06:00.3: saving config space at offset 0x10 (reading 0xd0200004)
> [  417.961691] xhci_hcd 0000:06:00.3: saving config space at offset 0x14 (reading 0x0)
> [  417.961694] xhci_hcd 0000:06:00.3: saving config space at offset 0x18 (reading 0x0)
> [  417.961697] xhci_hcd 0000:06:00.3: saving config space at offset 0x1c (reading 0x0)
> [  417.961701] xhci_hcd 0000:06:00.3: saving config space at offset 0x20 (reading 0x0)
> [  417.961704] xhci_hcd 0000:06:00.3: saving config space at offset 0x24 (reading 0x0)
> [  417.961708] xhci_hcd 0000:06:00.3: saving config space at offset 0x28 (reading 0x0)
> [  417.961711] xhci_hcd 0000:06:00.3: saving config space at offset 0x2c (reading 0x512517aa)
> [  417.961714] xhci_hcd 0000:06:00.3: saving config space at offset 0x30 (reading 0x0)
> [  417.961717] xhci_hcd 0000:06:00.3: saving config space at offset 0x34 (reading 0x48)
> [  417.961720] xhci_hcd 0000:06:00.3: saving config space at offset 0x38 (reading 0x0)
> [  417.961723] xhci_hcd 0000:06:00.3: saving config space at offset 0x3c (reading 0x4ff)
> [  417.961840] xhci_hcd 0000:06:00.3: PME# enabled
> 
> This looks right to me
> I added
> 
>          } else {
>                  error = pci_set_low_power_state(dev, state);
> +               pci_dbg(dev, "Gone into state %d\n", state);
> 
> to pci_set_power_state() and get:
> 
> [  417.961840] xhci_hcd 0000:06:00.3: PME# enabled
> [  417.961853] xhci_hcd 0000:06:00.3: Requested to go to 0
> 
> _That_ I do not understand
> 
> I can trigger the same effect by putting a connected mouse (usbhid) into
> autosuspend while and only while the laptop is on battery.
> The port works if I prevent a suspend.
> This looked like an ACPI issue to me, but I do not understand
> why there is a request to put the HC into D0.
> 
> Any ideas?

_S0W in ACPI tables should return maximum (lowest power) D state xHC can go to
in S0 while still being able to generate wake.

I guess if _S0W is missing or returning zero then host might end up in D0.

Also your xHC says it supports PME wake in D0. I think It's more common
that hosts only support PME wake in D3hot and D3cold.
Could be part of the issue.

-Mathias

