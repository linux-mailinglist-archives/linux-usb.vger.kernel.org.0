Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1A48619C
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 14:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732372AbfHHM2G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 08:28:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46122 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbfHHM2G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 08:28:06 -0400
Received: by mail-pg1-f196.google.com with SMTP id w3so6789179pgt.13
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2019 05:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/W3w/wF9Y9te3JMoVhcMehzwVrt1opOlejjt4rI4AE=;
        b=JmSzOXhD6xc1Qb7v1wEp0V2tWsNPh5fGFF88h2zu1ElMyG3KgLjylsdyOnqWGZcItc
         tP4YvMgsCHqHZw69kNyc6Rx5xdexwEjo/lVa3NrHAjIz+jGBsC7JjYHIXPlqH00+U9Rj
         vo4g0Iy6lZlXwSvj1LG4dxvGz4gc/mh0fkZaFnckVQDHcmWHPqGX2C9hM5/PiFpv+9tp
         uqJiPobqcNkiB2JdQ5mmWLwuAideQaaIl7SelOD5YfUny7fvj7TURoAR9qIxlNXNxy5x
         HT8InMsW/bOjtbJ9dH1E+229QEILOJtHjCeDt0Xh5O0NaoD+C/jOboe4sQj6NhekP3zc
         yxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/W3w/wF9Y9te3JMoVhcMehzwVrt1opOlejjt4rI4AE=;
        b=WEfY8fkeAkqKBwUTbMWYHDV5hT2fqJyHH02U0CAyHE9vmFfvYPvlCgRCQPWc4wu4Rc
         aR7teRtwCQpGw0P6z8sQsGlm0JT+uO+sgYBCW9O5SPKoiOpqA5Qkmx1HeDijwHYVRm1p
         fkjv7bVcULOJyBicM6405XcvNV7RHYDTuKkc3xOD5a7HqAXZ9GkiqC7zOvTW3LenvCbY
         +UO74E5k0R9O9gLn8zSeyyjBFg5tozFk+ouODfNDpeShWm+MALgnpHfj8xGFf38216wL
         HL1Iq6HF8s8UNP/9KM2t7INE4LvPS57CmFHB2+k1EkIEh/eW/d7/BajXx/lJod88itIR
         52iA==
X-Gm-Message-State: APjAAAUelovq9STbT/YrYJSqJ3YbDnumZKnbKZ3UgTwlU4LwCWi/RF9L
        fHSJsFsDgZIlWiFrJ3ViIpq/g/O8aeqKV88LRKgMQg==
X-Google-Smtp-Source: APXvYqwBefv4nXxVQmf02Ua1Yjn/KM4I7FhvNpXklH3IAgqyIJc+slSG3DgWRSLRO89JnCmOD5IciFA0UJhEIpUeIl8=
X-Received: by 2002:aa7:9e9a:: with SMTP id p26mr15547168pfq.25.1565267285478;
 Thu, 08 Aug 2019 05:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f365b6058f8b07ca@google.com> <Pine.LNX.4.44L0.1908071431050.1514-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908071431050.1514-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 8 Aug 2019 14:27:53 +0200
Message-ID: <CAAeHK+xh6h=HBEpwPB7g2=a07+zZ9zS5Cuk0Tpo_+70Bf5j9Tw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in device_release_driver_internal
To:     Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 7, 2019 at 8:31 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, 7 Aug 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger
> > crash:
> >
> > Reported-and-tested-by:
> > syzbot+1b2449b7b5dc240d107a@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=132eec8c600000
> >
> > Note: testing is done by a robot and is best-effort only.
>
> Andrey, is there any way to get the console output from this test?

Dmitry, would it be possible to link console log for successful tests as well?

>
> Alan Stern
>
