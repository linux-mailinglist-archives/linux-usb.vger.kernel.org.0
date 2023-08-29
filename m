Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD1FA78CA13
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 19:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237584AbjH2RCa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 13:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237497AbjH2RCB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 13:02:01 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D051B1
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 10:01:57 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bbbda48904so70361251fa.2
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693328516; x=1693933316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EP6AGfbRBMW+VeI8tnFFQxhk1O1a76tNPwisayTqo1U=;
        b=JPdfP7WY0mVRf4wgdZrnnoiZ2r9XDILaUrfFqqaQDbIQviaoaHweTETBqV1DE4tGnI
         kQ+3qRXSmwi9OGISeaXpK2Txq5/iMRJ4j4NBSQDx0NCDIXns0vX5XH5xCjdI/nWRMEu/
         FAKa+KzLMtuaXmqYOIH93xllPpQGQoYXPXfpCOi44ZxCKoE4q7yKobal3hB0NO3c45nq
         1vn1z44wYovDD/Q429PCHnyEtAXr1HZRN+LxI6v3j83tom5/FPrHekfgq3ZuU56lsEq/
         akfVE/Dy6RfX2VYb2fSS6owbyPcJuTaddy9sEhBbGJcCaiZUg8m0tkry5J4dYs+ebMss
         ndVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328516; x=1693933316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EP6AGfbRBMW+VeI8tnFFQxhk1O1a76tNPwisayTqo1U=;
        b=AFOFWB56WRtrrW7AP0abvr81t8zYuuX/3YSfGrC1VBAE19VBOZnrSKPYriQW1Q3Yl2
         fAl47xfno1CoTWXsGt6Wfn0EEUbxmQmvru2AEX2Kwp7CTwSlTa0HLjQXv0eMP+68W0/B
         n15/wdVRUeLTAoaT01nm4TNiVwu3R9KF8UAP1wBUJupthMDFvBng9u2BMnXuvhRpct7t
         A2DPgyID/kND0uBUqpdNxEuuCoDMYUq0JDZvnBTUy3m1a+/SXSnIaiySk2yzBChrUcW+
         GwT0VqQlA8ooZbxVxvTfsTOjDMEA7IdpkCqcE3zB81fzriqrPmnmxzshxi3aa5IFLKrs
         DuxA==
X-Gm-Message-State: AOJu0Yxx5TpP8mSIl/pG2xAkzTX/wLxu4CwFB8fSUH85XocxA+1wdinT
        YHpUn8CTyySqlil1YlFPUUbZRw==
X-Google-Smtp-Source: AGHT+IE3OrEJ+Qav8G7KcctqPXDx4EUgvUQ16vQX8PEqzmqTqEIR64SN4aeY1QpOd4zUME9kvYBnCQ==
X-Received: by 2002:a2e:9118:0:b0:2bc:da4a:4649 with SMTP id m24-20020a2e9118000000b002bcda4a4649mr16649067ljg.22.1693328515638;
        Tue, 29 Aug 2023 10:01:55 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id t18-20020a1709063e5200b0099275c59bc9sm6211811eji.33.2023.08.29.10.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:01:54 -0700 (PDT)
Message-ID: <5ec0730e-cc3e-2cd9-4ee2-ff00847fcd95@linaro.org>
Date:   Tue, 29 Aug 2023 19:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 5/9] dt-bindings: usb: dwc3: Update IPQ5332 compatible
Content-Language: en-US
To:     Praveenkumar I <quic_ipkumar@quicinc.com>, robert.marko@sartura.hr,
        luka.perkov@sartura.hr, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, vkoul@kernel.org, kishon@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com>
 <20230829135818.2219438-6-quic_ipkumar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829135818.2219438-6-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/08/2023 15:58, Praveenkumar I wrote:
> IPQ5332 USB supports both USB2 and USB3. Updated the USB clocks
> for the same.

Subject: everything is an update. You are not updating compatible, but
adding clocks. Describe your changes properly.

> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

I think I repeat this third time to Qualcomm this week. Split unrelated
patches touching other subsystems to separate patchsets. Please share it
with your colleagues, so there won't be a need to repeat it fourth time.

> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> '


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

