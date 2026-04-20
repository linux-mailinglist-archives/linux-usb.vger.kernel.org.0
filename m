Return-Path: <linux-usb+bounces-36335-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAMUHirP5WlIoAEAu9opvQ
	(envelope-from <linux-usb+bounces-36335-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 09:00:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E8C4278E8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 09:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27F9E305D179
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 06:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DB13803E5;
	Mon, 20 Apr 2026 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="cjnDopYf"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354437A493;
	Mon, 20 Apr 2026 06:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668191; cv=none; b=EddALxZ1j7WjJNovHQmPj3yKv+7NSuS3N8D/uEUBZdFavbSFKL9DLqLaf823KX7R2akCjf5jeQVulS+6ay86UPk38PFzAAtbwlO9/UMZJzFnQ3Ek0bNmkFvuggYZWHWsBzLkPHF65BIY4vYltIZkhsTXFJqkqZLMWL5l1tjznu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668191; c=relaxed/simple;
	bh=IrD4TwlgaYdHOo/Y9iWKl9+kX5mbaobcrZbv/GhKklw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gIuk4cK3n7Pe5gOX05oX7J2Yy7FvD4dqXWztldNtMbSxYdyVPAN7rsUQdn0eO5WLcJokTYa+B3PlzInOl91PPcBquM8aR51BMOYGXkhQT3DnxrHyItji/SbJRvjkIb3ZeUAUdCKCqvHwQoo6ZcYWHEx/Jjfnfef/ZV/bdEqKYnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=cjnDopYf; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jecfLEG0TI6BUdB1jWCI4l7rdp4aCyF0hv7AsC7ruc0=;
	b=cjnDopYfjgfXsNvI1zzVGDRnE8hEar5bXZMwHxZI2AEudocI/MoyoHX2oD84zyWQiETt/XwoN
	ej1ekjzpVmaFgUk6nJg1fPRx7Cb9lJvVjheB4ksJk4C33DwZOUzMZIqGEun/DeRvOSXE/QKwrVl
	CpEaCo5i1NiyqgjUW8win7A=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fzbhQ6mXLz1cyp9;
	Mon, 20 Apr 2026 14:49:58 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 83B274048B;
	Mon, 20 Apr 2026 14:56:19 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 20 Apr 2026 14:56:18 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 20 Apr
 2026 14:56:18 +0800
Message-ID: <8309ac29-12bc-4e60-8054-18c6a5dedf01@huawei.com>
Date: Mon, 20 Apr 2026 14:56:17 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] usb: gadget: udc: simplify lock holding using
 guards
To: Greg KH <gregkh@linuxfoundation.org>
CC: <khtsai@google.com>, <hhhuuu@google.com>, <kees@kernel.org>,
	<kexinsun@smail.nju.edu.cn>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linuxarm@huawei.com>, <zhanjie9@hisilicon.com>,
	<lihuisong@huawei.com>
References: <20260420035722.1133418-1-lihuisong@huawei.com>
 <2026042034-grunt-freeware-8ce6@gregkh>
 <85cc1f7c-9d43-4dfb-8b05-d95ddd86a932@huawei.com>
 <2026042024-mystify-mountable-a406@gregkh>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <2026042024-mystify-mountable-a406@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-Spamd-Result: default: False [-0.16 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[h-partners.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[h-partners.com:+];
	TAGGED_FROM(0.00)[bounces-36335-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[h-partners.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:mid];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihuisong@huawei.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,7.202.194.112:received,172.19.163.163:received,10.3.19.33:received];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3E8C4278E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/20/2026 2:30 PM, Greg KH wrote:
> On Mon, Apr 20, 2026 at 02:21:01PM +0800, lihuisong (C) wrote:
>> On 4/20/2026 1:40 PM, Greg KH wrote:
>>> On Mon, Apr 20, 2026 at 11:57:20AM +0800, Huisong Li wrote:
>>>> Simplify udc_lock and connect_lock holding using guards in
>>>> gadget_bind_driver() and gadget_unbind_driver().
>>>>
>>>> Huisong Li (2):
>>>>     usb: gadget: udc: simplify udc_lock holding using guards
>>>>     usb: gadget: udc: simplify connect_lock holding using guards
>>>>
>>>>    drivers/usb/gadget/udc/core.c | 77 ++++++++++++++++-------------------
>>>>    1 file changed, 35 insertions(+), 42 deletions(-)
>>> Only do this for new drivers, don't convert existing code that works
>>> just fine for no valid reason other than wanting to clean stuff up.
>>>
>>> Does this fix a bug?
>> Here not to fix a bug. But prepare for fixing a bug in link[1].
>> I found that there are many unlock of udc_lock in error path after that
>> patch.
>> So use the guard to simpliy them by the way.
>>
>> [1]https://patchwork.kernel.org/project/linux-usb/patch/20260420040223.1232745-1-lihuisong@huawei.com/
> So those patches must be applied in order?  That was not obvious and I
> would have gotten them wrong :(
That patch in the link is not modified based on this series.
I originally thought that I would update that patch after this series is 
merged (because there are not functional changes).
I will drop this series if accept the unlock on multiple error path.
>
> The policy of these guard usages is not to add them just to "clean up"
> the code, only use them to actually fix real bugs today, or in new code.
> Otherwise the churn in the kernel tree would be huge for no valid
> reason, and cause even more bugs with backports than this pattern causes
> today.
got it.

