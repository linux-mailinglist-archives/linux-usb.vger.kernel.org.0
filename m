Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A317D36E703
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 10:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239685AbhD2I2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 04:28:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27323 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232734AbhD2I2G (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Apr 2021 04:28:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619684841; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=6qgqjuuhiEh5SLFu0O4kW2me1+CWdQXIP6tlMRmWZMo=; b=kuIo3PAksDEKRSGt97QueYXddubw6xRxC4Qrf4CX8UQLJlzvxvmUez0V5WyWnKQ5yaxL4UlE
 7UoInEBu5s7ItxaZTjhj4w4oebIHFJq9o2T3BA181lOMMOIPMcT7aKdf+oMmev5dXw58/IPp
 0hM7JMoHetey5yUCOvO8aF3x1PA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 608a6de4853c0a2c46db46d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Apr 2021 08:27:16
 GMT
Sender: prathampratap=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE059C4338A; Thu, 29 Apr 2021 08:27:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [172.20.10.6] (unknown [106.207.45.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: prathampratap)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2953FC433F1;
        Thu, 29 Apr 2021 08:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2953FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=prathampratap@codeaurora.org
Subject: Re: ep0 request dequeue for function drivers
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
References: <655514e3-90c1-e628-d5e6-efb298f49038@codeaurora.org>
 <87bla1l58y.fsf@kernel.org>
From:   Pratham Pratap <prathampratap@codeaurora.org>
Message-ID: <fc80f058-d015-86f1-3857-b62720c89098@codeaurora.org>
Date:   Thu, 29 Apr 2021 13:57:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87bla1l58y.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the explanation. Now it is clear why we don't need this in 
upstream.

--Pratham

On 4/26/2021 3:47 PM, Felipe Balbi wrote:
> Hi,
>
> Pratham Pratap <prathampratap@codeaurora.org> writes:
>> Hi,
>>
>> Let's say a function driver queues a request on ep0 and before the
>> completion handler could run composition switch/physical disconnect
>> happens. This request will be in pending list since gadget_giveback is
>> not done but the composite driver will free the request from
>> composite_dev_cleanup. Now, once the next connect happens, another ep0
>> request is queued and while handling the completion of that request,
>> gadget driver might end up accessing the old/stale request leading to
>> list_poison since pending list is corrupted.
> argh, I'm assuming you're using dwc3. It's always a good idea to Cc
> maintainers for the drivers or subsystems in question. You can rely on
> scripts/get_maintainer.pl to get an idea who you should Cc.
>
> Anyway, assuming dwc3.
>
> Have you tried to actually reproduce this? Did you collect tracepoints?
> Did you read dwc3's documentation, specially in regards to reporting
> bugs?
>
> Try to consider what happens when the cable is yanked and you'll quickly
> realize what you suggest can't happen. How does USB know that cable is
> disconnected? What happens to dwc3 when the cable is disconnected? What
> does the driver do about it?
>
> If you really found a bug, please report it correctly, following the
> Reporting Bugs section of dwc3 documentation, Cc the relevant people and
> make sure to reproduce the problem with *mainline*; downstream kernel is
> not acceptable ;-)
>
> Also, please be clear about the setup you're using. The only thing I can
> infer is that you're using dwc3 with one of the QC platforms and I can
> only infer that due to your email domain. Please be clear, how to
> reproduce? Which QC platform are you using? Which kernel version?
>
>> To fix this, the function drivers might want to use setup_pending(mark
>> it to true) flag so that when composite_dev_cleanup is run the requests
>> are given back from usb_ep_dequeue; clear the setup pending flag in
>> function driver when completion handler is run successfully. I can see
>> this issue in almost all the function drivers.
> Nah, we don't need that. Please answer the questions above about
> handling for cable disconnect and you'll see this is unnecessary.
>
