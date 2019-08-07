Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E8A84EAA
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 16:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388215AbfHGOZE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 10:25:04 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38185 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387523AbfHGOZE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 10:25:04 -0400
Received: by mail-pl1-f196.google.com with SMTP id m12so2469057plt.5
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZlIS4sFKGB9QUqkab9uyn0cIcDUJQjrBtJJiDktbZd4=;
        b=X0yVFRrH/tJ3aPHb2X9Fa93c7HCr1gnyun62DMXETxFPkUh5Cku5EmG/hAGUv8nqxj
         7OLsdDr6O+1nMUi5e8P7/OQZfhs43/UzGHigbaAmTB5yAVNDEe//qLC8KDKuNn6mmCJU
         qsBiZBlAdlRtYuFC93nj/oPYIW8NyNKLUk0gIjg4JGGH7ODrhEh9TxCSkkn3NTw+S1DP
         RoGf+TqA6ka+3wcwVsZxLQqEiYeTZGLgnWd5KKHYXOGoGQm8UqQd8LXQId6XSVv4jHHG
         ZCkUarITfOYE9aC91lDBt3GMdw1ZbTFrmU4+AJY5D0vFhg4PtptnjLagzmy4hMqGpAbC
         P++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZlIS4sFKGB9QUqkab9uyn0cIcDUJQjrBtJJiDktbZd4=;
        b=anEKYcYoCM2hXkFlRb9Q0VL7fz/BrntVn1MTJPQi2wnLXU6mw0DkS1QKAYebfM72as
         Ezqdl3RqbJg7XEminmRB8UJETxQ0a5ABxpNTa2qUnSi5XDewv7qfHH7bY6vUkcTd707a
         nEmIadoOvg/+zK2DekTB8PGR4EckHx68DLbsdK5oKMBIxjD+kDUuphavwxKFEO8njjn/
         yxQRpej5OAX8Db/WrbS6/hihQGKTdMKd6ctAQTnekqtka7CLNeaWweOV3bzdwC5+ILV2
         VOrfbPLp9BDjQUj3+W11sFY6RoRqi8myH7t+4OIuEovjONnbaCbgXmgUFAfKF+mrAtZm
         6bQA==
X-Gm-Message-State: APjAAAWln2chJ5JnEewuSUlPJhwiWv6OmNZ2fSy1nMYqzfS9x6nQN0hp
        g8NYr/6FnE1QH5ibtvsNqGLrBsfUdHEcs4OjshWa/g==
X-Google-Smtp-Source: APXvYqzebSrbr6IvVpo3YmCp/H0jvTYkZxPyjwwWcthFM4PGTE8rqNnfXeJ0P9duXQYS/Hqs6PKuJ/mGzhaBO50mfv4=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr7936826pgq.130.1565187903551;
 Wed, 07 Aug 2019 07:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zLrYaE+Kt6AULPjKhBNknxPBWncfkTDmm3eFoLSpsffw@mail.gmail.com>
 <Pine.LNX.4.44L0.1908071000560.1514-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908071000560.1514-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Aug 2019 16:24:52 +0200
Message-ID: <CAAeHK+yAY_ov4yH7n-R8ppnxc1ux33A-SEdxx18ywU1SyLGwug@mail.gmail.com>
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

On Wed, Aug 7, 2019 at 4:01 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, 7 Aug 2019, Andrey Konovalov wrote:
>
> > On Tue, Aug 6, 2019 at 9:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Thu, 1 Aug 2019, syzbot wrote:
> > >
> > > > Hello,
> > > >
> > > > syzbot found the following crash on:
> > > >
> > > > HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> > > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=136b6aec600000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=7bbcbe9c9ff0cd49592a
> > > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > >
> > > > Unfortunately, I don't have any reproducer for this crash yet.
> > > >
> > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> > > >
> > > > ======================================================
> > > > WARNING: possible circular locking dependency detected
> > > > 5.3.0-rc2+ #23 Not tainted
> > > > ------------------------------------------------------
> > >
> > > Andrey:
> > >
> > > This should be completely reproducible, since it's a simple ABBA
> > > locking violation.  Maybe just introducing a time delay (to avoid races
> > > and give the open() call time to run) between the gadget creation and
> > > gadget removal would be enough to do it.
> >
> > I've tried some simple approaches to reproducing this, but failed.
> > Should this require two rio500 devices to trigger?
>
> No, one device should be enough.  Just plug it in and then try to open
> the character device file.

OK, I've reproduced it, so I can test a patch manually. The reason
syzbot couldn't do that, is because it doesn't open character devices.
Right now the USB fuzzing instance only opens /dev/input*,
/dev/hidraw* and /dev/usb/hiddev* (only the devices that are created
by USB HID devices as I've been working on adding USB HID targeted
fuzzing support lately).

I guess we should open /dev/chr/* as well. The problem is that there
300+ devices there even without connecting USB devices and opening
them blindly probably won't work. Is there a way to know which
character devices are created by USB devices? Maybe they are exposed
over /sys/bus/usb or via some other way?

>
> Alan Stern
>
> > > Is there any way you can test this?
> >
> > Not yet.
> >
> > >
> > > Alan Stern
>
