Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8873F301DE8
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 18:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbhAXR3T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jan 2021 12:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbhAXR3K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jan 2021 12:29:10 -0500
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A091FC061573
        for <linux-usb@vger.kernel.org>; Sun, 24 Jan 2021 09:28:14 -0800 (PST)
Received: from [195.4.92.120] (helo=sub1.freenet.de)
        by mout1.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l3jBL-0002dx-94; Sun, 24 Jan 2021 18:28:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:Subject:References:To:From:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CZEiwlbX+lreH9o2nWyYKdjGBY6J+eqnGThsv5HsJQQ=; b=R3RQ3lYAoALBYwfg1JfqWtBbAs
        Yx7ymBA5MNprtR3ebXGZELbnoZ/K1SDxBEtVmcmyCBs+HqTBeyIoCQpUjpuXS9GCDABvQR7dNnDRA
        zsSF/q3TYjVb9E6ommsVvXK8I6pJlEp5707kM5Ax9C1k6Vr+aqoNtDZwsOXQgfubQ+j/Oof5ZJjvI
        U7bAg62ynx4PcDwFiMA/pUZ80FVJvREmcVIB8/hmhjHwAxXZjt5RgLkq1g/GOwaZ2jXxQiWbigWbY
        GsIU87vbh2s5OvjHi8N08WhBBhXFSlHAhdf3Q2jP4Lyqmr/kNTipNuZBuzqEvc5j8hMkt09Eb+gn0
        EEMnprKQ==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:48472 helo=mail.maya.org)
        by sub1.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l3jBL-0003Mp-5v; Sun, 24 Jan 2021 18:28:11 +0100
Received: internal info suppressed
From:   Andreas Hartmann <andihartmann@01019freenet.de>
To:     linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
Message-ID: <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
Date:   Sun, 24 Jan 2021 18:28:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!48472
X-FNSign: v=2 s=66F2D8F94E6E0216E633339F334E4D6E93E684DFB6D0157FFE126DCEB32297AB
X-Scan-TS: Sun, 24 Jan 2021 18:28:11 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 22.01.21 at 09:09 Andreas Hartmann wrote:
> On 22.01.21 at 09:06 Andreas Hartmann wrote:
>>
>> Hello!
>>
>> Since a new Notebook, which sadly only provides USB 3 interfaces, I have a more 
>> or less big problem with an old driver (rt5572sta), which not just sometimes 
>> produces those warn messages, but even stalls sometimes after those warn 
>> messages (e,g, Kernel 5.3.x or 5.10.x or 5.8.x) - see attached log file.
>>
>> The driver uses the bulk method to communicate with the USB bus. By reducing the 
>> max. bulk size from 24 kByte to 12 kByte, I was able to massively reduce those 
>> warning messages and now, the USB bus even seldom stalls any more.
>>
>> I achieved this by changing the building of the bulk package from
>>
>> if (((ThisBulkSize&0xffff8000) != 0) || ((ThisBulkSize&0x6000) == 0x6000))
>>
>> to
>>
>> if (((ThisBulkSize&0xffff8000) != 0) || ((ThisBulkSize&0x3000) == 0x3000))
>>
>>
>> I can see this problem on two different AMD USB 3 controller, e.g. X370 Series 
>> Chipset USB 3.1 xHCI Controller [1022:43b9] (rev 02).

After doing some deeper investigations, I can say, that there are 4(!) different 
behaviors - besides the point, that the original sized bulk packages (24 kB) are 
working much more worse than 12 kB (reducing it further more doesn't make any 
difference any more):

1. No problem at all even over hours of stress test (netperf).


2. Sometimes "WARN Wrong bounce buffer write length" entries appear - but nothing 
more.


3. The problems shown in the attachment of the previous mail are coming up. The 
communication to the device stalls for some time or even breaks completely. It's 
when the completion routine called by the kernel detects the problem:

