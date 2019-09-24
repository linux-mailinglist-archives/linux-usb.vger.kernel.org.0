Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7979FBCA5E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 16:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730992AbfIXOiI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 10:38:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbfIXOiI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Sep 2019 10:38:08 -0400
Received: from localhost (unknown [84.241.200.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E06252053B;
        Tue, 24 Sep 2019 14:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569335887;
        bh=31TNPvosGK8Hh8R09L2swPP/h+tMRbD9bpd3F7rSYYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i0Q0KWth0+oNnn6BDuQKWPgWeRRpzsOMJj4HcQm2DCzI3+tEnrn4XDA+X6WWGY/v3
         kpLUkw9g2lCGV+yXWzjSFDFlq21nest7p6AYahPo+SWhLEI94+fL4ytvIbBN1/W5hs
         +t6t6kCdrGDMztK7tTQsMVyU2LdoazYkPUAGmB1s=
Date:   Tue, 24 Sep 2019 16:38:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+dbd38fbb686a9681143a@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: general protection fault in open_rio
Message-ID: <20190924143804.GA623902@kroah.com>
References: <CAAeHK+wE8ngx2Pa9=vD6Fw6MCbHpxfX6ss97deQUsmGD_Bw_Bw@mail.gmail.com>
 <Pine.LNX.4.44L0.1909241031550.6144-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1909241031550.6144-100000@netrider.rowland.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 24, 2019 at 10:33:12AM -0400, Alan Stern wrote:
> On Tue, 24 Sep 2019, Andrey Konovalov wrote:
> 
> > On Tue, Sep 24, 2019 at 4:19 PM syzbot
> > <syzbot+dbd38fbb686a9681143a@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    d9e63adc usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1602b303600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=f4fa60e981ee8e6a
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=dbd38fbb686a9681143a
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > >
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+dbd38fbb686a9681143a@syzkaller.appspotmail.com
> 
> > Most probably the same bug:
> > 
> > https://syzkaller.appspot.com/bug?extid=745b0dff8028f9488eba
> > 
> > #syz dup: KASAN: invalid-free in disconnect_rio (2)
> 
> Even more to the point, a patch was recently posted to the mailing list 
> to remove the rio500 driver entirely:
> 
> 	https://marc.info/?l=linux-usb&m=156925553004947&w=2

I'll be queueing this up and just marking the driver BROKEN on older
kernels to solve all of these issues :)

thanks,

greg k-h
