Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD105739EA5
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 12:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjFVKjH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 06:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjFVKjG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 06:39:06 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24CE319F
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 03:39:05 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fa7512e599so3211625e9.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 03:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687430343; x=1690022343;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oyBILI3qy1jyGfwZMlXs7rxAIorFnavFxj7L2gvgWSM=;
        b=yzCQXidjhUKkuo7pFuGI3Voda0ph2Y/OeLF/wJP3NFxCOmVZg0+SIZu4412umY6B5E
         cI4RpmIXsaKP//C1v9i8of8Fve1jQFW4sQoqOHjP0OFyRqG+2JA9lYxi9wtvXm/DFFts
         FYhNXm6Bb8gp12tq0XczzzW1P8+pyM5uXLBhgRXZYRrwFPoOm9ZHT4i3eQt4ih4/3jDq
         SHdplEWvwIcQedud4DcWbaq34+U3f2x4GxrC/Z5BQZfBKFa3xxNXFo20lexG4V6zPEav
         5wdgJwtJiIm5oe2GqfzoMMEHQCP1SPqehO0ukaSvANvd9iNOflTSlM4IlNlxnRwS1v0V
         1vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687430343; x=1690022343;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyBILI3qy1jyGfwZMlXs7rxAIorFnavFxj7L2gvgWSM=;
        b=lA26qsL3DZA0r07rp5t6gn088J119iUUeOFoS6cJxo6xdmrc9PV5iO+mSE2egLRxBX
         2SB7/CKADiZ4rXoL3IQbhBxMqohI9sKnx1VYhIJCN3DwIQAqFO4L992jRkGOpE1Mhs8i
         XsNMchYBiZ/H7O7snc08LzbAngVvBcuKA20hAzUW+zropB32jqX8yfcU+JxlKNaWvD9b
         PrVRozy5ZzusNaoJWt05PWgl678rL7CYqBRraj58sWbaAmWUZRRPHB4eqDC+hprQKngD
         Tqe5vIvIRWro28uBSBUXmvqqQDNWWFNuJZDJJ+WqlaYJSz2265fOf7hYxvLdNTABKlcY
         zD1A==
X-Gm-Message-State: AC+VfDzUKz3yy/5X/9TfFusUWqMkgD/JAXDHlf3tlSh8nAhloJG0po3B
        p0P2h9Y5FE4Dh037o7nTmgG8LS33N8FoICqZKKpyEA==
X-Google-Smtp-Source: ACHHUZ4AxvvEP+Y5C/LlTnA5soTBZLu/ugo9cV3AFgGLnL0etqw5hCHTrbMXM6KRYzt35lmPGCnsSg==
X-Received: by 2002:a05:600c:2051:b0:3f7:3545:4630 with SMTP id p17-20020a05600c205100b003f735454630mr17688183wmg.20.1687430343555;
        Thu, 22 Jun 2023 03:39:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f692:a800:4794:385? ([2a01:e0a:982:cbb0:f692:a800:4794:385])
        by smtp.gmail.com with ESMTPSA id u16-20020a7bc050000000b003f080b2f9f4sm18420353wmc.27.2023.06.22.03.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 03:39:03 -0700 (PDT)
Message-ID: <286cf2d8-2da8-7203-ee53-bf08332fa519@linaro.org>
Date:   Thu, 22 Jun 2023 12:39:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_DRM dependency
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230622101813.3453772-1-arnd@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230622101813.3453772-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 22/06/2023 12:18, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This driver calls directly into DRM functions and fails to link if
> that is disabled:
> 
> ld.lld: error: undefined symbol: devm_drm_bridge_add
> ld.lld: error: undefined symbol: devm_drm_of_get_bridge
>>>> referenced by nb7vpq904m.c
>>>>                drivers/usb/typec/mux/nb7vpq904m.o:(nb7vpq904m_probe) in archive vmlinux.a
> 
> Fixes: 88d8f3ac9c67e ("usb: typec: add support for the nb7vpq904m Type-C Linear Redriver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/usb/typec/mux/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 8c4d6b8fb75c3..f53ae24b6c048 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -37,7 +37,7 @@ config TYPEC_MUX_INTEL_PMC
>   
>   config TYPEC_MUX_NB7VPQ904M
>   	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
> -	depends on I2C
> +	depends on I2C && DRM
>   	select REGMAP_I2C
>   	help
>   	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C

I think it could be :

+	depends on DRM || DRM=n
+	select DRM_PANEL_BRIDGE if DRM

Neil
