Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 391DA3D0C39
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 12:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbhGUJUn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 05:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235577AbhGUJES (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 05:04:18 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9C3C061574
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 02:44:36 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id y66so2250102oie.7
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KrRNQYOV3PppAuTlilGPq5iXGkm7ANtq2oM1BJpxiXM=;
        b=I4zkH5K59KUVQyGNkVkuOxr/5PWzSYvPcN7e6nQwniP+4/iK/V0CkucizMQivNJNEg
         a9kajnoF4tXLmnFU94X7aE72Ai+iGa6q/iJpBVEnFpaNR8fbnoADNK5cFzxrz4Th9+ex
         IESw9wTig3sxVNGdt9EfKjCp4zZC50MykZ8S28YpGuZtfmpABonwAWzNqfs/9h2FrJt7
         LP7iNTlCzRDPCr5QhStqNzmuNd7odXebHk8xW+wsqw4m4ETGPmwF8qsLgUbMmzpYxESn
         Sy9Zy9rxWfSbU4yD4Zyo4jEkfzh1SBWBQ6Zli/qjp/L7g8x3iWkCfcc212ub5vLEdjcR
         dLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KrRNQYOV3PppAuTlilGPq5iXGkm7ANtq2oM1BJpxiXM=;
        b=oLhPhIKgLLg9s/67SeeYWHhyaXARkY7najze7FKU9DGoDQcQF9m0wEGe2eIXM9X9vA
         5MCfW6LHaprVcdhUWUz6QVEyPkpBnS79o15CqX2s4mzoUyG8+NMkSAhIB1yOmM67XPAN
         3wRTP/tNo+pOULkHXwtYPayO7i2xCLqRkALGH24UOOljiohXmBCsWOTEcU2suojUxYBh
         yATlcF8ukGLMufZlIc+bJi1HN/ncDGURWPmuONVhgYdzV9LfYAK9Jgte8+Xga7va520M
         XFZqO6pU/ow7cLDmt06l7ZX/wop9hs+p70dFdmApFnnOrZAnKIWQTs6GwIVbr6Cdrbce
         B6Hg==
X-Gm-Message-State: AOAM5309cu0bNlR/oTobo39xvTb/XCo1LIge+y0yepLAX2VYguCLDByT
        AI908W+J4rJeKEZEvCG/duhcnV1+2eN9pMBzFPU=
X-Google-Smtp-Source: ABdhPJxh1hEefTFDKI/dNZAh0DwRaXlWVUG2fJZZKrVqXCewYqP1AGpL0ry7Uj2nvYe79fXt1R7vzL1AHM8u4Lhh9V0=
X-Received: by 2002:aca:4a8d:: with SMTP id x135mr19600542oia.6.1626860675836;
 Wed, 21 Jul 2021 02:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
 <YPfIAolSC8mJoQUr@kroah.com> <CAL=kjP0YnzF8sALwH5T5+NpWn3wsuqR+K3GLHDJXLkdO4usyWw@mail.gmail.com>
 <YPfSR4+XANsatypk@kroah.com>
In-Reply-To: <YPfSR4+XANsatypk@kroah.com>
From:   dave penkler <dpenkler@gmail.com>
Date:   Wed, 21 Jul 2021 11:44:23 +0200
Message-ID: <CAL=kjP1OweXxw3zgs_WfpmZw-YJZN=dxand6twgQruwgAyfAaQ@mail.gmail.com>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     qiang.zhang@windriver.com, Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>, paulmck@kernel.org,
        Guido <guido.kiener@rohde-schwarz.com>,
        USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 21 Jul 2021 at 09:52, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 21, 2021 at 09:41:15AM +0200, dave penkler wrote:
> > On Wed, 21 Jul 2021 at 09:08, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.com wrote:
> > > > From: Zqiang <qiang.zhang@windriver.com>
> > >
> > > I need a "full" name here, and in the signed-off-by line please.
> > >
> > > >
> > > > rcu: INFO: rcu_preempt self-detected stall on CPU
> > > > rcu:    1-...!: (2 ticks this GP) idle=d92/1/0x4000000000000000
> > > >         softirq=25390/25392 fqs=3
> > > >         (t=12164 jiffies g=31645 q=43226)
> > > > rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0
> > > >      RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> > > > rcu:    Unless rcu_preempt kthread gets sufficient CPU time,
> > > >         OOM is now expected behavior.
> > > > rcu: RCU grace-period kthread stack dump:
> > > > task:rcu_preempt     state:R  running task
> > > >
> > > > In the case of system use dummy_hcd as usb controller, when the
> > > > usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb
> > > > status is unknown, the urb will be resubmit, the urb may be insert
> > > > to dum_hcd->urbp_list again, this will cause the dummy_timer() not
> > > > to exit for a long time, beacause the dummy_timer() be called in
> > > > softirq and local_bh is disable, this not only causes the RCU reading
> > > > critical area to consume too much time but also makes the tasks in
> > > > the current CPU runq not run in time, and that triggered RCU stall.
> > > >
> > > > return directly when find the urb status is not zero to fix it.
> > > >
> > > > Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
> > > > Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> > >
> > > What commit does this fix?  Does it need to go to stable kernels?
> > >
> > > What about the usbtmc maintainers, what do they think about this?
> >
> > This patch makes the babbling endpoint retry/recovery code in the real
> > world usb host controller drivers redundant and would prevent usbtmc
> > applications from benefiting from it.
>
> I do not understand, is this change ok or not?
>
> Why do usbtmc applications need to know if babbling happens or not?
>
> confused,
Sorry, the issue this patch is trying to fix occurs because the
current usbtmc driver resubmits the URB when it gets an EPROTO return.
The dummy usb host controller driver used in the syzbot tests keeps
returning the resubmitted URB with EPROTO causing a loop that starves
RCU. With an actual HCI driver it either recovers or returns an EPIPE.
In either case no loop occurs. So for my part as a user and maintainer
this patch is not ok.
>
> greg k-h
