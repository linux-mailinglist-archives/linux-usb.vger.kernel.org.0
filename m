Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1DE654D39
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 09:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbiLWIIX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 03:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236020AbiLWIIS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 03:08:18 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85E432BA7
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 00:08:17 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id z26so6136097lfu.8
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 00:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X9fmL40uZQZd8NMrOM1RllY2IuZaz4ExJU0LisA1NTY=;
        b=a7G3UzchGK6HfW8G+mqFcyac2IGzjKzgkgIDC9JeQPziEdaAu94HsD4AahH+MoU02X
         pwWoWl0TfVC0eZuRAEMZvlJ39ibROTPDZFqMMTb4k0kXGB5T4tJk7K1QK7E1Mnw33WUW
         zfJZhS3JDfZXkrMtcEM575dKWfEPD/6ErahHLutG+uJAn5o5BDHM0xkq4hJPXN1mLRAT
         09loL4h1KjPaX5jpwLmOD5XrX4AxQ8PVJWWAcNFadBL87KuqYreX/JKAbwseN6fAcUaX
         My3xgWSmv3+5QUmItVeprb84cbqKPAfFElHIq91t2Edau4fwEHK2wOdMXpBZnhwvEx/S
         9AMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9fmL40uZQZd8NMrOM1RllY2IuZaz4ExJU0LisA1NTY=;
        b=rtZryCAOCQpRG2FTl57/3iDdZf/097r6vtiDCgeEZ7B0tFOOgrSyktJDoVeTj4w9kG
         5SJS+f7N9JRR8spm9xiLi3K17Mg35+DrBSmDvATxpdCVRwJwL8SyAp28Yn9nErmJA6oi
         8fhQGDphg4+KiHJv2pkfjE+T5V006E+PzuoCFKf5jM9HuWuyrZ+eYddvpYOOFvFs8Dcu
         ooaysfhDutsx1UvEvDTWLmT77wbCUz0C0CNsWBEIrgwV7YKjDd8O9KXua0BIfstgHaZl
         dGW/FA0P2xc1GDO9JEBjlPJ1PCatS5Vr6IplLf4QX/MWIxQbbMiBg7LxGvKEvfOO6KK/
         LKLA==
X-Gm-Message-State: AFqh2kp+m4HD5214HFpxp5K4QBoKBZvJYoCwwyFzXrzNU1yFiJLyfDI8
        dRmWsn5r8oOZuG1W0zU9op2FGw==
X-Google-Smtp-Source: AMrXdXtR1VuG6FlLfJiP9OjNk1C6SAQrbTzW1kPdX7JAUYyPm1XB5IzBjJg5N3gdF/ksD3wRSVfSug==
X-Received: by 2002:ac2:43cf:0:b0:4b5:3621:7ecb with SMTP id u15-20020ac243cf000000b004b536217ecbmr2507056lfl.63.1671782896050;
        Fri, 23 Dec 2022 00:08:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d1-20020a056512368100b004aa255e2e66sm420115lfs.241.2022.12.23.00.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 00:08:15 -0800 (PST)
Message-ID: <50c4e2a2-e43f-532f-7977-959bbc0eb468@linaro.org>
Date:   Fri, 23 Dec 2022 09:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] dt-bindings: usb: usbmisc-imx: add i.MX8MM usbmisc
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, xu.yang_2@nxp.com
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jun.li@nxp.com, Peng Fan <peng.fan@nxp.com>
References: <20221223031012.92932-1-peng.fan@oss.nxp.com>
 <20221223031012.92932-2-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223031012.92932-2-peng.fan@oss.nxp.com>
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

On 23/12/2022 04:10, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add fsl,imx8mm-usbmisc compatible for i.MX8MM
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> I had a V4 patchset to convert the binding to dt schema, but we are in
> the process of ARM System-Ready 2.0 certification, directly update
> this binding doc is the easiest way for now.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

