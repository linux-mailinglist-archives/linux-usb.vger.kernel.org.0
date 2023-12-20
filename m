Return-Path: <linux-usb+bounces-4425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4981A129
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 15:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB3E92856F8
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 14:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D403AC1A;
	Wed, 20 Dec 2023 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nz7oM5qo"
X-Original-To: linux-usb@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FDB4423
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=P+62m2hM+zchhtFV25UKUdJcNkVD9rHWZad3j2uDE8A=;
	b=nz7oM5qo91/voUJwH+TOaWKZdDv3xMG3d40ex3usmqdhbUIlheGNxbEqSJB7jr
	YYq2lJ8WhhXJXeSZ1KPc0hpoqtIGftTS0bz1en+pUDDju0cVfT6TsinLHtVXnqWp
	x4wnpSf4WKj9rq3uw/zzO1Zkz1jtyfU80lLEpfZIcJqS0=
Received: from [192.168.71.6] (unknown [114.92.108.205])
	by zwqz-smtp-mta-g1-1 (Coremail) with SMTP id _____wBXX8st+4JlLIROEQ--.20864S2;
	Wed, 20 Dec 2023 22:33:18 +0800 (CST)
Message-ID: <b793b44e-ce40-4f03-808a-8606970cb2e6@163.com>
Date: Wed, 20 Dec 2023 22:33:17 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] usb: gadget: f_uvc: change endpoint allocation in
 uvc_function_bind()
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: linux-usb@vger.kernel.org
References: <20230803091053.9714-1-quic_linyyuan@quicinc.com>
 <20230803091053.9714-4-quic_linyyuan@quicinc.com>
 <ZYHCESCO4EXPQbFY@lizhi-Precision-Tower-5810>
From: yuan linyu <cugyly@163.com>
In-Reply-To: <ZYHCESCO4EXPQbFY@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXX8st+4JlLIROEQ--.20864S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFy5ZF1fCryrGrW7AFWkWFg_yoW8Kw4rpa
	1fJa4rCr47tFZ8tws7J3Z5ZF47tws2q3yDWFWUK343Zr43ZF93CF1DKFW8KFyfCr97Aw48
	tFZ5C3yS9r90yrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uylk-UUUUU=
X-CM-SenderInfo: pfxj5zr16rljoofrz/1tbiERJM417++KliJQAAsa


On 2023/12/20 00:17, Frank Li wrote:
> On Thu, Aug 03, 2023 at 05:10:49PM +0800, Linyu Yuan wrote:
>> when call uvc_function_bind(), gadget still have no connection speed,
>> just follow other gadget function, use fs endpoint descriptor to allocate
>> a video endpoint, remove gadget_is_{super|dual}speed() API call.
>>
>> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
>> ---
>> v2: no change
>>
>>  drivers/usb/gadget/function/f_uvc.c | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
>> index 5e919fb65833..c8e149f8315f 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -719,21 +719,13 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>>  	}
>>  	uvc->enable_interrupt_ep = opts->enable_interrupt_ep;
>>  
>> -	if (gadget_is_superspeed(c->cdev->gadget))
>> -		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
>> -					  &uvc_ss_streaming_comp);
>> -	else if (gadget_is_dualspeed(cdev->gadget))
>> -		ep = usb_ep_autoconfig(cdev->gadget, &uvc_hs_streaming_ep);
>> -	else
>> -		ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
>> -
>> +	ep = usb_ep_autoconfig(cdev->gadget, &uvc_fs_streaming_ep);
> Some UDC driver use gadget_check_config() and match_ep() to allocate EP
> internal fifo memory resource, if only pass download full speed EP.
Could you share  the detail of problem ? do you mean find another different endpoint compared

with change before?


From my understanding, according to configfs gadget driver design, when find a endpoint, there is no

working speed, this means each hardware endpoint should support all possible speeds.
>
> UDC will allocate too much internal memory to each EP. It may failure when
> use ss config. Generally, ss config have bigger max package size.
is there another way to solve your issue in your driver ?
>
> Frank
>
>>  	if (!ep) {
>>  		uvcg_info(f, "Unable to allocate streaming EP\n");
>>  		goto error;
>>  	}
>>  	uvc->video.ep = ep;
>>  
>> -	uvc_fs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>>  	uvc_hs_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>>  	uvc_ss_streaming_ep.bEndpointAddress = uvc->video.ep->address;
>>  
>> -- 
>> 2.17.1
>>


