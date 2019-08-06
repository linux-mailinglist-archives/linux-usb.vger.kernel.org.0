Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC2883371
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 16:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732142AbfHFOAr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 10:00:47 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42493 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfHFOAq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 10:00:46 -0400
Received: by mail-pg1-f196.google.com with SMTP id t132so41645538pgb.9
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=knvjA15pk+D6+eDPEAR3G295zTdGrvaRaVz2c/zrtMc=;
        b=Jn33iUwngj127X1xLCgPzB+3JEJo/nishEeVWQu2a7HCloAI0JQ08jy3tD29RQele7
         uvyYq5ajIqLVzPXbPqc9X6RJPpehWbvOTnxap87B7jn/M6gR7pMPv4xKtZtomrRvjJMA
         J15+hzsP+LdAM5OIe7KuW8DLFihGYNk22fviipazeD9HwOb0PmeJf+owdSc4eH1rlCQK
         H+F2LIytF8LAjQzBaBobnb0JI+4+c/wCGvYh+ZkB5LkjkDYl/y1liQITKjlqJuZm4yYx
         tPuOcu0Cxm+DESsxLiyKwxjNIXgdgOrQXdn/IqgRJQJ//AtVL9/ki8OUVrBi49s5/lvr
         yDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knvjA15pk+D6+eDPEAR3G295zTdGrvaRaVz2c/zrtMc=;
        b=Cf/ZGWvUwYfbJJm1ca+MTj4xeZ2F1oBhAChji50+13STJ9JXZVCF0aNgEztq5IyLsQ
         5x8IutF3rP1+C7KlhrOWm5BO21Pxw5aHthbcRO3+GD2unh0o818jV9VQeMy7jPhVA0qc
         x6JvW+8+QKPKJdKtwtwgNh1INDjm0WF5MpZ7tgJc+5uF7+rICmk5m1SvoKlZWsQ/Q2iX
         gggkoGZP+p0YWNF0/fbkiqpmlyW4B+IG5gPWjGym4/lXS8nxEbN4kf+asTtWX0GSsnwe
         mmzFyirfXxajPrOzctfmwhBeKM02JhGCPVpTs2IX1q7uWF4G+uiLXFnVMrJs3O9atLzk
         xeGw==
X-Gm-Message-State: APjAAAVzD8HJ4kEAIE0u88w93p16i6WV9+DzcVGVdpaHJkZaDA4UJQPQ
        E/bZB0bBguIplxROEpfHq2VNKT7e3xbzLX4RCLrPBg==
X-Google-Smtp-Source: APXvYqzAbdSPoaPGgnj6j5FcbWoVolaxHEtDCp3J5f3XR0vb7A9dO2g3YRbapn+qgeJbnQMjj70k8ZfJ8tm1ybE+NCY=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr3190449pgq.130.1565100045705;
 Tue, 06 Aug 2019 07:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xrCX61XE6YBnGBKgAuwC1LEbGFDFr5KO2i2O5r11UP5A@mail.gmail.com>
 <Pine.LNX.4.44L0.1908060957420.1571-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908060957420.1571-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 6 Aug 2019 16:00:34 +0200
Message-ID: <CAAeHK+zsz4-rdYt92Ywo1SV+LOsmPY3nF97bGt7j7w8VneAP3g@mail.gmail.com>
Subject: Re: KMSAN: kernel-usb-infoleak in pcan_usb_pro_send_req
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzbot <syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Alexander Potapenko <glider@google.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 6, 2019 at 3:59 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 6 Aug 2019, Andrey Konovalov wrote:
>
> > On Tue, Aug 6, 2019 at 2:45 PM Oliver Neukum <oneukum@suse.com> wrote:
> > >
> > > Am Dienstag, den 30.07.2019, 02:38 -0700 schrieb syzbot:
> > > > Hello,
> > > >
> > > > syzbot found the following crash on:
> > > >
> > > > HEAD commit:    41550654 [UPSTREAM] KVM: x86: degrade WARN to pr_warn_rate..
> > > > git tree:       kmsan
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=13e95183a00000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=513e4d0985298538bf9b
> > > > compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> > > > 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eafa1ba00000
> > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b87983a00000
> > > >
> > > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > > Reported-by: syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com
> > >
> > > #syz test: https://github.com/google/kasan.git 41550654
> >
> > Hi Oliver,
> >
> > For KMSAN bugs you'll need to use the kmsan tree (syz test:
> > https://github.com/google/kmsan.git COMMIT_ID). I've updated the
> > testing instructions some time ago to reflect this. Sorry for the
> > complexity, this is caused by USB fuzzing and KMSAN not being upstream
> > yet.
>
> Maybe you can fix the "git tree:" header in the bug report.  It should
> say "https://github.com/google/kmsan.git" instead of just "kmsan".

Makes sense, will do, thanks!

>
> Alan Stern
>
