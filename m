Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEBF4D7C23
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 08:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236757AbiCNHlQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 03:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233661AbiCNHlK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 03:41:10 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C461A820
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 00:40:01 -0700 (PDT)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D502E3F1A8
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 07:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647243599;
        bh=vL1DMH5mB/xA+saWf/LfgxjeoWUu89778nGRlXG7H8w=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=vkY7UYn1VpZTlc13OexejzxRcJidxHuxZcYSCIZ4rBkwIbfCp8W9Fac8zeH0+qf09
         6VJoXdx2kmR8pW4jbpRvJv7iKl3vRn4bd7WfeI3/me2fYQLYbgKRowSaVQ7eC1QwMu
         lxLbzxvBKv2N2/awX6biWzqNC16Mc5pUKNMyTiFKt0c+IoerTtbP+L6AO0w5qYPokD
         vw10JRygSHFbvLT/u9WmbBFzNhpj04hUslDEiysAZirg2UZzwzHWkHTPxzv0xqdWzf
         EeKitifd7BLZ5i78cJsJKLTPS+JM6/4XkKLwXmiBt/16ebLOWtMF8XXeA2sUqX4ofc
         Czpbrj+937VkQ==
Received: by mail-ej1-f72.google.com with SMTP id le4-20020a170907170400b006dab546bc40so7506293ejc.15
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 00:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vL1DMH5mB/xA+saWf/LfgxjeoWUu89778nGRlXG7H8w=;
        b=L840KB+iv+FtAfrRHODqWaUnVggTcQUIGR7BjZZq+URxmk+LPFUPBorPicRLJae0Uy
         r7ZR40jGRuI30gwZxH1dbxtdzZ8BqL4aBQxMXcfnHMuM7Nrt8Apich7PJ8S/6gxW7VnB
         lKRVmMP7TSVQ88CIy21nbZtcgFJ2oSDwYYgysXa73MliPtsRFSV3rP5OUjbYJmtVRnmc
         s68kL0cxb1LZmzMTiRg53ES+VeCcLCoOWJ5s0f2KvcqtSMkCW3IenPaYS5eejOgrcUjI
         pKjVwbpzPvfZi46enjzzV62TTz4YT+2IjVWwKKnVa1RPQuAWMWXIE5A2UnsOsVxxS1M1
         EpIg==
X-Gm-Message-State: AOAM531j1o/zNuW3QztwT1U3iUQ7nO3lQk0LgpgESk24VNjWXUi2nuhO
        cinW2RsJHCNI9DzZdnkpFfrQhxSrMbXKU7eyOrCHaSCdMqp/Lx6l/P4/Dj2cnnjmJPp0ZmrAGoT
        Q+SLldkvrBFHBWj9SJWhyKxa+kKo6A9gj8uPVgw==
X-Received: by 2002:a17:907:96a0:b0:6db:a7d5:166a with SMTP id hd32-20020a17090796a000b006dba7d5166amr11292881ejc.725.1647243599453;
        Mon, 14 Mar 2022 00:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPxGLGvg6NYB7X0d8qa+t78Eu3+toeF4mQVyTiq0YuLnZWWKsaPeVCabDXp2g1VLgogEky+A==
X-Received: by 2002:a17:907:96a0:b0:6db:a7d5:166a with SMTP id hd32-20020a17090796a000b006dba7d5166amr11292864ejc.725.1647243599250;
        Mon, 14 Mar 2022 00:39:59 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id a102-20020a509eef000000b0041614c8f79asm7552126edf.88.2022.03.14.00.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 00:39:58 -0700 (PDT)
Message-ID: <f1621a67-a0ff-f111-c4da-9401924e7f4a@canonical.com>
Date:   Mon, 14 Mar 2022 08:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
Content-Language: en-US
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_kriskura@quicinc.com
References: <1646288011-32242-1-git-send-email-quic_c_sanm@quicinc.com>
 <1646288011-32242-2-git-send-email-quic_c_sanm@quicinc.com>
 <b793195b-1d3d-63b2-19d2-72ae2aec8c0f@canonical.com>
 <20220314032952.GA27561@hu-pkondeti-hyd.qualcomm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220314032952.GA27561@hu-pkondeti-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/03/2022 04:29, Pavan Kondeti wrote:
> Hi Krzysztof,
> 
> On Thu, Mar 03, 2022 at 04:59:22PM +0100, Krzysztof Kozlowski wrote:
>> On 03/03/2022 07:13, Sandeep Maheswaram wrote:
>>> Add device tree bindings for SNPS phy tuning parameters.
>>>
>>> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
>>> ---
>>>  .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 125 +++++++++++++++++++++
>>>  1 file changed, 125 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>> index 0dfe691..227c097 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>> @@ -50,6 +50,131 @@ properties:
>>>    vdda33-supply:
>>>      description: phandle to the regulator 3.3V supply node.
>>>  
>>> +  qcom,hs-disconnect:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      This adjusts the voltage level for the threshold used to
>>> +      detect a disconnect event at the host. Possible values are.
>>
>> ':', instead of full stop.
>>
>>> +      7 -> +21.56%
>>> +      6 -> +17.43%
>>> +      5 -> +13.32%
>>> +      4 -> +9.73%
>>> +      3 -> +6.3
>>> +      2 -> +3.17%
>>> +      1 -> 0, Design default%
>>
>> Use "default:" instead. Here and in other places.
>>
>>> +      0 -> -2.72%
>>
>> In current form this should be an enum... but actually current form is
>> wrong. You should not store register values in DT. What if next version
>> of hardware has a different meaning of these values?
>>
>> Instead, you should store here meaningful values, not register values.
>>
> 
> Thanks for the feedback.
> 
> The values in % really makes the tuning easy. People look at the eye diagram
> and decided whether to increase/decrease the margin. The absolute values
> may not be that useful. All we need is an "adjustment" here. The databook
> it self does not give any absolute values.
> 
> I agree to the "enum" suggestion which we have been following for the
> qusb2 driver already. 
> 
> The values have not changed in the last 5 years for this hardware block, so
> defining enums for the % values would be really helpful. 

I did not say you cannot store here percentages. Quite opposite - store
here the percentages. Just do not store register value. No. Please read
my comment again - meaningful values are needed.


Best regards,
Krzysztof
