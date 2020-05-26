Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A7A1E20ED
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 13:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgEZLeT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 07:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgEZLeS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 May 2020 07:34:18 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7032C08C5C3
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2020 04:34:16 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h4so2784192wmb.4
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2020 04:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GCJy06H1pRSu/Q8++uLNPv3+6vo/2WW9QkHbY0KEiLc=;
        b=DRrl3Ns2cJtzWcB6n08kFBvUdS852of8mbk4G+JIjPqrWBaJGGvRjWGr0TmeWM1818
         sCmUgDq0mCooR8UdicwXhfWsEJ71VbOGwp23pWgDG3od3z/eL2boVuZx57QgX5ghLWdX
         k1XtO2ENMFpPABY4aUMcQisk30Zb8odi0bUp0L2mWZjAYEb3ccFiAHu1ecQMY1YfJhkQ
         eam1KAlzu1+il+h1EM+PP68zqwWkVV8XJ8gVHJj+XJOroLhBuSHpxRZr/BKigyF6ncwj
         iNNEYtL94deHmix6HL1DjaNekCiPGsyyvmMZe+SPAcPhi88osltKRE5la1Dr04GUwVLh
         rqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GCJy06H1pRSu/Q8++uLNPv3+6vo/2WW9QkHbY0KEiLc=;
        b=sBPknl958uc/+B5LnG6SrTsd2uMSeVoKg6qWn2Ywe7m63JyjhMn6y6UMpfKEJ7I8g3
         y6CsNjK3HGdC2ol/H8erf21WK7StzjlN4wKCkWgnteMPaKl2LxonVgE2SCLIWTNLWprq
         lfsmvLf1wVJU4XsGG1R/jz8Zw8qBH1Zt+NlgM4nfuABoxC8c+D1jeGZuLYMGlC3GKE+q
         mFi/fmXOeFtTOyGagymrGcMkZ2cWKLb0LssGMnub/iDtxZz3MvurvTudnRO0yGIpKPbv
         jZigHA5Dui34UYG7zmc/t47D7ZzX4GIHdY7WoG4JLhoWThUlKvj83NBqYkqfgK1OCJuq
         kD/Q==
X-Gm-Message-State: AOAM533ViXR7/dSTM4ghTNH0hIn9/0DcdsgMxEgm2YqDZCtAqRrC6qJ5
        p9w5WGiERwR9g6ZpQsZ4Hv6fdQ==
X-Google-Smtp-Source: ABdhPJwkJGJ0JgpQb5hhrxl7TRVJYpWWhcoo7CTcTp+/TEYBSaxYaqiFNSmXKLwvq5spLYmlIM+sAw==
X-Received: by 2002:a1c:5408:: with SMTP id i8mr843024wmb.94.1590492855379;
        Tue, 26 May 2020 04:34:15 -0700 (PDT)
Received: from macbook.local ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id q128sm951100wma.38.2020.05.26.04.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 04:34:14 -0700 (PDT)
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
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
 <b20775ba-7870-b0ca-7c65-d72a08fdacb2@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <0723aee9-9ea4-dab5-e083-3cf3858a8f96@linaro.org>
Date:   Tue, 26 May 2020 14:34:11 +0300
MIME-Version: 1.0
In-Reply-To: <b20775ba-7870-b0ca-7c65-d72a08fdacb2@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.05.20 14:04, Sandeep Maheswaram (Temp) wrote:
> Hi Felipe,
> 
> Please let me know how to go forward with this patch
> 

Hi Sandeep,

Please just add a patch to fix the allmodconfig error. Felipe has
suggested to introduce a separate patch which exports the
device_is_bound() function. This export should precede the addition
of interconnect support.

Also regarding the "depends on INTERCONNECT || !INTERCONNECT" change,
no "depends on" would be needed, as we just made the interconnect
framework bool.

Thanks,
Georgi

> Regards
> 
> Sandeep
> 
> On 5/19/2020 12:05 AM, Bjorn Andersson wrote:
>> On Thu 14 May 23:29 PDT 2020, Felipe Balbi wrote:
>>
>>> Hi,
>>>
>>> Georgi Djakov <georgi.djakov@linaro.org> writes:
>>>>>>>>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>>>>>>>>> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>>>>>>>>>> +{
>>>>>>>>>> +    struct device *dev = qcom->dev;
>>>>>>>>>> +    int ret;
>>>>>>>>>> +
>>>>>>>>>> +    if (!device_is_bound(&qcom->dwc3->dev))
>>>>>>>>>> +        return -EPROBE_DEFER;
>>>>>>>>> this breaks allmodconfig. I'm dropping this series from my
>>>>>>>>> queue for
>>>>>>>>> this merge window.
>>>>>>>> Sorry, I meant this patch ;-)
>>>>>>> I guess that's due to INTERCONNECT being a module. There is
>>>>>>> currently a
>>>>>> I believe it's because of this:
>>>>>> ERROR: modpost: "device_is_bound" [drivers/usb/dwc3/dwc3-qcom.ko]
>>>>>> undefined!
>>>>>>
>>>>>>> discussion about this  with Viresh and Georgi in response to another
>>>>>>> automated build failure. Viresh suggests changing
>>>>>>> CONFIG_INTERCONNECT
>>>>>>> from tristate to bool, which seems sensible to me given that
>>>>>>> interconnect
>>>>>>> is a core subsystem.
>>>>>> The problem you are talking about would arise when INTERCONNECT=m and
>>>>>> USB_DWC3_QCOM=y and it definitely exists here and could be
>>>>>> triggered with
>>>>>> randconfig build. So i suggest to squash also the diff below.
>>>>>>
>>>>>> Thanks,
>>>>>> Georgi
>>>>>>
>>>>>> ---8<---
>>>>>> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
>>>>>> index 206caa0ea1c6..6661788b1a76 100644
>>>>>> --- a/drivers/usb/dwc3/Kconfig
>>>>>> +++ b/drivers/usb/dwc3/Kconfig
>>>>>> @@ -129,6 +129,7 @@ config USB_DWC3_QCOM
>>>>>>       tristate "Qualcomm Platform"
>>>>>>       depends on ARCH_QCOM || COMPILE_TEST
>>>>>>       depends on EXTCON || !EXTCON
>>>>>> +    depends on INTERCONNECT || !INTERCONNECT
>>>>> I would prefer to see a patch adding EXPORT_SYMBOL_GPL() to
>>>>> device_is_bound()
>>>> Agree, but just to clarify, that these are two separate issues that
>>>> need to
>>>> be fixed. The device_is_bound() is the first one and USB_DWC3_QCOM=y
>>>> combined
>>>> with INTERCONNECT=m is the second one.
>>> If INTERCONNECT=m, QCOM3 shouldn't be y. I think the following is
>>> enough:
>>>
>>>     depends on INTERCONNECT=y || INTERCONNECT=USB_DWC3_QCOM
>>>
>> This misses the case where INTERCONNECT=n and USB_DWC3_QCOM=[ym] which
>> I don't see a reason for breaking.
>>
>> But if only INTERCONNECT where a bool, then we don't need to specify a
>> depends on, because it will either be there, or the stubs will.
>> We've come to this conclusion in a lot of different frameworks and I
>> don't see why we should do this differently with INTERCONNECT.
>>
>> Regards,
>> Bjorn
> 

