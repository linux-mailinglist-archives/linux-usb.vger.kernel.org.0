Return-Path: <linux-usb+bounces-18626-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5869F607D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41BD91881EAD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 08:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49B618872D;
	Wed, 18 Dec 2024 08:51:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12744A3C;
	Wed, 18 Dec 2024 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734511880; cv=none; b=DiLJVpdeJSHoZf66f0sVpj4OCm9HiMn9hBskW96v6r/HEir4KN/meuxBnB537CLAbM2Y4wlPL0nkmm8rpjCq/lMqxBiPUSZITK8+5WMEs7ag5ZN1kpNAcbW8zEW7RObCKj6BHt7MUbXJxwg2lRWcZiQJ5g510UiHz22ADiFvImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734511880; c=relaxed/simple;
	bh=HjmZvcW1WNN7Zq3tJnGh91BxfGRNpv++Zq+rLeRk+GM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iVM0/Q/B9gHl6Zg0DuN07DtmAGMGU/TBWcYHpBGNWgsojJX3uD4l0AMsbes1spkVwWPnwkGZG90p4X1yzWE19+yXyLYPBQiyxnBkPxd2tZPm/q+K3G8gh9r7bgt/85UnL4gbdzwXHT2b/DcqXFD7xsMcy+GOebXJK/lpBRSdaLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [10.16.2.74] (hh-wlan-02.rz-berlin.mpg.de [141.14.51.18])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8424A61E6477D;
	Wed, 18 Dec 2024 09:50:49 +0100 (CET)
Message-ID: <6d4e7456-0363-4145-a10a-5c1d15bb108c@molgen.mpg.de>
Date: Wed, 18 Dec 2024 09:50:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RIP: 0010:xhci_ring_expansion+0xbd/0x380 [xhci_hcd]
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 Jeff Chua <jeff.chua.linux@gmail.com>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <68e02165-e5a3-4751-bdf1-5b6671d42790@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <68e02165-e5a3-4751-bdf1-5b6671d42790@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Cc: +Niklas, +Jeff]


Dear Linux folks,


Am 17.12.24 um 22:57 schrieb Paul Menzel:

> Attaching a 2 TB external disk to the right port of the Dell XPS 13 9360 
> and running `sudo mkfs.ext4 -L "Verbatim HD" /dev/sda1` the command does 
> not complete and the system finally locks up and has to be hard reset:
> 
> ```
> [    0.000000] Linux version 6.13.0-rc3-00017-gf44d154d6e3d (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-8) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241210) #42 SMP PREEMPT_DYNAMIC Tue Dec 17 11:17:55 CET 2024
> […]
> [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
> […]
> [  124.234690] RIP: 0010:xhci_ring_expansion+0xbd/0x380 [xhci_hcd]
> [  124.234806] Code: ff ff 83 7d 54 04 0f 84 fa 01 00 00 48 85 ed 0f 84 2e 01 00 00 8b 44 24 40 85 c0 0f 84 82 01 00 00 48 8b 54 24 18 48 8b 45 08 <48> 8b 52 08 48 89 50 08 48 8b 55 00 48 8b 44 24 18 48 89 50 08 8b
> [  124.234819] RSP: 0018:ffffbc1a4093ba08 EFLAGS: 00010046
> [  124.234833] RAX: ffff9421ee1b1880 RBX: ffff9421c1aae240 RCX: ffff9421ee1b1d80
> [  124.234842] RDX: 0000000000000000 RSI: ffffbc1a4093ba08 RDI: 0000000000001800
> [  124.234852] RBP: ffff942213a41880 R08: 0000000000000000 R09: 0000000000000000
> [  124.234861] R10: 0000000000000000 R11: 0000000000000400 R12: 0000000000000820
> [  124.234869] R13: 0000000000000820 R14: 0000000000000000 R15: ffff9421ff86c000
> [  124.234879] FS:  0000000000000000(0000) GS:ffff94252f080000(0000) knlGS:0000000000000000
> [  124.234889] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  124.234899] CR2: 0000000000000008 CR3: 00000001bb621002 CR4: 00000000003726f0
> [  124.234909] Call Trace:
> [  124.234920]  <TASK>
> [  124.234930]  ? __die_body.cold+0x19/0x2b
> [  124.234950]  ? page_fault_oops+0x156/0x2d0
> [  124.234971]  ? dma_direct_alloc+0xc0/0x270
> [  124.234992]  ? exc_page_fault+0x81/0x190
> [  124.235009]  ? asm_exc_page_fault+0x26/0x30
> [  124.235028]  ? xhci_ring_expansion+0xbd/0x380 [xhci_hcd]
> [  124.235111]  ? xhci_ring_expansion+0x95/0x380 [xhci_hcd]
> [  124.235184]  prepare_ring+0x22e/0x2b0 [xhci_hcd]
> [  124.235272]  prepare_transfer+0x83/0x190 [xhci_hcd]
> [  124.235351]  xhci_queue_bulk_tx+0x12e/0xa30 [xhci_hcd]
> [  124.235440]  ? __kmalloc_noprof+0x26a/0x500
> [  124.235457]  ? xhci_urb_enqueue+0x82/0x390 [xhci_hcd]
> [  124.235547]  xhci_urb_enqueue+0x36b/0x390 [xhci_hcd]
> [  124.235623]  usb_hcd_submit_urb+0x98/0xc20 [usbcore]
> [  124.235754]  ? usb_alloc_urb+0x41/0x70 [usbcore]
> [  124.235861]  ? usb_alloc_urb+0x41/0x70 [usbcore]
> [  124.235950]  ? usb_alloc_urb+0x55/0x70 [usbcore]
> [  124.236039]  usb_sg_wait+0x7e/0x190 [usbcore]
> [  124.236149]  usb_stor_bulk_transfer_sglist+0x74/0x120 [usb_storage]
> [  124.236178]  usb_stor_Bulk_transport+0x1ab/0x4a0 [usb_storage]
> [  124.236200]  ? __schedule+0x4e0/0xb80
> [  124.236222]  ? release_everything+0xa0/0xa0 [usb_storage]
> [  124.236243]  usb_stor_invoke_transport+0x3b/0x510 [usb_storage]
> [  124.236265]  ? release_everything+0xa0/0xa0 [usb_storage]
> [  124.236285]  ? __cond_resched+0x31/0x50
> [  124.236303]  ? __wait_for_common+0x18f/0x1c0
> [  124.236321]  ? hrtimer_nanosleep_restart+0xe0/0xe0
> [  124.236337]  ? scsi_io_completion+0x43/0x5f0 [scsi_mod]
> [  124.236416]  ? release_everything+0xa0/0xa0 [usb_storage]
> [  124.236436]  usb_stor_control_thread+0x1d1/0x290 [usb_storage]
> [  124.236461]  kthread+0xcf/0x100
> [  124.236480]  ? kthread_park+0x80/0x80
> [  124.236496]  ret_from_fork+0x31/0x50
> [  124.236515]  ? kthread_park+0x80/0x80
> [  124.236530]  ret_from_fork_asm+0x11/0x20
> [  124.236552]  </TASK>

[…]

> ```
> 
> Please find the full log attached.

I found the fixes, Mathias posted yesterday [1].


Kind regards,

Paul


[1]: 
https://lore.kernel.org/all/20241217102122.2316814-3-mathias.nyman@linux.intel.com/

