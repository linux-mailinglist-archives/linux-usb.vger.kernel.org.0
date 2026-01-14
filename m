Return-Path: <linux-usb+bounces-32309-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF5D1C28A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 03:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6873D302DB31
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 02:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857F431ED8B;
	Wed, 14 Jan 2026 02:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="H8shPOKp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DB031AA90
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 02:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768358729; cv=none; b=PxlBElGel6TTeHxjfVGTUxJNS8nxGeKd3maw6IHvKPzgjoBtg5KyjGwDuGDO3AdLvEZoo4EUFfBYzfGPRoP4I96KKEpWyWDkRJB4DKFKLT0wLVBlQp6ZOIhVAEoYwY7PoaLHXlgNTiPq0gx/FLEH/kQRhKj4NJ5FVgh21YIA4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768358729; c=relaxed/simple;
	bh=Kyhfknpa8xOndCTNsYYDpT7gG5aRNRT9X58xNV2LDyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SOIPgiE8bXz8bZUxLQwkhHijfrsK7koeAZSQLPoiACgN8p8/waJhFJ2jWJwY4ga+xJaiKd1DWBkrev63KzMN0Zbx1Cnm0MKRB3TBlAH4ojcB8lXn2E75rhLvWtf+g4gJtz7xPfXGFmWXUYYJ6TQynxcU2QP7bduZi+PJ4o7OnB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=H8shPOKp; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1768358725;
	bh=OA0AU4Okl+YGrpZusFuv3owQsLlPMh/SzJ+piU5bXUo=;
	h=From:Subject:Date:Message-ID;
	b=H8shPOKpI82zUmtv7wmV6PgKMjZDB70MenvYQjKdtN8SIm6DwHGlJu8XOhqApxQSN
	 U5W6yhxou79auXgxqe4R+kVErj1jTcxrbTtC7H12QBhu66Xvts93JzfXBGlRv3RuhP
	 pS/UIxRX6I+H56Hko7IVhS4RAwiXw2MvLNdQWp88=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.160])
	by sina.com (10.54.253.34) with ESMTP
	id 6967033A00004231; Wed, 14 Jan 2026 10:45:16 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6537896292047
X-SMAIL-UIID: 92A704201FAA41EA903CA5A99355FB4D-20260114-104516-1
From: Hillf Danton <hdanton@sina.com>
To: Ben Greear <greearb@candelatech.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
Date: Wed, 14 Jan 2026 10:45:05 +0800
Message-ID: <20260114024506.2210-1-hdanton@sina.com>
In-Reply-To: <869c32e4-7bfc-c3c0-92a8-f5a3f9ea3ae3@candelatech.com>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Jan 2026 16:21:07 -0800 Ben Greear wrote:
> Hello,
> 
> We caught a deadlock that appears to be in the USB code during shutdown.
> We do a lot of reboots and normally all goes well, so I don't think we
> can reliably reproduce the problem.
> 
> INFO: task systemd-shutdow:1 blocked for more than 180 seconds.
>        Tainted: G S         O        6.18.3+ #33
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:systemd-shutdow state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x400100 flags:0x00080001
> Call Trace:
>   <TASK>
>   __schedule+0x46b/0x1140
>   schedule+0x23/0xc0
>   schedule_preempt_disabled+0x11/0x20
>   __mutex_lock.constprop.0+0x4f7/0x9a0
>   device_shutdown+0xa0/0x220
>   kernel_restart+0x36/0x90
>   __do_sys_reboot+0x127/0x220
>   ? do_writev+0x76/0x110
>   ? do_writev+0x76/0x110
>   do_syscall_64+0x50/0x6d0
>   entry_SYSCALL_64_after_hwframe+0x4b/0x53
> RIP: 0033:0x7fad03531087
> RSP: 002b:00007ffe137cf918 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fad03531087
> RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
> RBP: 00007ffe137cfac0 R08: 0000000000000069 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>   </TASK>
> INFO: task systemd-shutdow:1 is blocked on a mutex likely owned by task kworker/4:1:16648.

This explains why the shutdown stalled.

