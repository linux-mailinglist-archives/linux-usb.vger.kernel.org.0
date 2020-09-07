Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC0825F555
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 10:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgIGIeF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 04:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728188AbgIGIeE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Sep 2020 04:34:04 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E5DC061573
        for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2020 01:34:03 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id h23so3127696vkn.4
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2020 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OhAa3dkRhupfYhPbrSvYRNjuERTImcRBCu+4dGQXuHE=;
        b=anOBH6nryFltsKB+grOT0oVm31IA2peEKmy/JJWb1pH8yEktvQHA5gUHIASLe7lHRv
         3PwSWNUNvfG44/5gWBx0rKz8oydkb77qE4vL2vF0gfMos/MAsbjaEYGW9Qb1boDk3MnL
         szLpGIyTpdCs/o0LOMyDANJs4RLgKBAOBHe/0v51p2HfG59scznndSWSPNoKTzjdPy2v
         Dnxb58lMZk6Bj8puI3BF8X4+ImCJnqo/gCTQ5riIzeNoND74ZYvzLR3mvemhcX56RsbW
         n6iv7yO9jkYICGAPnTWUVSPFkDj+RIu1vXkI56Ro3SEs6z5PJuS5FSF1sIdkUlCeaxx6
         Vs1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OhAa3dkRhupfYhPbrSvYRNjuERTImcRBCu+4dGQXuHE=;
        b=mAJpEm02q8WOdmdAB97J9lckVeUvUbgQgepjPcrtWKvwGudqOQrP5c/0TRFOx8R7Up
         U4da92mNwgxmyh9zcBoPgmDKUPv0OTNtQynV8sTtu5RN45IB1nSQaDiE6pX/PVb9B8/h
         JpuvegcYfSut/T7a670WMplJpJvLrvs7+CrdRaXKNtjNS8FXfIdUhw8Ufie0j+SZK0po
         sU/KfFkp7A2AcONOIz56zH+lP+KuWUyK9RB5I0AY5vycx3XWqJPOADEyiw+fIplmJ25o
         dRBY7jCXKd0IYzSt+5qP7/2fujhaEoDfkEp8nF/ZHu5k32GhzZTgCt9vDe4ja0DZn9eK
         6ydA==
X-Gm-Message-State: AOAM531DHrr30+WQhUYqw3ILUlmbtyhVZip5sYAsjn2asmsVoGKoYtiC
        cGhgUMjOgR+Y7jS1E2WC9FpiF4a/S6tiOHD6z8GwHIJi19o=
X-Google-Smtp-Source: ABdhPJy0ehAoIcdSs+1xkTH6aaSvcMjYTTsO1eO0w2BGW0J7vIh6uBoSdHfXFfx3jbudIe2Z6IadAoncTA8rAzLVgz8=
X-Received: by 2002:a1f:eac3:: with SMTP id i186mr11295139vkh.11.1599467642082;
 Mon, 07 Sep 2020 01:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com> <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
 <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
 <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com> <1jr1reasy4.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jr1reasy4.fsf@starbuckisacylon.baylibre.com>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date:   Mon, 7 Sep 2020 10:33:51 +0200
Message-ID: <CAHNvnFNCrRV48ixzaz8xDta3ggy5=FgBXUhQuCx3a3XvDUdujg@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

reset_control_put() is already used in the reset framework.


Le lun. 7 sept. 2020 =C3=A0 10:31, Jerome Brunet <jbrunet@baylibre.com> a =
=C3=A9crit :
>
>
> On Wed 02 Sep 2020 at 16:13, Amjad Ouled-Ameur <aouledameur@baylibre.com>=
 wrote:
>
> > Le sam. 29 ao=C3=BBt 2020 =C3=A0 17:25, Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> a =C3=A9crit :
> >>
> >> Hi Philipp,
> >>
> >> On Tue, Aug 25, 2020 at 12:20 PM Philipp Zabel <p.zabel@pengutronix.de=
> wrote:
> >> [...]
> >> > > reset_control_clear()
> >> > > would be the way to state that the ressource is no longer used and=
, that
> >> > > from the caller perspective, the reset can fired again if necessar=
y.
> >> > >
> >> > > If we take the probe / suspend / resume example:
> >> > > * 1st device using the shared will actually trigger it (as it is n=
ow)
> >> > > * following device just increase triggered_count
> >> > >
> >> > > If all devices go to suspend (calling reset_control_clear()) then
> >> > > triggered_count will reach zero, allowing the first device resumin=
g to
> >> > > trigger the reset again ... this is important since it might not b=
e the
> >> > > one which would have got the exclusive control
> >> > >
> >> > > If any device don't go to suspend, meaning the ressource under res=
et
> >> > > keep on being used, no reset will performed. With exlusive control=
,
> >> > > there is a risk that the resuming device resets something already =
in use.
> >> > >
> >> > > Regarding the condition, on shared resets, call reset_control_rese=
t()
> >> > > should be balanced reset_control_clear() - no clear before reset.
> >> >
> >> > Martin, is this something that would be useful for the current users=
 of
> >> > the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> >> > meson8b-usb2 with reset-meson)?
> >> for the specific use-case (system suspend) this would currently not be
> >> useful for the two drivers you have named. This is because the
> >> platforms on which they are used currently don't support system
> >> suspend.
> >> if other drivers are going to benefit from this change then please go
> >> ahead and add the necessary API. Then I can also use it in these
> >> drivers. however, (as far as I understand) I won't be able to verify
> >> the new "fixed" behavior
> >>
> >>
> >> Best regards,
> >> Martin
> >
> > Hi Philipp,
> >
> > Regarding the naming of the new call, since reset_control_clear() is no=
t
> > really representative of the intended behaviour, I have thought of some
> > other metaphors such as:
> >
> > reset_control_resettable()    (sounds the most relevant to me)
> > reset_control_standby()
> > reset_control_unseal()
> > reset_control_untie()
> > reset_control_loosen()/loose()
> > reset_control_unfetter()
> >
> > What do you think?
>
> my suggestion would be reset_control_put()
>
> >
> > Regards,
> > Amjad
>


--
Amjad Ouled-Ameur
Embedded Linux Engineer - Villeneuve Loubet, FR
Engit@BayLibre - At the Heart of Embedded Linux
