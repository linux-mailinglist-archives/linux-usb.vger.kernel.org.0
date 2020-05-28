Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D981E6BB3
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 21:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406864AbgE1Tvs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 15:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406760AbgE1Tvr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 15:51:47 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D5BC08C5C6
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 12:51:47 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d10so90283pgn.4
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 12:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2gJaIteDpQ+rkb5Z34QqhE6jecO2he1zR4oiZriJS4I=;
        b=vXd1KWfxJVCku/Rn1z62m5Bo8CpgfKh05P3g5256Jd/1wwJXXlW6hX63SMLErMxF83
         FTo9AvSA7dygum1Kcv1xKr3FQM+zCJofFGsqFeAYxJKS0wV6yxWpUGVfiFnyRuBHmSWY
         B5mJPxE+HXigsdyDy7oKt3JPB3uX3GAiNsBCv+h4X+9xxYAY2TUMhb7NQZr/VzUvjDw7
         HA9lb6GE3Z0ZGSuTAG4WtQebhFLu5LV3exvswVMKtUB4Pt6S50vzGtkk4D0bAaK/o+Mj
         71Zn8DUs6K+oR+kAu6GyM4SK4y878wQGggGkrIMxkJ9eNWo12w9ixBJZizcyQMaaRW1B
         w5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2gJaIteDpQ+rkb5Z34QqhE6jecO2he1zR4oiZriJS4I=;
        b=caR9tvy2qW8yyi9fDV3qOMT5uHShE79LJ9zuhoOTi+ywkm/lIaE5AAHFUwAbDlI8RN
         ftkr+xm1ZNadA6Uulp7CUSK8ois+wZFjrMsmGK3bejBCHZXHv//6VClq5+TY1v7SQgfG
         tsvhNKI8bSQP4mi9sfSPuV5eugl0vqX2VFT7EXFL+EQfmcASzsa+lTt/tPE6k0jQ4TsN
         AG4bhLLkQntTFRbM6XWDl7huwFiq3R1Za0PaMc28UK5JbuW/JbLjkd7hQerfxGonjgf2
         YumaQpWwgfAO/DXs5pomCDZW8FHFspGrsNI40Cx6FON1ibie6iHRkkNdb+ImPFrJEw2F
         Zudw==
X-Gm-Message-State: AOAM530rCg+0Xp2YZgsz4sNRRrwFwGzivcG6vd8u2XswjZOpu610p6D3
        O+ycOz8HXGqj3t+BEYPDkH6PIIXuamWhqLMLoJ7ReA==
X-Google-Smtp-Source: ABdhPJwTnOImxmZrCT6F6msWETXliO22L+krHnY2ZCYOV7hNAiksF/4XeX86QCLJw816nXUgxuRMzdmLUy3OvUWRPa4=
X-Received: by 2002:a63:724a:: with SMTP id c10mr4561704pgn.130.1590695506698;
 Thu, 28 May 2020 12:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <1590090636.6470.12.camel@suse.com> <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
 <1590134662.19681.12.camel@suse.com> <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com> <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com> <20200528194057.GA21709@rowland.harvard.edu>
In-Reply-To: <20200528194057.GA21709@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 28 May 2020 21:51:35 +0200
Message-ID: <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE bit.
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
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

On Thu, May 28, 2020 at 9:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, May 28, 2020 at 09:03:43PM +0200, Andrey Konovalov wrote:
>
> > Ah, so the problem is that when a process exits, it tries to close wdm
> > fd first, which ends up calling wdm_flush(), which can't finish
> > because the USB requests are not terminated before raw-gadget fd is
> > closed, which is supposed to happen after wdm fd is closed. Is this
> > correct? I wonder what will happen if a real device stays connected
> > and ignores wdm requests.
> >
> > I don't understand though, how using wait_event_interruptible() will
> > shadow anything here.
> >
> > Alan, Greg, is this acceptable behavior for a USB driver?
>
> I don't understand what the problem is.  Can you explain in more general
> terms -- nothing specific to wdm or anything like that -- what you are
> concerned about?  Is this something that could happen to any gadget
> driver?  Or any USB class device driver?  Or does it only affect
> usespace components of raw-gadget drivers?

So, AFAIU, we have a driver whose flush() callback blocks on
wait_event(), which can only terminate when either 1) the driver
receives a particular USB response from the device or 2) the device
disconnects. For 1) the emulated device doesn't provide required
responses. For 2) the problem is that the emulated via raw-gadget
device disconnects when the process is killed (and raw-gadget fd is
closed). But that process is the same process that is currently stuck
on wait_event() in the flush callback(), and therefore unkillable.

This can generally happen with any driver that goes into
uninterruptible sleep within one of its code paths reachable from
userspace that can only be unblocked by a particular behavior from the
USB device. But I haven't seen any such drivers so far, wdm is the
first.
