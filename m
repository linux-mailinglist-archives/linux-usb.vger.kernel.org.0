Return-Path: <linux-usb+bounces-36682-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGPDIenh8WlZlAEAu9opvQ
	(envelope-from <linux-usb+bounces-36682-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 12:48:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4A4931EA
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 12:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EA683041AB7
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 10:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55F73EBF35;
	Wed, 29 Apr 2026 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhBPkhCb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9723BA254;
	Wed, 29 Apr 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459454; cv=none; b=i6cR6mURsGjUO826e4TAOZFoY8Fls0BkAo/TRFzPms28xsuDUJ0U/5sjdlVPcorkP3TT9KnzSIFY9qy/RJla5hiY2XA3kB+Zp6FAqqzpcG5v1/gKyO+HaJ525P7Gi2PnXhiL/aWWnNtq84tcwfwuypR1nzRMguIqnIhj1N6viio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459454; c=relaxed/simple;
	bh=cW/EKQqt9+wMY/cIrC7CIotcJsZQ3Uf6MYq3ugjKYeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6AHi0Qq1ZqvYaMvP8l7S+S0OCkGvNeVS1MKbnipyg/tyDOulbDiv6tLqRr1nqfDXNnJkfnwDBrNiO3f1P5eKh9DTiNvBjJrcKd2xuHuZR8SAzp9uK4qIHqKxhpC1b32kFzeY5vE7uZY0PpmHzTnY5DFhhX2JxC2wQ8MKTak4kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhBPkhCb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777459453; x=1808995453;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cW/EKQqt9+wMY/cIrC7CIotcJsZQ3Uf6MYq3ugjKYeg=;
  b=BhBPkhCb5wajuyuwEXKdSgBFs6dWfczLqeFlgghyqcZdGmEmxOBtFWyB
   UmP16M/JdRNCo4YRr2R5x4gAvIo+/iicFPDrnF4+PCoUt7syRGkJ+u8dz
   2lZkn3QYEQ9DM+d5XthZY+L/aOnCAA6uRFx/79EduedVFwgUZ8gQGnhUc
   mcPp+uFBlyaPLplso8wKbf67/Em8I8jafs8LRK7o2+iXY30eBTEHevz/H
   5OnDyXu3RBGsNgVlZhjknqHFQdEjEbO8xMEGO6cB5B1horyB4af9DHBRX
   J6OCDmDldx7grus5+VvWXIvrNd6zGGOALi+JIZ4LkwmVpEjy82pcMKNUi
   w==;
X-CSE-ConnectionGUID: ETpgzCuIT32211nbbbbPxA==
X-CSE-MsgGUID: iK34WvEkRqmLjDD0/ySbvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78260748"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78260748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:44:12 -0700
X-CSE-ConnectionGUID: JNkA9EphSr+W/NKVfZXKAA==
X-CSE-MsgGUID: 19Wy4JrmSAief8Kb4jb5Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="264611662"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.137]) ([10.245.245.137])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:44:09 -0700
Message-ID: <377bf9aa-8ac0-4908-8ebb-b2db13fce8d1@linux.intel.com>
Date: Wed, 29 Apr 2026 13:44:07 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
To: Michal Pecio <michal.pecio@gmail.com>, =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Sarah Sharp <sarah.a.sharp@linux.intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
 <20251222064252.GA1196800@google.com> <2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <2025122250-commend-bondless-c7e1@gregkh>
 <TYUPR06MB62171E25C3202950069F09D9D2342@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260429094434.0825c059.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260429094434.0825c059.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0BD4A4931EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36682-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vivo.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/29/26 10:44, Michal Pecio wrote:
