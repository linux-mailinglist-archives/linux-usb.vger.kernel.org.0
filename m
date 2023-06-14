Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 789237305E9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 19:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237143AbjFNRT0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 13:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236756AbjFNRS4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 13:18:56 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C9C273C
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:18:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f766777605so1447243e87.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686763122; x=1689355122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01GZCQi4jW3iTPlZS/6XKfYfxWg0CJyIWbPtEBU+NGs=;
        b=d3pxVIQxqggFuRwLe38EtwVi/fCKgmc3oPVQMxBWI06KrlRg7vAR4bOxtPVYH6wLtt
         osgXP/LJH3l9c6fY9hrcBqVkzBu7hLUpLyjGdUgMjqP7dqiTmv1WcVA7Lf3gKepC5T9p
         rpezGLWA0Y4D6jfy8yisdu5K8b1sMLWsLxllpzLxJPPS8YmgqDIiXp1p9IIPFvlrw6qU
         npmRtASxVM+u+MMo9eCx/T0xfQ337U4RmYxwPFgc0IzSiTlQjAmWPyTtg4QYVOEAva7n
         TMizjPN0XkxZTqP5/ZsAkbjan/eE3QJhZb0gMCIjN2imIQ/KkbEcB1otCsqnBL7ayRU3
         pD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686763122; x=1689355122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=01GZCQi4jW3iTPlZS/6XKfYfxWg0CJyIWbPtEBU+NGs=;
        b=aw5csEqDl1ctPHrkuF1zN3RX8Lyx7n9EDyry4e/MVizuvyYoT2bR4ghiNhJVbF3NzZ
         yBp7pvI2NLCn4BiT0La2Hh7A8JvcAEoMKBugDLODDJmdNgXFy8NK1UPAE8LvkaQAEeFn
         eTWLjk9LAsE5GSlc3AWv6WmAi7wmp9Z3+wUYo4XBjANjiVhS1BOmI8ESMfB3WtzZ8GBc
         Qf6iBWKR+lkyNCjepawt1d4XPDhZ/NqS6fe3WbkuW9mJXzHvw0iKVzNEyJ4B4pQll5WM
         WtbT20pfCru2qUXjVTuq36vW9olElAVii8WBr+k2feeupckkxQZssj+TodCutFtay1Dw
         klCA==
X-Gm-Message-State: AC+VfDzF/dcyejllxLp7aRBEAA/L2JUp8ExJYsLP0sWKPPE8X/wOSfyC
        lJroU0m1IBN6wMdU41zSYl4KYXvFJm6dDLUC/Zc=
X-Google-Smtp-Source: ACHHUZ5w/UFu6CbSJpdhRbFz7oQJ7rJNpCU0zTqS4RoW8U0/j8ms8b1OclwcHKnIEJYxZJTaIx0hSg==
X-Received: by 2002:a2e:9d8a:0:b0:2ad:95dd:8802 with SMTP id c10-20020a2e9d8a000000b002ad95dd8802mr6864901ljj.38.1686763121737;
        Wed, 14 Jun 2023 10:18:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id m8-20020a056402050800b005149cb5ee2dsm7968375edv.82.2023.06.14.10.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 10:18:41 -0700 (PDT)
Message-ID: <77043c58-539a-d6e5-accd-b1f4d3c77712@linaro.org>
Date:   Wed, 14 Jun 2023 19:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: phy: fsl,mxs-usbphy: add
 fsl,hold-line-without-vbus property
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, jun.li@nxp.com
Cc:     Frank.Li@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20230614111548.1815146-1-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230614111548.1815146-1-xu.yang_2@nxp.com>
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

On 14/06/2023 13:15, Xu Yang wrote:
> The data line can be kept or disconnected when vbus is not present. This
> will add a flag "fsl,hold-line-without-vbus" to describe this behavior.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> index f4b1ca2fb562..c5f9d8a8298e 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> @@ -87,6 +87,13 @@ properties:
>      maximum: 119
>      default: 100
>  
> +  fsl,hold-line-without-vbus:
> +    description:
> +      Normaly, the data line should be disconnected if vbus is not
> +      present. This flag is used to hold data line even though vbus
> +      is not present.

Why is this a property of a board? Why some boards need it? Neither
commit msg nor property explain why do you need it.

Best regards,
Krzysztof

