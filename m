Return-Path: <linux-usb+bounces-21233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E6BA4AF5D
	for <lists+linux-usb@lfdr.de>; Sun,  2 Mar 2025 06:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5CF31891509
	for <lists+linux-usb@lfdr.de>; Sun,  2 Mar 2025 05:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E736D192B74;
	Sun,  2 Mar 2025 05:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="PLAUHhm8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0646A74BED
	for <linux-usb@vger.kernel.org>; Sun,  2 Mar 2025 05:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740893818; cv=none; b=LqhlxdhXnyyllxqy3On/Gp71IH5W5wrjGPlzZO34aTTJtMVpZDh3CL9KXCy/AKCraxwmV/uVXppL6UNWMZo6RoCO6Z6t+0Tn88B2svNVURlfY8i61uAfEI8bAwzSk5REdiqbY1BQ4XuV7xIAggzhz8VL3YMY+NOencJ6Qs1TNpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740893818; c=relaxed/simple;
	bh=xyQTshH6Es45dvZx7kZi1Cz1pmYOMdwbl9J8bl/LV74=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XI1P9guLqROq06eXLmUEScTdFNuExJ/w8pPXsp8YMoaG0BEOcAmhnVhJg2j+lvfClNT9c0ADPLmCBy0x7HcN83IQPKzPrjz/QGQ23bYJ5ZrnD5DvEApLsYOgdMIHG0WKVjjzeid13slSapK90ghBBgH3dwZnWGsDwtz7foeD+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=PLAUHhm8; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.189] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z59g90RKKz15hd;
	Sun,  2 Mar 2025 00:36:52 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1740893813; bh=xyQTshH6Es45dvZx7kZi1Cz1pmYOMdwbl9J8bl/LV74=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=PLAUHhm8TmX2j5nhix9JaeL8R507J3DfPDsoOvCjxcKQDk5pbyg+NsbYYI5DHim+u
	 AEFup+62LTa/1J9KkTPWHko9Il/g0gh7wp6LHWIVijRAkppVmgKC2KFhfRzI0qkK7k
	 LPxccDvsT+wM59UarScnmO18C9vffhHI+FXFjHFo=
Message-ID: <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
Date: Sat, 1 Mar 2025 21:36:51 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
From: Kenneth Crudup <kenny@panix.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Kenneth Crudup <kenny@panix.com>
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
Content-Language: en-US
In-Reply-To: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Thinking it may have been related to timeouts (my Samsung Odyssey 
monitor can sometimes take 15 seconds to come out of sleep and start 
displaying) I'd set thunderbolt.dprx_timeout=100000 to no avail.

-K

On 3/1/25 20:57, Kenneth Crudup wrote:
> 
> Remember all those "__tb_path_deactivate_hop" messages you'd seen in my 
> previous pstore dumps? It was 'cause when I didn't get crashes with my 
> NVMe adaptor (which you found was caused by 9d573d1954) I was getting 
> these whenever I had an external monitor (all USB-C DP tunneled):
> 
> ----
> <4>[21119.295762][T22907] thunderbolt 0000:00:0d.2: 0:5: path does not 
> end on a DP adapter, cleaning up
> <4>[21119.297327][T22907] Oops: Oops: 0000 [#1] PREEMPT SMP
> <4>[21119.297334][T22907] CPU: 4 UID: 0 PID: 22907 Comm: systemd-sleep 
> Tainted: G S   U             6.14.0-rc4-kenny+ #1
> <4>[21119.297342][T22907] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER
> <4>[21119.297344][T22907] Hardware name: Dell Inc. XPS 9320/0KNXGD, BIOS 
> 2.18.1 12/24/2024
> <4>[21119.297347][T22907] RIP: 0010:__tb_path_deactivate_hop+0x5a/0x332
> <4>[21119.297359][T22907] Code: 75 d0 41 89 d6 48 89 fa 48 c7 c7 68 49 
> fe a9 e8 dc 83 f8 ff 49 8b 47 20 41 0f b6 4f 50 4
> 1 b9 91 01 00 00 49 c7 c0 70 93 ab a9 <8b> b0 00 03 00 00 8b 90 04 03 00 
> 00 48 8b 80 30 03 00 00 81 e2 ff
> <4>[21119.297363][T22907] RSP: 0000:ffffab7a1f7f37a8 EFLAGS: 00010246
> <4>[21119.297368][T22907] RAX: 0000000000000000 RBX: 0000000000000001 
> RCX: 0000000000000000
> <4>[21119.297371][T22907] RDX: 0000000000000000 RSI: 0000000000000001 
> RDI: ffff8c00af51b780
> <4>[21119.297375][T22907] RBP: ffffab7a1f7f37e8 R08: ffffffffa9ab9370 
> R09: 0000000000000191
> <4>[21119.297379][T22907] R10: ffffffffaad58d88 R11: 0000000000000003 
> R12: 0000000051c7dd20
> <4>[21119.297382][T22907] R13: ffffab7a1f7f37b0 R14: 000000000000001a 
> R15: ffffab7a00801b00
> <4>[21119.297387][T22907] FS:  00007f4822dde940(0000) 
> GS:ffff8c00af500000(0000) knlGS:0000000000000000
> <4>[21119.297393][T22907] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[21119.297397][T22907] CR2: 0000000000000300 CR3: 0000000424911002 
> CR4: 0000000000770ef0
> <4>[21119.297401][T22907] PKRU: 55555554
> <4>[21119.297404][T22907] Call Trace:
> <4>[21119.297407][T22907]  <TASK>
> <4>[21119.297413][T22907]  ? show_regs.part.0+0x1d/0x20
> <4>[21119.297425][T22907]  ? __die+0x52/0x91
> <4>[21119.297436][T22907]  ? page_fault_oops+0x9a/0x220
> <4>[21119.297444][T22907]  ? up+0x2d/0x60
> <4>[21119.297450][T22907]  ? exc_page_fault+0x2fc/0x5c0
> <4>[21119.297460][T22907]  ? asm_exc_page_fault+0x27/0x30
> <4>[21119.297469][T22907]  ? __tb_path_deactivate_hop+0x5a/0x332
> <4>[21119.297476][T22907]  ? __tb_path_deactivate_hop+0x44/0x332
> <4>[21119.297483][T22907]  __tb_path_deactivate_hops.cold+0x2e/0xaa
> <4>[21119.297490][T22907]  tb_path_deactivate+0x1e/0x110
> <4>[21119.297496][T22907]  tb_tunnel_deactivate+0x65/0x120
> ----
> 
> So when I got home this afternoon I kept throwing more pr_info() 
> checkpoints all over, and found out this was the culprit (line 436/7 of 
> ".../drivers/thunderbolt/path.c"
> ----
> return tb_port_write(port, &hop, TB_CFG_HOPS, 2 * hop_index, 2);
> ----
> 
> So I wrapped tb_port_write() with pr_info looking for bogus values and 
> found none (as well as none in the above call to it).
> 
> Taking a look at the underlying actual call to tb_cfg_write(), didn't 
> turn up anything obvious, so on a whim I did a log on .../drivers/ 
> thunderbolt and took a chance, reverted the Subject: commit and haven't 
> had a resume/hibernate crash since. (9d573d1954 is also reverted).
> 
> My typical topology is XPS-9320 -> TB Hub (I have a CalDigit TS4, a 
> Plugable TBT4-HUB3C, and a Belkin Thunderbolt 3 Dock Core, it happens on 
> all of them) and a either a USB-C DP portable monitor, or at home via a 
> USB-C-to-DisplayPort cable.
> 
> If there's any other information you need to help fix this, let me know.
> 
> -K
> 

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


