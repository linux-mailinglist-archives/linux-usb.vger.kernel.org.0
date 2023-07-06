Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBE0174A453
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jul 2023 21:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbjGFTSc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jul 2023 15:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjGFTSb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jul 2023 15:18:31 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D471B1FC6;
        Thu,  6 Jul 2023 12:18:28 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-785ccf19489so38183339f.3;
        Thu, 06 Jul 2023 12:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688671108; x=1691263108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faxYBbkQkNObmdMc/UQbbUm/hK3wFyofz1gvqfG1ZAI=;
        b=bnvp8zghDroiu7Zhx8wtj3jO926IoH43utxYHD4CtVtavupTyH/thCan9LM1zjFChK
         q1lpo8Ch3d7jg8plrBY+3SwarTEYjGSh5IWsHPyzCySLwOepXXQseZ97uQ202dKABZgV
         J+xOiVYNPLl/dxVHkAcIvzOMjGQejRv0I/P4mREiA+NWNmsnMXx6yVR+C07sf6DNgpWb
         f6SaYthSFMm4wVAEGilkhRwqAt7pVEocswECxr3RsNmzn/KZCHb5Xrw+91ts0Fu90nwK
         dvdiX4mcNuHdR7+eupYNZWdUNvCP89biVfQezlwS7dKjeYbypaPj2wnAw/2KUzr2+adU
         ulDw==
X-Gm-Message-State: ABy/qLYidU4dyJbM5Mm2IZXp4DBM2UEI80RAovcAOaExtnon8+xO8w2d
        D5PdsIjprYLoTjr7sXs3hg==
X-Google-Smtp-Source: APBJJlHhDQu+XP5X/+eyrY1BNM6jiIubxCPBwZi3080/0+VQd6I0eOXPQnvqJbl0iykgztx+ippEaA==
X-Received: by 2002:a6b:760f:0:b0:785:d28f:1526 with SMTP id g15-20020a6b760f000000b00785d28f1526mr2960814iom.3.1688671108093;
        Thu, 06 Jul 2023 12:18:28 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id i13-20020a02ca4d000000b004267abdb240sm692774jal.38.2023.07.06.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:18:27 -0700 (PDT)
Received: (nullmailer pid 177010 invoked by uid 1000);
        Thu, 06 Jul 2023 19:18:25 -0000
Date:   Thu, 6 Jul 2023 13:18:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: usb: ci-hdrc-usb2: Fix number of clocks
Message-ID: <20230706191825.GA170669-robh@kernel.org>
References: <20230706093928.3580544-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706093928.3580544-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 06, 2023 at 11:39:28AM +0200, Alexander Stein wrote:
> Some (older) IP cores require 3 clocks, named 'ipg', 'ahb' and 'per' while
> more recent IP cores just require one. Fix the number and explicitly
> state the clock-names.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> >From I can tell, is that imx25, imx27, imx35 have specified 3 clocks in
> their DT.
> IMHO minItems for 'clock-names' can be removed as I presume that this
> property is not set when only one clock is used.

Rather than presume, did you test that? Well, I did[1] and can confirm.

Reviewed-by: Rob Herring <robh@kernel.org>

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230706093928.3580544-1-alexander.stein@ew.tq-group.com/
