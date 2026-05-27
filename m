Return-Path: <linux-usb+bounces-38099-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB+RHUzwFmpcxwcAu9opvQ
	(envelope-from <linux-usb+bounces-38099-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 15:23:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 285265E4DE0
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 15:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 137503035E51
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 13:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB74D35675F;
	Wed, 27 May 2026 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="b7xOgIvi"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C673A5E97;
	Wed, 27 May 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888156; cv=none; b=OazVhR55gonek77Z0IZd3Gw3CXaRnRFcgR4Q/wrtQyqVEe3BEEfGVRfR9Z8qM3IL8hOR6OFm+okkgyYc24rfpuqi3b/qKatXQ2sASi2f7DpqyTt/gGYGRSpsZv+Di2jvGAPPK+izounLUpAmnIdqnJeyR4jiynJenIgUV9gEOjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888156; c=relaxed/simple;
	bh=46gy28Ps5/XTTaorO8C7YDBN1naiceShSOaqhc62+/8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=MFu4U4Ofx19D3W5YHm04XKWEmIywbT3F1ZUqhs348Xn/I+3zBs8RNkhUV4lg+mJNKGY44fwR41Lou8P0pMO9VRzMWkVqTQVL6ScOVb/TrAAT/hi3CH5SbUeaKHBvOtOTeZuIbwC45d+b3YdgSCyBz5N+pV+gCfOzYqxlFcZXQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=b7xOgIvi; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=G7j7I7vnUKg7VVSOla9YlprNKSLsyVI0in1eX9NJedM=; b=b7xOgIviB5wAw7FqkuxPXXfoNa
	G62Soy3h3V+qwG5vdGXqCz3h6nMibPTnpReMTj1BzySy1r/pNsupR+Zxos44ZqJyHX9TkXOEy/ZE0
	Q3VH3/WcCWnHOJk0apN1t4t6ASNnCO4JgWtBxEyf8AoYDzpH6n10YYvc86OOPdQiHAaqcvnTIAT+L
	TnTgdACA4sy6PqOyCQJ/GLag9kRFTAcDeWOPvnFVMjjo46I+LzeVU+QyzZR0jJLIPpT19Ax3OzioG
	fRBNZO4O0aANS5BuPW/Fgqkm8ZIBmIutxidKljdAcSkTuk2IpuUMi1p0dmGg2v4cT1dEGv5V5elWN
	86r5buPQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wSED8-008uoj-Va; Wed, 27 May 2026 15:22:14 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wSED6-00GrkR-55; Wed, 27 May 2026 15:22:14 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <uajain@igalia.com>)
	id 1wSED5-00000004bf8-1xUw;
	Wed, 27 May 2026 15:22:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 27 May 2026 13:22:11 +0000
From: Umang Jain <uajain@igalia.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi
 <demarchi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] usb: early: xhci-dbc: Ensure correct memory size for
 early_ioremap()
In-Reply-To: <2cbaa1b8-6ae3-4aa6-adeb-4b7e73be1400@linux.intel.com>
References: <20260520094804.2981960-1-uajain@igalia.com>
 <2026052001-ruined-pesticide-9de7@gregkh>
 <81d706a4d1977ed39529336b2a8bc15f@igalia.com>
 <2026052001-regally-dizziness-2271@gregkh>
 <329c3970d932c21ca0ead6a84e573bd2@igalia.com>
 <2cbaa1b8-6ae3-4aa6-adeb-4b7e73be1400@linux.intel.com>
Message-ID: <e61515d413677c16a1fcfe6be7933ed1@igalia.com>
X-Sender: uajain@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.2, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,URIBL_BLOCKED=0.001,URIBL_ZEN_BLOCKED_OPENDNS=0.001
X-Spam-Score: -21
X-Spam-Bar: --
X-Spamd-Result: default: False [-0.36 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38099-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uajain@igalia.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.901];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 285265E4DE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mathias,

Thanks for the reply.

