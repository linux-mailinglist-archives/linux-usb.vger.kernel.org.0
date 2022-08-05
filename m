Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4482158B090
	for <lists+linux-usb@lfdr.de>; Fri,  5 Aug 2022 21:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238584AbiHET4k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Aug 2022 15:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbiHET4i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 15:56:38 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB5310567
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 12:56:38 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso9213430pjo.1
        for <linux-usb@vger.kernel.org>; Fri, 05 Aug 2022 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/xQgp4opYOG0vmRMTReD0uWzh7NbyzqbCzsK8/nQYSo=;
        b=R9jZhtKbUQnEneEQjJ8jLw7PLvhRt45Tl67KG4Od/o0c44dIGta/DDx3Pzl+fNbna4
         A8dY1W1Ak++zvNw88n7hf6sLx11tz1KhsCFKwfnyes7mGI9ZDqMqNKMrvmjjfju1ismb
         4fQpfjC14tIAIjPv6QfpQRYlYQdhc1oy8l4+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/xQgp4opYOG0vmRMTReD0uWzh7NbyzqbCzsK8/nQYSo=;
        b=BbfToOtmMfzAEFhUH+7E2ZiWbcCFWEFLf9FN8LLoZL32sBUori7vNScDn8k5KBzIRQ
         UQPvsKk2oJ19CIDHp/K8NtT/Wc2zbF8D5fE1Nopc+TjILQStAOuNAux3gCJGod34N5S5
         6VKMpC5ZmvklKHxHBUiHJphf8IIZC8JPpL/qyEjb1HQItO1sX+F+v1d4Q6yeD4Ejti3b
         abLKBxrnDVK5uPVj8vl/fK2Mc6nOrPgdX1mIHBUeQTWFxtSsKr8VFhnx6NRGHltKK4oG
         MzDRZX4kTmWntsc88Tda65vlS3qkOFtzLunmm7+mjGTRRgX/cJyJ2ktbb/YmdDadg/8T
         4azw==
X-Gm-Message-State: ACgBeo1Fh1OSorIDANb8iX7PC6jCE1EJ5xghVm1AodVTozg/cwCzae0D
        7L+FysEOnxV7faImWl/T9C9SlQ==
X-Google-Smtp-Source: AA6agR7K8LcP635a8rB8xE9ZBlfwu99pVvBL/VC185RKUOzC5U67ib7PnUOjVI0QLKGrxY38sD5J2g==
X-Received: by 2002:a17:902:db12:b0:16e:e5fc:56db with SMTP id m18-20020a170902db1200b0016ee5fc56dbmr8545810plx.46.1659729396437;
        Fri, 05 Aug 2022 12:56:36 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:c59c:1680:614c:3338])
        by smtp.gmail.com with UTF8SMTPSA id h10-20020a170902680a00b0016dd1e8c1ddsm3326736plk.247.2022.08.05.12.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 12:56:36 -0700 (PDT)
Date:   Fri, 5 Aug 2022 12:56:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: misc: onboard_usb_hub: Drop reset delay in
 onboard_hub_power_off()
Message-ID: <Yu118qfzoYcHgJs3@google.com>
References: <20220805111836.1.Id5a4dc0a2c046236116693aa55672295513a0f2a@changeid>
 <CAD=FV=W9VWbvWqdEEY9=OnNSsAnQ+CgQPRifbAu2ixrgPQd54A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=W9VWbvWqdEEY9=OnNSsAnQ+CgQPRifbAu2ixrgPQd54A@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Doug,

On Fri, Aug 05, 2022 at 12:26:35PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Aug 5, 2022 at 11:19 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > onboard_hub_power_off() currently has a delay after asserting the
> > reset of the hub. There is already a delay in onboard_hub_power_on()
> > before de-asserting the reset, which ensures that the reset is
> > asserted for the required time, so the delay in _power_off() is not
> > needed.
> >
> > Skip the reset GPIO check before calling gpiod_set_value_cansleep(),
> > the function returns early when the GPIO descriptor is NULL.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  drivers/usb/misc/onboard_usb_hub.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> I was trying to figure out what this "reset" was defined to do and I
> looked for the device tree bindings. They don't seem to exist. Was
> that an oversight?

It's not in the binding of the RTS5411 which I guess you looked at,
because that hub doesn't have a reset line.

The reset functionality was initially added for the TI USB8041, the
binding has the reset, but I found it hasn't landed yet:

https://patchwork.kernel.org/project/linux-usb/patch/20220727093801.687361-1-alexander.stein@ew.tq-group.com/

> In any case, I'm not convinced that your patch is correct. Timing
> diagrams often show a needed delay between adjusting a reset GPIO and
> turning on/off the power. The timing diagrams can sometimes show a
> required delay on both sides. I guess at the moment the only user of
> this reset GPIO has a symmetric delay, but I can totally expect that
> someone could come along and say that they needed 10 ms on one side
> and 1 ms on the other side...

As of now none of the supported hubs (there are only two of them) has
an asymmetric delay. The RTS5411 doesn't have a reset line, and the
TI USB8041 only specifies a power on delay (in my interpretation).

[1] has some discussion between Alexander and me about this second
reset. The patch that added the delay was merged before this
discussion concluded.

If the driver is going to support a hub that needs an additional
reset delay when the hub is powered off I'm totally in favor of
adding that delay, however that isn't currently the case in my
understanding. If you draw a different conclusion from the TI
USB8041 datasheet please let me know.

[1] https://patchwork.kernel.org/project/linux-usb/patch/20220727141117.909361-1-alexander.stein@ew.tq-group.com/
