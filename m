Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F89B7DF7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 17:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404022AbfISPT1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 11:19:27 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42298 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388706AbfISPT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 11:19:26 -0400
Received: by mail-pl1-f196.google.com with SMTP id e5so1760310pls.9
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HIx6RSMcBx+AkpCbzjzq7BE2iXvqoNefszXIBP0DlaU=;
        b=obLTwYgu2ct6C15EVBrPLKx2xA1kewtCk+U74Njt7jA+dfkH2VFSEpjuc1dx+MsPWx
         o6kLi2E0YBHvu0lQrHy1eHY6ZXjvmjpKStHgK16A5b9tx7jM9509QmrevE1y/rcX1hoQ
         OZ8YTj/bDtP7rbvwtycofFZ6nd1E5suzksPx1StXaH3hwH2GTn8ZEhfYlXl0xyf1YYE0
         AO5oKPuXXA3D2nDB8T4qG9ElDsCItYCUtNjkWGZSQ+E9GWH5JYkDJ6UCKY/cqb65JdmY
         r4hBXoIqEV8HwCBJfOmMkBA5jTjoEc0TWMpy+mLOIL/h26k5uGiJfasSqhIUEk2rz+79
         tNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HIx6RSMcBx+AkpCbzjzq7BE2iXvqoNefszXIBP0DlaU=;
        b=IpL13sAndH6h99Uw6tuZ6SkabvZj2LcS2GU71pIWoYbdgJEkQFTWar1o3wPl/ClGPc
         RJnf7VIfTtd8/wXlh9PldKgGqiocfSZXwEs4pH1jbHqnJdlS1NlJuCZxJdFmFoUEl6Xu
         Zz51KpLVlBEOi44/cTPMmy5A3hirj1K8OeKPYzlwfxF1NIebx5gLr0qoaLUZWa+pTevV
         N5rL7Yy+/4jH5k54J39yBOs0uRErR4rg9RuLeW62mgzKMCqytLfS9BttStQFR3W4Xeev
         Fwe+l26xFZvhk68X0GpYrVHd+/CrvdfUUppogylv6wQVrhinOS1xt8RuJVInrOmMuyfb
         poKw==
X-Gm-Message-State: APjAAAWlHOOOl1eeK6Ry8RPk+CICUtxxqcGEdmoUpTti9B1MrSN/rfR7
        OrPYBIzt+QGGNr602uFqPe5XFIba1lyxLazh+SXyEw==
X-Google-Smtp-Source: APXvYqyiDWT+CRfk1TTP/9assNZVatUd4spJEhVcFXVa6XgsJHQVrDSX/rZS90PdEOTkSyC/w0c3pcRCV31KmmTzUPA=
X-Received: by 2002:a17:902:a50a:: with SMTP id s10mr10346338plq.336.1568906363888;
 Thu, 19 Sep 2019 08:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000001595b0592c41731@google.com> <Pine.LNX.4.44L0.1909181454300.1507-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909181454300.1507-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 19 Sep 2019 17:19:12 +0200
Message-ID: <CAAeHK+xcJjE_+U7tTs76CkV1v95r8J+eKXhMj00iyrHA2cxGmA@mail.gmail.com>
Subject: Re: general protection fault in usb_set_interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, mans@mansr.com,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 18, 2019 at 8:57 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 17 Sep 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer still triggered
> > crash:
> > WARNING in sysfs_remove_group
> >
> > ------------[ cut here ]------------
> > sysfs group 'power' not found for kobject 'radio0'
>
> Andrey:
>
> Is there any way to tell syzbot to run the reproducer but with only one
> device instance (that is, only one dummy-hcd bus)?
>
> Or can you a new, modified reproducer that will do this?

AFAIU there two bugs here and you've fixed the first one, but the
second one gets triggered.

I think the second one got reported separately here:

https://syzkaller.appspot.com/bug?extid=5b9bba68c833c84a1135

That one has a reproducer with a single dummy-hcd, so you can try
running your debugging patch against that report.

I'll see if I can run it manually in the meantime.
