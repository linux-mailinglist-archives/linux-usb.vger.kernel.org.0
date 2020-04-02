Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEDD419C699
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 17:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389696AbgDBP5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 11:57:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39355 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389294AbgDBP5N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 11:57:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id k15so1945574pfh.6
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2020 08:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+f7ztlhRO8KaQ2k4S8l5uJ9SeBU7fnG5Wf7hP3kHn5I=;
        b=t/FWoThdyFUJcn5JyvLffbYUxmclqELwOEsrwOd2uo7tYHH4mWliWdd529c/gCoqTl
         DasIyU8bEjLQVPkGwY/CfG5j1lNOaqqPfnvDh8lf8KXX3uWf2SUGFx0Uesy5lZGlwhNv
         JUm9o7hlcqm5Kxd8tQxwAxgT9xv1FN1J1SPskxdeUnxLsReMUoXXbg2tggHm3Sw1CzfM
         ZubsHrvBIe3AR54sJqMwg8q/zDViiTW/3ftJGMZ6sbYsAgfSkPnucgkD0q0fKGJuTPhu
         BFoNFt2MqauRK8lW0MK+FI2yBcCHPbHaH0DK0geP/L7zSjYAWmLxuVHiclbaBkH/HRB/
         vphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+f7ztlhRO8KaQ2k4S8l5uJ9SeBU7fnG5Wf7hP3kHn5I=;
        b=HDK8SeQ7kPxm1DEav3X2v65ZbIR5WEXeN7qccB2HxJi3yx7GRdN5xraX38XvysD1bg
         dVuhToHO03CMQpMUq+1liH42Hil5wNQZS7LbnIqXbXpUTyVr5cezn3cQHayaZnoatcTh
         AqOy/C2aMhYUdjhIGRy5sa6v+IhGznIGfGgMeT9R0IF+55ST6wvNvs9pJroxhRwF5k8u
         wPtweMr2gr31q/ZYwralrQeJK2+Omfh3HgKuq3F7e4yTphXBn8pl2D9cvisnKwPt5OeP
         GQc5DFHxuYdkZ3ds7EPpy2eYTt0BH2mrmyvp71npb/S7m2GhVIPlam2eeCEMl6F6f0QQ
         9tcQ==
X-Gm-Message-State: AGi0PuYX7Gop7d0A1oKH8fji4mD3dYeK9IaC461h53sYOY2iMScc9IgS
        0lxxYQBaqPJCs0+acuESQULvNSAGllLEmg1iq7vNhA==
X-Google-Smtp-Source: APiQypIhP5QcwIz3sGFRAXhXluVx9mRCbbCvr8u6mvQedlVnjNdfX1RFcNXG1rVCWGnm8fwdhv0VxysfCl6L7qILleI=
X-Received: by 2002:a63:f411:: with SMTP id g17mr3872394pgi.440.1585843031627;
 Thu, 02 Apr 2020 08:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.2004021133440.13377-100000@netrider.rowland.org> <000000000000c3793205a250cb6a@google.com>
In-Reply-To: <000000000000c3793205a250cb6a@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 2 Apr 2020 17:57:00 +0200
Message-ID: <CAAeHK+wpZ3t-1WFr9Tyt51HFP+m=umFz_=EKcNAGif1Ekyf=gQ@mail.gmail.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
To:     syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ingrassia@epigenesys.com, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: multipart/mixed; boundary="00000000000092a98705a250dae5"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--00000000000092a98705a250dae5
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 2, 2020 at 5:53 PM syzbot
<syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger crash:
>
> Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
> dashboard link: https://syzkaller.appspot.com/bug?extid=db339689b2101f6f6071
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=143c2c63e00000
>
> Note: testing is done by a robot and is best-effort only.

Let's try this once again, maybe the reproducer is extremely unreliable.

#syz test: https://github.com/google/kasan.git 0fa84af8

--00000000000092a98705a250dae5
Content-Type: text/x-patch; charset="US-ASCII"; name="usb.patch"
Content-Disposition: attachment; filename="usb.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8ixzckk0>
X-Attachment-Id: f_k8ixzckk0

SW5kZXg6IHVzYi1kZXZlbC9kcml2ZXJzL3VzYi9jb3JlL3VyYi5jCj09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIHVz
Yi1kZXZlbC5vcmlnL2RyaXZlcnMvdXNiL2NvcmUvdXJiLmMKKysrIHVzYi1kZXZlbC9kcml2ZXJz
L3VzYi9jb3JlL3VyYi5jCkBAIC00NzUsOCArNDc1LDkgQEAgaW50IHVzYl9zdWJtaXRfdXJiKHN0
cnVjdCB1cmIgKnVyYiwgZ2ZwXwogCiAJLyogQ2hlY2sgdGhhdCB0aGUgcGlwZSdzIHR5cGUgbWF0
Y2hlcyB0aGUgZW5kcG9pbnQncyB0eXBlICovCiAJaWYgKHVzYl91cmJfZXBfdHlwZV9jaGVjayh1
cmIpKQotCQlkZXZfV0FSTigmZGV2LT5kZXYsICJCT0dVUyB1cmIgeGZlciwgcGlwZSAleCAhPSB0
eXBlICV4XG4iLAotCQkJdXNiX3BpcGV0eXBlKHVyYi0+cGlwZSksIHBpcGV0eXBlc1t4ZmVydHlw
ZV0pOworCQlkZXZfV0FSTigmZGV2LT5kZXYsICJCT0dVUyB1cmIgeGZlciwgcGlwZSAleCAhPSB0
eXBlICV4LCBlcCBhZGRyIDB4JTAyeCwgcGlwZSAweCV4LCB4ZmVydHlwZSAlZFxuIiwKKwkJCXVz
Yl9waXBldHlwZSh1cmItPnBpcGUpLCBwaXBldHlwZXNbeGZlcnR5cGVdLAorCQkJZXAtPmRlc2Mu
YkVuZHBvaW50QWRkcmVzcywgdXJiLT5waXBlLCB4ZmVydHlwZSk7CiAKIAkvKiBDaGVjayBhZ2Fp
bnN0IGEgc2ltcGxlL3N0YW5kYXJkIHBvbGljeSAqLwogCWFsbG93ZWQgPSAoVVJCX05PX1RSQU5T
RkVSX0RNQV9NQVAgfCBVUkJfTk9fSU5URVJSVVBUIHwgVVJCX0RJUl9NQVNLIHwK
--00000000000092a98705a250dae5--
