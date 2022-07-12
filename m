Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 854975728AC
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 23:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233228AbiGLVdG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 17:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbiGLVdE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 17:33:04 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9F1D1ED6
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:33:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bf9so16038160lfb.13
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 14:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TIpqXGqUdbc7bp5Nv9vg+wT2LovVtvXFE8gEfCoQ/p8=;
        b=qrsWGWfNqgj1aZfKL3NgvzRw2+cN5C0H4oH3PJ/UGPr8pZbVgLort1Gp/E2AYiC9Aq
         BAUq3Wug/N8IhkPgpXRI6aID5xtl7j8KHHO02t5Jzu5fQxRnNZKYIbB1qPMfnbROP581
         es4sskdOo3FvRpaQQGiPPQCtUqDHf1EQs5pjOiUXu2UJcefI51izTX93YnKnPlTL1Ll9
         +qypjg1dV5Mtl+IrP9ywQK4l3aAgjLWBDHTy1GhbuqwBCJGUiYUGZRibw/VoIg4yc0uD
         XwFvAL5WNrH5drluy65wT6j2fc/uilW5ay0HpPWTWkBg4iSB8+arP0K3Wr21rrsZRqQv
         LP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TIpqXGqUdbc7bp5Nv9vg+wT2LovVtvXFE8gEfCoQ/p8=;
        b=oadbXrVFCAMZsil93gffBUaI0dsqeaJBoC2P49nZ0G1cgdro8rOs7VMjcEUKF7U8WV
         hYLusbcJ4du6dpGFTgRQNoF53Dt8QLbTMxEM1pyhDHIFX1I0cVgjc7v8ptW/xTjx2Yl0
         ldJldHHHeIeDuHgYQZ+MK211p/uUajEyX7E/yt/0Hzl1bHSJMyFlSbR3BjI4B1BEoeUK
         XnA1Ez1sO+CtfkidosstKTFG77joOQGGr0LstCiXIWT+V2mUFEy+iPK8hprVSClXotBL
         5ze9+KcWhFR7BGV9QsGkjCYylzIuT8tkWz6D04irli4mWeLtzPE2z4GlEfFb6jKUmLsz
         zMSw==
X-Gm-Message-State: AJIora8eTfGw3kjhOuVSR46nEsliQUxCJcRlFnvLZM/Bzpks8w7SQPrP
        aw0vKEsRs2/N2Q0VmD+mCyZGeQ==
X-Google-Smtp-Source: AGRyM1sR8GDYomRROdIPnmNEdFknF591zTF+eQqR8/kcs+ehwUsWazfVo/ZnMuA66BXVMjgeAhz7WA==
X-Received: by 2002:a05:6512:239c:b0:489:cc5c:177e with SMTP id c28-20020a056512239c00b00489cc5c177emr2686lfv.645.1657661582291;
        Tue, 12 Jul 2022 14:33:02 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id u2-20020a05651206c200b00488ab8914b5sm2380747lff.213.2022.07.12.14.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 14:33:01 -0700 (PDT)
Message-ID: <1c19780c-6ce7-dd32-257d-7bdf8271055e@linaro.org>
Date:   Tue, 12 Jul 2022 23:32:59 +0200
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
 <7c838790-1dd9-732a-e5cb-f2ea6454411a@linaro.org>
 <Ys3ngK0b4QtWbQKv@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ys3ngK0b4QtWbQKv@google.com>
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

On 12/07/2022 23:28, Matthias Kaehlcke wrote:
>>
>> But another question - why "peer-hub"? I remember some discussion about
>> naming, so was peer preferred over companion?
> 
> Yes, Alan Stern pointed out that 'companion' can be confusing in the context
> of USB:
> 
>   What do you mean by "companion hub"?  I think you are using the wrong
>   word here.  If you're talking about the relation between the two logical
>   hubs (one attached to the SuperSpeed bus and one attached to the
>   Low/Full/High-speed bus) within a physical USB-3 hub, the correct term
>   for this is "peer".  See the existing usages in hub.h, hub.c, and
>   port.c.
> 
>   "Companion" refers to something completely different (i.e., the UHCI or
>   OHCI controllers that handle Low/Full-speed connections on behalf of a
>   High-speed EHCI controller).
> 
> https://patchwork.kernel.org/comment/24912563/

Thanks, that explains a lot!

Best regards,
Krzysztof
