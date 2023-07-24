Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1618D75EC7B
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 09:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjGXH1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 03:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbjGXH1r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 03:27:47 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CEB1187
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:27:46 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-977e0fbd742so648652666b.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183664; x=1690788464;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQOor4lSu6HLfLTNEs3eq79V/KKG+rTRQ64zE8XP0bI=;
        b=WUmZ7+za3BCSDZpWOKbgHVpYMXJNCmQJqkB6i4sUZWct/+LnFK6wcoJlxej1nSpikm
         JxoMp7cfOTASYlPhrQJb9zGUme3L0yHYCZ0kbBX1QpAxuTdd4dX3oEPZpeQwD54o0wZF
         kC3JLL4JlSdIF7oxNFEtrFsFfrTeZnTlo5FiAd2ZIZh+PyHkTs4eJSmogMXDq+IC/d4i
         8zIttMyElbfYKKo44uwMrPwLeI6FDQIbP4CJFUXZsIJWWUT+kguZe7lKqIGccBOl2i+w
         aH6OLLUcZQziAgor27/oQoLn4qCCIJH2DJnKNO83Wv8h9sqcxoEB6Rp5sWk0jg/IYv2X
         K44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183664; x=1690788464;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQOor4lSu6HLfLTNEs3eq79V/KKG+rTRQ64zE8XP0bI=;
        b=U2CL5um2Y1a6gdf01BsnmqfdbjXdwrdqSd4CnOVITjlBtDzFQR85lSqBn5jypKfA4M
         kt6fByO/zXczqmW4cuswF/vdJgNi3ihbdZjY4HnHpQVpD+297k7GWBbDodr4Wuv5+/2f
         VqudG78KRy7R1tdD2qjIcId6Bv9Dvbtzi5hgtAgIeP/0hxsti5KBkuIxJxH+r4KTLe+Q
         otex+Wcrs6E749MBZ+n5cCsDxhGZxPay5OVUNG6anrwkr+4vuJ7oiNygg10Gs8J0+4zE
         k220Zwul9gYZd1+3GpsRS62+J5d5AomryI8U9qYCccWfpaMt8PpDi8quyxU6cgP9eSRz
         dcxw==
X-Gm-Message-State: ABy/qLbq+4ZNvc5yQsGsedHCPVcgpik3M2jHzrscDPcR4tVP1iFAiNA2
        FMauNsse+SsHg9j2+xPxMaNepGIb3JbD/8U1rYmF0A==
X-Google-Smtp-Source: APBJJlHA1AnXyUpT+A6ET9ap9asaJxyJCGpGiJzOP8Rf4qIh6c8xW/dMAxjj1VVcKSQvkeob+HHWUA==
X-Received: by 2002:a17:907:7614:b0:997:deb1:ff6a with SMTP id jx20-20020a170907761400b00997deb1ff6amr8119614ejc.22.1690183664421;
        Mon, 24 Jul 2023 00:27:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lo19-20020a170906fa1300b00992665694f7sm6282141ejb.107.2023.07.24.00.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:27:43 -0700 (PDT)
Message-ID: <2b3fcc1b-156d-9f5f-3436-139ebcd846fe@linaro.org>
Date:   Mon, 24 Jul 2023 09:27:39 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SA2PR11MB486040E69B4DCE82631213328002A@SA2PR11MB4860.namprd11.prod.outlook.com>
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

On 24/07/2023 09:18, Ng, Adrian Ho Yin wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Monday, 24 July, 2023 3:05 PM
>> To: Ng, Adrian Ho Yin <adrian.ho.yin.ng@intel.com>;
>> gregkh@linuxfoundation.org; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; linux-
>> usb@vger.kernel.org; devicetree@vger.kernel.org;
>> Thinh.Nguyen@synopsys.com; p.zabel@pengutronix.de
>> Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
>>
>> On 24/07/2023 08:36, adrian.ho.yin.ng@intel.com wrote:
>>> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
>>>
>>> Existing binding intel,keembay-dwc3.yaml does not have the required
>>> properties for Intel SoCFPGA devices.
>>> Introduce new binding description for Intel SoCFPGA USB controller
>>> which will be used for current and future SoCFPGA devices.
>>>
>>> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
>>> ---
>>>  .../bindings/usb/intel,socfpga-dwc3.yaml      | 84 +++++++++++++++++++
>>>  1 file changed, 84 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>> b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>> new file mode 100644
>>> index 000000000000..e36b087c2651
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>> @@ -0,0 +1,84 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/usb/intel,socfpga-dwc3.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Intel SoCFPGA DWC3 USB controller
>>> +
>>> +maintainers:
>>> +  - Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - intel,agilex5-dwc3
>>> +      - const: intel,socfpga-dwc3
>>
>> So you did not even wait for my answer? What happened here with this
>> compatible? I asked you to change file name, not add intel,socfpga-dwc3.
>> Again - why using different style for Agilex? Which style is correct?
>>
> 
> The intention is to use a common binding for Intel SoCFPGA products that is using DWC3 controller.
> This is done with reference to qcom,dwc3.yaml. 

Nope, your driver change does not match it at all. Your explanation does
not make any sense.

Don't answer only half of my questions. So third time - the last: since
you add new style for Agilex, which style of Agilex compatibles is correct?


Best regards,
Krzysztof

