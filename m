Return-Path: <linux-usb+bounces-8044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203787EA18
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 14:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E30B2B21772
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 13:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D011647F50;
	Mon, 18 Mar 2024 13:30:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5CC39FF8
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710768618; cv=none; b=IwjD68zXVULOcMGv92Lvm/q3oA6sEJ9gFQ7J9o+Y0GgpZNvze1tr0sfxaNOdpNN4A43sVunRxQyTccDR9kJZATtUZfrQ6UPTXQh+WfTcZZoTzjYu5K0KbyzOFBNtobSgYPcOq4wE/JJpM7ivzGM0okexgU2ZcOMIxgxibGK8RcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710768618; c=relaxed/simple;
	bh=6o1YxwheAv6aM+0IKQ1c9YngUoBCRMLvPyZF4a3Hf2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPmYsJ19kTFYkijgYZChPBwQ4Q/MALAZeSjtgQ3L767uVLPzGcKBjgByP3LL/3flPPCYVqN5nw4Bcj/ZI4HWRA2F6QyVnWW8uOExaiJH8aIxKz214Nwqz871E8YgZ/NlfbjOprOJC12jP/50QdsvEenLDNKBo4rBfRQGgFiz9hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B172DA7;
	Mon, 18 Mar 2024 06:30:50 -0700 (PDT)
