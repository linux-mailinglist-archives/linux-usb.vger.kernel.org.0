Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E36157283
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 11:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgBJKGY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 05:06:24 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43930 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgBJKGX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 05:06:23 -0500
Received: by mail-qt1-f193.google.com with SMTP id d18so4656879qtj.10
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 02:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PCyW7d3yD8rdQcJuU4iNOWP0ir+kes1g3GxX1tS+nIM=;
        b=br6ln5d33r3VljnRfT08wgJeVi4x+Moeg3pPcWdn6VhIfJ5VGKswjjudyehvj11E3g
         Nd1Z+RN2yeAZ7sdctTk0cMOB5bxmZxB2kHLlI1ogGQr63AUXTvSVqzAql/3qb5/7mfJt
         C5v7bhzSdL9kuhzYXkC3ayu5aLVGxBTAexRr8l0vQE2ha/+C377tGAS/rtdpYA7BeLcD
         Ikys6TyqloxXVqI1+PT6aRpk8mKq4dm4/B0UxkJaadVPSZ0uu56td7sd3PfMrYjDrLdK
         krsun01rRfoU4LjFH+W3zVOvurcVotDrAVM7KmoWn3oK7m3nE9rvsgi/31fQuTIHVBOD
         xhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PCyW7d3yD8rdQcJuU4iNOWP0ir+kes1g3GxX1tS+nIM=;
        b=Kk+o2NJxudEHEq3NtS9xS6RNMbxgJ1SuSPAMxsBsejwRwtRbFP0X7WPmUkGUImyNww
         L0THinTXQhzuqCzDyLLd2u+bwONSoHdpMaufgzkGLwXSWTkvjXGKPoHUwPCBIXGp8xsW
         qh1gf+gk5S+9pV1thJAi5BDztXV0OQdInTzSuvDslERz9Dih7d0TZuXmm3YJUrwAjzLh
         dggLKINzRmFjIf20/543ESIo13PhZnXR/EU7DT2UztZUY6XnLbr4yG3e5hfwjsURUYl1
         u7tKijtePUZa3KHjsPVatxeTIoVnUai2KnnajoDn3lO2rU5WEW/1LLrG9A3IRZ9KcrGc
         3F2Q==
X-Gm-Message-State: APjAAAUe6BDYjknX5tnQDjTNKQAY5GSIS4Ee5vOd0Fmrr31U2B4ahO5f
        XaHDh5shz8H34885dZ4Qo5kHNz7OjRJ6+qAHBMKGdQ==
X-Google-Smtp-Source: APXvYqyCuKR36+MLZAaECCPwzAV5etcdOLnuPvi7eN2Otn3eajDnQ2fn0lRMHmEv98jrp6hBMmKL/fQmKpaVXTeHhME=
X-Received: by 2002:ac8:71d7:: with SMTP id i23mr9400499qtp.50.1581329182468;
 Mon, 10 Feb 2020 02:06:22 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003313f0058fea8435@google.com> <8736ek9qir.fsf@miraculix.mork.no>
 <1574159504.28617.5.camel@suse.de> <87pnho85h7.fsf@miraculix.mork.no> <CACT4Y+YgLm2m0JG6qKKn9OpyXT9kKEPeyLSVGSfLbUukoCnB+g@mail.gmail.com>
In-Reply-To: <CACT4Y+YgLm2m0JG6qKKn9OpyXT9kKEPeyLSVGSfLbUukoCnB+g@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 10 Feb 2020 11:06:11 +0100
Message-ID: <CACT4Y+ZjiCDgtGVMow3WNzjuqBLaxy_KB4cM10wbfUnDdjBYfQ@mail.gmail.com>
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

On Sat, Nov 23, 2019 at 7:52 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Nov 19, 2019 at 12:34 PM Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
> >
> > Oliver Neukum <oneukum@suse.de> writes:
> > > Am Dienstag, den 19.11.2019, 10:14 +0100 schrieb Bj=C3=B8rn Mork:
> > >
> > >> Anyway, I believe this is not a bug.
> > >>
> > >> wdm_flush will wait forever for the IN_USE flag to be cleared or the
> > >
> > > Damn. Too obvious. So you think we simply have pending output that do=
es
> > > just not complete?
> >
> > I do miss a lot of stuff so I might be wrong, but I can't see any other
> > way this can happen.  The out_callback will unconditionally clear the
> > IN_USE flag and wake up the wait_queue.
> >
> > >> DISCONNECTING flag to be set. The only way you can avoid this is by
> > >> creating a device that works normally up to a point and then complet=
ely
> > >> ignores all messages,
> > >
> > > Devices may crash. I don't think we can ignore that case.
> >
> > Sure, but I've never seen that happen without the device falling off th=
e
> > bus.  Which is a disconnect.
> >
> > But I am all for handling this *if* someone reproduces it with a real
> > device.  I just don't think it's worth the effort if it's only a
> > theoretical problem.
> >
> > >>  but without resetting or disconnecting. It is
> > >> obviously possible to create such a device. But I think the current
> > >> error handling is more than sufficient, unless you show me some way =
to
> > >> abuse this or reproduce the issue with a real device.
> > >
> > > Malicious devices are real. Potentially at least.
> > > But you are right, we need not bend over to handle them well, but we
> > > ought to be able to handle them.
> >
> > Sure, we need to handle malicious devices.  But only if they can be use=
d
> > for real harm.
> >
> > This warning requires physical acceess and is only slightly annoying.
> > Like a USB device making loud farting sounds.  You'd just disconnect th=
e
> > device.  No need for Linux to detect the sound and handle it
> > automatically, I think.
>
> Hi Bj=C3=B8rn,
>
> Besides the production use you are referring to, there are 2 cases we
> should take into account as well:
> 1. Testing.
> Any kernel testing system needs a binary criteria for detecting kernel
> bugs. It seems right to detect unkillable hung tasks as kernel bugs.
> Which means that we need to resolve this in some way regardless of the
> production scenario.
> 2. Reliable killing of processes.
> It's a very important property that an admin or script can reliably
> kill whatever process/container they need to kill for whatever reason.
> This case results in an unkillable process, which means scripts will
> fail, automated systems will misbehave, admins will waste time (if
> they are qualified to resolve this at all).

On Mon, Feb 10, 2020 at 11:00 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Hello.
>
> Will you check whether patch testing is working? I tried
>
>   #syz test: https://github.com/google/kasan.git usb-fuzzer
>
> but the reproducer did not trigger crash for both "with a patch"
> and "without a patch", despite dashboard is still adding crashes.
> I suspect something is wrong. Is it possible that reproducer is
> trying to test a bug which was already fixed but a different new
> bug is still reported as the same bug?
