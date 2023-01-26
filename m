Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36BCE67CF51
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 16:09:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjAZPJL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 10:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjAZPJK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 10:09:10 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03851554A
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 07:09:08 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so4101614wmq.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ajpze3MQAtAYvqF9cQldA9cf7OwdmlVDcuG8wHeoRgs=;
        b=FYSBmhD19DPaZ+sYkioR8rvsR1S61pjCm2F6hhPKO9Wx6aQe6lG7AKj6WZ/pbnqifH
         erq7dkFAAnezOLndNVdIhyFxmpWo6gtG/q5n//0JUQe+qPFfFXZXoeKXpcafhfOJO6Rp
         h2OubWFiQ4j7ObP2RFI3WJMzzxY1p+m9zRUhcBSLYVSs7md26wfTJoVJQHyM37kyN6ZP
         WHDuLaKPrO6jqyFNh+I4wf1ZjuqUyn4uto8kBOxptMbq+5kDHkGcKI+N3aFKP3UwOCPk
         R4ujUrAa7WTfU7Yo4RXVGtj4ViBKak1EFBaoTAD1+sE6LStM1qHPI5iZfaYqGbuzH3Y+
         0LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajpze3MQAtAYvqF9cQldA9cf7OwdmlVDcuG8wHeoRgs=;
        b=wVTL5kjKUkUpugLBNad5rztruzyQ7jDhN/JacFucAYv68BXfHinb2C8h1PS+4Hp1C5
         iFq3s1tOVfXRHVv+84odCCGklD9RxuZBHMpVgqiacm43AA/poSYTIDeTiDpHg9HZGKfQ
         osXgNqbKEq6cFbplGufS5jws9O/vC1pFq3e30yfZvE49ihT7+DPkdkKrAVtSIsRWkEqQ
         GpuFcL/G9DFwc98+5Ev2GlU7uMXbDueoS/8fSgz+Bi9WZg5imJ5mJitxE/swx44o4vjC
         LHwFbdgFF3J71uSzc4jmkv8nkwwb8dArzLHbqn0eVb9CLZN2KDl5NWESoFj5FiqtDhhs
         REMQ==
X-Gm-Message-State: AFqh2kqvZb0sL7kyjNzlggdLAshUM/yPwxh5ofKz1FStS1ozjdfMeniK
        K7moWlMCxUMvvsATrWNGCJfRPw==
X-Google-Smtp-Source: AMrXdXtgFJtcW/CyDSscF5zX4thhHfrzGW2wYzmuzbbfzlkbA0G2ExYJ6Y5m6PB09MYvx9PJPN8JNw==
X-Received: by 2002:a05:600c:3b02:b0:3da:1bb0:4d71 with SMTP id m2-20020a05600c3b0200b003da1bb04d71mr43595511wms.11.1674745747349;
        Thu, 26 Jan 2023 07:09:07 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ip6-20020a05600ca68600b003d04e4ed873sm4834628wmb.22.2023.01.26.07.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:09:06 -0800 (PST)
Message-ID: <c27b5fc4-9153-0682-38d1-65b4adf14082@linaro.org>
Date:   Thu, 26 Jan 2023 15:09:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 10/22] ASoC: qdsp6: q6afe: Increase APR timeout
Content-Language: en-US
To:     Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
        perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        Thinh.Nguyen@synopsys.com, broonie@kernel.org,
        bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-11-quic_wcheng@quicinc.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230126031424.14582-11-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 26/01/2023 03:14, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index ca799fc3820e..41b4871e2ca1 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -365,7 +365,7 @@
>   #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>   #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>   
> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000
>   #define AFE_CMD_RESP_AVAIL	0
>   #define AFE_CMD_RESP_NONE	1
>   #define AFE_CLK_TOKEN		1024
