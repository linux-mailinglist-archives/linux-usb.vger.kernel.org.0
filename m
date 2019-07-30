Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6B027A367
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 10:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731172AbfG3Iwf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 04:52:35 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46666 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728206AbfG3Iwf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jul 2019 04:52:35 -0400
Received: by mail-io1-f68.google.com with SMTP id i10so12987463iol.13
        for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2019 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZBc4JuoBoitGCeCfz1fTkJZWC6uNTzfMWVRVk5mqmk=;
        b=q2FqjjQOO4Od2TjVnBr0XI76YwSq/QZxoIJdKsgBpHVOLhVPbpvge/7DZJJe5SmKtb
         NtAkZ7UGCulTG1syPON0BBi4nNWoDGgILFGK9leVVEQoB7nOTGqzSiBQOzNteXD7jCF/
         97SnBTrLDt1FFRAAn48SZWW1O5648m4h/yyG7u7XEiKQGG6j+EV4qYAl+2gjOxE2ATGh
         xxNGSUGKlGk4hftXY8AzaHKsq5ocYPcMTfwth2zATbQ34KArd5ODrMW658RrZLjUw8Lq
         9HeoFR4lvOxXoXJFxMvPz6Aw98qNd9lUeM4LhWVEDUDEqj5cFGK6pfA1FDg3TmtgXvLd
         YYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZBc4JuoBoitGCeCfz1fTkJZWC6uNTzfMWVRVk5mqmk=;
        b=Qj5EbCfIDX5lk5rNQTgTUCvo3UApNc5VfP9c9MC1TeiHYrBw+fYlaAsTgEUkfdWtSp
         JOtFxgzlUozaZVFCq5OQAE6fh6VI1unCxEmh1TdJgrjGjRB+poYfa28cp0YhF9sX+muz
         QoxeKrMQFKjccZK6oTGoTUD8jbpQoTuY0fUxjfozcrJOTUH88uKvXEYyLThPXsrDTHju
         fUSMp5TkmmiSu3gEl89HvRWoxELlrOMuQ+B+s3JuJKlv0ZF9WnqmLhzJOCTKStZxG1ix
         9z5OVfZ9oVe8CQv6pSjW3+/WbsadHtVFv/9FwK9grS1RHV940S2fEg9QCkz6ODRopA8X
         rbRA==
X-Gm-Message-State: APjAAAXSLoGUqK8q4LVEqBXbpo6lx6z88q6N0eKmV3YNAgOzQdZmHEWO
        97J1EF/bjbOG3UnNKX/cEzbBN5vrJI1OMieROZJP9Q==
X-Google-Smtp-Source: APXvYqw8+BtKHmmrc3lK/cH3wHyY4TmeHoP7Aj/d3Qv71Gh5yvAfyAwWFsFhzddtaipqUo2Tukj19iZd9GZdWMJMkwU=
X-Received: by 2002:a02:a07:: with SMTP id 7mr119631327jaw.65.1564476754235;
 Tue, 30 Jul 2019 01:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <1564410374.25582.15.camel@suse.com> <000000000000488c6d058ed337b2@google.com>
 <CAAeHK+yY3JWAj+EZ5wzqUOMbN+cdddCoRn7Nxn759-7zR-J7BQ@mail.gmail.com> <1564473085.25582.19.camel@suse.com>
In-Reply-To: <1564473085.25582.19.camel@suse.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 30 Jul 2019 10:52:22 +0200
Message-ID: <CACT4Y+Ym6K6VOZ9-qbMXo3tPNALH+9MMdfN9uP3BXn1QDGCw=A@mail.gmail.com>
Subject: Re: general protection fault in flexcop_usb_probe
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 30, 2019 at 9:51 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 29.07.2019, 18:54 +0200 schrieb Andrey Konovalov:
>
> Hi,
>
> > Thanks a lot for fixing all of these USB bugs!
>
> I fear the day we get serious about MA USB.
> All these issues will turn into security issues.
>
> > The usb-fuzzer branch is working again, so it should be possible to
> > use it for testing. But, I've actually just realized, that the proper
> > way to test fixes for USB bugs is to use the exact commit hash that is
> > provided in each bug report (the kernel interface for emulating USB
> > device is not stable yet, and has significantly changed at least
> > once). I've updated syzbot documentation to reflect this.
>
> Where is taht documentation?

Hi Oliver,

The link is referenced in every bug report ;)
https://groups.google.com/forum/#!topic/syzkaller-bugs/C4kgnyomFyQ
> See https://goo.gl/tpsmEJ for more information about syzbot.
