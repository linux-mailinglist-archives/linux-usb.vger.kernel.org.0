Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D374668F63E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Feb 2023 18:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbjBHR6d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 12:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjBHR6c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 12:58:32 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060411115D
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 09:58:31 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bi19so724191oib.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Feb 2023 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TgLgOCji2dZHQhls7vSUZNVdRziEGATWNkzFOavtl7k=;
        b=fOCnLzkbcKGLOcFK7OOpRjsO/u5lhIFi5402KJzUU0RIdwDScGAT4a5RnQfTK+yaT5
         Bg0IUgtDJpnBD/0YgfYqO0kMPETgjpxly47Af/KDh/J3CvntI8802BcHtygrsWTRJcMG
         o7RxKdUzR5oH9FV9RkO1p5SuaJ+uujqH6zk6kGBqmLdBV2b6BRzMYn3tKn6jkcLQdxJs
         5wUed+2YWAWB7gpfxPQI2vqHl4zOFdxVAk5xSKxjrnjqgKSfb30ChOcfbl4s6XYjKHgN
         Y1dsfQHb03aQfNiBPEgIeZ5e7WUR4oRCSbgDt8QqOfg577W1FW9G7zHWCS43eX74kkA6
         DoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgLgOCji2dZHQhls7vSUZNVdRziEGATWNkzFOavtl7k=;
        b=WGKFmjcolF7w1/skA9p3qC7m1+1qgZP/JSyyuznRcj/M3D60Ihtbg0TCUuzxKXItHI
         M5DlQZEZekXSWDqlpEV6M6rNIVNbCA7cajWyrKo7rRXTPozo86V2oqRweHFt5vZvwirx
         PpLRhbhdCGIIB9u0VVINmXg7SuIsyuGTtcu8G7VM+PHBnUc1gFxjsJAwb6XQvYgg1EpV
         VF88+9mCK8mkO7PWOLtCk40ZTHfSgw+DWwrYqdEtE9Jxso6Reo9AVtlsHao2nDGyG9OA
         nop237E2zHCHYn5H7GkOtM/yvXC/8xXFR3cviswtwYuxk3overIUsm1o9uFXE7CDwKOr
         0spA==
X-Gm-Message-State: AO0yUKXcZvxw8ak8/yho3ij4Ksnw/41kQ2XJvG4aLLL8IO8VHvo7ugQj
        HyNddK0e1Z1lJLLQwYLYwyoO3tDomYgC9wMeHsXDTg==
X-Google-Smtp-Source: AK7set+6iqbUGkOSFPuPRA48hsKX5OEWbfcgbLkap8EeSLkkwks4o7YMriShi19kVRN8iLT1Kjp0Q/LIETiwvYTWu1g=
X-Received: by 2002:aca:4107:0:b0:378:979:518b with SMTP id
 o7-20020aca4107000000b003780979518bmr259808oia.82.1675879108824; Wed, 08 Feb
 2023 09:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20230208163418.342210-1-jassisinghbrar@gmail.com> <Y+PafyViJMb6OOAn@kroah.com>
In-Reply-To: <Y+PafyViJMb6OOAn@kroah.com>
From:   Jassi Brar <jaswinder.singh@linaro.org>
Date:   Wed, 8 Feb 2023 11:58:18 -0600
Message-ID: <CAJe_ZhcuTX282zkkoa8ihnmNBpiXHWE7sTw2K+uB5OVkVU=P+Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: max3420_udc: fix serialized access
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     jassisinghbrar@gmail.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, error27@gmail.com,
        stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 8 Feb 2023 at 11:23, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 08, 2023 at 10:34:18AM -0600, jassisinghbrar@gmail.com wrote:
> > From: Jassi Brar <jaswinder.singh@linaro.org>
> >
> >  The mutex 'spi_bus_mutex' should be used, instead of the spin-lock,
> > while changing the state of the kernel-thread.
>
> You forgot to say why this is the case.
>
It was 'inherited' (my fault) from  drivers/usb/host/max3421-hcd.c
which has the same issue.
OK, I will also add to the log why that is a bad idea.

> > Also changing the
> > usb-gadget state need not be protected by a spin-lock.
>
> Why not?  Why isn't this a separate change?
>
Because other low-level spi changes are protected by spin-lock and it
seems ok to not to have to worry about such a race.
I don't have the h/w anymore to actually test it, so it is just a
patch from looking.
I just got lazy to break it into two patches, will do that.

> >  This should fix the Smatch static checker warning
> >     warn: sleeping in atomic context
> >
> > Fixes: 48ba02b2e2b1 ("usb: gadget: add udc driver for max3420")
> > Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> > ---
> >  drivers/usb/gadget/udc/max3420_udc.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
>
> You forgot a "Reported-by:" line, right?
>
Yes, I forgot.

thanks.
