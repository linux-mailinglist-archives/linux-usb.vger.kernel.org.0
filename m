Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF4E193EEC
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 13:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgCZMdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 08:33:13 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:64999 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727560AbgCZMdM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 08:33:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585225992; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=dKrpV/jIT75q98odc7+as3tEj2HbGV+dLZ9fY0aTxDU=; b=H6h3nxin9wxwNEL2whFBsLvh2MxcKnhiMVQGfacCNrBJbVdUCU3MvdwdV+Cbsim0I7tto7kx
 NbQ5furX9z5QQBde5ECVwSQ/n+GT9rKU5Df3Z5IOAQmg8o2UJgq2vJvBtgyb8pZ/GmZWZX07
 FZ+lSI9LHu9ONqt9PV0nWgW5hFU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7ca107.7f002e671a08-smtp-out-n01;
 Thu, 26 Mar 2020 12:33:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3089C433BA; Thu, 26 Mar 2020 12:33:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [192.140.154.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sallenki)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 12510C433D2;
        Thu, 26 Mar 2020 12:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12510C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix use after free issue as part of
 queue failure
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        mgautam@codeaurora.org, jackp@codeaurora.org
References: <20200326060033.14550-1-sallenki@codeaurora.org>
 <20200326081601.GB979574@kroah.com>
 <aaa5c90b-dd6c-d025-3027-201f0e8c2f8e@codeaurora.org>
 <20200326093010.GB994882@kroah.com>
From:   Sriharsha Allenki <sallenki@codeaurora.org>
Message-ID: <ab9aefee-6603-e9c1-f6ac-5943301c5304@codeaurora.org>
Date:   Thu, 26 Mar 2020 18:03:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200326093010.GB994882@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,
On 3/26/2020 3:00 PM, Greg KH wrote:
> On Thu, Mar 26, 2020 at 02:14:23PM +0530, Sriharsha Allenki wrote:
>> Hi Greg,
>>
>> On 3/26/2020 1:46 PM, Greg KH wrote:
>>> On Thu, Mar 26, 2020 at 11:30:33AM +0530, Sriharsha Allenki wrote:
>>>> In AIO case, the request is freed up if ep_queue fails.
>>>> However, io_data->req still has the reference to this freed
>>>> request. In the case of this failure if there is aio_cancel
>>>> call on this io_data it will lead to an invalid dequeue
>>>> operation and a potential use after free issue.
>>>> Fix this by setting the io_data->req to NULL when the request
>>>> is freed as part of queue failure.
>>>>
>>>> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
>>>> ---
>>>>  drivers/usb/gadget/function/f_fs.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>>>> index 571917677d35..767f30b86645 100644
>>>> --- a/drivers/usb/gadget/function/f_fs.c
>>>> +++ b/drivers/usb/gadget/function/f_fs.c
>>>> @@ -1120,6 +1120,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>>>>  
>>>>  		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
>>>>  		if (unlikely(ret)) {
>>>> +			io_data->req = NULL;
>>>>  			usb_ep_free_request(ep->ep, req);
>>>>  			goto error_lock;
>>>>  		}
>>>> -- 
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
>>> What commit does this fix?  Should it go to stable kernels, and if so,
>>> how far back?
>> The commit 2e4c7553cd6f ("usb: gadget: f_fs: add aio support") introduced
>> the problem. It is good to have in stable kernels and it needs to go all
>> theway back to linux-3.15.y.
>>
>> Hope this information helps.
> Great, please resend this with the proper Fixes: and cc: stable... tag
> on it so that it gets picked up properly.
Thanks Greg for review. Sent out v2 patch with the updated tags.
> thanks,
>
> greg k-h
Regards,
Sriharsha
