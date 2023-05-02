Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BD06F40D8
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 12:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjEBKPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 06:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbjEBKPI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 06:15:08 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6BC2121
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 03:15:06 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94f6c285d92so709017866b.3
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683022504; x=1685614504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdEb5toZY9Y8ZwBY/vHTbvlcrGW1zbVpI0slKABHbIM=;
        b=msddhv3tpsqpLVdSgd2ELlRz4lGjkuQAzd1Sjqtrv+pAXKTheEH1QmG+HWW19NZ1Vb
         8/BIpSlBOIRuzosI6EzhnDPwUqIHnrt3cMkxHllh4M4DiqLmvqUpWwuzfBCKDAAx0TnS
         27xThqXOkAiLMnm8KzhSC62f47Ohf3HJ5OSlUqKo8sfjj3y77Cll3ZLHknRMvS9CJVKw
         Lg1HZ/ZesNyZQ/eIgEwq8nOgwSihQUZjPBEb0tzng2jYhkYFDsd+cqF/JvTY6pgdj0QI
         GBBbFRybFIlk7Ok/qAGRDYRDINeWhjDefgfjJl7iaNv6FtRR3/rtkNnHcgnYes+se1jq
         xT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683022504; x=1685614504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdEb5toZY9Y8ZwBY/vHTbvlcrGW1zbVpI0slKABHbIM=;
        b=iqFLabgALGMlbFPMc7EGrBwKb9G66ztmIfRYSH+41PjnV0zHP6z6rwyrPEt5+NsmUT
         BooCMxgyiiMX9AOb6XoHdY9uCEdPEWab8z0G4yuQrSpGjr2ccDXgTpDhRnOx0dkiQjmD
         SxoRE6/57uHMUpd6e5WxexL2dPWBixIfpfUGQTBqSoL0/9rYq5aKfDUfljM2L7o0Pdpf
         PGTVWNr1V6i2myYdu01knWiCVmwG+5g7pmFYDoyDihmA4D0S28m6rt/xz2buShXo6lBs
         dTLi6eqJPbsE9ozgvLzdRSUJZprmiLZcTmrhMu8VlXOcWRMIIXUw30gNKMYkUgnZBrzw
         KePg==
X-Gm-Message-State: AC+VfDz0Tls3xMnzQTkj3me5hMm6Vm7ygHw0XWToOxwMDQmnhY5suqcC
        FYitinQiuJAabaHcIXV/LIeKnw==
X-Google-Smtp-Source: ACHHUZ6RzJ3/3wGhKnNHLFP5OgXPe1jRH4bBpgbUiNFspgzvYz4mq1XsoaEKnsuOb6qz5L8QHSwsKA==
X-Received: by 2002:a17:906:dc95:b0:94f:ca5:1a66 with SMTP id cs21-20020a170906dc9500b0094f0ca51a66mr17273223ejc.59.1683022504503;
        Tue, 02 May 2023 03:15:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id va2-20020a17090711c200b0093a0e5977e2sm16123681ejb.225.2023.05.02.03.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:15:03 -0700 (PDT)
Message-ID: <f51b4dc9-e1da-7c9c-1e39-c8510569db9d@linaro.org>
Date:   Tue, 2 May 2023 12:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/2] dt-bindings: usb: snps,dwc3: Add the compatible
 name 'snps,dwc3-rtk-soc'
Content-Language: en-US
To:     =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230502050452.27276-1-stanley_chang@realtek.com>
 <20230502050452.27276-2-stanley_chang@realtek.com>
 <2653e0d1-6570-7469-51da-b539b5c14299@linaro.org>
 <bc5cd630d96f44bcaad7f95f2f45aac1@realtek.com>
 <49d2b103-de1e-637a-1bf0-aaba1c6afaf4@linaro.org>
 <a04e70f97bcb48048edb2f6db7bb6c25@realtek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a04e70f97bcb48048edb2f6db7bb6c25@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/05/2023 10:56, Stanley Chang[昌育德] wrote:
> Hi Krzysztof,
> 
>>>> On 02/05/2023 07:04, Stanley Chang wrote:
>>>>> Add a new compatible name 'snps,dwc3-rtk-soc' of DT for realtek dwc3
>>>>> core to adjust the global register start address
>>>>>
>>>>> The RTK DHC SoCs were designed, the global register address offset
>>>>> at
>>>>
>>>> What are: "RTK" and "DHC"? These are manufactured by Synopsys as you
>>>> suggest in the patch?
>>>
>>> RTK is Realtek.
>>> DHC is the department name in Realtek and the abbreviation of the Digital
>> Home Center.
>>> The USB controller of RTK DHC SoCs used the DWC3 IP of Synopsys.
>>
>> Then entire compatible is not correct. Vendor is Realtek not Synopsys.
>> DHC is not even device name. Use real device names.
> 
> So, can we use the compatible name as 'realtek,dwc3' ?

dwc3 is not a real device name for Realtek.

Best regards,
Krzysztof

