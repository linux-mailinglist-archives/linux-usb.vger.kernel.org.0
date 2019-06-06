Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA69372B6
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 13:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbfFFLXb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 07:23:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43357 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbfFFLXb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 07:23:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so1304280pfg.10
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2019 04:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1KX7rxOBTJggZ5Jpw+qh5GOtx+SmZ2NeqPrKujmHVXQ=;
        b=gG2yjrz9nmCeQyrmhMmRh9xpLACVxI0SQnFgixzlkVCHwGHCVt+jCkpoRnvYc+D0Bd
         fYtE+LEVpv9F+PopmdWzS5GsTBmMIxYA3I0qUCmXrEp7hiD2zItouldYgHzwI74+8GwI
         wNgpYz120bfi7s8aXy05syqZ84zGpByWBI1gYlnhVZkYgW241nx7JI/L5TZpwHu507Ms
         clNLOdHUFICBqdy62YJQyZ1ISIqoPmy1ffimErgixoUfV43nIByo3+g2WgXgPiWdyBkc
         ttFoa1Uy4ejcTj2G6AvswEvJ2kSAQq/zF7ns9rk76JRIKjtI9sCYUfBswAmXp+mkDMLN
         1jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1KX7rxOBTJggZ5Jpw+qh5GOtx+SmZ2NeqPrKujmHVXQ=;
        b=pHOTJJwqGaPDpbpE0eAzFkFIxeNt4nOc6VjtSqR+m1uJCZCq2zKMJfO27EHQKwwAZ4
         qEnbbGB6A+z0JDy4rsjRZNALfnNGgyCLbfXXxXtisZeDie1jdMBP9puZ63Z/42cD64kV
         a92aA4SBFWGdPqBv8R+7PVbxEZYCfBDC6W6bgDXKlafI8YN5D5yVwus8sFWMu2K1pDeG
         3d3SWh9zRM5ahimMgwDaKfCSYBxOH9VFWe49bcPtTIgq8ZBk0bOV6GUv4hlJsoqJtdYF
         d4L+cwTCoL+aC8TzCoKQAk04VbL0AT1GL/IooZrJ+ey/Ui3WDBOX7NEiAKkP7VOFvphf
         9XHA==
X-Gm-Message-State: APjAAAVn1+jjUADKOrHDVz8vqeyGBQkAX4up5806yyP+q1Yh6qajT8g1
        qjF6VlyBx9E7j9INrKUHKH08CAMhKMbhMoYEXGinpg==
X-Google-Smtp-Source: APXvYqydFREgMEMU+AQn3IiEa3czoGuVJrp1IkkDDa66+PMnGnH78dQEzKVhHerbCfURBGvH+0a/triro4n5Xwf8nyQ=
X-Received: by 2002:a65:64d9:: with SMTP id t25mr2933936pgv.130.1559820210239;
 Thu, 06 Jun 2019 04:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fa11f3058a69d67b@google.com> <1559811234.21928.9.camel@suse.com>
In-Reply-To: <1559811234.21928.9.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 6 Jun 2019 13:23:18 +0200
Message-ID: <CAAeHK+xGsOfKHdW8h5NQs-DQKXUUQW92ERnj5m7P=tvui-ZPuQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in device_del
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+93f2f45b19519b289613@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        rafael@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 6, 2019 at 10:54 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 03.06.2019, 04:41 -0700 schrieb syzbot:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    69bbe8c7 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1684d87ca00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=193d8457178b3229
> > dashboard link: https://syzkaller.appspot.com/bug?extid=93f2f45b19519b289613
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Unfortunately, I don't have any reproducer for this crash yet.
>
> Will this do?

Hi Oliver,

Unfortunately there's no reproducer for this bug. I've looked at the
fix, but I'm not sure I understand what it does. Perhaps expanding the
patch description would help, as it doesn't make the patch any more
clear for me. But I'm not familiar with this code, so if you think
this change makes sense and supposedly fixes this bug, then please
post it.

Thanks!

>
>         Regards
>                 Oliver
