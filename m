Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 879E4FE0FA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2019 16:14:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfKOPOM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Nov 2019 10:14:12 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40306 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbfKOPOM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Nov 2019 10:14:12 -0500
Received: by mail-pl1-f194.google.com with SMTP id e3so4857838plt.7
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2019 07:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h7MX8lWjoe6LAOX1Ecp8U8ZHxWkZEV0rpaM5MvQJZuU=;
        b=Bm1QMmcTbdI7ms4jivwuJ0RT3QVVEFsPgq9QBQJAumy3xpGJoxlwQfj7qFArfA0S2Q
         dqlR5w26D9tLUvBjEKNaleFFVJWnVeNbZdPLDH+/lLzeMDHTcz7wU3PpqPe4joljZ4vH
         6e5GnmVsSEMg7a7Q9+ZqOKaHVep2SBOOuYkPlfwU8PJ6drdwAF1u6dXNxBnPXSWbCX1j
         qZqvFmDrgrINwr719u/6bEWg1Omr+ThwcJTuoqY0yz7P//7Twe3PtWpPjzk+vL2YfHzZ
         qn3F5zJyJOaXdDtxE6uY6CJoQLAS4BtDCRqTbBSoAntiJmVEms2LF7c1EHVtH/LNLzg9
         XudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h7MX8lWjoe6LAOX1Ecp8U8ZHxWkZEV0rpaM5MvQJZuU=;
        b=IxzgJmYScDSrGh1hnYGhBWkIkF8VOSKa157UcJyIUmZfC1tTVEuMvDYguRb3lwxYYs
         xpaDkg1825WWoQ+ZBAg2X6jcGmybIL8J2BNeO3PgNa8b137UTSYHyW6y2pSjCBSiAFiM
         MfcK+fQKPPHTYlQ4ikNNS+kFfT8rhUlO4BuFFbn8uYxrOIJaEtqJaS+apfDEFXyvA8K/
         Qa7Da1hUJgqUXnPl5LnHsxPN01ixXxkGaSOjr3niqmVZidrw2rSOuNNu1fJxC581msZj
         WSqMj2yr3WpfhmBtU1yM/n3lHnI2rfecxxfNZkq0NI7IZajAIhVuq0eIf4IxKjQfV5FX
         Cm0Q==
X-Gm-Message-State: APjAAAXO57gMF3PQOaCRop/BnwdhiLF9wANXLfBefbayKPwzOm5XcG8z
        KqkrJB4gqyXtd4TavLK6uaaZ0gAKMn6m5eueTRTRZg==
X-Google-Smtp-Source: APXvYqyHG16Hg0S5mwwHofapRcavwjVW/ohOkqnkJGxK6ELt70Wxa2WbJj4zce4IqBAoN++eoObYRcuLw6I0GUJsU/Y=
X-Received: by 2002:a17:90b:438b:: with SMTP id in11mr20397728pjb.129.1573830849778;
 Fri, 15 Nov 2019 07:14:09 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+yyKeV8h6UO2-4zZM_ndUaHcG1Ex5GYHxdmh_GJxDOa4w@mail.gmail.com>
 <20191115150633.GA374386@kroah.com>
In-Reply-To: <20191115150633.GA374386@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 15 Nov 2019 16:13:58 +0100
Message-ID: <CAAeHK+zdZdDT=3nNaz3E3HoUVq+sUA5hKEpOTXu7faitJ6RCGw@mail.gmail.com>
Subject: Re: Exporting USB device ids from the kernel
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 15, 2019 at 4:06 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Nov 15, 2019 at 03:25:38PM +0100, Andrey Konovalov wrote:
> > Hi Greg and Alan,
> >
> > For USB fuzzing it would be nice to be able to export usb_device_id
> > structs from the kernel to facilitate the fuzzer with generating USB
> > descriptors that match to actual drivers. The same is required for
> > hid_device_id structs, since those are matched separately by the
> > usbhid driver (are there other cases like this?).
> >
> > Currently I have a hacky patch [1] that walks all drivers for USB and
> > HID buses and then prints all device ids for those drivers into the
> > kernel log. Those are manually parsed and built into the fuzzer [2]
> > and then used to generate USB descriptors [3].
>
> The kernel will spit out all device ids of all USB devices when found if
> you have CONFIG_USB_ANNOUNCE_NEW_DEVICES enabled, if you want to parse
> the log.
>
> Otherwise, just walk usbfs or sysfs and get the ids there.  If you use
> libusb you can do this with just a few lines of code, or worst case,
> just implement the same thing on your own (like lsusb used to do).
> Heck, just copy what lsusb does, or again worst case, parse the output
> of it.
>
> There's also 'lsusb.py' as part of usbutils that shows how to do this
> from within python in userspace, and if you really want it, we also
> export the whole raw usb descriptor is in sysfs as well, if you want to
> not trust how the kernel parses it.
>
> hope this helps,

Either I misunderstand you or you misunderstood me. I don't want to
see IDs of devices that are connected. I want to see all of the IDs
for all of the devices that might be connected and bound to some
driver at some point in the future. Essentially I want to all IDs that
are passed to MODULE_DEVICE_TABLE(usb, ...) and
MODULE_DEVICE_TABLE(hid, ...). Is it possible to obtain those via
usbfs/sysfs?
