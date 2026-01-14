Return-Path: <linux-usb+bounces-32304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C9D1BCD1
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 01:27:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F1403026AF2
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 00:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DDF1F1518;
	Wed, 14 Jan 2026 00:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="CbO0jGXO"
X-Original-To: linux-usb@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21E1E9919;
	Wed, 14 Jan 2026 00:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.129.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768350423; cv=none; b=fBbODMC1E2tFCAafvZaneiXEI4U8GZcSj0o7qcxWe7R8iWYdoRu1NNnJaltx8cgXjIeBmrgpt3K1pf9JahWy6+f/haBHBJ1ysT2Al03FAOYGnjhDUaJOhn5HLYG7E5gikKBaH04J5JSY054qu1Yyi8E4Z9JJB0iI+DfpoVB5AUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768350423; c=relaxed/simple;
	bh=ZFd7TwLz6j7GV6Khgm1LJzRPyC1X+ubkGlWMpk3uZXU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VcuvbWv23zo8vY+QLGM4X26DCnnyUgILicwvLx8qEcTFQQqKxVclX3y3Ta9Gq67xqbelgFg9NFhN8d9G/9ypsFrX/6w0AGYsL5lPb2/7Od+82jseLNJJ8nTsZz95alsL1mEkL9C6a9cy+DZB0xjWey5zbl4s/EFmgbFod1gFaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com; spf=pass smtp.mailfrom=candelatech.com; dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b=CbO0jGXO; arc=none smtp.client-ip=148.163.129.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id C651F2CB073;
	Wed, 14 Jan 2026 00:21:17 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 24FD9280083;
	Wed, 14 Jan 2026 00:21:10 +0000 (UTC)
Received: from [192.168.100.159] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id A1F4213C2B0;
	Tue, 13 Jan 2026 16:21:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com A1F4213C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1768350067;
	bh=ZFd7TwLz6j7GV6Khgm1LJzRPyC1X+ubkGlWMpk3uZXU=;
	h=Date:To:Cc:From:Subject:From;
	b=CbO0jGXO5CtrLldYKSrHc9bkowGjyKx9NU9HnhodhykW3w39/+j6QLZmJb9UaySg8
	 gpoXDGwm5yHRKmW1j9Jgat6U7OHJrFJX7RH2Un4G3obXTqb4S9qy/waLhzWzjUwQEh
	 nJta4yIEjlSRX//tJ2cLFuu1jUk1OL74iaPOP6tU=
Message-ID: <869c32e4-7bfc-c3c0-92a8-f5a3f9ea3ae3@candelatech.com>
Date: Tue, 13 Jan 2026 16:21:07 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-usb@vger.kernel.org
From: Ben Greear <greearb@candelatech.com>
Subject: Deadlock in usb subsystem on shutdown, 6.18.3+
Organization: Candela Technologies
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1768350070-PotEv5GMqMNg
X-PPE-STACK: {"stack":"us5"}
X-MDID-O:
 us5;ut7;1768350070;PotEv5GMqMNg;<greearb@candelatech.com>;10a6d3411ebddcf0ab98d49fca01b2af
X-PPE-TRUSTED: V=1;DIR=OUT;

Hello,

We caught a deadlock that appears to be in the USB code during shutdown.
We do a lot of reboots and normally all goes well, so I don't think we
can reliably reproduce the problem.

INFO: task systemd-shutdow:1 blocked for more than 180 seconds.
       Tainted: G S         O        6.18.3+ #33
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:systemd-shutdow state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x400100 flags:0x00080001
Call Trace:
  <TASK>
  __schedule+0x46b/0x1140
  schedule+0x23/0xc0
  schedule_preempt_disabled+0x11/0x20
  __mutex_lock.constprop.0+0x4f7/0x9a0
  device_shutdown+0xa0/0x220
  kernel_restart+0x36/0x90
  __do_sys_reboot+0x127/0x220
  ? do_writev+0x76/0x110
  ? do_writev+0x76/0x110
  do_syscall_64+0x50/0x6d0
  entry_SYSCALL_64_after_hwframe+0x4b/0x53
RIP: 0033:0x7fad03531087
RSP: 002b:00007ffe137cf918 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fad03531087
RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
RBP: 00007ffe137cfac0 R08: 0000000000000069 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
  </TASK>
