Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060F21E2076
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 13:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388999AbgEZLEr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 07:04:47 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:60128 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389003AbgEZLEq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 May 2020 07:04:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590491085; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SKBdhs63Zp2CNDzdiohqN/c3xb5urkHJTxlo1SdluWA=; b=VmvcfV+w2UFlOhZKMY6i3W/t7qnb61gBsnKC3HBAfBZjP19eOkq/FrPV1lTEDSP/84dH/c4f
 cryxSprXaL6oegMeLb3r7/gzE+F5IlFFdTrCI5f4u+kwhyeVtX875McOtDHKhOI3SBMDzZTC
 jPVouq+4XVqY4dIYr/eF4pduhxE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5eccf7b03131442d9595171b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 May 2020 11:04:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D019C43395; Tue, 26 May 2020 11:04:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9663FC433C6;
        Tue, 26 May 2020 11:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9663FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org> <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
 <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org> <87tv0h3fpv.fsf@kernel.org>
 <090e48d7-7988-eea1-bf39-f6820578d354@linaro.org> <87r1vl3e42.fsf@kernel.org>
 <20200518183512.GE2165@builder.lan>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <b20775ba-7870-b0ca-7c65-d72a08fdacb2@codeaurora.org>
Date:   Tue, 26 May 2020 16:34:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518183512.GE2165@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

Please let me know how to go forward with this patch

Regards

Sandeep

On 5/19/2020 12:05 AM, Bjorn Andersson wrote:
> On Thu 14 May 23:29 PDT 2020, Felipe Balbi wrote:
>
>> Hi,
>>
>> Georgi Djakov <georgi.djakov@linaro.org> writes:
>>>>>>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>>>>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>>>>>>>>> +{
>>>>>>>>> +	struct device *dev = qcom->dev;
>>>>>>>>> +	int ret;
>>>>>>>>> +
>>>>>>>>> +	if (!device_is_bound(&qcom->dwc3->dev))
>>>>>>>>> +		return -EPROBE_DEFER;
>>>>>>>> this breaks allmodconfig. I'm dropping this series from my queue for
>>>>>>>> this merge window.
>>>>>>> Sorry, I meant this patch ;-)
>>>>>> I guess that's due to INTERCONNECT being a module. There is currently a
>>>>> I believe it's because of this:
>>>>> ERROR: modpost: "device_is_bound" [drivers/usb/dwc3/dwc3-qcom.ko] undefined!
>>>>>
>>>>>> discussion about this  with Viresh and Georgi in response to another
>>>>>> automated build failure. Viresh suggests changing CONFIG_INTERCONNECT
>>>>>> from tristate to bool, which seems sensible to me given that interconnect
>>>>>> is a core subsystem.
>>>>> The problem you are talking about would arise when INTERCONNECT=m and
>>>>> USB_DWC3_QCOM=y and it definitely exists here and could be triggered with
>>>>> randconfig build. So i suggest to squash also the diff below.
>>>>>
>>>>> Thanks,
>>>>> Georgi
>>>>>
>>>>> ---8<---
>>>>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>>>>> index 206caa0ea1c6..6661788b1a76 100644
>>>>> --- a/drivers/usb/dwc3/Kconfig
>>>>> +++ b/drivers/usb/dwc3/Kconfig
>>>>> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
>>>>>   	tristate "Qualcomm Platform"
>>>>>   	depends on ARCH_QCOM || COMPILE_TEST
>>>>>   	depends on EXTCON || !EXTCON
>>>>> +	depends on INTERCONNECT || !INTERCONNECT
>>>> I would prefer to see a patch adding EXPORT_SYMBOL_GPL() to device_is_bound()
>>> Agree, but just to clarify, that these are two separate issues that need to
>>> be fixed. The device_is_bound() is the first one and USB_DWC3_QCOM=y combined
>>> with INTERCONNECT=m is the second one.
>> If INTERCONNECT=m, QCOM3 shouldn't be y. I think the following is
>> enough:
>>
>> 	depends on INTERCONNECT=y || INTERCONNECT=USB_DWC3_QCOM
>>
> This misses the case where INTERCONNECT=n and USB_DWC3_QCOM=[ym] which
> I don't see a reason for breaking.
>
> But if only INTERCONNECT where a bool, then we don't need to specify a
> depends on, because it will either be there, or the stubs will.
> We've come to this conclusion in a lot of different frameworks and I
> don't see why we should do this differently with INTERCONNECT.
>
> Regards,
> Bjorn

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

