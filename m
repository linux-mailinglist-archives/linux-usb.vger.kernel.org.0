Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC7EC11D1DE
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 17:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729791AbfLLQIN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 11:08:13 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:46838 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729247AbfLLQIN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 11:08:13 -0500
Received: by mail-pj1-f66.google.com with SMTP id z21so1198922pjq.13
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 08:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t52ABI4o3xuFzx6iI2FiMXzfLHRG2vXtrOTjLyWwP9Y=;
        b=X1KkHrFe5+KnHXvDuX3JhEdoMJFSddEV0UBbSMsLqYli/s1pZYiVh+80ScOCfhZHOM
         mbkNEsocPrMFAgosaX2RG2mHTAM7cIn0BK/k5T4QTjffd623q7TN/9iUQI0AQOfZlTCH
         czPVYHsiIpszSn9niPFVmY50qxpQICUTky78CnTGdd4NwlcSWUb4Ip7p3KFm6tl3oBFG
         lgF0SkN3G/CYcDH/Py8VaSZPbmbNjsCt7+ssDRY9JU/t1qonM3t0Opzaq5OX7utarXDk
         KP8hmVFCFsBIYmi/fJlezeLb+o8+ydOiJihIHxUwtua/q0xGkJs0nlnKeOnfwYsDn2TW
         y+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t52ABI4o3xuFzx6iI2FiMXzfLHRG2vXtrOTjLyWwP9Y=;
        b=WD0CfLG3GYwh4w3YPOO1jsfY3XIqBcNENEV97Lpv0rZmFXIYVMRq3nPQSN1YEcsGlq
         g8SzhVtD0phwtBjX4+3sIVRahcanqagHT/lNWztRMz0CigSanHy76mw/u6FzZcJA3R9s
         Ikd5v6d+EQiusHsciYUtzRr3HjnUlrrj6PUL5kAtMoe+qHsmeXvaJNeJv3IkBIF1QjvX
         YgvL16CpOGoA8NtA/j3F+KHqoryIq0fur1di2IjAuQCHH7WB7+vkqHHs8T7WIL7Nvrig
         lM0v3h0BTcjj3Yy4RN5vS91cYL/DgPwI8s8l01ZQmadzAG5mSu35XA/3nOWpXaZGdQxO
         5H6g==
X-Gm-Message-State: APjAAAXwWoXI+9N3IlmT0XHwNp66boUuPQg3eyxOA9VRiyzPk26L/wwK
        A54DQoA0MHS1SALXlJ3muRwW9u7sF6FP4WnOiT4IOQ==
X-Google-Smtp-Source: APXvYqwASuMpHZLBfrLXn/KYVzEs9kgGnKLeSVpzijPOaYmow5k5SKoXqWmvUXPl8XHgRTNm16UsMpTaUOySri6b+N4=
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr10050409plp.336.1576166892491;
 Thu, 12 Dec 2019 08:08:12 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+ZSmwr4y2VrUxZSvFCL0Ws4cp6T5FwyVRg_CqhCf354HQ@mail.gmail.com>
 <Pine.LNX.4.44L0.1912111111510.1549-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912111111510.1549-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 12 Dec 2019 17:08:01 +0100
Message-ID: <CAAeHK+xVxFGiJGzEv09GtwfU1wBhCsoEukKXUxW0nq-2h9Aasw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbvision_v4l2_open
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+c7b0ec009a216143df30@syzkaller.appspotmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 5:22 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, 11 Dec 2019, Dmitry Vyukov wrote:
>
> > > > By the way, do you know why syzbot sent _two_ reply messages?  One with
> > > > message ID <00000000000031a0af05995eca0b@google.com> and the other with
> > > > message ID <000000000000441a4205995eca11@google.com>?  It seems like
> > > > overkill.
> > >
> > > Hm, I'm not sure. Dmitry?
> >
> > I would assume it received 2 emails (second from syzkaller-bugs@
> > mailing list) and deduplication logic did not work somehow. So it
> > replied to both.
>
> Does that mean when I send in a test request, it's better to omit
> syzkaller-bugs from the CC: list?
>
> Also, whatever did happen to the most recent test request (the one sent
> to syzbot+7fa38a608b1075dfd634 even though it was meant to test the
> bug reported by syzbot+c7b0ec009a216143df30)?  Did it truly fail to
> build?  I can't find anything about it in the dashboard link for either
> bug report, and I haven't gotten a reply from syzbot.

Yes, the patch failed due to msleep() being undefined in that source
file. I'm not sure why syzbot didn't send a response. Could you try
resending the patch as the reply to that other syzbot report?
