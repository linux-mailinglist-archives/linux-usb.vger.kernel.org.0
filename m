Return-Path: <linux-usb+bounces-29380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3ABE572F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 22:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D363C54745E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 20:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8E42DF71F;
	Thu, 16 Oct 2025 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kahq1OsY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603762580FF
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 20:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647796; cv=none; b=m1VMjFy5YRK+Sm92Ik97oWr2fJjcDXRKP74T7B31yAkpjXxz1kjthda4FBiDfyFhv1xjIUonp9vVcm+626V3IGcAWX8cm0LhcAKVkrpW1E/zrgVneSh4vqrE/esh/yzkrUeSdTnmRjSxTt3UpN1J1J72Kb6ZLbaIuo9dHCuM5do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647796; c=relaxed/simple;
	bh=24wzDb3fADtuaJMFHe1hSwFuWKIjrBE8HyXWyu8T/VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kud9pWO71TGdDchkzVkwpV6BC/AFZubtJ7P/lIJ57HygsDeY+PeAz1/7Ql5dgBsRSmAEpMPBItMC61U0DGBTfOwU/IRR+nnGQfyig5NNms1+ZpzEh0u40G3IOjYEtcPdDNqCAb0V8+IpFQG8lmCYb2xXxcu+jbO+zAeS7JR+7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kahq1OsY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760647794; x=1792183794;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=24wzDb3fADtuaJMFHe1hSwFuWKIjrBE8HyXWyu8T/VM=;
  b=Kahq1OsYsPajrg3JRv+ALTCErezqJ7YVJL0WEiMcQsyMtRiBQdJwZQUE
   GBqIAeQttXM6yACM+NtTFqMbyoWw0kh1u3mTN5Qibz9Y1Y+DswtN2kYQO
   CyGBiMTjd9fh2drfGHn8OmK2J0JIdtputCVqvzapQ3pY5THzP7/Vn2NL1
   b/w84ozk+JbfwXK0K31xEBXRDY5mfzPgfsmPS2C9Aiq4mP1oH0dNs1STe
   Df8eUKMxK5cyYDe6imtNK/m/kLRQ31rhORUCKfP7/B+nThzUsmAot//gW
   7uXqHEuJxWLUFPDz/CorSKJgirg9aCRuIzpNWIVVHoGSExDIpC+zvBSrY
   Q==;
X-CSE-ConnectionGUID: RcgYP0SSQr61JHOOAmxVyg==
X-CSE-MsgGUID: CAlxwE5XRiC843n9RiBa4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62764418"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62764418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 13:49:54 -0700
X-CSE-ConnectionGUID: W+ZG78MtRJ2GR6tou1vZWw==
X-CSE-MsgGUID: okZKON+WQg6MFXFPZFUCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="181762507"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.215]) ([10.245.245.215])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 13:49:53 -0700
Message-ID: <f0d0f71c-bc47-4348-85a6-d728a67c982a@linux.intel.com>
Date: Thu, 16 Oct 2025 23:49:50 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: USB DBC hang during earlyprintk initialization
To: Milan Oravec <migo.oravec@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <CAAcb1K_MJKWz+BYJmx0FDgrBOzzXm71-M7sgHDUOmBRppXWNzA@mail.gmail.com>
 <CAAcb1K_bezseTM8DrOrzVUi_W+nZoE2N0CO4k3AQWPw7=7pyjw@mail.gmail.com>
 <2025101544-galore-sculpture-b243@gregkh>
 <CAAcb1K85GK6m_bVUeSfX1GP4=mxzwfmHtaRX0EYD_jgGfQRk9Q@mail.gmail.com>
 <4e6d9b62-b9d0-4a05-99a9-143899547664@linux.intel.com>
 <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAAcb1K_a2dkj5wv__1BW-fu_Zg=z00OmQzJmekQ-GH4svYQ-GQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/25 17:31, Milan Oravec wrote:
