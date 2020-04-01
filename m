Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7411719ACD5
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 15:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732534AbgDAN1k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 09:27:40 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:14517 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732296AbgDAN1k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 09:27:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585747659; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=r5D5KBjX4JT/mnRqoOyX2W+N6ULpxb16X/SqtUY4Y2s=; b=U2XTt02tKMP2ow0Njcn8b3hnVDzpZdpsO9FQ9LJvTlNpwn2CHu+OVOw+KH0YGIIAZjspPMUE
 J0RKXyTxaSRn7+0uStaLpGCIDUL+R1Fb6pOGBsXKE/Ii+QUi0/XB9HffRofPJM1xZbEK6unF
 VM0XE/yzhQBz8ExWA5CPqxfdbR8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e84967c.7f1b95e8fd50-smtp-out-n05;
 Wed, 01 Apr 2020 13:26:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 45F5AC44791; Wed,  1 Apr 2020 13:26:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [192.140.155.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sallenki)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C690FC433F2;
        Wed,  1 Apr 2020 13:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C690FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
Subject: Re: Fwd: [DWC3][Gadget] Question regarding the unmapping of request
 as part of queue failure
To:     Felipe Balbi <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>
References: <0105a5cd-936e-fb08-77bf-c2f1dbf0aeed@codeaurora.org>
 <53a4614f-d1bc-5856-8e01-eb790a6ff7fe@codeaurora.org>
 <87369skhdm.fsf@kernel.org>
From:   Sriharsha Allenki <sallenki@codeaurora.org>
Message-ID: <f76b1964-ee15-8076-2575-4f533fc53244@codeaurora.org>
Date:   Wed, 1 Apr 2020 18:56:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87369skhdm.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


On 3/28/2020 2:04 PM, Felipe Balbi wrote:
> Hi,
>
> Sriharsha Allenki <sallenki@codeaurora.org> writes:
>> I was looking at the code flow for ep_queue and came across the
>> following piece of code.
>>
>> __dwc3_gadget_kick_transfer {
>>  
>>     dwc3_prepare_trbs(dep);
>>     req = next_request(&dep->started_list);
>>     if (!req) {
>>             dep->flags |= DWC3_EP_PENDING_REQUEST;
>>             return 0;
>>     }
>> }
>>
>> As part of dwc3_prepare_trbs(dep), we get a request from the pending_list
>> and queue to the tail of the started_list. But here we get the head of
>> the started_list, now if there is any failure in issuing UPDATE_TRANSFER
>> to the core, we unmap this request using "dwc3_gadget_del_and_unmap_request".
>>
>> But if this kick_transfer was part of the ep_queue and we have failed
>> to issue update transfer, instead of unmapping the request we are trying
>> to queue, we will be unmapping a different request (first in the started_list)
>> which the core could have already started processing. I believe we should unmap
>> the request we are trying to queue but not any other.
> no, we have to start requests in order and dequeue them in order as
> well. There's no way to verify that the request is already processed by
> the HW, other than checking HWO bit which is set during
> dwc3_prepare_trbs(). This is a HW-SW race condition that we can't really
> fix.
>
> It is minimized, however, by the fact that, at least for non-isoc
> endpoints, we use No Status Update Transfer commands, which means the
> command can't fail.
Thanks Felipe for the reply. I see that this is a trick race condition
between HW-SW, I have seen one occurrence where ep_queue from f_fs has
failed (at kick_transfer).And since Asynchronous IO has been enabled,
the request was freed leading to thecorruption of started_list because
the list_del and unmap was happened on the requestat the head, but the
request freed by the f_fs is at the tail of the started_list. This
caused a use after free issue.

Please let me know your comments.

Thanks and Regards,
Sriharsha
