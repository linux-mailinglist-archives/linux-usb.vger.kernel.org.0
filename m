Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6B539EDE9
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 07:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhFHFJs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 01:09:48 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30398 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbhFHFJs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 01:09:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623128875; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=2WqStAdtD5CJqMq8/pD/xnR0irJMgBYYsJ2cUkHzsVQ=; b=g0VvzT6G0Bw1a0LEN1pn7V4ox3KliPLhufPnZtj2NPLChNxGZcJVui8j0XtPrO0O9XnqX+Hv
 NTKi3ZlmRmeOxf+oN3/N3qQhdZHL+wDpoOyJ6Ol9RQ+HcalLXp4G94k0li18UOX7FYbKW7g8
 WrR8cbrPr90UFk056/qzfj3/GY0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60befb0be570c0561923bf3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 05:07:23
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 517D6C433F1; Tue,  8 Jun 2021 05:07:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.62.3] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 92B35C433D3;
        Tue,  8 Jun 2021 05:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 92B35C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
To:     Jack Pham <jackp@codeaurora.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <20210607160438.GA2975@jackp-linux.qualcomm.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <af14d52d-4d02-4b41-3dca-3bec856b18e6@codeaurora.org>
Date:   Mon, 7 Jun 2021 22:07:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210607160438.GA2975@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jack,

On 6/7/2021 9:04 AM, Jack Pham wrote:
> Hey Wesley,
> 
> On Fri, Jun 04, 2021 at 01:54:48PM +0200, Greg KH wrote:
>> On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
>>> Changes in V9:
>>>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qcom will
>>>    add the property by default from the kernel.
>>
>> This patch series has one build failure and one warning added:
>>
>> drivers/usb/dwc3/gadget.c: In function ‘dwc3_gadget_calc_tx_fifo_size’:
>> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of ‘dwc3_mdwidth’ makes pointer from integer without a cast [-Wint-conversion]
>>   653 |         mdwidth = dwc3_mdwidth(dwc->hwparams.hwparams0);
>>       |                                ~~~~~~~~~~~~~^~~~~~~~~~
>>       |                                             |
>>       |                                             u32 {aka unsigned int}
>> In file included from drivers/usb/dwc3/debug.h:14,
>>                  from drivers/usb/dwc3/gadget.c:25:
>> drivers/usb/dwc3/core.h:1493:45: note: expected ‘struct dwc3 *’ but argument is of type ‘u32’ {aka ‘unsigned int’}
>>  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
>>       |                                ~~~~~~~~~~~~~^~~
> 
> I'm guessing you were previously using the DWC3_MDWIDTH macro which
> operated on the 'hwparams0' reg value directly, but probably had to
> switch it to the dwc3_mdwidth() inline function that Thinh had replaced
> it with recently. Forgot to compile-test I bet? :)
> 
Ah, looks like that's the case.  I tried this on our internal branches,
which didn't have Thinh's change, which is probably why it worked in the
first place.  Will fix this.

>> drivers/usb/dwc3/dwc3-qcom.c: In function ‘dwc3_qcom_of_register_core’:
>> drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of function ‘of_add_property’; did you mean ‘of_get_property’? [-Werror=implicit-function-declaration]
>>   660 |                 ret = of_add_property(dwc3_np, prop);
>>       |                       ^~~~~~~~~~~~~~~
>>       |                       of_get_property
> 
> Scratched my head on this one a bit, since 'of_add_property' is clearly
> declared in <linux/of.h> which dwc3-qcom.c directly includes. Then I
> looked closer and saw the declaration only in case of #ifdef CONFIG_OF
> and noticed it doesn't have a corresponding no-op static inline
> definition in the case of !CONFIG_OF. Again I'm guessing here that Greg
> must have built on a non-OF config.  We should probably include a patch
> that adds the stub.
> 

Nice catch, will add the stub.

Thanks
Wesley Cheng

> Thanks,
> Jack
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
