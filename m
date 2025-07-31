Return-Path: <linux-usb+bounces-26291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E25CFB1733C
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 16:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DBE47A9843
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02745153598;
	Thu, 31 Jul 2025 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvrZfjnw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B762F24
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753971975; cv=none; b=AGG3CaksKvWtMws2sejXO6bkT0Rs50ZwKuWNzjrLImj4KdCnc1uXVM968MHBxTEMmv2BRMXIOBUaXEoJf8chmAJPjxwHCkSIOWQJNYeQM8hGfChsNnrDq5nwM6Zs1gS8GsdgFa81IVLcVDCqiaF3gkDIzVvm0naRS8aFkIl6eFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753971975; c=relaxed/simple;
	bh=fnBKf16cTtCbDO6zr5ouZQRqQxTpgYOksvAXgmcpfKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pp0iASrCsqTFqBZhLpuehkrS/KNh3VyQQgts6BZ5roFqijZBGk+DGmKFZxKgQObu9NffdH7H9Bi3IueymWPjbl/usVjudH/BkDhzyn6gDXw7IKFBpz0ctdhrbbqCHFRKOnY7odKGyHidEtWpx8Dz9T2og+uGFZQYR/n0JF3vsYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvrZfjnw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753971973; x=1785507973;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fnBKf16cTtCbDO6zr5ouZQRqQxTpgYOksvAXgmcpfKo=;
  b=hvrZfjnwI5Wx8WDsQz+7D9yT2HIRNsfddo5EN/8ZG5yatjFf+uzHqB1Q
   ks1c4VhaI+LGmeKO2oeC5KQ1kmcfjvjfzmzCmmig8ssSENZxfYKWZK9p0
   eb7brCL76f7mgvoTcTJ91qeQe3gdAXr38L0mCNyM07mf/xTy6QvibsRvl
   aIFaJgNxFFnvkBmV+yDnLTkIzturB0nplY8TtmXc/QnFONMAvyROytj3q
   m3rlTdbFLISgaMb3CFwAwMx12QX1M+JyWePz+kp+bnptN97DDUie3vQu7
   5nAiUoNnHHTODMJDWSN6cZK2Jx8swGO0fHzZ6758i8rHyf5YK2cNiGVCo
   A==;
X-CSE-ConnectionGUID: avP7kk0zS/q0brUxggZ9GQ==
X-CSE-MsgGUID: dLyjKu09SOOnPsdid0b8/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55499329"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="55499329"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 07:26:10 -0700
X-CSE-ConnectionGUID: sDJmF2u0Tl+BZwQ33x7erA==
X-CSE-MsgGUID: FSQcsCANRTyHt7vxtdLZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="163643732"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 31 Jul 2025 07:26:10 -0700
Message-ID: <f277779a-34af-4db0-bef0-fa41aa538f97@linux.intel.com>
Date: Thu, 31 Jul 2025 17:26:07 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun event"
 messages
To: Robert Ham <rah@settrans.net>, =?UTF-8?Q?Micha=C5=82_Pecio?=
 <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
 <20250731101720.5d10a8f1@foxbook> <20250731102728.503cd612@foxbook>
 <3bbb710c-351d-46ec-a2e4-9ee4d766a750@settrans.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <3bbb710c-351d-46ec-a2e4-9ee4d766a750@settrans.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31.7.2025 13.11, Robert Ham wrote:
> I managed to sort out the tracing and debug output. Updated kernel log
> and trace:
> 
> https://settrans.net/~rah/misc/xhci-kernel-log-2.txt
> 
> https://settrans.net/~rah/misc/xhci-kernel-trace-2.txt
> 
> 
> On 31/07/2025 09:27, Michał Pecio wrote:
> 
>> Can you post "lsusb -v" for this device?
> 

Looks like The lengths and offsets in the URB, passed by audio driver does
not match the transfer sizes the device reports it will send.

The audio device reports its isoc endpoint will send 1000 bytes
every 125 microseconds:
(from your lsusb)

>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes           37
>            Transfer Type            Isochronous
>            Synch Type               Asynchronous
>            Usage Type               Implicit feedback Data
>          wMaxPacketSize     0x03e8  1x 1000 bytes
>          bInterval               1

Trace shows xhci sets up the endpoint correctly,
expecting 1000 bytes every 125 mictoseconds:

pulseaudio-1435    [000] .....    55.126749: xhci_ring_alloc: ISOC 00000000c42321b6: enq 0x00000002483a2000(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
pulseaudio-1435    [000] .....    55.126750: xhci_add_endpoint: State disabled mult 1 max P. Streams 0 interval 125 us max ESIT payload 1000 CErr 0 Type Isoc IN burst 0 maxp 1000 deq 00000002483a2001 avg trb len 1000

but the URB queued from class driver to xhci doesn't match this.
Looks like one URB contains 8 isoc transfers, (one filled every 125us) but URB expects
only 2880 bytes in total, leading to only 360 bytes per isoc transfer.

I'd take a closer look at the values filled by the audio driver to the
struct usb_iso_packet_descriptor iso_frame_desc[] array, and number_of_packets
in the URB

usbmon might show these, don't remember if it shows all isoc related fields

Trace shoes the URB turned into Isoc TRBs of 360 bytes by xhci driver.
Notice that the Buffer address also increases only by 360 bytes (0x168)
  
55.198885: xhci_urb_enqueue: 3-5.1 ep1in-isoc: urb 0000000052d17659 pipe 33920 slot 3 length 0/2880 sgs 0/0 stream 0 flags 00000204
55.198892: xhci_queue_trb: ISOC: Buffer 0000000104735000 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:c
55.198892: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2010(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198894: xhci_queue_trb: ISOC: Buffer 0000000104735168 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:C
55.198894: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2020(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198895: xhci_queue_trb: ISOC: Buffer 00000001047352d0 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:C
55.198896: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2030(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198897: xhci_queue_trb: ISOC: Buffer 0000000104735438 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:C
55.198897: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2040(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198899: xhci_queue_trb: ISOC: Buffer 00000001047355a0 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:C
55.198899: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2050(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198900: xhci_queue_trb: ISOC: Buffer 0000000104735708 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:C
55.198900: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2060(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198901: xhci_queue_trb: ISOC: Buffer 0000000104735870 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:C
55.198902: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2070(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198903: xhci_queue_trb: ISOC: Buffer 00000001047359d8 length 360 TD size 0 intr 0 type 'Isoch' flags b:i:I:c:s:I:e:C
55.198903: xhci_inc_enq: ISOC 00000000c42321b6: enq 0x00000002483a2080(0x00000002483a2000) deq 0x00000002483a2000(0x00000002483a2000) segs 2 stream 0 bounce 1000 cycle 1
55.198903: xhci_ring_ep_doorbell: Ring doorbell for Slot 3 ep1in

The audio device probably sends the 1000 bytes per isoc tranfers as it stated, but
xhci expects 360 bytes, which leads to  buffer overrun errors

55.213952: xhci_handle_event: EVENT: TRB 00000002483a2000 status 'Isoch Buffer Overrun' len 360 slot 3 ep 3 type 'Transfer Event' flags e:C
55.222154: xhci_handle_transfer: ISOC: Buffer 0000000104735000 length 360 TD size 0 intr 0 type 'Isoch' flags B:i:I:c:s:I:e:C

Thanks
Mathias


