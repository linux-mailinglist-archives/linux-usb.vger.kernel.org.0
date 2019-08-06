Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB928336C
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 15:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732375AbfHFN7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 09:59:07 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42832 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729315AbfHFN7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 09:59:07 -0400
Received: (qmail 1593 invoked by uid 2102); 6 Aug 2019 09:59:06 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Aug 2019 09:59:06 -0400
Date:   Tue, 6 Aug 2019 09:59:06 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        syzbot <syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Alexander Potapenko <glider@google.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: KMSAN: kernel-usb-infoleak in pcan_usb_pro_send_req
In-Reply-To: <CAAeHK+xrCX61XE6YBnGBKgAuwC1LEbGFDFr5KO2i2O5r11UP5A@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908060957420.1571-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 6 Aug 2019, Andrey Konovalov wrote:

> On Tue, Aug 6, 2019 at 2:45 PM Oliver Neukum <oneukum@suse.com> wrote:
> >
> > Am Dienstag, den 30.07.2019, 02:38 -0700 schrieb syzbot:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    41550654 [UPSTREAM] KVM: x86: degrade WARN to pr_warn_rate..
> > > git tree:       kmsan
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=13e95183a00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=513e4d0985298538bf9b
> > > compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> > > 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eafa1ba00000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b87983a00000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com
> >
> > #syz test: https://github.com/google/kasan.git 41550654
> 
> Hi Oliver,
> 
> For KMSAN bugs you'll need to use the kmsan tree (syz test:
> https://github.com/google/kmsan.git COMMIT_ID). I've updated the
> testing instructions some time ago to reflect this. Sorry for the
> complexity, this is caused by USB fuzzing and KMSAN not being upstream
> yet.

Maybe you can fix the "git tree:" header in the bug report.  It should 
say "https://github.com/google/kmsan.git" instead of just "kmsan".

Alan Stern

