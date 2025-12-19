Return-Path: <linux-usb+bounces-31625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C897CCE5C9
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 04:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABA2E300EFD8
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 03:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E66287510;
	Fri, 19 Dec 2025 03:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXF/n/cx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC5A2690EC
	for <linux-usb@vger.kernel.org>; Fri, 19 Dec 2025 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766114689; cv=none; b=lKx19zJb1BF/VSjKHArFqZhOGG8MF9cocVQTMjniEgr/lvMb8ai7gM7GeBTwwuZ7OiREfj1SFVm71c80CQXUHpQV9Al+iMMNubvUIPl35LvMo0sNp2jtVEITHwDPeQHIj0gB58h2oNN/X8Cb9C4MXUuxTXTwZ8pufJ5rLPm1i+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766114689; c=relaxed/simple;
	bh=L+XeJCjhOSsTZlLuIzA9zISh9dRtQAcNXqRr0Vcxctc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2n7Yo/M3VRs7eb3sU18xqbgQ7n8IcIQMQ/dK7aX9mpyYYOgG/NgVUdR6pkeKPcFy4PJaJGEGIONjOolRBKFELWxzz/g5bQsyahjZmNcXQKC7vv+AU14nLE9NV8h3+4FOukwXvj5QbP+590kyyW1xuOggkssdeggWOSQIzBS5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXF/n/cx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D241BC4CEF1;
	Fri, 19 Dec 2025 03:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766114689;
	bh=L+XeJCjhOSsTZlLuIzA9zISh9dRtQAcNXqRr0Vcxctc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tXF/n/cxLvG35m7EHiRie8om3zjbCzclhia+c3ILZ8Z87AJNla7s1UozNjHu5499y
	 MmwhbZV6cB7xf23MMiq0DoMxsNw6d6vPuTD2L1KEo/AOJLg516BgABuc/MXQ62A144
	 5jJvTldOPXahq4nTfXDEueMwL/tDoU4i7+v24EUFcPr8xuCEoXpFutMis6XsD8U7Qj
	 eRUixesoDIF82zN5zHVfMvNQhXSA2cY1cf7CJkuEMIvRQXFYPMGbLdgImQX0qHXud9
	 Q3CbCZfHq9VIj59ShyCuATprrD7IFPl0BdtcTfIp80pSppSiXKd2YDqtrmjlouQxJm
	 xgaY6ik/mXCXg==
