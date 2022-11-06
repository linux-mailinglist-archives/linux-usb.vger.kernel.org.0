Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430C461E784
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 00:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiKFXUa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Nov 2022 18:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiKFXU3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Nov 2022 18:20:29 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF960A186
        for <linux-usb@vger.kernel.org>; Sun,  6 Nov 2022 15:20:27 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id 13so26019953ejn.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Nov 2022 15:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fC4lW/Qhy2fZHlD2/XbvAAK+i88cBWDvfHjm2okyfsw=;
        b=bcgkJp1VbSWe3KT3BAO3O9ReAiaGNrm6BYKp1iVtxaztyghKnWsmYQT4ROLwTI22h7
         1Ayy1RFZt47U77Xcmwtaoqst2NLEExNRfUeecJPIeaYTYs0vOx54gk98IMeEfk3n96Bj
         7Ubxyc51P81rmk2Jlg7CL//hWqE/7pgt/OYRyvTnmxGBfKZoDaWEyBGYjTHMhADL/qj3
         vhH3LZNBbCNHA5LyGJiFyJBkJPoUORfsSd6LH/RhZlOfYL4c25XgIpFXXx/uFDyG/TBt
         u/yQ6bCMF97/PjC1LZYHg+NvuBIUfgsWQSOUHpzX0n0dGdSe3dQ9C7/AGxEj8AD+t+40
         Tshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fC4lW/Qhy2fZHlD2/XbvAAK+i88cBWDvfHjm2okyfsw=;
        b=4mC+GDX6PKax1JYrD/xrj986iox/PU2KQQhsbfXwkkCXd+lvf8Hs7E1fIMob+hdJgU
         NqU17SZQhSmrYaERGowYwJoccjK5FK+VCYhKpRC9tBJm4NUGWxTJDEr7jZIRy/LdfQEb
         QspABXEr29dQ1D9feEZciwtWmWjiQiyWePlC2caC7r6kIizrM2cgXsAZcjTks0v14BL8
         JQXSP5/geV7515GwPO6shUjrKRlkH/c42apRHCwWwFUNchppdigxdrAYR0LhR5yacc0g
         WeGKv8Qa4YnxsDQ9KmPDs68WDEw0zJ1vr5NNmZlVsz4/gs8aqUxGf+cw3NGaRtnTb9hO
         KrPg==
X-Gm-Message-State: ACrzQf3Vr3vmi6gGm3MiVDc2/eklgglFQHJ+lH7NPx8zmt7SSHgV+FKB
        oprSjRpnaOWRjhUEfhQdyVbLnGLVrBhtN/OPWj/BCg==
X-Google-Smtp-Source: AMsMyM6/LgP3iZcl1XJw9nSeHT5FDROLnFdhThude4AK+/aVJyTAu35aQ4zmVI8DoXvw2uIWeslD/BkEESepKmyl+MU=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr46091190ejw.203.1667776826285; Sun, 06
 Nov 2022 15:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20221023144708.3596563-1-linus.walleij@linaro.org>
In-Reply-To: <20221023144708.3596563-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Nov 2022 00:20:14 +0100
Message-ID: <CACRpkda=nbOcXSMNjnJjhL6KaCk_yYD42tSZ3qcxD2bBDWQ2Ag@mail.gmail.com>
Subject: Re: [PATCH 1/3 v1] usb: fotg210: Collect pieces of dual mode controller
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Oct 23, 2022 at 4:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The Faraday FOTG210 is a dual-mode OTG USB controller that can
> act as host, peripheral or both. To be able to probe from one
> hardware description and to follow the pattern of other dual-
> mode controllers such as MUSB or MTU3 we need to collect the
> two, currently completely separate drivers in the same
> directory.
>
> After this, users need to select the main symbol USB_FOTG210
> and then each respective subdriver. We pave the road to
> compile both drivers into the same kernel and select the
> one we want to use at probe() time, and possibly add OTG
> support in the end.
>
> This patch doesn't do much more than create the new symbol
> and collect the drivers in one place. We also add a comment
> for the section of dual-mode controllers in the Kconfig
> file so people can see what these selections are about.
>
> Also add myself as maintainer as there has been little
> response on my patches to these drivers.
>
> Cc: Fabian Vogt <fabian@ritter-vogt.de>
> Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Greg are these fine to merge? I have some more patches coming
so I would like to establish these as a base.

Yours,
Linus Walleij
