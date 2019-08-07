Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D63084DFA
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 15:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387998AbfHGNyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 09:54:04 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44044 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387945AbfHGNyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 09:54:03 -0400
Received: by mail-pl1-f194.google.com with SMTP id t14so40909531plr.11
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RoWuMVNmRfMP6twJoSi1+gPLSwhvWNnJuHSrIbb4GeQ=;
        b=eyUcy5z6yfw7W/XYFZBrztR051qXApfEiFeV/KKMElwaltRh01FBH4xOMriqmhXp0S
         n/v5K2gv8DkzWqmgi3OPIu/uZeatsk/e4eUzGdC/tnfmx7B5olD03Ys6HOFk0rzfIFkk
         oA/DgVgpEyMOza2fUdSzLIot4e5OEk2/nTGtVCQ2ueoFhiMdtb2PXRsIn7WBf++sEABC
         Yi2PICeym++vGALaVMd2XCJIW5JRrrpqhh+wohmHf72c1gY2dgUH/Ba6AsPkvF3kqNnc
         T57wge3JXy4SGLqEQyZQTkK0m1+nxgiYoRdzni+bWhDOBzPPRY7SqyxSbC2ICet8Abbo
         9JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RoWuMVNmRfMP6twJoSi1+gPLSwhvWNnJuHSrIbb4GeQ=;
        b=PlcElI1S2HAnGK1tEaDIsXEnOpFV75ExgjwLtNB4ZnffSpU2nQ0EDcC/nF3LvwShsY
         vu7ZpMPOHQtQX/89HQHHdmjc5EPV8C0EJFdFLIydoxwaZS6qijCfMVWI3hDHwnnP4Ok2
         rSHDjKE3qr6oPzvEVK+8oh9pFNeoaxeGfLwVpKypY3XuLq6wdfKA4b6e2V9cH2xarB8K
         KpVvq03PHgpQn3fVlGJbTHtLB326AqPRD0l713qFRmgFEHPMQGlCBC0Swue5tMmo7Cwo
         CMl1AkZKxd+xnPnC3YwNen/lKvjdNrYQzImxsH6R74MmpzjmUbrZXCP7/F8QIYbhljDX
         acRQ==
X-Gm-Message-State: APjAAAXwu/yrMdL4KWc+LtYyeBGVuSqe79xtlbcDwq3KbBYyyajcix2D
        qj+d1RfaScIlrFDP1uqP39sJxOcn4TYEJbsvoRDdJA==
X-Google-Smtp-Source: APXvYqyvTTzfZlxz9lgLLA6e7+UPFvYSd1PebuD8n5S/aCiPLUwVFCoM3CmHUJckUsWy/8R2gqFgH/Uhfolr9hDtZBQ=
X-Received: by 2002:a63:c442:: with SMTP id m2mr8020736pgg.286.1565186041896;
 Wed, 07 Aug 2019 06:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000088af91058f0fe377@google.com> <Pine.LNX.4.44L0.1908061509040.1571-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908061509040.1571-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Aug 2019 15:53:50 +0200
Message-ID: <CAAeHK+zLrYaE+Kt6AULPjKhBNknxPBWncfkTDmm3eFoLSpsffw@mail.gmail.com>
Subject: Re: possible deadlock in open_rio
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Cesar Miquel <miquel@df.uba.ar>,
        rio500-users@lists.sourceforge.net,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 6, 2019 at 9:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
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

I've tried some simple approaches to reproducing this, but failed.
Should this require two rio500 devices to trigger?

>
> Is there any way you can test this?

Not yet.

>
> Alan Stern
>
