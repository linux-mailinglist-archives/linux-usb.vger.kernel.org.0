Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D10D193B3B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 09:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgCZIom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 04:44:42 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:38495 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726210AbgCZIom (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 04:44:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585212281; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xj8EppluynW4qEUCMWGmynN2QVP84We2yAFiUGDilWY=; b=JJfgcKF109zhTWhX6d/50+AA4NNW9sEJGpZWbJgYE+BwsFudcIhsoEjFB3DbBd7MOVVAamrc
 QF742OlHv7WzIZEFT/Ppk5FtxhS7pIz0peAJH9QdEN+EN5K8RrD+3C6adYQ8WI40zP1+KDQh
 XNh2itHbeo2GkG3K8EZShUZFv7c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7c6b6c.7f285ef13848-smtp-out-n02;
 Thu, 26 Mar 2020 08:44:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B364C433D2; Thu, 26 Mar 2020 08:44:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [192.140.154.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sallenki)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47BB0C433F2;
        Thu, 26 Mar 2020 08:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47BB0C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
Subject: Re: [PATCH] usb: gadget: f_fs: Fix use after free issue as part of
 queue failure
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        mgautam@codeaurora.org, jackp@codeaurora.org
References: <20200326060033.14550-1-sallenki@codeaurora.org>
 <20200326081601.GB979574@kroah.com>
From:   Sriharsha Allenki <sallenki@codeaurora.org>
Message-ID: <aaa5c90b-dd6c-d025-3027-201f0e8c2f8e@codeaurora.org>
Date:   Thu, 26 Mar 2020 14:14:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200326081601.GB979574@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 3/26/2020 1:46 PM, Greg KH wrote:
> On Thu, Mar 26, 2020 at 11:30:33AM +0530, Sriharsha Allenki wrote:
>> In AIO case, the request is freed up if ep_queue fails.
>> However, io_data->req still has the reference to this freed
>> request. In the case of this failure if there is aio_cancel
>> call on this io_data it will lead to an invalid dequeue
>> operation and a potential use after free issue.
>> Fix this by setting the io_data->req to NULL when the request
>> is freed as part of queue failure.
>>
>> Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
>> ---
>>  drivers/usb/gadget/function/f_fs.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 571917677d35..767f30b86645 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -1120,6 +1120,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
>>  
>>  		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
>>  		if (unlikely(ret)) {
>> +			io_data->req = NULL;
>>  			usb_ep_free_request(ep->ep, req);
>>  			goto error_lock;
>>  		}
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
> What commit does this fix?  Should it go to stable kernels, and if so,
> how far back?
The commit 2e4c7553cd6f ("usb: gadget: f_fs: add aio support") introduced
the problem. It is good to have in stable kernels and it needs to go all
theway back to linux-3.15.y.

Hope this information helps.
>
> thanks,
>
> greg k-h
Regards,
Sriharsha
