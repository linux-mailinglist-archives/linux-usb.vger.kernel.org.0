Return-Path: <linux-usb+bounces-32341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD831D20A90
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 18:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CADE5301936B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 17:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78F232BF23;
	Wed, 14 Jan 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="j6dKobtk"
X-Original-To: linux-usb@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E826322C99;
	Wed, 14 Jan 2026 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.154.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768413116; cv=none; b=iKtxCaoBXG2oZ1ZAf2DO3nKS13K8QgtUS2ZfIpGwBwKIXR+NFSADYAbr32vnoj58+HYyZRU5XG7eIiS7+qF938GXTXwd4gQ9MiRfYz3y0vMhNI93KHqfJIVV12GA0qiEruVauH+383hPL/FolVOAyU69wqAqw7Oq/MFXX/qTxQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768413116; c=relaxed/simple;
	bh=l0sdcZvhEfKLiz2XzP7r6RfxfyyeHUxPt+GghWyCyY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O0rNrskJaAuAWCj/DWQvv+If0LdKdo1BmABs2MESgPUBJY3+iA4oev45fhalP23Agay42mmIqdZP+zjGQx4zf+bq8awnuuIJrIWwFI7Rh7GHs0kyp40zEiNETdPV1zUAd7WVF+oD1tC1lEBRz0sP+RXhllPzY8yxCk1nUvR1F9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com; spf=pass smtp.mailfrom=candelatech.com; dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b=j6dKobtk; arc=none smtp.client-ip=67.231.154.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 29DF2180070;
	Wed, 14 Jan 2026 17:51:52 +0000 (UTC)
Received: from [192.168.100.159] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id C689C13C2B0;
	Wed, 14 Jan 2026 09:51:48 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com C689C13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1768413108;
	bh=l0sdcZvhEfKLiz2XzP7r6RfxfyyeHUxPt+GghWyCyY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6dKobtkl7hx+0q0Oe/cOvCqgszlqTYAl5PZPnl6rgtLRPsKEcXQcd10sLmXab18R
	 rK/7hFATvOy3UFAYXvyIBJ58TzF7j4sLTkzzPxWc3PHTZ5Mzxu7amBv80bRzc2aOyL
	 I0jskROWh1cDr+v0t0qnIB2UhNVVSnvd2NBWLrWU=
Message-ID: <a721a966-0a4b-cbc4-71ac-a482156ffa48@candelatech.com>
Date: Wed, 14 Jan 2026 09:51:48 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Hillf Danton <hdanton@sina.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org
References: <20260114024506.2210-1-hdanton@sina.com>
 <dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>
 <c52546af-e39e-4096-ad11-9b38bb2d5f7e@rowland.harvard.edu>
Content-Language: en-US
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <c52546af-e39e-4096-ad11-9b38bb2d5f7e@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1768413113-5Yzp3cLHAHhY
X-PPE-STACK: {"stack":"us5"}
X-MDID-O:
 us5;at1;1768413113;5Yzp3cLHAHhY;<greearb@candelatech.com>;ee17c9fd100a35a17eab89642fd6028b
X-PPE-TRUSTED: V=1;DIR=OUT;

