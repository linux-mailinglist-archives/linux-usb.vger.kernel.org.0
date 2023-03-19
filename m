Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE86E6C059B
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 22:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjCSVcj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 17:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjCSVc1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 17:32:27 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437DA1B2DE
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 14:31:53 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id iw17so974563wmb.0
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 14:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679261511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwm7j7gz5tZ/lbs8NKr0hRp3m2lnBn5LK4PqGwVU0rk=;
        b=OAEJuxOlkduMFUJfEueREs+vEjTzCf0vFPxOHmO2fD4RPOCsqELkiG1d06zVdiHKA+
         2ViOYhca6KlcTsxXigXUOq9LuLigxktorwe5qt7vuEt4iqt1lrBXZUE//syKVWD6zUSF
         qX8TNmEwlJrdFSLXQojwbG6GbI3WQqei60jv7WOI8kygtO7fMEX4cD6l0cfHAxXOpLa/
         iLszKMWDwqWqpZ/FSZHuSN0fiaZE+lkWTCZAPUBv3pwSOt8NpwUQOjzbpD9lEEO8Ozvv
         if1Bx8WFZufFgXArVCJOr+DZoYHD49n5li7Im94czz5mBJK9+JkICIq0KD7RPsTxLTPT
         fgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679261511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwm7j7gz5tZ/lbs8NKr0hRp3m2lnBn5LK4PqGwVU0rk=;
        b=abXeSM2Gy6izbYXaMK5udIe3FruKtehTZs7dx4ewDqBxb+hfY+T9BM0Y3eUPIoZKoG
         57v1is2cr0cuYwGy6vx3kUkz1rqRiFvxVE53o9paK00POWFhahsbs9quVevMjy/Zwj35
         VzJUDmTtRYKAXGfbXFqCiCaPkR7RSssmXN3Z6zzWwHUtM4DMYSVz71EFm1/o/jCpjfbZ
         3bwgF5miX/HAareRMYWNkgxC9IkUUknCi7/kF/Bu/MTpu10w5TH2zboD4yA7y7gC+mMk
         cChU9IbQT+e9c1ZwUZyBUmfmPsPF9pBnC6OvFZiAKgDw709EuRCPTm1OTimxUPrqsOxd
         0OKA==
X-Gm-Message-State: AO0yUKVywE425isysWjhuFv5waCeR2rbBsIGsWEDpXFDaHylzj03lpJZ
        qWUd/u3D+taRt4c21SJ8w1yq8Q==
X-Google-Smtp-Source: AK7set/vhhrgnE3viT8koUFQvmrJIAcam3nM3pvPgs7nL9kcOBaDSCNnM0EsCO8FRhTW4D/EGc0uXw==
X-Received: by 2002:a05:600c:3595:b0:3ed:2ae9:6c75 with SMTP id p21-20020a05600c359500b003ed2ae96c75mr20028219wmq.37.1679261511457;
        Sun, 19 Mar 2023 14:31:51 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002cfe685bfd6sm7345241wrw.108.2023.03.19.14.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 14:31:50 -0700 (PDT)
Message-ID: <5098322b-d09b-72ec-ac6a-128a6a64ea17@linaro.org>
Date:   Sun, 19 Mar 2023 21:31:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-10-bryan.odonoghue@linaro.org>
 <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
 <a4da1f8f-333e-9ded-d784-7f86c45c7156@linaro.org>
 <346ecd20-d64f-1d47-4860-861e142f9700@linaro.org>
 <aa5d1492-906f-9e30-8f97-6321db692c73@linaro.org>
 <c5ac0d15-4651-318e-4dd2-37b2f90b2ba0@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <c5ac0d15-4651-318e-4dd2-37b2f90b2ba0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 19/03/2023 17:50, Krzysztof Kozlowski wrote:
> On 19/03/2023 16:44, Bryan O'Donoghue wrote:
>> On 19/03/2023 15:10, Krzysztof Kozlowski wrote:
>>> On 19/03/2023 15:59, Bryan O'Donoghue wrote:
>>>> On 19/03/2023 11:58, Krzysztof Kozlowski wrote:
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>>>>> +
>>>>>> +description: |
>>>>>> +  Qualcomm PMIC Virtual Type-C Port Manager Driver
>>>>>> +  A virtual device which manages Qualcomm PMIC provided Type-C port and
>>>>>> +  Power Delivery in one place.
>>>>> OK, so it looks like bindings for driver, so a no-go. Unless there is
>>>>> such device as "manager", this does not look like hardware description.
>>>>>
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: qcom,pmic-virt-tcpm
>>>>>> +
>>>>>> +  connector:
>>>>>> +    type: object
>>>>>> +    $ref: /schemas/connector/usb-connector.yaml#
>>>>>> +    unevaluatedProperties: false
>>>>>> +
>>>>>> +  port:
>>>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>>>> +    description:
>>>>>> +      Contains a port which consumes data-role switching messages.
>>>>>> +
>>>>>> +  qcom,pmic-typec:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>>> +    description:
>>>>>> +      A phandle to the typec port hardware driver.
>>>>>> +
>>>>>> +  qcom,pmic-pdphy:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> Having typec and phy as phandles - not children - also suggests this is
>>>>> some software construct, not hardware description.
>>>>
>>>> So probably I didn't interpret Rob's comment correctly here.
>>>
>>> He proposed to merge it with other node:
>>> "probably merged with
>>> one of the nodes these phandles point to."
>>>
>>> "Why can't most of this binding be part of"
>>>
>>> I don't see how you implemented his comments. Actually, nothing improved
>>> here in this regard - you still have these phandles.
>>
>> So this comment from Rob is what I was aiming for
>>
>> "Your other option is instantiate your own device from the virtual
>> driver's initcall based on presence of the 2 nodes above. "
>>
>> rather than two mush the pdphy and typec into one device, which they are 
>> not.
> 
> Sure, but you did not instantiate anything based on these two or one
> nodes. You added virtual device node.
> 
> 
>> I guess what I'm trying to understand is how you guys would suggest that 
>> is actually done.
> 
> You have there already node for the PMIC USB Type-C, so this should be
> part of it. I really do not understand why this is separate device lying
> around in parallel like:

The pdphy is fairly well encapsulated (3 tcpm callbacks go to it, that's
all?), I think the tcpm part could be merged in with the typec driver
and it could just have a phandle to the pdphy node to represent the
dependency.

Then in the typec driver you can get the device with
spmi_device_from_of() and call into it that way for the few tcpm
callbacks that it needs to handle and to pass in the tcpm_port.


> 
> pmic {
> 	usb {
> 	};
> };
> 
> virtual- pmic-tcpm {
> };
> 
> What hardware piece does such description represent?
> 
>>
>> Could I trouble you for an example ?
>>
>> ---
>> bod
> 
> Best regards,
> Krzysztof
> 

-- 
Kind Regards,
Caleb (they/them)
