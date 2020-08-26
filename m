Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AD2252901
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 10:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgHZIOj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 26 Aug 2020 04:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgHZIOh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 04:14:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0C3C061574
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 01:14:36 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kAqZk-0003vq-K1; Wed, 26 Aug 2020 10:14:32 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kAqZj-0006wv-MK; Wed, 26 Aug 2020 10:14:31 +0200
Message-ID: <79a2e84548697be86be3d8fde4a1975ab37d0c00.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Date:   Wed, 26 Aug 2020 10:14:31 +0200
In-Reply-To: <1j5z964xis.fsf@starbuckisacylon.baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
         <20200713160522.19345-2-dan@dlrobertson.com>
         <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
         <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
         <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
         <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
         <1j5z964xis.fsf@starbuckisacylon.baylibre.com>
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

On Tue, 2020-08-25 at 16:20 +0200, Jerome Brunet wrote:
> On Tue 25 Aug 2020 at 12:20, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > On Mon, 2020-08-24 at 16:26 +0200, Jerome Brunet wrote:
> > [...]
> > > In practice, I think your proposition would work since the drivers
> > > sharing this USB reset line are likely to be probed/suspended/resumed at
> > > the same time but ...
> > > 
> > > If we imagine a situation where 2 device share a reset line, 1 go in
> > > suspend, the other does not - if the first device as control of the
> > > reset, it could trigger it and break the 2nd device. Same goes for
> > > probe/remove()
> > > 
> > > I agree it could be seen as unlikely but leaving such race condition
> > > open looks dangerous to me.
> > 
> > You are right, this is not good enough.
> > 
> > > > Is this something that would be feasible for your combination of
> > > > drivers? Otherwise it is be unclear to me under which condition a driver
> > > > should be allowed to call the proposed reset_control_clear().
> > > 
> > > I was thinking of reset_control_clear() as the counter part of
> > > reset_control_reset().
> > 
> > I'm not particularly fond of reset_control_clear as a name, because it
> > is very close to "clearing a reset bit" which usually would deassert a
> > reset line (or the inverse).
> 
> It was merely a suggestion :) any other name you prefer is fine by me

Naming is hard. All metaphors I can think of are either a obscure or
clash with other current usage. My instinct would be to call this
"resetting the (reset) control", but _reset() is already taken, with the
opposite meaning. How about _rewind() or _rearm()? Not sure if those are
good metaphors either, but at least there is no obvious but incorrect
interpretation. I kind of wish reset_control_reset() would be called
reset_control_trigger() instead.

> > > When a reset_control_reset() has been called once, "triggered_count" is
> > > incremented which signals that the ressource under the reset is
> > > "in_use" and the reset should not be done again.
> > 
> > "triggered_count" would then have to be renamed to something like
> > "trigger_requested_count", or "use_count". I wonder it might be possible
> > to merge this with "deassert_count" as they'd share the same semantics
> > (while the count is > 0, the reset line must stay deasserted).
> 
> Sure. Could investigate this as a 2nd step ?

Yes.

> I'd like to bring a solution for our meson-usb use case quickly - even
> with the revert suggested, we are having an ugly warning around suspend

I understand. Let's still do this carefully :)

> > > reset_control_clear()
> > > would be the way to state that the ressource is no longer used and, that
> > > from the caller perspective, the reset can fired again if necessary.
> > > 
> > > If we take the probe / suspend / resume example:
> > > * 1st device using the shared will actually trigger it (as it is now)
> > > * following device just increase triggered_count
> > > 
> > > If all devices go to suspend (calling reset_control_clear()) then
> > > triggered_count will reach zero, allowing the first device resuming to
> > > trigger the reset again ... this is important since it might not be the
> > > one which would have got the exclusive control
> > > 
> > > If any device don't go to suspend, meaning the ressource under reset
> > > keep on being used, no reset will performed. With exlusive control,
> > > there is a risk that the resuming device resets something already in use.
> > > 
> > > Regarding the condition, on shared resets, call reset_control_reset()
> > > should be balanced reset_control_clear() - no clear before reset.
> > 
> > Martin, is this something that would be useful for the current users of
> > the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> > meson8b-usb2 with reset-meson)?
> 
> I'm not Martin but these devices are the origin of the request/suggestion.

So these two phy drivers are used together with dwc3-meson-g12a?
Will you change them to use the new API as well?

regards
Philipp
