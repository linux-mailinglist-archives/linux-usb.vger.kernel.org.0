Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B44884D7E
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 15:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388240AbfHGNh3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 09:37:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:42292 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387982AbfHGNh2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 09:37:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8735DAEF3;
        Wed,  7 Aug 2019 13:37:27 +0000 (UTC)
Message-ID: <1565185044.15973.0.camel@suse.com>
Subject: Re: possible deadlock in open_rio
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>
Cc:     miquel@df.uba.ar, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        rio500-users@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Date:   Wed, 07 Aug 2019 15:37:24 +0200
In-Reply-To: <Pine.LNX.4.44L0.1908061509040.1571-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908061509040.1571-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 06.08.2019, 15:13 -0400 schrieb Alan Stern:
> On Thu, 1 Aug 2019, syzbot wrote:
> 
> > Hello,
> > 
> > syzbot found the following crash on:
> > 
> > HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=136b6aec600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> > dashboard link: https://syzkaller.appspot.com/bug?extid=7bbcbe9c9ff0cd49592a
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > 
> > Unfortunately, I don't have any reproducer for this crash yet.
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com
> > 
> > ======================================================
> > WARNING: possible circular locking dependency detected
> > 5.3.0-rc2+ #23 Not tainted
> > ------------------------------------------------------
> 
> Andrey:
> 
> This should be completely reproducible, since it's a simple ABBA
> locking violation.  Maybe just introducing a time delay (to avoid races
> and give the open() call time to run) between the gadget creation and
> gadget removal would be enough to do it.

Hi,

technically yes. However in practical terms the straight revert I sent
out yesterday should fix it.

	Regards
		Oliver

