Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88BD8621F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 14:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732595AbfHHMoM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 08:44:12 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36051 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732254AbfHHMoM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 08:44:12 -0400
Received: by mail-ot1-f66.google.com with SMTP id r6so117931128oti.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AqsGEn8rizmWX1sBUGJyfxqTVFx/hWSppDVhCUizhj0=;
        b=kcWgpNxuLsqlIeN+bHKdSpfWQbrD8oiKypyumjK3k5/kzTNxb3AQoURhbCK39Sd6Tc
         P5rMBeJI3GTVUEdTjw2Ifwpj3l/nEom6Jgx4X+YL156jCBD00jAI0I2cKV8c6i+6qb8F
         vNHLcXmorSzI7Dfa7JznfKLTfoeHKpwe8gofHHK4eBqZtBBm8VahkRj+Vh+D34k1eqJ4
         tzNdqSp5Eh5zcOp37YskGxl5BSW6zxhLQk2spv9GWA6zxBMUhk7zN6Cdx0tPNVpwYqwM
         HoFcYMwR+DLfqXHfC+UrFEtIa4lsexeV32EEKVgcaTpQqHC2YOY6sHkyE1s3I9dbiFpR
         PiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqsGEn8rizmWX1sBUGJyfxqTVFx/hWSppDVhCUizhj0=;
        b=F254UILNx82NxQPoKOhA9E67pGgvteUH6B9jlfDnW3qneCWOYZE8wnGLGq0wEMiGY5
         7DsmhdLc1VXxn8pqv0pzff6BJ7A7SzIsnYKXf+3XmzxNnOeY044/R9ue3GjGnR3nX1n/
         dLrvxrKyc1cth6+P0E/mtpyzhZNLzpVw1zvHiF3Yvu8u2NfkdgFEHfX75FesdVQnbjoe
         SM9N5//NYS2HqiX/XnplqF7aOnsZbRNOqdsLMMHDBqIbRa1+F/4vMp/dLCHcOiKat3Ww
         xsbshAy8wIF0wlrt5CKUukVVMRPB8tQdJlYoNvMlh33B2l1YDm04bcGYF1nnF8Ev3JMB
         rsXQ==
X-Gm-Message-State: APjAAAVTXLWX/w2zWc6fDn64co1yo85pZ1NajuAuvwsjkm5J2TOrxUZD
        mtqax11xXpWhd7T3bqKL45RbM757Hzy5wG2OtaRRiA==
X-Google-Smtp-Source: APXvYqz+ugusoV+l//v8/73/4cQcyL006ICoTXboeoL3XHGwudUfJ2JN8AStIr71ZDFwWW7X8uEwNh8LaUB2KOzjzis=
X-Received: by 2002:a5d:80d6:: with SMTP id h22mr15137157ior.231.1565268250720;
 Thu, 08 Aug 2019 05:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f365b6058f8b07ca@google.com> <Pine.LNX.4.44L0.1908071431050.1514-100000@iolanthe.rowland.org>
 <CAAeHK+xh6h=HBEpwPB7g2=a07+zZ9zS5Cuk0Tpo_+70Bf5j9Tw@mail.gmail.com>
In-Reply-To: <CAAeHK+xh6h=HBEpwPB7g2=a07+zZ9zS5Cuk0Tpo_+70Bf5j9Tw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 8 Aug 2019 14:43:57 +0200
Message-ID: <CACT4Y+ZD=YYvLER5jDAvCbw3kBKcNkQJEJN5yFc7O6aLaFORDg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 8, 2019 at 2:28 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Wed, Aug 7, 2019 at 8:31 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Wed, 7 Aug 2019, syzbot wrote:
> >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch and the reproducer did not trigger
> > > crash:
> > >
> > > Reported-and-tested-by:
> > > syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com
> > >
> > > Tested on:
> > >
> > > commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > patch:          https://syzkaller.appspot.com/x/patch.diff?x=132eec8c600000
> > >
> > > Note: testing is done by a robot and is best-effort only.
> >
> > Andrey, is there any way to get the console output from this test?
>
> Dmitry, would it be possible to link console log for successful tests as well?

Yes. Start by filing a feature request at
https://github.com/google/syzkaller/issues
