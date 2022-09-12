Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDEA5B58EB
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 13:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiILLAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Sep 2022 07:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbiILLAC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Sep 2022 07:00:02 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA72D12AF6
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 04:00:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u18so14186282lfo.8
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4DmliD4/zIbuq1/hYo/pvsJYEUacMOuT576x7WYBpkI=;
        b=xYUh82Zyx9wOjMvPUvP+6d7lEmi4uSdWgPAbfRDS31BFI3WiHx1bLSVHb04/dG4Xjt
         Oz0XaMRqI+RVrljbCSOuNVrEXkRG6q3MW/uEvM5yMMIhf8rOP9XqaO6tvsqfkGdWAgNl
         YOPs4EXq7jJo1pJe+u3F9jG4xAJOnlBk1Ng++dbH2681nHE3h5HyiBiJS0997Sc6nZvq
         V/alJlR3RKx8runQp//qjUyRQL7hwXkgJfs/Pj+qPAbWTfgmLxWtnVJjAmhPV6/Pivla
         5WvQaYYrwngfOq4GFdJDVGptZt+d7WaDa8SGOzspQ0HKtlyGhwmWTkHzuZYCGTsWlfXb
         hxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4DmliD4/zIbuq1/hYo/pvsJYEUacMOuT576x7WYBpkI=;
        b=kKmYbEtYoHX3yZe0uBMgSJGK+MlCGj+NBwNLtZ+vB1+qNhEHlc2cTjbg4j+nrqeqtH
         xSOX0xkr4azhg8mj80kYmOKxX/aR3v6VWALJqZ+KF6qjzmLDXPywz0Kql5bt8+48L+9S
         W5ULtja2vqfStl7pK469fFeHwTxqMrYSlYHmbUF0szwad30CP52q/y7ViucoNdZHRLUz
         YB/8gOUCFKyaA9ynhLLHKAVdhEcPsqZX+4y9rgMRfVOnqerhDvL8GVKjFY3HnocjPhEA
         y69g1FtK6GA5opL7VNnuM5QMGAJq/dUPOf62lc5GDZwNQ8bBx7iZJyMJ24zzUr/3F4Vz
         6Kcw==
X-Gm-Message-State: ACgBeo3EqNfGa38yCqJvD5IBa2rgaOMQKO6KcKKZdVO6XAzzSXoFSI0t
        +Xs+JCq+6dS4ohdpDozfG4aoKw==
X-Google-Smtp-Source: AA6agR7JWVX4/4qKNWe/mwV9K0XiykbUAzUfMg4rLs8KCX/XP+IHWn3pNWkdAf9vO1D8pXUcvatRGA==
X-Received: by 2002:a05:6512:c18:b0:49a:d44b:435 with SMTP id z24-20020a0565120c1800b0049ad44b0435mr1144873lfu.468.1662980399214;
        Mon, 12 Sep 2022 03:59:59 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id s15-20020a056512202f00b0048b003c4bf7sm1002592lfs.169.2022.09.12.03.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:59:58 -0700 (PDT)
Message-ID: <0826b754-4027-bda3-b8ab-06dcb7292c90@linaro.org>
Date:   Mon, 12 Sep 2022 12:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/7] dt-bindings: usb: Add H616 compatible string
Content-Language: en-US
To:     Andre Przywara <andre.przywara@arm.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <icenowy@aosc.io>
References: <20220911235945.6635-1-andre.przywara@arm.com>
 <20220911235945.6635-2-andre.przywara@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220911235945.6635-2-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/09/2022 01:59, Andre Przywara wrote:
> The Allwinner H616 contains four fully OHCI/EHCI compatible USB host
> controllers, so just add their compatible strings to the list of
> generic OHCI/EHCI controllers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
