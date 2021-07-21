Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC093D09EF
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 09:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235415AbhGUHA7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 03:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235406AbhGUHAv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 03:00:51 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDBEC0613DF
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 00:41:28 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id b18-20020a0568303112b02904cf73f54f4bso1291931ots.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Jul 2021 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XM9JhpPzHY4G1LVkcjjOt54QDaAwPA2h36eynvr9r1c=;
        b=J3bm53d2PyHeN4CBTT8NkmaPtpNnHhwFWk91bwzFcMK2vFm9nkJzfHpZLs+pNgH/Aj
         KSvC94OTbfT7JNFr59ZBgJAltA4QbcNfnU3/APbr1+d8HI0UISL29d/li6womRrD41Y5
         DlClXYftGe2StaBgOcgZk4kAQBGJtwKAy4YF68ZEEkIEoyffm6Q0lXtr9JWDGvN0LISF
         POk9WEs6YKkv76wE4+uvUjcGuYGdQJ+phO2prZ9VMqfDqhEJYmlOWoyCFL0pzcdtAMmp
         AQUczOIg1e4VYeetqzBUx01XCZJiGUysQExTDdiNqZ7g2bHPUZPEKJXWPNoZG2jFL5fI
         rxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XM9JhpPzHY4G1LVkcjjOt54QDaAwPA2h36eynvr9r1c=;
        b=S65sqqOD+6C7IOtmQBvUebHoHyybmGrSbioWXtZ0H+j5neVldi2evtX0tovuilK/kj
         BbuE7dFq8o1JxqvYq3EjFX1ZLhYyCZkq5q6b3DPTm2yVk9ON5KIaalOUdmaWHl9aCjFZ
         qDa/iwQehxV7n/84FvHhXOVTN7DdTanX7DImzGjj9AeyfbD0qtqV4tIr7Ea/w20qqpmI
         0tlTUuPN4bh5yJi2ddeNpteUsYnqakxriSXCbPF3L4vXQp2XWtOjdvAQRwH6jWGfxqoN
         88wYEYhKuAKu/aSWxiqo+LUobT9FSadYR/DzJLsJO7feh6tk0KzAuoySew5j163U71Pb
         Mkig==
X-Gm-Message-State: AOAM5336khNDdKRI/c7YbnFy9/19sq53IS4vUf//XlYLn+aEoO+bTcVE
        d6YufwxR06c50IDtipLvpipvPYk/oWcTWeiOFME=
X-Google-Smtp-Source: ABdhPJzKScYJrcgilYd7bhJpDxCvS23OudipBUna1ZBSd199UNnvlbhzVslfiv2YE5cAWK4S7DGWK8FOFKWUiVXokzc=
X-Received: by 2002:a9d:7dcf:: with SMTP id k15mr19091044otn.201.1626853287915;
 Wed, 21 Jul 2021 00:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210629033236.7107-1-qiang.zhang@windriver.com> <YPfIAolSC8mJoQUr@kroah.com>
In-Reply-To: <YPfIAolSC8mJoQUr@kroah.com>
From:   dave penkler <dpenkler@gmail.com>
Date:   Wed, 21 Jul 2021 09:41:15 +0200
Message-ID: <CAL=kjP0YnzF8sALwH5T5+NpWn3wsuqR+K3GLHDJXLkdO4usyWw@mail.gmail.com>
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

On Wed, 21 Jul 2021 at 09:08, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 29, 2021 at 11:32:36AM +0800, qiang.zhang@windriver.com wrote:
> > From: Zqiang <qiang.zhang@windriver.com>
>
> I need a "full" name here, and in the signed-off-by line please.
>
> >
> > rcu: INFO: rcu_preempt self-detected stall on CPU
> > rcu:    1-...!: (2 ticks this GP) idle=d92/1/0x4000000000000000
> >         softirq=25390/25392 fqs=3
> >         (t=12164 jiffies g=31645 q=43226)
> > rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0
> >      RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> > rcu:    Unless rcu_preempt kthread gets sufficient CPU time,
> >         OOM is now expected behavior.
> > rcu: RCU grace-period kthread stack dump:
> > task:rcu_preempt     state:R  running task
> >
> > In the case of system use dummy_hcd as usb controller, when the
> > usbtmc devices is disconnected, in usbtmc_interrupt(), if the urb
> > status is unknown, the urb will be resubmit, the urb may be insert
> > to dum_hcd->urbp_list again, this will cause the dummy_timer() not
> > to exit for a long time, beacause the dummy_timer() be called in
> > softirq and local_bh is disable, this not only causes the RCU reading
> > critical area to consume too much time but also makes the tasks in
> > the current CPU runq not run in time, and that triggered RCU stall.
> >
> > return directly when find the urb status is not zero to fix it.
> >
> > Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
> > Signed-off-by: Zqiang <qiang.zhang@windriver.com>
>
> What commit does this fix?  Does it need to go to stable kernels?
>
> What about the usbtmc maintainers, what do they think about this?

This patch makes the babbling endpoint retry/recovery code in the real
world usb host controller drivers redundant and would prevent usbtmc
applications from benefiting from it.

>
> thanks,
>
> greg k-h
