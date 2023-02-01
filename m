Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1EA768615E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 09:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjBAIN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 03:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232055AbjBAINz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 03:13:55 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA085D902
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 00:13:54 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso716001wmq.5
        for <linux-usb@vger.kernel.org>; Wed, 01 Feb 2023 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5mT2hrWS+VAr13J0u6Nts4f2ZSqjWnL3egrrOBO6/Y=;
        b=RBgXKAtkB/8spSJCXwbTizPK8CYc/iOE/ZsMeBGyUG0lQ/UrEPuLhkdKsdTTtY2VbT
         BQfeSw2GKgvFJ8qZJngtJ1R1RmRNh5y7JhnURwtsWxn+hfrRsIXCipdDK156w2+pn3UK
         GRB38B024sTjW4iv6Gm67niMPGorMck6lFPu/mkPcY2XbTizfeo4RhsAVSGNf8P0B2Uq
         vSZ4Ct/fPTvJ0jPZ0SaFO7UanPYKaK8thkyJNf0Zi5DLu0Kq6SbP+8V3+CnepM2LyeCQ
         JcxbEuB9J9js5NDV+uB3pCRpANh2NY1wehv8LOXCZSNz488n4xPaEW3bNwEW72uso4Xc
         ujkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5mT2hrWS+VAr13J0u6Nts4f2ZSqjWnL3egrrOBO6/Y=;
        b=ajSyAu9CFG/IT/ZzWApvUMO/Qd1PnYhIDi/rPqP5NaXJv1XPcO+fAkd5ZjhG/+ET/o
         AW1uNL2K7eFAWWFnpyknsyUCmARgv1EouoWquTzUTvo6M81TMDmb+BqMsRHjpICAUf1Z
         CzDpB6I7YgNf8G3LdOgH99Ds27ax78xP34Zjpm7wilu786U38/6RGNtUwzyzMA1utYDo
         RjA/cOhKPH9iHAt6oZo9UyhMY6D7T6LwtFkQsc8G6Y6Br78GnoQcWkEFMlfG6q9ZtXWy
         Ls2A/tjScfZnrPkioZ6nl64+P2iWixg+0Ju8meTw19jhwsHd+5bPpku4EhzejJbxyjxv
         FuFw==
X-Gm-Message-State: AO0yUKVWVz1tAGew1moPW8bQMTIOSP8aFMsC1HgJ4q5OxFeOk334UTF8
        O9vWu+aOegVlgoQ22RLQtrbAYg==
X-Google-Smtp-Source: AK7set+x/w/Q/FMQQUirGNdkE3f4f+nKijB2O6lJhL56R9MWFzDVGr/uuQKdMrvIKGkqF0q4GTkSdg==
X-Received: by 2002:a05:600c:190c:b0:3dc:43cf:7302 with SMTP id j12-20020a05600c190c00b003dc43cf7302mr6762111wmq.3.1675239233002;
        Wed, 01 Feb 2023 00:13:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t22-20020a05600c41d600b003de664d4c14sm891170wmh.36.2023.02.01.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 00:13:52 -0800 (PST)
Message-ID: <422ff910-a780-5582-0a53-8859738a7e69@linaro.org>
Date:   Wed, 1 Feb 2023 09:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V10 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230131175748.256423-1-jonathanh@nvidia.com>
 <20230131175748.256423-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131175748.256423-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31/01/2023 18:57, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add the device-tree binding documentation for Cypress cypd4226 dual
> Type-C controller.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V10: Limited connector indexes to 0 and 1. Added 'anyOf' to ensure that
>      there is at least one connector present.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