> INFO: task kworker/4:2:1520 blocked for more than 360 seconds.
>        Tainted: G S         O        6.18.3+ #33
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
> Workqueue: events __usb_queue_reset_device
> Call Trace:
>   <TASK>
>   __schedule+0x46b/0x1140
>   ? schedule_timeout+0x79/0xf0
>   schedule+0x23/0xc0
>   usb_kill_urb+0x7b/0xc0
>   ? housekeeping_affine+0x30/0x30
>   usb_start_wait_urb+0xd6/0x160
>   usb_control_msg+0xe2/0x140
>   hub_port_init+0x647/0xf70
>   usb_reset_and_verify_device+0x191/0x4a0
>   ? device_release_driver_internal+0x4a/0x200
>   usb_reset_device+0x138/0x280
>   __usb_queue_reset_device+0x35/0x50
>   process_one_work+0x17e/0x390
>   worker_thread+0x2c8/0x3e0
>   ? process_one_work+0x390/0x390
>   kthread+0xf7/0x1f0
>   ? kthreads_online_cpu+0x100/0x100
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork+0x114/0x140
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork_asm+0x11/0x20
>   </TASK>
> INFO: task kworker/4:1:16648 blocked for more than 360 seconds.
>        Tainted: G S         O        6.18.3+ #33
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/4:1     state:D stack:0     pid:16648 tgid:16648 ppid:2      task_flags:0x4288060 flags:0x00080000
> Workqueue: events __usb_queue_reset_device
> Call Trace:
>   <TASK>
>   __schedule+0x46b/0x1140
>   schedule+0x23/0xc0
>   usb_kill_urb+0x7b/0xc0

Kworker failed to kill urb within 300 seconds, so we know the underlying usb
hardware failed to response within 300s.

That said, the deadlock in the subject line is incorrect, but task hung due
to hardware glitch.

>   ? housekeeping_affine+0x30/0x30
>   usb_hcd_flush_endpoint+0xb2/0x160
>   usb_disable_interface+0xbb/0xe0
>   usb_unbind_interface+0x11e/0x290
>   ? kernfs_remove_by_name_ns+0xb0/0xd0
>   device_release_driver_internal+0x197/0x200
>   usb_forced_unbind_intf+0x4d/0xa0
>   usb_reset_device+0xe1/0x280
>   __usb_queue_reset_device+0x35/0x50
>   process_one_work+0x17e/0x390
>   worker_thread+0x2c8/0x3e0
>   ? process_one_work+0x390/0x390
>   kthread+0xf7/0x1f0
>   ? kthreads_online_cpu+0x100/0x100
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork+0x114/0x140
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork_asm+0x11/0x20
>   </TASK>
> INFO: task kworker/6:1:16649 blocked for more than 360 seconds.
>        Tainted: G S         O        6.18.3+ #33
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/6:1     state:D stack:0     pid:16649 tgid:16649 ppid:2      task_flags:0x4208060 flags:0x00080000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   <TASK>
>   __schedule+0x46b/0x1140
>   schedule+0x23/0xc0
>   schedule_preempt_disabled+0x11/0x20
>   __mutex_lock.constprop.0+0x4f7/0x9a0
>   ? update_load_avg+0x7f/0x790
>   ? update_curr+0x14d/0x180
>   hub_event+0x172/0x1b30
>   ? finish_task_switch.isra.0+0x8d/0x270
>   ? __schedule+0x473/0x1140
>   process_one_work+0x17e/0x390
>   worker_thread+0x2c8/0x3e0
>   ? process_one_work+0x390/0x390
>   kthread+0xf7/0x1f0
>   ? kthreads_online_cpu+0x100/0x100
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork+0x114/0x140
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork_asm+0x11/0x20
>   </TASK>
> INFO: task kworker/6:1:16649 is blocked on a mutex likely owned by task kworker/4:2:1520.
> NMI backtrace for cpu 14
> CPU: 14 UID: 0 PID: 141 Comm: khungtaskd Kdump: loaded Tainted: G S         O        6.18.3+ #33 PREEMPT(full)
> Tainted: [S]=CPU_OUT_OF_SPEC, [O]=OOT_MODULE
> Hardware name: Default string /Default string, BIOS 5.27 08/08/2025
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x60/0x80
>   nmi_cpu_backtrace+0xca/0x100
>   ? lapic_can_unplug_cpu+0xa0/0xa0
>   nmi_trigger_cpumask_backtrace+0xc5/0xe0
>   watchdog+0x6ce/0x6f0
>   ? proc_dohung_task_timeout_secs+0x30/0x30
>   kthread+0xf7/0x1f0
>   ? kthreads_online_cpu+0x100/0x100
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork+0x114/0x140
>   ? kthreads_online_cpu+0x100/0x100
>   ret_from_fork_asm+0x11/0x20
>   </TASK>
> Sending NMI from CPU 14 to CPUs 0-13,15-19:
> NMI backtrace for cpu 0 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 1 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 2 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 3 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 4 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 5 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 6 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 7 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 8 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 9 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 10 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 11 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 12 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 13 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 15 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 16 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 17 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 18 skipped: idling at intel_idle+0x50/0x80
> NMI backtrace for cpu 19 skipped: idling at intel_idle+0x50/0x80
> 
> Thanks,
> Ben
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

