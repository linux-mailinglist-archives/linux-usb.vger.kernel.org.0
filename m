Return-Path: <linux-usb+bounces-31440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E802CBDAFD
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 13:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BD1C30C8804
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 11:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70396330B11;
	Mon, 15 Dec 2025 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3EishA8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21C9328276;
	Mon, 15 Dec 2025 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765798818; cv=none; b=ZuA0q5zgkzR7nZ2FQM1IHG/IEJSzFejWVNTjhI8UZeqrlwVUv1yKZzMSwSXhXYMikoJsS4SYXIDtThEg6PU0BUqMOFBv/9jYXIA0uh6MNzwDvzra4TM9KBDA1sXACF94qQQJtDWamnxLlVIqIuZTlW7etWbF8cTCAcqPSwQO0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765798818; c=relaxed/simple;
	bh=DGz80DzqulJvWof5bmibQbLNNc8tdts32QGO2OtkY3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAMimklt7Vtv4WMZTX9y8EPJT7hL/jvZ03htNS3HXOQdrnYlxDB80jediOm5aOaT/K96dB2k2/xhbQbVqXGU0EArYzAlYTOIHmXLZU7zjRTwNOtDKoVavjfPrGXe4qSGRGpRr1hbqvkqlNKeb0x7YmFVNybEKd/x0sxh+gmJwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3EishA8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765798817; x=1797334817;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DGz80DzqulJvWof5bmibQbLNNc8tdts32QGO2OtkY3E=;
  b=k3EishA8otNerI7G2bEsQpYPtBk/skBGWDDdM/4nrhFEBFQkJPKNmYdr
   LQ8hBofFgRDvXv+u4J/i7Wem2dNgcCof1ifagfN5mZVX4TsxEL4onCawV
   CrQ9KhXV80hOJgovGwYgny5ehu1FHsAgQDAFK1D1dZAB1lWfR8QKyFNzi
   bXAOfIqZpVt/Hhts0AySCert3rtaGlAjKmodx2Ezqwll9ZLxG9aDHanQu
   x9cvfek9E6i6RgZoyWJbk32yZVPgSY1JbYVNUs8k2H2prv7uhzJg+On5B
   27LV6z3vyjly9i+noVxP/YhILMsNj6kfs0x7zpa5well5D50TF/VHfmlG
   A==;
X-CSE-ConnectionGUID: u2hoCMqqSYGeuUlylJd9iQ==
X-CSE-MsgGUID: 6i7vLZgQQfehvKZChi2soQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67732648"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67732648"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:40:16 -0800
X-CSE-ConnectionGUID: eHqxlH/JT2CZfhsMGBeE4A==
X-CSE-MsgGUID: 0sRyoDfbSDWhhA32AITuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="196784283"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.84]) ([10.245.244.84])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:40:13 -0800
Message-ID: <52ccfa26-4dc7-4832-8f73-ead5d6c3629f@linux.intel.com>
Date: Mon, 15 Dec 2025 13:40:08 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usb: Error while assigning device slot ID
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
 <958c8848-945e-4fe0-9ebf-481155e11d73@linux.intel.com>
 <aTKWWjfWihg0a9WP@FUE-ALEWI-WINX>
 <b8947ce6-8e34-45fa-aaa9-262ac1232bcf@linux.intel.com>
 <aTkvyXSs6_lChFdr@FUE-ALEWI-WINX>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aTkvyXSs6_lChFdr@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/25 10:31, Alexander Wilhelm wrote:
