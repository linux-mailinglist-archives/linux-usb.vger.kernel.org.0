Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09DD5F557C
	for <lists+linux-usb@lfdr.de>; Wed,  5 Oct 2022 15:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbiJENdv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Oct 2022 09:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiJENdo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Oct 2022 09:33:44 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BA47AC09;
        Wed,  5 Oct 2022 06:33:42 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-131dda37dddso18909479fac.0;
        Wed, 05 Oct 2022 06:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RSZ7p39bPySRyp3ZYnc2GXn16T4gnRgZQLWCfApSP4=;
        b=LJFPEiftJhK9x9nwDlLQcY3SzVc7sJXGDo+HyP3T04mFTiwRRbnn4HV+Z0atTPWkL4
         Wm3e28kBK93X15qUJhjp1vwa5yDtPagBMOMwmZugbZYQAUqG/ru6CBnEELCpKR3tUxef
         WJyfpBeWs6jC/htRIkuAHnA8z2We+dsULddRWw9EGiIDaIMvJEVJgtKcxZRYDIwz4QI9
         LnGudFDriSB55+V1nyjFu8ilpb6PTjDfoDMc72P6lpz/+bz7QTYnXQWeQq7nD9o/3dkX
         Z++Fr2119KT6CQm7Ki75IPRdZg7i7OxowDaRCEN4J2i41velmWkgSBcbd3MSiobYPoyI
         9fww==
X-Gm-Message-State: ACrzQf38fpUPDWRcn4x2L9lMeuhHUNbW5BDhLvt6euJROG9L60ZtGdFh
        pOKRGbwTr1yeS3KGDu6OCg==
X-Google-Smtp-Source: AMsMyM6Lx+7iK3Wg4TlEXDbgxTT5YLzZkj+D4Evf1BZk/JTedoOaRMJSXlKdXt+huTl/dKZ1Dg5W/g==
X-Received: by 2002:a05:6870:9a1e:b0:132:411:9a with SMTP id fo30-20020a0568709a1e00b001320411009amr2708858oab.108.1664976822069;
        Wed, 05 Oct 2022 06:33:42 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:5fee:ea3a:4239:ad4:650a:6e66])
        by smtp.gmail.com with ESMTPSA id y12-20020a056870428c00b0013191b00f72sm5050752oah.17.2022.10.05.06.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:33:41 -0700 (PDT)
Received: (nullmailer pid 3278796 invoked by uid 1000);
        Wed, 05 Oct 2022 13:33:41 -0000
Date:   Wed, 5 Oct 2022 08:33:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: dwc2: Add some missing Lantiq variants
Message-ID: <166497681636.3278671.14523867713458185039.robh@kernel.org>
References: <20221005105555.2665485-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005105555.2665485-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 05 Oct 2022 12:55:55 +0200, Linus Walleij wrote:
> These IP block variants appear in various vendor trees and
> are distinct variants which needs to be handled.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
