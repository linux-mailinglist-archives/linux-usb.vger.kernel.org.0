Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1E16C69B1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 14:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjCWNjP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 09:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjCWNjN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 09:39:13 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8482CD52F
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 06:39:11 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id y14so20527898wrq.4
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679578750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RM9q1gOg+w9P+KOTUpQhHbIwGykNjShMOZzaKSyx1iQ=;
        b=NjzgvKXkqc+RIM278bPTQrn1t9cI+t/3VL9jRA2piujrcHHZ+PmJYVyLOfbeDm++yz
         aravUM37bMWMsTk9Eqd1dtSbnmxOO3Rl0Aee0YED+OYRFKvZzqu3mp+ghJtcyrBQRIYQ
         G+a9645T+oNymG0ZQQL2XHM9Q4CGE25xaY3McGajW4mOtZxVtnf297M4fCR4gmIkbLqT
         0xIy4WYFxf1a1cJnFbQqDPUCQ1ygCt1drUyTo9SjdM+8A3eYUUf1wWQkLM+Hkfx9KB/E
         e+hBQ1D9fca3Uu+TnF/CAg+ICgiZ9bggFsu3gkKdmCzaSlw6MR0z2r+J7JfRVqvarPsQ
         Akjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679578750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RM9q1gOg+w9P+KOTUpQhHbIwGykNjShMOZzaKSyx1iQ=;
        b=iTAExk6LP3d+cbDilw6pwTBqNuYkdKy35V4I2n7gzBz+JRgz1Id86SSnJWZYX2E4EO
         uthUFF7YL/WCO88A1HUqbf1dPLmM1sduox7NTs3rYD00aeQUvJt0WDFZHyWxKE5Nck8a
         uqVn6fcCBYDgHIWE4xx+5IQ+wV1nULITSK8FXUp0X4BhDAEUkq3Mho1aCYytOmRNUBhD
         CydGDvvdn9e7drAKzoYLmIcz1HYjkkeEFW5rQBu0h6Ejkln9BHY+K+dRi/zMaYP1vHMd
         PNK3/5mt0P7KGb4U9AojgLG3RfPcXutVKcCIKXwkfDAruJn35i1l0kGMTqtHpGljG/Kt
         us2w==
X-Gm-Message-State: AAQBX9diKTHh2Jnat+SF8B7gd+UcPbHGFWyowMz9lhl5BIIQuY1wUFmC
        anqvaGJGPRqUDzzWJ8JcwX6gxA==
X-Google-Smtp-Source: AKy350ZH1FY7ePGhbwHzMl9bczzeia8SxVlSH9MAGINKEBJLiMhxMDk0jveY4X+zupWp9je4Jini9g==
X-Received: by 2002:adf:f38d:0:b0:2cf:e023:5915 with SMTP id m13-20020adff38d000000b002cfe0235915mr2774593wro.61.1679578749981;
        Thu, 23 Mar 2023 06:39:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020adfce05000000b002d64fcb362dsm10922099wrn.111.2023.03.23.06.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 06:39:09 -0700 (PDT)
Message-ID: <c9919fa7-3d5e-d560-0ece-c0d2afc97502@linaro.org>
Date:   Thu, 23 Mar 2023 13:39:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 04/18] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add port as an optional
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-5-bryan.odonoghue@linaro.org>
 <3f5efb36-f9be-0816-b9cc-dc87966552cc@linaro.org>
 <20230321204935.GA1506038-robh@kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230321204935.GA1506038-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/03/2023 20:49, Rob Herring wrote:
> On Sun, Mar 19, 2023 at 12:45:13PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2023 13:18, Bryan O'Donoghue wrote:
>>> port is required to instantiate a remote-endpoint which can receive
>>> orientation-switch messages from a Type-C mux.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>>> index 52886cdb0e506..1c887e34b1223 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
>>> @@ -65,6 +65,12 @@ properties:
>>>       description: Flag the port as possible handler of orientation switching
>>>       type: boolean
>>>   
>>> +  port:
>>> +    $ref: /schemas/graph.yaml#/properties/port
>>> +    description:
>>> +      A port node to link the PHY to a TypeC controller for the purpose of
>>> +      handling altmode muxing and orientation switching.
>>
>> Please extend the example as well.
>>
>> Don't you have there two ports? USB and DP?
> 
> Or 3: USB, DP, and connector.
> 
> Please make sure this all aligns with what Bjorn and I discussed
> recently. It was for glink specifically.
> 
> Rob

This is a PHY though, the DP, USB endpoints will go into the connector 
or into the typec node itself.

---
bod
