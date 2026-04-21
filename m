Return-Path: <linux-usb+bounces-36378-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFo9L9Mo52kf4wEAu9opvQ
	(envelope-from <linux-usb+bounces-36378-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 09:35:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850C437AA4
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 09:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 219C83016924
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 07:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653D6382F2A;
	Tue, 21 Apr 2026 07:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="QSFfvg38"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0F31F9B4;
	Tue, 21 Apr 2026 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776756795; cv=none; b=isfb/dhhWdaH885uI7MD6Ma5pQrKm6PdTK9uc+it1B0xTiXj+PdNdiycUqmCdu7kMTPOxC40vX9+/jmBvNVf9QMB70XbPcJC+vFJxM9tYwaep1UVYtnNwiHow3tacI64yPn7Fe93cOfSQCToYmsFj6649xUSuwddPWrbT/TAnuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776756795; c=relaxed/simple;
	bh=QWNtcle2bZgC660OoKpRBOrjtJ1DcHEVvkJC67dgvQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZY5p4GVIaF2pg6CfVniL9Vj02D4xBKbBts+ff+YzF+n7AnIn1swr+YnKjOETDaQnVHTFqNwDe/wBeKzosde5pA2MyVhNwL+/kCG7WIFuqJsiLWSwjmi6CaUyqsrKi8IEjSYAZ0bGq7vTOydkng0IcR5tQ0rWLZbAUS6c98a3V1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=QSFfvg38; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/SaT/9aKAKv+yodOYEwlumnR2VZQ2UPFO3kCb5UwLVM=;
	b=QSFfvg38yzMFSOAyXnI/7pFzFoUDYBELMfw+HCMWt83HyFXEFpLGtQDv2yjtWFVxMNiLvV6MN
	CfOYN7RGtJxfDUuE6PgAUKGaOWIhLxscrnXkii+3mu0Ag5VaoV1Xe/Ub8CUwRO0vcRqQ5iONjVT
	BKr/tdXzY6V58wqYoZejNFM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4g0DS72BqHz1prjx;
	Tue, 21 Apr 2026 15:26:31 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 142B040576;
	Tue, 21 Apr 2026 15:32:56 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 21 Apr 2026 15:32:55 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 21 Apr
 2026 15:32:55 +0800
Message-ID: <8e4275b3-33e8-46b9-9f33-366561cf4789@huawei.com>
Date: Tue, 21 Apr 2026 15:32:54 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: udc: Fix overwriting the gadget driver of
 occupied udc
To: Alan Stern <stern@rowland.harvard.edu>
CC: <gregkh@linuxfoundation.org>, <khtsai@google.com>, <hhhuuu@google.com>,
	<kees@kernel.org>, <kexinsun@smail.nju.edu.cn>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>
References: <20260420040223.1232745-1-lihuisong@huawei.com>
 <ec166527-2064-4d48-b2c5-fd2e3e5afd87@rowland.harvard.edu>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <ec166527-2064-4d48-b2c5-fd2e3e5afd87@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-Spamd-Result: default: False [-0.16 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[h-partners.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[h-partners.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36378-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[h-partners.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:mid,huawei.com:email];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[lihuisong@huawei.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2850C437AA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/20/2026 10:10 PM, Alan Stern wrote:
> How did you find this "problem"?  By encountering a crash?  By code
> review?  Some other way?
>
> On Mon, Apr 20, 2026 at 12:02:23PM +0800, Huisong Li wrote:
>> In gadget_match_driver(), the core only validates whether the gadget
>> driver is already bound, but it doesn't check the current state of
>> the UDC. This leads to gadget_bind_driver() (the probe stage) being
>> invoked for an already occupied UDC.
> No it doesn't.  It is not possible for gadget_bind_driver() to be called
> if the UDC is already bound to a driver.  That's because this routine is
> a .probe() callback, and the device core only probes devices that aren't
> already bound to a driver.
Yes, you are right.
The device core ensure that one device just allows to bind one driver.
The __driver_probe_device() will return -EBUSY if dev->driver is not 
NULL. Then this device will be ignored to probe.
I forgot that the udc gadget itself is used as a device.
> It's true that gadget_bind_driver() is a probe routine for the gadget
> bus, not whatever bus the UDC was registered on, but that doesn't matter
> because the UDC's driver is always assigned and cleared along with the
> gadget's driver.
>
>> In gadget_bind_driver(), the code proceeds to overwrite 'udc->driver'
>> and forcibly modify the UDC speed without checking if the UDC is
>> currently in use. This results in state inconsistency and disruption
>> of the existing connection.
>>
>> Fix this by adding a check for 'udc->driver' in
>> gadget_bind_driver().
> This change is not necessary.
Sorry for the noise.
> Alan Stern
>
>> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
>> Signed-off-by: Huisong Li <lihuisong@huawei.com>
>> ---
>>   drivers/usb/gadget/udc/core.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
>> index e8861eaad907..47e50fe1b75b 100644
>> --- a/drivers/usb/gadget/udc/core.c
>> +++ b/drivers/usb/gadget/udc/core.c
>> @@ -1615,6 +1615,13 @@ static int gadget_bind_driver(struct device *dev)
>>   	int ret = 0;
>>   
>>   	mutex_lock(&udc_lock);
>> +	if (udc->driver) {
>> +		dev_err(&udc->dev, "UDC (%s) is already in use.\n",
>> +			dev_name(&udc->dev));
>> +		mutex_unlock(&udc_lock);
>> +		return -EBUSY;
>> +	}
>> +
>>   	if (driver->is_bound) {
>>   		mutex_unlock(&udc_lock);
>>   		return -ENXIO;		/* Driver binds to only one gadget */
>> -- 
>> 2.33.0
>>
>>

