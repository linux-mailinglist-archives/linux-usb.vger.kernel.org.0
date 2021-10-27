Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A8643C2FD
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 08:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbhJ0G37 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 02:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237090AbhJ0G36 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 02:29:58 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870E7C061745
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 23:27:33 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so2184208otr.7
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 23:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5MA0nKaJS7rcKDOA11AogxOix+nFaUOE1ImuxJcYDA=;
        b=dhBwKbOwAYMYUz8ceeSMwYnJ2lR/PGywrlD85bksuK1tiAvOCsz5t7EUX3S55FZL7S
         NXmERTWq28ZYUbGMQgpqMWmYOmpdBwB6RCyFKRzxoe8kUGfcPzOABUiFKPQabVVoJS82
         bDPe9hX/D2BrGGon2yVji4Sw4lObhibBHcOzmgwScrLLMloNkUC1XqgvyAD7UuHbIGNV
         UZBeunMcN8aNQRTbfFgkAC0BMZ92ZesLNIt2zRy32nhHA+11LmajHRjqgrMjE/Avtynj
         /xcsEJV7uL/jozYEJRXrPVgHFNYCR3G9FPcYjqJVM9FtaekepPuofAeYuESJUq5ztK+S
         MA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5MA0nKaJS7rcKDOA11AogxOix+nFaUOE1ImuxJcYDA=;
        b=M6hA6sI08C309+HZIG+cO6JH2hXcL4ke99Wu/lgdTPuRtL3mgYdLHGj0gZt0dYWZV6
         ogeF46oGT2jzpJ12Q/07LFxsd4HQJzI9OX+ilos5q4/e37AE2PNz7BWdDzAvlmBk8eDr
         UPkO0PrD/+28/E8MO7o/704wypqS8JgpBUAtczFAVqNrvNjpRgjNH0huOrY7OVKjn1cw
         82LBg9X6ZgVnqTG2r1cQbP5OFgJipWZKnDK/26MPqx7N2GjnuA+ha31huvs0WwHzg/79
         OV+NYbqT7ykM2BuhZbtxiMDS3gJYVZFDpT7eAis9shkLxjQK1T4JjcYwTPP7jiQTx15o
         8cvA==
X-Gm-Message-State: AOAM530yT0xkn80GBxa0ldBU2iX1JF5bL3tcueahVXOXZrTARLNnb+tb
        VQLztp1vMRpmSMG/lXTvbBq9FA4qJ2G3FYOU4J5aPg==
X-Google-Smtp-Source: ABdhPJy2xK1uraUN/Ksh8TjZCc0phOz1L3tGsEYpRQ7MnWJpQbgphMlWiHyYTyBBsJeRe1zFo7HaIOtHHY2HTKDnUGw=
X-Received: by 2002:a05:6830:1acc:: with SMTP id r12mr3925895otc.196.1635316052608;
 Tue, 26 Oct 2021 23:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c87fc005cef26865@google.com> <ade6c05e-fe82-c61a-bf02-8c8fcd918a75@suse.com>
In-Reply-To: <ade6c05e-fe82-c61a-bf02-8c8fcd918a75@suse.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 27 Oct 2021 08:27:21 +0200
Message-ID: <CACT4Y+ZQOrbeT5_Z+DnUskQkX94ztc+bQ0O=SYa1LgV0mswBAg@mail.gmail.com>
Subject: Re: [syzbot] INFO: task hung in sisusb_open
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+fd9d03311cdce9a9ec36@syzkaller.appspotmail.com>,
        andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, thomas@winischhofer.net
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 25 Oct 2021 at 16:40, 'Oliver Neukum' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
>
> On 22.10.21 17:10, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    2f111a6fd5b5 Merge tag 'ceph-for-5.15-rc7' of git://github..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15a3aaf0b00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=61f4d9af07d3bbdf
> > dashboard link: https://syzkaller.appspot.com/bug?extid=fd9d03311cdce9a9ec36
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d4e9fcb00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1444ada4b00000
>
> Hi,
>
> do I understand the reproducer correctly in that it just creates a
> device and then
> does nothing?

Hi Oliver,

Yes, it looks like it connects some device and executes some handshake
sequence and then does nothing beyond that.
