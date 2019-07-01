Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACBC5C252
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 19:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbfGARwa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 13:52:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34391 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbfGARw3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 13:52:29 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so576604wmd.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2019 10:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AGl6tpzNUwBNU+004qG7Aoe5jhgRv8Fl08pRpaH2BRQ=;
        b=1dZuq0CA6YMQHDkH/+3Y2Ob2+wmd91RPiqr7t9LbtErRTH3gC39XhoBDBfcf5KLQOb
         lcOdoJ8Ae4PzadQve5WzBoItNZMKRMvJuyNlsJFY8IUIVVMM1durOhcfQe3SQQE+htNb
         L1UQ8+iaOc5V8st7EMTuKwKk64jpd9pkiPaPUvowZ+BUL1mJLCv05xunTnO+fyRNmYGO
         3MWWgJ4708abVqmONwrR6yvM83HZ08FQ6k0zALO8atb8It6YcZhxG+WBJIE74YVMkhUB
         B5jgzxqSxSL29sA8GramEjh+0sCpQPMW+Oos6zaak/iAJQDBdePUFkGE8e7XF6BLA3SY
         XjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AGl6tpzNUwBNU+004qG7Aoe5jhgRv8Fl08pRpaH2BRQ=;
        b=MA99iSl8JXUx3pPbjOAjjVgp73m9ZlOq98RDP7/sywVAwzqgfO1dwR3pmsyMo88m4V
         gJiLvCQY6icxIxRkPwvXvYm/c23F4LV2G25UxidSbB7BRpB3WyvTzLa0gedaXhQATCUn
         sIebMXxA1v8xLkNXtl98b0+KrZEeAXPSpBB38otP2G2OIXeHfb83H1zIzBzhHZZYNf2Z
         L8nUkt1yzyT4A3td1alW3HkQaKf+hEXpTCWycRRJ+B8UnphKcFxc4uyJoDHtENgvvX6C
         2u4QzhpHkEwls4IPMbVztZk/Be3cnQIDIFrh6t1YDb6KiXfM7iTOfqfsb7pYiEo7VeXV
         JWNQ==
X-Gm-Message-State: APjAAAUcG5NqTTKePdpnamzkwipexLg1JwD9Jk3bWcxxM+QmYCx9ZPfE
        2ZadhpUUYt4Jlkl/U6y2KJpJzQ1oSrI=
X-Google-Smtp-Source: APXvYqxpLK/wllJ9d2zrPyZKJ0DNbCU8reC/cYYwOyPlMbm+h0jBULB4/chqw0/CQO82j6b46pqiMg==
X-Received: by 2002:a1c:107:: with SMTP id 7mr310619wmb.84.1562003547222;
        Mon, 01 Jul 2019 10:52:27 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id z1sm11828361wrv.90.2019.07.01.10.52.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 10:52:26 -0700 (PDT)
Message-ID: <3e7662d1391346dd11a903e66e7a8936ca83dba9.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Date:   Mon, 01 Jul 2019 19:52:22 +0200
In-Reply-To: <Pine.LNX.4.44L0.1906171259500.1738-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1906171259500.1738-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno lun, 17/06/2019 alle 13.28 -0400, Alan Stern ha scritto:
> On Mon, 17 Jun 2019, Andrea Vai wrote:
> 
> > Il giorno lun, 17/06/2019 alle 12.14 -0400, Alan Stern ha scritto:
> > > On Mon, 17 Jun 2019, Andrea Vai wrote:
> > > 
> > > > [...]
> > > > 
> > > > That happened ALL times, so I never encountered a kernel that
> made
> > > me
> > > > say "git bisect good".
> > > 
> > > Really?  That strongly suggests that the 4.20 kernel also should
> > > have
> > > been marked bad.  Did you really test it exactly the same way as
> all
> > > the others?  That is, did you go through the entire procedure
> > > starting
> > > with "git checkout v4.20", then running the build script, then
> the
> > > reboot and "uname -a", and then the test script?
> > 
> > well, honestly, no, because (sigh) I didn't know the "git
> checkout"
> > command, sorry. I started with building 4.20 from the source
> > downloaded with
> > 
> >  wget 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-4.20.tar.gz
> > 
> > , then said "git bisect good v4.20".
> > 
> > Is this different from "git checkout v4.20"? I hope it is, so we
> have
> > found the mistake I have done.
> 
> In theory the results should be exactly the same.  But it doesn't
> hurt 
> to check.
> 
> > > Compare the mainstream 4.20 kernel with the Fedora 4.20.13
> kernel.  
> > > Also, maybe compare the mainstream 4.20.13 with Fedora's
> 4.20.13.
> > 
> > Sorry, what do you mean here by "compare"? And what is the
> > "mainstream"? If the mainstream is the one I got with wget, and if
> > "compare" means "see if they behave differently", so I have
> already
> > done it and they are both "good".
> 
> I was trying to point out that there may be a significant difference
> between 4.20 and 4.20.13.  But if you say 4.20 behaves well, this 
> doesn't matter.
> 
> At any rate, you are some commits you could try (beginning with
> "git 
> checkout <commit>" and then running your scripts):
> 
>         c76cd634eb5b
>         b1669432b355
>         507413a5f88a
>         a52fb43a5faa
>         38fabca18fc4
>         fc2fd5f0f1aa
> 
> These are all between 4.20 and 5.0-rc1.

Hi,
  these were all "good".

Then I ran another bisect (the sixth (!), more carefully, starting
from

git bisect good c76cd634eb5b
git bisect bad 241e39004581

), and it seems to give some consistent result.

I found that:

f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6 is the first bad commit
commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
Author: Jens Axboe <axboe@kernel.dk>
Date:   Thu Nov 1 16:36:27 2018 -0600

    scsi: kill off the legacy IO path
    
    This removes the legacy (non-mq) IO path for SCSI.
    
    Cc: linux-scsi@vger.kernel.org
    Acked-by: Himanshu Madhani <himanshu.madhani@cavium.com>
    Reviewed-by: Hannes Reinecke <hare@suse.com>
    Tested-by: Ming Lei <ming.lei@redhat.com>
    Reviewed-by: Omar Sandoval <osandov@fb.com>
    Acked-by: Martin K. Petersen <martin.petersen@oracle.com>
    Signed-off-by: Jens Axboe <axboe@kernel.dk>

:040000 040000 312373927bae1c6fd1da40ded2c12dfa5e4de71c 4eccbd2c84bf83cb2eb72a81514d59ebf12866b7 M	Documentation
:040000 040000 98de24b4fe20b82095f53f56c9193c5537d70ed0 8e2092780100205ae1c3723a598a89794a50677f M	drivers
:040000 040000 fbc10c84d3eb6b7933598018319f96767ee3a0f3 2523940c2819e8adb32758f5093e477da481ca65 M	include

I reverted it and the test succeeded.
Then I made a double check: "git clone" again; git checkout
3a7ea2c483a53fc89e336f69c6ee1d7defe00811 (the last good), and the test
succeded. Then git checkout f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
(the first bad) and the test failed; then reverted it and the test
succeded again.

Does it make sense?

Thanks,
Andrea

