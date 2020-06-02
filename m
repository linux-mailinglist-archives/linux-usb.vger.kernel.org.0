Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6F81EC0D6
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2020 19:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgFBRTj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jun 2020 13:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgFBRTj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jun 2020 13:19:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F97C05BD1E
        for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2020 10:19:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ga6so1684244pjb.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2020 10:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+P/PZHOqotTe6Y+Kk1mMk5Kf+3c1pzP9mwcgdU+JGoA=;
        b=rTwbccbhNr+Z95ISuuwgkCHDYvEkNQT4Vd9UuTaWTq1lb/O97ewiBNMXcw+qi03VN0
         Ea8Qh0ZMlLG/xcUkP5pWfsuV6r3JYy83n0OFcchFs9Tg13KqNB/BG73v96741/uSKq1v
         CliV0gMnWhTCaYQze6RO91VEpMlQoDCcmNy7pBdSmXrIRHk9Sg1uTjuUFokmCys5IPCC
         /xKDF0u6MbT/D7vb9RVzD7/OxOsRGgA9TsikxTKbFmaERb+Z9f+mY/XrzgX8gVyLQgfW
         5nWh/E3reTBZa6zU+lKLlzfQByFSvBbuTikUS4QmcV3u2pTRuWJ8VYqN6QzC0t/FZOrb
         CNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+P/PZHOqotTe6Y+Kk1mMk5Kf+3c1pzP9mwcgdU+JGoA=;
        b=GrU1loi0p/IetwrrqJut3PAE86CgREIRZ6XEhxeH1FWT75MW8s0p3PiLstoV5Xn6xQ
         X9Om1sHSxm9IJqzPwOaLPjeuvriYVswWuhUMCzvaBaWk+FnKvYcfi59/a4FFsnKq0c3M
         L56U17DeVgkJvTrhmE+XfoKMv9BOevpvCEUpek6NYvCeB3KgaSzVdexOIMdBWfv36uai
         PtJD3kzqPcFUGeFRqQtJtR8WtCmrUvKos/qWNDteYliIWwV+wSQqX42HHjNgAz6HH4ip
         9j6svub0I729VPMqRbD/MouyJaMECbPjILWjrcAbPB/5fSiB3PttBzlDSj4aZTY4k5k5
         0U7A==
X-Gm-Message-State: AOAM530sjyqbyF9khAkA6KR0M4o9d6DvDisP/HihN2AhvFB/M4mYXT6b
        Hdgk9Aot03d450wNJtkbeqo03IUppN3RwgFKEFE03Q==
X-Google-Smtp-Source: ABdhPJyXPIEMsTydqDl9Mujnk4v6UrX7J4Bb9q6ute3YXJmT68apMdBdxTMVpEgt6LwOSYk58JeerQpLjX47mcTjvBw=
X-Received: by 2002:a17:902:c686:: with SMTP id r6mr27042256plx.147.1591118378852;
 Tue, 02 Jun 2020 10:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bbd09005a6fdc6cc@google.com> <000000000000f0261a05a700adf5@google.com>
 <20200601084335.GA1667318@kroah.com> <CAAeHK+zKLBX62D1MVAkBe7Q__32-K-4FewsfvF3Z_P8SK=oAHQ@mail.gmail.com>
 <20200601122858.GA390561@kroah.com>
In-Reply-To: <20200601122858.GA390561@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 2 Jun 2020 19:19:27 +0200
Message-ID: <CAAeHK+zcGGZxkpwW050wrOUN_ksVxDJk5hfF1Vt8xZYBKqHMzQ@mail.gmail.com>
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

On Mon, Jun 1, 2020 at 2:29 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 01, 2020 at 02:22:40PM +0200, Andrey Konovalov wrote:
> > On Mon, Jun 1, 2020 at 10:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Jun 01, 2020 at 12:24:03AM -0700, syzbot wrote:
> > > > syzbot has bisected this bug to:
> > > >
> > > > commit f2c2e717642c66f7fe7e5dd69b2e8ff5849f4d10
> > > > Author: Andrey Konovalov <andreyknvl@google.com>
> > > > Date:   Mon Feb 24 16:13:03 2020 +0000
> > > >
> > > >     usb: gadget: add raw-gadget interface
> > > >
> > > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164afcf2100000
> > > > start commit:   bdc48fa1 checkpatch/coding-style: deprecate 80-column warn..
> > > > git tree:       upstream
> > > > final crash:    https://syzkaller.appspot.com/x/report.txt?x=154afcf2100000
> > > > console output: https://syzkaller.appspot.com/x/log.txt?x=114afcf2100000
> > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=129ea1e5950835e5
> > > > dashboard link: https://syzkaller.appspot.com/bug?extid=5f1d24c49c1d2c427497
> > > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d70cf2100000
> > > >
> > > > Reported-by: syzbot+5f1d24c49c1d2c427497@syzkaller.appspotmail.com
> > > > Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> > > >
> > > > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> > >
> > > So the tool that was used to create the bug has bisected the problem to
> > > the patch that adds the tool to the kernel to test for the issue?
> > >
> > > This feels wrong...
> >
> > That's the expected result of bisection with the way it's intended to
> > work. We'll be getting more bisection results pointing to that commit
> > for old USB bugs. For new ones (that are introduced after raw-gadget),
> > the bisection should point to proper commits.
>
> Ok, can you then mute any bisection emails that are about to get sent
> out that resolve to this commit to save us the effort of just ignoring
> the thing on our end?

Sent syzbot change: https://github.com/google/syzkaller/pull/1782
