Return-Path: <linux-usb+bounces-32921-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FvaGrgMfGkEKQIAu9opvQ
	(envelope-from <linux-usb+bounces-32921-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 02:43:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29D2B63A0
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 02:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA2D93013A5E
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 01:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D95331A5C;
	Fri, 30 Jan 2026 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="buxrqCtt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106FC13B;
	Fri, 30 Jan 2026 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769737367; cv=none; b=pTSVUy6/adXk41ZOMvOlh+QmWjnjipaNTZVkNIF9C8la6TFNEiiEDzQEsg4B6xEQRfG3UoyNqajOADWCSgLeU/IpvefMA+gQMVmYgzlAGSaTXhonq8b/XU2mYlVfWIgMNS7jDKXFZW29b8RKNN6uO3pjkDWdVwsEMZICrTcundY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769737367; c=relaxed/simple;
	bh=dONZkVZh9d70lJIHPcjVZ4K3a5/9RVhLRAAWrjpqAGo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZrEbf5YLpvMcm3PiFa6y6Vhw2zyAwfgRk65fmkYiusVjk/+2ZYalrgB5tMJ4PyZju3NJvAf4A2+yFRXCO/ww0r89meRVnLirPCGUp7QH4IqF9rOJieSpJH+FisqLIvqJt/9ct1N5ZdD8dmECJxIQfRw7xvsNE2hgTsehQm0Vq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=buxrqCtt; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.47] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4f2Jfr15xFz3xJ9;
	Thu, 29 Jan 2026 20:42:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1769737364; bh=dONZkVZh9d70lJIHPcjVZ4K3a5/9RVhLRAAWrjpqAGo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=buxrqCttrUYDaVul8wnjcV8o3W5PaA/WeNXJde+TRkTSHn1ksgtvarLmsGw762hEt
	 WOpRjCrBqco09R6zpDqoBvqVSlwBTEzSjLccoT7yYrm7tEDTBRzEbzeZ6nvYnn0XPd
	 5M9tejofYjuWjGaDXkUYsHL5vKz0dYbE6Es8tgws=
Message-ID: <31ec74be-13b6-4d74-8643-6bd68659299b@panix.com>
Date: Thu, 29 Jan 2026 17:42:43 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
From: Kenneth Crudup <kenny@panix.com>
To: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Rene Sapiens <rene.sapiens@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
 <20260109072318.GU2275908@black.igk.intel.com>
 <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
 <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
 <5834100b-788c-4520-9b70-f462f65149ca@linux.intel.com>
 <6438b5a3-a0f4-4c7d-9f56-59cdf7f5148f@kernel.org>
 <e821e8a1-8256-4f80-ab30-95f066d25946@panix.com>
 <54d7e199-0887-4129-8743-dce13cc5d60a@linux.intel.com>
 <9976ae02-f48e-4727-9d48-54daac0e2a45@panix.com>
Content-Language: en-US
In-Reply-To: <9976ae02-f48e-4727-9d48-54daac0e2a45@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[panix.com,none];
	R_DKIM_ALLOW(-0.20)[panix.com:s=panix];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-32921-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[panix.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kenny@panix.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,panix.com:mid,panix.com:dkim]
X-Rspamd-Queue-Id: C29D2B63A0
X-Rspamd-Action: no action


BTW, I had no TB connectivity until I'd unplugged/replugged.

-Kenny

