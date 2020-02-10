Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEC1157E12
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 16:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgBJPFC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 10:05:02 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:42600 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgBJPFC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 10:05:02 -0500
Received: by mail-qk1-f193.google.com with SMTP id q15so6762228qke.9
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8aliVfr/Np4hkPQ33o46u2Grd4DX7wASnGsm/Zcus3k=;
        b=mKWMlgmW4/67JTi5qgxd8v5tJFzgIpFofYvpPESc+RYnt/YLGM9XYgTLzPOTJsSq6z
         VXb90EUoAuQfvw6oke7+8Wsc6KqN/gWNwvR/7pWQjUh0Me2Cua7rWKp3SapilyDHZMho
         4ex3uOyWGrka1ypF7FCNdpZ/cGsenXObj/OqHYivyN1GvTBB9lVr+7hTdtuiCD53YaxG
         r+3tYCLzpVXW1X63xGOvlIXjn6w9/tiRZjajhEI9S4Wc9IoDyszOm6sPvYYmDrjm/HOT
         mfquUK8dDbRpBekKzuajKGhf3mBU5Xw5Z6s3j5nwBKPD+oMSxk9cJk6OXVqS5GxmWbUk
         5RcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aliVfr/Np4hkPQ33o46u2Grd4DX7wASnGsm/Zcus3k=;
        b=ZLf6P0m2fk2ilwCDkwknhM+0jcaAztMTRnIc96YIuVNAeIsxjbJEIft0J/cIPGv+ko
         WQkgjweV6d/mvwC5VdBBWsXeyB8OvcYmhZ6ViPYXJS78t1d3AGhPc/aejzMNWLMNdLQR
         VqkkLVQo9dSnEK4StwGE5YfPl+Dn9OvYm/eWAmRP/G5gw2niJK+CGHdwqzR/glS2OOMt
         5v8tdUTaW+jqhnRL7SxyZO/EXnH/1XSZCa3SABzLwPM20ehEc3sixfiHQRWKuk/Cd5q2
         lw95ULWqtM0KMhOipyaqsojoM3dIXxN4RL2QuDRGB4a/+nNavuzprjurWYPSFXfMEd71
         Uaog==
X-Gm-Message-State: APjAAAU3eQ/xzfpRAV61weV9jZ6hXsIqeswJ6LawlGuh/ZniWpNEagz+
        QaIvXttIcckwWsqWfZ6nLSELmzIk2N0VHwVsprrBJA==
X-Google-Smtp-Source: APXvYqy5WuodZaOQesAW4SGqZqJqlgDdTnhJCE8jQ98anEcysHXbU+RHZgiXMRVqFWVDMBL40gc8NrlEcUNRjtCS61M=
X-Received: by 2002:a37:4755:: with SMTP id u82mr1692304qka.43.1581347101107;
 Mon, 10 Feb 2020 07:05:01 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003313f0058fea8435@google.com> <8736ek9qir.fsf@miraculix.mork.no>
 <1574159504.28617.5.camel@suse.de> <87pnho85h7.fsf@miraculix.mork.no>
 <CACT4Y+YgLm2m0JG6qKKn9OpyXT9kKEPeyLSVGSfLbUukoCnB+g@mail.gmail.com>
 <CACT4Y+ZjiCDgtGVMow3WNzjuqBLaxy_KB4cM10wbfUnDdjBYfQ@mail.gmail.com>
 <CACT4Y+ZWDMkOmnXpBXFhU8XcHA_-ZcHdZpfrXcCWHRzcbQ39Gg@mail.gmail.com> <ebc7b5e0-e968-0bdb-d75d-346e0b763d14@i-love.sakura.ne.jp>
In-Reply-To: <ebc7b5e0-e968-0bdb-d75d-346e0b763d14@i-love.sakura.ne.jp>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 10 Feb 2020 16:04:47 +0100
Message-ID: <CACT4Y+bDNjj_RGLtvRCaV3k9+QX4eENyKyWWAbsHcbwR7CDrWQ@mail.gmail.com>
Subject: Re: INFO: task hung in wdm_flush
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Oliver Neukum <oneukum@suse.de>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Colin King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        yuehaibing@huawei.com, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 10, 2020 at 1:46 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/02/10 19:09, Dmitry Vyukov wrote:
> > You may also try on the exact commit the bug was reported, because
> > usb-fuzzer is tracking branch, things may change there.
>
> OK. I explicitly tried
>
>   #syz test: https://github.com/google/kasan.git e5cd56e94edde38ca4dafae5a450c5a16b8a5f23
>
> but syzbot still cannot reproduce this bug using the reproducer...
>
> On 2020/02/10 21:02, syzbot wrote:
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger crash:
> >
> > Reported-and-tested-by: syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         e5cd56e9 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c372cdb7140fc162
> > dashboard link: https://syzkaller.appspot.com/bug?extid=854768b99f19e89d7f81
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Note: testing is done by a robot and is best-effort only.
> >
>
> Anyway, I'm just suspecting that we are forgetting to wake up all waiters
> after clearing WDM_IN_USE bit because sometimes multiple threads are reported
> as hung.
>
> On 2020/02/10 15:27, syzbot wrote:
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger crash:
> >
> > Reported-and-tested-by: syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         e5cd56e9 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c372cdb7140fc162
> > dashboard link: https://syzkaller.appspot.com/bug?extid=854768b99f19e89d7f81
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=117c3ae9e00000
> >
> > Note: testing is done by a robot and is best-effort only.
> >
>
> On 2020/02/10 15:55, syzbot wrote:
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger crash:
> >
> > Reported-and-tested-by: syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         e5cd56e9 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c372cdb7140fc162
> > dashboard link: https://syzkaller.appspot.com/bug?extid=854768b99f19e89d7f81
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=13b3f6e9e00000
> >
> > Note: testing is done by a robot and is best-effort only.
> >
>
> On 2020/02/10 16:21, syzbot wrote:
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger crash:
> >
> > Reported-and-tested-by: syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         e5cd56e9 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c372cdb7140fc162
> > dashboard link: https://syzkaller.appspot.com/bug?extid=854768b99f19e89d7f81
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=115026b5e00000
> >
> > Note: testing is done by a robot and is best-effort only.
> >
>
> On 2020/02/10 16:44, syzbot wrote:
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger crash:
> >
> > Reported-and-tested-by: syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         e5cd56e9 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c372cdb7140fc162
> > dashboard link: https://syzkaller.appspot.com/bug?extid=854768b99f19e89d7f81
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=17285431e00000
> >
> > Note: testing is done by a robot and is best-effort only.
> >
>
> On 2020/02/10 17:05, syzbot wrote:
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger crash:
> >
> > Reported-and-tested-by: syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         e5cd56e9 usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=c372cdb7140fc162
> > dashboard link: https://syzkaller.appspot.com/bug?extid=854768b99f19e89d7f81
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Note: testing is done by a robot and is best-effort only.



On Mon, Feb 10, 2020 at 4:03 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> On 2020/02/10 21:46, Tetsuo Handa wrote:
> > On 2020/02/10 19:09, Dmitry Vyukov wrote:
> >> You may also try on the exact commit the bug was reported, because
> >> usb-fuzzer is tracking branch, things may change there.
> >
> > OK. I explicitly tried
> >
> >   #syz test: https://github.com/google/kasan.git e5cd56e94edde38ca4dafae5a450c5a16b8a5f23
> >
> > but syzbot still cannot reproduce this bug using the reproducer...
>
> It seems that there is non-trivial difference between kernel config in dashboard
> and kernel config in "syz test:" mails. Maybe that's the cause...
