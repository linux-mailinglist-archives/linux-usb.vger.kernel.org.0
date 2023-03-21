Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8769C6C35E2
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 16:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbjCUPjW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 11:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbjCUPjJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 11:39:09 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFEDA5E9
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 08:39:01 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a32so15948018ljr.9
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679413140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWP2ph0M6Dxxe0lHeRqTKQNZfKUBhP+hcSeJ9cU6CPo=;
        b=DCNUeJyRJ2l2Nmh6vR+vyB7WWJiHnYGRKcjvtDrr9CC3h5qMhBXRXx+q9XOW6k8uH0
         JPHHCxTYNBQzUbknECCjrABMKkO9fMWID+kSC1Sx9oHbwILtFyYpoizP+kqjHuDlRyAC
         NNEqyUErOUZB9wnn5kv2iVWEq5pQrOpOGJBDn/vXOIhKPh/0oSo5Dgv2clrZ+wdeY06j
         iZS1R3E1hF8qQX9X4gBxKZiNcY/UqDGy0jcMc3mJRnVc421TpR9Vy6cU2T+IaUIYLiOx
         QEHNOMQgKgv62tEN7XzOdP2XyAyHr5c3WoR+JFms8U6rg3WjEdF8vvGY0L6nCV9BWTyI
         aBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679413140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWP2ph0M6Dxxe0lHeRqTKQNZfKUBhP+hcSeJ9cU6CPo=;
        b=fF64UxZy83d6pEMa5wuLkDKyGwppj65tKEWSBv4CRS+xULrAgTELK1U65pGIQSS7Xg
         AX0G0mMXsbqgn2mIcHsXGgRtLqGFJCZ5tJj+Sjo/RLDCwSga+4U1vcGh2DCzPsaxRRcM
         xjgn7jUknBQqcd0gjSb2QqNgmh/sfLha2h4XIJB52sjYPCiL5zgWJF6NQRvtk/Vdeuo2
         5ldUZUF6xheEwHLsgd59GF2MEAQVlRBZVUdUfxct4LOHUbke3GuOejptU16D/sD5pUxa
         CZEFCsHeLFI/+C+kQyh/y+2A7dNIVEcKuSLBaKllbgFJV18aUgW0uyhJBP0QzBRtYVVy
         NhKQ==
X-Gm-Message-State: AO0yUKWWyO0uqZIdiVf/aVdKK/OEip4ThsRYNebgiW+PK8YMGhT9mcgP
        zCyqeVwKXBOTHNQPxm7u/nAn8Q==
X-Google-Smtp-Source: AK7set+QouC4Xlc0D6msR+OSNNKaFzzruJKD2vBpGM+q9GQ03WlvV0NxqoCzKXG8twHpGrxssN3FUQ==
X-Received: by 2002:a2e:3516:0:b0:299:cf0a:bf8 with SMTP id z22-20020a2e3516000000b00299cf0a0bf8mr1043784ljz.17.1679413140003;
        Tue, 21 Mar 2023 08:39:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o22-20020a2e9456000000b0029caabd3c7asm1031027ljh.54.2023.03.21.08.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:38:59 -0700 (PDT)
Message-ID: <4e8357fd-233b-5d4d-6153-433c52e703d0@linaro.org>
Date:   Tue, 21 Mar 2023 17:38:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm8350-hdk: add pmic glink
 node
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
 <20230130-topic-sm8450-upstream-pmic-glink-v5-9-552f3b721f9e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-9-552f3b721f9e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 21/03/2023 15:21, Neil Armstrong wrote:
> Add the pmic glink node linked with the DWC3 USB controller
> switched to OTG mode and tagged with usb-role-switch.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 46 +++++++++++++++++++++++++++++++--
>   1 file changed, 44 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

