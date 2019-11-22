Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B1A1068A6
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 10:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfKVJLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 04:11:16 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33480 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVJLP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 04:11:15 -0500
Received: by mail-qt1-f195.google.com with SMTP id y39so7067795qty.0
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2019 01:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PUF89Spz+I3IwaGtyhwNTrOvec1IV32n2jR10nFSmJA=;
        b=Fq07sCmH8omGdMLCL5ZQ2sciW6S3cesrs3mRWoR9ICWO/cGiGX/ZdTGQFqcwnLbj2b
         hRa99PMUFrNb34F5vCZCQqRLyP4SQRTaZQhgvl6DczcWIIytlRXRxH8E7LsuHIz+x+Sv
         kMgxkAjFf6pGehdZNOUj+WnptwWdJRofaxou6DPN+vgQ3xRlh6uzupWck5FJx6yRx5rc
         8ZKRnI0DXZpY08u0H3JLolhn+ukBIyhASLLyPAmQnOt7RWKBZNUtVL6QgkHCCobtV7dk
         sqkh92SRjgL5I/9uQtWARX+Ll1a1BV4oviJOHnQ8mQSqEzW8kosZOiOGJnOQqJZnsghV
         NRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PUF89Spz+I3IwaGtyhwNTrOvec1IV32n2jR10nFSmJA=;
        b=XmpY+GOTZ4kuQpnirzMLxVuCkucLmUQI9zdXm7VcBLfYoX32gxOloIssYg3n/3iFBz
         F7UUdkFnxoEhn8emZ1vSN8bUHn2jD3Etx4hIJtrA5MAbfzPXqQ+vYhD37BwQDm11tG7Y
         WPXN8kbO0+aZOvsp+F+St5B7x6Wdrc/NdlpuN//jwDptlBrl/SdkAXOXPf8A0XLJhL9U
         vWjEPQeAn+SBG87kJQ4wEZR/x1ZN5UpRcTCrTdzFecAFSJiLNWOwE11/xSJFWZidZrAs
         1E2qL/+kF6xXxOp8aze6ZuKl+xm0IO94o+uZ6MPJyIdyxxeyDl9h1L+1D8NX0tTaAbFl
         t/8A==
X-Gm-Message-State: APjAAAV0RDTx0MWEu0lkTBzI8j02UIf4U0tqFgTqKkNpefjR/KgzcJKo
        rTh/czcmGrB6see7cG9BrLEjtCJdVYKxm+rX0Hhq0A==
X-Google-Smtp-Source: APXvYqy7eir2iCy4oXyTZIG/GM903RGHTNPgyHqtVzan+76pSUsQak6gQaVlkr3G7zcVXotXGpKvf65OmQN4fZAlJFA=
X-Received: by 2002:ac8:610a:: with SMTP id a10mr2311954qtm.50.1574413874413;
 Fri, 22 Nov 2019 01:11:14 -0800 (PST)
MIME-Version: 1.0
References: <00000000000076092b0597cedce2@google.com> <1574334450.14298.53.camel@suse.com>
In-Reply-To: <1574334450.14298.53.camel@suse.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 22 Nov 2019 10:11:03 +0100
Message-ID: <CACT4Y+b1x-0yeY6HrZ3ZL4iP6hcNupD15uNNiFqx45LjDZgJ_w@mail.gmail.com>
Subject: Re: INFO: task hung in wdm_flush
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        bjorn@mork.no, USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 21, 2019 at 12:07 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Mittwoch, den 20.11.2019, 14:40 -0800 schrieb syzbot:
> > Hello,
> >
> > syzbot tried to test the proposed patch but build/boot failed:
> >
> > failed to apply patch:
> > checking file drivers/usb/class/cdc-wdm.c
> > Hunk #1 FAILED at 587.
> > Hunk #2 FAILED at 596.
> > 2 out of 2 hunks FAILED
>
> This is unexpected.
> >
> >
> >
> > Tested on:
> >
> > commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git
>
> If I do a git am on the branch usb-fuzzer-usb-testing-2019.11.19,
> the patch applies. Which branch do I need to backport to?

Hi Oliver,

You give exact tree/base commit when you ask syzbot to test. It does
not do any second guessing.
Well, if you provide a tree+branch then it's a bit of chasing a moving
target b/c HEAD can be updated meanwhile, but you can also give it
tree+commit, then that's 100% fixed.
