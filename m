Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8821D656285
	for <lists+linux-usb@lfdr.de>; Mon, 26 Dec 2022 13:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232053AbiLZMZb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Dec 2022 07:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiLZMZa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Dec 2022 07:25:30 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F27E112F
        for <linux-usb@vger.kernel.org>; Mon, 26 Dec 2022 04:25:28 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id f34so15751633lfv.10
        for <linux-usb@vger.kernel.org>; Mon, 26 Dec 2022 04:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NRqJFN65mXrfiQ1epZASIoX5WyuOxWca2c7oRHRoZjM=;
        b=DLOhe33XdER4swyGLgfV7GbL6eNqemhX/aqMfZnZ1OEOz1xgr7mBNixNL2f326fs/4
         CnyK46s63Rd8noz46H5FSU/xk4pfE85mO7KXURaIkeqDvFawW7C3HtkiA2UZGWoDik6R
         /NwNomtQMunHbNPrK2UZSYFm6EHAaTsZSaXZXbpBRNacIimKZvh90fd3X1t9UX8KRldO
         lwputwilz7Mfc8puKoOUFl419uLDxRk1pZKVN/6t23LL3tD5s/oNJbzoAk7qpWY7Am6U
         e7k67mOFp4A3oc+RH46XQdW99EpeBbLah3xRuPIW5Gfni3QjiE8kaDvwrxYgZEmLC9gJ
         O9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRqJFN65mXrfiQ1epZASIoX5WyuOxWca2c7oRHRoZjM=;
        b=lUUPGaWJ9h1f0fAAFUBe4MbhSBZK6dDVKJToySOFewptsBSx4D9DHd4h/V0CX/PI9e
         w72jFH+zY5zwDlOgOGeBTu2ok+Fqz8BROWMML+JUpk2IfYNC9dLDe88Me2RB3AqB0TXM
         OJlDN7WDm3RM+mU480tdzCai6JEBIcM09RgjtCfbVTJka3n+YdXLgJHXTHu2WKwhUAKI
         gOYwowFoCQ7M08lWldCTh7+s2vbBpFK7YVgv732nB+CBOe95Mj7SLlrLqkc+85Oor2EM
         J86qgo1pxlurSFpDM7VpOXKnvfd8Qj5cfAYWrS7mrh/zxIN/ZpuLF3LFBQNXx2Z9ZnGv
         2cZQ==
X-Gm-Message-State: AFqh2kr4AI3C9AOKdo362VlFipfoGfat6mbFKNb4ugagYA8lSHHprrED
        2CcmvoTKFXcMx37kRKA/ky04QA==
X-Google-Smtp-Source: AMrXdXtSdYzIsTPbhF0aulD8Cu0NnVleFHmKjqs8pLgkPeEupjmhRtJetW1s2qWA73/Tgv8rl39lUQ==
X-Received: by 2002:a05:6512:15a3:b0:4b1:3970:43da with SMTP id bp35-20020a05651215a300b004b1397043damr7669959lfb.51.1672057526622;
        Mon, 26 Dec 2022 04:25:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b55075f813sm1786829lfc.227.2022.12.26.04.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Dec 2022 04:25:26 -0800 (PST)
Message-ID: <40efb96f-fa0c-c366-bab8-ac6488265759@linaro.org>
Date:   Mon, 26 Dec 2022 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 13/14] ASoC: dt-bindings: Add Q6USB backend bindings
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>,
        srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-14-quic_wcheng@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223233200.26089-14-quic_wcheng@quicinc.com>
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

On 24/12/2022 00:31, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../bindings/sound/qcom,q6usb-dais.yaml       | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> new file mode 100644
> index 000000000000..e24b4d52fa7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ASoC USB backend DAI

What is "ASoC"? Does not look like Qualcomm name for hardware, but
rather Linux, so should be dropped or changed to SoC or ADSP etc.

> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  The Q6USB backend is a supported AFE port on the Q6DSP. This backend

What does "supported AFE port" mean? Can an AFE port be unsupported?

> +  driver will communicate the required settings to the QC USB SND class

If you mean Linux driver, then please drop entirely all references to
drivers. In other case, please explain more.

> +  driver for properly enabling the audio stream.  Parameters defined
> +  under this node will carry settings, which will be passed along during
> +  the QMI stream enable request.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,q6usb-dais
> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  qcom,usb-audio-stream-id:
> +    description:
> +      SID for the Q6DSP processor for IOMMU mapping.

Why this is not part of regular iommus property? It's the first time
something like this appears in Qualcomm hardware, so I wonder why this
DAI is special?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,usb-audio-intr-num:
> +    description:
> +      Desired XHCI interrupter number to use.

What does it mean? Interrupts are defined with "interrupts" property, so
you need to explain more.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - '#sound-dai-cells'

Keep consistent quotes - either ' or "

> +  - qcom,usb-audio-intr-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usbdai: usbd {

Generic node names, so dai or dais


> +      compatible = "qcom,q6usb-dais";
> +      #sound-dai-cells = <1>;
> +      iommus = <&apps_smmu 0x180f 0x0>;
> +      qcom,usb-audio-stream-id = <0xf>;
> +      qcom,usb-audio-intr-num = <2>;
> +    };

Best regards,
Krzysztof

