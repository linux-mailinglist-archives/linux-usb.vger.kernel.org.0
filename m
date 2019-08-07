Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33A2C84F7C
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 17:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730118AbfHGPJA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 11:09:00 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36605 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729887AbfHGPI7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 11:08:59 -0400
Received: by mail-pl1-f195.google.com with SMTP id k8so41279170plt.3
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t/hLsT4EXBDYDLUNlEDS8Qu1vGcsBVLNnv5gyx3YUfM=;
        b=nvkeGDsLdWVPsjklRpkbfoZpU4s6SMvCEGjVgVTAuJ3EUtw/C0g5ZluW+Nql/WZv5d
         QOv9b+Hq3E8tZisqRjfZxKf92t0fcxNDKtegWJDGRGDctpgHeFuO3mkD9deai9P5MM2N
         KLYce3iGyWR0oKmALQpC8w+41vSy8OGOtgtzoCoz5z7s03bwDGPCR6yRPYUxpwHiQXwf
         OgHIt5Hhpt9aDuYzPQxXVGg1OxzxeL9V1c2/PnHPGU+NIUscScrzMTYosAeOYRiu9Bnz
         DXu9UZBvjThgZK/eoFBnQstjo0c8eKkaG6qpM5by7OW8Kb5tBUmAHDh6KMFR6yh3ASKz
         24GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t/hLsT4EXBDYDLUNlEDS8Qu1vGcsBVLNnv5gyx3YUfM=;
        b=pzSkKpiE3I1ws/B11x+4OaiD3PYsfIROkd9lI8AtnKzgh6rqRXuxaBE0UHftTemvNP
         4i8FZHJCDdAvkOe7H7z4hMZPWKSxMD/eD5LRLxlU/hDMyLlWTnjnNwkeRrvbDbWTLJfd
         FW1EK+KrgXmElozuI5hgSNX+MxIW+5Lz+mwtLddMLdfrnVA5Xn2kIOGkX3I98WJzktJv
         C2SCvbe/bgXyxNt89GJ5WZftg7XGznmL63IPwrJr5HIM9bjGOCECm7INdS3/NLy2u81m
         lS/zEvd6wyvZQ+FVNLIYNrd56ymj/NW/0kyrYBryU7FYxfytFjorL7lNxREsLyh+onfb
         s0YA==
X-Gm-Message-State: APjAAAV+gdTU1qJVXmmMkYgcoleTMiihVgsrqSppf6ivpryuGGP3LGCZ
        d38hJatEX8cHSYnFoMgiUstFYAe0sdZUkDiLuscILg==
X-Google-Smtp-Source: APXvYqxcS+qsf/tUclfqaIrEonj3RN2UKG5MxCmh1aMRExZY6Vu2L6RIFUZOEVBrbNYA9Dlx9GmviMnN7VuUDq/mZWo=
X-Received: by 2002:a63:3006:: with SMTP id w6mr8196542pgw.440.1565190538781;
 Wed, 07 Aug 2019 08:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+yAY_ov4yH7n-R8ppnxc1ux33A-SEdxx18ywU1SyLGwug@mail.gmail.com>
 <Pine.LNX.4.44L0.1908071033440.1514-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908071033440.1514-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Aug 2019 17:08:47 +0200
Message-ID: <CAAeHK+wP4LXkfdw1gLDAV_xCmcd8JVRJ+TGS7tUtk2fvH2FmMw@mail.gmail.com>
Subject: Re: possible deadlock in open_rio
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Cesar Miquel <miquel@df.uba.ar>,
        rio500-users@lists.sourceforge.net,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 7, 2019 at 4:39 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, 7 Aug 2019, Andrey Konovalov wrote:
>
> > On Wed, Aug 7, 2019 at 4:01 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Wed, 7 Aug 2019, Andrey Konovalov wrote:
> > >
> > > > On Tue, Aug 6, 2019 at 9:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > >
> > > > > On Thu, 1 Aug 2019, syzbot wrote:
> > > > >
> > > > > > Hello,
> > > > > >
> > > > > > syzbot found the following crash on:
> > > > > >
> > > > > > HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> > > > > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=136b6aec600000
> > > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> > > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=7bbcbe9c9ff0cd49592a
> > > > > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > > > >
> > > > > > Unfortunately, I don't have any reproducer for this crash yet.
> > > > > >
> > > > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > > > Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> > > > > >
> > > > > > ======================================================
> > > > > > WARNING: possible circular locking dependency detected
> > > > > > 5.3.0-rc2+ #23 Not tainted
> > > > > > ------------------------------------------------------
> > > > >
> > > > > Andrey:
> > > > >
> > > > > This should be completely reproducible, since it's a simple ABBA
> > > > > locking violation.  Maybe just introducing a time delay (to avoid races
> > > > > and give the open() call time to run) between the gadget creation and
> > > > > gadget removal would be enough to do it.
> > > >
> > > > I've tried some simple approaches to reproducing this, but failed.
> > > > Should this require two rio500 devices to trigger?
> > >
> > > No, one device should be enough.  Just plug it in and then try to open
> > > the character device file.
> >
> > OK, I've reproduced it, so I can test a patch manually. The reason
> > syzbot couldn't do that, is because it doesn't open character devices.
> > Right now the USB fuzzing instance only opens /dev/input*,
> > /dev/hidraw* and /dev/usb/hiddev* (only the devices that are created
> > by USB HID devices as I've been working on adding USB HID targeted
> > fuzzing support lately).
> >
> > I guess we should open /dev/chr/* as well. The problem is that there
> > 300+ devices there even without connecting USB devices and opening
> > them blindly probably won't work. Is there a way to know which
> > character devices are created by USB devices? Maybe they are exposed
> > over /sys/bus/usb or via some other way?
>
> I don't have any devices that use this API, so I can't be certain.
> However, I believe the devices do get registered under /sys/class/usb/.
> (Note that this directory doesn't exist when there aren't any USB class
> files.)
>
> In any case, the USB character device files all have their major
> numbers set to 180 (USB_MAJOR defined in include/linux/usb.h), so you
> can identify them that way.

This should work! I'll enable fuzzing of /dev/char/180:*, thanks!

>
> Alan Stern
>
