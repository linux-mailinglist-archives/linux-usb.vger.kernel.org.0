Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B7696291
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 16:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbfHTOii (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 10:38:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:53000 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728248AbfHTOii (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 10:38:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4B72DAE87;
        Tue, 20 Aug 2019 14:38:37 +0000 (UTC)
Message-ID: <1566311916.11678.26.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in iowarrior_disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     keescook@chromium.org, gustavo@embeddedor.com,
        andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        gregkh@linuxfoundation.org,
        syzbot <syzbot+cfe6d93e0abab9a0de05@syzkaller.appspotmail.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Date:   Tue, 20 Aug 2019 16:38:36 +0200
In-Reply-To: <Pine.LNX.4.44L0.1908201005340.1573-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908201005340.1573-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 20.08.2019, 10:18 -0400 schrieb Alan Stern:
> On Mon, 19 Aug 2019, Oliver Neukum wrote:
> 
> > Am Montag, den 19.08.2019, 07:48 -0700 schrieb syzbot:
> > > Hello,
> > > 
> > > syzbot found the following crash on:
> > > 
> > > HEAD commit:    d0847550 usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=139be302600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=dbc9c80cc095da19
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=cfe6d93e0abab9a0de05
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12fe6b02600000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1548189c600000
> > > 
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+cfe6d93e0abab9a0de05@syzkaller.appspotmail.com
> > > 
> > 
> > #syz test: https://github.com/google/kasan.git d0847550
> 
> There's no need for us to work at cross purposes on this.  We can go 
> with your approach.
> 
> However, the code is more complicated than your patch accounts for.  
> The wait can finish in several different ways:
> 
> (1)	The control URB succeeds and the interrupt URB gets an 
> 	acknowledgment.
> 
> (2)	The control URB completes with an error.
> 
> (3)	The wait times out.
> 
> (4)	A disconnect occurs.

I absolutely agree. There is something quite wrong in this driver.
Unfortunately this is likely exploitable by a malicious gadget,
so just ignoring this is a bad option. I will need to go through the
logic. Or do you want to have a shot at it?

The patch was really only for testing. I wanted to know whether
I was hitting this very issue. This driver will need more surgery.

	Regards
		Oliver

