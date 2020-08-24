Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E081C24FB52
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 12:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgHXKYe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 24 Aug 2020 06:24:34 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46473 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbgHXKYZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 06:24:25 -0400
Received: from [2001:67c:670:100:3ad5:47ff:feaf:1a17] (helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kA9eJ-0003Tl-3A; Mon, 24 Aug 2020 12:24:23 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kA9eH-0004u0-Ro; Mon, 24 Aug 2020 12:24:21 +0200
Message-ID: <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Date:   Mon, 24 Aug 2020 12:24:21 +0200
In-Reply-To: <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
         <20200713160522.19345-2-dan@dlrobertson.com>
         <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jerome,

On Wed, 2020-08-19 at 17:03 +0200, Jerome Brunet wrote:
> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
> 
> > The reset is a shared reset line, but reset_control_reset is still used
> > and reset_control_deassert is not guaranteed to have been called before
> > the first reset_control_assert call. When suspending the following
> > warning may be seen:
> 
> And now the same type of warning maybe seen on boot. This is
> happening for me on the libretech-cc (s905x - gxl).
> 
> [    1.863469] ------------[ cut here ]------------
> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
[...]
> This breaks USB on this device. reverting the change brings it back.
> 
> Looking at the reset framework code, I don't think drivers sharing the
> same reset line should mix using reset_control_reset() VS
> reset_control_assert()/reset_control_deassert()

That is correct, users must not mix the assert/deassert and reset calls
on shared resets:

/**
 * reset_control_reset - reset the controlled device
 * @rstc: reset controller
 *
 * On a shared reset line the actual reset pulse is only triggered once for the
 * lifetime of the reset_control instance: for all but the first caller this is
 * a no-op.
 * Consumers must not use reset_control_(de)assert on shared reset lines when
 * reset_control_reset has been used.
 *
 * If rstc is NULL it is an optional reset and the function will just
 * return 0.
 */

[...]
diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-
meson-g12a.c
> > index 1f7f4d88ed9d..88b75b5a039c 100644
> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >  		goto err_disable_clks;
> >  	}
> >  
> > -	ret = reset_control_reset(priv->reset);
> > +	ret = reset_control_deassert(priv->reset);
> 
> The change introduced here is significant. If the reset is not initially
> asserted, it never will be before the life of the device.
>
> This means that Linux will have to deal which whatever state is left by the
> bootloader. This looks sketchy ...
>
> I think the safer way solve the problem here would be to keep using
> reset_control_reset() and introduce a new API in the reset
> framework to decrement the reset line "triggered_count"
> (reset_control_clear() ??)
> 
> That way, if all device using the reset line go to suspend, the line will
> be "reset-able" again by the first device coming out of suspend ?
>
> Philip, would you be ok with such new API ?

I'd like to first evaluate whether the already available APIs might be a
better fit. There is already the option of handing off exclusive control
between multiple drivers via the reset_control_acquire/release APIs on
exclusive reset controls.

If all drivers that are now sharing the reset line would switch to
requesting resets via devm_reset_control_get_exclusive_released()
and then prepend their reset handling with reset_control_acquire() (but
ignore -EBUSY) and the driver that got exclusive control releases the
reset via reset_control_release() during suspend, this should do exactly
what you want. Note that reset_control_release() must not be called on a
reset control that has not been successfully acquired by the same
driver.

Is this something that would be feasible for your combination of
drivers? Otherwise it is be unclear to me under which condition a driver
should be allowed to call the proposed reset_control_clear().

> In the meantime, I think this change should be reverted. A warning on
> suspend seems less critical than a regression breaking USB completly.

Agreed.

regards
Philipp
