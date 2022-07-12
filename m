Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEAE35728AA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 23:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233061AbiGLVcS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 17:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbiGLVcR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 17:32:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347D5D139A
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:32:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o7so16056904lfq.9
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QZY1I7ZGfIoUdU5OKb8hnvePyeo8oO92kEUWTFHLrS0=;
        b=mZqYGWIxfVKF3Pf0EezhE+aJu998idmt9TJpCANwVjdKdURHTeMeo84u7Jo4K4J7q1
         9HQdhdRap/k5syGADGIzWzP5O+7pJUDf3kihpWORb/+SpJuVrD1As08ej33MKFC1NYTw
         3vpGldJ/s2/JnVqmztQpu/b9DCS/rEl027l0sdh6I3oPLQ6reKraryy3GH6I1goExrFG
         niggsmxA83dxPoI3uW/wCZdmy86KeeFV5Mz0K0+PPIHmVWHkvnLgqqiLvBhjIoAka/Qw
         iRwjZ3tQsTAbN8sjLGVR9l2H19ft4RAuB9BkDHsV6slKNE29eZicTqiW01gNau9BRMO7
         7VUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QZY1I7ZGfIoUdU5OKb8hnvePyeo8oO92kEUWTFHLrS0=;
        b=voHdkzR4XEMjKrq9yGoIIMTvYP2XrMWKbh3WR+Af8pcYRXayNii9+UOXLwWisSp4Va
         hSHv7L90TfLyVshLEE6P9wgFfLZRUNSbHgauFHgv4L3RXFsJDAdA40yd3h0X0KqXsbhW
         BV0J0R7R/uJW94/nFRAMJDiEILPbzAN15dP8crKVUeIheWK43TW/w4li041MjRHw84ll
         CNwZjFRDbJU0+7o7h0ru2/QAtgrP0cXHMKP4I8lP1buXDMCI5R+QrPiAAWHDu+hgI3OH
         wlLILyCJL5EEltKcwdP35nn0Bsqs5uGGCevSDaf/38Yo9SWDmIqabt0dquP/8UJTxaLU
         LENg==
X-Gm-Message-State: AJIora/U/cnFe2Y+ZQ7tNvOvclHNQS7JNTcGKvo7m+A13/KxmbnhujLG
        /S6LUH/bhmJI2hkVV1Lajh6SWQ==
X-Google-Smtp-Source: AGRyM1swfJZb29PRnci0zOf2DgRkRRMGBK5/J87ROOvoAkMFG6At4bbT8AFOXuhOzYXB87oiamuTSQ==
X-Received: by 2002:a05:6512:c24:b0:489:15ea:91c8 with SMTP id z36-20020a0565120c2400b0048915ea91c8mr18513lfu.33.1657661534569;
        Tue, 12 Jul 2022 14:32:14 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004855224ead0sm2393673lfr.158.2022.07.12.14.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:32:14 -0700 (PDT)
Message-ID: <b2476f28-6830-860d-9bd6-502aa24031e5@linaro.org>
Date:   Tue, 12 Jul 2022 23:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
 <Ys2uiei+ZOVYaOMy@google.com>
 <34e2a75a-b6dc-d5ae-4820-58cee2b0dd29@linaro.org>
 <Ys3mrAukkXXDHopg@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys3mrAukkXXDHopg@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/07/2022 23:25, Matthias Kaehlcke wrote:
> On Tue, Jul 12, 2022 at 11:12:06PM +0200, Krzysztof Kozlowski wrote:
>> On 12/07/2022 19:25, Matthias Kaehlcke wrote:
>>> Hi Alexander,
>>>
>>> On Tue, Jul 12, 2022 at 05:06:25PM +0200, Alexander Stein wrote:
>>>> The TI USB8041 is a USB 3.0 hub controller with 4 ports.
>>>>
>>>> This initial version of the binding only describes USB related aspects
>>>> of the USB8041, it does not cover the option of connecting the controller
>>>> as an i2c slave.
>>>>
>>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>>> ---
>>>> Well, this is essentially a ripoff of
>>>> Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
>>>> replaced, reset-gpio added and example adjusted.
>>>> IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
>>>> to rename bindings files? I guess a common onboard-usb-hub.yaml matching
>>>> the driver seens reasonable. Any recommendations how to proceed?
>>>
>>> It's a tradeoff between keeping the individual bindings simple and avoid
>>> unnecessary duplication. The current RTS5411 and TI USB8041 bindings are
>>> very similar, which suggests combining them. However over time hubs with
>>> diverging features could be added (e.g. with multiple regulators, a link
>>> to an I2C/SPI bus, a clock, ...). With that a common binding might become
>>> too messy.
>>>
>>> From a quick look through Documentation/devicetree/bindings it doesn't
>>> seem common to have generic bindings that cover components from multiple
>>> vendors. In that sense I'm leaning towards separate bindings.
>>>
>>> Rob, do you have any particular preference or suggestion?
>>
>> Not Rob, but my suggestion is not to merge bindings of unrelated
>> devices, even if they are the same class. By unrelated I mean, made by
>> different companies, designed differently and having nothing in common
>> by design. Bindings can be still similar, but should not be merged just
>> because they are similar.
> 
> Thanks for your advice, let's keep separate bindings then.

Although for the record let me add that we did merge some trivial hwmon
devices like LM75 or LM90 but their bindings are trivial and programming
model is also similar between each other (handled by same device
driver). I guess we can be here flexible, so the question would be how
similar these USB hubs are.

If in doubt, just keep it separate.

Best regards,
Krzysztof
