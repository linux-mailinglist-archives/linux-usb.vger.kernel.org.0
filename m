Return-Path: <linux-usb+bounces-33037-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 59wmBD3HgWl1JwMAu9opvQ
	(envelope-from <linux-usb+bounces-33037-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 11:00:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70979D738F
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 11:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AEF69301915F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 10:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE5939B49F;
	Tue,  3 Feb 2026 10:00:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E511A840A;
	Tue,  3 Feb 2026 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770112819; cv=none; b=MEP+gezqi43fKnoCp3B9rO4CBwClvSH/duYJ0AM4TW/QjpU3gd+MItA2fdagW6H8I0AOll6vA+o+aI1Kthe1+W0VQJ3bGrtb+gBQZATZRu/OKpY1I2g6cJupSlP8HMldP82vpcko6zHVSR7ENk0FTSbnNrrcaGoh1SxNOX6EjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770112819; c=relaxed/simple;
	bh=4TMjlOevT2aNA/W2xwI63pt1fU0/oL0Q0x1A3lbTdsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnTgZRErUwU9w2uVkKvo3xbbYqiuOWOFqTbIwvI4GY9bn1IxlKiJymyWOdh4ziu2ySO0FR87lX4nY2n7mKKrJuCiTcOzxmqWR8I+xKLfGv9cTqWoZCcnMRQ21IYduw9eziPprRpEFoaiVJ+fiKyGbrBCmf4rNMc+c5AncRMjYA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1fd5f05800e711f1b0f03b4cfa9209d1-20260203
X-CID-CACHE: Type:Local,Time:202602031704+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:714022f9-9dfb-4fad-aa36-fde1080df745,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:ebfddd431a755f20feb03c85843246ba,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1fd5f05800e711f1b0f03b4cfa9209d1-20260203
X-User: lijiayi@kylinos.cn
Received: from [172.25.120.57] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1781354955; Tue, 03 Feb 2026 18:00:09 +0800
Message-ID: <087dcbe3-ad68-4f45-877b-8f78721efa4b@kylinos.cn>
Date: Tue, 3 Feb 2026 18:00:06 +0800
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
References: <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
 <20260203093957.GD2275908@black.igk.intel.com>
From: Jayi Li <lijiayi@kylinos.cn>
In-Reply-To: <20260203093957.GD2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33037-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	DMARC_NA(0.00)[kylinos.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijiayi@kylinos.cn,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kylinos.cn:mid]
X-Rspamd-Queue-Id: 70979D738F
X-Rspamd-Action: no action

Hi,

在 2026/2/3 17:39, Mika Westerberg 写道:
> Hi,
>
> On Tue, Feb 03, 2026 at 05:04:53PM +0800, Jayi Li wrote:
>>> If you do this on Intel host do you see the same?
>> I also encountered a similar issue where the PCIe hotplug IRQ is not
>> received
>> after path setup completion. This was observed specifically during
>> Thunderbolt 3
>> device hotplug testing.
>>
>> To investigate, I applied a debug patch (attached below) to dump
>> ADP_PCIE_CS_0.
>> I observed that when the issue occurs, the PCIe upstream port's LTSSM is not
>> in the DETECT state,
>> yet the PE (Port Enable) bit remains set to 1.
> The PCIe Upstream Port is TB3 device?
Yes.
>
> For TB3 there is no LTTSM state in that register so the value you read can
> be anything.
Apologies for the confusion. I wasn't aware that ADP_PCIE_CS_0 does not 
reflect the LTSSM state on Thunderbolt 3.
> We can do it for USB4, like with this patch:
>
> https://lore.kernel.org/linux-usb/20260127094953.GF2275908@black.igk.intel.com/
>
> It should be modified so that it just checks for the USB4 side.
>
>> My workaround is to check the LTSSM state before the path setup.
>> If this specific anomaly is detected, I explicitly set PE to 0 to reset the
>> link state.
>> With this change, the link returns to the correct state. After the path
>> setup completes,
>> the PCIe hotplug IRQ is received correctly.
>>
>> I'm not sure if this is relevant to this issue, but sharing just in case.
> Thanks for sharing!
>
> It could be. What device this is?
The device is Targus DOCK221.

