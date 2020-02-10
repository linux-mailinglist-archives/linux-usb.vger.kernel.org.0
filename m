Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26086157E55
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 16:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbgBJPGy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 10:06:54 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:32987 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgBJPGw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 10:06:52 -0500
Received: by mail-qt1-f196.google.com with SMTP id d5so5360482qto.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 07:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CjdAYxv8VzjHZnR5Agasaslt3NiSkFTfCtLUheMYJAk=;
        b=u4KpYOas8ua4RoOB6UhyZe4VcPKRIZeBlcC25JMPP48JqRio8CVrZi66anRpju/e2Q
         X/+f0nx+xq8JHxSJROOvv5uY0kFt2Yi7zqakR8m0DRX1siTn4C7oRZKH13JBroBLkWuM
         60BqUoJadOlz24I6KhieOCEIneLqI3UYVUNOFgvvUmP0ee8YHdFpIvtelGa7H7MTIgOQ
         PldXnhXKl6OHlWwYX71VrV2rypaxw4oySzTXoL0SQO1/t8ze/VRIzw+G7b7+BHreWkjo
         mNhTkR+xEEkEGAkAKf+y7ipKwNbkGuHDM+AQjQKXz/umPqrGMBCksLCfgFUhgRjVTHTj
         RXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CjdAYxv8VzjHZnR5Agasaslt3NiSkFTfCtLUheMYJAk=;
        b=M5c9x8RYey/n6Gxff1JFG36aN9PDnok8tXutiJT7Ut4O1dGoGXZkytvn1O/Us71H2I
         lgWvCd56L/KvAwSxCOVl1pZPe4P+KRoliPIryloFWxQP3KEo3hgvi8SdCwjhUbNRHnd/
         gEyjydYpZPb6vz0v3hYiMneszU5o2XzeRyEc0RxQkKUiSbVvg9z7jXdzTVDYb9U0LeG4
         AgyY7T07oC20KU1VUkgomRkR6ApFpbJe+TpQaeXnaEK9V0BWVWlq1AEMGe3FrFTZxNep
         aPnbqU5xjAffEiQtIGn+zOGO+jbQTNQ15KBi7KppRiMdmoendcX7C6gzZ4CXKr+LV4Y+
         7KwA==
X-Gm-Message-State: APjAAAX1ywaYVy/kaWGqsMRH1USqSiGB07N1QlN3hX652Kmny9vLeRby
        cqkZqZwuJoQgI0VSgGmFb3KkQ8sGqpP2B0q6/QQPdQ==
X-Google-Smtp-Source: APXvYqwLvvuZsjf7FcUxigQgUr6KZaAfMVUUnJXR6e8/x++i8a3ywIF+bfSKDSMxZEvqE/0amYLtxlwWsu7Ms7tibOA=
X-Received: by 2002:aed:36a5:: with SMTP id f34mr9801648qtb.57.1581347211196;
 Mon, 10 Feb 2020 07:06:51 -0800 (PST)
MIME-Version: 1.0
References: <0000000000003313f0058fea8435@google.com> <8736ek9qir.fsf@miraculix.mork.no>
 <1574159504.28617.5.camel@suse.de> <87pnho85h7.fsf@miraculix.mork.no>
 <CACT4Y+YgLm2m0JG6qKKn9OpyXT9kKEPeyLSVGSfLbUukoCnB+g@mail.gmail.com>
 <CACT4Y+ZjiCDgtGVMow3WNzjuqBLaxy_KB4cM10wbfUnDdjBYfQ@mail.gmail.com>
 <CACT4Y+ZWDMkOmnXpBXFhU8XcHA_-ZcHdZpfrXcCWHRzcbQ39Gg@mail.gmail.com>
 <ebc7b5e0-e968-0bdb-d75d-346e0b763d14@i-love.sakura.ne.jp> <CACT4Y+bDNjj_RGLtvRCaV3k9+QX4eENyKyWWAbsHcbwR7CDrWQ@mail.gmail.com>
In-Reply-To: <CACT4Y+bDNjj_RGLtvRCaV3k9+QX4eENyKyWWAbsHcbwR7CDrWQ@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 10 Feb 2020 16:06:39 +0100
Message-ID: <CACT4Y+ZaNNAiRvKCMJ9t4H+H23OcjSd5haAcXkG68L8F6Mq6Wg@mail.gmail.com>
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

> On Mon, Feb 10, 2020 at 4:03 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >
> > On 2020/02/10 21:46, Tetsuo Handa wrote:
> > > On 2020/02/10 19:09, Dmitry Vyukov wrote:
> > >> You may also try on the exact commit the bug was reported, because
> > >> usb-fuzzer is tracking branch, things may change there.
> > >
> > > OK. I explicitly tried
> > >
> > >   #syz test: https://github.com/google/kasan.git e5cd56e94edde38ca4dafae5a450c5a16b8a5f23
> > >
> > > but syzbot still cannot reproduce this bug using the reproducer...
> >
> > It seems that there is non-trivial difference between kernel config in dashboard
> > and kernel config in "syz test:" mails. Maybe that's the cause...


syzkaller runs oldconfig when building any kernels:
https://github.com/google/syzkaller/blob/master/pkg/build/linux.go#L56
Is that difference what oldconfig produces?