On 1/29/26 17:39, Kenneth Crudup wrote:
> 
>>> The issue I'm trying to chase down (and not sure if any of this will
>>> help with this, I wonder if it's really BIOS/EC related) is often times
>>> that after a suspend (or hibernate, but I use "suspend then hibernate",
>>> which I think does both and chooses which to use upon resume) and then
>>> connect to a different dock (or setup) from the one I'd suspended with,
>>> sometimes I have to unplug/replug my TB cable, otherwise I either get no
>>> recognition of my new display setup (and sometimes TB devices) or it'll
>>> try and use the same monitor resolution of the previously-connected
>>> monitor (as if the TB subsystem doesn't recognize things have changed).
> 
> On 1/29/26 15:13, Katiyar, Pooja wrote:
> 
>> Below is the patch series that addresses mentioned issue. There are two
>> patches in this series. The series takes care of releasing the DP 
>> resources
>> as part of freeze call before the hibernation image is created. You 
>> can test
>> it for your issues and let us know if it helps.
>>
>> Please note that these changes are still under internal review and are
>> subject to change.
> 
> I tested this against Linus' master (4d310797262) and while the jury is 
> still out on my issue (a few tests against different monitors looked 
> good, the big test is when I get back home later), I did see this on the 
> 3rd resume from hibernate (full dmesg attached):
> 
> ----
> [Thu Jan 29 17:25:10 2026] [   T5543] ------------[ cut here ]------------
> [Thu Jan 29 17:25:10 2026] [   T5543] WARNING: drivers/thunderbolt/ 
> tunnel.c:2358 at tb_tunnel_is_invalid+0x46/0x60, CPU#12: kworker/ 
> u80:19/5543
> [Thu Jan 29 17:25:10 2026] [   T5543] Modules linked in: intel_ipu6_isys 
> videobuf2_dma_sg ivsc_ace ivsc_csi intel_ishtp_hid iwlmvm 
> snd_soc_sof_sdw mac80211 r8152(O) mei_vsc iwlwifi snd_sof_pci_intel_tgl 
> snd_sof_pci_intel_cnl btusb cfg80211 intel_ish_ipc btintel intel_ishtp 
> intel_ipu6 mei_vsc_hw xe i2c_algo_bit drm_display_helper cec 
> drm_gpusvm_helper drm_buddy drm_suballoc_helper gpu_sched drm_ttm_helper 
> ttm drm_gpuvm drm_exec
> [Thu Jan 29 17:25:10 2026] [   T5543] CPU: 12 UID: 0 PID: 5543 Comm: 
> kworker/u80:19 Tainted: G S         O        6.19.0-rc7-kenny+ #33 PREEMPT
> [Thu Jan 29 17:25:10 2026] [   T5543] Tainted: [S]=CPU_OUT_OF_SPEC, 
> [O]=OOT_MODULE
> [Thu Jan 29 17:25:10 2026] [   T5543] Hardware name: Dell Inc. XPS 
> 9320/0KNXGD, BIOS 2.26.0 10/27/2025
> [Thu Jan 29 17:25:10 2026] [   T5543] Workqueue: thunderbolt1 
> tb_dp_dprx_work
> [Thu Jan 29 17:25:10 2026] [   T5543] RIP: 
> 0010:tb_tunnel_is_invalid+0x46/0x60
> [Thu Jan 29 17:25:10 2026] [   T5543] Code: 00 00 00 00 48 8b 43 20 48 
> 8b 3c c8 80 7f 22 00 74 18 e8 bd b0 ff ff 84 c0 75 1b 49 63 ce 44 8d 71 
> 01 48 39 4b 28 77 dc eb 0c <0f> 0b 48 8b 43 20 48 8b 3c c8 eb dc 5b 41 
> 5e 5d c3 31 c0 c3 cc cc
> [Thu Jan 29 17:25:10 2026] [   T5543] RSP: 0000:ffffa3dc86ebbbd0 EFLAGS: 
> 00010246
> [Thu Jan 29 17:25:10 2026] [   T5543] RAX: ffff938db2f6b8e0 RBX: 
> ffff938d59164c00 RCX: 0000000000000000
> [Thu Jan 29 17:25:10 2026] [   T5543] RDX: ffffa3dc86ebbc08 RSI: 
> ffffa3dc86ebbc0c RDI: ffff938d4efb7680
> [Thu Jan 29 17:25:10 2026] [   T5543] RBP: ffffa3dc86ebbbe0 R08: 
> 0000000000000000 R09: ffff938dc5344ac0
> [Thu Jan 29 17:25:10 2026] [   T5543] R10: 00000000000002bf R11: 
> 0000000000000400 R12: ffff938d412ed960
> [Thu Jan 29 17:25:10 2026] [   T5543] R13: ffff938d412ed0c8 R14: 
> 0000000000000001 R15: ffff938d42d30358
> [Thu Jan 29 17:25:10 2026] [   T5543] FS:  0000000000000000(0000) 
> GS:ffff939518d71000(0000) knlGS:0000000000000000
> [Thu Jan 29 17:25:10 2026] [   T5543] CS:  0010 DS: 0000 ES: 0000 CR0: 
> 0000000080050033
> [Thu Jan 29 17:25:10 2026] [   T5543] CR2: 0000000000000000 CR3: 
> 000000018aa0d001 CR4: 0000000000770ef0
> [Thu Jan 29 17:25:10 2026] [   T5543] PKRU: 55555554
> [Thu Jan 29 17:25:10 2026] [   T5543] Call Trace:
> [Thu Jan 29 17:25:10 2026] [   T5543]  <TASK>
> [Thu Jan 29 17:25:10 2026] [   T5543]  tb_consumed_dp_bandwidth+0xa8/0x1d0
> [Thu Jan 29 17:25:10 2026] [   T5543]  tb_available_bandwidth+0x333/0x450
> [Thu Jan 29 17:25:10 2026] [   T5543]  tb_reclaim_usb3_bandwidth+0x57/0x2a0
> [Thu Jan 29 17:25:10 2026] [   T5543]  tb_dp_tunnel_active+0x73/0x310
> [Thu Jan 29 17:25:10 2026] [   T5543]  ? tb_tunnel_event+0x131/0x160
> [Thu Jan 29 17:25:10 2026] [   T5543]  tb_dp_dprx_work+0xf4/0x110
> [Thu Jan 29 17:25:10 2026] [   T5543]  process_scheduled_works+0x1e7/0x370
> [Thu Jan 29 17:25:10 2026] [   T5543]  worker_thread+0x2ee/0x390
> [Thu Jan 29 17:25:10 2026] [   T5543]  kthread+0x237/0x250
> [Thu Jan 29 17:25:10 2026] [   T5543]  ? pr_cont_work+0x1c0/0x1c0
> [Thu Jan 29 17:25:10 2026] [   T5543]  ? kthread_blkcg+0x30/0x30
> [Thu Jan 29 17:25:10 2026] [   T5543]  ret_from_fork+0xc0/0x550
> [Thu Jan 29 17:25:10 2026] [   T5543]  ? __switch_to+0x134/0x460
> [Thu Jan 29 17:25:10 2026] [   T5543]  ? kthread_blkcg+0x30/0x30
> [Thu Jan 29 17:25:10 2026] [   T5543]  ret_from_fork_asm+0x11/0x20
> [Thu Jan 29 17:25:10 2026] [   T5543]  </TASK>
> [Thu Jan 29 17:25:10 2026] [   T5543] ---[ end trace 0000000000000000 ]---
> [Thu Jan 29 17:25:10 2026] [   T5543] ------------[ cut here ]------------
> ----
> 
> -Kenny
> 

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


