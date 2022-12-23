Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48973654D35
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 09:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbiLWIIR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 03:08:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236020AbiLWIIQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 03:08:16 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DC432BBC
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 00:08:13 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id z26so6135856lfu.8
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 00:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWV+mX9XaEYOci9c4xzPe42/Ks3lsj8QV14AVfOY9wI=;
        b=OMuCyF7DLd2mymoUdzCHiPm3nR2+ZIqrmYsjRyiHNgJ2iImYLYoAGnIw52C62t7EVK
         gJKc6HxkRkZiPz0y7SS2LeyeSkAD+bJ/zVbfqsZwd/2bOI84XQr8dgQgAUGRwfoZR6ey
         LbaWeSWvTdEuJRF49b3o2TWkr9Ld9ZKdKLyVVygtyBdw1v8IjOl5j7K366ObtfTPJGki
         sxDPdpqJcQ3FwxwnEGhWVfQI/KyGQMXXJvpaz3uqXcIIxuqOkNRTh0DWdTS1PBGEQWCQ
         KYEnugCxNIHOXJ3rTlnfxELVxaduorYKI08BpOVsojdI1T3T3vsaDRfmDV7z/A0yvawf
         8Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWV+mX9XaEYOci9c4xzPe42/Ks3lsj8QV14AVfOY9wI=;
        b=rmDgTipA1djXhu5PhzQla9y/gSoZgPrHrZ6WXZFMRAAoLsfrcy82Zu/ISpgwvFirYy
         IjnSufKuy5JVq4ORmV1SRhCJvFRDPQuL1PXlP5/Ef4+LfW3L/WPALFyjn9SRuDoNEw6q
         NI2lXhpfl3tGfycP7fc2UxCCeICdgsTVKwcTekpYLN8zJ+o8MSNzShyDcTF+1S0xhoTy
         lTVug+7oBi0TLd1JIThk6DBSlqjnTSOGydJKXxdt3sYmr05jCkE23S6jYMWY2ZVEigsU
         bG6iI6tfFBRJFOaJG8CDSJH03zx8QA/kesWExze3uL3V35LkMFvRMfNPhuC4Ngw6+5jQ
         UW8A==
X-Gm-Message-State: AFqh2kphoNAkQ/Sk1gG/8UC06QxGGb00tae6ABEz4R0IzEtxlpNpbnqH
        UbRV/YxLDSh7vrs7AxXXTkvdVw==
X-Google-Smtp-Source: AMrXdXsflFEH9BteTL2sR3NL4YAGohVHBAwfZdRJlrtvheanNZKDUALwa3cKqS0jIWoVh3ZcaW48FQ==
X-Received: by 2002:a05:6512:23a5:b0:4b6:f027:2af8 with SMTP id c37-20020a05651223a500b004b6f0272af8mr3265796lfv.66.1671782891516;
        Fri, 23 Dec 2022 00:08:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e9-20020a05651236c900b004b56d00b2d1sm420235lfs.285.2022.12.23.00.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 00:08:11 -0800 (PST)
Message-ID: <b4c235fd-08fa-c151-4105-147083681f13@linaro.org>
Date:   Fri, 23 Dec 2022 09:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: ci-hdrc-usb2: add i.MX8MM
 compatible
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223031012.92932-1-peng.fan@oss.nxp.com>
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
> Add fsl,imx8mm-usb compatible for i.MX8MM
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> I had a V4 patchset to convert the binding to dt schema, but we are in
> the process of ARM System-Ready 2.0 certification, directly update
> this binding doc is the easiest way for now.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

