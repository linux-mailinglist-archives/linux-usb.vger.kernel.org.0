Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6C76B3960
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 10:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjCJJBM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 04:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjCJJAq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 04:00:46 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C306103BC0
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 00:54:18 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id da10so17614199edb.3
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678438457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0G4CMlZfkEr/pUVhqqpiK868gP5MCbnttTXJO4riC/8=;
        b=yrmRhGUK9n/vSM7XBc3U+wnQugThzSxbvwnySaViTDrKExvs1c4HFCowjA0XwEY6sj
         gNSuFvCoGm+bRk7Ypzinz/wU6AeqmFekGl1qpWvqCbbZVrDKhw1PuiUBNe41bi/uwvVe
         Z+IE/E30eh5wJ9JrGAsg+6qnJ5bLgntGmAQ5Kl/D8eW8c/4nSuTipaPu7p9hircNa39E
         c9bHuzX0hV2OCZVQgM1LHAJa2t0acEavP4VoD23SVq0b7oah98F0TYdg11JHZaZ3vwpP
         KtXz66qeb2g3uh9gVoYvMPPT6eruYLe8EzzVoCqfIGzvJyVIOIt3ktPFLbYX7ThYJjeb
         zoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0G4CMlZfkEr/pUVhqqpiK868gP5MCbnttTXJO4riC/8=;
        b=nYVZnx7ry1lHrAgVMzLf0cUPgCK9YYAx4spLdnJX9tw3WiymN/vTSBNOoQgljTo5ZQ
         9L/fY2b4LYO7CZFwTiAzExPpk90Ad1ggYkQgfYZHWX5Fjuaj/GKEqryEkqsNBFyVeYRp
         hzP7ndFdf/zMxUXkfeekAGsRpeg222Qp4t7RU/ugD1I7MMFjlJVATPL08FToyzeHG6ry
         aw0TqOQW/wCmDXex5GMx8WRei30+i3Y+roRHOROgBkVHdqzAdsQdkZ1mCF9idS2qT0Yt
         5DFZdKlV+UxWDviaI2Uy2fZv7l4c/+AEMjcQtRNMrEp3bH2q6SVrAQ5mjGxljjPGJXCZ
         9IqQ==
X-Gm-Message-State: AO0yUKVbHl9TTv2gHxnQM71LL/cuy/8te2wZJsGGxbyefSDACDIKvIsT
        5wqaSqoXNJmEcgMGWvqJoWBdyA==
X-Google-Smtp-Source: AK7set812Bofrp/sGeq5amwMWFXsz5YA/xM5fstbRrXekWsK6vQjpuABBLx9AIKzPFBTukuBbo+tBA==
X-Received: by 2002:a17:906:d8c1:b0:880:3129:d84a with SMTP id re1-20020a170906d8c100b008803129d84amr24317473ejb.60.1678438457012;
        Fri, 10 Mar 2023 00:54:17 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id r14-20020a170906a20e00b008d7a8083dffsm679457ejy.222.2023.03.10.00.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:54:16 -0800 (PST)
Message-ID: <499ee440-0c52-bb21-d04d-086aebc0cf4e@linaro.org>
Date:   Fri, 10 Mar 2023 09:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/28] ASoC: dt-bindings: Add Q6USB backend bindings
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
        andersson@kernel.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, tiwai@suse.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-21-quic_wcheng@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308235751.495-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/03/2023 00:57, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../bindings/sound/qcom,q6usb-dais.yaml       | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> new file mode 100644
> index 000000000000..8477abc511dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ASoC USB backend DAI
> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  The Q6USB backend is a supported AFE port on the Q6DSP. This backend
> +  driver will communicate the required settings to the QC USB SND class

What does the "driver" mean? Linux driver? Then drop and focus on
hardware/Q6DSP.

> +  driver for properly enabling the audio stream.  Parameters defined
> +  under this node will carry settings, which will be passed along during
> +  the QMI stream enable request.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,q6usb-dais

Can q6usb mean anything else? Why "-dais" suffix?

> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  qcom,usb-audio-intr-num:
> +    description:
> +      Desired XHCI interrupter number to use.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Why this should be configurable per board or SoC? It's the first use in
DT and in the same time sounds generic...

> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - qcom,usb-audio-intr-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dais {
> +      compatible = "qcom,q6usb-dais";
> +      #sound-dai-cells = <1>;
> +      iommus = <&apps_smmu 0x180f 0x0>;
> +      qcom,usb-audio-intr-num = <2>;
> +    };

Best regards,
Krzysztof

