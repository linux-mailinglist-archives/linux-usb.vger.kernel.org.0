Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B181328E3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 15:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgAGO2o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 09:28:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40012 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbgAGO2n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 09:28:43 -0500
Received: by mail-pg1-f196.google.com with SMTP id k25so28570216pgt.7
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2020 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m5lSdpvKrQdoMNKY33r6vQZFxtEtwTJgacT6S/p15LA=;
        b=V29OXUfwm4o6nbaaQVxAuVrKbGji3meV4j+OhIqD7BlXBrA2oYC9ni7MOCSdJb9nBr
         FIR4XXV6k57HZCW4swIB5KLVE+viDHImvGR8BZyhdjbn3X9Y9KJ2OveARgiZu5Ws4oyu
         pI9QwBt7aqRgr4yDb/ym+/NBbv82apnB2AIzh3RRNNAD+VUd15KC6X+YVeMSi2ejBQIK
         ifc5TpiLEXgcZuMPZJd9iPpQwSZsEh+k39If7oIt2A7GM7vKRvXuwZjMtCEew37dToe5
         PeUNiii9ntNBSYDcmHRIlOSmtHg+eNmXB9NsUhsqhvuVqx9m6ukydwBa64MmfAOoODes
         C7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m5lSdpvKrQdoMNKY33r6vQZFxtEtwTJgacT6S/p15LA=;
        b=V79Y+1m/4bKi0wqcB8ASBPnFqvrzXw3YKf0iZQ1x+O5i3LvUkFnF4V0xCeLnL2bJav
         lvyyksMNk2wIkjiWzNTS9vsxudVF7+motWSGqmmC/K1pbUeG9mOS495c+Fqez40lzSKx
         txPTCjil1pOwHaz7+JNjfXDGxgD4PF/VRB2DrCjL5RsFPQKQgdIk1MXiPQ/D6qzS11q2
         1PZKNE4sb/LUc1ku0KHc70G9msi9TefEdi5q2VxHdJQrs64NT382MkvxwLp5TOwviafC
         Ru1ir2HGI3Fm5CfQRiDfhrYPlyS7uY+l7TiyUULOSiV21ugjiSBpOzEtZXUbQYYZZS78
         mHkQ==
X-Gm-Message-State: APjAAAUHg+FvzKYFoxnGeXlX/x2NF42+XStRdYsmPlbKiGExbM697tl1
        mLlPeLdDTI4AYwygwh/xIIXxTxqxtXXlSwbNShG/uA==
X-Google-Smtp-Source: APXvYqwsvDKv31NioKb+iBX2xS/6+IXQu9qBpvBlOsvPE2Rnfz2aPjulQZ9cl4M3VPWvg1mHrdOQmsWs9sBNXW+eJTo=
X-Received: by 2002:aa7:9629:: with SMTP id r9mr82321097pfg.51.1578407321830;
 Tue, 07 Jan 2020 06:28:41 -0800 (PST)
MIME-Version: 1.0
References: <000000000000d29687059b3f32aa@google.com> <Pine.LNX.4.44L0.2001031159280.1560-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001031159280.1560-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 7 Jan 2020 15:28:30 +0100
Message-ID: <CAAeHK+z5sY=CpPhO0QZGE_o1Bo8XA4PG4NT=mprO=9=Rg+1kkQ@mail.gmail.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (2)
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        ingrassia@epigenesys.com,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 3, 2020 at 6:01 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 3 Jan 2020, syzbot wrote:
>
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger
> > crash:
> >
> > Reported-and-tested-by:
> > syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         ecdf2214 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b06a019075333661
> > dashboard link: https://syzkaller.appspot.com/bug?extid=10e5f68920f13587ab12
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=177f06e1e00000
> >
> > Note: testing is done by a robot and is best-effort only.
>
> Andrey:
>
> Clearly something strange is going on here.  First, the patch should
> not have changed the behavior; all it did was add some log messages.
> Second, I don't see how the warning could have been triggered at all --
> it seems to be complaining that 2 != 2.

Hi Alan,

It looks like some kind of race in involved here.

There are a few indications of that: 1. there's no C reproducer
generated for this crash (usually happens because of timing
differences when executing syz repro vs C repro), 2. syz repro has
threaded, collide and repeat flags turned on (which means it gets
executed many times with some syscalls scheduled asynchronously).

This also explains the weirdness around the 2 != 2 check being failed.
First the comparison failed, then another thread updated one of the
numbers being compared, and then the printk statement got executed.

>
> Does the reproducer really work?

Yes, it worked for syzbot at the very least. It looks like your patch
introduced some delays which made the bug untriggerable by the same
reproducer. Since this is a race it might be quite difficult to
reproduce this manually (due to timing differences caused by a
different environment setup) as well unfortunately.

Perhaps giving a less invasive patch (that minimizes timing changes
introduced to the code that is suspected of being racy) to syzbot
could be used to debug this.

Thanks!
