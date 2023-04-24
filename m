Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5254F6D7F26
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbjDEOTc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238532AbjDEOSx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:18:53 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EFF66194
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:18:07 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id h8so141515583ede.8
        for <linux-usb@vger.kernel.org>; Wed, 05 Apr 2023 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680704285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uISS19+jToFclMpkmnOdVAy0VsfR3V1lwv1Dgp6A6Qs=;
        b=KETD9SA21cYXTW3wGTtfIqmkh9EbGlvtBVYEtmrReMYTa7JuDxLz+xNMgArd0rQwQH
         qeIioRLanv393ffmZn+j0Q8uD4SquXdRia0mWSvwgHAtxBrngocGMrCLK5c1e2TUBY5t
         aS1N7PWXiMDw16N8Ye4PIcTd/SoQuCyri/ZXhWpooYWsIl3g5Pv6evnSZGqFkdFLWaU5
         gcEithmdKWBnZUhLq7mqtnY5b6B5vWuf6fb48i6OaUepdYaDmNOpHtVBrKxqJo4Yqr4e
         IH1Fk+4omZPNJ51OigDbgPo6+DOCcBJ+Y00B70Y/yfJUqRlg5w8xtZWzZWSTg4O69meG
         EoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704285;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uISS19+jToFclMpkmnOdVAy0VsfR3V1lwv1Dgp6A6Qs=;
        b=ZSW4QSl5y5hU14Wh8tRKgepNJiZePdcYlbArZeJbmnTJS/HgwRDQJ9NHvWASprap6+
         SZTtDd7nKpc47OGUI45Ptp23TyAdqyy+76LsWs3rDSZyN1ZvK82BojTyBchmqMl1oyYr
         ZCVK4+ktKDRj8YCXAdJCNTCi+e3sVGpWB+OoshlaeKQtSYIk/Ix9M80/8cgOjKsWtnsX
         dYj7sIe7gxc7LOyrkQSVvvfYWBgp5z+ryeLMz2OYnhCpGnCj12+3l0sI0EEQexdtBQRA
         9H3tF0r0N77bNsdXCBCXh2Na1m4rJ6yaR+Ng+FS/A/K2V68DqCaE5ai68U1TtRuOs4tr
         8mxg==
X-Gm-Message-State: AAQBX9d7Foil2hIvjCj033btoFMAj1/+gn2xjfj4W7faya+SzVzQkDNr
        gEXAp7jf422jME5ZoXD/8zzzjQ==
X-Google-Smtp-Source: AKy350bX8RcQwC6IbMilofBM5NBcNepluBhbWwjkG4immwGuxPDPAJ+V1iei0t9gdH/bRQLNv3ratA==
X-Received: by 2002:a17:906:360e:b0:931:ce20:db8e with SMTP id q14-20020a170906360e00b00931ce20db8emr3059867ejb.51.1680704285073;
        Wed, 05 Apr 2023 07:18:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id gv19-20020a1709072bd300b00931db712768sm7430424ejc.4.2023.04.05.07.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 07:18:04 -0700 (PDT)
Message-ID: <551c67b1-8c74-4ed6-7319-b6bfbe44eb2a@linaro.org>
Date:   Wed, 5 Apr 2023 16:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 1/8] dt-bindings: usb: Add bindings for multiport
 properties on DWC3 controller
Content-Language: en-US
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com,
        quic_harshq@quicinc.com, ahalaney@redhat.com,
        quic_shazhuss@quicinc.com,
        Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20230405125759.4201-1-quic_kriskura@quicinc.com>
 <20230405125759.4201-2-quic_kriskura@quicinc.com>
 <63bfaa1e-c627-bfe1-0bef-d001dae41014@linaro.org>
 <c18db964-1af7-7bbf-0d0f-cbb037f7500a@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c18db964-1af7-7bbf-0d0f-cbb037f7500a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/04/2023 16:15, Krishna Kurapati PSSNV wrote:
> 
> 
> On 4/5/2023 7:31 PM, Krzysztof Kozlowski wrote:
>> On 05/04/2023 14:57, Krishna Kurapati wrote:
>>> Add bindings to indicate properties required to support multiport
>>> on Snps Dwc3 controller.
>>>
>>> Suggested-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>> ---
>>> Link to v5: https://lore.kernel.org/all/20230310163420.7582-2-quic_kriskura@quicinc.com/
>>
>> You did not test it at v4 and you got report for this. Your changelog in
>> commit msg does not mention fixing it.
>>
>> It looks like you did not test it for the second time (or sixth time).
>>
>> Best regards,
>> Krzysztof
>>
> Hi Krzysztof,
> 
>    I did do a dt_binding_check and I got the following result:
> 
> kriskura@hu-kriskura-hyd:/local/mnt/workspace/krishna/skales2/skales/kernel$ 
> make DT_CHECKER_FLAGS=-m dt_binding_check 
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>    HOSTCC  scripts/basic/fixdep
>    HOSTCC  scripts/dtc/dtc.o
>    HOSTCC  scripts/dtc/flattree.o
>    HOSTCC  scripts/dtc/fstree.o
>    HOSTCC  scripts/dtc/data.o
>    HOSTCC  scripts/dtc/livetree.o
>    HOSTCC  scripts/dtc/treesource.o
>    HOSTCC  scripts/dtc/srcpos.o
>    HOSTCC  scripts/dtc/checks.o
>    HOSTCC  scripts/dtc/util.o
>    LEX     scripts/dtc/dtc-lexer.lex.c
>    YACC    scripts/dtc/dtc-parser.tab.[ch]
>    HOSTCC  scripts/dtc/dtc-lexer.lex.o
>    HOSTCC  scripts/dtc/dtc-parser.tab.o
>    HOSTLD  scripts/dtc/dtc
>    LINT    Documentation/devicetree/bindings
> invalid config: unknown option "max-spaces-inside-empty" for rule "brackets"
> xargs: /usr/bin/yamllint: exited with status 255; aborting
>    CHKDT   Documentation/devicetree/bindings/processed-schema.json
>    SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> /local/mnt/workspace/krishna/skales2/skales/kernel/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml: 
> ignoring, error in schema: properties: qcom,pre-emphasis-duration-bp
> /local/mnt/workspace/krishna/skales2/skales/kernel/Documentation/devicetree/bindings/arm/vexpress-sysreg.yaml: 
> ignoring, error in schema: properties: gpio-controller
> /local/mnt/workspace/krishna/skales2/skales/kernel/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: 
> ignoring, error in schema: patternProperties: ^thermistor@: properties: 
> adi,excitation-current-nanoamp
> /local/mnt/workspace/krishna/skales2/skales/kernel/Documentation/devicetree/bindings/iio/adc/adi,ad4130.yaml: 
> ignoring, error in schema: patternProperties: ^channel@([0-9a-f])$: 
> properties: adi,excitation-current-0-nanoamp

All these are some errors, maybe coming from your schema, maybe from
next. You can narrow the tests with DT_SCHEMA_FILES (as mentioned in guide).

Best regards,
Krzysztof

