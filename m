Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB05A293463
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 07:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391734AbgJTFqr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 01:46:47 -0400
Received: from z5.mailgun.us ([104.130.96.5]:25145 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391732AbgJTFqr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 01:46:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603172806; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=aZ/gtGhK2/mvhNpTVqnhe0iPxDSg0IKVah2x1SvhzIs=; b=hbrwwoOI0d308RAjRJEbUx4DJEU71G1zIsCVB3J6aDPyDossbvUEQFUj3PHonpZ0ehEVqcZo
 jUYJqM7lvbrVX/yeQId7Wz4ZMd3USUwcWeujD1ENvwGc9QjutwnPKTMmotU2YO4or0N+5gfO
 7SVrZm2i/PKU9ZXeHlNlHgTqApk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f8e79c10764f13b00cdbb3f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 05:46:41
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A6A4C433CB; Tue, 20 Oct 2020 05:46:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.119.152] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44D79C4339C;
        Tue, 20 Oct 2020 05:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44D79C4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: dwc3: Power management for cable disconnect
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>
References: <0fe1cf51-c9d4-9780-e542-a613bba58928@codeaurora.org>
 <50611524-6211-02e7-73b8-71a728234e91@synopsys.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <dec76c46-c62b-91d6-3cb3-0edd5952a07f@codeaurora.org>
Date:   Mon, 19 Oct 2020 22:46:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <50611524-6211-02e7-73b8-71a728234e91@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 10/16/2020 3:42 PM, Thinh Nguyen wrote:
> Hi,
> 
> Wesley Cheng wrote:
>> Hi linux-usb members!
>>
>> I was looking at seeing how the DWC3 drivers are handling the USB cable
>> disconnect routine (VBUS low situation) when there is no UDC binded.  Is
>> the below behavior expected?
>>
>> 1.  Enumerate device w/ host.
>> 2.  Gadget is unbinded
>> 	- echo "" > /sys/kernel/config/usb_gadget/g1/UDC
>> 3.  Disconnect the USB cable (VBUS low)
>> 4.  No dwc3_gadget_disconnect_interrupt() seen (since controller is
>>    halted from step#1)
> 
> I think you mean after step#2?
> 
>> 5.  Runtime PM autosuspend fails due to "dwc->connected" being true
>> (cleared in dwc3_gadget_disconnect_interrupt())
> 
> This is probably a mishap in the dwc3 driver. When the function driver
> is unregistered, the pullup() callback will halt the controller. This is
> a soft-disconnect, and dwc->connected should be false.
> 
>> 6.  Gadget binded
>> 	- echo udc_name > /sys/kernel/config/usb_gadget/g1/UDC
> 
> After this step, the device will still remain disconnected.
> 
>> 7.  No runtime suspend until cable is plugged in and out
> 
> ... until the reset and connection done interrupt telling the driver
> that the device is now connected.
> 
>>
>> This would be problematic for devices which have to reliably enter
>> suspend.  I just wanted to see if this is a scenario which has been
>> considered?  Seems odd that we would still keep the controller out of
>> low power if there was no cable connected.
>>
> 
> This should be a simple fix. Would you create a patch for this?
> 

Hi Thinh,

Sure, will submit a patch for this.  Will upload it soon!

Thanks

Regards,
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
