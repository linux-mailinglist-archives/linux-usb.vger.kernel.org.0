Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C845D25ACBB
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 16:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgIBOPB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 10:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgIBOOG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 10:14:06 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE3AC061245
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 07:14:06 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id q67so2614527vsd.5
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mf1/z4+27SMojkdEL30sqjZxKrc9OfislJ7bsFeI77o=;
        b=OeP7jDrF/mHV3l0SsimH57hpISqWllwgm2PKDBkVn2MklTzoihTMDJus1590xOMbqJ
         e/NyHYbEXv7GRVXMGm5RVd9Tha4q3pgF/mxRxUwDD+5+FYrbawSMAdls3qYEvJkgM1dp
         R38tE0CQwczRVcGD2oj7EVM4l7riphW7+iTpBj3zhcrx+fLPmPKoCgC0W2CEUscWF+fa
         0bW9Qlglh7co1HKsHEb9b8fDpKg9+lGUOcvWhoi2KfwshjKU5u8hCvCKp/ciGpfpm+Re
         nXyKpgzXsmTSr0WMaMThsdtg5vkNDNsR4aTyUM90WDEax9NG0MWM5/3GkOxXzCGUkkSy
         CfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mf1/z4+27SMojkdEL30sqjZxKrc9OfislJ7bsFeI77o=;
        b=VtSwAbgczWFsVcLT5rdr49x4+htpt5HlptrDbsTSp6l0GGMtKJUe5MmPa6yf0lBzwX
         LCfduonvnTY0ltuqde4zA610f6qfTWulQ+ObCVibe0c+edR6z5mkFoHIuyfMPSd6WyxG
         kuKggfiq/EZn/5JtWIw0+fYEHBxQpkLd3RBBRn8dGgcv2X5+xeln/fXChCrQQs1HI0z0
         YsVN3YJ24P6CIFcBPeB4IOo/rCAGlTSpuTM+bZ78/6BlCSBDhg8NESpCMc+o6yfmc3ta
         xiz5O5xp+N/U4D2jY6+AkG9lhG7CKwlA+iZCgkFJbIWfIh1HHv036MQtc4nm7ey/O/38
         MelA==
X-Gm-Message-State: AOAM531IQfHS/wDLN+tYFogdYTckvqWR5znVOJxOG8qCSBX/R4Saa/uh
        7F0yuEpj/BZOvArUQ+ABfaqKE8LmN5zk7oxUeWDUvA==
X-Google-Smtp-Source: ABdhPJwKPOcO1u+OBmHz0DOUyoQs8omJHgxLA94Bl2FgF0+6+xhKe6JFPNDlsRk7vx4cqS7LPRiUKIMG3cuAIlkL6lc=
X-Received: by 2002:a67:8ec7:: with SMTP id q190mr5511968vsd.75.1599056045758;
 Wed, 02 Sep 2020 07:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com> <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
 <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
In-Reply-To: <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date:   Wed, 2 Sep 2020 16:13:54 +0200
Message-ID: <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
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

Le sam. 29 ao=C3=BBt 2020 =C3=A0 17:25, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> a =C3=A9crit :
>
> Hi Philipp,
>
> On Tue, Aug 25, 2020 at 12:20 PM Philipp Zabel <p.zabel@pengutronix.de> w=
rote:
> [...]
> > > reset_control_clear()
> > > would be the way to state that the ressource is no longer used and, t=
hat
> > > from the caller perspective, the reset can fired again if necessary.
> > >
> > > If we take the probe / suspend / resume example:
> > > * 1st device using the shared will actually trigger it (as it is now)
> > > * following device just increase triggered_count
> > >
> > > If all devices go to suspend (calling reset_control_clear()) then
> > > triggered_count will reach zero, allowing the first device resuming t=
o
> > > trigger the reset again ... this is important since it might not be t=
he
> > > one which would have got the exclusive control
> > >
> > > If any device don't go to suspend, meaning the ressource under reset
> > > keep on being used, no reset will performed. With exlusive control,
> > > there is a risk that the resuming device resets something already in =
use.
> > >
> > > Regarding the condition, on shared resets, call reset_control_reset()
> > > should be balanced reset_control_clear() - no clear before reset.
> >
> > Martin, is this something that would be useful for the current users of
> > the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> > meson8b-usb2 with reset-meson)?
> for the specific use-case (system suspend) this would currently not be
> useful for the two drivers you have named. This is because the
> platforms on which they are used currently don't support system
> suspend.
> if other drivers are going to benefit from this change then please go
> ahead and add the necessary API. Then I can also use it in these
> drivers. however, (as far as I understand) I won't be able to verify
> the new "fixed" behavior
>
>
> Best regards,
> Martin

Hi Philipp,

Regarding the naming of the new call, since reset_control_clear() is not
really representative of the intended behaviour, I have thought of some
other metaphors such as:

reset_control_resettable()    (sounds the most relevant to me)
reset_control_standby()
reset_control_unseal()
reset_control_untie()
reset_control_loosen()/loose()
reset_control_unfetter()

What do you think?

Regards,
Amjad


--=20
Amjad Ouled-Ameur
Embedded Linux Engineer - Villeneuve Loubet, FR
Engit@BayLibre - At the Heart of Embedded Linux