On 2026-05-25 21:01, Mathias Nyman wrote:
> On 20/05/2026 15.54, Umang Jain wrote:
>> On 2026-05-20 12:42, Greg Kroah-Hartman wrote:
>>> On Wed, May 20, 2026 at 12:27:39PM +0000, Umang Jain wrote:
>>>> Hi Greg,
>>>>
>>>> On 2026-05-20 11:22, Greg Kroah-Hartman wrote:
>>>>> On Wed, May 20, 2026 at 03:18:04PM +0530, Umang Jain wrote:
>>>>>> early_ioremap() checks and fail, if the memory size exceeds the fixed
>>>>>> boot-time mappings (dictated by NR_FIX_BTMAPS macro). We should ensure
>>>>>> the correct maximum memory size is passed to early_ioremap() in the
>>>>>> driver.
>>>>>>
>>>>>> Without this check and page size being 4K(4096), enabling xhci-dbc
>>>>>> on steamdeck seems to issue the warning:
>>>>>>
>>>>>> steamdeck kernel: xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
>>>>>> steamdeck kernel: ------------[ cut here ]------------
>>>>>> ay 19 13:42:57 steamdeck kernel: WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139 __early_ioremap+0xae/0x180
>>>>>> steamdeck kernel: Modules linked in:
>>>>>> steamdeck kernel: CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.25-valve1-gcab630e7af50 #13 PREEMPT(undef)  4b70872d9de6788b7f2d10dce46ada89e6cd177b
>>>>>> steamdeck kernel: RIP: 0010:__early_ioremap+0xae/0x180
>>>>>> steamdeck kernel: Code: 60 ba 3f a0 4c 89 ca 48 81 e3 00 f0 ff ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89 d5 83 fa 40 76 04 <0f> 0b eb a2 6b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
>>>>>> steamdeck kernel: RSP: 0000:ffffffff9fa03cb8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
>>>>>> steamdeck kernel: RAX: 0000000000000000 RBX: 0000000000100000 RCX: 0000000000100000
>>>>>> steamdeck kernel: RDX: 0000000000000100 RSI: 0000000000100000 RDI: 0000000080200000
>>>>>> steamdeck kernel: RBP: 0000000000000100 R08: 0000000000000000 R09: 0000000080200000
>>>>>> steamdeck kernel: R10: 0000000000000004 R11: ffffffff9fa03ad0 R12: 8000000000000163
>>>>>> steamdeck kernel: R13: 0000000000000000 R14: 0000000080200000 R15: 0000000000000000
>>>>>> steamdeck kernel: FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>>>>>> steamdeck kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>> steamdeck kernel: CR2: ffff888000000413 CR3: 000000020ed02000 CR4: 00000000000000b0
>>>>>> steamdeck kernel: Call Trace:
>>>>>> steamdeck kernel:  <TASK>
>>>>>> steamdeck kernel:  ? early_xdbc_parse_parameter+0x32c/0x360
>>>>>> steamdeck kernel:  ? setup_early_printk+0x4f5/0x520
>>>>>> steamdeck kernel:  ? do_early_param+0x44/0x70
>>>>>> steamdeck kernel:  ? parse_args+0x233/0x420
>>>>>> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>>>>>> steamdeck kernel:  ? parse_early_options+0x29/0x30
>>>>>> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
>>>>>> steamdeck kernel:  ? parse_early_param+0x64/0xc0
>>>>>> steamdeck kernel:  ? setup_arch+0x542/0xbc0
>>>>>> steamdeck kernel:  ? _printk+0x6b/0x90
>>>>>> steamdeck kernel:  ? start_kernel+0x66/0x9a0
>>>>>> steamdeck kernel:  ? x86_64_start_reservations+0x24/0x30
>>>>>> steamdeck kernel:  ? x86_64_start_kernel+0xcc/0xd0
>>>>>> steamdeck kernel:  ? common_startup_64+0x13e/0x141
>>>>>> steamdeck kernel:  </TASK>
>>>>>> steamdeck kernel: ---[ end trace 0000000000000000 ]---
>>>>>>
>>>>>> Signed-off-by: Umang Jain <uajain@igalia.com>
>>>>>> ---
>>>>>>   drivers/usb/early/xhci-dbc.c | 8 ++++++++
>>>>>>   1 file changed, 8 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
>>>>>> index 41118bba9197..699a9ac6d6c3 100644
>>>>>> --- a/drivers/usb/early/xhci-dbc.c
>>>>>> +++ b/drivers/usb/early/xhci-dbc.c
>>>>>> @@ -76,6 +76,14 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>>>>>>     	sz64 = 1ULL << __ffs64(sz64);
>>>>>>   +	/*
>>>>>> +	 * Check that size does not exceed fixed boot-time mappings
>>>>>> +	 * dictated by NR_FIX_BTMAPS. early_ioremap() will WARN_ON()
>>>>>> +	 * and not map memory in those cases.
>>>>>> +	 */
>>>>>> +	if (sz64 > (NR_FIX_BTMAPS << PAGE_SHIFT))
>>>>>> +		sz64 = NR_FIX_BTMAPS << PAGE_SHIFT;
>>>>>
>>>>> You are bounding the size here, but does this mean that the hardware
>>>>> itself is just broken and should be fixed up to properly report the
>>>>> correct size?  Does this hardware actually have a debug controller?
>>>>
>>>> Hmm, to answer your first question as far as I have read, the size is
>>>> inferred from PCI config with base address. My understanding here is
>>>> that
>>>> for early xhci debugging - the page mappings are fixed, so we need to
>>>> bound the size for early_ioremap().
>>>
>>> So the device is providing the wrong size here?  Why is this an issue
>>> only for this hardware and not other hardware?
>>>
>>>> The second answer is, yes the hardware has debug controller. We can
>>>> configure it after boot
>>>> and it works with USB3.1 Superspeed cable with host:
>>>>
>>>> (on target)
>>>> (A+)(root@steamdeck ~)# echo enable  >
>>>> /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.3/dbc
>>>> (A+)(root@steamdeck ~)# dmesg | grep DbC
>>>> [  366.276124] xhci_hcd 0000:04:00.3: DbC connected
>>>> [  366.637223] xhci_hcd 0000:04:00.3: DbC configured
>>>>
>>>> (on host)
>>>> [114288.650481] usb 4-2: new SuperSpeed USB device number 55 using
>>>> xhci_hcd
>>>> [114288.662907] usb 4-2: New USB device found, idVendor=1d6b,
>>>> idProduct=0010, bcdDevice= 0.10
>>>> [114288.662935] usb 4-2: New USB device strings: Mfr=1, Product=2,
>>>> SerialNumber=3
>>>> [114288.662945] usb 4-2: Product: Linux USB Debug Target
>>>> [114288.662953] usb 4-2: Manufacturer: Linux Foundation
>>>> [114288.662960] usb 4-2: SerialNumber: 0001
>>>> [114288.666320] usb_debug 4-2:1.0: xhci_dbc converter detected
>>>> [114288.666474] usb 4-2: xhci_dbc converter now attached to ttyUSB0
>>>>   
>>>>>
>>>>> And what changed to cause this to start complaining?  Does it fix a
>>>>> specific commit?  This hardware has been around for a long time, did we
>>>>> mess something up in the kernel for it recently?
>>>>
>>>> This fix/patch is only for early xdbc. As mentioned above, it can be
>>>> used/configured after boot.
>>>> So yes, the hardware has been around but I don't think that early xdbc
>>>> capability was investigated at any point in time. I don't see recents
>>>> commits early xhci as well so maybe it was hidden all this time.
>>>
>>> Ok, but it is good to figure out what is "wrong" here that this hardware
>>> is causing this warning to happen, yet other hardware does not.  Either
>>> the kernel has always been wrong (totally a possibility), or this
>>> hardware is reporting invalid ranges.  Figuring out which is true would
>>> be good to figure out here.
>> 
>> Oh yes definitely.
>> 
>> I, although don't have any order hardware so I will look around. I
>> haven't investigated the ranges yet, so I will investigate that too. My
>> logic initially was that it's the "early boot" that is forcing a
>> pages/size capping so we need to fit there.
>>  From __early_ioremap() in mm/early_ioremap.c
>> 
>> ...
>> 	/*
>> 	 * Mappings have to fit in the FIX_BTMAP area.
>> 	 */
>> 	nrpages = size >> PAGE_SHIFT;
>> 	if (WARN_ON(nrpages > NR_FIX_BTMAPS))
>> 		return NULL;
>> 
>> ...
>> 
> 
> Sometimes a xHC controller report a larger size than early ioremap supports.
> This is because xHC from different vendors supports different extended
> capabilities, both standard ones like DbC and vendor specific ones, all at vendor chosen offsets.
> 

