Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8F86E3AD3
	for <lists+linux-usb@lfdr.de>; Sun, 16 Apr 2023 19:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjDPRte (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Apr 2023 13:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjDPRtd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Apr 2023 13:49:33 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21687E4A
        for <linux-usb@vger.kernel.org>; Sun, 16 Apr 2023 10:49:32 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so17823708a12.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Apr 2023 10:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681667370; x=1684259370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BviRw8K9xR14ZYAHCxQApozFiOT4K6dIWwJOZScDiUw=;
        b=FGqxruRgv9Dzl39BYEKGf/Rf7CQwoNAb0fprevlNKdQUOx6F15CUJABY9RtBJi1c0l
         BTQtrvbkXG8C/rlAbDiPtaWibfaVNJOTf1rxK//1obhiW1D8gtxems0I5s38BPQ8+19Z
         157Xj3LYniOvPS0dCQW1o33WtmZoJbCDhnvYcXCQzp57SyuHd27v3OmxUNpoyjnWIJOL
         A5tVUshS4FJdOSTS/pbqtPG1Coq1PCGJDln4cW53TOQYFTSYRo4p8KCM9sT2AS8F4ArE
         ifZVixxQWExeDsUqSEWGc4JI1/krT/C97zO2VoywinfaWgcJ0zfB/B5zBgGknd5XSYR0
         6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681667370; x=1684259370;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BviRw8K9xR14ZYAHCxQApozFiOT4K6dIWwJOZScDiUw=;
        b=jWsA8fNtKjucGEtBy6sE2jG9lOEkMhP3Doz3Y4wsxZ2tAts4nCsN9u9uiPX8FohHS7
         ycAjs+LZrUSzakHT1O49jhjC6XMqfN+qW43ZfHSqHbakZRPoEpGpJWieF/N0urU+t0jV
         v/8fsQxGRyN48zKqY6Ngeq/bgRFVGN5mxuUvW2PZDPO2iNMdD6qP1eTMIOctK79CHagi
         M9pjUWkKgKb7A6A94LydevdqSVLZvWvmhU6t3KJrxIg8iKDJPJ+Jr3v9ZIn/EnjUcFL4
         r+pAHfSlNfdW4jr5IQKUOcu9uulctzWT88UP0An5twGzl25VFF2Pwrrh/2qL4o7z5aTz
         3aow==
X-Gm-Message-State: AAQBX9c+fjvJrpO7zI469VXqvEURFTw6eQ7ib4Vo/hJuihRnoaKYZGue
        MR0pXoCWe2S1PGePkonb+JerbA==
X-Google-Smtp-Source: AKy350apsNazOWLq00J1ultIp3N/3i7lwawRvRPdLXlIq/E7l2jUa03A9vnpQin0I2PoP8xj2i7mNg==
X-Received: by 2002:a05:6402:2814:b0:504:b99c:abd with SMTP id h20-20020a056402281400b00504b99c0abdmr16849265ede.4.1681667370587;
        Sun, 16 Apr 2023 10:49:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id i25-20020aa7c719000000b00504ae3a5adfsm4825287edq.2.2023.04.16.10.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:49:30 -0700 (PDT)
Message-ID: <d8458899-442a-9e5c-a696-7ac4f8bd9880@linaro.org>
Date:   Sun, 16 Apr 2023 19:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 05/14] dt-bindings: usb: Add Qualcomm PMIC Type-C YAML
 schema
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com,
        Wesley Cheng <wcheng@codeaurora.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
 <20230413113438.1577658-6-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413113438.1577658-6-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/04/2023 13:34, Bryan O'Donoghue wrote:
> Add a YAML binding for the Type-C silicon interface inside Qualcomm's
> pm8150b hardware block.
> 
> The Type-C driver operates with a pdphy driver inside of a high level
> single TCPM device.

Subject: drop second/last, redundant "YAML schema". The "dt-bindings"
prefix is already stating that these are bindings (and their format).

> 
> Based on original work by Wesley.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 0000000000000..6d0f5d00305cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,169 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both.

> +
> +title: Qualcomm PMIC based USB Type-C block
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Qualcomm PMIC Type-C block
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-typec
> +
> +  connector:
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +  reg:
> +    description: Type-C port and pdphy SPMI register base offsets
> +    minItems: 2

Drop minItems.

> +    maxItems: 2
> +
> +  interrupts:
> +    items:
> +      - description: Bitmask of CC attach, VBUS error, tCCDebounce done and more
> +      - description: VCONN Powered Detection
> +      - description: CC state change
> +      - description: VCONN over-current condition
> +      - description: VBUS state change
> +      - description: Attach Deteach notification
> +      - description: Legacy cable detect
> +      - description: Try.Src Try.Snk state change
> +      - description: Sig TX - transmitted reset signal
> +      - description: Sig RX - received reset signal
> +      - description: TX completion
> +      - description: RX completion
> +      - description: TX fail
> +      - description: TX discgard
> +      - description: RX discgard
> +      - description: Fast Role Swap event
> +
> +  interrupt-names:
> +    items:
> +      - const: or-rid-detect-change
> +      - const: vpd-detect
> +      - const: cc-state-change
> +      - const: vconn-oc
> +      - const: vbus-change
> +      - const: attach-detach
> +      - const: legacy-cable-detect
> +      - const: try-snk-src-detect
> +      - const: sig-tx
> +      - const: sig-rx
> +      - const: msg-tx
> +      - const: msg-rx
> +      - const: msg-tx-failed
> +      - const: msg-tx-discarded
> +      - const: msg-rx-discarded
> +      - const: fr-swap
> +
> +  vdd-vbus-supply:
> +    description: VBUS power supply.
> +
> +  vdd-pdphy-supply:
> +    description: VDD regulator supply to the PDPHY.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Contains a port which produces data-role switching messages.

I think Rob asked for example for this...

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - vdd-vbus-supply
> +  - vdd-pdphy-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/usb/pd.h>
> +
> +    pm8150b {

pmic

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +


Best regards,
Krzysztof

