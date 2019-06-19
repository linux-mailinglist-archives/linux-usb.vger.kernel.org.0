Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464334BCBC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 17:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729670AbfFSPY5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jun 2019 11:24:57 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44224 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727818AbfFSPYv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 11:24:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id t7so7377352plr.11
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2019 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odHa8sQ/yoaX5QNk1w5aCWhCcWp4r/WrYr5KNweyAwg=;
        b=oseLVwfIYfkp7YRYL1YYK06mWuJObguNhqL0xaC83Gr3+3RNwOzBWJCA5qdtYBxt9o
         uzTxc7AkoUGpNHSxVRRbNwU68ufxuCyX800EEZzrQEhDutq8FfYYWkmPYLuJ16//fWrd
         wQtqfjC4mcC4pexLJKQvQNonTNtddUlQBZMxTBopnGN8sjKYdEivd++yJTims6EefuE8
         cdwYmrnoVE9QnikKLNLE7VT4b607cWdngCOFJX+wWrnwx9ieHgCYnECQ9plRtfqLEF7b
         c7wQhOa50GM20ccP9W9B5CBaT+Gq1uHSepvFEJMU+/XDdWJRI8UZOmrt3LL94BdsNdaX
         VncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odHa8sQ/yoaX5QNk1w5aCWhCcWp4r/WrYr5KNweyAwg=;
        b=hKVEfYXj3kpOy/O10Wyb+5bx5P0v1jJa7vbHo5gIrlYbm0SYc42wnJlxPQcP83TlbZ
         5cQE/1dda/h2xla8TOmNCQP9kz3d+/QZxigrPi/FMnpVFHhNST5XxNArxDNQ2kmGrzwW
         v70/AwGSOpikoxMXKmBngi78geh75HS2zwGc1p7g2TmF4g/gSGT1pO3c0K6eWe42RXvc
         KhOGqysQj9EVo3o5BUTmQoiXKAGr7gsdAJpOpKLDR6ev0tOf2vPbHwWIixXZnmZFI8Wk
         l3VHjiEbAa7uONEY7rwSGaRzJhIeKkyu64cCj6764Vj7bvcHRZ0GLjmRYBpJNbSmoPd1
         uFfg==
X-Gm-Message-State: APjAAAU4EqMNd+CTbkTMYpdcuwApmfENxXMmGgEgOEO78DjoYmTl4I3q
        LUaPaWx6IY3XM/M2HVV+ZN0sCKoeqNmkMuSy9I4RPw==
X-Google-Smtp-Source: APXvYqx6p4EUG2WDQGbkLweEA9sgYlt7d+JS+6S5T4a3dp4Kcp71sE2625Q2NhVdzG6nl561DiDISbPyed+z5/EcWuc=
X-Received: by 2002:a17:902:8609:: with SMTP id f9mr111244987plo.252.1560957890006;
 Wed, 19 Jun 2019 08:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <b3761c6479a49b60316325ebc22da904e36d4538.1556813333.git.andreyknvl@google.com>
 <20190502163907.GA14995@kroah.com> <CAAeHK+w9xGtaQ5oSCq-=1YNk_11T2Tz9LKehkL7ZsAz-XwKajw@mail.gmail.com>
 <20190619114458.52474694@coco.lan>
In-Reply-To: <20190619114458.52474694@coco.lan>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 19 Jun 2019 17:24:38 +0200
Message-ID: <CAAeHK+z_f5ugKEpKmfi3qqYE3_OZcTzmZYJaPn2c=hUK64VyJw@mail.gmail.com>
Subject: Re: [PATCH] media: pvrusb2: use a different format for warnings
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Mike Isely <isely@pobox.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzbot <syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com>,
        syzbot <syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 19, 2019 at 4:45 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Wed, 19 Jun 2019 16:30:01 +0200
> Andrey Konovalov <andreyknvl@google.com> escreveu:
>
> > On Thu, May 2, 2019 at 6:39 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, May 02, 2019 at 06:09:26PM +0200, Andrey Konovalov wrote:
> > > > When the pvrusb2 driver detects that there's something wrong with the
> > > > device, it prints a warning message. Right now those message are
> > > > printed in two different formats:
> > > >
> > > > 1. ***WARNING*** message here
> > > > 2. WARNING: message here
> > > >
> > > > There's an issue with the second format. Syzkaller recognizes it as a
> > > > message produced by a WARN_ON(), which is used to indicate a bug in the
> > > > kernel. However pvrusb2 prints those warnings to indicate an issue with
> > > > the device, not the bug in the kernel.
> > > >
> > > > This patch changes the pvrusb2 driver to consistently use the first
> > > > warning message format. This will unblock syzkaller testing of this
> > > > driver.
> > > >
> > > > Reported-by: syzbot+af8f8d2ac0d39b0ed3a0@syzkaller.appspotmail.com
> > > > Reported-by: syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
> > > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > >
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > I don't think I see this patch picked up anywhere. Should this fix go
> > through the USB or some media tree?
>
> Media drivers go via the media tree. You should notice that we are
> currently receiving around 100 patches per week there. It may take
> some time for people to review, but the patches are queued at
> patchwork, so sooner or later someone will review and apply, if nobody
> did it already:
>
>         https://patchwork.linuxtv.org/project/linux-media/list/
>
> That's said, I'm not seeing this patch there:
>
>         https://patchwork.linuxtv.org/project/linux-media/list/?series=&submitter=&state=*&q=pvrusb2&archive=&delegate=
>
> It sounds that, for whatever reason, the patch never arrived
> patchwork. Please re-submit it and check if media patchwork got it.

OK, done!

>
> If not, perhaps you just found a bug with patchwork 2.1 :-)
> (we upgraded from version 1.0 to 2.1 at the beginning of this
> month)
> Thanks,
> Mauro
