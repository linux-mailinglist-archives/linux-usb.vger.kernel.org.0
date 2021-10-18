Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CC84326ED
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 20:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhJRS5m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 14:57:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61182 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhJRS5i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 14:57:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634583327; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3gWQDMOuujkjj+troUNOJF7V7xpsV6jWYUnT7VwrR5g=; b=Qnxs50CKvbXu/0d3pqgUEtwYx4LDOaotmoHRty92pvqosLVb56hLL+Lc5GHyt43de/jd4kPG
 PCG9XRvSL1bMsh8B8WUpql8Rz1H7cXLn1mNzvPFDhItu+e7oxg9NKFNcgR0RjPHNUafMlxUz
 m6cS/vjqBEPf9ac+BnGiDo10sJk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 616dc30a03355859c8a4b19a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 18:55:06
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED865C4360D; Mon, 18 Oct 2021 18:55:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.13] (cpe-75-80-185-151.san.res.rr.com [75.80.185.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D1CC6C4338F;
        Mon, 18 Oct 2021 18:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D1CC6C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] usb: dwc3: gadget: Remove dev_err() when queuing to
 inactive gadget/ep
To:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org
References: <20211014233534.2382-1-wcheng@codeaurora.org>
 <YWkh1NXmmMbf59Ee@kroah.com> <87bl3qbkfz.fsf@kernel.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <75fe2695-0441-3aa9-41c5-92cd04054e71@codeaurora.org>
Date:   Mon, 18 Oct 2021 11:55:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87bl3qbkfz.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/15/2021 4:23 AM, Felipe Balbi wrote:
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
>> On Thu, Oct 14, 2021 at 04:35:34PM -0700, Wesley Cheng wrote:
>>> Since function drivers will still be active until dwc3_disconnect_gadget()
>>> is called, some applications will continue to queue packets to DWC3
>>> gadget.  This can lead to a flood of messages regarding failed ep queue,
>>> as the endpoint is in the process of being disabled.  Remove the print as
>>> function drivers will likely log queuing errors as well.
>>>
>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>> ---
>>>  drivers/usb/dwc3/gadget.c | 5 +----
>>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 4845682a0408..674a9a527125 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -1812,11 +1812,8 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
>>>  {
>>>  	struct dwc3		*dwc = dep->dwc;
>>>  
>>> -	if (!dep->endpoint.desc || !dwc->pullups_connected || !dwc->connected) {
>>> -		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
>>> -				dep->name);
>>
>> Why not just change this to dev_dbg() instead?
> 
> I agree. A dev_dbg() would be better here. We don't want to loose this
> message forever as it may prevent us from finding buggy function
> drivers.
> 

Thanks Greg/Felipe, will change it to a dev_dbg().

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
