Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477653D0967
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 09:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbhGUGaS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 02:30:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:53426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234120AbhGUG2Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Jul 2021 02:28:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC2DE601FC;
        Wed, 21 Jul 2021 07:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626851332;
        bh=2U4/lANKlIuDOPLqBzLRQgqoxjAhGdQgZHzJzzGNYoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DESfJ0ZRCbiSwO/0qv72TA97jDeVoD9ffoHSW/a/nMRf0ebOervsTNEBQIZEDrUBh
         dM1gpWoSLvX4pL8D4r7x78etVbczM0GOsCbr7I3yA8cEQM9h/Cs0VRm8MGs4VjRBwn
         QTgyD+7FTzO3z809ImkrbVgDywasMrFBLYO1dOrQ=
Date:   Wed, 21 Jul 2021 09:08:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     qiang.zhang@windriver.com
Cc:     stern@rowland.harvard.edu, dvyukov@google.com, paulmck@kernel.org,
        dpenkler@gmail.com, guido.kiener@rohde-schwarz.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Message-ID: <YPfIAolSC8mJoQUr@kroah.com>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629033236.7107-1-qiang.zhang@windriver.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.com wrote:
> From: Zqiang <qiang.zhang@windriver.com>

I need a "full" name here, and in the signed-off-by line please.

> 
> rcu: INFO: rcu_preempt self-detected stall on CPU
> rcu:    1-...!: (2 ticks this GP) idle=d92/1/0x4000000000000000
>         softirq=25390/25392 fqs=3
>         (t=12164 jiffies g=31645 q=43226)
> rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0
>      RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> rcu:    Unless rcu_preempt kthread gets sufficient CPU time,
>         OOM is now expected behavior.
> rcu: RCU grace-period kthread stack dump:
> task:rcu_preempt     state:R  running task
> 
> In the case of system use dummy_hcd as usb controller, when the
> usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb
> status is unknown, the urb will be resubmit, the urb may be insert
> to dum_hcd->urbp_list again, this will cause the dummy_timer() not
> to exit for a long time, beacause the dummy_timer() be called in
> softirq and local_bh is disable, this not only causes the RCU reading
> critical area to consume too much time but also makes the tasks in
> the current CPU runq not run in time, and that triggered RCU stall.
> 
> return directly when find the urb status is not zero to fix it.
> 
> Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>

What commit does this fix?  Does it need to go to stable kernels?

What about the usbtmc maintainers, what do they think about this?

thanks,

greg k-h
