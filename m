Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637113D0A15
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235431AbhGUHMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 03:12:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235929AbhGUHMS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Jul 2021 03:12:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54E2F600D1;
        Wed, 21 Jul 2021 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626853961;
        bh=tUphiwQDX85m8Rjh8T9uZGf3kq44NuGvAEk3ycKBXlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F1jc2LYxx/1vYeZt7Dhi5pSqZKtZf2PVc74Iq+bgMMSrbv6a3zwU2nepwrCw70RMN
         6xPNlRgkkCypEI9B+MnNgsBARNyz8WVQNUMcEgV+NodjzaV0LeyVtQGNqWgarVjVOJ
         YTjuxUZ1yCf64Qqzqmc8aZ8hghtQX3IJwBvbwQKE=
Date:   Wed, 21 Jul 2021 09:52:39 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dave penkler <dpenkler@gmail.com>
Cc:     qiang.zhang@windriver.com, Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>, paulmck@kernel.org,
        Guido <guido.kiener@rohde-schwarz.com>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Message-ID: <YPfSR4+XANsatypk@kroah.com>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
 <YPfIAolSC8mJoQUr@kroah.com>
 <CAL=kjP0YnzF8sALwH5T5+NpWn3wsuqR+K3GLHDJXLkdO4usyWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL=kjP0YnzF8sALwH5T5+NpWn3wsuqR+K3GLHDJXLkdO4usyWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 09:41:15AM +0200, dave penkler wrote:
> On Wed, 21 Jul 2021 at 09:08, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.com wrote:
> > > From: Zqiang <qiang.zhang@windriver.com>
> >
> > I need a "full" name here, and in the signed-off-by line please.
> >
> > >
> > > rcu: INFO: rcu_preempt self-detected stall on CPU
> > > rcu:    1-...!: (2 ticks this GP) idle=d92/1/0x4000000000000000
> > >         softirq=25390/25392 fqs=3
> > >         (t=12164 jiffies g=31645 q=43226)
> > > rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0
> > >      RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> > > rcu:    Unless rcu_preempt kthread gets sufficient CPU time,
> > >         OOM is now expected behavior.
> > > rcu: RCU grace-period kthread stack dump:
> > > task:rcu_preempt     state:R  running task
> > >
> > > In the case of system use dummy_hcd as usb controller, when the
> > > usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb
> > > status is unknown, the urb will be resubmit, the urb may be insert
> > > to dum_hcd->urbp_list again, this will cause the dummy_timer() not
> > > to exit for a long time, beacause the dummy_timer() be called in
> > > softirq and local_bh is disable, this not only causes the RCU reading
> > > critical area to consume too much time but also makes the tasks in
> > > the current CPU runq not run in time, and that triggered RCU stall.
> > >
> > > return directly when find the urb status is not zero to fix it.
> > >
> > > Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
> > > Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> >
> > What commit does this fix?  Does it need to go to stable kernels?
> >
> > What about the usbtmc maintainers, what do they think about this?
> 
> This patch makes the babbling endpoint retry/recovery code in the real
> world usb host controller drivers redundant and would prevent usbtmc
> applications from benefiting from it.

I do not understand, is this change ok or not?

Why do usbtmc applications need to know if babbling happens or not?

confused,

greg k-h