Message-ID: <9c4e32eb-4ec6-44a1-aa8e-04f9e6b4ce74@kernel.org>
Date: Thu, 18 Dec 2025 21:24:47 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ucsi oops on system resume (6.19-rc1)
To: Pedro Falcato <pfalcato@suse.de>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org
References: <ac4m5qtjpnmx336r5astuxkvtqfjhlt6674odmtecsn2e6sqja@hndb7jdcqsp3>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <ac4m5qtjpnmx336r5astuxkvtqfjhlt6674odmtecsn2e6sqja@hndb7jdcqsp3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/17/25 5:38 AM, Pedro Falcato wrote:
> Hi,
> 
> as usual I'm running the -rc1 for this cycle. Found a nice fun oops in ucsi
> code that brought the laptop to its knees:
> 
> Dec 17 11:01:13 pedro-suse kernel: PM: suspend exit
> Dec 17 11:01:14 pedro-suse kernel: usb 1-5: reset full-speed USB device number 5 using xhci_hcd
> Dec 17 11:01:17 pedro-suse kernel: ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
> Dec 17 11:01:17 pedro-suse kernel: BUG: kernel NULL pointer dereference, address: 0000000000000000
> Dec 17 11:01:17 pedro-suse kernel: #PF: supervisor read access in kernel mode
> Dec 17 11:01:17 pedro-suse kernel: #PF: error_code(0x0000) - not-present page
> Dec 17 11:01:17 pedro-suse kernel: PGD 0 P4D 0
> Dec 17 11:01:17 pedro-suse kernel: Oops: Oops: 0000 [#1] SMP NOPTI
> Dec 17 11:01:17 pedro-suse kernel: CPU: 6 UID: 0 PID: 127156 Comm: kworker/6:15 Not tainted 6.19.0-rc1-1.g274aff5-default #1 PREEMPT(voluntary) openSUSE Tumbleweed (unreleased)  404a89cf98df507eb666b481fd923e4c0524c52b
> Dec 17 11:01:17 pedro-suse kernel: Hardware name: LENOVO 21K6S0A00C/21K6S0A00C, BIOS R2FET65W (1.45 ) 07/31/2025
> Dec 17 11:01:17 pedro-suse kernel: Workqueue: events_long ucsi_resume_work [typec_ucsi]
> Dec 17 11:01:17 pedro-suse kernel: RIP: 0010:ucsi_sync_control_common+0x111/0x1d0 [typec_ucsi]
> Dec 17 11:01:17 pedro-suse kernel: Code: ed 74 1b 48 8b 43 18 4c 89 ee 48 89 df 48 8b 40 08 2e 2e 2e ff d0 85 c0 0f 85 c4 00 00 00 48 8b 93 18 02 00 00 48 85 d2 74 9b <41> 8b 45 00 85 c0 79 93 48 8b 43 18 48 8d b3 18 01 00 00 48 89 df
> Dec 17 11:01:17 pedro-suse kernel: RSP: 0018:ffffcacf6386fda8 EFLAGS: 00010202
> Dec 17 11:01:17 pedro-suse kernel: RAX: 000000000000136b RBX: ffff8aca414aac00 RCX: ffffcacf6386fd08
> Dec 17 11:01:17 pedro-suse kernel: RDX: 0000000000000010 RSI: ffffcacf6386fd50 RDI: ffff8aca414aacf8
> Dec 17 11:01:17 pedro-suse kernel: RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
> Dec 17 11:01:17 pedro-suse kernel: R10: 00002906b8fb0080 R11: 0000000000000000 R12: 0000000000000004
> Dec 17 11:01:17 pedro-suse kernel: R13: 0000000000000000 R14: 0000000000000000 R15: ffff8aca414aac40
> Dec 17 11:01:17 pedro-suse kernel: FS:  0000000000000000(0000) GS:ffff8ad8948a4000(0000) knlGS:0000000000000000
> Dec 17 11:01:17 pedro-suse kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> Dec 17 11:01:17 pedro-suse kernel: CR2: 0000000000000000 CR3: 00000008b3e38000 CR4: 0000000000f50ef0
> Dec 17 11:01:17 pedro-suse kernel: PKRU: 55555554
> Dec 17 11:01:17 pedro-suse kernel: Call Trace:
> Dec 17 11:01:17 pedro-suse kernel:  <TASK>
> Dec 17 11:01:17 pedro-suse kernel:  ucsi_run_command+0xea/0x160 [typec_ucsi 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
> Dec 17 11:01:17 pedro-suse kernel:  ucsi_send_command_common+0x6a/0x170 [typec_ucsi 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
> Dec 17 11:01:17 pedro-suse kernel:  ucsi_resume_work+0x2f/0x90 [typec_ucsi 7cea3ba3027ec3f117ebc8d974a2455746436aa1]
> Dec 17 11:01:17 pedro-suse kernel:  process_one_work+0x193/0x350
> Dec 17 11:01:17 pedro-suse kernel:  worker_thread+0x2d7/0x410
> Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_worker_thread+0x10/0x10
> Dec 17 11:01:17 pedro-suse kernel:  kthread+0xfc/0x230
> Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
> Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
> Dec 17 11:01:17 pedro-suse kernel:  ret_from_fork+0x243/0x280
> Dec 17 11:01:17 pedro-suse kernel:  ? __pfx_kthread+0x10/0x10
> Dec 17 11:01:17 pedro-suse kernel:  ret_from_fork_asm+0x1a/0x30
> Dec 17 11:01:17 pedro-suse kernel:  </TASK>
> 
> 
> I have only reproduced it once (now), but it may be reproducible. I had a USB-C
> device plugged in before suspend, then on resume it wasn't there anymore.
> Perhaps that was it?
> 
> Anyway, attaching more of the logs, and the config. Keep in mind the kernel
> is very lightly patched, but at the moment it has nothing that relates to
> USB.
> 
> Thanks!
> Pedro

Here's a fix:

https://lore.kernel.org/linux-usb/20251216122210.5457-1-superm1@kernel.org/T/#u

