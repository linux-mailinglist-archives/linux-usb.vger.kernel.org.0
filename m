Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E316544AF
	for <lists+linux-usb@lfdr.de>; Thu, 22 Dec 2022 16:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiLVP5F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Dec 2022 10:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbiLVP5E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Dec 2022 10:57:04 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2796BC01
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 07:57:01 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id x11so3402503lfn.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Dec 2022 07:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IorTpVi1Uzkxm+J45cvzGF9CpTZu4xTCsCDzNG9rvQ=;
        b=L7AFpvZ8RZJ7Jg9wmkPhQwL2RucNvDcEbTN4UgryvffNtFa3wd1La32Rm9FtI1SVQs
         mWjf7EbBPwze2XoztU/RnPNt60sYDoOhNJdJXqiL+YBziBjKAXcyIswMovypzWOBU73X
         9vS7YrtetBZfmSUbqIzjbZ0NUVzhkYKI9KLO/89bItLxA8Ln26wxUqKDU1CfvvU73K4s
         bga6CO/YImN5pTp5zkF4bn9wmDBG66YvxR0OhApSY0IZXE2ddB0XEm/CHDN7Z/w8NDDg
         TCj4dvDWv5XWrLVhgcGtrfcTenWnmSStFvAscK/E7cJtsPJ0BJoO+MflAjfBRrifD4Fb
         pI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IorTpVi1Uzkxm+J45cvzGF9CpTZu4xTCsCDzNG9rvQ=;
        b=QqwesPh0y5+qLPbZ3vB9RbiNEDYh4QtLSMBqsYbLPmjsMUSx1XCAsExENutdp12Gwn
         BtV4Rc8V1iWG+fzabUvMnF+nHUW+5iSD+1C4s02cuXUH0NLuHfKD4kQg/ErfScqWb2Fz
         1HcYWyrHBrTsu1gBEprXVVnFRur+sRk2uiiUq0YOzyEwbdxzmdh9dVRbtO+y0ZacFAh+
         iaQakVIgP8aNsiBbpDBbELWF2SPvJpTryay0J+bkrlc7xOlJKiRtarMUMNdVRXq4GkHu
         6GuPtaJLFpGNH7AwZ8RSrIXFJRaoR81pGmSFLbjzr7gj1h179GjwLDRI9GAgox2u8hD0
         /lhQ==
X-Gm-Message-State: AFqh2kotO0l29v4zpZsuwg0Z2CO0qA2PAav8KWP7Ae7Rqq38uzAIkoWU
        c9ZDRzNSXPepQacR5YhGDmAH2w==
X-Google-Smtp-Source: AMrXdXvZ3082LMCenN68mf9vfl1DFIcmDzRUxBQYnHI1JRU+puaHlbNOWHLuLFn505leMQ/10M/kFQ==
X-Received: by 2002:a05:6512:142:b0:4b5:a207:8d73 with SMTP id m2-20020a056512014200b004b5a2078d73mr1786934lfo.52.1671724620260;
        Thu, 22 Dec 2022 07:57:00 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f13-20020a19380d000000b004acb2adfa1fsm106882lfa.307.2022.12.22.07.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 07:56:59 -0800 (PST)
Message-ID: <1f40c42c-f979-0b74-fcbc-1df142de7e77@linaro.org>
Date:   Thu, 22 Dec 2022 16:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V2 4/6] dt-bindings: usb: ci-hdrc-usb2: convert to DT
 schema format
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, xu.yang_2@nxp.com
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jun.li@nxp.com, Peng Fan <peng.fan@nxp.com>
References: <20221014095148.2063669-1-peng.fan@oss.nxp.com>
 <20221014095148.2063669-5-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221014095148.2063669-5-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/10/2022 11:51, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert the binding to DT schema format
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

(...)

> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> new file mode 100644
> index 000000000000..ed03649f17a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -0,0 +1,341 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: USB2 ChipIdea USB controller for ci13xxx Binding
> +
> +maintainers:
> +  - Xu Yang <xu.yang_2@nxp.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - chipidea,usb2
> +          - lsi,zevio-usb
> +          - nvidia,tegra20-udc
> +          - nvidia,tegra30-udc
> +          - nvidia,tegra114-udc
> +          - nvidia,tegra124-udc
> +          - qcom,ci-hdrc

Except other comments, this conversion does not match existing Qualcomm
driver and Qualcomm DTS. You miss the "ulpi" node.

Best regards,
Krzysztof

