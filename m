Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96A253A1B8
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 12:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351851AbiFAKDE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 06:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbiFAKCz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 06:02:55 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DBB033890
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 03:02:18 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id c2so1451484edf.5
        for <linux-usb@vger.kernel.org>; Wed, 01 Jun 2022 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SCHPOUMOkaORGlqy58IkS3kpUvVCYFXurWLIORn2AWE=;
        b=R+zX7kVN/rZH7znS8QEbRvDrZjdPSwyJ5JfWczekV05ct6k21Z+QNzRMQ4DT3lLH+P
         YGv+8cYMFCE+D6IKLUrFn0DDIz71NsUdzk0zCCbyKq5E88agPjfsSq/Stk0xXIj1kmbu
         R58MwH3N19BBhqt0epKSgNdhfQsoePTIPnN8tfb4PZgrSxWCngSmYVPbhn8zSOLfO409
         feZfytnIiNSrXWHr1t1ObzSgHFHYxacwrK6r+j43OWyQGwuyGosxBPFpDypkatmsjm79
         Wd/4BZ4RoctSTUApmv410sKQkDwOKVwtvq7OE+MPQNZEl+gZynFZ8eQRrS/wc0PmvUHH
         6JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SCHPOUMOkaORGlqy58IkS3kpUvVCYFXurWLIORn2AWE=;
        b=Rpr43TAwMjJyhts4Wam5aHHwyA8IHtF0oNaTMlJe5MAfITF2odb/+TNVixZe9Pi1Mu
         k9KktkbYNkj01Vd//QaUbQpDBbcsy/3lIv/QvM/6NxKpsN5dJR6vL2Tg2n2oXt5yKsAH
         iJZdyCWXEf7V3hP89Q3wh9Q+cLgZ7xYI6u6EoWAbJE2dlniDFBFdrUu7JlAEJCCosKfK
         C+wJy73taZfe9GCDMb/NhykY3REAJgZS0NVYj6g17juI2MPgy0oHLMYx7/AopcE6kiK5
         8yvGc282FymiOH9XVMSTknWEv6FVUoxhNFZ48nEipuC6UiG8dV3mvDG/41a5ljALsDoP
         NNpQ==
X-Gm-Message-State: AOAM5337XegBAPni5jkDoV7ZfmOFGgqBk71qKG64k2SqDp25SV3RYt+f
        oU1sgR3tucfP8pIXvVRnpzOpNHi/JOZCknS5
X-Google-Smtp-Source: ABdhPJxLqP7ex7CWmzekAAXsNfAbzxWW5D6xCr+9fxNRGYNHw1oPaWfu/s0TxV2jD4YRSiBzoXwjbA==
X-Received: by 2002:a05:6402:3585:b0:42d:d6d9:385d with SMTP id y5-20020a056402358500b0042dd6d9385dmr12945900edc.334.1654077736859;
        Wed, 01 Jun 2022 03:02:16 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lo27-20020a170906fa1b00b006fe9209a9edsm505541ejb.128.2022.06.01.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:02:16 -0700 (PDT)
Message-ID: <8507d1c2-125b-0753-b97a-5d2b8e790dd2@linaro.org>
Date:   Wed, 1 Jun 2022 12:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 09/17] dt-bindings: spi: mt65xx: add MT8365 SoC bindings
Content-Language: en-US
To:     Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        qii.wang@mediatek.com, matthias.bgg@gmail.com, jic23@kernel.org,
        chaotian.jing@mediatek.com, ulf.hansson@linaro.org,
        srinivas.kandagatla@linaro.org, chunfeng.yun@mediatek.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        Leilk Liu <leilk.liu@mediatek.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-10-fparent@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-10-fparent@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/05/2022 15:50, Fabien Parent wrote:
> Add binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
