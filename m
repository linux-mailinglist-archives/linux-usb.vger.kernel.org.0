Return-Path: <linux-usb+bounces-32546-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEZ6LNDGb2mgMQAAu9opvQ
	(envelope-from <linux-usb+bounces-32546-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 19:17:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A324949D
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 19:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A636869236
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 17:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91B633D6E3;
	Tue, 20 Jan 2026 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b="GAHeXEqC"
X-Original-To: linux-usb@vger.kernel.org
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B2E362143;
	Tue, 20 Jan 2026 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.154.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930212; cv=none; b=Nmy8tSF/pYHxrOEON5dZfTpmCBas6n4oYm8fVu/Hawzzu8/R+6YqJVnjl4AjnEmelHuuP+zzG8ZzRbms8IDmXsLMo+TbawKAPGmZ5L8IJUwfb21WQ6/x7XRlg0SvP+N7Dd+B3gxkzEPGhDVz3lCfOcQPFDus8rEU4Fwybvb5Y8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930212; c=relaxed/simple;
	bh=RVVVa42e8x9f+V5oZnIREujyjXsjX5KXaXh4S4JrHsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBZ2O5Qc14m803jaa+1D5xqo3Xxq4r3gbhHMxR96VsshyROuMmY+ib3TqGFTwHCZt6/oFWTo0KaOEPSmzyTWEVRhiAbsALmVlDqudYKRXOkSQYiCa9k015uR6ioky/wRPZuG48weOQaCe2O8zgTCuuzkTNMQxcNa5EOsoSiJY5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com; spf=pass smtp.mailfrom=candelatech.com; dkim=pass (1024-bit key) header.d=candelatech.com header.i=@candelatech.com header.b=GAHeXEqC; arc=none smtp.client-ip=67.231.154.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=candelatech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=candelatech.com
Received: from dispatch1-us1.ppe-hosted.com (ip6-localhost [127.0.0.1])
	by dispatch1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id AB99D50AC0A;
	Tue, 20 Jan 2026 17:30:07 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 298709400AA;
	Tue, 20 Jan 2026 17:29:59 +0000 (UTC)
Received: from [192.168.100.159] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 4FF2B13C2B0;
	Tue, 20 Jan 2026 09:29:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 4FF2B13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1768930196;
	bh=RVVVa42e8x9f+V5oZnIREujyjXsjX5KXaXh4S4JrHsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GAHeXEqC4g3zPRiqe/AgZVVidDgwBOKK6A3eQHGD8xVW2cvyyxRYnr17ryqUfLP8O
	 5huNElr543bPpGLBoZbbbHn2tQfpEIjQ12BRlguPZqmxkxF25m4DthQpUSPP4wy4SQ
	 zAiz6O/KC3YI7bOvf625D9iMa/aXBsE4cCINfQU4=
Message-ID: <737b2608-3b62-0e8b-9c78-44cca4d078be@candelatech.com>
Date: Tue, 20 Jan 2026 09:29:56 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
Content-Language: en-US
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Hillf Danton <hdanton@sina.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org
References: <20260114024506.2210-1-hdanton@sina.com>
 <dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>
 <c52546af-e39e-4096-ad11-9b38bb2d5f7e@rowland.harvard.edu>
 <a721a966-0a4b-cbc4-71ac-a482156ffa48@candelatech.com>
 <2b4c47a5-1a5a-4e94-87d6-152da16a3b9c@rowland.harvard.edu>
 <2ea634c6-26a4-48a7-8fcc-ad0ce06af890@suse.com>
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <2ea634c6-26a4-48a7-8fcc-ad0ce06af890@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1768930200-TsniadYjARwH
X-PPE-STACK: {"stack":"us5"}
X-MDID-O:
 us5;at1;1768930200;TsniadYjARwH;<greearb@candelatech.com>;560d8c9c000e75583bd1c71e8321f262
X-PPE-TRUSTED: V=1;DIR=OUT;
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[candelatech.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sina.com,vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32546-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[candelatech.com,none];
	DKIM_TRACE(0.00)[candelatech.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greearb@candelatech.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,candelatech.com:email,candelatech.com:dkim,candelatech.com:mid,candelatech.com:url]
X-Rspamd-Queue-Id: D6A324949D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/14/26 12:14, Oliver Neukum wrote:
> On 14.01.26 20:26, Alan Stern wrote:
>> On Wed, Jan 14, 2026 at 09:51:48AM -0800, Ben Greear wrote:
>>> On 1/14/26 07:13, Alan Stern wrote:
>> ...
>>>>>>> task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
>>>>>>> Workqueue: events __usb_queue_reset_device
>>>>>>> Call Trace:
>>>>>>>      <TASK>
>>>>>>>      __schedule+0x46b/0x1140
>>>>>>>      ? schedule_timeout+0x79/0xf0
>>>>>>>      schedule+0x23/0xc0
>>>>>>>      usb_kill_urb+0x7b/0xc0
>>>>>>>      ? housekeeping_affine+0x30/0x30
>>>>>>>      usb_start_wait_urb+0xd6/0x160
>>>>>>>      usb_control_msg+0xe2/0x140
>>>>>>>      hub_port_init+0x647/0xf70
>>>>>>>      usb_reset_and_verify_device+0x191/0x4a0
>>>>>>>      ? device_release_driver_internal+0x4a/0x200
>>>>>>>      usb_reset_device+0x138/0x280
>>>>>>>      __usb_queue_reset_device+0x35/0x50
>>>>>>>      process_one_work+0x17e/0x390
>>>>>>>      worker_thread+0x2c8/0x3e0
>>>>>>>      ? process_one_work+0x390/0x390
>>>>>>>      kthread+0xf7/0x1f0
>>
>>>> Unfortunately, we have no to tell from the log you collected which host
>>>> controller driver encountered this problem.  Nor, unless you can
>>>> replicate the problem, any way to track down exactly where in that
>>>> driver the bug is -- or even any way to tell whether a proposed fix
>>>> actually solves the problem.
>>>>
>>>> Alan Stern
>>>
>>> The system was in the final stage of shutdown, so all we have in this case is serial
>>> console output.  If we set console to more verbose mode, would that provide what
>>> you need?
>>
>> Maybe; it's hard to tell.  You'd have to enable dynamic debugging for
>> the usbcore module and set the console to show debug-level messages.
>>
>>> Or maybe 'dmesg' from when system boots?
>>
>> I suspect that nothing from before the start of the shutdown would be
>> useful.
>>
>>> We can try to reproduce, but need some clues about what to provide to make progress.
>>
>> The stack dump above shows that a kernel thread get stuck inside of
>> usb_reset_device().  The first thing we would need to know is which
>> device the thread is trying to reset.  Adding a dev_info() line near the
>> start of usb_reset_device() would get us that information and you could
>> capture it in the log.  (Along with that, we'd need to see the output
>> from "lsusb -t".)
>>
>> Knowing the device, we would know what host controller the device is
>> attached to.  The trick will then be to figure what's going wrong with
>> that host controller's driver.  It won't be easy, especially if the
>> problem only occurs while the system is shutting down.
> 
> Something called usb_queue_reset_device()
> 
> Workqueue: events __usb_queue_reset_device
> Call Trace:
>     <TASK>
>     __schedule+0x46b/0x1140
>     ? schedule_timeout+0x79/0xf0
>     schedule+0x23/0xc0
>     usb_kill_urb+0x7b/0xc0
>     ? housekeeping_affine+0x30/0x30
>     usb_start_wait_urb+0xd6/0x160
>     usb_control_msg+0xe2/0x140
>     hub_port_init+0x647/0xf70
>     usb_reset_and_verify_device+0x191/0x4a0
>     ? device_release_driver_internal+0x4a/0x200
>     usb_reset_device+0x138/0x280
>     __usb_queue_reset_device+0x35/0x50
>     process_one_work+0x17e/0x390
> 
> That is a fairly rare method.
> We also know that
> "the system was un-plugged from a KVM (usb mouse & keyboard)"
> One of the few places usb_queue_reset_device() is used
> is hid_io_error()
> 
> Do you still know which port that KVM had been plugged
> into? I usually would not run a chain of logic with so
> many assumptions, but if you cannot reproduce I see
> no alternative.

Hello,

We are not able to reproduce the problem.  If we are able to reproduce,
we'll take more precise notes and provide what details we can find.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com



