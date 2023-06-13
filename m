Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E24272DB2A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 09:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240742AbjFMHkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 03:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240635AbjFMHkD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 03:40:03 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8CBAA
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 00:40:01 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1fcda0f92so63929221fa.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 00:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686642000; x=1689234000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tn//NXiFDGncurWh8+6Mz0deyzFEfBIN7YFnpquuSyY=;
        b=s0IHlb4kvOLaI6gZHF4TQA6tQVIXuGh1dQO8fQQTi5xh6tPapq5wiZz3pCSjDpeFgg
         FJQYW/SblPpOeiXCfbc4DKsT2OXuchDFY37p86Rj5ouX4bAeKcZSC8Exzh1YCAPdkY8O
         UYo1XIZTxasEXApNJHQU7vqFTkF+PpRWjFYVvRVeLiNHeMFzbMeAPUS5adpdt/UXgKso
         3RsK5XPfQIQj8TJYQ4pW4B5jT99y/PPKxJRJcPWb4Ntrz6nQmiL56eNMYmPaNmwQQ/A8
         7v+gg07GxlxqfOYpyVPG+R94+ytBhWeshrQkuzd4SU9cgPmdc6thmZ00EKKLWUj8vp3H
         13UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686642000; x=1689234000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tn//NXiFDGncurWh8+6Mz0deyzFEfBIN7YFnpquuSyY=;
        b=ERk35d0zqDn24DTgDBekLxt8oaHOsxEVIoYSOp6g8b/rXdIzJWzzx/HsbZ1FKGKGOk
         ZSiRQr98PdIEWbAzjLcyCkwjMucNHONZmrqw1lV2rGMINuJn9qxdzV+Y1wox85Rg2VsU
         ZcdqRhRprf5niuW0r1SDyo8LkmyQy7299o+WGRJJClwmPy9XJZeuqwonzFx3JQy5AIrl
         UKlhhqktO4hI5Gvyt+XnRx1yQX1bNnrncJsa4jeOEm8atXAft7a8/210hr6vqMDj07pM
         M5hqy5abgtT4demzQFxIuG14ubE9utiVzrukuTTHfiCh07w6RbGN+FxUhWpNX+cELmre
         REhw==
X-Gm-Message-State: AC+VfDw4QhLTsal/G+ASjhn0npz8+SmcvQCG6Ehsdeod8LqSOTnfLOkL
        JluDfHCcIpmzaqTq/fePZ5oFeA==
X-Google-Smtp-Source: ACHHUZ7O7yTZAPl8npfJE1zd2Y68v0ayJwEv1IPqMzhEfONEEJwlEay8TNcKyBA6pirgOEYyIJavKw==
X-Received: by 2002:a2e:800b:0:b0:2b1:c0b9:61af with SMTP id j11-20020a2e800b000000b002b1c0b961afmr3847302ljg.52.1686642000074;
        Tue, 13 Jun 2023 00:40:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t8-20020a056402020800b005149134ccfbsm5983886edv.52.2023.06.13.00.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:39:59 -0700 (PDT)
Message-ID: <b7bfc733-7d0d-d04b-5bba-ba1b5a056235@linaro.org>
Date:   Tue, 13 Jun 2023 09:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert
 to DT schema format
To:     Xu Yang <xu.yang_2@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <b8f35a9a-7553-92fa-6fdd-2522dc9bd36d@linaro.org>
 <DB7PR04MB450553FBD13E3101F8C065008C55A@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DB7PR04MB450553FBD13E3101F8C065008C55A@DB7PR04MB4505.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/06/2023 09:30, Xu Yang wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Saturday, June 10, 2023 12:44 AM
>> To: Xu Yang <xu.yang_2@nxp.com>; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org
>> Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-
>> imx@nxp.com>; linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> usb@vger.kernel.org; Jun Li <jun.li@nxp.com>
>> Subject: [EXT] Re: [PATCH v2 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
>>
>> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the
>> message using the 'Report this email' button
>>
>>
>> On 08/06/2023 05:36, Xu Yang wrote:
>>> Convert the binding to DT schema format. Besides, this also add other
>>> optional properties not contained in txt file.
>>
>> Why ones do you add?
> 
> I add clock, power-domains and phy-3p0-supply to this doc. Because
> the txt file should contain these properties but it not. I think the
> txt doesn't get update in time.

Can you mention them in commit msg?

> 

>>> +  reg:
>>> +    minItems: 1
>>> +    maxItems: 2
>>
>> You should list the items.
>>
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    maxItems: 2
>>
>> You should list the items.
> 
> After my check, the maxItems value of reg and interrupts should be 1.
> Will change it.

OK


Best regards,
Krzysztof

