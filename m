Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72896F41FE
	for <lists+linux-usb@lfdr.de>; Tue,  2 May 2023 12:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233742AbjEBKvb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 May 2023 06:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233455AbjEBKv3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 May 2023 06:51:29 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43713C19
        for <linux-usb@vger.kernel.org>; Tue,  2 May 2023 03:51:26 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94a342f7c4cso717841466b.0
        for <linux-usb@vger.kernel.org>; Tue, 02 May 2023 03:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683024685; x=1685616685;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgcuRRydbdET9VazZUrn8rnTi0mHnWbUpTiGGHtkqs4=;
        b=F1GeeqSgxIMG1JnyBwBfeC5kLvTD2+UWMlN0dmc9ccWv9Z+2ajFaNmkz41+F0HZ9HB
         pTom68e5Ofp8r/rtmngq7mOZCuiuf2YPhC1Ap198l+CkolRngr1dI2V6Ko4fqPXVelxl
         AJK849ZAqSxCvsDy99Zc35bRpVl6llS3BxYwW3Cti7GCcL7d5oHwTxTopSubDsw6MJ4s
         xzzde96nCfz8Nd0+yym819yKB60JKuBysRNf8wVGWx48oNpmHsCbEYVcgPL9fsPg+96l
         TScUPJ/UBD4FimaLeCnVjTxU5k6d4NZB4oR3G8pfWvzqqDZIsF3yessQzSMcuPZddQSC
         8tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683024685; x=1685616685;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KgcuRRydbdET9VazZUrn8rnTi0mHnWbUpTiGGHtkqs4=;
        b=TGYRHNEIsqMhG7nfK9xffnHQfdF6u0YMgDRHXZrLdTniZjdyq9RAZLf3wVwy/FUgAS
         uG2/U9q9O2DRzi5txZtin4XnC1IaMTzK829Jyb8QgmDVA1YhSMMASkZ8+03DUc5rNt4+
         bZRhRG1WIYDT9O6aLl6iQemuo/1oyvuPhRk60KFaZXsNXmpyAk8zj9whcqFk6BKXLtAS
         OUxNvzyDAcDd/iUc1NXtnenDu5qHknLVnB6DkLHtOMqvJGKENjuWvCX1NrV5tm77Uq/U
         pvGHBMHWMLndQF2/uucCjf4TQfs5sUlLlTxw7Rhos8tF7Q19zWKjVCS1769cb0puaA0b
         OuSQ==
X-Gm-Message-State: AC+VfDzDayJSMxZ769uIDtMo0uNkSlzi3aFVbwNb+6PyA71UCUMvp+1K
        957RPrqfKkd4Qs+rmnMezzT2Sw==
X-Google-Smtp-Source: ACHHUZ74oo4k7L6mZ8lMIb+zTaeciGvqQPCS6NYSihTJbZogYZHdLHnOPnhW1rB9aiqxnVvGYMhcDQ==
X-Received: by 2002:a17:907:94ca:b0:92f:924b:e8f4 with SMTP id dn10-20020a17090794ca00b0092f924be8f4mr15742498ejc.4.1683024684709;
        Tue, 02 May 2023 03:51:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id l20-20020a056402125400b0050bc863d32asm1633931edw.27.2023.05.02.03.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 03:51:23 -0700 (PDT)
Message-ID: <63f646d7-a952-ca8c-58b3-b7db05f0b3a7@linaro.org>
Date:   Tue, 2 May 2023 12:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 04/13] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add input and output ports
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-5-bryan.odonoghue@linaro.org>
 <c3107648-3041-c6e3-1380-0a2fc354889c@linaro.org>
In-Reply-To: <c3107648-3041-c6e3-1380-0a2fc354889c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/05/2023 12:45, Krzysztof Kozlowski wrote:
> On 01/05/2023 14:11, Bryan O'Donoghue wrote:
>> Add a ports declaration which is optional containing two port@
>> declarations.
>>
>> port@0 to receive an orientation-switch message from the Type-C port or
>> redriver
>>
>> port@1 to subsequently transmit the orientation-switch on once the PHY has
>> finished doing its orientation turn-around.
>>
>> If ports is declared the input port port@0 is mandatory but the output
>> port@1 is optional.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>  .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 38 +++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>> index d307343388888..c370b9cd58c2e 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>> @@ -65,6 +65,25 @@ properties:
>>      description: Flag the port as possible handler of orientation switching
>>      type: boolean
>>  
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
> 
> on this level: additionalProperties: false
> (because otherwise it will allow port@2 etc)

Although none (or almost none) of other bindings do it, so I guess it is
fine. Fine till I figure out how it should be :)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

