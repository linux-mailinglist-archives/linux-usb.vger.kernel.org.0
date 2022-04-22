Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A91D850C3DE
	for <lists+linux-usb@lfdr.de>; Sat, 23 Apr 2022 01:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbiDVWZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 18:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbiDVWZd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 18:25:33 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0C9CE49B
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 14:17:33 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id b95so16719254ybi.1
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 14:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AEXINFBxuSdD+7ajNy/LTJwAuKduMs79L1VZw5ckLgw=;
        b=YPX9uaDWm6FyszcIeSL6VLxMtHjGpipQS1CT+MROq+lyzWSXP9zeOJilU3YTuHeADl
         gVfMx7CZ/Bp1jpwp63gKAwhhwytpJb+IeqrtAMVC6/5CIX3Ky3jzzBWpPocZ+B2rJ9pI
         PgEIW9H0Q9RYS8itMZnvFXFkypugEZSo8611na4wlf1KUSbzAXaq0bn4IBI2vWmwvmzi
         ZjMTjnLJ/JnM5ssLK+3n8M1QfuhPVPFT3dG+jYE+WDQrXqIlmNh4BZ1B+i/NoNMbs6mm
         95AoR8XauXSPoozrjT+qgPfex9J2yOUOUBCjKAmESZZaYT5LSsVsU3MUjXU0rxnlGpAD
         tC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AEXINFBxuSdD+7ajNy/LTJwAuKduMs79L1VZw5ckLgw=;
        b=vgNKYYZdGBUmw9hmsFIAQwX4/d6/JG1c7JVfts3kQJAeQrY4+kA4ImtIQhLGOVC6pX
         gBBNhu46JmfzDfS5vTUp2ezTAMyhuOJUfRBbrIAsqpR9GY9tg8DC4MSG0U5hI6bgBuZk
         baQWA13+pi8jD1Vkwg7ksYiZgb2Ty/B525bNP+tfecjh9m6umJHcXsCw+30OM8CGNyUo
         kBpxXBX0CPo6fjaqElKIU1qpt0yNsfs7q7ppp4sP4pg56k9vBGQqpM/Ou8OTTgGP6PN9
         bDy/cIucZ4Pda3Kf2dGWJLLsb3IPurSZ5H8emM579b1NRxdbFQTGUodI82JRj8jSIlH7
         zdIg==
X-Gm-Message-State: AOAM5324vEd4XoqMS9TE2MdDQwC2bXbA4R6/FTQjGCQhpXxEq59JXqg/
        iBqHVEX6BSj+dNyCUSSfvXuruCDWCKryShbqHkSN9CubTZU=
X-Google-Smtp-Source: ABdhPJwEMor42osEuSk1UZ2FnNZS/vcpuI9uXKIDxgV1q2FGoggt/IKFaagXtPhObqlqNzaaHAXkGaXNYoZps1VvbDQ=
X-Received: by 2002:a25:e6d5:0:b0:645:7257:8271 with SMTP id
 d204-20020a25e6d5000000b0064572578271mr6674251ybh.291.1650662252356; Fri, 22
 Apr 2022 14:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220421074204.1284072-1-hch@lst.de>
In-Reply-To: <20220421074204.1284072-1-hch@lst.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:17:20 +0200
Message-ID: <CACRpkdbdKBfmXGdyTm3T-MFAK30N-z4KH0k8eD8F7xaYUbDDhA@mail.gmail.com>
Subject: Re: fully convert arm to use dma-direct
To:     Christoph Hellwig <hch@lst.de>, Marc Zyngier <maz@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 21, 2022 at 9:42 AM Christoph Hellwig <hch@lst.de> wrote:

> arm is the last platform not using the dma-direct code for directly
> mapped DMA.  With the dmaboune removal from Arnd we can easily switch
> arm to always use dma-direct now (it already does for LPAE configs
> and nommu).  I'd love to merge this series through the dma-mapping tree
> as it gives us the opportunity for additional core dma-mapping
> improvements.
(...)

>  b/arch/arm/mach-footbridge/Kconfig                   |    1
>  b/arch/arm/mach-footbridge/common.c                  |   19
>  b/arch/arm/mach-footbridge/include/mach/dma-direct.h |    8
>  b/arch/arm/mach-footbridge/include/mach/memory.h     |    4

I think Marc Z has a Netwinder that he can test this on. Marc?
I have one too, just not much in my office because of parental leave.

Yours,
Linus Walleij