>> Flash driver appears as a Full-Speed device. Is this correct?
> 
> Yes, that's right.
> 
>> Does it work if you boot without the drive and then connect it later?
> 
> If I do so, nothing happens and I see nothing in logread, too.
> 
> [...]
>> Could you add xhci tracing, and dump the command and event rings after timeout?
> 
> Sure, here are the commands and their respective output:
> 
>      # tracer: nop
>      #
>      # entries-in-buffer/entries-written: 103/103   #P:4
>      #
>      #                                _-----=> irqs-off/BH-disabled
>      #                               / _----=> need-resched
>      #                              | / _---=> hardirq/softirq
>      #                              || / _--=> preempt-depth
>      #                              ||| / _-=> migrate-disable
>      #                              |||| /     delay
>      #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
>      #              | |         |   |||||     |         |
>              modprobe-20491   [001] .N...   242.678069: xhci_dbg_init: // Device context base array address = 0x0x00000000813f1000 (DMA), 000000006440d11f (virt)
>              modprobe-20491   [001] .N...   242.678079: xhci_ring_alloc: CMD 0000000099949093: enq 0x0000000086616000(0x0000000086616000) deq 0x0000000086616000(0x0000000086616000) segs 1 stream 0 bounce 0 cycle 1
>              modprobe-20491   [001] .N...   242.678085: xhci_dbg_init: Allocated command ring at 0000000099949093
>              modprobe-20491   [001] .N...   242.678090: xhci_dbg_init: First segment DMA is 0x0x0000000086616000
>              modprobe-20491   [001] .N...   242.678095: xhci_dbg_init: // Setting command ring address to 0x0000000086616001
>              modprobe-20491   [001] .N...   242.678101: xhci_dbg_init: // Doorbell array is located at offset 0x480 from cap regs base addr
>              modprobe-20491   [001] .N...   242.678106: xhci_dbg_init: Allocating primary event ring
>              modprobe-20491   [001] .N...   242.678111: xhci_ring_alloc: EVENT 0000000069cb484c: enq 0x000000009dd65000(0x000000009dd65000) deq 0x000000009dd65000(0x000000009dd65000) segs 2 stream 0 bounce 0 cycle 1
>              modprobe-20491   [001] .N...   242.678118: xhci_dbg_init: // Write event ring dequeue pointer, preserving EHB bit
>              modprobe-20491   [001] .N...   242.678199: xhci_dbg_init: xhci_run
>              modprobe-20491   [001] .N...   242.678204: xhci_dbg_init: ERST deq = 64'h9dd65000
>              modprobe-20491   [001] dN...   242.678318: xhci_dbg_init: // Turn on HC, cmd = 0x5.
>           kworker/1:1-54      [001] d....   242.695620: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
>           kworker/1:3-20526   [001] d....   242.699424: xhci_get_port_status: port-0: Powered Connected Disabled Link:Polling PortSpeed:1 Change: CSC Wake:
>           kworker/1:2-82      [001] d....   242.699445: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
>           kworker/1:0-21      [001] d....   242.775417: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
>           kworker/1:0-21      [001] d....   242.779413: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
>           kworker/1:0-21      [001] d....   242.783420: xhci_get_port_status: port-0: Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
>           kworker/1:0-21      [001] d....   242.803419: xhci_get_port_status: port-0: Powered Connected Disabled Link:Polling PortSpeed:1 Change: Wake:
>           kworker/1:0-21      [001] d....   242.803448: xhci_queue_trb: CMD: Enable Slot Command: flags C
>           kworker/1:0-21      [001] d....   242.803449: xhci_inc_enq: CMD 0000000099949093: enq 0x0000000086616010(0x0000000086616000) deq 0x0000000086616000(0x0000000086616000) segs 1 stream 0 bounce 0 cycle 1
>           kworker/1:0-21      [001] d....   242.803455: xhci_ring_host_doorbell: Ring doorbell for Command Ring 0
> 

Command ring is at 0x0000000086616000, crcr register is set correctly, cycle is set to 1
Event ring is at 0x000000009dd65000

Driver correctly writes the command to command ring at 0x0000000086616001

> even-ring/trbs:
> 
>      0x000000009dd65000: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
>      0x000000009dd65010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000
> 
> command-ring/trbs:
> 
>      0x0000000086616000: Enable Slot Command: flags C
>      0x0000000086616010: type 'UNKNOWN' -> raw 00000000 00000000 00000000 00000000

> 
> It seems like the TRBS output here is not very useful, is it?


It shows the enable slot command was correctly queued to the command ring at 0x86616000,
but xHC controller didn't process it at all as event ring is empty.

It behaves as if xHC isn't really running at all.
portsc registers can show port status (connect) even if xHC isn't running.

I guess next step would be to bisect this and find the offending commit

Thanks
Mathias


