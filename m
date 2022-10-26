Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8008960E39B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Oct 2022 16:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbiJZOnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Oct 2022 10:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbiJZOna (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Oct 2022 10:43:30 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A6210453D
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 07:43:29 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id o8so11608792qvw.5
        for <linux-usb@vger.kernel.org>; Wed, 26 Oct 2022 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnKhLwyZDqcY5dVO7btuDF3qFwXKi9mIT4FnRXd/4qY=;
        b=E64LSXiDE1iS0OwMpwYqL+Rw3NRn7/xCVYsJaVtttR167s4XYoTSmuWWovnkByK7wf
         4zmzTsUGLebfCK2866jVmp/XsbFQZQG8EbOLFV6PPQ97zdcXs1q6AlBWLPEIez4IM98b
         Y5vrnxER1o/pvBuKLKDf22JH6zxm+koxQmjOq7LAg5eIIDnbI2Izy1wVwlwzzFcn6Ztp
         f7OTc3Zwt0GouOkT4GHqUj6LVWasCHF7hCmlr7RIjyO2VUQLYPO8VWdZz5V7Lk1sSBsH
         tFBcVdsfoqzB81DXwZzQ1tqECjryEdrjWKYwoM6vyjpEp7kTSqruyYAaDXiPrNFExBlJ
         BZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnKhLwyZDqcY5dVO7btuDF3qFwXKi9mIT4FnRXd/4qY=;
        b=xoaKsiLnN0KpcPSME9tkKBFzWJ0KbwjrsGwUSKBpsD80do3QDvqCpbCZ87vIjr/Yg3
         Y9bDKsGQghjnAl6iLaJC8jzhgUYtiTbwChMvdlWCbA7hVVX0JWyDUTMlEE4nbGUPeMad
         UG+YufB6X1zH0TlNiSwAEF1381PQ4gq6APQeVn5gncdTTlPUiDjkOYrcTzCmoxlLG7fM
         VmTaEb7CmcRyJswqtAZjY50xwwPYnxRqXVix2pP0Pf7/2U1Wz8o4r72ycNqfR66p27wC
         iJ5vDzoY18KrsGYaMb7B/IiN+mW9JQ+fkusq9s/XW0ap2CZlcmDbpTCSazsgIxoSdYL1
         lbPg==
X-Gm-Message-State: ACrzQf1KJPLLcCMfUPWCoYyn5cq3EffH/qqg1A0cvtds6J8+he7dXj96
        J4pjBphx3MDOIQsW3R/IJRLbmw==
X-Google-Smtp-Source: AMsMyM4DiPwZGmgr+yX2eV+ULd0XPcgczVt+E8OuTN4Qzt8bYS3gBQ3a4d550DCzrmMwghVLuXu/ug==
X-Received: by 2002:a0c:e18f:0:b0:4bb:5b84:fb2c with SMTP id p15-20020a0ce18f000000b004bb5b84fb2cmr21374733qvl.28.1666795408467;
        Wed, 26 Oct 2022 07:43:28 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id a25-20020a05620a16d900b006b615cd8c13sm3785645qkn.106.2022.10.26.07.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:43:27 -0700 (PDT)
Message-ID: <b6ee06f9-8ea6-60f5-a670-42e9e1f1ddbe@linaro.org>
Date:   Wed, 26 Oct 2022 10:43:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: usb-nop-xceiv: add wakeup-source
 property
To:     Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, xu.yang_2@nxp.com
References: <1666764742-4201-1-git-send-email-jun.li@nxp.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666764742-4201-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26/10/2022 02:12, Li Jun wrote:
> USB phy may be a system wakeup source, so add wakeup source property
> to keep its resource (e.g. power domain) active to make USB remote
> wakeup work.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

