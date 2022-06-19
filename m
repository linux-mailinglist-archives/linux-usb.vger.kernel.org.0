Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5681550A59
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jun 2022 13:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbiFSLtZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 07:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiFSLtJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 07:49:09 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3361211C39
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 04:49:08 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id es26so9875760edb.4
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Yp4bmUkucrfn0YoCb3947aiyNMhaiNjLfndCRiuztxU=;
        b=yr+bG3jG4+68iQNvAiVbY3Z1gBJqsRvJGx5qiy0JF4mCyAGs2+gQW+U/llayv2QvZa
         JObgwL6nY/In7vN0HgMJyKOHcXvcqtzdmIISyxAbBNQcLPd/7bs5WSSXoP1BF4CC0oSj
         cOA/+WUR3Mjc/ZGuFAcYgKsUk8uEOUyOsnHY2Kdcj/KV2McZ7G5VwDWc+oYaFweytQiE
         3DWEEJAHPlikXDtlaqwLSmEuovXWj4PGrR2gjXnxInhsq+/pVhYHn++AcQqqzmdENG9M
         mGqPzpp9dyG8QRwIRiVCBK/yzkGrKuwNwcUEZGSzbCoak4I6gm0aJOkIY6vumz7Ed2+i
         k4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yp4bmUkucrfn0YoCb3947aiyNMhaiNjLfndCRiuztxU=;
        b=rbBD9EwH+SybFG4l3VTIWmca/POjRJFQoD35V8YWZV5IDrcwqvzEY9/pWPX0bx09c+
         I/f/OXolojyxHf75/WFVB66e7b6hu3I/abt7dOH93DsROjoUa/cJHRTzcxD2u1RWFy3U
         8yIo8qW4HidhgI2zewkY5GLHqgeLxI49FUzEwurGXmYdkSwVWFuYcd0iuFu3IVuQ/xk5
         K3lLqj3uEI6anYSvNtCNq40IDd0aveuHuQ0pNyA9tCa5Qa/jaG4j8l3I992oshhZ2pvd
         kX76GFVMCiAPyPxsrxOXc3Dhn9xaOrKJHeeQ+f67wIjEGeKZtCbPhj/EQhdXT9By1Y20
         vu0w==
X-Gm-Message-State: AJIora80xywneEZ+ktXkrGtEpk36kyYH/iJC4iyeFusKRaihsx9mlI+o
        MqskVvhybxXMr3DiP2XgkP8gog==
X-Google-Smtp-Source: AGRyM1uf/0HgCvqeSezyCxo06xRPdiDZsKSIjIh9ayuMCVtMgx1owUBRCkmcqmcT3JXy2reZyX/UXQ==
X-Received: by 2002:aa7:cb13:0:b0:433:4985:1b54 with SMTP id s19-20020aa7cb13000000b0043349851b54mr22955689edt.182.1655639346743;
        Sun, 19 Jun 2022 04:49:06 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fd18-20020a056402389200b0043570d96d25sm2987288edb.95.2022.06.19.04.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 04:49:06 -0700 (PDT)
Message-ID: <5c7a1763-01fb-249d-a301-9164e2139ac6@linaro.org>
Date:   Sun, 19 Jun 2022 13:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
Content-Language: en-US
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
References: <20220617222916.2435618-1-nfraprado@collabora.com>
 <20220617222916.2435618-3-nfraprado@collabora.com>
 <d95e046262751a7f746fabc5f1d9a39e675730b3.camel@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d95e046262751a7f746fabc5f1d9a39e675730b3.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/06/2022 09:40, Chunfeng Yun wrote:
> On Fri, 2022-06-17 at 18:29 -0400, Nícolas F. R. A. Prado wrote:
>> The current clock list in the binding doesn't allow for one of the
>> optional clocks to be missing and a subsequent clock to be present.
>> An
>> example where this is an issue is in mt8192.dtsi, which has "sys_ck",
>> "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
> How about using fixed clock instead to fix the check warning?
> Using enum way seems make it more complex.
> 

That would mean the clock is not actually optional. The DTS should
reflect the hardware so either you have the clock there or not. Either
it is an input or not. Of course there are some exceptions (like
non-controllable clock or regulator which not always has to be modeled).

Best regards,
Krzysztof
