Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AAB1EA3CA
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2020 14:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgFAMWw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jun 2020 08:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgFAMWw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jun 2020 08:22:52 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B92C061A0E
        for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2020 05:22:51 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g12so558083pll.10
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2020 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e5WblPyCQMgiUPSfQdaJDJi/2Nnr45CAxqcOyPOJ5sw=;
        b=GEqCpbt2JdwVvrCF269QlWpY8lPvZ5UB/fgAOV+R017RjNo8RdKmxZ/TQx7Iz4d/LE
         Ys+C3lVDLeDdQqWaQhZnglU6fW2+Znx0apCj7+XG5xGDnUZ8Vz2z8kCVaiM6ccpl8F6X
         x1d0EwUV9lK9FIV5gaTHppKeLE++Rq5lwS1lfLh9KeZHjO6IiM1e4GoLWFLUGTXZ6pia
         ishs8w0vT8amCJ7Qv9RRkL5XMEeDN3Jufqf4xM5Xa0zk1FPGqgqY0djs2dKdBhujJBWR
         V2alOmQD9Q57SxhVBO9C7mHSOW8LNcnWZcVX3CXNbqmXWWUoAbxmaUXyNPPlx/0Fy+xu
         Vchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e5WblPyCQMgiUPSfQdaJDJi/2Nnr45CAxqcOyPOJ5sw=;
        b=jzjs5BjBPG9CpDw2T+0A7YW0uIHgyDd+vyf+f4ZToJeOSBJB8OaBBivLnNd3yMBJNG
         3x1WY1RYnBEhW+sUsfLPDjpqJajGwkfN8aoVVkxAlUOpsIeJLUo7O+BhTVi7UlVW4VMn
         D4OMMbMviNfF21S6qCX9iafniJQ2qCZ7aJiNqndkg1pxyt3koo1kSTMxbBskizj4YlIO
         M7XIUGCSiRZnLO1jebShwoKqlabGc5rHxpasWCTQVT6l6VCME7jB1JmOs0EO+AddV4sV
         Meb7BV2BK2fCjaE9oXfSY8wFCI95XJzuHlyHfSmHUnohACMjKTlcW7xQHo6srejlmzbr
         Qs1w==
X-Gm-Message-State: AOAM532dP7IEfJ7/VP26d7NhiSyrjxulVquRHLj+nSyxsuGwrw79YSQr
        aBGeHPyGjPMQT/gB5EMkIzE5GcyAHyRLVRGzN5Srsw==
X-Google-Smtp-Source: ABdhPJx+/5rbMpGCygYe3CCdV+5hlw8qvYoOLgCqPy9eqo5gQ0j42yoxY6rcIDprN65ahcgQQuqStDsfZ7FcE8PDIOs=
X-Received: by 2002:a17:902:7b89:: with SMTP id w9mr18402765pll.252.1591014171041;
 Mon, 01 Jun 2020 05:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bbd09005a6fdc6cc@google.com> <000000000000f0261a05a700adf5@google.com>
 <20200601084335.GA1667318@kroah.com>
In-Reply-To: <20200601084335.GA1667318@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 1 Jun 2020 14:22:40 +0200
Message-ID: <CAAeHK+zKLBX62D1MVAkBe7Q__32-K-4FewsfvF3Z_P8SK=oAHQ@mail.gmail.com>
Subject: Re: WARNING in snd_usbmidi_submit_urb/usb_submit_urb
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     syzbot <syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com>,
        Felipe Balbi <balbi@kernel.org>, ingrassia@epigenesys.com,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 1, 2020 at 10:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 01, 2020 at 12:24:03AM -0700, syzbot wrote:
> > syzbot has bisected this bug to:
> >
> > commit f2c2e717642c66f7fe7e5dd69b2e8ff5849f4d10
> > Author: Andrey Konovalov <andreyknvl@google.com>
> > Date:   Mon Feb 24 16:13:03 2020 +0000
> >
> >     usb: gadget: add raw-gadget interface
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164afcf2100000
> > start commit:   bdc48fa1 checkpatch/coding-style: deprecate 80-column warn..
> > git tree:       upstream
> > final crash:    https://syzkaller.appspot.com/x/report.txt?x=154afcf2100000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=114afcf2100000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=129ea1e5950835e5
> > dashboard link: https://syzkaller.appspot.com/bug?extid=5f1d24c49c1d2c427497
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d70cf2100000
> >
> > Reported-by: syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com
> > Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> So the tool that was used to create the bug has bisected the problem to
> the patch that adds the tool to the kernel to test for the issue?
>
> This feels wrong...

That's the expected result of bisection with the way it's intended to
work. We'll be getting more bisection results pointing to that commit
for old USB bugs. For new ones (that are introduced after raw-gadget),
the bisection should point to proper commits.
