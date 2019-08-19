Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF4EB923B1
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 14:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfHSMnS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 08:43:18 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:38837 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSMnS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 08:43:18 -0400
Received: by mail-pg1-f177.google.com with SMTP id e11so1166656pga.5
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 05:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TfBJc6KSGUsNW1IwLrAt1i5po2PaQQikuRp9BpzkojA=;
        b=XL5WSGc311vFvSWhXihX6varHMEoX4tuNbAVasAiUa+UfyNW140XUtyDSMV4lVRsW/
         dY8mBbk8ksPhWYA1LO7RWmLVg/3BsuhdVdIfeudt3ZdpC09krlohZJjainM2ozQyjMo5
         gbvOcknS8mABpEDzH+a5mBdbJVHDbItZ5c95ZdevFU/w5SnYiBYuzvXkQ3M/x1sh2RWZ
         Se5qwhfHFqZGzHsNTHSZgXwPHFIqEidQZ63RwoxGWgrtwqwrRWlwpG+ExFNCe6+I3Cz2
         8ZgNBn+ws+6MzGsugnUokz/xoZtuGgPAi0R9Lgy7J6eIKK118YlIiAQbUc6RnZIOScYZ
         WkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TfBJc6KSGUsNW1IwLrAt1i5po2PaQQikuRp9BpzkojA=;
        b=JUNNH9pYC31tRr3wGla+z770VUAhV+w9MUE6G4378UT7wQXru1XGePmcWOLQ4aj1B7
         55PzXbfTqB/2DXaALeFiNJp3HI1a9Q0xELCnck2rB9682ZiqGIA+ProQyTvdO1FkRalx
         nk0TKqko2zR/CZAtuJ9A6BB4QdKOWXVd10YJQyR7OJTNmhp3tyBsKlOKv6EkjL2bM3r3
         CYa3KlIC49gngshclfsT+L8los2kches9WUq0XubvINlEKasA/Ep/vbDx8ulpMXo9L6o
         vxhTLzplEl3vEmHror7UKYmygJREM3Y9lpbXSCzMAnOCiVoGdBcNQHOHQZxN5GAwA8YE
         SBVQ==
X-Gm-Message-State: APjAAAXchtBUOZrakhi26Kf5zcVwL6fUL+MVNoaW9fw4Xy7/jsThQboL
        s0UHmOdvitTyxZxL3sGczNTdGLJ0rjRrc1b7ad2+eA==
X-Google-Smtp-Source: APXvYqwvWYk7V0I4M6Ci8+sWDVOMck2i22fvO6Loo0x7v7B2IcsM1soWCvQLdaqVanSyg8wIroLmE5bKfsZ8dyfdxO8=
X-Received: by 2002:aa7:9e9a:: with SMTP id p26mr24368952pfq.25.1566218596845;
 Mon, 19 Aug 2019 05:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a59094059013dd63@google.com> <1565875886.5780.7.camel@suse.com>
 <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com> <1566218263.5663.22.camel@suse.com>
In-Reply-To: <1566218263.5663.22.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 14:43:05 +0200
Message-ID: <CAAeHK+xX3vk_JoJ=2tHF__LECxNmPXuPMkxWz6u+K6L-MdN=9g@mail.gmail.com>
Subject: Re: divide error in usbtmc_generic_read
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        steve_bayless@keysight.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com,
        syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 19, 2019 at 2:37 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 19.08.2019, 14:17 +0200 schrieb Andrey Konovalov:
> > On Thu, Aug 15, 2019 at 3:31 PM Oliver Neukum <oneukum@suse.com> wrote:
> > >
> > > Am Mittwoch, den 14.08.2019, 06:38 -0700 schrieb syzbot:
> > > > syzbot has tested the proposed patch but the reproducer still triggered
> > > > crash:
> > > > KASAN: use-after-free Read in usbtmc_disconnect
> > >
> > > I am afraid that is a difficiency in KASAN that should be fixed.
> > > Is the class of the error compared if I leave in more of the
> > > original bug report? Actually the ID is still there, so it really
> > > should return an inconclusive in these cases.
> >
> > I don't get this, what kind of deficiency do you mean?
>
> The original error was a divide by zero. The first fix fixed that
> but still another error showed up. If I propose a fix there are
> other possibilities besides it working.
>
> I could have no effect on the original bug or my fix breaks
> something else and KASAN is making no difference between
> those cases.

I think you mean syzbot here and not KASAN. Do I understand correctly,
that you're saying that the original report was divide-by-zero, but
when you requested to test the patch the reproducer triggered a
use-after-free, and syzbot didn't treat the patch you provided as a
correct fix? In this case this is working as intended, as a bug
(especially some race) can manifest in different ways, so the kernel
might crash with a different stack trace.
