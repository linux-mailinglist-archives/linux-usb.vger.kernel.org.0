Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40160629678
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 11:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbiKOK4I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 05:56:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232227AbiKOKzl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 05:55:41 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CFC26480
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:54:23 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b9so17011586ljr.5
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcdMK6pyq6QRrGL0Z9BG95K8ZsYDf0IuGpvJl7z2gQo=;
        b=SqiVoxqjHssIuk0phQrkPORoueZJcLR/XFveKKnHYiZEi83mz3Yv6iHgpU4fy1ye3t
         wKV28TJiB+5gcqJFbgQLl2KdMhcaJSAyyte7nADjJR3OBwejSeTNCGE3YuKRmWr3P/BR
         Ehnqv/13JgxdeQE4zvqdXrsWf/aajirXtBQMbLIw+m07Bt6Kopdu1MBk7C9zgWWqxkQZ
         CiaRp+OKx9CJsmiUwnbLXZBdggjms9VdnZ887iAfvKWcuy/MgxiKEMQDS8bST53yA9/t
         PIB6cXTFfsJ5K/IcXNg1s2D0t9BxrKrvGsctf5V5DSnvih7KCEs3HwJa00MG2riPYIe6
         jeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcdMK6pyq6QRrGL0Z9BG95K8ZsYDf0IuGpvJl7z2gQo=;
        b=gS4RJO0ZZ9XVWZz4bj5gvD3BMDW0yAuy/6bt0S++W06iw9OrH46Ps53a6bo0Vj2c1N
         97di9JhMtYRpx8RgJPHYgctEsopDVbFYg5feh0AligCOMkEKvWv/qtoD7Nj/rOSR/cOj
         pfYv6X6pK/uy+JYXwXGcD7YTaAjAt/nfMylTcGTtEK0lRaKmF1D3eKN/8DYPlG6gMtY1
         a4+gfXRCadzIylNwwdUbu2CdDow1zluaijkZpnZh7yuEHemSwl2lI9DqcpXXl32Q90N+
         1lq4xB0g9dxRATNKopn0QZ7UbyURSYXUnjBNgZOWSDEhlw1KNxXHyyf4E00C28A2uVb8
         5Dxg==
X-Gm-Message-State: ANoB5pk0YZgnQkt1Fqaez5SEKuJKzwyzXwfcU8O9x863f9l/9vnKUW4L
        7hEjqcQ2BqpidOVghiqL81kHxg==
X-Google-Smtp-Source: AA0mqf54UoATcbcODLPVTFYROSL09YrLMVi1vrCB9iC5LjPXeUx5nxpm7ns+BmA/Ry7vjKAgLndhYQ==
X-Received: by 2002:a05:651c:17a1:b0:277:f8b:bb4f with SMTP id bn33-20020a05651c17a100b002770f8bbb4fmr6158885ljb.161.1668509661805;
        Tue, 15 Nov 2022 02:54:21 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c8-20020a056512324800b0049a5a59aa68sm2182351lfr.10.2022.11.15.02.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 02:54:21 -0800 (PST)
Message-ID: <0eb1a6a5-771c-6cc1-f95b-9708468f1d90@linaro.org>
Date:   Tue, 15 Nov 2022 11:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] MAINTAINERS: rectify entry for MICROCHIP USB251XB DRIVER
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221115103153.28502-1-lukas.bulwahn@gmail.com>
 <c21e0e3d-5970-d905-3b6f-54a1ddacd052@linaro.org>
 <0750d2e8-766b-3c5c-5472-4c9d6e9ec3c4@denx.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0750d2e8-766b-3c5c-5472-4c9d6e9ec3c4@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/11/2022 11:52, Marek Vasut wrote:
> On 11/15/22 11:35, Krzysztof Kozlowski wrote:
>> On 15/11/2022 11:31, Lukas Bulwahn wrote:
>>> Commit fff61d4ccf3d ("dt-bindings: usb: usb251xb: Convert to YAML schema")
>>> converts usb251xb.txt to usb251xb.yaml, but misses to adjust its reference
>>> in MAINTAINERS.
>>>
>>> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
>>> broken reference.
>>>
>>> Repair this file reference in MICROCHIP USB251XB DRIVER.
>>>
>> You know this could be just one sentence (instead of three paragraphs)
>> with a Fixes tag...
> 
> On the other hand, the content is educational, e.g. about the usage of 
> get_maintainer.pl script .

Education is good, but I don't see a point to grow commit log with this.
The warning would be useful, but the command? Just store it in
Documentation if the intention is to educate.

Best regards,
Krzysztof

