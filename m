Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3619F643E68
	for <lists+linux-usb@lfdr.de>; Tue,  6 Dec 2022 09:22:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbiLFIWp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Dec 2022 03:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiLFIWn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Dec 2022 03:22:43 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9211B1E
        for <linux-usb@vger.kernel.org>; Tue,  6 Dec 2022 00:22:39 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id q7so16347890ljp.9
        for <linux-usb@vger.kernel.org>; Tue, 06 Dec 2022 00:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJbdOZupl580ZQnipM7/rZhVrLHidmlJrwN3qpwkXsU=;
        b=Fezlkgz9ZmwoUdx5wNirGzZ1G7y+H71PivmUr1qQfYcfMGRsv/67Z6J8RUzL7Akcsy
         3DGVkL3CG3SnNHLLkwdoIa3GiQRAXiNSBs08h9V4OvrxNhYGNOX3TFBh8qrx8Owtbhmp
         lCtwy9pZsuvv0PDQClV+ybfMud3BlVJ8T/SH9xqkEdtm1kLixVxj47wmWzvdbDYGoQqz
         eA1UTFRn7ZeI0ndBgJ7p7gM+mALHxoASw8jL/rpKwKyOCUO2To4WBXhTCS7csThodn0y
         JyHLoq0u9A6r3Hjh/vu0d5R/rEaa9q4Jah3nW7T8EonNkX3bWlGSX3hegLSEVB58wR3D
         es0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJbdOZupl580ZQnipM7/rZhVrLHidmlJrwN3qpwkXsU=;
        b=6mOwEb/DOFDAAYMdUicRNa9nFNwuQY+/xUJfZh2vOX049MMooGVyJP7tKTPP/D47Ji
         9mc3EMAEWz9kIR2CXCi0q+z0R2av5PPnmNjDhdnYz1wet/Zw1SPfLMIzjdp3PrGHBmfp
         D1mtICWV2lMdb/M4Z3CMaFSDb39b1ljICw+KX/w5FseN0ISUDWkhJr+batIbkqW3u+3/
         d1Kseh2MQoOQD6GpyZBw+v9ZumwBuu4pwiK478jyH7tIbltfAYZcADGYY3ldzcSJyTm4
         tnLJk/Lni9YxTl8SrXQcgHaGYgyD60vHVLvfirN7IP++kvS+9r8ITaKMFZ/+m0PvMGUU
         yRlQ==
X-Gm-Message-State: ANoB5pl8ouQGsfadEiGrc9PDBaYW6omUOGn7tN8s4BCnZmkABgtqAzgI
        Vsw1Y98YngkPt1KobFyqmj+MJxtvsNz4zXA4CFU=
X-Google-Smtp-Source: AA0mqf4OymOixUgOb7slcZLoIcSq5wa584Qglf9rt4lj/l7R8uYGMZB8PgUCEvxrirRV38777UTeYw==
X-Received: by 2002:a2e:9884:0:b0:279:fe8e:2848 with SMTP id b4-20020a2e9884000000b00279fe8e2848mr2332223ljj.188.1670314958177;
        Tue, 06 Dec 2022 00:22:38 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c9-20020ac25f69000000b0049944ab6895sm2407853lfc.260.2022.12.06.00.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 00:22:37 -0800 (PST)
Message-ID: <9d32cf45-c506-8990-a14b-004de520a931@linaro.org>
Date:   Tue, 6 Dec 2022 09:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: Add binding for Genesys Logic
 GL850G hub controller
Content-Language: en-US
To:     Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20221206055228.306074-1-uwu@icenowy.me>
 <20221206055228.306074-3-uwu@icenowy.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221206055228.306074-3-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/12/2022 06:52, Icenowy Zheng wrote:
> The Genesys Logic GL850G is a USB 2.0 Single TT hub controller that
> features 4 downstream ports, an internal 5V-to-3.3V LDO regulator (can
> be bypassed) and an external reset pin.
> 
> Add a device tree binding for its USB protocol part. The internal LDO is
> not covered by this and can just be modelled as a fixed regulator.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

