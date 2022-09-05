Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398CF5AD242
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 14:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236831AbiIEMTk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 08:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236700AbiIEMTj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 08:19:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA35101E8
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 05:19:37 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id q7so12898453lfu.5
        for <linux-usb@vger.kernel.org>; Mon, 05 Sep 2022 05:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uLFVpwL+K/8vBnNeBIqD0bnrQNEYXNCQ5ZcTV6tt8XM=;
        b=hK++AwSCUxbN7mrDFyZRX00NUn64ZmAiOC0t5xoHUHmoxe5RHqUkf7s1eKGVhmBiuz
         CQcn0+IA58FhN8s2ikMh9JZn+EcGE8wpuqOd6ykCJPSqt+TNn51Jvtelknb8N1WI8N2F
         3mWkITa908J5+inow3THMOho82pSlwVNhSrgw/CLSVbgvxQ56FiWs/261AkXCqV9cLfK
         J966quCXJp66ooFrmn7p0qzgO7hBXWiA6RLfRSn1he/bPTQ6j3s0I3SyvS4NXyimJhsi
         msjG9n6NjJh6pKI78hb/+LBiXCQR+cDaBYD0mtS6MaTqWm2GvbfhhSCt7f+bfQpq3r5r
         L4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uLFVpwL+K/8vBnNeBIqD0bnrQNEYXNCQ5ZcTV6tt8XM=;
        b=rQWLcrftbyXxa6cTIBV45PWamfgioPj0RpSpzYdMA7Cti0vsbtlI7zOOLlWpFeDUaE
         21dQy6ZnLgoVNeFq2ovHWjUVDLN9c1wCnkxTtv7g4KwdoxIflL0tVcewaR1UB1nye+g7
         OmCp1qc/jt7sL5WFqbRHExPLVowr1FLE58k7ADgxAwXK2AuQerxrc6VAY3GDdtHj9QPr
         INlmmjEvKXrnczW1fjaxVzNtX8Jzr3ZohnHNqcAtKxf+ROhkMF/nn+9YxPiPPPhzt1vU
         FRBzClCuGH9OTmiEEZcl+rl+gPjVjdkOdYBHTzkUwTQyCQCmN5+Mu36GEK1Jj3WrPnoU
         mUBA==
X-Gm-Message-State: ACgBeo3EFa+9hpIKx5WhjOlPQY8HbsVJ8ZVUtUtZwq3rLyvUMz9SHtmd
        yJH9vaAcIlGtDUg0Jq46CngBqA==
X-Google-Smtp-Source: AA6agR4RCsw6lJqZwkMUyrOduj4LVzpdXzKpmlnuDVQpKdfbxaMEs17Ol01jmNf43r01HjyYoMjDcw==
X-Received: by 2002:a05:6512:33c8:b0:48a:fe63:e4ea with SMTP id d8-20020a05651233c800b0048afe63e4eamr15484628lfg.415.1662380376296;
        Mon, 05 Sep 2022 05:19:36 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b23-20020ac25637000000b00494a27500c1sm1173634lff.163.2022.09.05.05.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 05:19:35 -0700 (PDT)
Message-ID: <64e96f32-e3c4-5a9d-c4f0-90986eba597d@linaro.org>
Date:   Mon, 5 Sep 2022 14:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] USB/ARM: Switch S3C2410 UDC to GPIO descriptors
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220901081649.564348-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901081649.564348-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01/09/2022 10:16, Linus Walleij wrote:
> This converts the S3C2410 UDC USB device controller to use
> GPIO descriptor tables and modern GPIO.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> If the Samsung S3C maintainers can ACK this I think it's
> best to take it into the USB tree where the bigger changes
> are.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
