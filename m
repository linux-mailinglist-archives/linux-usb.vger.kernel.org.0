Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8864E5EFE8A
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 22:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbiI2US7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 16:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiI2US6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 16:18:58 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899CB14C077;
        Thu, 29 Sep 2022 13:18:57 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id d64so2745483oia.9;
        Thu, 29 Sep 2022 13:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=m+LtZezSoejCmaSlzKPR1dFZa6NPgFMykr2286pxHK4=;
        b=q6GptClQIvix5x9CfSPaMdV7x5rgCnBkxQ52OQWcC4hJepc0vwxZM4elAVZwBoY3Da
         904SvzvMmjIGjrpitEod1BL6aGkVW5MzU1UitP20r+55P9qMuJWhY5KkozvR4F03aoed
         nBeEhtg6h6Z0ZM0Stv8qQAAmSAthrFkX0ZW79L42hEJ/CPBh9K7IRiOD18+9vYQIPizJ
         fgzqXrQNpSNCh9DfCAZHpwPZYRCB3Xl4/JmwCXJ0xEvbJl0LwawFP0jQsTWDSAw2sftJ
         SQy4o71bQHYXuyOUjKa/gsa/yJnaC4IFLM6o/IFNGZ+8GxghmWaOxoL0FuGFZ7yzoQUS
         5vdQ==
X-Gm-Message-State: ACrzQf35Kybl3Z+GpEQXKN3WmY1fG+rnk6YaNzAYYGip6yj0GxhJ/fp6
        4+a4Q7tfKLpIm8T/AtphJ9I1aTMS9g==
X-Google-Smtp-Source: AMsMyM70THj4T/NgeO/8rEP9K/B6ecHaWxDzocr5f0s9/rSqIa78bpUFxKRPbZqQx8HOjNv1usa6Xg==
X-Received: by 2002:a05:6808:3dc:b0:34f:6682:b4cd with SMTP id o28-20020a05680803dc00b0034f6682b4cdmr2516231oie.58.1664482736821;
        Thu, 29 Sep 2022 13:18:56 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m5-20020a4a3905000000b0043540f7701esm94797ooa.31.2022.09.29.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 13:18:56 -0700 (PDT)
Received: (nullmailer pid 2669746 invoked by uid 1000);
        Thu, 29 Sep 2022 20:18:55 -0000
Date:   Thu, 29 Sep 2022 15:18:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: Re: [PATCH] dt-bindings: usb: Convert FOTG210 to dt schema
Message-ID: <166448273514.2669701.5127784169265381841.robh@kernel.org>
References: <20220925123546.770843-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220925123546.770843-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 25 Sep 2022 14:35:46 +0200, Linus Walleij wrote:
> This converts the Faraday FOTG210 OTG USB controller to use
> a YAML schema. We add all the right includes for OTG controllers
> and make it possible to specify dr_mode and phy.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/usb/faraday,fotg210.txt          | 35 ---------
>  .../bindings/usb/faraday,fotg210.yaml         | 77 +++++++++++++++++++
>  2 files changed, 77 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/faraday,fotg210.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/faraday,fotg210.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
