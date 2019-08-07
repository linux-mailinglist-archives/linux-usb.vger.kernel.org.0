Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9798B84E1A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 16:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387804AbfHGOB5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 10:01:57 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42410 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2387713AbfHGOB4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 10:01:56 -0400
Received: (qmail 2128 invoked by uid 2102); 7 Aug 2019 10:01:55 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Aug 2019 10:01:55 -0400
Date:   Wed, 7 Aug 2019 10:01:55 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Cesar Miquel <miquel@df.uba.ar>,
        <rio500-users@lists.sourceforge.net>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: possible deadlock in open_rio
In-Reply-To: <CAAeHK+zLrYaE+Kt6AULPjKhBNknxPBWncfkTDmm3eFoLSpsffw@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908071000560.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 7 Aug 2019, Andrey Konovalov wrote:

> On Tue, Aug 6, 2019 at 9:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Thu, 1 Aug 2019, syzbot wrote:
> >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=136b6aec600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=7bbcbe9c9ff0cd49592a
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > >
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> > >
> > > ======================================================
> > > WARNING: possible circular locking dependency detected
> > > 5.3.0-rc2+ #23 Not tainted
> > > ------------------------------------------------------
> >
> > Andrey:
> >
> > This should be completely reproducible, since it's a simple ABBA
> > locking violation.  Maybe just introducing a time delay (to avoid races
> > and give the open() call time to run) between the gadget creation and
> > gadget removal would be enough to do it.
> 
> I've tried some simple approaches to reproducing this, but failed.
> Should this require two rio500 devices to trigger?

No, one device should be enough.  Just plug it in and then try to open 
the character device file.

Alan Stern

> > Is there any way you can test this?
> 
> Not yet.
> 
> >
> > Alan Stern

