Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67C1659352
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 00:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbiL2XiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 18:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234335AbiL2XiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 18:38:08 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7013F1758D
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 15:38:07 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so48161773ejc.4
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 15:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vpODbbW8nv/1gmrzoOYAs/3zgZuLXQsZO+5Y3msoUU=;
        b=K7yPI0bqehDYYKmfM5pZ1XgC4V47yDWUlIWB8GHEJhQn/TDttLg7lDZ/EZjdkAQdVi
         vZQFwcOky+GluhCFel1lIXQKkeHHgbDgu1sfzQqUNil+gS9rYztr8zIgsvNZMok5Oqsn
         Wo+lPiB0IYThjUgYy7OrRjamQsmLlYf0L2kdV//k/f3W3h+RPPvWHdOMJgMxQvQM1oMq
         2/IagqkbQ7hV6fHFE309gqleJ4OpHATAmDpd2XRDNJm+oLwHu7D5fLAXYy3eGhUP+IEb
         6nQ2XuDj/SEzWistc2eWiPT5rD5351Xtl40w6t1i6s56cFt7wHZzNNdKgVeMo7sumbgN
         kTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vpODbbW8nv/1gmrzoOYAs/3zgZuLXQsZO+5Y3msoUU=;
        b=aa0AvemRpcmk70/WUVzhtHY7wRCG6JSd31rIkBoZ5rN0OY6nyE7BgWWRc1Cwlo4nhU
         TBsKeapg3Q0I+Bwy2MpjxmIeRVZhytW8BpWHbwe9SlQsJURkd0cZeyGq+DoB1pEAsYvx
         ajcNsLgLMguBM7r0FnoTrjWHIQtwAl6DTPBOumPAeYil8C94d61ZC+phVe1yTN0bN42u
         TDpXrPriADyOxQrffpiZTC016q7QJdLOQcDYu4+iiqLHzoW3Utykn6LHY4nlTrJb3FMK
         qRHb5CCGF7Ave3j9eHjjYA/bD9GewabyfYxMSgXXW/kYipmSnUl4XAZOieu/auNu3f8H
         hjLw==
X-Gm-Message-State: AFqh2koMRzZES8cGvm1iPea/bSKj8eRgJvhlZm1GGIB/ivEOosgFzNHF
        69eQyjX4HUI3RWcNcVZHY61MYA==
X-Google-Smtp-Source: AMrXdXtHDddptb63umIGoRiuWh8e+jb0yppN9RIWyWkJa+ed5ZRq8TA9Y5v2Z4xFLMqrd4IgIwysPw==
X-Received: by 2002:a17:907:d10:b0:82d:e258:fa55 with SMTP id gn16-20020a1709070d1000b0082de258fa55mr30292942ejc.36.1672357086039;
        Thu, 29 Dec 2022 15:38:06 -0800 (PST)
Received: from ?IPV6:2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f? (2001-1c06-2302-5600-12a8-8cf4-e3f6-f90f.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:12a8:8cf4:e3f6:f90f])
        by smtp.gmail.com with ESMTPSA id q26-20020a17090676da00b008302732f569sm9071899ejn.78.2022.12.29.15.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 15:38:05 -0800 (PST)
Message-ID: <da671da3-61f5-ce4d-05aa-76f3f6ae12cf@linaro.org>
Date:   Thu, 29 Dec 2022 23:38:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] phy: qcom-usb-hs: Add qcom,dp-manual-pullup logic
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     agross@kernel.org, andersson@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221229183410.683584-1-bryan.odonoghue@linaro.org>
 <20221229183410.683584-3-bryan.odonoghue@linaro.org>
 <Y63uSgMdP4m6nvhL@gerhold.net> <Y64AfHcUw192Pyr6@gerhold.net>
 <6061938c-b830-2fe0-2f4d-368e34c33676@linaro.org>
 <Y64CaOzWZXERrvkz@gerhold.net>
 <cdcef656-1ae7-fe8a-a4dd-3547d6395b33@linaro.org>
 <Y64Jgu2o6aJV4ggk@gerhold.net>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Y64Jgu2o6aJV4ggk@gerhold.net>
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

On 29/12/2022 21:41, Stephan Gerhold wrote:
> That is still good enough to replace qcom,dp-manual-pullup though.

But there's no requirement to tie USB_IN_x high if VBUS is not connected 
to it.

---
bod
