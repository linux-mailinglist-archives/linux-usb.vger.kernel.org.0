Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2669B2D46A9
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 17:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730043AbgLIQXo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 11:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbgLIQXo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 11:23:44 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D51AC0613CF
        for <linux-usb@vger.kernel.org>; Wed,  9 Dec 2020 08:23:04 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id z11so1739731qkj.7
        for <linux-usb@vger.kernel.org>; Wed, 09 Dec 2020 08:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uCi6vrOk+0dK3uRrPhD3eDKr6DKQAm8fgeutNqh1hhc=;
        b=Yx2qDiuW5kA47vFukEUCo/5S8+R4PRBF89Of94p7BHWxls3kOX5wQY8qS/R4oOQMRa
         6B0e1DM4WCHmrQ/Z/Su/PM7AubNl+V9yIiEUeqah8LP4v21OL7XJVI4UrfW0ZQrU5Lxn
         zbTKV5nyhiJ249bOI69cI2EcqaI9jzzj2BbcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uCi6vrOk+0dK3uRrPhD3eDKr6DKQAm8fgeutNqh1hhc=;
        b=EmnnKCOW1WW+u8bdp21q90v7r7G2ihB1UgBH54xEwXz6PXCSo/4RN9bncdVdh+9JxJ
         f4kE7wA/BZq63poBAo+kc/q67iOgJjhLv8VjIbuf2Vd1mdvwOo/A1QZPoTmLvXZEdd+S
         33Hrc9cV0NFDsbimrfs1m/1p4U/jWDj3GveOuO8PWOdESDzwOManCk8RYhJeN7Kpf5pv
         GaVqAYwusbfCoiobkHp39m9WLCQ1xoO5AVzmgSTSuW1odwBDHqPCW6cyt6OY7Qv47c3v
         ZrpX8NL6hfpZ0vK0P9Ulw43uVt/mZ14X2Tqag8GPzkvqMviGVnmn/JGL/p8CfrS6tuw3
         o3yw==
X-Gm-Message-State: AOAM531uFceOr8XD9J+owOaTMk54BKyz6kVNgX2ZXsWu43p6NLHQzdqi
        st8NlqpHyqlUEeknGbEzUJm3+JqzprnS0Q/HlJLQr0rAkEc=
X-Google-Smtp-Source: ABdhPJy4ikAHHQ7c1iKgQEwtJ6vDo6LJtrL4AgnoSRi7GTCUJUTtzAIyBXpCuNR+jKddk6+jjC6lchi4B9RuWqbUnio=
X-Received: by 2002:a37:4145:: with SMTP id o66mr1059144qka.4.1607530983476;
 Wed, 09 Dec 2020 08:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20201203030846.51669-1-pmalani@chromium.org> <20201208093734.GD680328@kuha.fi.intel.com>
 <CACeCKaehg=HTuQNLtQaJZWvTnOFYM9b1BWfM+WX_ebiZ-_i8JQ@mail.gmail.com> <20201209161356.GI680328@kuha.fi.intel.com>
In-Reply-To: <20201209161356.GI680328@kuha.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 9 Dec 2020 08:22:52 -0800
Message-ID: <CACeCKacdcGi_6VW7F9agN+bgRH7gAXLDxK7DngE=fPkYT-CWNQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: Add bus type for plug alt modes
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benson Leung <bleung@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On Wed, Dec 9, 2020 at 8:14 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Dec 08, 2020 at 03:45:19PM -0800, Prashant Malani wrote:
> > Hi Heikki,
> >
> > Thanks a lot for looking at the patch.
> >
> > On Tue, Dec 8, 2020 at 1:37 AM Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> > >
> > > On Wed, Dec 02, 2020 at 07:08:47PM -0800, Prashant Malani wrote:
> > > > Add the Type C bus for plug alternate modes which are being
> > > > registered via the Type C connector class. This ensures that udev events
> > > > get generated when plug alternate modes are registered (and not just for
> > > > partner/port alternate modes), even though the Type C bus doesn't link
> > > > plug alternate mode devices to alternate mode drivers.
> > >
> > > I still don't understand how is the uevent related to the bus? If you
> > > check the device_add() function, on line 2917, kobject_uevent() is
> > > called unconditionally. The device does not need a bus for that event
> > > to be generated.
> >
> > My initial thought process was to see what is the difference in the adev device
> > initialization between partner altmode and plug altmode (the only difference I saw in
> > typec_register_altmode() was regarding the bus field).
> >
> > Yes, kobject_uevent() is called unconditionally, but it's return value isn't checked,
> > so we don't know if it succeeded or not.
> >
> > In the case of cable plug altmode, I see it fail with the following error[1]:
> >
> > [  114.431409] kobject: 'port1-plug0.0' (000000004ad42956): kobject_uevent_env: filter function caused the event to drop!
> >
> > I think the filter function which is called is this one: drivers/base/core.c: dev_uevent_filter() [2]
> >
> > static int dev_uevent_filter(struct kset *kset, struct kobject *kobj)
> > {
> >       struct kobj_type *ktype = get_ktype(kobj);
> >
> >       if (ktype == &device_ktype) {
> >               struct device *dev = kobj_to_dev(kobj);
> >               if (dev->bus)
> >                       return 1;
> >               if (dev->class)
> >                       return 1;
> >       }
> >       return 0;
> > }
> >
> > So, both the "if (dev->bus)" and "if (dev->class)" checks are failing here. In the case of partner alt modes, bus is set by the class.c code
> > so this check likely returns 1 in that case.
>
> OK. I understand the issue now. So I would say that the proper
> solution to this problem is to link the alt modes with the class
> instead of the bus. That is much smaller change IMO.

Got it. Just to confirm that I understand correctly, do you mean:
1. Only cable plug alt modes should be linked with the class instead of the bus.

<or>

2. All alt modes (cable plug, partner, port) should be linked with the
class instead of the bus

My initial interpretation is 1.) since the bus linkage would be
necessary to match alt mode drivers to partner alt mode devices.
But, my understanding of the bus code is limited so I could be wrong;
could you kindly clarify?

Thanks,

-Prashant
