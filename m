Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B969E24FFC6
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 16:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgHXO1D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 10:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgHXO1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 10:27:02 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00729C061573
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 07:27:01 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id x7so2835481wro.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 07:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=2emyNJrlb5jnYs1P9Do7LS3bNbFY/IfjxvJcHgILF3A=;
        b=GQzOCkl7SM0GbJfPqA1ei4ixX5vptg0iMa5giiWN7QkOrsE2WSMHk9TUdhiIrKu50s
         koKvRmF43Xc/TpHOswEJxYEaN9i2Irra/INxrZWyy/FVkUbZDSG/OQkHUX4PZI8IXuUv
         BGWHfMb8pa4ShXrMqslHqT8w+rIMz1MzexcHHCpSxpOZ2Qfu1N/E8O715mmI2sNFgrS9
         Ika2iR/Z8CajnvnlE5937OjY8UsUO4BcG4ZqBjlASwMg7qKB6/PFpXH28DQLPuiwB0lC
         OLML+ihQ4xyjndzsk58tMyJNhT/8LtJU28PxrQXi5iYabPModdvcBPV1hetRFdvWebkb
         j2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=2emyNJrlb5jnYs1P9Do7LS3bNbFY/IfjxvJcHgILF3A=;
        b=rgceJKugcvlEEBgF1vgw0P2l9p1ctSMIvTa87jLMSmnG/dZj6+NRiR0Tam7gguZKVQ
         KNQLGZdXK8U4rnMiAQUy4yUHjE/Ch6ruedpraL0Hpnn0wEe2xVEWRGMorAOiJBrC35Qp
         hw4+WsACDbtPyXMU84/x4NfIMTL4paItzLIf7zenjnkxfjZus8F1X7AMvAZNFPb2IA4Y
         EeUzt88CqHr5Aoj++QnTETKh6Usjr1H84W6leHFrHTmAUVfaGve32sGwsQHIUCM/sL7/
         zfpda2tx7Mn8q2AkSmKpFoo7ddKf33S5WLNCg883CL8XxZb/OF9OXYRhSskzmoCxW1cz
         YXnQ==
X-Gm-Message-State: AOAM531xczPkpGtxhzwAwr5OiuOBTWkQa2Y5dtYzSAZQNTzyolxnfMOG
        OPPaXyCSKCpHHIggcV44RYc/RQ==
X-Google-Smtp-Source: ABdhPJxhaK7T/M0F8uerHG/6BtyfrIa9WjDU8cbekxjYnSuxXuEXNdRACf99oX8emBSDFEB6g3LSgA==
X-Received: by 2002:adf:ee11:: with SMTP id y17mr6040291wrn.294.1598279220534;
        Mon, 24 Aug 2020 07:27:00 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z8sm23264799wmf.10.2020.08.24.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 07:26:59 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com> <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
Date:   Mon, 24 Aug 2020 16:26:59 +0200
Message-ID: <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Mon 24 Aug 2020 at 12:24, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Jerome,
>
> On Wed, 2020-08-19 at 17:03 +0200, Jerome Brunet wrote:
>> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
>> 
>> > The reset is a shared reset line, but reset_control_reset is still used
>> > and reset_control_deassert is not guaranteed to have been called before
>> > the first reset_control_assert call. When suspending the following
>> > warning may be seen:
>> 
>> And now the same type of warning maybe seen on boot. This is
>> happening for me on the libretech-cc (s905x - gxl).
>> 
>> [    1.863469] ------------[ cut here ]------------
>> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
> [...]
>> This breaks USB on this device. reverting the change brings it back.
>> 
>> Looking at the reset framework code, I don't think drivers sharing the
>> same reset line should mix using reset_control_reset() VS
>> reset_control_assert()/reset_control_deassert()
>
> That is correct, users must not mix the assert/deassert and reset calls
> on shared resets:
>
> /**
>  * reset_control_reset - reset the controlled device
>  * @rstc: reset controller
>  *
>  * On a shared reset line the actual reset pulse is only triggered once for the
>  * lifetime of the reset_control instance: for all but the first caller this is
>  * a no-op.
>  * Consumers must not use reset_control_(de)assert on shared reset lines when
>  * reset_control_reset has been used.
>  *
>  * If rstc is NULL it is an optional reset and the function will just
>  * return 0.
>  */
>
> [...]
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-
> meson-g12a.c
>> > index 1f7f4d88ed9d..88b75b5a039c 100644
>> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
>> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> > @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>> >  		goto err_disable_clks;
>> >  	}
>> >  
>> > -	ret = reset_control_reset(priv->reset);
>> > +	ret = reset_control_deassert(priv->reset);
>> 
>> The change introduced here is significant. If the reset is not initially
>> asserted, it never will be before the life of the device.
>>
>> This means that Linux will have to deal which whatever state is left by the
>> bootloader. This looks sketchy ...
>>
>> I think the safer way solve the problem here would be to keep using
>> reset_control_reset() and introduce a new API in the reset
>> framework to decrement the reset line "triggered_count"
>> (reset_control_clear() ??)
>> 
>> That way, if all device using the reset line go to suspend, the line will
>> be "reset-able" again by the first device coming out of suspend ?
>>
>> Philip, would you be ok with such new API ?
>
> I'd like to first evaluate whether the already available APIs might be a
> better fit. There is already the option of handing off exclusive control
> between multiple drivers via the reset_control_acquire/release APIs on
> exclusive reset controls.
>
> If all drivers that are now sharing the reset line would switch to
> requesting resets via devm_reset_control_get_exclusive_released()
> and then prepend their reset handling with reset_control_acquire() (but
> ignore -EBUSY) and the driver that got exclusive control releases the
> reset via reset_control_release() during suspend, this should do exactly
> what you want. Note that reset_control_release() must not be called on a
> reset control that has not been successfully acquired by the same
> driver.

In practice, I think your proposition would work since the drivers
sharing this USB reset line are likely to be probed/suspended/resumed at
the same time but ...

If we imagine a situation where 2 device share a reset line, 1 go in
suspend, the other does not - if the first device as control of the
reset, it could trigger it and break the 2nd device. Same goes for
probe/remove()

I agree it could be seen as unlikely but leaving such race condition
open looks dangerous to me.

>
> Is this something that would be feasible for your combination of
> drivers? Otherwise it is be unclear to me under which condition a driver
> should be allowed to call the proposed reset_control_clear().

I was thinking of reset_control_clear() as the counter part of
reset_control_reset().

When a reset_control_reset() has been called once, "triggered_count" is
incremented which signals that the ressource under the reset is
"in_use" and the reset should not be done again. reset_control_clear()
would be the way to state that the ressource is no longer used and, that
from the caller perspective, the reset can fired again if necessary.

If we take the probe / suspend / resume example:
* 1st device using the shared will actually trigger it (as it is now)
* following device just increase triggered_count

If all devices go to suspend (calling reset_control_clear()) then
triggered_count will reach zero, allowing the first device resuming to
trigger the reset again ... this is important since it might not be the
one which would have got the exclusive control

If any device don't go to suspend, meaning the ressource under reset
keep on being used, no reset will performed. With exlusive control,
there is a risk that the resuming device resets something already in use.

Regarding the condition, on shared resets, call reset_control_reset()
should be balanced reset_control_clear() - no clear before reset.

>
>> In the meantime, I think this change should be reverted. A warning on
>> suspend seems less critical than a regression breaking USB completly.
>
> Agreed.
>
> regards
> Philipp

