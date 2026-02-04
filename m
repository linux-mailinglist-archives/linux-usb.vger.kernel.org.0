Return-Path: <linux-usb+bounces-33059-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIOdChmxgmn/YAMAu9opvQ
	(envelope-from <linux-usb+bounces-33059-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 03:38:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C4E0EAF
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 03:38:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D99BD300B8C8
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 02:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63262C028C;
	Wed,  4 Feb 2026 02:38:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745E199E89;
	Wed,  4 Feb 2026 02:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172691; cv=none; b=jswZGD94MhFPlyny+azPt6SlsPshcVR47jEWzC1rgXExrYRuzvbdT3bzCIqpS/tTJo5+2h/FdDAIpWHndKA1PfpDa79qNtsscIAs8uJKvscOjRfdcNPQK5wNKmHKuGRvTQnuD4apIVlwJYVVQPk2QKpusuBicQl9ncRT/LttSko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172691; c=relaxed/simple;
	bh=ERUFEWjLaSga9Ods08VI9xTOeTSBj5WxhYpEWiAQsnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqGtrtBBib3JaTojxEem8KXxumRV10ajU1kjuehRhszaQRNgwPOtuE3wZLZDI8UaQNmhi9wSFFp24jNuMuXqkstfuf9XVWIuVRqoihHnU86hiewyTj/8/uYQm5Lz6c5QTOpzgsMNw8gjIVsgVAlrrB3GqMJzakzaxTDVm5wPb2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 862befd4017211f1b0f03b4cfa9209d1-20260204
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8dfa554f-e066-49b8-9df1-7f91f609b313,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:d540a09b6e4dc32eb8b0ae1fba888c11,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 862befd4017211f1b0f03b4cfa9209d1-20260204
X-User: lijiayi@kylinos.cn
Received: from [172.25.120.57] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1068468426; Wed, 04 Feb 2026 10:38:01 +0800
Message-ID: <8a4874ef-90d4-4d88-a72d-1efa791a5b9b@kylinos.cn>
Date: Wed, 4 Feb 2026 10:37:58 +0800
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
References: <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
 <20260203093957.GD2275908@black.igk.intel.com>
 <087dcbe3-ad68-4f45-877b-8f78721efa4b@kylinos.cn>
 <20260203100752.GF2275908@black.igk.intel.com>
From: Jayi Li <lijiayi@kylinos.cn>
In-Reply-To: <20260203100752.GF2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33059-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	DMARC_NA(0.00)[kylinos.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijiayi@kylinos.cn,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 543C4E0EAF
X-Rspamd-Action: no action


在 2026/2/3 18:07, Mika Westerberg 写道:
> On Tue, Feb 03, 2026 at 06:00:06PM +0800, Jayi Li wrote:
>>>> I'm not sure if this is relevant to this issue, but sharing just in case.
>>> Thanks for sharing!
>>>
>>> It could be. What device this is?
>> The device is Targus DOCK221.
> Is the host Intel or AMD (well can you share bit more details about the
> topology)? Then if you block runtime PM of the PCIe Downstream Port that
> leads to the TB3 device like:
>
>   # echo on > /sys/bus/pci/devices/DEVICE/power/control
>
> Does it work?

The host is ASMedia.

  ASMedia Host (0-0, domain0)
          |
         └─ Port 3 ──→ Thunderbolt 3 Dock (0-3)

I tried disabling runtime PM by writing 'on' to power/control for the 
downstream port, but it did not work.


