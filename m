Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2998BAF8
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 15:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbfHMN7v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 09:59:51 -0400
Received: from mail-pl1-f171.google.com ([209.85.214.171]:42306 "EHLO
        mail-pl1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbfHMN7u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 09:59:50 -0400
Received: by mail-pl1-f171.google.com with SMTP id ay6so49380114plb.9
        for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2019 06:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ftBFYEynUrG71VYjZU1HexLV5i8GQkTYaQFk1n/5Tno=;
        b=mJDQrkSUMldAyUvXs55XlGqmDLCH0aQpx7ChM9DX7T0b4BiZ6SrfNoA+Lx4nAfZ5ig
         Om614mrZQMK4EtryDxkjvS+etMcGQVgnqSJRY9Tl1JVksKV1jAZ2ruA+Q9P2KrSClOsf
         tOitY9VIpO4hVU9KLbd87AVOTw7gU76RSNTcfT+HGxFannGCeW4/7HD9oXkg9abMxPBp
         9+82LRdnnlyPHo4sGk1FiUjvxTLFRX5cI+99QAr5gMehrDjNzZCz9wrechG4MmXVGIrm
         EcbufeJ4F+WFBdiB6Sob6yXdlp4c8KnPZGeQNY3qpUHzCZcUo7NXAILbmistl2UHjXtB
         UfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ftBFYEynUrG71VYjZU1HexLV5i8GQkTYaQFk1n/5Tno=;
        b=FFDEyOInvE31xJuaMhaxWLDgLlVdl5LgdUYtqnIe8zPt7B7fWubtb1elgvQ10Kr6jP
         KEOmm3u10wKqFN6XoqO5ypFDqQ4toXhn+0ln8aN4TwQHyjyjFXl0JYrILACE5bf34ljx
         MRV+X6XJ2BVzgyxL1/iDTBTwf7kFrHcytgnvMFPZoY4myf65Hu4DnBaXBtnNrZngYjuw
         djcR2msPokEn/mA8kO1MQcjXoBbtj9sW588PyXCdCFFT/B42hI2hiZz2XeLHUFeC3WLr
         6qCu5Y46WgKAh1GZQXVXOOkHN6vB+rPClh2EYRmYUS2Hq3yUS44nzSjnrWicMZrOFC3J
         cuaA==
X-Gm-Message-State: APjAAAVsqa7uJqGkfYMbW3k8XyCrN1jTYBrmZgur/hTaINCUQSMtUWBQ
        CiWtQP3kvlUX0M4SnL/c/uuWER2NN0qw2Qb6gEh3/Q==
X-Google-Smtp-Source: APXvYqxacBUqIGtFxch6ifNtADcD9dOQvnPPX60v7ti4FSuS2LNlScGOQeLdEmsyCKT842NHY+4T1jFzR0DdpSu6bV4=
X-Received: by 2002:a17:902:ab96:: with SMTP id f22mr31893761plr.147.1565704789671;
 Tue, 13 Aug 2019 06:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908011359580.1305-100000@iolanthe.rowland.org>
 <1565095011.8136.20.camel@suse.com> <CAAeHK+wyvJbi08ruuOn1qF0O1Jubz_BhZz5wXdNg4Vy5XeyQmw@mail.gmail.com>
 <1565185131.15973.1.camel@suse.com> <CAAeHK+yv-oy_GqMYch7WoVXKOkzpWUmrY9mVY0_FU_0FXjS4nA@mail.gmail.com>
 <CAAeHK+zDVmxgjkZ6dR-sk1=99-Aj=Z4wwxaRCaOXeuYYG3-bUw@mail.gmail.com>
In-Reply-To: <CAAeHK+zDVmxgjkZ6dR-sk1=99-Aj=Z4wwxaRCaOXeuYYG3-bUw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 15:59:38 +0200
Message-ID: <CAAeHK+zsA=O0bgSHij5Opx-RhknnQEhj+2VoCCjLcVRc5Q-=Zg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
To:     syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 7, 2019 at 3:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Wed, Aug 7, 2019 at 3:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
> >
> > On Wed, Aug 7, 2019 at 3:38 PM Oliver Neukum <oneukum@suse.com> wrote:
> > >
> > > Am Dienstag, den 06.08.2019, 14:50 +0200 schrieb Andrey Konovalov:
> > > > On Tue, Aug 6, 2019 at 2:36 PM Oliver Neukum <oneukum@suse.com> wrote:
> > > > >
> > > > > Am Donnerstag, den 01.08.2019, 14:47 -0400 schrieb Alan Stern:
> > > > > >
> > > > > > I think this must be caused by an unbalanced refcount.  That is,
> > > > > > something must drop one more reference to the device than it takes.
> > > > > > That would explain why the invalid access occurs inside a single
> > > > > > bus_remove_device() call, between the klist_del() and
> > > > > > device_release_driver().
> > > > > >
> > > > > > The kernel log indicates that the device was probed by rndis_wlan,
> > > > > > rndis_host, and cdc_acm, all of which got errors because of the
> > > > > > device's bogus descriptors.  Probably one of them is messing up the
> > > > > > refcount.
> > > > >
> > > > > Hi,
> > > > >
> > > > > you made me look at cdc-acm. I suspect
> > > > >
> > > > > cae2bc768d176bfbdad7035bbcc3cdc973eb7984 ("usb: cdc-acm: Decrement tty port's refcount if probe() fail")
> > > > >
> > > > > is buggy decrementing the refcount on the interface in destroy()
> > > > > even before the refcount is increased.
> > > > >
> > > > > Unfortunately I cannot tell from the bug report how many and which
> > > > > interfaces the emulated test device has. Hence it is unclear to me,
> > > > > when exactly probe() would fail cdc-acm.
> > > > >
> > > > > If you agree. I am attaching a putative fix.
> > > >
> > > > Let's see if it fixes the issue.
> > > >
> > > > #syz fix: https://github.com/google/kasan.git 6a3599ce
> > >
> > > Hi,
> > >
> > > did this ever produce a result? I saw none.
> >
> > Hm, that's weird, maybe that's caused by putting the bot into CC. Let
> > me try that again.
> >
> > #syz fix: https://github.com/google/kasan.git 6a3599ce

Let's fix the wrong title displayed on dashboard:

#syz fix: usb: cdc-acm: make sure a refcount is taken early enough

>
> Oh, wait, it should be syz test =)
>
> #syz test: https://github.com/google/kasan.git 6a3599ce
>
> >
> > >
> > >         Regards
> > >                 Oliver
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/1565185131.15973.1.camel%40suse.com.
