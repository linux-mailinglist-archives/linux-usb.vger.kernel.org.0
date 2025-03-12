Return-Path: <linux-usb+bounces-21686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC45A5DE1F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 14:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 560F53A76FC
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 13:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B2324501B;
	Wed, 12 Mar 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YK0TSDnk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14115474C
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786572; cv=none; b=j3d09sJKuSvu/pgPlGUfa28H6lFMjy8xy/tjX3P5bRbuuIxfxpB1GEfk2KrdBCKdeZL0vS5G1QuD57UiIWejj9TBIC0fVX8Cj6NwxcuNIMMEuem3IVg1N9J6I5T0FFMXjNdwu6SQeS21YmDueR8PdYgoya/YYc8VwDHDnSC110E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786572; c=relaxed/simple;
	bh=mjfUI6p6kO2zcH3+vVJi/h0XoLidlcIyXbY+VbT6u54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QQQHpPprXkG9PkXJ4IBlCDsDo4lgw1nmgjQq+ki74/5ll51U52+XHIhCMd4qr5DHCHicm99cCC6gimISKdoBnrkjAJ3B4n3Bn9uENyVtCyB5envKfgeHZ0KCk082zULEXwH8SSXxqdMWMh+Tuq0+X0o9p/V1fW/rk1xGowIReMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YK0TSDnk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741786571; x=1773322571;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mjfUI6p6kO2zcH3+vVJi/h0XoLidlcIyXbY+VbT6u54=;
  b=YK0TSDnk0+27R+GfzrzIcw6Wi9Fkok0//STCEXkCYwlzLJWhKDitHf2B
   ksIir7wUcsSUaHBM5sffSqxFvhD0yqijzncv3wr/nVyriDPdXH0LLEq69
   ygvyfiUoU8R5jDZyLEMq6x8E7iTvkPAFnL1pQSl32Vw7OqaWS21ZfBmOx
   RFCLK2YG+ASj/dKOA8QdcgZdINvAuW6SvIhEVnmzWppCzoBzhuZ/Gxwbe
   0dm17IobY1Dn8rcWMttpgL/r/Cc3HHJkMVFta0m6vYUQ35W3Mv0gDG7Im
   TpzJjyQJABuMXJvHJtlga4vrUj5pXzDWEqleCpqPrbwH9VwUCoKD08/O6
   A==;
X-CSE-ConnectionGUID: F2835ESiSXa5mflEnsVVqQ==
X-CSE-MsgGUID: 2x9LL4x8SNCt3wwiqxMNig==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="65324824"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="65324824"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:36:09 -0700
X-CSE-ConnectionGUID: mln/H5kkRDuTMhEeM7ZXhw==
X-CSE-MsgGUID: 53I/+QYVQdWuezY9vSnDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120340098"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 12 Mar 2025 06:36:07 -0700
Message-ID: <c6866ac0-9a08-4b21-b620-5dcc9ae70611@linux.intel.com>
Date: Wed, 12 Mar 2025 15:37:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: My transfer ring grew to 740 segments
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
References: <20250311234139.0e73e138@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250311234139.0e73e138@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.3.2025 0.41, Michał Pecio wrote:
> Hi,
> 
> This happened under a simple test meant to check if AMD "Promontory"
> chipset (from ASMedia) has the delayed restart bug (it does, rarely).
> 
> Two pl2303 serial dongles were connected to a hub, loops were opening
> and closing /dev/ttyUSBn to enqueue/dequeue some IN URBs which would
> never complete with any data (nothing was fed to UART RX).
> 
> The test was running unattended for a few hours and it seems that at
> some point the hub stopped working and transfers to downstream devices
> were all returning Transaction Error. dmesg was full of this:
> 
> [102711.994235] xhci_hcd 0000:02:00.0: Event dma 0x00000000ffef4a50 for ep 6 status 4 not part of TD at 00000000eb22b790 - 00000000eb22b790
> [102711.994243] xhci_hcd 0000:02:00.0: Ring seg 0 dma 0x00000000ffef4000
> [102711.994246] xhci_hcd 0000:02:00.0: Ring seg 1 dma 0x00000000ffeee000
> [102711.994249] xhci_hcd 0000:02:00.0: Ring seg 2 dma 0x00000000ffc4e000
> 
> [ ... 735 lines omitted for brevity ... ]
> 
> [102711.995935] xhci_hcd 0000:02:00.0: Ring seg 738 dma 0x00000000eb2e2000
> [102711.995937] xhci_hcd 0000:02:00.0: Ring seg 739 dma 0x00000000eb22b000
> 
> Looking through debugfs, ffef4a50 is indeed a normal TD, apparently no
> longer on td_list for some reason and hence the errors. The rest of the
> ring is No-Ops.
> 
> Class driver enqueues its URBs, rings the doorbell and triggers this
> error message. The endpoint halts, but that is ignored. Serial device
> is closed, URBs are unlinked, Stop EP sees Halted, resests. No Set Deq
> because HW Dequeue doesn't match any known TD. Rinse, repeat.

Ok, so this means endpoint does get reset, and once restarted it
tries to transfer the same TRB, which again fails with Transaction error.

> 
> At some point end of the segment is reached, new segment is allocated
> because ep_ring->dequeue is still in the first segment.
> 
> 
> Sow how does the driver enter this screwed up state? Apparently due to
> a HW bug. More detailed debug log from a different run:
> 
> [39607.305224] xhci_hcd 0000:02:00.0: 2/6 (040/3) ring_ep_doorbell stream 0
> [39607.305235] xhci_hcd 0000:02:00.0: 2/6 (040/3) ring_ep_doorbell stream 0
> [39607.305413] xhci_hcd 0000:02:00.0: 2/6 (040/1) handle_tx_event comp_code 4 trb_dma 0x00000000ffa80050
> 
> The 1 in (040/1) is EP Ctx state, i.e. Running, despite Trans. Error.
> It looks like finish_td() sees it, ignores the error and gives back
> normally. EP Ctx is still wrong later when the next URB is unlinked:
> 
> [39607.398526] xhci_hcd 0000:02:00.0: 2/6 (040/1) xhci_urb_dequeue cancel TD at 0x00000000ffa80060 stream 0
> [39607.398531] xhci_hcd 0000:02:00.0: 2/6 (044/1) queue_stop_endpoint suspend 0
> 
> But Stop EP fails and updates it properly to 2=Halted:
> 
> [39607.398655] xhci_hcd 0000:02:00.0: 2/6 (044/2) handle_cmd_completion cmd_type 15 comp_code 19
> 
> Then the EP is reset without Set Deq or clearing and ffa80050 becomes
> "stuck and forgotten", initiating the above problem.
> 
> 
> The fact that EP Ctx state is Running for >90ms suggests that it's
> a bug. But a race could have similar effect, and I can't find any
> guarantee in the spec that EP Ctx is updated before posting an error
> transfer event. 4.8.3 guarantees that it becomes Running before normal
> transfer events are posted, but suggests not to trust EP Ctx too much.
> 
> Maybe finish_td() should be more cautious?

Good point, finish_td() should probably trust ep_state flags set by driver
first.

Thanks
Mathias



