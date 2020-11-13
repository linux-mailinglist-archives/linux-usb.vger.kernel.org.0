Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D4E2B2730
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 22:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgKMVid (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 16:38:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgKMVia (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 16:38:30 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F72C0617A6
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 13:38:29 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id q5so10340118qkc.12
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M8zBXFSjIZOK9hwx4MM/Gbo/B/5HKQYO+MnrHW6YcPQ=;
        b=b81L7k86NKedHCptv4GYQ9yylINiHwfIIvGHNE+UbT1+t9LQb0M5hINKYk5nbaEwQ0
         YAAJtkz7jqhLXDQHNYGLiNsjPxXdgYsi6VCZlsu6ZJ2eKWwYK7tgmV0pUirLAr2BYYeN
         pKxY6WUmGncC7atMhzrOE5X52NVLbAfkst4vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8zBXFSjIZOK9hwx4MM/Gbo/B/5HKQYO+MnrHW6YcPQ=;
        b=jdS5kN6gNpEy/P9bckpNIPYcUZ9FFOw1thqmrpwDgBhBkiufvviKHK+mmtmMSnaKxJ
         SGdMPJ8cjWZLF8b6UlyLzDNS4ijQUTmEgsSRm5FqYofRHfGKzXDcuFmnmJ9QSGq/mwHY
         CN+vArJRMn5nii2aQ3mFRod2zq5pPOKouy6daz+hh0m3LXyffzqnEGI8DuhMffOKykkT
         4YL5Lk9I1Mh6AhA+dfGULHkCR2n/TAFwEb9+y/pIa5On6W5Q4fC5AgIHZQRA5Q+UQ/M0
         OiOE2ouD1XI0uX0MWWBgkyc26tTt3o9p5UDnpWy2zz7hUpoZLFTuDHoFoEPM6iUdmAKj
         lfZA==
X-Gm-Message-State: AOAM53025PNqQt2KydYXKpeShfIVfQi5+nCv3e6Qs7uOMuIirf2JwlwP
        MuwRRmB1MQPh/uLfsS2LocGLR42R0u4Bz/5tdpUYpQ==
X-Google-Smtp-Source: ABdhPJzRnvmVib+xlIuKfefCefWqNoIa67f+sJv+wJjeoRl4VZanoAEP503Co7KJt5SuWqq6SOBZY3KXtDb1p+B18Ow=
X-Received: by 2002:a37:4185:: with SMTP id o127mr4130185qka.442.1605303509007;
 Fri, 13 Nov 2020 13:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20201112012329.1364975-1-pmalani@chromium.org> <X66Uo83dTGS2dMcx@kroah.com>
In-Reply-To: <X66Uo83dTGS2dMcx@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 13 Nov 2020 13:38:17 -0800
Message-ID: <CACeCKacBbYgkRx_BnYYgLOYiBHK+XSAu72+u=pCRZPnA6mntRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] platform/chrome: cros_ec_typec: Add plug and plug altmodes
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Fri, Nov 13, 2020 at 6:13 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Nov 11, 2020 at 05:23:25PM -0800, Prashant Malani wrote:
> > This patch series add plug registration support to the cros-ec-typec
> > driver. It also adds support for registering alternate modes for the
> > registered plug. These features utilize the API provided by the Type C
> > connector class framework.
> >
> > The first patch adds support to the connector class framework for the
> > number_of_alternate_modes attribute (along with the relevant ABI
> > documentation).
> >
> > The next two patches add plug registration, and then altmode
> > registration for the plugs. The latter of these two patches utilizes the
> > new function for plug number_of_alternate_modes introduced in the first patch.
> >
> > This series is based on top of the following branch and other patch
> > series (applied in the order specified):
> > - Branch: chrome-platform for-next [1], which is currently set to the
> >   "Linux 5.10-rc1" tag.
> > - cros-ec-typec: Patch series to register PD identity information + partner altmodes[2]
> > - cros-ec-typec: Patch series to register cable[3]
> > - cros-ec-typec: Patch series to add partner number_of_altmodes[4]
> >
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/log/?h=for-next
> > [2]: https://lore.kernel.org/lkml/20201029222738.482366-1-pmalani@chromium.org/
> > [3]: https://lore.kernel.org/lkml/20201106184104.939284-1-pmalani@chromium.org/
> > [4]: https://lore.kernel.org/lkml/20201110061535.2163599-1-pmalani@chromium.org/
>
> Ok, I'm confused.  This is not the first submission of this series, as
> you sent out a v2 a few days before this one.

Sorry for confusing you. To clarify, this is the first version of this
series particular set
of patches. A few more related series of patches have been sent
regarding this earlier
(see [2], [3] & [4]) and I've not done a resend of those.

This series depends on those earlier series.

>
> And am I supposed to suck in the chrome-platform branch into the
> usb-next tree?
>
> What should I do here, ignore these?  Merge them?

TBH I'm a little confused about how these get in myself. Across all
these patches, there are probably
3 patches (1 USB PD VDO header, two drivers/usb/typec/class.c patches)
which belong to usb-next
whereas everything else is chrome-platform.

>
> I see the USB change lost the reviewer's ack as well, why?

I'm sorry but I didn't follow. As I mentioned above this is the first
version of this
series (which deals with cable plug and it's altmodes) and AFAIK it
hasn't received any acks till now.

All the previous series have not had any re-uploads, so they should
still have all their review tags.

>
> I'm going to delete all of these patches from my review queue now and
> wait for a resend with some clarity as to what I should do with it :)

Enric, could you kindly help suggest a way I can upload things?
Should I just merge everything into one big set of patches (RIght from
[2] to this series) ?
Or just let all the series go through chrome-platform?

BR,

-Prashant
