Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2BB57310E
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 10:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbiGMI1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 04:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbiGMI0o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 04:26:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D565F84
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 01:26:00 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id o7so17851802lfq.9
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 01:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0GpYX1jWMK2wrDqmjLZTKM0tzfJSoRl5a+p8xGs1L+E=;
        b=pdCfJp38OeUftbo762CFDDj5npKj6Py/1UeuPSNL/cdemmSWkBvyMlzXFPOEEYfTO+
         uICnasyNJ03Wqf+BpdGGFzdVDJu+2y3kDr+Bal6uWRYdxl5VdAXQxop6eye/08pefgf2
         lDHncP5gYvViaMTZJgU854s5c9RfnbNy5zBYiAkMafNfrVR+Ui93pyD9i1583n+IaJKn
         3f85L7fv675HnvQBPrYHOzA9pJsa6RwEYs9K3F+o0J8VNqnNwQEyAiu3U5NuTL1ZxXIR
         Wm1UEHsdx1fe0RTSBrjpctO4poq+ZH7aVB41O35tJ+NVJgL88dY7a03mtAW0+LtrLNMQ
         6RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0GpYX1jWMK2wrDqmjLZTKM0tzfJSoRl5a+p8xGs1L+E=;
        b=rb7X3X/N8G/Sbj3Sriuk3YwPTMgQda+ITMrWvd7tLGXEbr4yFz+wRV1Rx7tFEe0LGO
         /fyUE27+yrhTqIB6hqZyzQL5NSYl7ueBtENignxfz2djejmMl/Sw5fOvaN9qre1VnS71
         Pm/rRDlVnKGZwX2RTzjQShBxkh2W+hoByDvSjmWIPFYaRVdBIZTv2mbaSg9MhHhoLvtN
         zr+CCrQsRmULJqRnjn4GU6cWy+1sT8WlhjsCS+O5/mbd4eoSX+LJgLAt9y2fyuCMw7cw
         WOBkTbESr2jBzmpvcyb06PjiM2tHFJoI95xNsrpvMGFhnfjQNJZnZMS5VKJllsnXSGqz
         BB8w==
X-Gm-Message-State: AJIora9EdLBlHLX1kpHzIKLcDBNqqyOwWlL1e3kG3kgt1/FTxfP1w8FN
        B1rPrBjQNWbFZjnSkG1TTxolNw==
X-Google-Smtp-Source: AGRyM1sRhL07eFmV0OQSuYnU/YB2yIeFw+0PcB8uCGbrqwTlS4eUMyCu/IxtSO6yGnTIoJvjjHsX0w==
X-Received: by 2002:a19:6d09:0:b0:481:3c54:ad52 with SMTP id i9-20020a196d09000000b004813c54ad52mr1351736lfc.393.1657700758243;
        Wed, 13 Jul 2022 01:25:58 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id a24-20020a056512201800b0047f6b4f82d1sm2660260lfb.250.2022.07.13.01.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 01:25:57 -0700 (PDT)
Message-ID: <1cbe0b48-c472-2bd8-9153-6ef0412adefe@linaro.org>
Date:   Wed, 13 Jul 2022 10:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v17 1/2] dt-bindings: usb: Add analogix anx7411 PD binding
Content-Language: en-US
To:     Xin Ji <xji@analogixsemi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     bliang@analogixsemi.com, qwen@analogixsemi.com,
        jli@analogixsemi.com, Rob Herring <robh@kernel.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220713072943.2789612-1-xji@analogixsemi.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220713072943.2789612-1-xji@analogixsemi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/07/2022 09:29, Xin Ji wrote:
> Add analogix PD chip anx7411 device binding
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> ---
> v16 -> v17 : Add node name "usb_typec"
> v15 -> v16 : No changes
> v14 -> v15 : No changes
> v13 -> v14 :
>     1. Fix Robot compile error. Fix node name not correct.
>     2. Change HEX to lowercase.
>     3. Use "ports" property.
> v12 -> v13 :
>     1. Drop the quotes for "$id" and "$schema"
>     2. Remove "allOf" label
>     3. Change node name from "i2c1" to "i2c"
>     4. Change node name from "typec" to "usb-typec"
> ---
>  .../bindings/usb/analogix,anx7411.yaml        | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> new file mode 100644
> index 000000000000..60aac5765320
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/analogix,anx7411.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/analogix,anx7411.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analogix ANX7411 Type-C controller bindings
> +
> +maintainers:
> +  - Xin Ji <xji@analogixsemi.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - analogix,anx7411
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  connector:
> +    type: object
> +    $ref: ../connector/usb-connector.yaml
> +    description:
> +      Properties for usb c connector.
> +
> +    properties:
> +      compatible:
> +        const: usb-c-connector
> +
> +      power-role: true
> +
> +      data-role: true
> +
> +      try-power-role: true
> +
> +    required:
> +      - compatible
> +
> +required:
> +  - compatible
> +  - reg
> +  - connector
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        usb_typec: anx7411@2c {

Node name is still specific.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
make it "typec".

Best regards,
Krzysztof
