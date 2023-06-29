Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD34E742E26
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jun 2023 22:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbjF2UFp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 16:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbjF2UFC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 16:05:02 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DF2212C
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 13:05:01 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba03becc6so741565e87.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688069099; x=1690661099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OF3SWHQBitllVPlaYnVLF/iiTBXMytWTZQU29N7FmDM=;
        b=gxSfIjzJgF4o6hdReIGjdG8oDb8YMY+FvG9DOf48gJS/uXUgVgdRBxWOyIbIwZURQ6
         qqlLtGy9beddY4617elmaPql81XYUQ8zxW7WylayUjuELQrLfAH6Ort+7wOGubNRvfjs
         vPUnouklFBiwE0tQK5VjdKd6ndIr8to+h+Q9RDGQzK+DZDXTIUQ1jVsZKarH3Pku08RX
         2QvOPHNXoyjvlv7ryV1D7SN/jNZctB6mPECftJZV3hBBGOiv7QrR0qAJLqP8YAr1Kln/
         XVdozh/5IpjZyWV41qXtrBGwBcWg4aLtVJRCcZRZeIvobORm50LcEvt3gPIPCgI5UMbS
         PLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688069099; x=1690661099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OF3SWHQBitllVPlaYnVLF/iiTBXMytWTZQU29N7FmDM=;
        b=SB8mTWwOEE20ZooJZ1+bWIuAPl/NHpswYFiCtsS8NWn+csqetCFdrY/H+4onwUs/kX
         OOlEkXfQDBXSpUXDRVK6OFq9HHRozi44Gyu7wpjY0m5livjUecp2y9cEFAkHkeX1LDVt
         yVEtLeVarlqilBqOPWk/2LOyT1yv4d8ue/lysMd/ON0GW4Y2zAwV+nsaKh+JzL/1c3TC
         CRHHY6nlbys1l4pY9A+nyNeEVicVBWQ/ZtIJQf7lf8TbTt4lwMQuhrPaEwG1znUvr9Sp
         fwQIRrD9WH3zi4aoutD9JwmtQf96GL8j50dNvPQ+SLvaTKYN5tggKsMdDUrq1sjcBXDD
         XKEQ==
X-Gm-Message-State: ABy/qLbo1aBwZUtNRGEqG59XBDCE29nKMHUKiccm40Jzg3HjCNBBZOl2
        /ddlq1jlUj0RopkisvKvtMWnGFF+LiTGJsbh1JM=
X-Google-Smtp-Source: APBJJlHCImMszh08qroN+ScqTvW+Lm4kzbNBHCoakjGE3swSx6rZ5XyHj9KuN68oeeMW8B9bxhKuoQ==
X-Received: by 2002:a05:6512:693:b0:4f8:6d9d:abe0 with SMTP id t19-20020a056512069300b004f86d9dabe0mr365281lfe.33.1688069099306;
        Thu, 29 Jun 2023 13:04:59 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
        by smtp.gmail.com with ESMTPSA id k28-20020ac2457c000000b004fb9fbdd8fcsm207623lfm.252.2023.06.29.13.04.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 13:04:58 -0700 (PDT)
Message-ID: <ef515514-43e8-e4c9-e013-09aa27bc2110@linaro.org>
Date:   Thu, 29 Jun 2023 22:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/11] dt-bindings: usb: ci-hdrc-usb2: Fix handling
 pinctrl properties
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Benjamin Li <benl@squareup.com>,
        James Willcox <jwillcox@squareup.com>,
        Joseph Gates <jgates@squareup.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Zac Crosby <zac@squareup.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        alsa-devel@alsa-project.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Andy Gross <andy.gross@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-8-6b4b6cd081e5@linaro.org>
 <20230629152335.GA3055525-robh@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230629152335.GA3055525-robh@kernel.org>
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

On 29.06.2023 17:23, Rob Herring wrote:
> On Tue, Jun 27, 2023 at 06:24:24PM +0200, Konrad Dybcio wrote:
>> Untangle the bit messy oneOf trees and add the missing pinctrl-2 mention
>> to handle the different pinctrl combinations.
>>
>> Fixes: 4c8375d35f72 ("dt-bindings: usb: ci-hdrc-usb2: convert to DT schema format")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 27 ++++++----------------
>>  1 file changed, 7 insertions(+), 20 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> index 782402800d4a..24431a7adf3e 100644
>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
>> @@ -199,17 +199,6 @@ properties:
>>        In case of HSIC-mode, "idle" and "active" pin modes are mandatory.
>>        In this case, the "idle" state needs to pull down the data and
>>        strobe pin and the "active" state needs to pull up the strobe pin.
>> -    oneOf:
>> -      - items:
>> -          - const: idle
>> -          - const: active
> 
> These are no longer valid values? The description still mentions them.
I believe allOf: now covers them all?

> 
>> -      - items:
>> -          - const: default
>> -          - enum:
>> -              - host
>> -              - device
>> -      - items:
>> -          - const: default
>>  
>>    pinctrl-0:
>>      maxItems: 1
>> @@ -357,17 +346,15 @@ allOf:
>>              - const: active
>>      else:
>>        properties:
>> +        pinctrl-2:
> 
> This should be implicitly allowed. Is it not?
No, it errored out for me.

> 
> I'm reallly at a loss as to what problem this patch solves.
Specifying all 3 pin states is impossible with the current state of
this binding, even though it's a supported configuration (check
qcom/apq8039-t2.dtb). I should have been more clear in the commit
message.

Konrad

> 
>> +          maxItems: 1
>> +
>>          pinctrl-names:
>>            minItems: 1
>> -          maxItems: 2
>> -          oneOf:
>> -            - items:
>> -                - const: default
>> -                - enum:
>> -                    - host
>> -                    - device
>> -            - items:
>> -                - const: default
>> +          items:
>> +            - const: default
>> +            - const: host
>> +            - const: device
>>    - if:
>>        properties:
>>          compatible:
>>
>> -- 
>> 2.41.0
>>
