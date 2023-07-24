Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8CF75EC22
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 09:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjGXHBv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 03:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjGXHBu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 03:01:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F4CD2
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:01:48 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so8416708a12.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690182107; x=1690786907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WpB2hVnre3YcprbNh+L810H+mlNzKUfOIkDFOdTZja8=;
        b=Vw9kXach7G5H+dmLx9Sr4lcIODG1Qi4t8Qoai7nsRk0ZdeiQ2EKDPwxhF/isQynRgg
         srsG7wUucQvEPUUZOrPm2cqxQG2fI/dbmjGDWnrA9Rbui+g3OfwRA8ZBdwu9NqxaRMJF
         UbLCPOdIBcA+3f+8TXKten8oxkr1Hz2OOLg9bYFV6guQ4zfBAgWEexCkR+ezxVuOKN+Q
         /w6BMDy0AcGS20j30/WJmV//k3dil4UkPFrzDQseFgu5OBI9WIjMPWiFGUqH7266a009
         tgUnfF+LmoSBZS6/OnPgSLWCvuTOHnggLSQXLbNWEkthcKg8MSXx/psVsGr3M5w/rXPo
         nhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690182107; x=1690786907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpB2hVnre3YcprbNh+L810H+mlNzKUfOIkDFOdTZja8=;
        b=eIVNcH3rr7KuMay2unXcQ+o3hzr5XR84PnoKP4UR5Er754WsSJvYkCcOuh7cAW5XH6
         JoYI4h06lDDzEcYYJHcGaN/Uk0Ag/VVhThNVOE53/ZxkSCvNDPVF/B70MLHeZnF3YDB7
         OLHue7186pg3glKYK6dXilHqRXWhT2tg/hZJq4xPKxJarjdsjZcoDTQFTI2P8pW/k6Qq
         B13ZCqznX5Lg5/HCdokthXa5sec/hoa6lh/MeTmydJotuqBzojIpu5PKvkekDdc677O5
         YRSqiCa/ng5kKNTPmQlWR4ee2y/ubl0JX0/8DNZ/FRGTouSE1yr9iURjWbZ0uoRPyO8T
         w8ug==
X-Gm-Message-State: ABy/qLbjdYZdv1weSGwrkB3LmG2p2H+VYIoQclhOw/Y8L4CR4UoyxH3l
        GhJonYZfQ0pcPFyXmgOiNlR9rGRdBoWZyDynUL5n1g==
X-Google-Smtp-Source: APBJJlEYSvxi0OzuBF99eSIm4h8VJoNZ1KxGDetFZ3tAMRzsa9fguAGQ7M/L98UcN7VmNkpE4Cl1nQ==
X-Received: by 2002:a05:6402:1e91:b0:522:28b9:e84c with SMTP id f17-20020a0564021e9100b0052228b9e84cmr3233033edf.21.1690182107080;
        Mon, 24 Jul 2023 00:01:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t24-20020aa7d718000000b0051de20c59d7sm5701233edq.15.2023.07.24.00.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:01:46 -0700 (PDT)
Message-ID: <b11b4f8a-5379-9dc6-39b2-88f14cccda97@linaro.org>
Date:   Mon, 24 Jul 2023 09:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Intel SoCFPGA USB controller
 bindings
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
References: <cover.1689913114.git.adrian.ho.yin.ng@intel.com>
 <68037e45970a9ef930c609c002d36863d96b39cc.1689913114.git.adrian.ho.yin.ng@intel.com>
 <216a3abe-1350-cbb1-4cfd-0dc4d7f70a88@linaro.org>
 <SA2PR11MB4860EE675DF40F1B6925AF0C8002A@SA2PR11MB4860.namprd11.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SA2PR11MB4860EE675DF40F1B6925AF0C8002A@SA2PR11MB4860.namprd11.prod.outlook.com>
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

On 24/07/2023 08:35, Ng, Adrian Ho Yin wrote:
>>> diff --git
>>> a/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>> b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>> new file mode 100644
>>> index 000000000000..dedef70df887
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/usb/intel,socfpga-dwc3.yaml
>>> @@ -0,0 +1,78 @@
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
>>> +    const: intel,agilex5-dwc3
>>
>> Why using compatible style different than other Agilex blocks? Which 
>> one is recommended/official/correct?
> 
> This style is used so that future SoCFPGA products can reuse the same binding. 

Wait, why? How future products are relevant to style of compatible for
existing device? Again - why using different style? Which one is correct?


Best regards,
Krzysztof