Received: from [10.57.12.2] (unknown [10.57.12.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C17A3F23F;
	Mon, 18 Mar 2024 06:30:14 -0700 (PDT)
Message-ID: <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
Date: Mon, 18 Mar 2024 13:30:13 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld
 pointer
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 Klara Modin <klarasmodin@gmail.com>, gregkh@linuxfoundation.org,
 Mark Brown <broonie@kernel.org>
References: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
Content-Language: en-US
From: Aishwarya TCV <aishwarya.tcv@arm.com>
In-Reply-To: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/03/2024 11:34, Mathias Nyman wrote:
> If reading the ACPI _PLD port location object fails, or the port
> doesn't have a _PLD ACPI object then the *pld pointer will remain
> uninitialized and oops when freed.
> 
> The patch that caused this is currently in next, on its way to v6.9.
> So no need to add this to stable or current 6.8 kernel.
> 
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/7e92369a-3197-4883-9988-3c93452704f5@gmail.com/
> Tested-by: Klara Modin <klarasmodin@gmail.com>
> Fixes: f3ac348e6e04 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---

Hi Mathias,

When booting the kernel against next-master(next-20240318) with Arm64 on
JUNO using ACPI, the kernel is resulting in boot failures for our CI.

A bisect identified f3ac348e6e04 ("usb: usb-acpi: Set port connect type
of not connectable ports correctly") as introducing the failure.
Bisected it on the tag "next-20240308" at repo
"https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".

I believe this is the patch to fix the issue. Kindly note that the
failure is seen on next-master runs from the past week. Any chance that
you could get this merged into next-master sooner?

Sample log from failure against run on JUNO:
--------------------------------------------
<0>[    2.594950] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
<4>[    2.594960] Modules linked in:
<6>[    2.601938] usbhid: USB HID core driver
<4>[    2.608722]  smsc
<4>[    2.608733] CPU: 1 PID: 46 Comm: kworker/u26:0 Not tainted
6.8.0-next-20240318 #1
<4>[    2.649317] Hardware name: ARM LTD ARM Juno Development
Platform/ARM Juno Development Platform, BIOS EDK II Jan 30 2024
<4>[    2.660381] Workqueue: async async_run_entry_fn
<4>[    2.665192] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
<4>[    2.672431] pc : kfree+0x44/0x1a8
<4>[    2.676019] lr : usb_acpi_find_companion+0x138/0x1c0
<4>[    2.681257] sp : ffff800082c9b260
<4>[    2.684835] x29: ffff800082c9b260 x28: ffff000822dddc00 x27:
0000000000000000
<4>[    2.692259] x26: 0000000000000000 x25: ffff80008156bd30 x24:
ffff000822dde008
<4>[    2.699680] x23: ffff800082aadf90 x22: ffff8000826fec98 x21:
ffff000800055690
<4>[    2.707100] x20: ffff800082c9b2f0 x19: ffffffffc20b26c0 x18:
00000000fffffffe
<4>[    2.714521] x17: 00000000c94f8e36 x16: ffff800082906558 x15:
0000000000000002
<4>[    2.721941] x14: 0000000000000001 x13: 000000000014f15e x12:
ffff000800f50089
<4>[    2.729362] x11: 000000000000002e x10: 00000000ffffffff x9 :
ffff800082c9b1e0
<4>[    2.736782] x8 : ffff000800f6b050 x7 : ffff000800f5b518 x6 :
0000000000000018
<4>[    2.744203] x5 : ffff0008002c9100 x4 : ffff0008002c9100 x3 :
0000000000000c02
<4>[    2.751623] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
ffffc1ffc0000000
<4>[    2.759043] Call trace:
<4>[    2.761751]  kfree+0x44/0x1a8
<4>[    2.764989]  usb_acpi_find_companion+0x138/0x1c0
<4>[    2.769877]  acpi_device_notify+0x98/0x140
<4>[    2.774245]  device_add+0x108/0x77c
<4>[    2.778007]  device_register+0x20/0x30
<4>[    2.782028]  usb_hub_create_port_device+0x128/0x3c4
<4>[    2.787176]  hub_probe+0x6b0/0x978
<4>[    2.790849]  usb_probe_interface+0xd4/0x2b4
<4>[    2.795302]  really_probe+0xbc/0x2a0
<4>[    2.799146]  __driver_probe_device+0x78/0x12c
<4>[    2.803772]  driver_probe_device+0xdc/0x160
<4>[    2.808224]  __device_attach_driver+0xb8/0x134
<4>[    2.812938]  bus_for_each_drv+0x84/0xe0
<4>[    2.817042]  __device_attach+0xa8/0x1b0
<4>[    2.821146]  device_initial_probe+0x14/0x20
<4>[    2.825599]  bus_probe_device+0xa8/0xac
<4>[    2.829703]  device_add+0x5c4/0x77c
<4>[    2.833462]  usb_set_configuration+0x524/0x958
<4>[    2.838175]  usb_generic_driver_probe+0x60/0x88
<4>[    2.842974]  usb_probe_device+0x3c/0x11c
<4>[    2.847165]  really_probe+0xbc/0x2a0
<4>[    2.851007]  __driver_probe_device+0x78/0x12c
<4>[    2.855634]  driver_probe_device+0xdc/0x160
<4>[    2.860086]  __device_attach_driver+0xb8/0x134
<4>[    2.864799]  bus_for_each_drv+0x84/0xe0
<4>[    2.868902]  __device_attach+0xa8/0x1b0
<4>[    2.873006]  device_initial_probe+0x14/0x20
<4>[    2.877458]  bus_probe_device+0xa8/0xac
<4>[    2.881561]  device_add+0x5c4/0x77c
<4>[    2.885321]  usb_new_device+0x1d0/0x5a0
<4>[    2.889427]  register_root_hub+0xd8/0x1d0
<4>[    2.893708]  usb_add_hcd+0x3f8/0x618
<4>[    2.897554]  ehci_platform_probe+0x228/0x4dc
<4>[    2.902096]  platform_probe+0x68/0xd8
<4>[    2.906029]  really_probe+0xbc/0x2a0
<4>[    2.909872]  __driver_probe_device+0x78/0x12c
<4>[    2.914499]  driver_probe_device+0xdc/0x160
<4>[    2.918957]  __driver_attach_async_helper+0x4c/0xb4
<4>[    2.924108]  async_run_entry_fn+0x34/0xe0
<4>[    2.928388]  process_one_work+0x150/0x294
<4>[    2.932672]  worker_thread+0x304/0x408
<4>[    2.936693]  kthread+0x118/0x11c
<4>[    2.940190]  ret_from_fork+0x10/0x20
<0>[    2.944039] Code: b26287e0 d34cfe73 f2d83fe0 8b131813 (f9400660)
<4>[    2.950403] ---[ end trace 0000000000000000 ]---
<3>[   23.568762] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
<3>[   23.575137] rcu: 	(detected by 1, t=5252 jiffies, g=-579, q=11
ncpus=6)
<3>[   23.582026] rcu: All QSes seen, last rcu_preempt kthread activity
5151 (4294898132-4294892981), jiffies_till_next_fqs=1, root ->qsmask 0x0
<3>[   23.594746] rcu: rcu_preempt kthread timer wakeup didn't happen
for 5156 jiffies! g-579 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200
<3>[   23.606335] rcu: 	Possible timer handling issue on cpu=0
timer-softirq=73
<3>[   23.613394] rcu: rcu_preempt kthread starved for 5162 jiffies!
g-579 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=0
<3>[   23.624025] rcu: 	Unless rcu_preempt kthread gets sufficient CPU
time, OOM is now expected behavior.
<3>[   23.633432] rcu: RCU grace-period kthread stack dump:
<6>[   23.638750] task:rcu_preempt     state:R stack:0     pid:15
tgid:15    ppid:2      flags:0x00000008
<6>[   23.648345] Call trace:
<6>[   23.651053]  __switch_to+0xe0/0x124
<6>[   23.654814]  __schedule+0x2bc/0x848
<6>[   23.658570]  schedule+0x34/0x104
<6>[   23.662063]  schedule_timeout+0x80/0xf4
<6>[   23.666170]  rcu_gp_fqs_loop+0x124/0x460
<6>[   23.670365]  rcu_gp_kthread+0x130/0x168
<6>[   23.674472]  kthread+0x118/0x11c
<6>[   23.677970]  ret_from_fork+0x10/0x20
<3>[   23.681817] rcu: Stack dump where RCU GP kthread last ran:
<6>[   23.687571] Sending NMI from CPU 1 to CPUs 0:

Thanks,
Aishwarya

