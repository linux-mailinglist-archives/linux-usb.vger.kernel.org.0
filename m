Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D27C7590C2
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jul 2023 10:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjGSI7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jul 2023 04:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGSI7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jul 2023 04:59:07 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1722134
        for <linux-usb@vger.kernel.org>; Wed, 19 Jul 2023 01:59:05 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so11255249e87.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Jul 2023 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689757144; x=1692349144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjwZwXCwXmQM2M0w+HMY5U9URq0w0O8JkoEEEKtmHuY=;
        b=WBCaZgcOMjA+k/QpkjJGCnd/b5G/48llJV9HxfVW2Dtqpe8UAevu5A+dKDqe/PoJMu
         tS08s2b/y1eUfvbbtsJhiLe9z0hUaTiPJxiJDaJTbMz9KZ83kh7pXaSLdPkB5H8Ozlhv
         MvnARJkhm/LOEAyr90a84nmSdtClE+bCi+1SDdIe1Eyq11qLmu9QkUpELJBpV23EqHZJ
         Ks4XrMTY49SaSGJr9/Y1TYv0siRRGVrG0rp6RcceZUq6OWpdV7TinyvCiEWNIFFwno8C
         ThPzLbTfPADRjOtV9VhD6vaAtU3BgdKp4wZ5GPxz1fID+rikEcpkxkh7/xjNwnVpztD8
         yztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689757144; x=1692349144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjwZwXCwXmQM2M0w+HMY5U9URq0w0O8JkoEEEKtmHuY=;
        b=b9++g2UW5yyxRrNWY9f6KRsMhEWjMZK+wMpjsxEhuiUN0f8ZE+wt8aSgT+Dzj03no3
         IBQMycO2LcqKOIcOFK9bYvvZITxASEqViPgaG4bfwZEgYbmHyJBUUCdIK2B2InJFn4c4
         ++LXR0l0J06qknIkWw+e4kpxEI/I5eT2y9pJLli1ki4X7PeizudZr+t/QLIqTVTpUnJW
         Qjc9l0q/P6Om7wQsITA9oXk+KtGNVEOoxTeEkketFIGW6UNtkcgf/cwBN9TkkoP1B3CX
         H8EUj3jlhyWCoAsDmpH7WP7/4P+NYF7go2Kwl5BE/0Xjuq8lINOrOxRhetQqLu2FedBe
         z1gw==
X-Gm-Message-State: ABy/qLZLNC5CUMDnTJr98susVo2r6P9m9NRFdf/Aa/E7CHRi5y+TxSAE
        iRAwPACEvsnnOYX3Ns3vwQzYUg==
X-Google-Smtp-Source: APBJJlG145+baYy2xRG5EFByw1fAnzYogqFOqfQMF9/Kcfbqlu51ky4jNieZhAvomXVs9haaW6JG7g==
X-Received: by 2002:a05:6512:1089:b0:4fb:89e3:5ac6 with SMTP id j9-20020a056512108900b004fb89e35ac6mr13736198lfg.62.1689757144005;
        Wed, 19 Jul 2023 01:59:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h5-20020a50ed85000000b00521a7864e13sm2306858edr.90.2023.07.19.01.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 01:59:03 -0700 (PDT)
Message-ID: <86cbedcd-692b-ecb8-2075-d50835739bcf@linaro.org>
Date:   Wed, 19 Jul 2023 10:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] dt-bindings: usb: dwc2: add compatible
 "intel,socfpga-stratix10-hsotg"
Content-Language: en-US
To:     "Li, Meng" <Meng.Li@windriver.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        "hminas@synopsys.com" <hminas@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230719025509.3007986-1-Meng.Li@windriver.com>
 <20230719025509.3007986-4-Meng.Li@windriver.com>
 <488835c0-e08e-c0cc-abac-192f658b093f@linaro.org>
 <PH0PR11MB51913FB3A55B1420B7798C01F139A@PH0PR11MB5191.namprd11.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PH0PR11MB51913FB3A55B1420B7798C01F139A@PH0PR11MB5191.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/07/2023 10:45, Li, Meng wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, July 19, 2023 2:39 PM
>> To: Li, Meng <Meng.Li@windriver.com>; gregkh@linuxfoundation.org;
>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org;
>> dinguyen@kernel.org; hminas@synopsys.com; linux-usb@vger.kernel.org;
>> devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH 3/3] dt-bindings: usb: dwc2: add compatible "intel,socfpga-
>> stratix10-hsotg"
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and
>> know the content is safe.
>>
>> On 19/07/2023 04:55, Meng Li wrote:
>>> Add the compatible "intel,socfpga-stratix10-hsotg" to the DWC2
>>> implementation, because the Stratix DWC2 implementation does not
>>> support clock gating. This compatible is used with generic snps,dwc2.
>>>
>>> Signed-off-by: Meng Li <Meng.Li@windriver.com>
>>
>> Missing changelog, missing versioning. This is v3 or v4.
>>
>>> ---
>>>  Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml
>>> b/Documentation/devicetree/bindings/usb/dwc2.yaml
>>> index dc4988c0009c..f90094320914 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
>>> @@ -51,6 +51,7 @@ properties:
>>>                - amlogic,meson-g12a-usb
>>>                - amlogic,meson-a1-usb
>>>                - intel,socfpga-agilex-hsotg
>>> +              - intel,socfpga-stratix10-hsotg
>>
>> So you just sent the same patch as before. I pointed you to the proper solution
>> with compatibility.
>>
> 
> No. not the same.
> I don't understand why SoC specific compatible "intel,socfpga-agilex-hsotg" is able to be added, but the SoC specific compatible "intel,socfpga-stratix10-hsotg" is not allowed.
> 
> You said "Where is SoC specific compatible?"
> Now, I add the SoC specific compatible "intel,socfpga-stratix10-hsotg", but why it is still not reasonable.

The compatible should be added, but I said they are compatible, so
express it. I also gave you example of file which expresses it.

Why that compatible is not allowed alone? Because what we said here
many, many times and because the doc I gave you which explains this.

Best regards,
Krzysztof

