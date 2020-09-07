Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8573F25F548
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 10:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgIGIbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 04:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbgIGIbu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Sep 2020 04:31:50 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629C3C061573
        for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2020 01:31:50 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id w5so14835851wrp.8
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2020 01:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=cCcewAEiLE/OmDX2B0vNYIYLfVcreUZ7OxVxbcoyrBE=;
        b=RGeouUFKu+QpdbpoI+34Dkfyyl+XqAA1xXwShz6V66lBEdsZt5yX1SW296IcxMO+Hi
         G3re0x+hjDAmxAWbGF9Ap986eQ1hSDE6dvRfuD0xKOBJYeWiR0HY3oQ8m+7z45Z56qQ/
         sI2sc6WwBCpyzHi9JB9n2I5z9shO9+au8Wx8vTgX051jZ8BGWTaglwbtMkSJ2Gvsj2UQ
         u1rjuky9AWGOWuVP8162C+iThw9ekNtYzmhscgdgAy3F/umh+Y/R7PPRZ7AVBzD4Ri8r
         6j9hqgF8y+bTDkecyFvZcvbsPMxE+QAojle78NjPatGjk+PjV8y0wx65joYz0RdAVOH2
         XNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=cCcewAEiLE/OmDX2B0vNYIYLfVcreUZ7OxVxbcoyrBE=;
        b=S6INb4V2z3AwDL/64Zm9Dsy85PBzqzRcKjcy+ga8xkyfpPH5zkEKx30FILPmSZ0wBX
         KejiyEQ6FajmgZKMhdwscu6wMgn8Ovts8B+mdPpKIh43KLz4HwdC8oX+KrAvXiidHfYL
         k0dLCn7YGRsECirYezHD2bFYJ+fpquhZWy8YU+X2tfWf1EaW7HwK7vPtvLEywsptKpgV
         QrtvPmuvUWvb4+Pdhco4TbBIwWSQkqGHdJj6rEcMpDRJ4Ih9JGwKQj26W4OmDZeZBJCS
         WNCKNHnpX/Ch6TZ2tGhNyBNB1NKHmmR+dzyRrbduVa5WRabUqpBJgbudoCtzEW0x4KJC
         eTuw==
X-Gm-Message-State: AOAM530GghnlBK9kMbZWyoaJUcgLnkhRgq388RDHt5fvcXaLwVbIAz/b
        VsPQRxkycR+V+fdJoXOdKcGryg==
X-Google-Smtp-Source: ABdhPJzhb+a9WFap1WkuGeN9Gg5Xb2WC16AJ/90y0PUIbr1rp2sP3ko3ohy7VthUSP/NCEt5qAA5bw==
X-Received: by 2002:adf:8b48:: with SMTP id v8mr20346258wra.21.1599467509096;
        Mon, 07 Sep 2020 01:31:49 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id k8sm27013174wma.16.2020.09.07.01.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 01:31:48 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com> <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de> <1j8se43yrw.fsf@starbuckisacylon.baylibre.com> <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de> <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com> <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <CAHNvnFNafYwcGcZk88WokMvZB_FQu8_imL=5sWecP2+xqWg1RA@mail.gmail.com>
Date:   Mon, 07 Sep 2020 10:31:47 +0200
Message-ID: <1jr1reasy4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Wed 02 Sep 2020 at 16:13, Amjad Ouled-Ameur <aouledameur@baylibre.com> w=
rote:

> Le sam. 29 ao=C3=BBt 2020 =C3=A0 17:25, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> a =C3=A9crit :
>>
>> Hi Philipp,
>>
>> On Tue, Aug 25, 2020 at 12:20 PM Philipp Zabel <p.zabel@pengutronix.de> =
wrote:
>> [...]
>> > > reset_control_clear()
>> > > would be the way to state that the ressource is no longer used and, =
that
>> > > from the caller perspective, the reset can fired again if necessary.
>> > >
>> > > If we take the probe / suspend / resume example:
>> > > * 1st device using the shared will actually trigger it (as it is now)
>> > > * following device just increase triggered_count
>> > >
>> > > If all devices go to suspend (calling reset_control_clear()) then
>> > > triggered_count will reach zero, allowing the first device resuming =
to
>> > > trigger the reset again ... this is important since it might not be =
the
>> > > one which would have got the exclusive control
>> > >
>> > > If any device don't go to suspend, meaning the ressource under reset
>> > > keep on being used, no reset will performed. With exlusive control,
>> > > there is a risk that the resuming device resets something already in=
 use.
>> > >
>> > > Regarding the condition, on shared resets, call reset_control_reset()
>> > > should be balanced reset_control_clear() - no clear before reset.
>> >
>> > Martin, is this something that would be useful for the current users of
>> > the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
>> > meson8b-usb2 with reset-meson)?
>> for the specific use-case (system suspend) this would currently not be
>> useful for the two drivers you have named. This is because the
>> platforms on which they are used currently don't support system
>> suspend.
>> if other drivers are going to benefit from this change then please go
>> ahead and add the necessary API. Then I can also use it in these
>> drivers. however, (as far as I understand) I won't be able to verify
>> the new "fixed" behavior
>>
>>
>> Best regards,
>> Martin
>
> Hi Philipp,
>
> Regarding the naming of the new call, since reset_control_clear() is not
> really representative of the intended behaviour, I have thought of some
> other metaphors such as:
>
> reset_control_resettable()    (sounds the most relevant to me)
> reset_control_standby()
> reset_control_unseal()
> reset_control_untie()
> reset_control_loosen()/loose()
> reset_control_unfetter()
>
> What do you think?

my suggestion would be reset_control_put()

>
> Regards,
> Amjad

