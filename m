Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8E414A636
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 15:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729050AbgA0Oep (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 09:34:45 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45394 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgA0Oep (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jan 2020 09:34:45 -0500
Received: by mail-qt1-f195.google.com with SMTP id d9so7466972qte.12
        for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2020 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o+w00Z+a9Lc3UGBwoCrl8G1pruFGPJ/8zu/QyRd1NbE=;
        b=PjGAUmwkw5hENfh9WggpD4J+4ewz3me369iaHjzeRLHxT5b1pE0b5p+XPhr7qaE06B
         tYxg4Hn9fZoQCb8+9BBtfjC+oIGpB60Xo/82Ef4ZyISG6hNHqX812CY4Cr0qqR93UGQN
         O8p6tzyIBj6ZvJlBWT5R1q8UPMl0vbj3/Wlvn9oqzj037GI7envTjRV4iCZXd+1ZV+Sj
         a79onzpcvgef1qdE63ntplKozKMIvcNjt+JjYIJaPFkiEjztSJtx7747Lz9yHlS167CM
         brk8H8YffPG80bvxknob5+2WXPNlTY6fdLwKlQ8z56lOTMf0WNqVGVzn3E6PnMR4OoHg
         vdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o+w00Z+a9Lc3UGBwoCrl8G1pruFGPJ/8zu/QyRd1NbE=;
        b=f5IGgKrFaU3sGWlF5TJATr+XRCQ8K95zYo5AuOClYKd6PZz7kPDfVU4fnjS4euCuE8
         OAftwq8v2ioY0+Yr0+xJ+A+AqZmw1KIBAamjE/5iFTe0SNmzYi2IhSl0fWC+WVRczEDD
         iDcBXgid8up63nd+S2aq9MTQ5JtSSTwLx4shan1N1DAeD17PIQ8B3vqf5GpNk2wQE4pL
         cy5065SmVbSiZ3ZwEIrkp+s53aFgJdHDmj/YHrBw2424sUkuh9HNtIID1iXH/b/eH1W4
         RZdj2PAK/b24sbodtvQu1Sdy0k3UWasaBb9VGcRPh7ObPbQfDZynDdbsGqRwLvHWwOYI
         QdCA==
X-Gm-Message-State: APjAAAWtU8WOxdo8HrNDVXhl1X9QeC2V0OxywpNH6vpdrrJlaQM5SDW5
        lNdPICVghWvDq1k1ul0j1RTlRFXtnCrsx1lccHPLXw==
X-Google-Smtp-Source: APXvYqxVMVrUAZqUZayzZO2qnNrfkdGEBHyN3IVl6dTc/yqBU1rShNCy6+RWgClLHDmVDV8d0UX1hrgHMZhXlVnjU+A=
X-Received: by 2002:ac8:340c:: with SMTP id u12mr15564452qtb.257.1580135684302;
 Mon, 27 Jan 2020 06:34:44 -0800 (PST)
MIME-Version: 1.0
References: <0000000000004dbaf2059c193a36@google.com> <20200126024957.11392-1-hdanton@sina.com>
 <20200127092850.GX1847@kadam>
In-Reply-To: <20200127092850.GX1847@kadam>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 27 Jan 2020 15:34:32 +0100
Message-ID: <CACT4Y+ag59G4p=DO3Dg7jnFt3wQb=dtjzBujADtGHKn-97O8_g@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in hiddev_disconnect
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        syzkaller <syzkaller@googlegroups.com>
Cc:     Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+106b378813251e52fc5e@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 27, 2020 at 10:29 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> I already fixed this bug in an earlier thread.
>
> Syzbot always reports a use after free as two separate bugs, a read
> after free and a write after free.  It's too much hassle to mark all
> the duplicates.

+syzkaller mailing list

Hi Dan,

Not that it happens always, but, yes, it happens for racy bugs (for
single-threaded the type of the first access is usually
deterministic). Worse, sometimes they show up as GPF, unable to handle
kernel paging request, null-ptr-deref, user-memory-access, especially
for crashes that happen very frequently so that syzbot starts catching
long tail of more weird/unlucky incarnations.

The exact string is under our full control and can be changed. We did
some refinements to strings/grouping lots of times. I considered if
all of these should be grouped together and reported just as, say,
"bad-access in [function name]". However, the problem is that changes
to the strings/grouping will affect _all_ existing bugs: they will be
re-reported under new names, then old will be suspected to be fixed
(stopped happening), fix bisected, some closed as obsolete, some
concluded to be still happening, etc. And we have 300+ for upstream
(https://syzkaller.appspot.com/upstream) + 4 LTS versions + 4 Android
versions + a bunch of internal kernels + all users of syzkaller for
linux out there. So this will produce a whole lot of churn for
hundreds of people. The ones that we changed just affected
significantly fewer bugs (e.g. a new bug type).

I don't know what's the right solution at this point...
Changing the title will include lots of churn.
Marking as dups is too much hassle.
Not marking as dups will lead to hundreds of lots bugs and/or lots of
wasted time for people to rescan list of open bugs again and again,
missed backports, etc.
