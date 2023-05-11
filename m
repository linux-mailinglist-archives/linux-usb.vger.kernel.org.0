Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377486FEEF4
	for <lists+linux-usb@lfdr.de>; Thu, 11 May 2023 11:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237723AbjEKJf2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 May 2023 05:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237722AbjEKJfK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 May 2023 05:35:10 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2C29EF3
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 02:34:45 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-965c3f9af2aso1253626466b.0
        for <linux-usb@vger.kernel.org>; Thu, 11 May 2023 02:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683797684; x=1686389684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ex/aKjn90EFJWYDLrPJvxbqGHEj9FjzjYBAyGP2XVQo=;
        b=Asx/w4Edt7+dgdf5Ppv3yBqkvWO6IbtpteydOqqall+rPi2Ep/l/j3tc4P3u6731kP
         1937bl7xi69PCz8qKjEZF8oPS00d6FF4syxY3CJjh8xt/V1ZxHooU43MTMwSKMPJSfA7
         4NmcCNwbmLc/+QyFXXFZeuuMJkEmrvcN351F72xRJv6cW2Fa8Zf8fGQ/ekbjq616OJuO
         QnmQrqSnpBE5kjkrlESag4ORK15TmocBh6zP05JHs/7zt9Pd1JzNLISgtlVr+fRjem3l
         KmhozfPNr1jznI3p2Q8rxDZNbWRPZgblot04t8lBnbpRQbMLegNJQPaTyySPW+zLcW4d
         piOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797684; x=1686389684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex/aKjn90EFJWYDLrPJvxbqGHEj9FjzjYBAyGP2XVQo=;
        b=iT//pO7AkBREvqYbbSTgKgW8aaweviF4tUbX4fLDfqwQO+Dh0yorT1zg8zlCFNxaQ2
         tjkGjn36H1z/AyPZ6Dz+stoGzSLmdVQcCfoSulQSax1NYrx7RoLx2HQp/MGiEdV968yR
         V5CMfW8Zfy3MSW5qg2Tlicc2j0i3MLiIvB6Hd9isRt7I6poEsMz0YfJ7U43TianxkGKZ
         jDwPyUTmlQrBx5G+J5FSaycQ7aZufecYShHJXTPgsv30cZKYNjPD1IY29ULvptp4J/o7
         8C2KEpu9gGdbw9fMz3fIkVGvef5y+FcagAp3HfMQC2/6Tzq+w9u+XSVTbr0FnEGV827r
         JbkQ==
X-Gm-Message-State: AC+VfDyAaBoSOeIK9EnKCPfrmcnnn3FwfkvfkTuFBTlv8BpwrJhThuQa
        QfC2xvcy0wSCUWaH9bFgWCpAizFg0MqFET86FgsPtA==
X-Google-Smtp-Source: ACHHUZ4qwUJIawM1CqXQt5W8mKyqouVMxGYUzhR1RJbAvGXoVhZeB00zYWSWejWEeEdo6g2JBMNQtA==
X-Received: by 2002:a17:907:6e9e:b0:931:ad32:79ed with SMTP id sh30-20020a1709076e9e00b00931ad3279edmr22568324ejc.12.1683797684074;
        Thu, 11 May 2023 02:34:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e? ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id k21-20020a170906971500b00965ffb8407asm3708531ejx.87.2023.05.11.02.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:34:43 -0700 (PDT)
Message-ID: <ca8b31f5-ce4e-d7b1-d077-3684862083bf@linaro.org>
Date:   Thu, 11 May 2023 11:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2] dt-bindings: usb: dwc3: Add interrupt-names property
 support for wakeup interrupt
Content-Language: en-US
To:     Piyush Mehta <piyush.mehta@amd.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, balbi@kernel.org, michal.simek@xilinx.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, michal.simek@amd.com,
        siva.durga.prasad.paladugu@amd.com, git@amd.com
References: <20230511072154.2030703-1-piyush.mehta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511072154.2030703-1-piyush.mehta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/05/2023 09:21, Piyush Mehta wrote:
> The hibernation feature enabled for Xilinx Versal NET SoC in DWC3 IP.
> As the DWC3 IP supports the hibernation feature, to handle the wakeup
> or hibernation interrupt, add host mode "wakeup" interrupt-names
> optional property in the binding schema to capture remote-wakeup and
> connect/ disconnect event in the hibernation state.
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>
> ---
> Change in V2:
> -  Addressed ROB review comments
>  - Updated name of interrupt-names property with "wakeup"
>  - Move interrupt-names property from dwc3-xilinx core to dwc3 core.
> 
> Link: https://lore.kernel.org/all/CAL_JsqK6_7XD7+w+EQvPPmbmSOpfo3JDb0xDN4StuHUm1kgchw@mail.gmail.com/
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 50edc4da780e..db512769bd80 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -53,6 +53,8 @@ properties:
>        - const: dwc_usb3
>        - items:
>            enum: [host, peripheral, otg]
> +      - items:
> +          enum: [dwc_usb3, otg, wakeup]

You didn't add only "wakeup" but also dwc_usb3 which does not look
correct here as it is common interrupt. The change does not match commit
msg and I don't know what you actually want to achieve.

Best regards,
Krzysztof

