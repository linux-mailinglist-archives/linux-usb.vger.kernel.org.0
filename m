Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECDD524A4C
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 12:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352632AbiELKa2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 06:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352604AbiELKaZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 06:30:25 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7913C2230BC
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 03:30:23 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p4so5755112edx.0
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jl+ZZLPEmKFGVogvW81THWaOFnfrMcq7xgsxNJKbp8Y=;
        b=GzHOlN0ZzVY4PrqYpKqPssLC3MnbSsdquS7slbkn7dcdXDOrQpCRO8USwHNEsG3Ysf
         jju6K0tEIHtYxB4vhKQcLCXTFcb2Y9juE/nPZnI9LSD+xuSwFndkivKRNQ+dZA+wYnyD
         oYxi6rdcJ3ZBUG08tLjCMUb3wUfGdt1yHBdL754NRw1j1CoCHU1rkKgEl8haN/BCf0k3
         qzmFdXoKxi+jkWpLJSnhloCSptQ+ruWOvyhvxxsimbDX+8Xl6g9xn3e8ZsaYaKvdCClH
         w8qbLG6rSSGpdpTFjHHKAV3ZKzzLMCLF4hWyUZVEL5r/gyg+vxdCkctA67GXkCCWANDg
         8ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jl+ZZLPEmKFGVogvW81THWaOFnfrMcq7xgsxNJKbp8Y=;
        b=Q/+mwW0Tay8dFUH9tCogatnEYdx5kFpEq1HXsP9BNeWv/O8+XMWzAP4dUkVAyRetJc
         aB75AIm001nIK5cOX+t8VVbzD/k7RFSewK2VBwSZf1flQZES+W7Ku8DvOWpd/73VSHTP
         SgtknLGJuKjnBUdHMQZOC8kbUZVdN2m6mM8ibqO3zs8pVRVOFv0z/ltESseIWZcA6MgO
         DXuw3kKplfiCttsxHf1KV6QXjZMd+0mWh2FXH1Tn9V6ZR4iDzlYC/jXonXPnOtLTD4ER
         jxKzSR4TA4hku5kGlE9mwnVeWPVi7MWjQDdCN6xUEvwLmEr9003Fignu1VAfqLuN5+MC
         hOQg==
X-Gm-Message-State: AOAM533etN8YXo1JJWD7F6j1DN0owLHtMO0VeLagFcQpGP5i9GVi/I8P
        vjx4dN/stwU7bShP751JpptpFQ==
X-Google-Smtp-Source: ABdhPJyfG2D7eWQvDaS2cd6jcMEovgXAcO4kNIJd+zFA4btjO+0kmpY2e/uHtr9ENXd4dF29PFCiUA==
X-Received: by 2002:a05:6402:948:b0:425:ea37:96b8 with SMTP id h8-20020a056402094800b00425ea3796b8mr34018713edz.90.1652351421995;
        Thu, 12 May 2022 03:30:21 -0700 (PDT)
Received: from [192.168.0.158] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q20-20020a170906941400b006f3ef214dd1sm1991452ejx.55.2022.05.12.03.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 03:30:21 -0700 (PDT)
Message-ID: <5b32cecf-873a-6367-df87-1b8d45e63cec@linaro.org>
Date:   Thu, 12 May 2022 12:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v4 1/3] dt-bindings: phy: qcom,usb-snps-femto-v2: Add phy
 override params bindings
Content-Language: en-US
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
References: <1652282793-5580-1-git-send-email-quic_kriskura@quicinc.com>
 <1652282793-5580-2-git-send-email-quic_kriskura@quicinc.com>
 <d296720d-ccbe-27f0-8ba1-9653af25dd52@linaro.org>
 <9644d608-4ab9-ed0d-50fb-0016e4331361@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9644d608-4ab9-ed0d-50fb-0016e4331361@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/05/2022 07:57, Krishna Kurapati PSSNV wrote:
> 
> On 5/11/2022 11:49 PM, Krzysztof Kozlowski wrote:
>> On 11/05/2022 17:26, Krishna Kurapati wrote:
>>> From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
>>>
>>> Add device tree bindings for SNPS phy tuning parameters.
>>>
>>> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>> ---
>>>   .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 87 ++++++++++++++++++++++
>>>   1 file changed, 87 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>> index 1ce251d..70efffe 100644
>>> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
>>> @@ -53,6 +53,93 @@ properties:
>>>     vdda33-supply:
>>>       description: phandle to the regulator 3.3V supply node.
>>>   
>>> +  qcom,hs-disconnect-bps:
>>> +    $ref: /schemas/types.yaml#/definitions/int32
>>> +    description:
>>> +      This adjusts the voltage level for the threshold used to
>>> +      detect a disconnect event at the host. Possible values are.
>>> +      The values defined are in multiples of basis points (1bp = 0.01%).
>> This means there is some minimum and maximum (100%)?
> 
> Hi Krzystof,
> 
> Yes there are max and min for each parameter (not necessarily 0%/100%)
> 
> As an example if we take squelch detector threshold, the register value 
> vs actual percentage changer as per data book is as follows :
> 
> % change in voltage    |     corresponding reg value
> 
>   -20.90%                        |    7
>   -15.60%                        |    6
> -10.30%                         |    5
> -5.30%                           |    4
> 0%                                  |    3
> 5.30%                            |    2
> 10.60%                          |    1
> 15.90%                          |    0
> 
> Here the min and max are 15.9% to -20.9%
> 
> The min and max differ for each parameter and might not be necessarily 
> 0% and 100%

Then it seems possible to define minimum and maximum values - please add
them ("minimum: xxxx").


Best regards,
Krzysztof
