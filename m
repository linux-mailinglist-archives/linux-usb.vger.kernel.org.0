Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADBA4BDBB5
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 18:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358138AbiBUMkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 07:40:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358111AbiBUMkX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 07:40:23 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0751928E
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 04:40:00 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so2025330wmp.5
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R/f51CIZR0643bv1aqteYa+9eUKhtWxP5/qjv85KXj8=;
        b=bameRcwi6JoaD2M3I7RYimjEysOpTD99zApAfcKTy8lF1obgbQ6PoH6zMBRJ2an/ra
         XhZzLk3+P+LvmUJZSRGo4u8NywtRdT60Ep/BJndTU9XZN0l/x97cjTIiC6uUhPa5CI+u
         2yGfP0g/fZlGpKCNHecWTXhTofhlVHrxTrfUcXfIPQXu6FzNUZvuCnIubkD51i96XpnI
         YhGDkFnBSIt8SZ6nEEVsX44HT5XlTjrJVeA5v9cK/0vDZiU66acvNjNqWq/oXo3STiGl
         rYWGVpV0RfbMjPmDFPQQkEEq89/Q7TdhtztPWUmgT2lujlH966adrVVYnJYctL7JNq+P
         3cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R/f51CIZR0643bv1aqteYa+9eUKhtWxP5/qjv85KXj8=;
        b=jGADGCPb/OMAMhrLUklzR+YRpOTByy78Bk6KyUVsFz7hZh9WRp6+eHdEC2sGikqJHQ
         1Ef0MAy6XQBB5cCo6PQL2wN2XFogZFAsv7gsehJRA65ZNGKUhgoeHvhKMsvW5Mh2QUEd
         wHdR7o3cJk31aUXG3NJZUvDM+lof2eU8JgHrZmhc/9GHc+0taWZfv+2NuK8mEHASYwRR
         T7aT33VKQ4Smqa+ReW7iYa+AqPrq6y3LVV8A03R88Xj7WAuSDvHBSXsqLgrarfbAK7sc
         tOMxhVvodW3nXbPV207AXaf7eWOnQEin5DVZCvXGSzhSlCJ3t2TTket9B8K4Dce+97uJ
         +5ig==
X-Gm-Message-State: AOAM530NeIyVhaor9kbzeoZ8LEni+fblNT9Q7hG/88R6SPGESovpNxYw
        Lajf1b7sCxoFhDGDHNRbeAbZng==
X-Google-Smtp-Source: ABdhPJxkJi1EPLjYr7iSmElxNRVJGzj1OLsfkUvsS+BfolnnyJhH3DB/wikuEdQKXWXlhbT3n4hdJg==
X-Received: by 2002:a05:600c:1e0e:b0:37c:6c82:72a6 with SMTP id ay14-20020a05600c1e0e00b0037c6c8272a6mr21033143wmb.35.1645447198661;
        Mon, 21 Feb 2022 04:39:58 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id h11sm32207945wrr.64.2022.02.21.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 04:39:58 -0800 (PST)
Date:   Mon, 21 Feb 2022 12:39:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: update Roger Quadros email
Message-ID: <YhOIHARSdIliVWjW@google.com>
References: <20220221100701.48593-1-krzysztof.kozlowski@canonical.com>
 <2e33c00b-8460-3d85-92aa-2c3257725c2c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e33c00b-8460-3d85-92aa-2c3257725c2c@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 21 Feb 2022, Roger Quadros wrote:

> On 21/02/2022 12:07, Krzysztof Kozlowski wrote:
> > Emails to Roger Quadros TI account bounce with:
> >   550 Invalid recipient <rogerq@ti.com> (#5.1.1)
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Thanks so much!
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

I assume you mean Acked-by (if you are the maintainer) or Reviewed-by?

> > ---
> > 
> > Roger,
> > You should also add a mailmap entry for your inactive emails.
> 
> OK. I will send out a patch for this. Thanks for the hint. :)
> 
> > ---
> >  .../devicetree/bindings/mfd/ti,j721e-system-controller.yaml     | 2 +-
> >  Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml         | 2 +-
> >  Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml         | 2 +-
> >  Documentation/devicetree/bindings/usb/ti,keystone-dwc3.yaml     | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)

What's the merge-plan for this Krzysztof?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
