Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4695FC5FD
	for <lists+linux-usb@lfdr.de>; Wed, 12 Oct 2022 15:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiJLNKw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Oct 2022 09:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiJLNKv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Oct 2022 09:10:51 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45B37C1EE
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 06:10:45 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id f8so2959555qkg.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Oct 2022 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C7G2Yq+rJ1ZhtKUz9+hk3hjumuAmKCtJeLM6FaHLR48=;
        b=EBBu9Jumc1NjlI14sXDx18bN/BhlEoRIemgjAThwEMFR4FDMdr837XPmF153c97kiv
         KgcAuD/nM2Euj12kgMiaOXwAOTRq++/xwzxIHQmpe6xRr1dqHJ9MqCeA0wdscFQgL02T
         CF1Hk19v2NS1ExOdWA0ZFZYbLAmAIWU+Xr5GoCiIpHRVVNzhVvWjKtRJH29P+eGXrADl
         6nbKtAfmckcRubnodOptTE8/cnKXnI8/6vjIoMXu3UUADv+mF4+YcqeTq3/VO7ndRtX1
         hOhdAW3sgs2C1nkaSDXIr6P4rIAH1T94fuJJEAZ3zc7ZiMBzfB3S499/GZOz10ZE7NX6
         cigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7G2Yq+rJ1ZhtKUz9+hk3hjumuAmKCtJeLM6FaHLR48=;
        b=SzMJKRb6EQMdICwcsDbjYfrYUp1P3TKSKd7kdwuju8KF/pqVFSBmSbEygDfuXZDfq4
         20AgXvbGQBkhUTAPCuCBw4iFnK9zHxEPMQsBQjFuER56/W/OGoFuGp/PNshJX/48Et3/
         Qs6B5wbA4sz5pgV1blzOnFd+ory0Pan3d3K9kENnqI/aMhLHITJuGJVZrikaeTlavQjT
         jbGQqA5tTlqt3h/tU34s5B2u5CxZ+vHkaY4OC+r+7R1FDRx4i4JVt1e7Yer6IQL2KuSk
         fChRPZG9ND6j1+EZn5NAWtHGnfLhk1Y0P0SslsuDJJzUw9YJ7JPVu9Zf4MlVGkwi6SnE
         ZNsA==
X-Gm-Message-State: ACrzQf3hVlUEqIzLzFA2wz/Os447CMC4GTxKSZtjK1E8vmaoaePdp3q8
        vgx85VAfbvb9yYPAtjlyh7w9Mw==
X-Google-Smtp-Source: AMsMyM47s2HEd/ei/G/HHcLx+xnZuL6fbjDhrLQjxBM2msx4b/k/ATJETtbWtIuy6tjp4xspUJ11Ug==
X-Received: by 2002:a37:2e84:0:b0:6cf:8dd4:7adc with SMTP id u126-20020a372e84000000b006cf8dd47adcmr20148712qkh.723.1665580244143;
        Wed, 12 Oct 2022 06:10:44 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id br7-20020a05620a460700b006e9b3096482sm13642940qkb.64.2022.10.12.06.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:10:43 -0700 (PDT)
Message-ID: <4e5ed6bf-8af1-d8b9-b89a-e9207a6ea756@linaro.org>
Date:   Wed, 12 Oct 2022 09:08:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 03/10] dt-bindings: usb: sunxi-musb: add F1C100s MUSB
 compatible string
Content-Language: en-US
To:     Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     soc@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20221012055602.1544944-1-uwu@icenowy.me>
 <20221012055602.1544944-4-uwu@icenowy.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012055602.1544944-4-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/10/2022 01:55, Icenowy Zheng wrote:
> Allwinner F1C100s has a hybrid MUSB controller between the A10 one and
> the A33 one.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

