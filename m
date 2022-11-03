Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56F6618475
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 17:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbiKCQav (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 12:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiKCQas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 12:30:48 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B251E21AF
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 09:30:29 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id 8so1495081qka.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Nov 2022 09:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHNMJF8XWCG/HlS4+eCjG2CgBguyze4jH3mOvZx8Epg=;
        b=G1ZhYVb8T+FZ4BgBVxLLoQE87vgaX58qMUgd9tNRxudHWdFqHOrOjKyy0axzacXM3h
         CMVDYWUjAiBjxwOf4AjBnim4hN7N1AWbe/75vpEDULus3YNRtuRHfZiuwCRo4m1xoTBu
         RbL8LgY8u+AJRiYxQmobQILA2kh5LvcPbwh2G0xNL2P3mCklSd2LLTaGuUjujZ4X4YSo
         jI2yuU4BvCFJ1V/a3SSQahnPPPqmdLJMTaeXPAFCXLsO5Kb9wn1HQ1O4kQFWM+fLMJY3
         VaGxwtYwQwsVuEPcnRa34oMzIBC245hOYz97SulJ7vsQSTlAzxQi0PhouSyeaOzxVRtk
         zosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHNMJF8XWCG/HlS4+eCjG2CgBguyze4jH3mOvZx8Epg=;
        b=aMSabWNdK+gbdY+DtQZBbLsU0uN03b98OLm/zXQBSYoprPf4IGZfsd6WD/6Jbve8Md
         QcfYkJYvzt3T7QQHd1jLxnYV1EvdWHf0qDjc3TwF+t9rxikpAYsZv92e3TG4lhulCPth
         7kCWSDjLCIA1nTJken8j9zImI4OGbu7gldqTZTTOOGHo9g8UVwBXlYoixzmdFDtcWR9V
         pmVvV5ATB6AJTlfnSR+v4N1G2LJjviK+DsicKmlQX+bN48YzGYf8nMrgate3pD459R3G
         Qf+3d/tHqhsgvOAVEwzTKrRsvD1hvAK84BiRLm4GXpVlgHJgSkl+40zFqfcQQTY0STVC
         6EPA==
X-Gm-Message-State: ACrzQf2KBvr5TyH9/c6tK3sk3F0VATeMsCl9c2mCN3BJUZhTcj2HyCnI
        uxPEfeVXPEtPWiQ/ZI26X7UpBFviWKqYRA==
X-Google-Smtp-Source: AMsMyM44aLhA23EfLSlswOnvlGa6pp5mgrDyi2ujgIpGR2aSX5ZTJXEBlIpP7pSqO/tnkk5hNMUObw==
X-Received: by 2002:a05:620a:56b:b0:6fa:3110:5aa8 with SMTP id p11-20020a05620a056b00b006fa31105aa8mr15586230qkp.343.1667493028896;
        Thu, 03 Nov 2022 09:30:28 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id g10-20020a05620a40ca00b006f9ddaaf01esm1006172qko.102.2022.11.03.09.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 09:30:28 -0700 (PDT)
Message-ID: <08f88129-23db-ff29-4ad4-07adfe3bae9d@linaro.org>
Date:   Thu, 3 Nov 2022 12:30:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 3/7] dt-bindings: usb: hpe,gxp-udcg: Add binding for
 gxp gadget group
Content-Language: en-US
To:     richard.yu@hpe.com, verdun@hpe.com, nick.hawkins@hpe.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk,
        balbi@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221103160625.15574-1-richard.yu@hpe.com>
 <20221103160625.15574-4-richard.yu@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103160625.15574-4-richard.yu@hpe.com>
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

On 03/11/2022 12:06, richard.yu@hpe.com wrote:
> From: Richard Yu <richard.yu@hpe.com>
> 
> Create documentation for the hpe,gxp-udcg binding to support access to
> the gxp USB gadget group.
> 
> Signed-off-by: Richard Yu <richard.yu@hpe.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

