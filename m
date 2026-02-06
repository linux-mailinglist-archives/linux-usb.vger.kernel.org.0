Return-Path: <linux-usb+bounces-33128-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BNEElRBhWmA+wMAu9opvQ
	(envelope-from <linux-usb+bounces-33128-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 02:18:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A036EF8E94
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 02:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0933F3018287
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 01:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D99221FF3B;
	Fri,  6 Feb 2026 01:18:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49A198A17;
	Fri,  6 Feb 2026 01:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340683; cv=none; b=FuDUbWGCRIqw+bWTSPO7XAHGxDJ78W+XsTLEK1yUhbUwI6+3zzq087trXP+MVQLfVJxzjDPom7jl5XUrCl8mGeqEj605t0nwAIzuRPRVDigtRiFr6Acvb6E0oaW+WaANpNGzG4xtwk+gK3migPAl7diZjjeEPlcjaCZ7HkgAbFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340683; c=relaxed/simple;
	bh=x7LHKpvF+d0LWLpYeCgkXvk8kvvjOKVmhtE6FKTgaQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxQCgdkryKe89ye0etJUGrY8PehNNhLNatJAD4VDQ1NQbwtg8zhZUnQY7kKW4cJ+aHVzMBB7bi76fw2xdIMJY7b0y/VuHzJUHC8fz4fpV0+4uFAKwJrW4/FejylEAs6Ih7gVKz78Czti6ujUtZxlY9TpVA4t9ZYzX6sYuHnLU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab9b846802f911f1b0f03b4cfa9209d1-20260206
X-CID-CACHE: Type:Local,Time:202602060909+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:42152007-a1c1-47da-8648-1a3da3655908,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:1735e37a399661b72535b0ac32c9f8f0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:0,Content:0|14|52
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab9b846802f911f1b0f03b4cfa9209d1-20260206
X-User: lijiayi@kylinos.cn
Received: from [172.25.120.57] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1288476956; Fri, 06 Feb 2026 09:17:57 +0800
Message-ID: <b3b9f061-82c3-48bf-a7d6-385a3f53c654@kylinos.cn>
Date: Fri, 6 Feb 2026 09:17:54 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
References: <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
 <20260203093957.GD2275908@black.igk.intel.com>
 <087dcbe3-ad68-4f45-877b-8f78721efa4b@kylinos.cn>
 <20260203100752.GF2275908@black.igk.intel.com>
 <8a4874ef-90d4-4d88-a72d-1efa791a5b9b@kylinos.cn>
 <20260204123702.GO2275908@black.igk.intel.com>
From: Jayi Li <lijiayi@kylinos.cn>
In-Reply-To: <20260204123702.GO2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33128-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	DMARC_NA(0.00)[kylinos.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijiayi@kylinos.cn,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:mid]
X-Rspamd-Queue-Id: A036EF8E94
X-Rspamd-Action: no action


在 2026/2/4 20:37, Mika Westerberg 写道:
> On Wed, Feb 04, 2026 at 10:37:58AM +0800, Jayi Li wrote:
>> 在 2026/2/3 18:07, Mika Westerberg 写道:
>>> On Tue, Feb 03, 2026 at 06:00:06PM +0800, Jayi Li wrote:
>>>>>> I'm not sure if this is relevant to this issue, but sharing just in case.
>>>>> Thanks for sharing!
>>>>>
>>>>> It could be. What device this is?
>>>> The device is Targus DOCK221.
>>> Is the host Intel or AMD (well can you share bit more details about the
>>> topology)? Then if you block runtime PM of the PCIe Downstream Port that
>>> leads to the TB3 device like:
>>>
>>>    # echo on > /sys/bus/pci/devices/DEVICE/power/control
>>>
>>> Does it work?
>> The host is ASMedia.
> Ah okay. I don't have any experience with ASMedia host. What system/laptop
> comes with that?
>
>>   ASMedia Host (0-0, domain0)
>>           |
>>          └─ Port 3 ──→ Thunderbolt 3 Dock (0-3)
>>
>> I tried disabling runtime PM by writing 'on' to power/control for the
>> downstream port, but it did not work.
> I think that's integrated into the SoC, right? So it's a PCIe root port
> used for tunneling. What does 'sudo lspci -vv' say?
Thanks for your help. The issue I encountered occurred during a testing 
phase. I will try to verify it later on an Intel/AMD host system and 
provide updates if available. Sorry that I can't offer more details at 
the moment.

