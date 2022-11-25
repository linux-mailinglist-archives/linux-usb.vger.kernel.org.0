Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6B66385BD
	for <lists+linux-usb@lfdr.de>; Fri, 25 Nov 2022 09:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiKYI7J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Nov 2022 03:59:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiKYI7I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Nov 2022 03:59:08 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8683056B
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 00:59:07 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l8so4408076ljh.13
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 00:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6NP9iExsKhwAiLL3vq6RTTdR3dVNz/YYKUpFQJUzmA=;
        b=Hgk0oxKXN9Kp1SVIjeguHoN7XO7n/EC4fM773cZZZY8ilRuGvyEsgAcEGmeK3pU2Jy
         TGfiulCY8gCJ64ILXTYgmm8vpspUQkudvB8Y1ubKbXoh++qvOKPcixdDp6c78Pvru8Tw
         BOoODAJhX6OINqHo8FvGgeJKj6P4bcy2xiFboO1yKDvAR9vXbHMsdIXWibGLjQpiHE4N
         2uJIUH4sWNmz4CpiKt9QGtgYFVYkZA9FKFd4U8NV2q0vv+7p6XEUFA1nBS2IjR50j3kK
         k5wQ9Xn5hfOIkVWtPDSeqWIUOqj51F/sDsIFBtD92j/LMLglQwiSe3xlpRn/b+FDfjTm
         Ee/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6NP9iExsKhwAiLL3vq6RTTdR3dVNz/YYKUpFQJUzmA=;
        b=fx+SB/NBgE4Qz/W4cQRYMhcPEPmsJ0e6Ur0aDHYfFctE9eOUAEq66usWJZ8bfL02hI
         Mr5g/iR96bbbhsDMwVSImYRuoRIV8MDp0nsfZ+f+bdpSe9F+LsFzJ8SqnC4brQMAro+V
         p06gzcZ3g4/ya3xlLTDcYUjDmqABATh0liHCgd+4IyfWOxg+ooqJKWp/Qyix+e+kkRJO
         ptKLbKEYTOkeQM7TqTZZfT+9Un8wJvB6kjbLh9JnfdvXr8U5nZRa43v5CC/bv8icmiBR
         VYQWB3W4RQinlzejRmmYYOWomDXuBD8o/LZTloRs1FHc2fIvDAXyU927LeAjzFVqMdIo
         wycg==
X-Gm-Message-State: ANoB5pkepCyqrYpTBl5H6G/xu3bGFUyXF7xEBfM1s91RYzK7wwevKuGr
        UqvZ0NODG2U/UO454nf7X/aPCA==
X-Google-Smtp-Source: AA0mqf77+c+kCbL9XSzsq+fyhsTpSylGBtPLQbDyXpMNs/p9Qr5IKiNMoVLX/VFlRUo/cQiC7vycWw==
X-Received: by 2002:a2e:b10c:0:b0:26f:bd6e:7f7f with SMTP id p12-20020a2eb10c000000b0026fbd6e7f7fmr5808698ljl.87.1669366745565;
        Fri, 25 Nov 2022 00:59:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s9-20020a2eb8c9000000b002770566d642sm301463ljp.17.2022.11.25.00.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:59:05 -0800 (PST)
Message-ID: <735232e0-9e07-dc4e-4e6b-b7d198a2f27b@linaro.org>
Date:   Fri, 25 Nov 2022 09:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: mtu3: add compatible for mt8186
Content-Language: en-US
To:     =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= 
        <Allen-KH.Cheng@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "hsinyi@chromium.org" <hsinyi@chromium.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20221123135531.23221-1-allen-kh.cheng@mediatek.com>
 <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
 <4ffbba83-d23c-59ef-0b01-eeb80ea70219@linaro.org>
 <fc0cb10747056f8f38a077b39df3a83e6b340c64.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fc0cb10747056f8f38a077b39df3a83e6b340c64.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/11/2022 09:41, Allen-KH Cheng (程冠勳) wrote:
> Hi Krzysztof,
> 
> I have used get_maintainers.pl to get the email address and apologize
> for not seeing the difference.
> 
> Do you mean "+dt" in email address?

Yes. Don't write email addresses manually but use scripts/bash aliases
to get the output... or CTRL+C and CTRL+V.

Best regards,
Krzysztof