> On Wed, 29 Apr 2026 02:50:43 +0000, 胡连勤 wrote:
>> Hello  Greg, Mathias Nyman:
>>
>> Even after updating the kernel, the issue persists during the wake-up process
>> after the device has been put into sleep mode when connected to digital headphones.
>>
>> The error message is as follows:
>>
>> [465214.519817][T17247] msm-dwc3 a600000.ssusb: [2026-04-26 07:38:16.871288]vusb dbg: [2026-04-26 07:38:16.871288]DWC3 in low power mode
>> [465221.257099][T24488] check_valid_request: card#:0 dev#:0 dir:0 en:1 fmt:2 rate:48000 #ch:2
>> [465221.259370][T24488] msm-dwc3 a600000.ssusb: [2026-04-26 07:38:23.610842]vusb dbg: [2026-04-26 07:38:23.610842]DWC3 exited from low power mode
>> [465221.690852][T24488] usb 1-1: 1:1: cannot get freq at ep 0x3
>> [465221.690947][T24488] uaudio_iommu_map: type:0 map pa:0x000000089a6ae000 to iova:0x00001000 size:4096
>> [465221.690956][T24488] uaudio_get_iova: exact size: 4096 found
>> [465221.690959][T24488] uaudio_get_iova: va:0x00022000 curr_iova:0x00024000 curr_iova_size:4186112
>> [465221.690962][T24488] uaudio_iommu_map: type:1 map pa:0x000000091c537000 to iova:0x00022000 size:4096
>> [465221.690994][T24488] uaudio_get_iova: exact size: 32768 found
>> [465221.690996][T24488] uaudio_get_iova: va:0x00422000 curr_iova:0x00432000 curr_iova_size:4290592768
>> [465221.691001][T24488] uaudio_iommu_map: type:2 map pa:0x0000000974e5c000 to iova:0x00422000 len:4096 offset:0
>> [465221.691004][T24488] uaudio_iommu_map: type:2 map pa:0x000000092ff0b000 to iova:0x00423000 len:4096 offset:0
>> [465221.691008][T24488] uaudio_iommu_map: type:2 map pa:0x00000009086d4000 to iova:0x00424000 len:4096 offset:0
>> [465221.691011][T24488] uaudio_iommu_map: type:2 map pa:0x0000000903d42000 to iova:0x00425000 len:4096 offset:0
>> [465221.691014][T24488] uaudio_iommu_map: type:2 map pa:0x0000000899f40000 to iova:0x00426000 len:4096 offset:0
>> [465221.691017][T24488] uaudio_iommu_map: type:2 map pa:0x000000091c491000 to iova:0x00427000 len:4096 offset:0
>> [465221.691020][T24488] uaudio_iommu_map: type:2 map pa:0x0000000899269000 to iova:0x00428000 len:4096 offset:0
>> [465221.691023][T24488] uaudio_iommu_map: type:2 map pa:0x000000093b4d3000 to iova:0x00429000 len:4096 offset:0
>> [465221.691052][T24488] handle_uaudio_stream_req: ret 0: qmi response latency 433 ms
>> [465223.771840][T24494] handle_uaudio_stream_req: sq_node:5 sq_port:207 sq_family:2a
>> [465223.771858][T24494] check_valid_request: card#:0 dev#:0 dir:0 en:0 fmt:2 rate:48000 #ch:2
>> [465223.827409][T24494] uaudio_put_iova: curr_iova_size 4190208
>> [465223.827414][T24494] uaudio_iommu_unmap: type 1: unmap iova 0x00022000 size 4096
>> [465223.827425][T24494] uaudio_put_iova: curr_iova_size 4290625536
>> [465223.827429][T24494] uaudio_iommu_unmap: type 2: unmap iova 0x00422000 size 32768
>> [465223.827463][T24494] handle_uaudio_stream_req: release resources: intf# 1 card# 0
>> [465223.827467][T24494] uaudio_dev_release: for dev 0000000000000000
>> [465223.827472][T24494] uaudio_iommu_unmap: type 0: unmap iova 0x00001000 size 4096
>> [465223.827517][T24494] uaudio_event_ring_cleanup_free: all audio devices disconnected
>> [465223.827561][T24494] handle_uaudio_stream_req: ret 0: qmi response latency 55 ms
>> [465227.360186][ T3223] android time 2026-04-27 06:38:29.711646
>> [465232.791611][T24493] handle_uaudio_stream_req: sq_node:5 sq_port:207 sq_family:2a
>> [465232.791615][T24493] check_valid_request: card#:0 dev#:0 dir:0 en:1 fmt:2 rate:48000 #ch:2
>> [465233.213670][T24493] uaudio_iommu_map: type:0 map pa:0x000000091094f000 to iova:0x00001000 size:4096
>> [465233.213683][T24493] uaudio_get_iova: exact size: 4096 found
>> [465233.213686][T24493] uaudio_get_iova: va:0x00022000 curr_iova:0x00024000 curr_iova_size:4186112
>> [465233.213689][T24493] uaudio_iommu_map: type:1 map pa:0x000000089a6ae000 to iova:0x00022000 size:4096
>> [465233.213712][T24493] uaudio_get_iova: exact size: 32768 found
>> [465233.213715][T24493] uaudio_get_iova: va:0x00422000 curr_iova:0x00432000 curr_iova_size:4290592768
>> [465233.213720][T24493] uaudio_iommu_map: type:2 map pa:0x0000000968e5f000 to iova:0x00422000 len:4096 offset:0
>> [465233.213723][T24493] uaudio_iommu_map: type:2 map pa:0x0000000968e5e000 to iova:0x00423000 len:4096 offset:0
>> [465233.213727][T24493] uaudio_iommu_map: type:2 map pa:0x00000008caa58000 to iova:0x00424000 len:4096 offset:0
>> [465233.213730][T24493] uaudio_iommu_map: type:2 map pa:0x0000000a91af0000 to iova:0x00425000 len:4096 offset:0
>> [465233.213734][T24493] uaudio_iommu_map: type:2 map pa:0x00000009d38c1000 to iova:0x00426000 len:4096 offset:0
>> [465233.213737][T24493] uaudio_iommu_map: type:2 map pa:0x00000009e1e05000 to iova:0x00427000 len:4096 offset:0
>> [465233.213740][T24493] uaudio_iommu_map: type:2 map pa:0x00000009f8ea4000 to iova:0x00428000 len:4096 offset:0
>> [465233.213743][T24493] uaudio_iommu_map: type:2 map pa:0x00000000a7519000 to iova:0x00429000 len:4096 offset:0
>> [465233.213791][T24493] handle_uaudio_stream_req: ret 0: qmi response latency 422 ms
>> [465248.503579][T24411] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
>> [465248.641732][T24411] Unable to handle kernel paging request at virtual address 00000000ef808000
>> [...]
>> [465248.643670][T24411] Call trace:
>> [465248.643673][T24411]  dma_pool_alloc+0x38/0x2a4
>> [465248.643684][T24411]  xhci_segment_alloc+0x9c/0x1c4
>> [465248.643692][T24411]  xhci_alloc_segments_for_ring+0xbc/0x170
>> [465248.643699][T24411]  xhci_ring_alloc+0xb4/0x1f0
>> [465248.643705][T24411]  xhci_endpoint_init+0x3b0/0x4bc
>> [465248.643711][T24411]  xhci_add_endpoint+0x1a4/0x29c
>> [465248.643723][T24411]  usb_hcd_alloc_bandwidth+0x230/0x3d4
>> [465248.643729][T24411]  usb_reset_and_verify_device+0x1e0/0x744
>> [465248.643741][T24411]  usb_reset_device+0x154/0x23c
>> [465248.643756][T24411]  __usb_queue_reset_device+0x3c/0x64
>> [465248.643764][T24411]  process_scheduled_works+0x200/0x9d8
>> [465248.643772][T24411]  worker_thread+0x154/0x3b4
>> [465248.643780][T24411]  kthread+0x11c/0x1a0
>> [465248.643791][T24411]  ret_from_fork+0x10/0x20
>> [465248.643807][T24411] Code: 942f5097 f9400e76 aa0003e9 b40002f6 (f94002c8)
>> [465248.643812][T24411] ---[ end trace 0000000000000000 ]---
> 
> Looks like this time somebody tried to reset a USB device while
> the segment pool is destroyed, not created yet or corrupted.
> 
> Again, xhci_hcd dynamic debug would show what led to this and
> whether the pool was supposed to be ready at that time or not.
> The pool should always be ready except during xhci_resume() and
> after xhci_stop(), so it's unclear how this happened.
> 
> Again, chances are that something is trying to resume USB device
> concurrently with its parent host controller.
It's possible this specific issue is no longer seen on 7.1-rc1 kernel as xhci
driver no longer destroys and re-creates the dma pools in resume even if xHC
controller is reset in resume.

But main issue here seems to be that the device is reset or resumed when xHC host
is not ready as Michal pointed out.

Is this related to audio offload where we pretend the usb device and xHC are suspended
even if they are running? allowing usb audio playback during system suspend?

Thanks
Mathias


