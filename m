Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BF0BCA54
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 16:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441407AbfIXOgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 10:36:07 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38532 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437484AbfIXOgH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 10:36:07 -0400
Received: by mail-pg1-f196.google.com with SMTP id x10so1441406pgi.5
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2019 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWrjSZbVzCSF8WZ+++HHslTJ1JQwI009WrWGF5Q75K0=;
        b=QXOLXWDXD9cpbzgz03LiGWlIBs/0qBEe80yPw2GCtljpLIWho1iF80bPezz6ZNnP6I
         D4rA3JhatVzlkT7Oli+DDLHiC/lWW55x2meeHh1bsya2aqBiFiDt0PQ+EOo3LeTOvKf2
         9XiRoRnemDBmtkZxx1/DGqK6efW/b6ckVx66tuzVznQU8CmTfPpWyEVEUn6p/LZ6B7zv
         67C5n0GDBfxTC7MYM1Lbxvf1N1uzMkPWS+qeE9TJTHaLQVUIN/mjlHVXyM89vcbcNGKb
         Bi7Gb9uhHUP9uryb7REQ5Yjos4tc1Jq6nlPrh1QE5vjyGytw9xOyEhwwvIiTbERjkkY3
         msjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWrjSZbVzCSF8WZ+++HHslTJ1JQwI009WrWGF5Q75K0=;
        b=SZXnuUqVH6WMRaE+x3Pk3F1CrW4liuA4DGJpJ0u8iUrMp085hiJ67EX4rmEFwkDjNF
         49UI1RYlWyCzmRzciyojn05EUpotpbavuZwvF57yt1XhuUYx8IYYMEgtiACYJA+xkYqM
         OkpQbzxxktb97zoa/jwYJgb2n53CBlo470kA8Gztg4AcA7McyqticmI+tryiYxaqJ92l
         opvEgK1MUhjga+4OZ2o6DcSpO5tcm9xQaMrrx0gS9uGxI35yeYh+f7P8qiaDRInu86zD
         WE6tjzDUg0dt/IGW4cWOE4xApuCGlLtMCFTYvvbw/0DQOSUbzvRiMBT4P1gjc6saaYbv
         sfwA==
X-Gm-Message-State: APjAAAWjwSUIS4Q82W0qSKTswSlYMT9rAWtbzplfFQSmdTyY+GOoso7B
        ncYwpYSYoF7peKUHmRfM5aB1DyWbs47Ik8nkwimjBg==
X-Google-Smtp-Source: APXvYqyassC1JU9mUeijE+TXPXc9EO7l74X+9vvcwIMCjByf/qWBPPeG4NmqGp82zUmMmAxfXtMpZYCSGJ6iI9OyuYk=
X-Received: by 2002:a17:90a:ff18:: with SMTP id ce24mr323505pjb.123.1569335766151;
 Tue, 24 Sep 2019 07:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+wE8ngx2Pa9=vD6Fw6MCbHpxfX6ss97deQUsmGD_Bw_Bw@mail.gmail.com>
 <Pine.LNX.4.44L0.1909241031550.6144-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909241031550.6144-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 24 Sep 2019 16:35:55 +0200
Message-ID: <CAAeHK+wx8bHJXHDyx29Jnc7K+FzL33DCs23_NZPN6uHxho4vKA@mail.gmail.com>
Subject: Re: general protection fault in open_rio
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+dbd38fbb686a9681143a@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 24, 2019 at 4:33 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
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
>         https://marc.info/?l=linux-usb&m=156925553004947&w=2

OK, I'll use this commit to mark the remaining rio500 reports once
it's upstream. Thanks!
