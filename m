Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A2465F375
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 19:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbjAESJS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 13:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbjAESJP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 13:09:15 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4171E3
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 10:09:13 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso1922061wms.5
        for <linux-usb@vger.kernel.org>; Thu, 05 Jan 2023 10:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTQXXh/dvztKjFBUGXCZQrUJyMbJ1vzV92prLWcVbIc=;
        b=JotekkWG9cVcUN6JY5FzoA6/kA2g/fpF4KEGZQR4qRVkQrBx7ji6MfDeBlrZKVbtoD
         e1TGJFo8OiWTEB4CXAtheRcgYGPawNmGwECJO2hWU8KgNJbFeep1MeJmDKdLk3N74yBA
         hb5DyDUqepXDN3MaZHPOmpfQBnig6p9rN+pXNnl44HUk+ekcSxSX4NtYeCzbcBYvXIk2
         ZiMVyIAYAM/PdVJBth2HVITnWn8fSH87jNjrJ87Ev2NS4eKnXiUaO4lHvkmSFKawZ4JX
         UZZYgmqX/R9RWhDaZ5oxfXD6cTDLB86HkXBhKC3J3i6VynGfqx6yphTzQN7xXUMpHTdP
         t9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTQXXh/dvztKjFBUGXCZQrUJyMbJ1vzV92prLWcVbIc=;
        b=JcAOx/sMdPveKYj+1G2+/xEt1VTORNg/UNxBbHZ4ggvU0TrZW2UByIywGwL5E+PMXs
         Ryspaqmb2Zlx2074RJUvKIziBVKpm+a61+StrUA5Kbb91TaMbu+XfvXY7LWojZjLB7pu
         R6SHJ3lL8x/6cIrgvo8ltAGwzMJqcETpG6XxfdR2gYRyfBlINjlht+kQro2Z2NeTtNKF
         rRG2aP2YB3HWIoNh64v/WsYPL3xYVkf7DccfYaBrBAabASHgI0/bgsgqUSNhh91puLQP
         bpWtUJx0pl5g0kGJoQuvJW+MdmjaSL3jq9Sx5ToeozqVy8YqWnw0sRiMu5e3xmCKI7+I
         qi+g==
X-Gm-Message-State: AFqh2kpfsIgw2t+j/jHfojkpPBRM1kilnhEGjlkAttuIE6et2/c637qe
        js3AofQ+n17PUqWZfmnLYNad4u6k4H6GgEFE
X-Google-Smtp-Source: AMrXdXtBbeH+ZaXZOnq96Ei2bJF3s4ZyM0k0lkiNPTScKXqcfHEVHc8v7Uqft1oLtnScRAJaxPzzaA==
X-Received: by 2002:a7b:cb89:0:b0:3d2:2101:1f54 with SMTP id m9-20020a7bcb89000000b003d221011f54mr36891279wmi.4.1672942152244;
        Thu, 05 Jan 2023 10:09:12 -0800 (PST)
Received: from [192.168.1.100] ([178.197.217.234])
        by smtp.gmail.com with ESMTPSA id b22-20020a05600c4e1600b003d34faca949sm3211743wmq.39.2023.01.05.10.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 10:09:11 -0800 (PST)
Message-ID: <5b4d657c-1acf-f90b-be64-3e36cca96686@linaro.org>
Date:   Thu, 5 Jan 2023 19:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 02/14] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20221223233200.26089-3-quic_wcheng@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223233200.26089-3-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/12/2022 00:31, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback and capture, so that the
> main application processor can be placed into lower CPU power modes.  This
> adds the required AFE port configurations and port start command to start
> an audio session.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            |   1 +
>  sound/soc/qcom/qdsp6/q6afe-dai.c              |  47 +++++
>  sound/soc/qcom/qdsp6/q6afe.c                  | 183 ++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6afe.h                  |  46 ++++-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  23 +++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |   1 +
>  sound/soc/qcom/qdsp6/q6routing.c              |   8 +
>  7 files changed, 308 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 9f7c5103bc82..746bc462bb2e 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -131,6 +131,7 @@
>  #define RX_CODEC_DMA_RX_7	126
>  #define QUINARY_MI2S_RX		127
>  #define QUINARY_MI2S_TX		128
> +#define USB_RX				129
>  
>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1

Bindings are separate patches. Please split.

Best regards,
Krzysztof

