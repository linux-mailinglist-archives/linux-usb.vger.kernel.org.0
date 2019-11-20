Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0982C10351E
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 08:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfKTHW4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 02:22:56 -0500
Received: from mail-vk1-f193.google.com ([209.85.221.193]:43641 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfKTHW4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 02:22:56 -0500
Received: by mail-vk1-f193.google.com with SMTP id k19so5771035vke.10
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2019 23:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=exLwy8I4wv0OS303Fp+Xi/Ap9Cd+ko2/xIdZfSeo7/c=;
        b=J3znqmQK3Q0Ao+w13eeRO/EfbxBzc7qrTpXdEzyqQLwlKx6HNzsGA1qqAOQ9FUMjYt
         J7Nr5sDFCX6reUKxvIfJ2zb14bCRL3dAwXmTa7lu/U7OdjJ5+lbMJWzL59fyM8WMQyjL
         bwkea5cLAK3F3rMUyLqE5bx9ummbaAnxY/NW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=exLwy8I4wv0OS303Fp+Xi/Ap9Cd+ko2/xIdZfSeo7/c=;
        b=pffOOOtvOqDyKtZhTsX5+PeQvfLZhwF2HIgaZfobzQCAo3IWSVhsf8fbLcMd6shGv0
         4UAN8v0J0FlHR30+qoAXyxQi9DYVvqEaIIxrH3wtUpM3a+sFa4TAY7jJ/7UM/xEsykIa
         4Ge0wuBnXmBAKCBKjeA/4qGYiRDkhRg9ETIAm4ieXt4dEIzZaq6QlPc0ewe9vn+BcSQX
         Em3sg6fLTN/R0xAa8eklgR+Erbix3lJY8/dHoLck3cp00ZCmJRdik4UyA1bBaHfIxzwP
         pXQ+ngskYjlfks6sNAT6cCrtEhqD4PHoNV5NE8BVm8VhJtJCVgsg7mQ26eDG7RmktGkf
         KKFA==
X-Gm-Message-State: APjAAAVe4RTQuWKWazOaatatTJLlP4TKPMq9IOPPAH6kPGDKIlsbvBlt
        /lEVPEFrnZWg7QW+aObTeys++d6FmX9NBZTjxZaVbg==
X-Google-Smtp-Source: APXvYqx46DxSppP9z4fLUawkft0B9je26ldEZNXrcJ8GaH2xHBvgFhf+YzbiZ2SQHEHJX7owu7YLf02XNktLBDSEhAE=
X-Received: by 2002:a1f:250b:: with SMTP id l11mr611772vkl.10.1574234573246;
 Tue, 19 Nov 2019 23:22:53 -0800 (PST)
MIME-Version: 1.0
References: <CAATdQgBPrk=obCOiMAe1zAoP1As21MuzGzn-ixU56EmSkdQr1w@mail.gmail.com>
 <Pine.LNX.4.44L0.1911191008440.1506-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1911191008440.1506-100000@iolanthe.rowland.org>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 20 Nov 2019 15:22:42 +0800
Message-ID: <CAATdQgB9_qd+u1mr7ExNbeg0NP6AWO150WfXUabvL9AvKZC0dA@mail.gmail.com>
Subject: Re: [PATCH 0/2] usb: override hub device bInterval with device node
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Suwan Kim <suwan.kim027@gmail.com>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
        Johan Hovold <johan@kernel.org>,
        Nicolas Boitchat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 19, 2019 at 11:14 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 19 Nov 2019, Ikjoon Jang wrote:
>
> > On Sun, Nov 17, 2019 at 11:46 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Sun, 17 Nov 2019, Ikjoon Jang wrote:
> > >
> > > > This patchset enables hard wired hub device to use different bInterval
> > > > from its descriptor when the hub has a combined device node.
> > > >
> > > > When we know the specific hard wired hub supports changing its polling
> > > > interval, we can adjust hub's interval to reduce the time of waking up
> > > > from autosuspend or connect detection of HIDs.
> > >
> > > In fact, _all_ hubs support changing the polling interval.  The value
> > > given in the USB spec is just an upper limit; any smaller value is
> > > equally acceptable.
> > >
> > > So why are you doing this only for hard-wired hubs?  Why not for all
> > > hubs?
> >
> > Because we only want to apply it to a specific device instance under
> > our control.
>
> Why?  What's so special about that device instance?
>
> For example, why not instead have a poll_interval sysfs attribute for
> all hubs that can be written from userspace?  Then people could reduce
> the autoresume latency for any device they want.

Changing its INT interval during runtime seems not so easy, there's no device
drivers doing this to my knowledge. At least xhci needs to restart
endpoint to change
the interval. So I think patching ep descriptor at enumeration stage
is more convincing.

>
> > We apply autosuspend to built-in touchpad device for power savings,
> >
> > Users can attach external hub devices with same VID:PID that we don't want to
> > change the behavior.
>
> Why don't you want to change the behavior?  Or allow the user to change
> the behavior?
>

Yes, that's a difficult question here too, when the hub is external device,
it can't be fully controlled by here. Even though it's the same
VID:PID hub chip,
that's not the 100% same device. We don't know how much this will
impact to the other
external hub devices regarding power consumption and compatibility.

> >  Maybe disabling autosuspend for external HIDs
> > can be more reasonable for that case?
>
> If it makes sense to to save power for your built-in touchpad device,
> why doesn't it also make sense to save power for other external HIDs?
>
> > > And is 250 ms really too long to wait for remote wakeup or connect
> > > detection?  What's the real motivation behind this change?
> >
> > When a user starts to move the cursor while touchpad is in autosuspend state,
> > It takes more than >250ms (worst case can be >500ms) to wake up and response.
> > That makes the cursor stuck for a while and warp to another location suddenly.
>
> All right, that's a good reason.  But doesn't it apply just as well to
> other devices, not only your built-in touchpad?

Actually the hub is the one to be applied, I don't care much about the
rare case that
a user connects an additional external hub with same PID and connect
external HID
under that hub.

We could reduce autosuspend delay for built-in touchpad when we know
that's better
for power savings only if response time of wake up is good enough. but
we don't know
the optimal values for external HIDs. So we could use the default long
delay for external
devices, or just disable autosuspend for all external HIDs,
so user might experience much less cursor lags even with that rare case.

>
> Alan Stern
>
