Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36285567BD4
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 04:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiGFCZW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jul 2022 22:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGFCZV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jul 2022 22:25:21 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F36A2AE6F
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 19:25:16 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-2ef5380669cso126598277b3.9
        for <linux-usb@vger.kernel.org>; Tue, 05 Jul 2022 19:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v16gTYqXX7Kmo1KvNsCtNgX5ZllD8C1dx9oSGDIh2w4=;
        b=qExZIdQlChbVTBQMag2KMz96xQQWol3P20ZUeAIElxpP8YUTld11yydHChd5fVamnM
         N+5qpsotZzK0TkuuZ6IizCnl7c+4ebPILh1/soI6S7VgHfeLOBQkjpt4QkW3rb7TgQc3
         8Y1fBCsxkPnLvc8vUZLAQogjKTeYj5TI0mcLH7Fl5wPK008CHWLhfNWmJM//dGY59H7c
         SWa55+sGIdonk37XYCC33l3Rlwjqj3eaxLINcgOyLpKBPOvG7/rJprMVpcY5Yk6lk05G
         LKGuXAgm/AjvU+Y3IiVLZO8DD2khUxrD9ft8LKuN+OCzAUQa9x9mD7Fpt3lejxezx8gY
         c1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v16gTYqXX7Kmo1KvNsCtNgX5ZllD8C1dx9oSGDIh2w4=;
        b=27A+EJWkBt4/byUDrOn9wHrSnITbxAbFCxURH3btv43gifu/3jjO7JI4rlQMqy8O8f
         gb8Wyf+7NEWh+38bwe4p4VAqKsJRXtknUPaubE/nCGyD+2MXiiBfW8g2qZv3o3o3pQ9c
         bSQmhox6ubYETr5K34lxj80txxWeFNzt2G7sCWmanNK0mbkZg62st5f8apuIr53zbuP7
         ZmylvxcCFD+N1uYSn+x1S+Bi1Fh7vPwyLfoqYCyOByh5RpBMSi37B5XJcZOivl3QuDNi
         RrC1hRpGPR/iOu96B1WBxJJL7becfMlnK7PzssRz4OMZ8xUSh0BIBnMYFGn/khlB2k6/
         wpKA==
X-Gm-Message-State: AJIora/wWtQVRv4nRquiKfZAyUJI7a/gvJ6Zm0fa+vV1RlvZO+2J6CWS
        gRHarjgYXU7BN12EeWkvoZLRsv71cTyUQqjshvRoCaN7JnQ=
X-Google-Smtp-Source: AGRyM1tf/61PNUiHLJCWdhrW5RsdK7YOTSrVaOqqDTQ/dnBIBhZucfiBm9Bp1Z/BftKx+cQNj2c0Hpz4qkNInLWHj3c=
X-Received: by 2002:a81:34c:0:b0:31c:8b37:6595 with SMTP id
 73-20020a81034c000000b0031c8b376595mr18858230ywd.126.1657074316081; Tue, 05
 Jul 2022 19:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220705131951.1388968-1-michael@walle.cc> <CAGETcx9W3W1P2fHVBuLOJNYz1rOU6hm9fc0=JukhbxJM6gRB1w@mail.gmail.com>
 <7673314425958a56a07899b300226554@walle.cc>
In-Reply-To: <7673314425958a56a07899b300226554@walle.cc>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 5 Jul 2022 19:24:39 -0700
Message-ID: <CAGETcx-WBOJEANsf+bopmEu-MTsOGiijmFU4UZn-A0bcUCTSTg@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: gadget: udc: atmel: check rc of devm_gpiod_get_optional()
To:     Michael Walle <michael@walle.cc>
Cc:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 5, 2022 at 1:56 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2022-07-05 20:53, schrieb Saravana Kannan:
> > On Tue, Jul 5, 2022 at 6:19 AM Michael Walle <michael@walle.cc> wrote:
> >>
> >> devm_gpiod_get_optional() might still return an error code, esp.
> >> EPROBE_DEFER. Return any errors.
> >>
> >> Signed-off-by: Michael Walle <michael@walle.cc>
> >> ---
> >>  drivers/usb/gadget/udc/atmel_usba_udc.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c
> >> b/drivers/usb/gadget/udc/atmel_usba_udc.c
> >> index ae2bfbac603e..48355e0cee76 100644
> >> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> >> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> >> @@ -2165,6 +2165,8 @@ static struct usba_ep * atmel_udc_of_init(struct
> >> platform_device *pdev,
> >>
> >>         udc->vbus_pin = devm_gpiod_get_optional(&pdev->dev,
> >> "atmel,vbus",
> >>                                                 GPIOD_IN);
> >> +       if (IS_ERR(udc->vbus_pin))
> >> +               return ERR_CAST(udc->vbus_pin);
> >
> > I'm confused. Is it really an optional resource if you treat a failure
> > to get it
> > as a reason to fail a probe?
>
> If the gpio isn't found NULL is returned.

Ah, ok.

-Saravana
