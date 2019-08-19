Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A328A948A7
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 17:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfHSPkv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 11:40:51 -0400
Received: from mail-pf1-f180.google.com ([209.85.210.180]:46625 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfHSPkv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 11:40:51 -0400
Received: by mail-pf1-f180.google.com with SMTP id q139so1368694pfc.13
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JRnvLVgz0tVWK1fEuL6UHqzHZr0onyPvx/owe0XN7Lc=;
        b=kClkyqkUanIBe2cYihTfwUMRuxPrDcaJkb+HKURIbeEWtpTlHpP351abhiboY6kUAy
         IPMHYxKBk+pIhT3bQt9l/H2gp+nBD/RiXAXxqCZlGUMczBzEZTuLQDvLW0PyRN/o8i61
         EhZJ5a0e+RjKzYszANM5MvRsoDVE+/zoySVnmn6CdTsj0KqJS4H014IJs2xmwrmqUUCo
         Ul+LE9eT2lUIPXoeB3jTksXdmI9VMuSHuJc002/AG0Prx4U9IkuQYeBA6Iv2R1j+tad6
         Y0SZ4t8jVw9oPAUJb4j38CoJSsSQXWOE0QaSbR/rViz+3z/cnDveRVzpRj5iG2ioY5KH
         9/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JRnvLVgz0tVWK1fEuL6UHqzHZr0onyPvx/owe0XN7Lc=;
        b=MyPXsdMb+8GlMiiRX7fBkGXhJ8tB5RM7C2XpPRgzOlELjyAIlplWaARvOMHjndemZJ
         alPeKJJfTtWeP2w34+jnDVWqqlaoexj3zkNZvNqDzVUmNiBs4ECLV/YbWO398hhvG0nW
         FQV/9gfAFPJhin4MXVcQL45Tb9Cod98/DFFZfe1/WiLY0w2MidodVry6FGRvKU1mWygI
         FK9qkWx9mt2HtzzEaeM4UfhIJlRUGBnRFHGbRJswRfMYXf0YIeGyNq2xJx2e9cTNL9Ha
         Q4CoPJBFmaBDG8eyhsFLN2dc6ROeO0EFCJsK7wc49r/yKH4hiGNPsM2piMzLHQUWAOcw
         I7vA==
X-Gm-Message-State: APjAAAVq+N6SgOXEU2a8NGrdTnp/P7YgCEblcKDgbOVRbQXkXrcTMkxD
        TXozBo5mAuyGFl1n8w0QSY8M0aFATYh7JSxrdm+nBw==
X-Google-Smtp-Source: APXvYqzfY3x6ejquybkOcW8bRi3yx3xL/t12AImg8nmcOIFp379vLkLMbJyYVc4gHFk+exKZrfqfmfprkynWxI7QNe8=
X-Received: by 2002:a17:90a:858c:: with SMTP id m12mr21507252pjn.129.1566229250039;
 Mon, 19 Aug 2019 08:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a59094059013dd63@google.com> <1565875886.5780.7.camel@suse.com>
 <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com>
 <1566218263.5663.22.camel@suse.com> <CAAeHK+xX3vk_JoJ=2tHF__LECxNmPXuPMkxWz6u+K6L-MdN=9g@mail.gmail.com>
 <1566220164.5663.25.camel@suse.com> <CAAeHK+wGzWGvW0AVSr6qA+AcpLr7A3Xi8wR7f-rBQJmMmQgU2A@mail.gmail.com>
 <1566222541.5663.27.camel@suse.com>
In-Reply-To: <1566222541.5663.27.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 17:40:38 +0200
Message-ID: <CAAeHK+xum44QNGCgnFc-W69AfA4Rt1hEiRc4SrSWhFfqhhuf0A@mail.gmail.com>
Subject: Re: divide error in usbtmc_generic_read
To:     Oliver Neukum <oneukum@suse.com>,
        Dmitry Vyukov <dvyukov@google.com>
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

On Mon, Aug 19, 2019 at 3:49 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 19.08.2019, 15:18 +0200 schrieb Andrey Konovalov:
> > On Mon, Aug 19, 2019 at 3:09 PM Oliver Neukum <oneukum@suse.com> wrote:
> > >
> > > Am Montag, den 19.08.2019, 14:43 +0200 schrieb Andrey Konovalov:
> > > > On Mon, Aug 19, 2019 at 2:37 PM Oliver Neukum <oneukum@suse.com> wrote:
> > > > > The original error was a divide by zero. The first fix fixed that
> > > > > but still another error showed up. If I propose a fix there are
> > > > > other possibilities besides it working.
> > > > >
> > > > > I could have no effect on the original bug or my fix breaks
> > > > > something else and KASAN is making no difference between
> > > > > those cases.
> > > >
> > > > I think you mean syzbot here and not KASAN. Do I understand correctly,
> > > > that you're saying that the original report was
> > >
> > > Yes, sorry syzbot.
> > >
> > > > divide-by-zero, but
> > > > when you requested to test the patch the reproducer triggered a
> > > > use-after-free, and syzbot didn't treat the patch you provided as a
> > > > correct fix?
> > >
> > > No, obviously there is still a bug. What I would like syzbot to have
> > > would be a third category: inconclusive.
> > > Seeing another bug instead may also mean the first bug struck
> > > before the second could ever happen. We just lack data to tell.
> >
> > OK, I see. The exact words that syzbot uses in this case are "syzbot
> > has tested the proposed patch but the reproducer still triggered
> > crash". What would you like to see instead?
> >
>
> "syzbot has tested the proposed patch but the reproducer triggered
> another crash" would make it clearer.

This implies that we can differentiate between different crashes. We
can differentiate between different manifestations of crashes, but
those can be caused by the same bug. I think we can remove the word
"still" though, so the words will be: "syzbot has tested the proposed
patch, but the reproducer triggered a crash".

Dmitry, WDYT?
