Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD95C9257B
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 15:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfHSNtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 09:49:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:59478 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727308AbfHSNtI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 09:49:08 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A0E23B011;
        Mon, 19 Aug 2019 13:49:07 +0000 (UTC)
Message-ID: <1566222541.5663.27.camel@suse.com>
Subject: Re: divide error in usbtmc_generic_read
From:   Oliver Neukum <oneukum@suse.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        steve_bayless@keysight.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com,
        syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Mon, 19 Aug 2019 15:49:01 +0200
In-Reply-To: <CAAeHK+wGzWGvW0AVSr6qA+AcpLr7A3Xi8wR7f-rBQJmMmQgU2A@mail.gmail.com>
References: <000000000000a59094059013dd63@google.com>
         <1565875886.5780.7.camel@suse.com>
         <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com>
         <1566218263.5663.22.camel@suse.com>
         <CAAeHK+xX3vk_JoJ=2tHF__LECxNmPXuPMkxWz6u+K6L-MdN=9g@mail.gmail.com>
         <1566220164.5663.25.camel@suse.com>
         <CAAeHK+wGzWGvW0AVSr6qA+AcpLr7A3Xi8wR7f-rBQJmMmQgU2A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 19.08.2019, 15:18 +0200 schrieb Andrey Konovalov:
> On Mon, Aug 19, 2019 at 3:09 PM Oliver Neukum <oneukum@suse.com> wrote:
> > 
> > Am Montag, den 19.08.2019, 14:43 +0200 schrieb Andrey Konovalov:
> > > On Mon, Aug 19, 2019 at 2:37 PM Oliver Neukum <oneukum@suse.com> wrote:
> > > > The original error was a divide by zero. The first fix fixed that
> > > > but still another error showed up. If I propose a fix there are
> > > > other possibilities besides it working.
> > > > 
> > > > I could have no effect on the original bug or my fix breaks
> > > > something else and KASAN is making no difference between
> > > > those cases.
> > > 
> > > I think you mean syzbot here and not KASAN. Do I understand correctly,
> > > that you're saying that the original report was
> > 
> > Yes, sorry syzbot.
> > 
> > > divide-by-zero, but
> > > when you requested to test the patch the reproducer triggered a
> > > use-after-free, and syzbot didn't treat the patch you provided as a
> > > correct fix?
> > 
> > No, obviously there is still a bug. What I would like syzbot to have
> > would be a third category: inconclusive.
> > Seeing another bug instead may also mean the first bug struck
> > before the second could ever happen. We just lack data to tell.
> 
> OK, I see. The exact words that syzbot uses in this case are "syzbot
> has tested the proposed patch but the reproducer still triggered
> crash". What would you like to see instead?
> 

"syzbot has tested the proposed patch but the reproducer triggered
another crash" would make it clearer.

	Regards
		Oliver