That's a very useful information and I didn't really realise that there
are vendor specific DbC information that could be read out for
early-xhci dbg capability.

The size reported for 2 controllers are : 1MB (See output of in the end)

> To find offset of a extended capability we need to walk the extended capability list. If we limit the size here in software then we need to very carefully walk the capability list, making sure we don't go over that limit.

True. However, I am wondering how would be go about mapping all the
extended capability list for early dbc? Or should we do it even (stick
to the standard dbc and skip the vendor specific ones) because
early_ioremap() is already fixed to 512 boot-time mappings. Do you have
any opinion on this problem?

```
(1)(A+)(root@steamdeck ~)# lspci -vv -d ::0c03:30
04:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] VanGogh USB2
(prog-if 30 [XHCI])
	Subsystem: Valve Software Device 1776
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin D routed to IRQ 31
	Region 0: Memory at 80200000 (64-bit, non-prefetchable) [size=1M]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1
unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
TEE-IO-
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s
<64ns, L1 <1us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x16
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR-
			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+,
MaxEETLPPrefixes 1
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
			 AtomicOpsCtl: ReqEn-
			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-
EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
		Vector table: BAR=0 offset=000fe000
		PBA: BAR=0 offset=000ff000
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

04:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] VanGogh USB1
(prog-if 30 [XHCI])
	Subsystem: Valve Software Device 1776
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 40
	Region 0: Memory at 80300000 (64-bit, non-prefetchable) [size=1M]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [64] Express (v2) Endpoint, IntMsgNum 0
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1
unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
TEE-IO-
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s
<64ns, L1 <1us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 8GT/s, Width x16
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis- NROPrPrP- LTR-
			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+,
MaxEETLPPrefixes 1
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
			 AtomicOpsCtl: ReqEn-
			 IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
			 10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-
EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [c0] MSI-X: Enable+ Count=8 Masked-
		Vector table: BAR=0 offset=000fe000
		PBA: BAR=0 offset=000ff000
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

```

> 
> There was some debugging done here in this thread
> 
> https://lore.kernel.org/linux-usb/4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com/
> 
> Thanks
> Mathias

