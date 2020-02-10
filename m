Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A818D157291
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 11:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgBJKJm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 05:09:42 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38046 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgBJKJm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 05:09:42 -0500
Received: by mail-qk1-f193.google.com with SMTP id z19so2867144qkj.5
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 02:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PXT4A14zipK3Cgte0ZS99wrAYDgnIKCZLFZ4fFQsg4Y=;
        b=o/lSSmTA2AtHywO9qZ9nrQtdrnhlDZ7z87lEC8/1LnVo8g6dQaSWznEZ10SYbimtQS
         fkCZzOmknltG/EhlpFk1ZiwrmSdOZXJAF4Ekz2EofuUNQlU48uVSQXnYEsN9YQyBnEpG
         sKW1xLaMW/MN6386m0w3biG7qJB4VwT1P2pUWqRCu+Dm7S+LhewLtylconJzHxpzYwUs
         1RTIn92EWksb8wtzn/pG/OUHOrULBLyeHLgV+yMVA1vaAkR5mjrG+udUdyAd5sWCKuYJ
         3+9Cq1vzxmsfVk9tHvhrSRVQDpFFdoPkIj3bKg5i07iEQrXJYGCPULDkTavkLB5rXFc8
         9cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PXT4A14zipK3Cgte0ZS99wrAYDgnIKCZLFZ4fFQsg4Y=;
        b=CvHMV5kLL7+fn4ZN/MWbnCFHuNT/OZ79F88oNh5TO1sou/3CSdXI0BkV2V+UKJ8mCe
         SZqcfP6BXhQsst3zHnwxlUTkysCMj0SStaGtihS2xKV2qre6iwWx4ednH3ZhrqYOhlFK
         NMat65Gy5ZspHcGHyc7w5IlwPjtzMn+YIrXTwg6k6RewxhGBEqfe+4m7X3C76JSYo5wi
         PqpNNN3izr8nbUanyCfzqFAgZn9R/lL85NhGvCg35xnI9yFeSdPxM1bck0kS4TJB2STy
         JQmIzA3ssEU1LZCiM/dURasUnKMun9DUX+D3t82jN82HkXEMtnMCdwv4BPI7ko8WJWy9
         OV0g==
X-Gm-Message-State: APjAAAWvr5cJTgJImtUkD8coLQ4a6b1UO6sUVY175R1w8l84JZpAE0Xl
        EZIoIQNnPpwcSn6A8fjZYoQBe8F5AROSngEjBkjaJQ==
X-Google-Smtp-Source: APXvYqyNTWopdWeQSUXhZIp5N7y8U5XPEp456oFoVTw2FsGjqhPpopelUiBThQYWDfVVh+IoKv5VOun9iDiVEcPDXSY=
X-Received: by 2002:a37:9d95:: with SMTP id g143mr569163qke.256.1581329380706;
 Mon, 10 Feb 2020 02:09:40 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003313f0058fea8435@google.com> <8736ek9qir.fsf@miraculix.mork.no>
 <1574159504.28617.5.camel@suse.de> <87pnho85h7.fsf@miraculix.mork.no>
 <CACT4Y+YgLm2m0JG6qKKn9OpyXT9kKEPeyLSVGSfLbUukoCnB+g@mail.gmail.com> <CACT4Y+ZjiCDgtGVMow3WNzjuqBLaxy_KB4cM10wbfUnDdjBYfQ@mail.gmail.com>
In-Reply-To: <CACT4Y+ZjiCDgtGVMow3WNzjuqBLaxy_KB4cM10wbfUnDdjBYfQ@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 10 Feb 2020 11:09:29 +0100
Message-ID: <CACT4Y+ZWDMkOmnXpBXFhU8XcHA_-ZcHdZpfrXcCWHRzcbQ39Gg@mail.gmail.com>
Subject: Re: INFO: task hung in wdm_flush
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Oliver Neukum <oneukum@suse.de>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Colin King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        yuehaibing@huawei.com, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 10, 2020 at 11:06 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > Oliver Neukum <oneukum@suse.de> writes:
> > > > Am Dienstag, den 19.11.2019, 10:14 +0100 schrieb Bj=C3=B8rn Mork:
> > > >
> > > >> Anyway, I believe this is not a bug.
> > > >>
> > > >> wdm_flush will wait forever for the IN_USE flag to be cleared or t=
he
> > > >
> > > > Damn. Too obvious. So you think we simply have pending output that =
does
> > > > just not complete?
> > >
> > > I do miss a lot of stuff so I might be wrong, but I can't see any oth=
er
> > > way this can happen.  The out_callback will unconditionally clear the
> > > IN_USE flag and wake up the wait_queue.
> > >
> > > >> DISCONNECTING flag to be set. The only way you can avoid this is b=
y
> > > >> creating a device that works normally up to a point and then compl=
etely
> > > >> ignores all messages,
> > > >
> > > > Devices may crash. I don't think we can ignore that case.
> > >
> > > Sure, but I've never seen that happen without the device falling off =
the
> > > bus.  Which is a disconnect.
> > >
> > > But I am all for handling this *if* someone reproduces it with a real
> > > device.  I just don't think it's worth the effort if it's only a
> > > theoretical problem.
> > >
> > > >>  but without resetting or disconnecting. It is
> > > >> obviously possible to create such a device. But I think the curren=
t
> > > >> error handling is more than sufficient, unless you show me some wa=
y to
> > > >> abuse this or reproduce the issue with a real device.
> > > >
> > > > Malicious devices are real. Potentially at least.
> > > > But you are right, we need not bend over to handle them well, but w=
e
> > > > ought to be able to handle them.
> > >
> > > Sure, we need to handle malicious devices.  But only if they can be u=
sed
> > > for real harm.
> > >
> > > This warning requires physical acceess and is only slightly annoying.
> > > Like a USB device making loud farting sounds.  You'd just disconnect =
the
> > > device.  No need for Linux to detect the sound and handle it
> > > automatically, I think.
> >
> > Hi Bj=C3=B8rn,
> >
> > Besides the production use you are referring to, there are 2 cases we
> > should take into account as well:
> > 1. Testing.
> > Any kernel testing system needs a binary criteria for detecting kernel
> > bugs. It seems right to detect unkillable hung tasks as kernel bugs.
> > Which means that we need to resolve this in some way regardless of the
> > production scenario.
> > 2. Reliable killing of processes.
> > It's a very important property that an admin or script can reliably
> > kill whatever process/container they need to kill for whatever reason.
> > This case results in an unkillable process, which means scripts will
> > fail, automated systems will misbehave, admins will waste time (if
> > they are qualified to resolve this at all).
>
> On Mon, Feb 10, 2020 at 11:00 AM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >
> > Hello.
> >
> > Will you check whether patch testing is working? I tried
> >
> >   #syz test: https://github.com/google/kasan.git usb-fuzzer
> >
> > but the reproducer did not trigger crash for both "with a patch"
> > and "without a patch", despite dashboard is still adding crashes.
> > I suspect something is wrong. Is it possible that reproducer is
> > trying to test a bug which was already fixed but a different new
> > bug is still reported as the same bug?

Hi Tetsuo,

The simplest and fastest you may try is to request testing on another,
simpler bug. I have not seen any other signals suggesting that patch
testing in general is somehow broken.

You may also try on the exact commit the bug was reported, because
usb-fuzzer is tracking branch, things may change there.

If the old bug was fixed, but syzbot is not aware, new bugs being
piled into the same bucket is exactly what will happen. So that's
definitely possible.
