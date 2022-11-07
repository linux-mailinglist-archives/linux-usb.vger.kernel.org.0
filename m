Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE0261FBBF
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiKGRop (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:44:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232973AbiKGRoR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:44:17 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AE72252E;
        Mon,  7 Nov 2022 09:44:15 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id ud5so32209633ejc.4;
        Mon, 07 Nov 2022 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eWjaoBznqoj2kM89mZeHCIKl3bnIdWJhw4wamO+Cyo=;
        b=gQi8cQ8zlsuNHXSruqHBWQD7jzzllZymlS2SVI594uYKR2I2PAK8IcakFFIhp4s0sa
         lplCEl40Iv5NK8qEomSZ2cy2dT8/yxbOf0ZegzW7Itqh3vbYTI5vcrmSCwmdWu49TRZa
         ugoayL7w+pfrzqcrwVljsvaJRq2BaDEQEwOIIPGFQ/p2V0WvBcjfz11VYLswsRuAQqla
         ii7YJSmTazshE9zf1sSJ1Hv559UsUxzgcwgUDKoIF9Ho2yFx+co//WLc7xaKXa6g62T5
         eZLSUZUMAdlB70cagU28SAaXkI35MH7LaNSRCea0EXsT6zX+TtpvUwmZCaV5jpi0Ms5X
         Rhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eWjaoBznqoj2kM89mZeHCIKl3bnIdWJhw4wamO+Cyo=;
        b=dVHevbCocUgVUANXxFP535cwmTr2cE1WxUMDmjMTKURIZHL/Lr3g61rMAPE1oE/C+n
         jl4s0wX+HIVR50wxG9apFHH5wLKdkMCsG9ylS8t1CFpV9nt+5d3AC4H/Bp7EmrgdpqTj
         iFSxsrCopK5TIggWcPOhrgIxs2AkvZN2uwMjNAOSGm5xhHSuKd//zanBd5rKb7PctI2D
         T3kSRowiQArUNaPkRHRusoqsu57BuUa3bQ1DQ/RNg5Qzqq9yr8+SIRhsc1MvcnsGQ0VJ
         YfzcIrAYGWHtGp3SIswT74zhidQ/urbOccpXZDhMJHYnETUcqaPmx3Thy1XHjLtmRPfu
         WZ7g==
X-Gm-Message-State: ACrzQf3BqDLNZiCLyhGWUp/vsVQmm1f/jokSsBHz+BujD5xYKn01poaT
        ufXzXhEYU+tU2Uk9zi8iuZyCJVwX0HDVMg==
X-Google-Smtp-Source: AMsMyM5u1DyyUIQOXXJaLbM+lyY524+zMvhbc3473zPBgeiGrfroqdUpFBfrRcxzqBUKNFxQ4IT/5A==
X-Received: by 2002:a17:907:60c8:b0:78d:bc8d:8457 with SMTP id hv8-20020a17090760c800b0078dbc8d8457mr47448621ejc.418.1667843054363;
        Mon, 07 Nov 2022 09:44:14 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id u18-20020a509512000000b004611c230bd0sm4565884eda.37.2022.11.07.09.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:44:14 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit quirk flags
Date:   Mon, 07 Nov 2022 18:44:12 +0100
Message-ID: <2120524.irdbgypaU6@kista>
In-Reply-To: <20221106154826.6687-11-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne nedelja, 06. november 2022 ob 16:48:25 CET je Andre Przywara napisal(a):
> So far we were assigning some crude "type" (SoC name, really) to each
> Allwinner USB PHY model, then guarding certain quirks based on this.
> This does not only look weird, but gets more or more cumbersome to
> maintain.
> 
> Remove the bogus type names altogether, instead introduce flags for each
> quirk, and explicitly check for them.
> This improves readability, and simplifies future extensions.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for working on that, nice cleanup!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


