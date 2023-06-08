Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2447727877
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 09:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbjFHHPM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 03:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbjFHHPJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 03:15:09 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FD51984
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 00:15:07 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51494659d49so422940a12.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Jun 2023 00:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686208506; x=1688800506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1sd05CLDYUSvBW3GOCX6CLVAicdJRZHkCzuK6EVK+t4=;
        b=rsu5m2iEH34QOsXVOnjWvmLBFdKyQWc7ps8rhXGL7otj6DyrQPgK6OqmEZyPSctaPr
         9jz74ROAyIx4pNRpN+76HajlmxElGqb+N6JREhMttjIChF+7qmtL3Mbw0FEkuITN7sGf
         Oz67H/s8Y5j5QPgQOsKUnveC1jBjjiozx1WPjhZ7qd5D4Y6L1PXYiH0zjZvnnlWvNcPd
         71ll6RrJfzBFk3PrbXfV56kR1S0i3xiqJ7NSRp6RqiGNNC+O/i5qqsGu0CHoSKP0Pu2/
         da4ZpHaKdWU48GBKpvWcv3CeUBrauB+MsiW+2dCt7lAmmodb4iAMVf0rxpcf/QqPlYPi
         I8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686208506; x=1688800506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1sd05CLDYUSvBW3GOCX6CLVAicdJRZHkCzuK6EVK+t4=;
        b=HOq2KpchiljRaNa6ccFC37no+85G5tjPTpXuN2ouhPhHk4IyPTG7GRijwT7jAr8v7t
         QDpsVwhJGbe70ImSuCruuKMqFcLWRJiurh5r5kMUmWelmdxGmjC0Av2iTHFKz8OYDZGL
         NleV4/jm4BQuY1244aAy7sMcUZlVpC/AdMrjbtFpfViOnrdZnr5DHT36ZylJZeTsJUtv
         fw9Hwyc6rOaeFwL23dym17+0Qk8V6o1vMi82GQzliRyZN4utlLbtXhl6vjTMLvuQUbEQ
         zfOSLIW5IWCODbq0pTesz3s8zjsg8eufOt5sqoAuiS5VUVji8ya2DhJ9BEKC4N0pa5pT
         URxg==
X-Gm-Message-State: AC+VfDxtSY5DYqBdMEmf4AdT7ZOR6tlcbuFFiLFrKgiipIQvWpiD0psj
        Zo6VbyE+CVNI6JVJ7bMJwIbhVQ==
X-Google-Smtp-Source: ACHHUZ6o28Ei4sxl7rCD1F+9lYLgiWHAPjBPWLZKnkrR4M1vnXe8LnSs39VAtYvmcENHIY8C+m+XnA==
X-Received: by 2002:a17:907:7da4:b0:974:1c98:d38e with SMTP id oz36-20020a1709077da400b009741c98d38emr8670170ejc.2.1686208506478;
        Thu, 08 Jun 2023 00:15:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906604a00b009545230e682sm305674ejj.91.2023.06.08.00.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 00:15:06 -0700 (PDT)
Message-ID: <f2e17e0e-9c2e-3693-54fa-de3ba5eac846@linaro.org>
Date:   Thu, 8 Jun 2023 09:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/5] phy: realtek: usb: Add driver for the Realtek SoC
 USB 2.0 PHY
Content-Language: en-US
To:     =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= 
        <stanley_chang@realtek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ray Chi <raychi@google.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230607062500.24669-1-stanley_chang@realtek.com>
 <20230607062500.24669-2-stanley_chang@realtek.com>
 <79201bd6-6048-7013-aeb7-34d218139844@linaro.org>
 <8cb2d82c3b484262aa866c5e989fc8cd@realtek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8cb2d82c3b484262aa866c5e989fc8cd@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/06/2023 08:59, Stanley Chang[昌育德] wrote:
> Hi Krzysztof,
> 
> 
>> I commented on your second patch, but everything is applicable here as well.
>> You have many useless debug messages. Many incorrect or useless
>> "if() return" which point to broken driver design (e.g. concurrent access to half
>> initialized structures where you substitute lack of synchronization with
>> incorrect "if() return"). Undocumented user interface is one more big trouble.
>>
>> I doubt you run checkpatch on this (be sure to run it with --strict and fix almost
>> everything).
>>
>>
> 1. I use checkpatch but without --strict. I will add it add and check again.

Around 300 issues pointed out...

> 2. Do the debugfs interfaces need to provide a document?
> I don't find any reference about this.

Not sure if we have it in docs, but it is discussed every now and then...

https://lore.kernel.org/all/CAMuHMdUaugQ5+Zhmg=oe=X2wvhazMiT=K-su0EJYKzD4Hdyn3Q@mail.gmail.com/
https://lore.kernel.org/all/2023060209-scouts-affection-f54d@gregkh/



Best regards,
Krzysztof

