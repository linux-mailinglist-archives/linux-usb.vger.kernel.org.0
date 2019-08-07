Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A51A84DD0
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 15:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388518AbfHGNo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 09:44:56 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:39844 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388311AbfHGNoz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 09:44:55 -0400
Received: by mail-pl1-f178.google.com with SMTP id b7so40959945pls.6
        for <linux-usb@vger.kernel.org>; Wed, 07 Aug 2019 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yQlvUqDQSwtjqRHZDerAho62VR8VLBGxeeMFjPkaYDI=;
        b=RImjVD163mr6RcC+8MieyiTg920KcYSztgLE6WaTLvkei/6EO9EGgiR1VPzF70x1P9
         iyQVbEL8oPyalAbDtXfOtOdNKblWiGZ8RhW3bpdPz4oB2dEKHnGmHtyKDlGWndczp2Bm
         ta1r4hkCebP8MqvMLaUBT9DY2lW/GTfcZgtlVYYHeh5jykdoxSOhCgVGGvwILEDe92iy
         tRB+bbKKEfyFoM4YqVe2uVwL9DulQTMNPy5knRO0Wf+QdpA52lUA3iuPJbmhFAEDUjZE
         75FiTv9cZWiWimaZXTZX+dOUr5P9w5BncaChXu1iM/BHJNZtBeGOZ4nVEglnAcn0DCU8
         lVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yQlvUqDQSwtjqRHZDerAho62VR8VLBGxeeMFjPkaYDI=;
        b=ddW+E/p5J8L1I2tXbROKqUHeK+tAMdeZ3PqUIPvudoQtZ7tGxkdH1oz5ccU0eIDGqK
         ABHxhh5Hxv6RBIgmoO9R0SfH7Ce/07rCS9uvlpspVukT4p/kGwAWOCL9SkCYvBBZuZ6F
         i/oAwTCYWoiyctwUz4K+4BhZtVto9IHoKSStzMpzeKZoB+6FYBzpJs4QXLPDKqLnaVv9
         T+4/F8gx/ZFHIIaJzvHSftkIBg7H9iHjta4m+1rlBnTLeWPEUTu3HHEmKG5soHBvYPfL
         IRp6Ob5T7gT6j0w5pBz95qgK+WTaY7CCp+B1ZHsXri0wVrePXJwANFmQ+r77OOIPcmPz
         ENpQ==
X-Gm-Message-State: APjAAAWV03mTroQ5oa8mqijGS78kX5+s9aFPYSXpv1FOQly+sPwJWTyI
        JI7FjCR9D/3oewAIdppUVK3zssHC45ySjxi7E2f8Xg==
X-Google-Smtp-Source: APXvYqzuy6tii+uk6HXkJ1NE7wNidHx1hIA/47Geln//t9le5diDvKndWX8j1M15X7TTph9sxjV9DLH1wPocrrtw3mI=
X-Received: by 2002:a17:902:6a87:: with SMTP id n7mr8105236plk.336.1565185494893;
 Wed, 07 Aug 2019 06:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908011359580.1305-100000@iolanthe.rowland.org>
 <1565095011.8136.20.camel@suse.com> <CAAeHK+wyvJbi08ruuOn1qF0O1Jubz_BhZz5wXdNg4Vy5XeyQmw@mail.gmail.com>
 <1565185131.15973.1.camel@suse.com> <CAAeHK+yv-oy_GqMYch7WoVXKOkzpWUmrY9mVY0_FU_0FXjS4nA@mail.gmail.com>
In-Reply-To: <CAAeHK+yv-oy_GqMYch7WoVXKOkzpWUmrY9mVY0_FU_0FXjS4nA@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 7 Aug 2019 15:44:43 +0200
Message-ID: <CAAeHK+zDVmxgjkZ6dR-sk1=99-Aj=Z4wwxaRCaOXeuYYG3-bUw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
To:     Oliver Neukum <oneukum@suse.com>,
        syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 7, 2019 at 3:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Wed, Aug 7, 2019 at 3:38 PM Oliver Neukum <oneukum@suse.com> wrote:
> >
> > Am Dienstag, den 06.08.2019, 14:50 +0200 schrieb Andrey Konovalov:
> > > On Tue, Aug 6, 2019 at 2:36 PM Oliver Neukum <oneukum@suse.com> wrote:
> > > >
> > > > Am Donnerstag, den 01.08.2019, 14:47 -0400 schrieb Alan Stern:
> > > > >
> > > > > I think this must be caused by an unbalanced refcount.  That is,
> > > > > something must drop one more reference to the device than it takes.
> > > > > That would explain why the invalid access occurs inside a single
> > > > > bus_remove_device() call, between the klist_del() and
> > > > > device_release_driver().
> > > > >
> > > > > The kernel log indicates that the device was probed by rndis_wlan,
> > > > > rndis_host, and cdc_acm, all of which got errors because of the
> > > > > device's bogus descriptors.  Probably one of them is messing up the
> > > > > refcount.
> > > >
> > > > Hi,
> > > >
> > > > you made me look at cdc-acm. I suspect
> > > >
> > > > cae2bc768d176bfbdad7035bbcc3cdc973eb7984 ("usb: cdc-acm: Decrement tty port's refcount if probe() fail")
> > > >
> > > > is buggy decrementing the refcount on the interface in destroy()
> > > > even before the refcount is increased.
> > > >
> > > > Unfortunately I cannot tell from the bug report how many and which
> > > > interfaces the emulated test device has. Hence it is unclear to me,
> > > > when exactly probe() would fail cdc-acm.
> > > >
> > > > If you agree. I am attaching a putative fix.
> > >
> > > Let's see if it fixes the issue.
> > >
> > > #syz fix: https://github.com/google/kasan.git 6a3599ce
> >
> > Hi,
> >
> > did this ever produce a result? I saw none.
>
> Hm, that's weird, maybe that's caused by putting the bot into CC. Let
> me try that again.
>
> #syz fix: https://github.com/google/kasan.git 6a3599ce

Oh, wait, it should be syz test =)

#syz test: https://github.com/google/kasan.git 6a3599ce

>
> >
> >         Regards
> >                 Oliver
> >
> > --
> > You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/1565185131.15973.1.camel%40suse.com.
