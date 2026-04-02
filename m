Return-Path: <linux-usb+bounces-35832-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOUIMzoVzmmnkgYAu9opvQ
	(envelope-from <linux-usb+bounces-35832-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:05:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C5384E4B
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54D7C306DA79
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 07:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FF83793AC;
	Thu,  2 Apr 2026 06:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Szyr1N0a"
X-Original-To: linux-usb@vger.kernel.org
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D536AB50;
	Thu,  2 Apr 2026 06:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113199; cv=none; b=BB6JEE/Z/YopBbDhonV23F456OJerINOtH2MuV2zn/khSTKSDfM3tpJ0LGa5yWlzZ+IZlZhZ8MzmrKD9lyuZWRPOIkx+WOjs+/1RWIIx8aLw15uqyXxqoHM8KjvLPswzTomOYyXSj9Eb5GTHWi42+PggDoHCRM9W2LuJ71/GYu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113199; c=relaxed/simple;
	bh=ZDEoCEoGwR4n1MolQDEm9fLTMXkYPeAcDweWOQxTSHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Uel7GjYidkFO3e0z8yJfmbmE5PHP/D6QZc1IggGTBnMlRShKlMuElTcEvJquLhC2FF+5a1bCsP1O/qrf1BXrxMSteyYai1XADhJTwOoLgBiOyk88kDx+xdSmxqJ68blZQbFZUb8YRfKr247osJ3tPrBNw2YoOP6dYVxl6iTp9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Szyr1N0a; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=NvaeLv4xkSNqFdj9tLvDtX5B0ttpvO9UnSQzhaIJ2bc=;
	b=Szyr1N0aManmA++xNwZx8zNYFmd+ukqvTKfKlTnCsvQXVU8KFYG++R5oWvCLdy6KOvT841lEp
	zgTapkTDcHBLaJC3W6VMhmmCS4zMECjkVt6QmvQYp+3vOYPwRNcUTmkhu79aHVBVFNEoKRoZ436
	lvpf/WEyPLkn3iC40j0b6RU=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fmXcz5TdlzKm4J;
	Thu,  2 Apr 2026 14:53:39 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id F0685402AB;
	Thu,  2 Apr 2026 14:59:51 +0800 (CST)
Received: from [10.164.148.136] (10.164.148.136) by
 kwepemk100018.china.huawei.com (7.202.194.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 2 Apr 2026 14:59:51 +0800
Message-ID: <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
Date: Thu, 2 Apr 2026 14:59:35 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
To: Greg KH <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<caiyadong@huawei.com>, <stable@kernel.org>, <stern@rowland.harvard.edu>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
From: "Xuetao (kirin)" <xuetao09@huawei.com>
In-Reply-To: <2026040241-purveyor-bakery-a9f1@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk100018.china.huawei.com (7.202.194.66)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35832-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuetao09@huawei.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:dkim,huawei.com:email,huawei.com:mid]
X-Rspamd-Queue-Id: 299C5384E4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



在 2026/4/2 11:51, Greg KH 写道:
> On Thu, Apr 02, 2026 at 10:14:00AM +0800, Tao Xue wrote:
>> As specified in Section 4.14.2 of the xHCI Specification, the xHC
>> reserves bandwidth for periodic endpoints according to bInterval and
>> wBytesPerInterval (Max ESIT Payload).
>>
>> Some peripherals report an invalid wBytesPerInterval in their device
>> descriptor, which is either 0 or smaller than the actual data length
>> transmitted. This issue is observed on ASIX AX88179 series USB 3.0
>> Ethernet adapters.
>>
>> These errors may lead to unexpected behavior on certain USB host
>> controllers, causing USB peripherals to malfunction.
>>
>> To address the issue, return max(wBytesPerInterval, max_payload) when
>> calculating bandwidth reservation.
>>
>> Fixes: 9238f25d5d32 ("USB: xhci: properly set endpoint context fields for periodic eps.")
>> Cc: <stable@kernel.org>
>> Signed-off-by: Tao Xue <xuetao09@huawei.com>
>> ---
>>   drivers/usb/core/usb.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
>> index e9a10a33534c..8f2e05a5a015 100644
>> --- a/drivers/usb/core/usb.c
>> +++ b/drivers/usb/core/usb.c
>> @@ -1125,6 +1125,8 @@ EXPORT_SYMBOL_GPL(usb_free_noncoherent);
>>   u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>>   				      const struct usb_host_endpoint *ep)
>>   {
>> +	u32 max_payload;
>> +
>>   	if (!usb_endpoint_xfer_isoc(&ep->desc) &&
>>   	    !usb_endpoint_xfer_int(&ep->desc))
>>   		return 0;
>> @@ -1135,7 +1137,12 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
>>   			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
>>   		fallthrough;
>>   	case USB_SPEED_SUPER:
>> -		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
>> +		max_payload = usb_endpoint_maxp(&ep->desc) * (ep->ss_ep_comp.bMaxBurst + 1);
>> +		if (usb_endpoint_xfer_isoc(&ep->desc))
>> +			return max_t(u32, max_payload * USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
>> +					ep->ss_ep_comp.wBytesPerInterval);
>> +		else
>> +			return max_t(u32, max_payload, ep->ss_ep_comp.wBytesPerInterval);
> 
> You dropped the conversion from le16 to cpu?  Why?
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thank you for the review.

1、You're right, that was an oversight. I should keep the le16_to_cpu().
Here's the corrected version:

     max_payload = usb_endpoint_maxp(&ep->desc) * 
(ep->ss_ep_comp.bMaxBurst + 1);
     if (usb_endpoint_xfer_isoc(&ep->desc))
         return max_t(u32, max_payload * 
USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
                         le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval));
     else
         return max_t(u32, max_payload, 
le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval));

2、Following Alan's suggestion in another email, should I check whether 
wBytesPerInterval is a valid value and handle it in the 
usb_parse_ss_endpoint_companion() ?

However, when parsing the device descriptor, we do not know whether the 
actual data length transmitted by the peripheral is greater than 
wBytesPerInterval.

Therefore, would it be sufficient to only add a check for whether 
wBytesPerInterval is 0 in the existing flow, and if it is 0, set 
wBytesPerInterval to cpu_to_le16(max_tx) by default?

For example, modify it in the following way：

      if (le16_to_cpu(desc->wBytesPerInterval) > max_tx || 
le16_to_cpu(desc->wBytesPerInterval) == 0) {
         dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
                 "config %d interface %d altsetting %d ep %d: "
                 "setting to %d\n",
                 usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
                 le16_to_cpu(desc->wBytesPerInterval),
                 cfgno, inum, asnum, ep->desc.bEndpointAddress,
                 max_tx);
         ep->ss_ep_comp.wBytesPerInterval = cpu_to_le16(max_tx);
     }

  Could you please give me some advice? Thanks.