INFO: task systemd-shutdow:1 is blocked on a mutex likely owned by task kworker/4:1:16648.
INFO: task kworker/4:2:1520 blocked for more than 360 seconds.
       Tainted: G S         O        6.18.3+ #33
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
Workqueue: events __usb_queue_reset_device
Call Trace:
  <TASK>
  __schedule+0x46b/0x1140
  ? schedule_timeout+0x79/0xf0
  schedule+0x23/0xc0
  usb_kill_urb+0x7b/0xc0
  ? housekeeping_affine+0x30/0x30
  usb_start_wait_urb+0xd6/0x160
  usb_control_msg+0xe2/0x140
  hub_port_init+0x647/0xf70
  usb_reset_and_verify_device+0x191/0x4a0
  ? device_release_driver_internal+0x4a/0x200
  usb_reset_device+0x138/0x280
  __usb_queue_reset_device+0x35/0x50
  process_one_work+0x17e/0x390
  worker_thread+0x2c8/0x3e0
  ? process_one_work+0x390/0x390
  kthread+0xf7/0x1f0
  ? kthreads_online_cpu+0x100/0x100
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork+0x114/0x140
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork_asm+0x11/0x20
  </TASK>
INFO: task kworker/4:1:16648 blocked for more than 360 seconds.
       Tainted: G S         O        6.18.3+ #33
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/4:1     state:D stack:0     pid:16648 tgid:16648 ppid:2      task_flags:0x4288060 flags:0x00080000
Workqueue: events __usb_queue_reset_device
Call Trace:
  <TASK>
  __schedule+0x46b/0x1140
  schedule+0x23/0xc0
  usb_kill_urb+0x7b/0xc0
  ? housekeeping_affine+0x30/0x30
  usb_hcd_flush_endpoint+0xb2/0x160
  usb_disable_interface+0xbb/0xe0
  usb_unbind_interface+0x11e/0x290
  ? kernfs_remove_by_name_ns+0xb0/0xd0
  device_release_driver_internal+0x197/0x200
  usb_forced_unbind_intf+0x4d/0xa0
  usb_reset_device+0xe1/0x280
  __usb_queue_reset_device+0x35/0x50
  process_one_work+0x17e/0x390
  worker_thread+0x2c8/0x3e0
  ? process_one_work+0x390/0x390
  kthread+0xf7/0x1f0
  ? kthreads_online_cpu+0x100/0x100
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork+0x114/0x140
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork_asm+0x11/0x20
  </TASK>
INFO: task kworker/6:1:16649 blocked for more than 360 seconds.
       Tainted: G S         O        6.18.3+ #33
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/6:1     state:D stack:0     pid:16649 tgid:16649 ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
  <TASK>
  __schedule+0x46b/0x1140
  schedule+0x23/0xc0
  schedule_preempt_disabled+0x11/0x20
  __mutex_lock.constprop.0+0x4f7/0x9a0
  ? update_load_avg+0x7f/0x790
  ? update_curr+0x14d/0x180
  hub_event+0x172/0x1b30
  ? finish_task_switch.isra.0+0x8d/0x270
  ? __schedule+0x473/0x1140
  process_one_work+0x17e/0x390
  worker_thread+0x2c8/0x3e0
  ? process_one_work+0x390/0x390
  kthread+0xf7/0x1f0
  ? kthreads_online_cpu+0x100/0x100
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork+0x114/0x140
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork_asm+0x11/0x20
  </TASK>
INFO: task kworker/6:1:16649 is blocked on a mutex likely owned by task kworker/4:2:1520.
NMI backtrace for cpu 14
CPU: 14 UID: 0 PID: 141 Comm: khungtaskd Kdump: loaded Tainted: G S         O        6.18.3+ #33 PREEMPT(full)
Tainted: [S]=CPU_OUT_OF_SPEC, [O]=OOT_MODULE
Hardware name: Default string /Default string, BIOS 5.27 08/08/2025
Call Trace:
  <TASK>
  dump_stack_lvl+0x60/0x80
  nmi_cpu_backtrace+0xca/0x100
  ? lapic_can_unplug_cpu+0xa0/0xa0
  nmi_trigger_cpumask_backtrace+0xc5/0xe0
  watchdog+0x6ce/0x6f0
  ? proc_dohung_task_timeout_secs+0x30/0x30
  kthread+0xf7/0x1f0
  ? kthreads_online_cpu+0x100/0x100
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork+0x114/0x140
  ? kthreads_online_cpu+0x100/0x100
  ret_from_fork_asm+0x11/0x20
  </TASK>
Sending NMI from CPU 14 to CPUs 0-13,15-19:
NMI backtrace for cpu 0 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 1 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 2 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 3 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 4 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 5 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 6 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 7 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 8 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 9 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 10 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 11 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 12 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 13 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 15 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 16 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 17 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 18 skipped: idling at intel_idle+0x50/0x80
NMI backtrace for cpu 19 skipped: idling at intel_idle+0x50/0x80

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


