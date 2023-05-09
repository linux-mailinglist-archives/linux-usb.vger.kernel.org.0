Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECE56FC12D
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 10:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbjEIIFe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 04:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbjEIIFN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 04:05:13 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B981810A12
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 01:04:05 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so667539a12.0
        for <linux-usb@vger.kernel.org>; Tue, 09 May 2023 01:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683619378; x=1686211378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZycbHjbA3SYDVSwMpk5MD7nH5UCCDEo2I1KuZv1isA0=;
        b=VzG8qRng8ioR6VuJCtAXpNAzaWbkseTJzIBE0XCnUJk42KFFlM7XbJcxT+M1P+DM+z
         MOJ2cRS7I9E82601Fbk/BqFNs/eO8feJCHUott7kG1YPk0S9wW2/LkgjvE1o8lBmSju5
         98jW8gBX5rSjx1NzoFyCKPvv5W3+4b9a3mnCXA/qjgYLCq1Ckks3p1M3JgDS3MCOvTlZ
         G5/CIRHLYeZUWxsZJisBYac91NqhfpcDBlYYIqLmE7itiJ+pvUBTLdHNWlTIcOPZFmmp
         21q72sCuQ3Iipta3vUxJzMo6t9EzyDwS3GHwQXjys0REJIPjOc3hot8X86wpzL20uYRA
         z8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683619378; x=1686211378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZycbHjbA3SYDVSwMpk5MD7nH5UCCDEo2I1KuZv1isA0=;
        b=N4yRNYXwPtYzCp37lZyK7XDrxUVzGC8w63RQMf9I/kXZQdnN4fwK1M0ikbr+RGsA2F
         JDsFF3YW79wx1Kk+Baj8Nv6PQyGJp/xNT6cKHCiJ9lPTvmJLHUpFBiyEHa54sqgWOXAp
         RIxyBDBSCvG42xFSb0lcC55veSEpnwlpR5y/ksgGG2JliPJ0N7TLHl8v8VrNXHgkRRen
         7imOJ8nvb15rRj2EkVwES41Wch2+iS/jkEJaM7QtbY5PO1qoRyMNk5L2yUJ8bJt91kqv
         RUWiy/k6r+r5VTawsZKbXK9j5vHMQyi6esesTrqwttdeVvO15L3tMUi6ju0fQhrwCeEb
         M32w==
X-Gm-Message-State: AC+VfDyJO07zNuXE7Env2rOQ0IXj7SZXovZc9qmZhH6yro/RAn9cljV8
        BpzJsjHfaQKlvBKwQqnyohTv0w==
X-Google-Smtp-Source: ACHHUZ7Bdo4zf4vdSIr+MexdZhFRrTRgg+IsWCI3cpBIH43cHuWZmD8Inwrjo72s5OSKce38UunPLw==
X-Received: by 2002:a17:907:9608:b0:969:e95e:e4f3 with SMTP id gb8-20020a170907960800b00969e95ee4f3mr1425734ejc.55.1683619378276;
        Tue, 09 May 2023 01:02:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id og16-20020a1709071dd000b0096637a19dcasm1007866ejc.4.2023.05.09.01.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:02:57 -0700 (PDT)
Message-ID: <9a2c6858-fe1d-121d-aca4-58fa907ee2fb@linaro.org>
Date:   Tue, 9 May 2023 10:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: misc: Add microchip USB5807 HUB
 driver
Content-Language: en-US
To:     Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.73717b19-477a-47ab-9efb-48f096304ca8@emailsignatures365.codetwo.com>
 <20230509074621.29774-1-mike.looijmans@topic.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509074621.29774-1-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/05/2023 09:46, Mike Looijmans wrote:
> The USB5807 is a 7-port USB 3.1 hub that can be configured by I2C.
> This driver resets the chip, optionally allows D+/D- lines to be
> swapped in the devicetree config, and then sends an ATTACH command to
> put the device in operational mode.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> 

Subject: drop misc prefix.
Subject: drop "driver", you are not adding driver here.

> ---
> 
>  .../devicetree/bindings/usb/usb5807.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb5807.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb5807.yaml b/Documentation/devicetree/bindings/usb/usb5807.yaml
> new file mode 100644
> index 000000000000..06b94210c281
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb5807.yaml

Filename like compatible.

> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/usb5807.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip USB 3.1 SuperSpeed Hub Controller
> +
> +maintainers:
> +  - Mike Looijmans <mike.looijmans@topic.nl>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,usb5807
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: |
> +      Should specify the gpio for hub reset

Drop description, obvious. maxItems instead. If you decide to add
description, then keep it useful, e.g. mention active low.


> +
> +  swap-dx-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Specifies the ports which will swap the differential-pair (D+/D-),
> +      default is not-swapped.

maxItems (and minItems if it differs)

No supply? How does the hub gets power? I see at least two supplies in
datasheet.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg

Best regards,
Krzysztof

