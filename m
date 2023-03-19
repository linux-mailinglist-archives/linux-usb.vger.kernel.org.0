Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAF86C0131
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 12:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjCSL6V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 07:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjCSL6S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 07:58:18 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1A71CBCC
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 04:58:17 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id o12so36684218edb.9
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zV3nBvF2UoCbcifgnzs3qvd5B+6u3fG0m7J5yZixV74=;
        b=sdCo51yYMDuXzywN3kxCGlFlZZOiEnPG1x7ZrFMTPVIulEJV/safiFExKwegANLdSx
         QDSU96WT/XQ6cd0M4VS7kNMppPP5YhERzLmG3O3ZMpynuZ9q6qD2ZPnnozR4eY8yCIhU
         G0nhaSrRsQmQ+ze+SOiHqW+4sRQS8fEt3wYi7FxfMW6Q5Tnuxmzt86a7LruYfIZQhh8c
         LOi/bRXb1SdMBQDtu1EN4OVerCbyvomMrZEND0Qr3HsvxH+HbmYIJ1gP0RdQr3nl8+3o
         XqrZG8ES2WwhHVBqNLfwSHRFn7FT057HaepLNWjr+aty2ogEVnWuIR4l9Dy3kT9TuB0T
         RvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zV3nBvF2UoCbcifgnzs3qvd5B+6u3fG0m7J5yZixV74=;
        b=fvfmKrpJQ3guhov5O1TgCGeOB6djM8P6CfVg/qy+AgUNyOWJ0A4JyVYjHmga5oMFdZ
         KyJLSG6bf94OohEPHid2C1fjNJCQ+2uzFFoo3Y0nIW5/GDI8sL9nh9pp7ANKbmCr7pJu
         qzpdA33v3aIHPgYDCdFE/xNs0mFX64uWaGeIEa0FnRk8VQOh8+R/D3fuzZDRiZbBKwlm
         Dqtf7iX5mtTpin9ZxdzsKn/3siR1c2tFucElnsn8KiTm0OXuPzxc3xGupII/Bok5o4TM
         qLrMjL2pC8GN0bi8TncXmjG8Og+qYFfk10IlEjfg0N+rbECj5gSyqB+QiwJ8oCHogumB
         MkBA==
X-Gm-Message-State: AO0yUKV6P2e34LwQ/ik1rKiwMDDH3IRmFN2xnBWm9M6JP9qK5FpjoHFh
        Now1WHRXY/11kx3U+UbnZHqJfw==
X-Google-Smtp-Source: AK7set/fzmIz7f/PELvxUKzkwiNcBjFyemxZe6yy2b+cwUlEfQ01W8yn5mhHjJO90kSbKOheHAuSRQ==
X-Received: by 2002:aa7:db8a:0:b0:4a3:43c1:8431 with SMTP id u10-20020aa7db8a000000b004a343c18431mr8828106edt.5.1679227095542;
        Sun, 19 Mar 2023 04:58:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm3466385edf.50.2023.03.19.04.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:58:15 -0700 (PDT)
Message-ID: <7cd51a8d-7b23-7895-7c06-07dc98924931@linaro.org>
Date:   Sun, 19 Mar 2023 12:58:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 09/18] dt-bindings: usb: Add Qualcomm PMIC TCPM YAML
 schema
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-10-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-10-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> Add a YAML description for the pm8150b-tcpm driver. The pm8150b-tcpm

No, do not add YAML description for driver.

Please add bindings for some hardware and describe the hardware.

> encapsulates a type-c block and a pdphy block into one block presented to
> the TCPM Linux API.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-virt-tcpm.yaml     | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml
> new file mode 100644
> index 0000000000000..576842c8b65b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-virt-tcpm.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-virt-tcpm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC Virtual TCPM Driver

All previous comments apply.

> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Virtual Type-C Port Manager Driver
> +  A virtual device which manages Qualcomm PMIC provided Type-C port and
> +  Power Delivery in one place.

OK, so it looks like bindings for driver, so a no-go. Unless there is
such device as "manager", this does not look like hardware description.

> +
> +properties:
> +  compatible:
> +    const: qcom,pmic-virt-tcpm
> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Contains a port which consumes data-role switching messages.
> +
> +  qcom,pmic-typec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the typec port hardware driver.
> +
> +  qcom,pmic-pdphy:
> +    $ref: /schemas/types.yaml#/definitions/phandle

Having typec and phy as phandles - not children - also suggests this is
some software construct, not hardware description.



Best regards,
Krzysztof

