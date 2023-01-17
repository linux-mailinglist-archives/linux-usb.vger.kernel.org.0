Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907D166DC0A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 12:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236766AbjAQLOu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 06:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236762AbjAQLOM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 06:14:12 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD2C23DA1
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:10 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso1126667wmb.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0svjkQXeqPPjfTGo80xgwbPJSj0KECAWp6boTThWzEc=;
        b=zADoNCw2dyfUnX7gsWHTrrB4KC6ecW1Z+gdd5K1wA3H6Ozv4mwBxOsDhZVCoTMTpU9
         /U25CswXBmlA0dDur+rJn1L4/CKv4YSAiHBJshfJXUXI0U3rfPAQpjYO/OlsWHIwEgZw
         sqi0tZ/XGGkeYKu+NaYmmEdyEzKNwP02G0wilSx3rGqyRMYJizpK7tMVvjGpRm3jfdkj
         W9Hvg3Bk4Dux/cG/Zus5x2M295od+F1vyJuGdWbSjBM6hEYyrGM5CUUh8GVAk23pBezb
         nB0H1R2aPxYWG5jI6N1SWyKTPHIpjk7zuQDER9EZIhxidNQFrC2EAvdEUcuecYE1ICRH
         BEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0svjkQXeqPPjfTGo80xgwbPJSj0KECAWp6boTThWzEc=;
        b=ysLGRP7WPhTixzfWKxVp9oFLQobmpNy/iAtHC314HcsdZK/BF6pitSgZPJano8PsvT
         9PgfmPwJMlT+1EmwYQxfsVm3a7HxelRPBcaaLzvSGao0dfymPW9twwnhH8YVzVjIz6x2
         d07jgOeDUxitQ10I2josg5AHT2+DQn5IlKpuah8swdO0q5Ay1smsA1oiYbpl1G+Ny6QZ
         qMKZKayQK0p3M2r5JPo1gA468qKBkTdaDRLhMtV1UAHMAdcrCv6ellznbx5jfB4pgpmH
         9gs1IebZh2wxCuQB/lfoC4AkT8T/S35dSe/W+I5WaQZ0xGWoudsqqvhYv15as6IBaqrC
         OfXw==
X-Gm-Message-State: AFqh2kqsLEr8RtuAUkWWzCWj+LIEpadQxmQrZkwni9tIa3zEKo+Jufp6
        345+ww5DYIIWRjHSm8Sh4Nah+w==
X-Google-Smtp-Source: AMrXdXt0mz59bBj1Vmfnj5s25BOFWemhZ4FDzyq13LuJ35KBy2jXyRhrLxPeGcfx3mADH4PuLyagug==
X-Received: by 2002:a05:600c:34d5:b0:3d9:e9fa:657d with SMTP id d21-20020a05600c34d500b003d9e9fa657dmr11297281wmq.22.1673954049153;
        Tue, 17 Jan 2023 03:14:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id hg9-20020a05600c538900b003cfa622a18asm40244158wmb.3.2023.01.17.03.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:13:36 -0800 (PST)
Message-ID: <489fa3b4-7659-d916-c467-4f418d8e0eb3@linaro.org>
Date:   Tue, 17 Jan 2023 12:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V4 3/5] dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC
 support
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230116145452.91442-1-jonathanh@nvidia.com>
 <20230116145452.91442-4-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116145452.91442-4-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/01/2023 15:54, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Extend the Tegra XUSB controller device (XUDC) tree binding with
> Tegra234 support.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

