Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571AC6C5916
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 22:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjCVVx6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 17:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjCVVx5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 17:53:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2029C3432C
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 14:53:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id cy23so78695080edb.12
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679522032;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xehrL2dgpZYyP/0AM2a+lXnXwn5PW3e0iW5W0VmPTqg=;
        b=KI4TzoNHQxflEoUcBryC3LXEvMO9lxh2bsIloTZApwsunrsKsg/6DG3LYjPR5oFezI
         5d8J3vnMlni6v+vzv9ACcW66GzUBcBw/K8sL01C5mAu3Sl/R6PDlECvjEAcR6l0oG9iI
         3TAXYG4RGicppbFPS+KwYwga/aDWrOF6JisGaWjN6DkxOPEEmb2096NhC7ZlQdeu+XwH
         6GILqbGa4V8HaiubNnE+t5cWZAP5TQQmCIdNdah2XT1/mPkplH0H6XKVLHOZGz+PbalS
         SsQ02tae7TxAYj7DnzjObjMbDHUrMrzXtAmVblIqV5PpLUD86/Lz0S1/Oh+XmlAy3xkS
         1j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522032;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xehrL2dgpZYyP/0AM2a+lXnXwn5PW3e0iW5W0VmPTqg=;
        b=2BVGxMcR4sUTUXjmOCYisgRVvhlHzBscgPVZNrvknHw0trdczFjdADZOVMBjZnFdw4
         h8CJt3ajMHl+6NbdVwXE0ciwPFo1s5STRnpkoeLAMXON4YbofVlQ1itiILpfPR/OsjV5
         H7kDAkHt6QbyjvIWlers7snibPkDavrLwI5eJv4Px0LeyGwin8LRTaAqrSrUqJfQJSSK
         6RYrRCH0n61QodWAnpF89OhFrZ82T1pjd2h2WEJZ+n9MDc+0dXbGmaceIfvIsEaVYJJs
         dR8yEzvwc7nzYLpD8sE1P6PS5FUXQIS0BJjAIyTuyWVcVSvy4cGbLTuUg00Jhvdvf9pu
         CSkw==
X-Gm-Message-State: AO0yUKWivkicE1r3Z1MJOgquOp6o+7VoNM0mT1XtGHAmeSef6VgGzai+
        xiInxlu7cvwL4cmfNDHgjSJjjA==
X-Google-Smtp-Source: AK7set+sdpyhZHcj4stGuQd5RDDcBiVcAch7q43+icvAAhA35KsTbJdpiWJDVoDcAHwDrvEpoPevgA==
X-Received: by 2002:a17:906:46d7:b0:930:7164:e8e5 with SMTP id k23-20020a17090646d700b009307164e8e5mr7122905ejs.38.1679522032625;
        Wed, 22 Mar 2023 14:53:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:626d:5729:6e71:4c22? ([2a02:810d:15c0:828:626d:5729:6e71:4c22])
        by smtp.gmail.com with ESMTPSA id lk8-20020a170906cb0800b009311c9d33d7sm7656336ejb.184.2023.03.22.14.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:53:52 -0700 (PDT)
Message-ID: <4e1cc130-8bfb-96d1-1f93-f1389544b8e3@linaro.org>
Date:   Wed, 22 Mar 2023 22:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/8] dt-bindings: usb: dwc3: Add IPQ9574 compatible
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679479634.git.quic_varada@quicinc.com>
 <2ef0959be2aba24b3e3017cd09af7cc63aea74ba.1679479634.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2ef0959be2aba24b3e3017cd09af7cc63aea74ba.1679479634.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22/03/2023 11:44, Varadarajan Narayanan wrote:
> Document the IPQ9574 dwc3 compatible.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a2aabda..3ae56d3 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -17,6 +17,7 @@ properties:
>            - qcom,ipq6018-dwc3
>            - qcom,ipq8064-dwc3
>            - qcom,ipq8074-dwc3
> +          - qcom,ipq9574-dwc3
>            - qcom,msm8953-dwc3
>            - qcom,msm8994-dwc3

No updates for clocks? Then disallow them for your variant.

Best regards,
Krzysztof

