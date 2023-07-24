Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B3675EE74
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 10:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbjGXIz3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 04:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjGXIzT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 04:55:19 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7181D10EB
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 01:55:09 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-52229d3b8c8so1425396a12.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690188908; x=1690793708;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhPKMxZi0lYsmk3OnAguIIrqJ1a2PPNTKhYBvw/UW8o=;
        b=gOlFfvUzMEpXyaDTAcBZgj5gOP4CLaiQoX78O2NV6FqDFfKnOWtCMM8n2Iif2/5Ffd
         lildWJH6hCT2NDcGONZ9VLaA6dce/myie5+tCdE1wcsGHVvFK/CAj3WeEcXUdYWrIATh
         VHPKbuVdVnRg1tudNZr1vfmebeI0tP6Ifa6bPCBAG+qepsDGXNg2N591kEJdq6o2lrUd
         8FQYC1nELmk+SGV4+9VAJzcypcd5Bd49Rk2JnFQ0C63sPjBMmrPUtXUSju2l8TVvvT6B
         UKGVfl39qQBqmAzBxlrSIyV94cIZrKADGFzogdHcml5joZwkCt64CuEylVkZlTQa3c1P
         10ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690188908; x=1690793708;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhPKMxZi0lYsmk3OnAguIIrqJ1a2PPNTKhYBvw/UW8o=;
        b=Tez64N6kAv5dPkXL/V4HGvYNQ8wFa7XEXTuNfob3PkAlFiYIH1FS+1F5/rCyppIjI0
         VVPPtt/Ly5fou19VMbZrW+y4XBG3ZK5omXuFH/Bl0jAP6EzxNjgBQFAM+lm4D0J213p1
         vZuOrBg7sj8wj5syZyiZEX9RvBDJ7D9XjWGECb5NfFSGec044rTheL0FAeYqDwp1bg3/
         03r9u8QCLTNt5YniJQ5IjUDiT8jD28EdUSaDe/kS0L4wz16J91riM+TGDX5zUHhjNytA
         hL5vtYEspIe7ytPyPCI21ONvIrECTeNI52tbLFpOph/YA2oIzavP4L8JsmUzYa8pshWn
         0rYg==
X-Gm-Message-State: ABy/qLYT8WwqNNDdyc4dPhxfhg2I9xKT8dNyqU+dzRJrGSKR01EyHQzB
        E/bfnP0Rc5fQrUqzvqMJBhE04Q==
X-Google-Smtp-Source: APBJJlEvGQqPbacW0dN3hmwJWR+nUzAEC2GbSbpGeSWq1K1U42vofUNAahjno4xauusckq1o4Iyfpw==
X-Received: by 2002:a17:906:5346:b0:997:eac2:65e0 with SMTP id j6-20020a170906534600b00997eac265e0mr8766964ejo.73.1690188907956;
        Mon, 24 Jul 2023 01:55:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t10-20020a1709064f0a00b009929d998abcsm6347000eju.209.2023.07.24.01.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 01:55:07 -0700 (PDT)
Message-ID: <70d1f41d-2c00-d80b-97c1-6d80301d79b8@linaro.org>
Date:   Mon, 24 Jul 2023 10:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
Content-Language: en-US
To:     "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <0d12c7a196d6ad81cfc69b281dd1c4cca623d9bd.1690179693.git.adrian.ho.yin.ng@intel.com>
 <70a823a4-54d1-18a3-3d77-45564d88e8f1@linaro.org>
 <SA2PR11MB486040E69B4DCE82631213328002A@SA2PR11MB4860.namprd11.prod.outlook.com>
 <2b3fcc1b-156d-9f5f-3436-139ebcd846fe@linaro.org>
 <SA2PR11MB4860256BC6BC5A2F9259F8698002A@SA2PR11MB4860.namprd11.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SA2PR11MB4860256BC6BC5A2F9259F8698002A@SA2PR11MB4860.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/07/2023 09:53, Ng, Adrian Ho Yin wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Monday, 24 July, 2023 3:28 PM
>> To: Ng, Adrian Ho Yin <adrian.ho.yin.ng@intel.com>;
>> gregkh@linuxfoundation.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; linux-
>> usb@vger.kernel.org; devicetree@vger.kernel.org;
>> Thinh.Nguyen@synopsys.com; p.zabel@pengutronix.de
>> Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
>>
>> On 24/07/2023 09:18, Ng, Adrian Ho Yin wrote:
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Monday, 24 July, 2023 3:05 PM
>>>> To: Ng, Adrian Ho Yin <adrian.ho.yin.ng@intel.com>;
>>>> gregkh@linuxfoundation.org; robh+dt@kernel.org;
>>>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; linux-
>>>> usb@vger.kernel.org; devicetree@vger.kernel.org;
>>>> Thinh.Nguyen@synopsys.com; p.zabel@pengutronix.de
>>>> Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB
>>>> controller
>>>>
>>>> On 24/07/2023 08:36, adrian.ho.yin.ng@intel.com wrote:
>>>>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
>>>>>
>>>>> Existing binding intel,keembay-dwc3.yaml does not have the required
>>>>> properties for Intel SoCFPGA devices.
>>>>> Introduce new binding description for Intel SoCFPGA USB controller
>>>>> which will be used for current and future SoCFPGA devices.
>>>>>
>>>>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
>>>>> ---
>>>>>  .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
>>>>>  1 file changed, 84 insertions(+)
>>>>>  create mode 100644
>>>>> Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>>>> b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..e36b087c2651
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>>>> @@ -0,0 +1,84 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/usb/intel,socfpga-dwc3.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Intel SoCFPGA DWC3 USB controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - intel,agilex5-dwc3
>>>>> +      - const: intel,socfpga-dwc3
>>>>
>>>> So you did not even wait for my answer? What happened here with this
>>>> compatible? I asked you to change file name, not add intel,socfpga-dwc3.
>>>> Again - why using different style for Agilex? Which style is correct?
>>>>
>>>
>>> The intention is to use a common binding for Intel SoCFPGA products that is
>> using DWC3 controller.
>>> This is done with reference to qcom,dwc3.yaml.
>>
>> Nope, your driver change does not match it at all. Your explanation does not
>> make any sense.
>>
>> Don't answer only half of my questions. So third time - the last: since you add
>> new style for Agilex, which style of Agilex compatibles is correct?

I still did not receive here answer. Which style, naming convention for
agilex is correct for your platform?

Why this:
git grep agilex | grep intel,

gives different compatibles than you start here? I assume Intel/Altera
knows better the platform so will provide here some guidance. If unsure,
please consult your colleagues.


>>
> 
> My apologies.
> In your opinion which is the proper practice?
> 1. Create new binding for new products that is using the same controller.

What is "new binding"? What do you mean by that? New file, then not.

> 2. Create a common binding that will be used by products using the same controller?
> Referring to the current bindings that are available the two options are being practiced at the moment.
> 
> If option 1 is the proper practice the correct Agilex compatible is intel,agilex5-dwc3.
> To rework the binding to cater for agilex5-dwc3 only. The compatible in glue driver will remain the same. 
> 
> If option 2 is the proper practice then the correct Agilex compatible is intel,socfpga-dwc3.
> To update compatible in glue driver in V3. 
> 


Recommended practice is to use specific compatible for both: your device
and as fallback for any future devices. In certain cases, option 2 is okay.


Best regards,
Krzysztof