2021-01-19T14:01:47.492316+01:00 localhost kernel: [26509.686972] xhci_hcd 
0000:00:06.0: WARN Wrong bounce buffer write length: 0 != 512
2021-01-19T14:01:48.947710+01:00 localhost kernel: [26511.142333] 
BulkOutDataPacket failed: ReasonCode=-2!
2021-01-19T14:01:48.947737+01:00 localhost kernel: [26511.142356]       >>BulkOut 
Req=0xc7f93, Complete=0xc7f92, Other=0x2
2021-01-19T14:01:48.947739+01:00 localhost kernel: [26511.142361]       >>BulkOut 
Header:10 6 0 44 d0 0 8f 80
2021-01-19T14:01:54.303312+01:00 localhost kernel: [26516.498060] 
BulkOutDataPacket failed: ReasonCode=-2!
2021-01-19T14:01:54.303333+01:00 localhost kernel: [26516.498078]       >>BulkOut 
Req=0xc7f93, Complete=0xc7f92, Other=0x3
2021-01-19T14:01:54.303335+01:00 localhost kernel: [26516.498083]       >>BulkOut 
Header:10 6 0 44 d0 0 8f 80
2021-01-19T14:01:59.676016+01:00 localhost kernel: [26521.870773] 
BulkOutDataPacket failed: ReasonCode=-2!
2021-01-19T14:01:59.676044+01:00 localhost kernel: [26521.870800]       >>BulkOut 
Req=0xc7f93, Complete=0xc7f92, Other=0x4
2021-01-19T14:01:59.676046+01:00 localhost kernel: [26521.870815]       >>BulkOut 
Header:10 6 0 44 d0 0 8f 80

The reason code -2 (ENOENT?) is the status given by the urb struct. The driver 
tries to send the same packet again and again and suddenly it's working again 
after n retries. This mostly "works" - but not always.


4. There isn't any completion any more received. At this point, the watchdog kicks 
in and tries to reset the hardware. This mostly works (after some time) - but not 
always. Question is, why there isn't any completion call at all coming up. 
Something seems to hang completely in this case.

2021-01-24T17:11:17.562705+01:00 localhost kernel: [ 3181.024863] xhci_hcd 
0000:00:06.0: WARN Wrong bounce buffer write length: 0 != 512
2021-01-24T17:11:20.191792+01:00 localhost kernel: [ 3183.651100] Maybe the Tx 
Bulk-Out hanged! Cancel the pending Tx bulks request of idx(0)!
2021-01-24T17:11:20.191821+01:00 localhost kernel: [ 3183.651103] Unlink the 
pending URB!

2021-01-24T17:11:20.191823+01:00 localhost kernel: [ 3183.651287] set 
RTMP_ADAPTER_BULKOUT_RESET (rtusb_dataout_complete - called from done_tasklet)
2021-01-24T17:11:20.191825+01:00 localhost kernel: [ 3183.651288] 
BulkOutDataPacket failed: ReasonCode=-2!
2021-01-24T17:11:20.191826+01:00 localhost kernel: [ 3183.651290]       >>BulkOut 
Req=0x4566e8, Complete=0x4566e7, Other=0x7
2021-01-24T17:11:20.191828+01:00 localhost kernel: [ 3183.651292]       >>BulkOut 
Header:10 6 0 44 d0 0 96 80

2021-01-24T17:11:20.191829+01:00 localhost kernel: [ 3183.651299] 
CMDTHREAD_RESET_BULK_OUT(ResetPipeid=0x0)===>
2021-01-24T17:11:21.559776+01:00 localhost kernel: [ 3185.018969]       Set 0x2a0 
bit19. Clear USB DMA TX path
2021-01-24T17:11:21.559801+01:00 localhost kernel: [ 3185.018977] 
CMDTHREAD_RESET_BULK_OUT: TxContext[0]:CWPos=52912, NBPos=74696, ENBPos=87144, 
bCopy=1, pending=1!
2021-01-24T17:11:21.559803+01:00 localhost kernel: [ 3185.018978] 
BulkOut Req=0x4566e8, Complete=0x4566e7, Other=0x7
2021-01-24T17:11:21.559804+01:00 localhost kernel: [ 3185.018980] 
CMDTHREAD_RESET_BULK_OUT: Submit Tx DATA URB for failed BulkReq(0x4566e8) Done, 
status=-115!
2021-01-24T17:11:21.559805+01:00 localhost kernel: [ 3185.019001] CmdThread : 
CMDTHREAD_RESET_BULK_OUT<===


