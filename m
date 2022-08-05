Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B605B58B282
	for <lists+linux-usb@lfdr.de>; Sat,  6 Aug 2022 00:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241310AbiHEWzm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Aug 2022 18:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241265AbiHEWzl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 18:55:41 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D7511C0B
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 15:55:40 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a7so7392958ejp.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Aug 2022 15:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=puij2beJO9hYAB1eciKRnLNvVRh/gtLqmDF4nwZ+p6c=;
        b=HpLSttOzDSTpOIUjAJDRq+Nl/JF8jMde3MHpShVKHbIFCpqbqN1+MDKcSkzK2ALJo8
         O85aPTI3egNwZYEnL0LU2IUSyGHhwVbcOd3Sn6ipwyWkeOmpXNO/kQeeyZah15XEfE56
         wWImdw6e45kEunNw+g3eH5B8/HEvPN40DDTXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=puij2beJO9hYAB1eciKRnLNvVRh/gtLqmDF4nwZ+p6c=;
        b=2qM57EqgM8/jMH0NY+CL0iA7whzYtPeduq0pm65jzXMjhh3Ov2ASVM8qSCHu+5yaE0
         NmzkS9Hf98HaXTis81LktltIILtmKJlBOM6XxjcyJNSVLck4zBPJJ0VYJmBNYVyqkWLv
         yfkmg+jj50CFv0DLxZDRZuzh29dJWVcRkLGzhYWi6e8yxaEf3NoItLkA25cbZVVEmMBs
         ZYxxOkJd2B0ojJhl/qUajQRdtx87AgbADFLJqT1JhTHPnSOsYN7fg9J/eb1qpI/Z4f+G
         2ldojqV0KysmNRUQSxC5YbSYW/FJgiUYeDHq3VeTEcySH1FlBucqYhtV8LZoEGAFuzlC
         +wHw==
X-Gm-Message-State: ACgBeo2t+r2eElrB+D4FdNVjqk0HbDU2lS8G4Cdoa1s7mGStx7oEhjT6
        2cvGYqlF6UU2WNsCV3/bik9WTvpGG4CEwZvW
X-Google-Smtp-Source: AA6agR74ySbCaWZ85+YjVCqppNgdsjD7zzJOsK1EZ0dgKVcy0SwiOrqY9+eN7Nl/6jaxxp+1I01FZA==
X-Received: by 2002:a17:907:7ea7:b0:72b:6e6b:4895 with SMTP id qb39-20020a1709077ea700b0072b6e6b4895mr6472658ejc.338.1659740138435;
        Fri, 05 Aug 2022 15:55:38 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063caa00b007262b7afa05sm2025093ejh.213.2022.08.05.15.55.37
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 15:55:37 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id z17so4709065wrq.4
        for <linux-usb@vger.kernel.org>; Fri, 05 Aug 2022 15:55:37 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr5532612wrr.617.1659740137452; Fri, 05
 Aug 2022 15:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220805111836.1.Id5a4dc0a2c046236116693aa55672295513a0f2a@changeid>
 <CAD=FV=W9VWbvWqdEEY9=OnNSsAnQ+CgQPRifbAu2ixrgPQd54A@mail.gmail.com> <Yu118qfzoYcHgJs3@google.com>
In-Reply-To: <Yu118qfzoYcHgJs3@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Aug 2022 15:55:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4ULDUAj-X1eMpMmvYoxTRA0ujAabniEYOCrMo7Zv-JA@mail.gmail.com>
Message-ID: <CAD=FV=W4ULDUAj-X1eMpMmvYoxTRA0ujAabniEYOCrMo7Zv-JA@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: onboard_usb_hub: Drop reset delay in onboard_hub_power_off()
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Aug 5, 2022 at 12:56 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi Doug,
>
> On Fri, Aug 05, 2022 at 12:26:35PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Aug 5, 2022 at 11:19 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > onboard_hub_power_off() currently has a delay after asserting the
> > > reset of the hub. There is already a delay in onboard_hub_power_on()
> > > before de-asserting the reset, which ensures that the reset is
> > > asserted for the required time, so the delay in _power_off() is not
> > > needed.
> > >
> > > Skip the reset GPIO check before calling gpiod_set_value_cansleep(),
> > > the function returns early when the GPIO descriptor is NULL.
> > >
> > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > ---
> > >
> > >  drivers/usb/misc/onboard_usb_hub.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > I was trying to figure out what this "reset" was defined to do and I
> > looked for the device tree bindings. They don't seem to exist. Was
> > that an oversight?
>
> It's not in the binding of the RTS5411 which I guess you looked at,
> because that hub doesn't have a reset line.
>
> The reset functionality was initially added for the TI USB8041, the
> binding has the reset, but I found it hasn't landed yet:
>
> https://patchwork.kernel.org/project/linux-usb/patch/20220727093801.687361-1-alexander.stein@ew.tq-group.com/

Ah, I see. I actually clicked on the "Link" for the patches that
landed and found that they landed without a bindings patch. I guess it
dropped on v4, which I see you yelled about in v3. ;-)


> > In any case, I'm not convinced that your patch is correct. Timing
> > diagrams often show a needed delay between adjusting a reset GPIO and
> > turning on/off the power. The timing diagrams can sometimes show a
> > required delay on both sides. I guess at the moment the only user of
> > this reset GPIO has a symmetric delay, but I can totally expect that
> > someone could come along and say that they needed 10 ms on one side
> > and 1 ms on the other side...
>
> As of now none of the supported hubs (there are only two of them) has
> an asymmetric delay. The RTS5411 doesn't have a reset line, and the
> TI USB8041 only specifies a power on delay (in my interpretation).
>
> [1] has some discussion between Alexander and me about this second
> reset. The patch that added the delay was merged before this
> discussion concluded.
>
> If the driver is going to support a hub that needs an additional
> reset delay when the hub is powered off I'm totally in favor of
> adding that delay, however that isn't currently the case in my
> understanding. If you draw a different conclusion from the TI
> USB8041 datasheet please let me know.
>
> [1] https://patchwork.kernel.org/project/linux-usb/patch/20220727141117.909361-1-alexander.stein@ew.tq-group.com/

Ah, OK. With this context:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
