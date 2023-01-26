Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE25667D5DA
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 21:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232704AbjAZUCo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 15:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjAZUCn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 15:02:43 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A725A6BBE8
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:02:42 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4a263c4ddbaso39313377b3.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qbZkAXpRRXuaoLGdgGQaeuOAxkp7fwD+358/MFRmgg8=;
        b=IctFFn8Wu+MjJdkON9IrUC0omDvJ6LrBbVzSA9ifl/xrvZKzIaBeM5EjFxxcAOyX2z
         DjADya93UQvXpZjN2zQ25qgGmABQvSP/cYTuLgbGCow09fQVSwHKaWNxPcPgsrLJRuI6
         wvNRlJf2Vytj/UiGnId1KAeJEP0vbnxN36M+59yDTRCnT/jESuGFr5ErFeiu/2JmFm1V
         tehkVHyRM1zRVwk1QLY8nVZY3F5c6uljwov64NZKQgM/zrptQrqt6bVxMTIjRvfwI39y
         khOR8kTKueeu2tSA9qBUQ2o+v09w3D/sORSAQsJjwFL51qac0y8KIEyq5DxOAVrhMTCt
         huKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbZkAXpRRXuaoLGdgGQaeuOAxkp7fwD+358/MFRmgg8=;
        b=D+0ZekcdsSRhTVqn/yXQ08SVneX/XHRTNmSTZCTT/lI45isGyA1JjInv/UFWQcZgp2
         nC3887vq78XxVp2XEyPXSYq0kp4qHRHMTtlvFf02mvSS83EvsoF+d1Y4QRiuEyJb/99x
         NPiFjA+k4Saxjpas4KlP7FTNh9rkEVdOjiYf2+52C0AyP7FE+RJg+Rc4/Bi6FFCQc8sC
         EHlY07kTKQ2R+7TgN8acD3VUDjpN+XqgP4eXmqC8Motou5iiF7vU9rFYLSNZBYUAI2YM
         6i5LU6KvIF3K+vjP+zKLsnAJZ15n49qbCbIN8IRaRg9qThCoth9SG52aTHkGjkCKfcjS
         cUgg==
X-Gm-Message-State: AFqh2koKnGfHiT0In0r1ViGfG5r7eiOL98ENBXCDYqhpidA28Xi3/Z4b
        5e44FSiE7DncOWq//rf4eXO2tJm6+yAJmhh+Jj+Ofg==
X-Google-Smtp-Source: AMrXdXvoIyvrgjdPpajjLx+hIpouQtN9JnGyoSuETG4T8sYTWWrCWClnahbZOSawhH2YVfO7fiqZ/BAJwBSZsOCcbeU=
X-Received: by 2002:a05:690c:39b:b0:4f3:8d0e:edce with SMTP id
 bh27-20020a05690c039b00b004f38d0eedcemr3297394ywb.185.1674763361955; Thu, 26
 Jan 2023 12:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20230120154437.22025-1-andriy.shevchenko@linux.intel.com> <20230120154437.22025-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230120154437.22025-5-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 21:02:30 +0100
Message-ID: <CACRpkdaeAkPuAQu0BW45Bn94Q_eO-Ven0-TSd38upe9XpXMzwA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] usb: fotg210: use devm_platform_get_and_ioremap_resource()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 4:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