> Hello Mathias
> 
> On Thu, Oct 16, 2025 at 3:42 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> On 10/15/25 22:11, Milan Oravec wrote:
>>> Hello Greg,
>>> thank you for looking into it.
>>>
>>> On Wed, Oct 15, 2025 at 11:13 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Wed, Oct 15, 2025 at 09:43:02AM +0200, Milan Oravec wrote:
>>>>> Hello, I'm trying to debug some hibernation related problems on my
>>>>> system, and need a USB DBC to see what is going on after screen off.
>>>>> I've connected USB debugging cable and got this error:
>>>> [St okt 15 20:57:24 2025] Linux version 6.17.3 (migo@migoG17) (gcc
>>> (GCC) 15.2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #55 SMP
>>> PREEMPT_DYNAMIC Wed Oct 15 19:24:41 CEST 2025
>>> [St okt 15 20:57:24 2025] Command line: BOOT_IMAGE=/vmlinuz
>>> root=UUID=584262b6-b020-4e4f-95a3-1db754e28b6c earlyprintk=keep,xdbc1
>>> debug ignore_loglevel sysrq_always_enabled
>>> force_early_printk sched_verbose ft usbcore.autosuspend=-1
>>> no_console_suspend hib_compression=lz4
>>> resume=UUID=54ed98b5-56c0-4ab9-95ea-da1a9322ce49
>>> [St okt 15 20:57:24 2025] BIOS-provided physical RAM map:
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x0000000000000000-0x000000000009ffff] usable
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x00000000000a0000-0x00000000000fffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x0000000000100000-0x0000000009afefff] usable
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x0000000009aff000-0x0000000009ffffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000000a000000-0x000000000a1fffff] usable
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000000a200000-0x000000000a211fff] ACPI NVS
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000000a212000-0x000000008e43dfff] usable
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000008e43e000-0x000000009443dfff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000009443e000-0x000000009453dfff] ACPI data
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000009453e000-0x000000009653dfff] ACPI NVS
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000009653e000-0x000000009a5fefff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000009a5ff000-0x000000009bffafff] usable
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000009bffb000-0x000000009cffffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000009d7f3000-0x000000009fffffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x00000000f0000000-0x00000000f7ffffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x00000000fd000000-0x00000000ffffffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x0000000100000000-0x0000000837ffffff] usable
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x0000000838000000-0x0000000857ffffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x0000000858000000-0x000000085de7ffff] usable
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000085eec0000-0x00000008801fffff] reserved
>>> [St okt 15 20:57:24 2025] BIOS-e820: [mem
>>> 0x000000fd00000000-0x000000ffffffffff] reserved
>>> [St okt 15 20:57:24 2025] xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 1
>>> [St okt 15 20:57:24 2025] ------------[ cut here ]------------
>>> [St okt 15 20:57:24 2025] WARNING: CPU: 0 PID: 0 at
>>> mm/early_ioremap.c:139 __early_ioremap+0xae/0x190
>>
>> This WARN in __early_ioremap() is triggered when the size is too large
>>
>>          /*
>>           * Mappings have to fit in the FIX_BTMAP area.
>>           */
>>          nrpages = size >> PAGE_SHIFT;
>>          if (WARN_ON(nrpages > NR_FIX_BTMAPS))
>>                  return NULL;
>>
>> The size is in this case read from the PCI config space of the second xHCI PCI
>> controller.
>>
>> Maybe the controller returns odd BAR Address0 size, or we parse it incorrectly.
>>
>> what does "lspci -vv -d ::0c03:30" show?
> 
> Here is requested output:
> 
> root@migoG17:/home/migo# lspci -vv -d ::0c03:30
> 07:00.0 USB controller: ASMedia Technology Inc. Device 242c (rev 01)
> (prog-if 30 [XHCI])
>          Subsystem: ASUSTeK Computer Inc. Device 20af
>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Latency: 0, Cache Line Size: 64 bytes
>          Interrupt: pin A routed to IRQ 25
>          IOMMU group: 20
>          Region 0: Memory at fc600000 (64-bit, non-prefetchable) [size=32K]

The first xHCI reports size=32K

> 
> 09:00.3 USB controller: Advanced Micro Devices, Inc. [AMD]
> Raphael/Granite Ridge USB 3.1 xHCI (prog-if 30 [XHCI])
>          Subsystem: ASUSTeK Computer Inc. Device 20af
>          Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Latency: 0, Cache Line Size: 64 bytes
>          Interrupt: pin D routed to IRQ 48
>          IOMMU group: 24
>          Region 0: Memory at fc300000 (64-bit, non-prefetchable) [size=1M]
And the second xHCI has size 1M

Best guess is that early_ioremap() doesn't support this large size.

-Mathias




  