On 1/14/26 07:13, Alan Stern wrote:
> On Wed, Jan 14, 2026 at 06:36:41AM -0800, Ben Greear wrote:
>> On 1/13/26 18:45, Hillf Danton wrote:
>>> On Tue, 13 Jan 2026 16:21:07 -0800 Ben Greear wrote:
>>>> Hello,
>>>>
>>>> We caught a deadlock that appears to be in the USB code during shutdown.
>>>> We do a lot of reboots and normally all goes well, so I don't think we
>>>> can reliably reproduce the problem.
>>>>
>>>> INFO: task systemd-shutdow:1 blocked for more than 180 seconds.
>>>>          Tainted: G S         O        6.18.3+ #33
>>>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>> task:systemd-shutdow state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x400100 flags:0x00080001
>>>> Call Trace:
>>>>     <TASK>
>>>>     __schedule+0x46b/0x1140
>>>>     schedule+0x23/0xc0
>>>>     schedule_preempt_disabled+0x11/0x20
>>>>     __mutex_lock.constprop.0+0x4f7/0x9a0
>>>>     device_shutdown+0xa0/0x220
>>>>     kernel_restart+0x36/0x90
>>>>     __do_sys_reboot+0x127/0x220
>>>>     ? do_writev+0x76/0x110
>>>>     ? do_writev+0x76/0x110
>>>>     do_syscall_64+0x50/0x6d0
>>>>     entry_SYSCALL_64_after_hwframe+0x4b/0x53
>>>> RIP: 0033:0x7fad03531087
>>>> RSP: 002b:00007ffe137cf918 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
>>>> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fad03531087
>>>> RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
>>>> RBP: 00007ffe137cfac0 R08: 0000000000000069 R09: 0000000000000000
>>>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>>>> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>>>     </TASK>
>>>> INFO: task systemd-shutdow:1 is blocked on a mutex likely owned by task kworker/4:1:16648.
>>>
>>> This explains why the shutdown stalled.
>>>
>>>> INFO: task kworker/4:2:1520 blocked for more than 360 seconds.
>>>>          Tainted: G S         O        6.18.3+ #33
>>>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>> task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
>>>> Workqueue: events __usb_queue_reset_device
>>>> Call Trace:
>>>>     <TASK>
>>>>     __schedule+0x46b/0x1140
>>>>     ? schedule_timeout+0x79/0xf0
>>>>     schedule+0x23/0xc0
>>>>     usb_kill_urb+0x7b/0xc0
>>>>     ? housekeeping_affine+0x30/0x30
>>>>     usb_start_wait_urb+0xd6/0x160
>>>>     usb_control_msg+0xe2/0x140
>>>>     hub_port_init+0x647/0xf70
>>>>     usb_reset_and_verify_device+0x191/0x4a0
>>>>     ? device_release_driver_internal+0x4a/0x200
>>>>     usb_reset_device+0x138/0x280
>>>>     __usb_queue_reset_device+0x35/0x50
>>>>     process_one_work+0x17e/0x390
>>>>     worker_thread+0x2c8/0x3e0
>>>>     ? process_one_work+0x390/0x390
>>>>     kthread+0xf7/0x1f0
>>>>     ? kthreads_online_cpu+0x100/0x100
>>>>     ? kthreads_online_cpu+0x100/0x100
>>>>     ret_from_fork+0x114/0x140
>>>>     ? kthreads_online_cpu+0x100/0x100
>>>>     ret_from_fork_asm+0x11/0x20
>>>>     </TASK>
>>>> INFO: task kworker/4:1:16648 blocked for more than 360 seconds.
>>>>          Tainted: G S         O        6.18.3+ #33
>>>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>> task:kworker/4:1     state:D stack:0     pid:16648 tgid:16648 ppid:2      task_flags:0x4288060 flags:0x00080000
>>>> Workqueue: events __usb_queue_reset_device
>>>> Call Trace:
>>>>     <TASK>
>>>>     __schedule+0x46b/0x1140
>>>>     schedule+0x23/0xc0
>>>>     usb_kill_urb+0x7b/0xc0
>>>
>>> Kworker failed to kill urb within 300 seconds, so we know the underlying usb
>>> hardware failed to response within 300s.
>>>
>>> That said, the deadlock in the subject line is incorrect, but task hung due
>>> to hardware glitch.
> 
> In fact, we do not know whether this was a hardware glitch or a software
> bug.
> 
>> In the case where hardware is not responding, shouldn't we just consider it
>> dead and move on instead of deadlocking the whole OS?
>>
>> In this case, the system was un-plugged from a KVM (usb mouse & keyboard)
>> right around time of shutdown, so I guess that would explain why the USB device
>> didn't respond.
> 
> You misunderstand.  What's failing is the USB host controller on the
> computer, not the attached (or unplugged) USB device.  If the host
> controller really had a hardware glitch then the host controller driver
> should have realized it and moved on.  It seems to me at least as likely
> that the problem is caused by a bug in the host controller driver rather
> than anything wrong with the hardware.
> 
> (Of course, it could be a combination of things going wrong: a glitch in
> the hardware that the driver wasn't expecting and is unable to cope
> with.  But even in that case, the proper solution would be to fix the
> driver since we can't fix the hardware.)
> 
> Unfortunately, we have no to tell from the log you collected which host
> controller driver encountered this problem.  Nor, unless you can
> replicate the problem, any way to track down exactly where in that
> driver the bug is -- or even any way to tell whether a proposed fix
> actually solves the problem.
> 
> Alan Stern

The system was in the final stage of shutdown, so all we have in this case is serial
console output.  If we set console to more verbose mode, would that provide what
you need?

Or maybe 'dmesg' from when system boots?

We can try to reproduce, but need some clues about what to provide to make progress.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



