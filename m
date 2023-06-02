Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1526071FABD
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 09:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234187AbjFBHLB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 03:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233999AbjFBHKq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 03:10:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBFB1E41
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 00:10:44 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51475e981f0so2446623a12.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Jun 2023 00:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685689843; x=1688281843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8f3HJQTnCmjNY3p++5r9NXNAQ1Re77SZgdbIWC5A2p4=;
        b=WF8dJlKWQyxC4tUHPqx00vEqVcYtu5ZRNlFw5VOhFHInD+2VBqgrtSDDegsQg1Vt5E
         V0dP8EYq+w1W4z3I1sBBYfExvvwm/7msAjIIXAjHgHGIUBGAYralufJXHD0kFP23Bj+F
         J4ZFiuNNmwFoBsE+UYSQOeS0otI9DQGIFYSL038d5v2nFGij4zIL8mE6VLYqksweqZLf
         rjXK8ksj+a1it5a6w1PjovnB762pirs40w0SU68jEOTUg1JQln7VmwvxCXO3A/oMLQHh
         W4me5oi61broBX6VcYJaM4A7h6Vq8Ijh85Nvp7RcZ2d+hrqakslSggSMchFmauhcwZr4
         Viig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685689843; x=1688281843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8f3HJQTnCmjNY3p++5r9NXNAQ1Re77SZgdbIWC5A2p4=;
        b=U+3KjNW0CTGsU6/QW7uNQ/8wETCtwn8nmQl4xYEPYH3UvvzNcicVAOTNGoH483HzWs
         1SgMqzirBqnipJAxEzWvAClnMpFX6l4A44taiZjK0N5BYAmusNhn2sdgBoQr2LjO/Evj
         SJAh1fOIZXpayasx7/1F5PhkRwwKPPKelZxFrglRV8s/M2jsJcl7EZEPikJgItT74FVv
         R9dh/gb26zI/LzO6UMt9TRirhN/khMu+HuI0/QBSMkfALIvX0Mz0OltHLUcMT4sezseu
         7FaGeQDg0MyKVxVKNlBrBhnUIIni1IjZCTA+R5dcRpPHfFQLcceCVQ55B3TTiKFexMk3
         cx0A==
X-Gm-Message-State: AC+VfDyNb4uq4oAyjXU1N0zAnsrFmBTjWiAV41eNSipATRKm1FtAGEhu
        B3EhzDzn305pk/zHhKhQ0AIpVA==
X-Google-Smtp-Source: ACHHUZ6weBhF68GHRDPMx6/m15dbrAbwpzeRkwnl1KxpydCVmwT1Wrf6pWbqD4lI51oCIG2+uIUuqg==
X-Received: by 2002:aa7:c495:0:b0:514:56b4:35a7 with SMTP id m21-20020aa7c495000000b0051456b435a7mr1747204edq.36.1685689843340;
        Fri, 02 Jun 2023 00:10:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id s10-20020a056402014a00b0051422f31b1bsm323226edu.63.2023.06.02.00.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 00:10:42 -0700 (PDT)
Message-ID: <1231d116-ca4b-fb73-d000-d531297343e7@linaro.org>
Date:   Fri, 2 Jun 2023 09:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/3] dt-bindings: phy: realtek: Add the doc about the
 Realtek SoC USB 2.0/3.0 PHY
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
        Flavio Suligoi <f.suligoi@asem.it>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ray Chi <raychi@google.com>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230525022617.30537-1-stanley_chang@realtek.com>
 <20230525022617.30537-3-stanley_chang@realtek.com>
 <0b2143ca-ead7-c8fa-2e80-a94222af51ca@linaro.org>
 <ee65a9d6d40d4099987db5ff1ad1753f@realtek.com>
 <c49f5619-286c-fbb7-0f18-5869527081c8@linaro.org>
 <f53b5c21247c49db8be7071de36c773b@realtek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f53b5c21247c49db8be7071de36c773b@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 02/06/2023 05:20, Stanley Chang[昌育德] wrote:
> Hi Krzysztof,
> 
>>>
>>> Most of the properties are about the phy parameters.
>>> Is the phy parameter data suitable to be placed in DTS?
>>> I referenced other phy drivers.
>>> These parameters should not be defined in dts.
>>> I would move the parameters to the driver.
>>
>> If these can be in the driver, why would ever they be in DTS in the first place?
>>
> Our platforms have 3 xhci controllers which map to 3 different phy ports.

You mean on the same SoC?

> And the three phy ports use the same driver, but the parameters are different.
> So I put the parameter settings in DTS, we have 3 usb-phy nodes representing 3 phy ports.
> Also, some parameters have to be adjusted for different boards.
> Therefore, it is more applicable in DTS than in driver.

Then it looks justified in DT, so please write proper descriptions for
proper properties. Underscores are not allowed in node names. No fake
nodes. Properties should usually describe physical/hardware effect not
the register value.

qcom,usb-snps-femto-v2.yaml is nice example. Few Mediatek bindings also
would work.
'

Best regards,
Krzysztof

