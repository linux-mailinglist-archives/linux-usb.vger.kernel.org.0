Return-Path: <linux-usb+bounces-36419-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJeTMGTO6GklQQIAu9opvQ
	(envelope-from <linux-usb+bounces-36419-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 15:34:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4241A446C9B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 15:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E0BB301C810
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 13:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FC13E024E;
	Wed, 22 Apr 2026 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="WBr/Eisv"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284F3EB815;
	Wed, 22 Apr 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864395; cv=none; b=lIY/QU+TNdtmh0Ee37Une0qVwbdC5quifhts7Dd1VF5qCp2x0/GbvJUMZoU7YVRSw0/P5KToI8GSGmwXuY9MzdEqeWYpLBvOoLWIYakHmGNqyPFcxrtqJmlOAw0LIO8sclLT+BhWODM02RFxWX8cvFc1UThaz7SkxlCNlSzHu5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864395; c=relaxed/simple;
	bh=5NVf2ZfPjVuZ5oUZXbVk2S5LJa86nGbWaJ9Sv3sqrRM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=mv838Q73i6Id8/2kyowCg2ucQN/k6iDKqvrVewLdlyHSVO7z+C7wc7nL2+v9QQ0RdBHFkLr7SNVLNLsInjSPh1TI6y3ZIYgZdiP7Yyz5owUmGi0jGnXRMt6ThmpgekvjhqMW6g+3VMUmiomPg9oLBFaI39bE5BOdsXdmyQGrpKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=WBr/Eisv; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lx6LkUlHkM0WbGTScpoYtlN2/wIUBYmDWdLoikLccvA=;
	b=WBr/Eisvxhm53hPlLbdMoq6oV6qnfi3zDsWibJrGz2D/jlMu3SSd9hVNhI/YiXYnEbGmh9hCi
	k9WGZ1BCGNybN6H1hYPrGAP3ozyarBeOz28XBsDmAYbMxcA6JkJLZMg/HaOZViVSThCUto4xYyO
	/UBFrgfHbJsMu/pssTH32Oo=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4g10FW2p7dz1prLm;
	Wed, 22 Apr 2026 21:19:59 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id DBD5440561;
	Wed, 22 Apr 2026 21:26:24 +0800 (CST)
Received: from [10.164.148.136] (10.164.148.136) by
 kwepemk100018.china.huawei.com (7.202.194.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 22 Apr 2026 21:26:24 +0800
Message-ID: <00ad170a-2546-4d7a-8f8b-af6d46e09a73@huawei.com>
Date: Wed, 22 Apr 2026 21:26:23 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
From: "Xuetao (kirin)" <xuetao09@huawei.com>
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
	<stern@rowland.harvard.edu>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<caiyadong@huawei.com>, <stable@kernel.org>, Michal Pecio
	<michal.pecio@gmail.com>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
 <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
 <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
 <2026040221-reclusive-garland-6281@gregkh>
 <c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
In-Reply-To: <c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk100018.china.huawei.com (7.202.194.66)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,huawei.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	TAGGED_FROM(0.00)[bounces-36419-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuetao09@huawei.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4241A446C9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



在 2026/4/3 9:20, Xuetao (kirin) 写道:
> 
> 
> 在 2026/4/2 22:09, Greg KH 写道:
>> On Thu, Apr 02, 2026 at 09:56:51AM -0400, Alan Stern wrote:
>>> On Thu, Apr 02, 2026 at 02:59:35PM +0800, Xuetao (kirin) wrote:
>>>> 2、Following Alan's suggestion in another email, should I check whether
>>>> wBytesPerInterval is a valid value and handle it in the
>>>> usb_parse_ss_endpoint_companion() ?
>>>
>>> Yes, IMO.
>>>
>>>> However, when parsing the device descriptor, we do not know whether the
>>>> actual data length transmitted by the peripheral is greater than
>>>> wBytesPerInterval.
>>>
>>> Note: wBytesPerInterval is in the endpoint descriptor, not the device
>>> descriptor.
>>>
> 
> Thank you for your review. I will correct the description in the 
> subsequent patch.
> 
>>>> Therefore, would it be sufficient to only add a check for whether
>>>> wBytesPerInterval is 0 in the existing flow, and if it is 0, set
>>>> wBytesPerInterval to cpu_to_le16(max_tx) by default?
>>>>
>>>> For example, modify it in the following way：
>>>>
>>>>       if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
>>>> le16_to_cpu(desc->wBytesPerInterval) == 0) {
>>>>          dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d 
>>>> in "
>>>>                  "config %d interface %d altsetting %d ep %d: "
>>>>                  "setting to %d\n",
>>>>                  usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
>>>>                  le16_to_cpu(desc->wBytesPerInterval),
>>>>                  cfgno, inum, asnum, ep->desc.bEndpointAddress,
>>>>                  max_tx);
>>>>          ep->ss_ep_comp.wBytesPerInterval = cpu_to_le16(max_tx);
>>>>      }
>>>>
>>>>   Could you please give me some advice? Thanks.
>>>
>>> Try it and see if it fixes the problems you see with the network
>>> adapters.
>>>
> 
> Okay, I will verify the effectiveness of this modification and provide 
> feedback on the results.
> 

By adding debug and capturing USB protocol analyzer traces, I have 
identified the pattern of this issue:

1. Why doesn't the Realtek USB 3.0 network adapter have this problem?

Realtek has two different types of interrupt endpoints:
(1) wMaxPacketSize = 0x10, bMaxBurst = 0, wBytesPerInterval = 0x8
(2) wMaxPacketSize = 0x2, bMaxBurst = 0, wBytesPerInterval = 0x2

The Realtek network adapter uses the r8152.c driver. In rtl8152_open() 
-> usb_submit_urb(tp->intr_urb, GFP_KERNEL), the length of tp->intr_urb 
is fixed at 0x2.
The Realtek USB 3.0 network adapter uses the endpoint with 
wBytesPerInterval = 0x2 for network status queries. Since 
wBytesPerInterval = wMaxPacketSize × (bMaxBurst + 1) = 2, there is no 
problem.

2. The ASIX AX88179 USB 3.0 network adapter exhibits two different symptoms:

ASIX AX88179 has two different interrupt endpoint descriptors:
(1) wMaxPacketSize = 0x10, bMaxBurst = 0, wBytesPerInterval = 0x0
(2) wMaxPacketSize = 0x10, bMaxBurst = 0, wBytesPerInterval = 0x8

The ASIX AX88179 network adapter uses the ax88179_178a.c driver. In 
usbnet_open() -> usbnet_status_start() -> usb_submit_urb(dev->interrupt, 
mem_flags), the length of dev->interrupt is 0x10.

(1) When wBytesPerInterval = 0x8: When the software submits the INT URB, 
the host controller can normally send an INT IN request. If the device 
returns data length ≤ 8 bytes, the host and device interact normally, 
and the network works.
However, if the network adapter responds within one interval with a 
packet carrying 16 bytes of data, a specific host controller reports a 
babble error, causing network failure.

(2) When wBytesPerInterval = 0x0: The host controller does not reserve 
any bandwidth for the device. When the software submits the INT URB, a 
specific host controller does not issue an INT IN request to the device, 
nor does it report an error to the software. The device controller never 
receives the INT IN request, so the network fails.


Verification results:

Patch 1:
In usb_parse_ss_endpoint_companion(), if the interrupt endpoint's 
wBytesPerInterval is 0, set wBytesPerInterval to wMaxPacketSize × 
(bMaxBurst + 1).

Result 1:
This resolves the issue for ASIX AX88179 adapters with wBytesPerInterval 
= 0. However, for the scenario where wBytesPerInterval = 0x8, 
wMaxPacketSize = 0x10, and the device returns a 16-byte data payload, a 
babble error still occurs.

Patch 2:
In xhci_get_max_esit_payload(), when udev->speed >= USB_SPEED_SUPER, for 
interrupt endpoints return the maximum value between 
ep->ss_ep_comp.wBytesPerInterval and (max_burst + 1) × max_packet.

Result 2:
This resolves both scenarios described above. The only downside is that 
this modification may cause the host to waste a small amount of bandwidth.


> I guess that for the scenario where wBytesPerInterval is 0, it should be 
> solvable. However, for the scenario where wBytesPerInterval is 8 but the 
> peripheral sends a data length greater than 8 (e.g., 16), there might be 
> an issue. I will test both of the above scenarios.
> 
>>> I saw the Greg said not to change the descriptors and just fail the
>>> device, but we already make this sort of change to correct other errors
>>> so there doesn't seem to be any reason not to do it here as well.
>>> Especially if it allows people to use devices that otherwise would not
>>> work.
>>
>> I didn't realize this was on "real" devices, sorry.  I thought this was
>> only a fuzzing thing.  So yes, fix up the broken descriptor after
>> warning about it is the correct thing to do.
>>
>> thanks,
>>
>> greg k-h
> 


