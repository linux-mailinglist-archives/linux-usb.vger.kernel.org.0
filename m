Return-Path: <linux-usb+bounces-35921-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN0HOv4Wz2lZswYAu9opvQ
	(envelope-from <linux-usb+bounces-35921-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 03:25:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60286390025
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 03:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E4BE3055CA6
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 01:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC43282F14;
	Fri,  3 Apr 2026 01:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="wmMT34J6"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01E9274B58;
	Fri,  3 Apr 2026 01:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775179260; cv=none; b=UIUE8rIfmS92x/B2y+qE+PlAs86D3mw7DhDfhlHmhYyVOBQlicGu5P6uz989yJ2Of90nEhTM5UhakInLKv9kMbpPIPmFwokWvVw9GgzQcTb7QOHYPulhXcqa0C3lr+InZXHrxSRbVnsCNu1/VYb49QUuW44K7mG3WHSzrsn2Kic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775179260; c=relaxed/simple;
	bh=gri4RUokLkC6uRdjyudmUDwKT5GuD4Ln2HYqDCQnO6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BvRSRB1a2lrksiTGswgUWuJaZG8UtNLr407vtChwsLRdsLh87hcmvdtP0jxmfXsiM0pnVE7shRX7RyBaVRu94ifJ+mqJN27ebrtMDLgv89IKUUQxiYxly1wdooPdybDTAGchhfPyCDt81bCSgHsQIAjSYA3zXUVzk7bb510YNjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=wmMT34J6; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=e+E++03/m7a8AeKObtNPLFSOmIAPioaUDLmJo97lA0M=;
	b=wmMT34J6gZwbcCxh8VEuHs53r0r0vdA8RbjbySMz2WV9SbAD5+ggO+A67He17X/Ebgu8LEQAm
	rra9DUABKCgjORtjoxpPaW/et/45WSfb0NbDQub70GLNut94aqdB0r9Eo0qvtYEDEfj2qcJjtXq
	ADxFa06iXioKcRs9Zn8SyPU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fn13L3L0FzLls3;
	Fri,  3 Apr 2026 09:14:38 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 803534056E;
	Fri,  3 Apr 2026 09:20:48 +0800 (CST)
Received: from [10.164.148.136] (10.164.148.136) by
 kwepemk100018.china.huawei.com (7.202.194.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Fri, 3 Apr 2026 09:20:47 +0800
Message-ID: <c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
Date: Fri, 3 Apr 2026 09:20:46 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
To: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
	<stern@rowland.harvard.edu>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<caiyadong@huawei.com>, <stable@kernel.org>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
 <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
 <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
 <2026040221-reclusive-garland-6281@gregkh>
From: "Xuetao (kirin)" <xuetao09@huawei.com>
In-Reply-To: <2026040221-reclusive-garland-6281@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk100018.china.huawei.com (7.202.194.66)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35921-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuetao09@huawei.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60286390025
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



在 2026/4/2 22:09, Greg KH 写道:
> On Thu, Apr 02, 2026 at 09:56:51AM -0400, Alan Stern wrote:
>> On Thu, Apr 02, 2026 at 02:59:35PM +0800, Xuetao (kirin) wrote:
>>> 2、Following Alan's suggestion in another email, should I check whether
>>> wBytesPerInterval is a valid value and handle it in the
>>> usb_parse_ss_endpoint_companion() ?
>>
>> Yes, IMO.
>>
>>> However, when parsing the device descriptor, we do not know whether the
>>> actual data length transmitted by the peripheral is greater than
>>> wBytesPerInterval.
>>
>> Note: wBytesPerInterval is in the endpoint descriptor, not the device
>> descriptor.
>>

Thank you for your review. I will correct the description in the 
subsequent patch.

>>> Therefore, would it be sufficient to only add a check for whether
>>> wBytesPerInterval is 0 in the existing flow, and if it is 0, set
>>> wBytesPerInterval to cpu_to_le16(max_tx) by default?
>>>
>>> For example, modify it in the following way：
>>>
>>>       if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
>>> le16_to_cpu(desc->wBytesPerInterval) == 0) {
>>>          dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
>>>                  "config %d interface %d altsetting %d ep %d: "
>>>                  "setting to %d\n",
>>>                  usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
>>>                  le16_to_cpu(desc->wBytesPerInterval),
>>>                  cfgno, inum, asnum, ep->desc.bEndpointAddress,
>>>                  max_tx);
>>>          ep->ss_ep_comp.wBytesPerInterval = cpu_to_le16(max_tx);
>>>      }
>>>
>>>   Could you please give me some advice? Thanks.
>>
>> Try it and see if it fixes the problems you see with the network
>> adapters.
>>

Okay, I will verify the effectiveness of this modification and provide 
feedback on the results.

I guess that for the scenario where wBytesPerInterval is 0, it should be 
solvable. However, for the scenario where wBytesPerInterval is 8 but the 
peripheral sends a data length greater than 8 (e.g., 16), there might be 
an issue. I will test both of the above scenarios.

>> I saw the Greg said not to change the descriptors and just fail the
>> device, but we already make this sort of change to correct other errors
>> so there doesn't seem to be any reason not to do it here as well.
>> Especially if it allows people to use devices that otherwise would not
>> work.
> 
> I didn't realize this was on "real" devices, sorry.  I thought this was
> only a fuzzing thing.  So yes, fix up the broken descriptor after
> warning about it is the correct thing to do.
> 
> thanks,
> 
> greg k-h


