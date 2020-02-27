Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4D8172276
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 16:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgB0Poy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 10:44:54 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42229 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727592AbgB0Poy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 10:44:54 -0500
Received: by mail-pf1-f196.google.com with SMTP id 15so5829pfo.9
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P0GQUcx7HmmpSamBc03kK+HfbtO6GCBFhRm2/Ltpz3o=;
        b=awYccJOYe/nKqPHYEdR/Z1vvmgTeIaNQ79AwkS+qmUanO7zNSUoG5ewFMViLs1ZVCO
         tUSVnaU29rIfc8MwCUF2wN+qZwio/rDuM3erfdMiHZ2owajdE28PcrbRi6KOcZkCN0kz
         kOMUYiveAwn8aflOoclqKdc0NHaBa/nZWX1opOBXVZm/MvdioyWA5/qKcGrb4LQQuAa9
         M9GsZzhlajAhzNOR5X89F1W6Jo3vmx1+ltkhUjwFW00dlaIImoIczSdUMjD+MbuTYXuy
         2fDtxHLBOUzzciTPorKOsAyZ0y2veZwbCITTqnL91zNpQs96dhCs5a/rIfTzjRg4vISE
         vgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P0GQUcx7HmmpSamBc03kK+HfbtO6GCBFhRm2/Ltpz3o=;
        b=pdoL/Ml08wIrkD1VRZNU47HzTU0WztjlwxTgO+4+21Qe0NLGpJ2AkD2pnBM64ycMkH
         ivV9OTSn7lqF8pGy5LGORAJpcRQCOhiG4ziX+Z1qhtpqQfCDjspeBtCYwZ5K6jVS1BFQ
         RY1M6ZAdTbgoI6oKynvfGrsKEPJY0fPVrWJrtYzcsTL5PhK6EzJHdjbHtEy94eYozTKy
         hIqWLTiy489AkK2WGjLUUM09VZDTlP5VbBmMRtZ91mILba7XMYK6NLIIZ5YG4pO3gtHS
         1zwfj3VK4TD3mEKYUgBldjjM1takKenSg0ZJgq/jWzbwSMzzgoQPtprkLFbV9+Zu/9FY
         If+A==
X-Gm-Message-State: APjAAAU+YYJtaVnifr5nmGa6mX724BnTgUSFxrunW94wdni1R6RLGW1s
        H8OdrjdlADufGM/8CNJ8aQfkGh0ZcmCkQrilRQU6Uw==
X-Google-Smtp-Source: APXvYqwDl+EtYrX963G/yoja7CkMwn3y35cv/p/HJEJInwXICsTEgLfY6ay3a91oC2F/lKgWco/Sz1cPwi/b5lZas+I=
X-Received: by 2002:aa7:9629:: with SMTP id r9mr4726368pfg.51.1582818293330;
 Thu, 27 Feb 2020 07:44:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582742673.git.andreyknvl@google.com> <20200226174141.d1c938e7962a4fc09060eba9@linux-foundation.org>
In-Reply-To: <20200226174141.d1c938e7962a4fc09060eba9@linux-foundation.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 27 Feb 2020 16:44:42 +0100
Message-ID: <CAAeHK+wKO1_VhtEZptgXyqgPLHT9w47Z+-77QfDD4fKDPRS+Gg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] kcov: collect coverage from usb soft interrupts
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 27, 2020 at 2:41 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 26 Feb 2020 19:48:06 +0100 Andrey Konovalov <andreyknvl@google.com> wrote:
>
> > This patchset extends kcov to allow collecting coverage from soft
> > interrupts and then uses the new functionality to collect coverage from
> > USB code.
> >
> > This has allowed to find at least one new HID bug [1], which was recently
> > fixed by Alan [2].
>
> I might have asked this before, but I don't see this obvious question
> addressed in the changelogs so maybe I didn't...

You've asked this for the previous patchset about collecting coverage
from background threads :)

> Will this only ever be useful for USB?  Or is it anticipated that other
> subsystems will use this?  If the latter, which ones?

Any subsystem that uses softirqs (e.g. timers) can make use of this.
Looking at the recent syzbot reports, an obvious candidate is the
networking subsystem [1, 2, 3 and many more]. I'll add this info into
the cover letter in the next version.

Thanks!

[1] https://syzkaller.appspot.com/bug?extid=522ab502c69badc66ab7
[2] https://syzkaller.appspot.com/bug?extid=57f89d05946c53dbbb31
[3] https://syzkaller.appspot.com/bug?extid=df358e65d9c1b9d3f5f4
