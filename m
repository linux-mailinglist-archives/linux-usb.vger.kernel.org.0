Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D9A1E69FC
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 21:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406070AbgE1TD5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 15:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405981AbgE1TD4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 15:03:56 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765F5C08C5C6
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 12:03:55 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 23so14030145pfy.8
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 12:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KTG33M7UqE83NNJfFkKoUZvFr/rJ5FN9VU86MCJPdnc=;
        b=sTf8pQSos2uaF96AwQ0GxIXT5kya0+Z5/Jo7LUUgEKtgrxnslrSymm+RrP0QNb5IT2
         piY0hb0Qkh6lZpNo76G66x0vjmpTuqmZxEwVwN4xGRm9T7+yL95YmFxG+0pKIx148AL0
         5SNq+jiSWTrvWlxXQCu//fwdsLfDp3soelyhtmolTVbuTaS4Rqu+Hj7GfMdAk8oWzQEs
         HaE4AGCsjaXVCkBW9X8mbk5sOcpzjdyj9W0MygIdOoOIp7EeIcQcCyfW/IhKv20FynGm
         0k+5GxkHusIvsLfGi5u8qgXET2rPO1w+lhfvv7YgRP5FCJnYJGQhCYY9Fl9PlrQ67bQJ
         /2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KTG33M7UqE83NNJfFkKoUZvFr/rJ5FN9VU86MCJPdnc=;
        b=XNxkW/ewCunVoh/OgqrFAMu0CJ/2cmFtlLEHNeB2XTHKEfFd3p1F1cSeomqRGWAkMe
         VwrTbaIGzEJ3S9Uic0cWT+iyRii6u0QGhRtphdZlLeQ27XohktVrZcINexL/HYz9YNjN
         +S+JezjQGIc7fojrBhAtsNWQBiK7ot0LXr7zjHQQzZVgnrDh1JMSk0x1Dj5fE+KuLuRf
         cicoS0fTk1GIJRTAzLLzystMqYrUJiJheV4+w6wu4Z73P7BWW1PdsuXJaZfGR8NPltz+
         izU3l5m5+RJ4aMkWPWFHsE5hvwl1WUPybOR1H9RyhjpSH8Mgkvf/Y1t/j8irlTU/iEJK
         2wHQ==
X-Gm-Message-State: AOAM530ggBn9h9H4a2RsNgZA4PLcvdUBUCp56kmzOiCtXQIm2Gct064f
        3Gs/v2rkEPErQZnvpUhZWhC6kV2lECz8wmZwrEDL3A==
X-Google-Smtp-Source: ABdhPJwmzre3ODOlmfDBYNDV6NiYbegomRtJLMR3IY7aq9plIKBWJV4q0zRrNm+YQuML9MaIE0awsR2j+zzVNENaf4A=
X-Received: by 2002:a63:dd43:: with SMTP id g3mr4506199pgj.286.1590692634701;
 Thu, 28 May 2020 12:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200521073323.GA2579717@kroah.com> <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
 <1590090636.6470.12.camel@suse.com> <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
 <1590134662.19681.12.camel@suse.com> <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com> <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com> <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
In-Reply-To: <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 28 May 2020 21:03:43 +0200
Message-ID: <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE bit.
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 28, 2020 at 6:03 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/05/29 0:18, Andrey Konovalov wrote:
> >> I might have found what is wrong.
> >>
> >> My understanding is that a process using /dev/raw-gadget is responsible for
> >> reacting to every USB request. I don't know whether /dev/raw-gadget already
> >> provides callback for aborting the in-flight USB requests (in order to resume
> >> wdm_flush()) when /dev/raw-gadget is closed (due to explicit close() syscall or
> >> implicit exit_files() from do_exit() upon SIGKILL). I assume /dev/raw-gadget
> >> already provides such callback in the following paragraphs.
> >
> > raw-gadget should kill all unfishished USB requests when the file is closed.
>
> I see. But
>
> >
> >>
> >> Since the reproducer is opening both /dev/raw-gadget (which is char-10-62) and
> >> /dev/cdc-wdm0 (which is char-180-0), it seems that the kernel is falling into
> >> deadlock condition due to the need to close both files when the reproducer is
> >> killed. My guess is that since that process is stuck at wdm_flush() (due to
> >> explicit close() syscall or implicit exit_files() from do_exit() upon SIGKILL),
> >> that process cannot react to USB requests which are needed for resuming wdm_flush().
> >> Unexpectedly blocking a process which is responsible for reacting to USB requests
> >> will look as if it is a broken hardware.
> >
> > Hm, so wdm_flush() is unable to finish unless an expected USB request
> > is received from the device? This is a bug in the wdm driver then.
>
> this specific bug report is caused by being unable to close /dev/cdc-wdm0
> due to /dev/raw-gadget API usage bug in the userspace process. In other words,
> this bug report should be closed with "#syz invalid" like a bug report at
> https://syzkaller.appspot.com/bug?id=287aa8708bc940d0ca1645223c53dd4c2d203be6
> which unexpectedly did ioctl(FIFREEZE) without corresponding ioctl(FITHAW).
>
> > Should we use wait_event_interruptible() instead of wait_event() in
> > wdm_flush()?
>
> That only shadows this kind of bug reports, by not using TASK_UNINTERRUPTIBLE.
>
> The problem that the userspace process which is responsible for closing
> /dev/raw-gadget gets stuck at wdm_flush() unless interrupted by a signal
> when closing /dev/cdc-wdm0 is remaining. I think that a process should not
> open /dev/raw-gadget and /dev/cdc-wdm0 at the same time.

Ah, so the problem is that when a process exits, it tries to close wdm
fd first, which ends up calling wdm_flush(), which can't finish
because the USB requests are not terminated before raw-gadget fd is
closed, which is supposed to happen after wdm fd is closed. Is this
correct? I wonder what will happen if a real device stays connected
and ignores wdm requests.

I don't understand though, how using wait_event_interruptible() will
shadow anything here.

Alan, Greg, is this acceptable behavior for a USB driver?
