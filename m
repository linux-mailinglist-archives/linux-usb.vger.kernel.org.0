Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36D6572844
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 23:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiGLVMN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 17:12:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiGLVMM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 17:12:12 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D180E33E25
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:12:10 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id p6so8533260ljc.8
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aA1qRDMQdHcGVvyUmLU6fqZTSPwU+IQ4oW2ncgYSbDs=;
        b=THMzW+zSqgG2BmIzWvvJj7lysQzD/3SLYng4Z+lMijoMjpJVpn64kaPQ1q6+R5Cqqi
         p5UtStIJDmY3Bs9xeDKvJe45BqyYWDc80DJebwelP2muK0jsyv1otgjhYas0ZsORTNYs
         tCccJ7mYr6MVguLsa3JSMkFzg8rXyFBeAqEeRKjnFcIr6IsoqG/V0ddRJ9RY+hjW4JM0
         onGO6UQX7oq0KtNgtmpm6cP/qrYmTs5R1j64qGS/w4D0pjJ1xjPOpZ3koXV5AYK4BEdQ
         S/Ov7+RGmnAz8ZTt/flJv0KL3rSix57nTv6COE3NvfCpkSeMPNnTUvgda6gRHGthvXQO
         Di1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aA1qRDMQdHcGVvyUmLU6fqZTSPwU+IQ4oW2ncgYSbDs=;
        b=nLUbqkn/Qdv5HuDcRmZ7tKdBs4/zMALP8VDL/qZgwSz0rYf2qSBoXowdTA/e/30Egp
         V0PCpm1JL02tC4t0tjIcKqxZcx3nxBtiXbkMKv/VfXtZ8bq1Bq/f1GiGvCg1alEroz5T
         VBT6ty6R2jGIyBt5/6PwGcFEPa+H+Zbm5CkfcBamBdIQCVAWdOL6Q2Sn9yqSsItyUITq
         A9n9utZNvFbic3vSLAlw6yUgSoWAIO/nQkrSS5AXC8nFttF+Q7ll3RUVQLZ60pjKIbMT
         tW/5BolEUgnieJlBfNpkBSWHOLLrf91SD/eGiGdoCqVPlLHysLduimVXvsSX3onjysdP
         L+Nw==
X-Gm-Message-State: AJIora8aO4Qal5HLTqHHqjj2Kkm/yaXsagwar8HmhG3aIJn76GF/3QsS
        BwveRD6JMI2TY9qnrQjopHJTiQ==
X-Google-Smtp-Source: AGRyM1s6+q73AgxvmBolc9anwkHnfpTMlx2LHi2vSLJMomIzxa7vkLsATnZFmtB04YrlCAgK3cruYA==
X-Received: by 2002:a2e:a98b:0:b0:25d:605f:1acb with SMTP id x11-20020a2ea98b000000b0025d605f1acbmr11249584ljq.311.1657660329162;
        Tue, 12 Jul 2022 14:12:09 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id x5-20020a056512078500b0048159b43083sm2392015lfr.201.2022.07.12.14.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:12:08 -0700 (PDT)
Message-ID: <34e2a75a-b6dc-d5ae-4820-58cee2b0dd29@linaro.org>
Date:   Tue, 12 Jul 2022 23:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20220712150627.1444761-1-alexander.stein@ew.tq-group.com>
 <Ys2uiei+ZOVYaOMy@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys2uiei+ZOVYaOMy@google.com>
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

On 12/07/2022 19:25, Matthias Kaehlcke wrote:
> Hi Alexander,
> 
> On Tue, Jul 12, 2022 at 05:06:25PM +0200, Alexander Stein wrote:
>> The TI USB8041 is a USB 3.0 hub controller with 4 ports.
>>
>> This initial version of the binding only describes USB related aspects
>> of the USB8041, it does not cover the option of connecting the controller
>> as an i2c slave.
>>
>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> ---
>> Well, this is essentially a ripoff of
>> Documentation/devicetree/bindings/usb/realtek,rts5411.yaml with USB IDs
>> replaced, reset-gpio added and example adjusted.
>> IMHO this should be merged together with realtek,rts5411.yaml. Is it ok
>> to rename bindings files? I guess a common onboard-usb-hub.yaml matching
>> the driver seens reasonable. Any recommendations how to proceed?
> 
> It's a tradeoff between keeping the individual bindings simple and avoid
> unnecessary duplication. The current RTS5411 and TI USB8041 bindings are
> very similar, which suggests combining them. However over time hubs with
> diverging features could be added (e.g. with multiple regulators, a link
> to an I2C/SPI bus, a clock, ...). With that a common binding might become
> too messy.
> 
> From a quick look through Documentation/devicetree/bindings it doesn't
> seem common to have generic bindings that cover components from multiple
> vendors. In that sense I'm leaning towards separate bindings.
> 
> Rob, do you have any particular preference or suggestion?

Not Rob, but my suggestion is not to merge bindings of unrelated
devices, even if they are the same class. By unrelated I mean, made by
different companies, designed differently and having nothing in common
by design. Bindings can be still similar, but should not be merged just
because they are similar.


Best regards,
Krzysztof
