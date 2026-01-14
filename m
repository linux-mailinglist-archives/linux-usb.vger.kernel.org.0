Return-Path: <linux-usb+bounces-32331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619CD1F81D
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 15:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAE9230574CB
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 14:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBDD30F54C;
	Wed, 14 Jan 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="lBc0gYbC"
X-Original-To: linux-usb@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB702C15B8;
	Wed, 14 Jan 2026 14:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.129.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768401416; cv=none; b=C/ZpVjMBYZhAm8Iu+e/aA9uS1rbDvumpUp41AJh6kIFGammhLuAPifS8eloIJurv1UWDq/I+EXjP/Ff5T7MTCo7YZptt+XRvRUuxxWJd7vEm5mFhv6TUG9O/h/1ngLIDpjGpLQZcNvRN/sWGKunZJ98k9YEJ0Uyx7wkYR7qgu1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768401416; c=relaxed/simple;
	bh=6ktUvqsuT6W/VaMlgYEhRcX9hTzX4xtMpT3HDRQ/aTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mN/xnqo4xyDyUhYc6bpgZG680ssZ7uVUmAcUT3bPr3M0NA6xS7Rux80FoMz3YGEgcQrG84I3Y4fl/GwdVSIP825sfuQ56xjDkF1e74x24xDGM19Xqg90C9N54w0ZTKX5Opfz9QOcTXmLzwSwtPrtCeCTBG8NcA/RdsXlWhUPJ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com; spf=pass smtp.mailfrom=candelatech.com; dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b=lBc0gYbC; arc=none smtp.client-ip=148.163.129.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 2F90DA800B0;
	Wed, 14 Jan 2026 14:36:50 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.35.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id C5A7E13C2B0;
	Wed, 14 Jan 2026 06:36:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com C5A7E13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1768401407;
	bh=6ktUvqsuT6W/VaMlgYEhRcX9hTzX4xtMpT3HDRQ/aTs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lBc0gYbCwUMuBK1FZcx1PH1bDW0XppCqIE/eNJ1cd42JSpU/1+U5DK2vOTMC7GgbB
	 nsbQCQNO6HFeuwiyUnyQfN/r5387bKiG3++z8bowamhl1E9EyQUc7u2xVESokl/sRG
	 LoeJWomSNLTWxOpeNH0n7J5GZPhlmxiw8m4Wjqp4=
Message-ID: <dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>
Date: Wed, 14 Jan 2026 06:36:41 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
To: Hillf Danton <hdanton@sina.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
References: <20260114024506.2210-1-hdanton@sina.com>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20260114024506.2210-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1768401411-tVi26OAl74-6
X-PPE-STACK: {"stack":"us5"}
X-MDID-O:
 us5;ut7;1768401411;tVi26OAl74-6;<greearb@candelatech.com>;b18f93f19c3df6a1f1f4c758c8db4fb3
X-PPE-TRUSTED: V=1;DIR=OUT;

On 1/13/26 18:45, Hillf Danton wrote:
> On Tue, 13 Jan 2026 16:21:07 -0800 Ben Greear wrote:
>> Hello,
>>
>> We caught a deadlock that appears to be in the USB code during shutdown.
>> We do a lot of reboots and normally all goes well, so I don't think we
>> can reliably reproduce the problem.
>>
>> INFO: task systemd-shutdow:1 blocked for more than 180 seconds.
>>         Tainted: G S         O        6.18.3+ #33
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> task:systemd-shutdow state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x400100 flags:0x00080001
>> Call Trace:
>>    <TASK>
>>    __schedule+0x46b/0x1140
>>    schedule+0x23/0xc0
>>    schedule_preempt_disabled+0x11/0x20
>>    __mutex_lock.constprop.0+0x4f7/0x9a0
>>    device_shutdown+0xa0/0x220
>>    kernel_restart+0x36/0x90
>>    __do_sys_reboot+0x127/0x220
>>    ? do_writev+0x76/0x110
>>    ? do_writev+0x76/0x110
>>    do_syscall_64+0x50/0x6d0
>>    entry_SYSCALL_64_after_hwframe+0x4b/0x53
>> RIP: 0033:0x7fad03531087
>> RSP: 002b:00007ffe137cf918 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
>> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fad03531087
>> RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
>> RBP: 00007ffe137cfac0 R08: 0000000000000069 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>>    </TASK>
>> INFO: task systemd-shutdow:1 is blocked on a mutex likely owned by task kworker/4:1:16648.
> 
> This explains why the shutdown stalled.
> 
>> INFO: task kworker/4:2:1520 blocked for more than 360 seconds.
>>         Tainted: G S         O        6.18.3+ #33
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
>> Workqueue: events __usb_queue_reset_device
>> Call Trace:
>>    <TASK>
>>    __schedule+0x46b/0x1140
>>    ? schedule_timeout+0x79/0xf0
>>    schedule+0x23/0xc0
>>    usb_kill_urb+0x7b/0xc0
>>    ? housekeeping_affine+0x30/0x30
>>    usb_start_wait_urb+0xd6/0x160
>>    usb_control_msg+0xe2/0x140
>>    hub_port_init+0x647/0xf70
>>    usb_reset_and_verify_device+0x191/0x4a0
>>    ? device_release_driver_internal+0x4a/0x200
>>    usb_reset_device+0x138/0x280
>>    __usb_queue_reset_device+0x35/0x50
>>    process_one_work+0x17e/0x390
>>    worker_thread+0x2c8/0x3e0
>>    ? process_one_work+0x390/0x390
>>    kthread+0xf7/0x1f0
>>    ? kthreads_online_cpu+0x100/0x100
>>    ? kthreads_online_cpu+0x100/0x100
>>    ret_from_fork+0x114/0x140
>>    ? kthreads_online_cpu+0x100/0x100
>>    ret_from_fork_asm+0x11/0x20
>>    </TASK>
>> INFO: task kworker/4:1:16648 blocked for more than 360 seconds.
>>         Tainted: G S         O        6.18.3+ #33
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> task:kworker/4:1     state:D stack:0     pid:16648 tgid:16648 ppid:2      task_flags:0x4288060 flags:0x00080000
>> Workqueue: events __usb_queue_reset_device
>> Call Trace:
>>    <TASK>
>>    __schedule+0x46b/0x1140
>>    schedule+0x23/0xc0
>>    usb_kill_urb+0x7b/0xc0
> 
> Kworker failed to kill urb within 300 seconds, so we know the underlying usb
> hardware failed to response within 300s.
> 
> That said, the deadlock in the subject line is incorrect, but task hung due
> to hardware glitch.

In the case where hardware is not responding, shouldn't we just consider it
dead and move on instead of deadlocking the whole OS?

In this case, the system was un-plugged from a KVM (usb mouse & keyboard)
right around time of shutdown, so I guess that would explain why the USB device
didn't respond.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


