Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0BF9659643
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 09:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234798AbiL3IWG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 03:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbiL3IWC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 03:22:02 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26585FD25
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 00:22:00 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bt23so14202674lfb.5
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 00:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAnyyfuNqQmQvEppT7FkugRphAcXPYjh2BEsSM40weQ=;
        b=YDM3xsBL4hjlX2yRXGZOX3s9wdciMI5NPmFnk7jGnE730AtD0oiYK+qSxizUbaVvDK
         pInWdU7XCDDiVJlleM7on5EdvIUVSCbwWcG6hD86b/bfCmMCOmTUqZNrCdZgGXXIpUxq
         GNlXogZ3suBdnlp3nff56MST2hCXrsux7YmouR0HHK5Zg0WXar2bCKzISZgIXIdiaYVb
         k0jyKfb+HWYD4xrjeV0FVa0GalqTjxRJsgvh3FYApdE2Tx+2pPiuXj+Pva9bKu9Q0sT9
         oNDo2HOiTMFKy7QYvH32xK+q9PI+UGVmYTitT2u9z1xdTH39Jam786YJVgolMbuz+60E
         kGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAnyyfuNqQmQvEppT7FkugRphAcXPYjh2BEsSM40weQ=;
        b=eyxDWUQVRsrliQuVCaTzLKhuLGaOTdYxjxC/qP8v1SYH3ux/YWGnopLcxBqy2eqOES
         oIyNpC2ulxbo6oA4SFALrxfoQnkh3oF1mZmvI2CnfV2D+J+g9UcJEbMtbyqPbMldgE/T
         bEno7IUP+5iXtvdmu2LbpcHS3GeoHdw+vBD0qWrA9htBa1xBUmAD0y2Rf4ulXWlwOZaQ
         h7hjKVTcJoY5bLI0YiUJub5VEg5bqyAhCop3EhcIyz2EKaP2VQNhlm56y1NywRDpM6I6
         1aeZ9TL62Bc9wjn5BQBD3Lf/0b31J6n31z3jSVGdyrq7WjTHA75q48eUBY4iUik03m4O
         Z8sQ==
X-Gm-Message-State: AFqh2krMyApxfV27pVXOgN3IHeobJ4ae65v03cX1ByjYiJPxr5x+obE0
        zQj8L1AI04B1mPGbYQBfutvvaQ==
X-Google-Smtp-Source: AMrXdXs66FW6eSUKv7C5khMqMv0kG/5KJRDx92H/vnali+TbjLXc+HKnG3MgYcfaCLXO6/AqOwxwrA==
X-Received: by 2002:a05:6512:3701:b0:4b5:9e59:8cdd with SMTP id z1-20020a056512370100b004b59e598cddmr9338231lfr.67.1672388518539;
        Fri, 30 Dec 2022 00:21:58 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e13-20020a05651236cd00b004b57a810e09sm3398791lfs.288.2022.12.30.00.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Dec 2022 00:21:58 -0800 (PST)
Message-ID: <b23c9e9d-35ea-ebc7-eb18-46fd0c9f3d45@linaro.org>
Date:   Fri, 30 Dec 2022 09:21:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Add qcom,dp-manual-pullup
 description
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20221229183410.683584-1-bryan.odonoghue@linaro.org>
 <20221229183410.683584-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229183410.683584-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/12/2022 19:34, Bryan O'Donoghue wrote:
> The original Qualcomm driver for the HighSpeed USB PHY contains a flag
> which tells the driver that the controller and PHY do not connect to VBUS.
> 
> In this case an external IC such as a Type-C port manager supplies VBUS and
> the VBUS signal is not routed to the SoC. This means we cannot detect the
> presence or absence of VBUS and cannot take action based on it.
> 
> Document the downstream boolean qcom,dp-manual-pullup to allow the HS PHY
> implement the necessary logic.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> index aa97478dd0161..c55a59df71ad0 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> @@ -80,6 +80,13 @@ properties:
>              the address is offset from the ULPI_EXT_VENDOR_SPECIFIC address
>          - description: value
>  
> +  qcom,dp-manual-pullup:
> +    type: boolean
> +    description: This flag indicates to the HS USB PHY driver that it should

Drop references to the driver and rephrase it to describe the controller
behavior/feature or the board layout/configuration, not the driver. The
same applies to property name - "manual pullup" is describing driver,
not hardware.

> +                 enable or disable an internal pullup when powering on or
> +                 powering off the HS PHY instead of toggling the value when VBUS
> +                 is absent or present.

Wrong indentation. It's two spaces.

> +
>  required:
>    - clocks
>    - clock-names

Best regards,
Krzysztof