2021-01-24T17:11:25.479870+01:00 localhost kernel: [ 3188.938847] Maybe the Tx 
Bulk-Out hanged! Cancel the pending Tx bulks request of idx(0)!
2021-01-24T17:11:25.479898+01:00 localhost kernel: [ 3188.938850] Unlink the 
pending URB!

2021-01-24T17:11:25.479899+01:00 localhost kernel: [ 3188.939052] set 
RTMP_ADAPTER_BULKOUT_RESET
2021-01-24T17:11:25.479901+01:00 localhost kernel: [ 3188.939054] 
BulkOutDataPacket failed: ReasonCode=-2!
2021-01-24T17:11:25.479902+01:00 localhost kernel: [ 3188.939055]       >>BulkOut 
Req=0x4566e8, Complete=0x4566e7, Other=0x8
2021-01-24T17:11:25.479903+01:00 localhost kernel: [ 3188.939057]       >>BulkOut 
Header:10 6 0 44 d0 0 96 80

2021-01-24T17:11:25.479904+01:00 localhost kernel: [ 3188.939065] 
CMDTHREAD_RESET_BULK_OUT(ResetPipeid=0x0)===>
2021-01-24T17:11:26.844167+01:00 localhost kernel: [ 3190.303636]       Set 0x2a0 
bit19. Clear USB DMA TX path
2021-01-24T17:11:26.844192+01:00 localhost kernel: [ 3190.303644] 
CMDTHREAD_RESET_BULK_OUT: TxContext[0]:CWPos=59136, NBPos=74696, ENBPos=87144, 
bCopy=1, pending=1!
2021-01-24T17:11:26.844194+01:00 localhost kernel: [ 3190.303645] 
BulkOut Req=0x4566e8, Complete=0x4566e7, Other=0x8
2021-01-24T17:11:26.844195+01:00 localhost kernel: [ 3190.303646] 
CMDTHREAD_RESET_BULK_OUT: Submit Tx DATA URB for failed BulkReq(0x4566e8) Done, 
status=-115!
2021-01-24T17:11:26.844196+01:00 localhost kernel: [ 3190.303659] CmdThread : 
CMDTHREAD_RESET_BULK_OUT<===

Sending the urb again (usb_submit_urb) after resetting the hardware and unlinking 
the urb fails with status -115 (EINPROGRESS) and the watchdog kicks in again after 
4 s, trying the same process again - until it works again (= submit is ok and 
completion doesn't complain - could take up to 1 minute or more).


Hope this helps to get an idea of the problem!



Thanks
Andreas

About the hardware I'm currently testing on:
# lspci -s0000:00:06.0 -vv
00:06.0 USB controller: Advanced Micro Devices, Inc. [AMD] X370 Series Chipset USB 
3.1 xHCI Controller (rev 02) (prog-if 30 [XHCI])
         Subsystem: ASMedia Technology Inc. Device 1142
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

Bus 003 Device 002: ID 05e3:0732 Genesys Logic, Inc. All-in-One Cardreader
Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 002: ID 13b1:003b Linksys AE3000 802.11abgn (3x3) Wireless Adapter 
[Ralink RT3573]
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub

# lsusb -t
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/8p, 10000M
     |__ Port 4: Dev 2, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/14p, 480M
     |__ Port 3: Dev 2, If 0, Class=Vendor Specific Class, Driver=rt2870, 480M
