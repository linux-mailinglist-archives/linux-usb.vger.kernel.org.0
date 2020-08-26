Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821AF252941
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 10:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgHZIeW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 04:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbgHZIeW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 04:34:22 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA1FC061574
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 01:34:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id t2so904026wma.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 01:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=gQpijk3JcIMZZ0cFZ4tG+wZUcQxMP1zZpT7hvYh+Sak=;
        b=YSDDfgFEBukj/TI7ekhG44Whd1alTg+ThJwW6EDjs07aZYw3k3ITs5ljNur4WhVmY5
         qCNojzfRTYpcSz0gReBmDB4eZK+QGpSNMpYyRdtpbZqAQmLCt//NgO/ObmvcDiEwdBz4
         CpJU5wjla9RW+9en+UuPmKyYQ1do9q0134nG98atsWSmgPIBYdJuzabIGEndHHy0wbfG
         DUkjm0BaPG4BHfP5CMDDureElu7SLQzR8HJSCwShnNuFwTh+jdXRC16HSxBefaxJTB6a
         WAgTxkqDMZLoINS/l/DqnXGPt9LxN63L2B19PrxVayYCIVVqeRXF6cTr1Th7ODUz2bTH
         4wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=gQpijk3JcIMZZ0cFZ4tG+wZUcQxMP1zZpT7hvYh+Sak=;
        b=F2KYYJrWpoZC5k8wDT+z2+A5dfgj6hL3/h/AESJdLOA6ecln5UZDI/vAqd9fPDjf9n
         UP+1jacvSl57+iOowNO6O563ybOdScHIm3l79KXbDrT9kraayhoL63rJlPZTnhy3uEDn
         Wcqy2ijyZK/9HdQ7DJgu93MPza7nrkjfw2LaSTgVWihAdJO8b1bJyar00R1Y+VFPQSa+
         zPprz/tMKqRAUoGxkA60NVyop9dMsurNlzD5uxogrtxsxBwifd/mSmTclT6SFExzUtfC
         rQUnp9GNXB7FTewfYh6HQHpW+rvCO7czqrLhaoAyR+xCdum2jKjRpyrfaf2tJSOEY2vK
         QeTQ==
X-Gm-Message-State: AOAM533CM51E75oKoaVyaHG+3V1sTt8yk29T82g0EgHV8EEtGe03viSd
        dCMq3bLwtUw2dnI2lY/joo6y8Q==
X-Google-Smtp-Source: ABdhPJyoOlUfSpEUc6JgLbt5iFJZnV4BST1h16BqGANFU/nrmJKgcGP6ek4QCyqjzjo6vnXM0SX5qw==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr5858275wmk.148.1598430860181;
        Wed, 26 Aug 2020 01:34:20 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j11sm3691332wrq.69.2020.08.26.01.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 01:34:19 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com> <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de> <1j8se43yrw.fsf@starbuckisacylon.baylibre.com> <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de> <1j5z964xis.fsf@starbuckisacylon.baylibre.com> <79a2e84548697be86be3d8fde4a1975ab37d0c00.camel@pengutronix.de>
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
In-reply-to: <79a2e84548697be86be3d8fde4a1975ab37d0c00.camel@pengutronix.de>
Date:   Wed, 26 Aug 2020 10:34:18 +0200
Message-ID: <1jv9h53iwl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Wed 26 Aug 2020 at 10:14, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Tue, 2020-08-25 at 16:20 +0200, Jerome Brunet wrote:
>> On Tue 25 Aug 2020 at 12:20, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>> 
>> > On Mon, 2020-08-24 at 16:26 +0200, Jerome Brunet wrote:
>> > [...]
>> > > In practice, I think your proposition would work since the drivers
>> > > sharing this USB reset line are likely to be probed/suspended/resumed at
>> > > the same time but ...
>> > > 
>> > > If we imagine a situation where 2 device share a reset line, 1 go in
>> > > suspend, the other does not - if the first device as control of the
>> > > reset, it could trigger it and break the 2nd device. Same goes for
>> > > probe/remove()
>> > > 
>> > > I agree it could be seen as unlikely but leaving such race condition
>> > > open looks dangerous to me.
>> > 
>> > You are right, this is not good enough.
>> > 
>> > > > Is this something that would be feasible for your combination of
>> > > > drivers? Otherwise it is be unclear to me under which condition a driver
>> > > > should be allowed to call the proposed reset_control_clear().
>> > > 
>> > > I was thinking of reset_control_clear() as the counter part of
>> > > reset_control_reset().
>> > 
>> > I'm not particularly fond of reset_control_clear as a name, because it
>> > is very close to "clearing a reset bit" which usually would deassert a
>> > reset line (or the inverse).
>> 
>> It was merely a suggestion :) any other name you prefer is fine by me
>
> Naming is hard. All metaphors I can think of are either a obscure or
> clash with other current usage. My instinct would be to call this
> "resetting the (reset) control", but _reset() is already taken, with the
> opposite meaning. How about _rewind() or _rearm()? Not sure if those are
> good metaphors either, but at least there is no obvious but incorrect
> interpretation. I kind of wish reset_control_reset() would be called
> reset_control_trigger() instead.

We'll pick something for the v1 ... maybe the inspiration will come
later on and we'll make a v2 ;)

>
>> > > When a reset_control_reset() has been called once, "triggered_count" is
>> > > incremented which signals that the ressource under the reset is
>> > > "in_use" and the reset should not be done again.
>> > 
>> > "triggered_count" would then have to be renamed to something like
>> > "trigger_requested_count", or "use_count". I wonder it might be possible
>> > to merge this with "deassert_count" as they'd share the same semantics
>> > (while the count is > 0, the reset line must stay deasserted).
>> 
>> Sure. Could investigate this as a 2nd step ?
>
> Yes.
>
>> I'd like to bring a solution for our meson-usb use case quickly - even
>> with the revert suggested, we are having an ugly warning around suspend
>
> I understand. Let's still do this carefully :)

will do

>
>> > > reset_control_clear()
>> > > would be the way to state that the ressource is no longer used and, that
>> > > from the caller perspective, the reset can fired again if necessary.
>> > > 
>> > > If we take the probe / suspend / resume example:
>> > > * 1st device using the shared will actually trigger it (as it is now)
>> > > * following device just increase triggered_count
>> > > 
>> > > If all devices go to suspend (calling reset_control_clear()) then
>> > > triggered_count will reach zero, allowing the first device resuming to
>> > > trigger the reset again ... this is important since it might not be the
>> > > one which would have got the exclusive control
>> > > 
>> > > If any device don't go to suspend, meaning the ressource under reset
>> > > keep on being used, no reset will performed. With exlusive control,
>> > > there is a risk that the resuming device resets something already in use.
>> > > 
>> > > Regarding the condition, on shared resets, call reset_control_reset()
>> > > should be balanced reset_control_clear() - no clear before reset.
>> > 
>> > Martin, is this something that would be useful for the current users of
>> > the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
>> > meson8b-usb2 with reset-meson)?
>> 
>> I'm not Martin but these devices are the origin of the request/suggestion.
>
> So these two phy drivers are used together with dwc3-meson-g12a?

Yes, reset is shared by the different usb devices of the SoCs

> Will you change them to use the new API as well?

That's the plan, yes.

>
> regards
> Philipp

