Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7ABB3C476
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2019 08:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391260AbfFKGsU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jun 2019 02:48:20 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38424 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391233AbfFKGsU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jun 2019 02:48:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id d18so11594961wrs.5
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 23:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unipv-it.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uCSMMpjVp+n8RVynvtFQmd5yno8u/xvHbuDxjIjlf3Q=;
        b=yCwu1b6oseIGNCa4ENrVZ2NJqG8vdmCdk4372HQsZxThmi+0gwT6777tOlLZIyJwVX
         oLpGuMQsgO6WNKM4F3+3w9nudoOq5/d32qxypEX0uVJCAQNKgwuypnqnh+CrjYkx/pWU
         4KCZUM50M1XOzM0yGqyvT4utDtdRvpT0u6nsvwDfnO6ALpFP1+Cxu0w+g5J+dPGSHbnq
         D0ubYm2XJF9xfiwylohvY/uV28qQ4KZW03bor1wOdh0dXsSOgM2lcKHy3epj743Ms3Wq
         69E5Mc/t2wF+4muHWkbDHJpAETfGksyW0k7NS/eudVSPrfSkShQdcV7//q2aMX8jbmGd
         p8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uCSMMpjVp+n8RVynvtFQmd5yno8u/xvHbuDxjIjlf3Q=;
        b=jo6fK2Ts7+fmpS1w89E+I1Au8KbfAOTdhKRHo0ZoRdYH4volYs33LerP6BaUsbO2DR
         +m+qjuuqpiq5bZ1jd0hqvjEdxGCEZcj4OGSeAqN8GI1j8jTr19AlAS+GmCq1S7e4qtWC
         FCaHeU8F2hjsDKqZ65MklbCONlFavDO8DLBH2NR/C5ghMiYkfN2EHGtGWxuiQx3n+HgD
         lMqIVsS0zTlD+Ui8F0R6wtAP3lRKvF+xPrHgUV2wADgYtI4woppeAKOCDEqL2r6Tg70c
         nJ0pXo1ov80Fnzh0E0PtNY/3IXMjDK/mFX72xCDjvEbKlwD2zpX4R4eBsaWh7qGxudmV
         lAjA==
X-Gm-Message-State: APjAAAXbJl7s4P8FgQnalc0YzcSgcpb0Llmm2oHfzA6NrZ66Eky4cB2H
        iIbTkUlFacXpCDSDgL99ZoHVc2ZjWZM=
X-Google-Smtp-Source: APXvYqz8STQGkz2dY+8TrA1J8S71d9VHxL2dXbV7YlNvShDrjEPjJrQKmAF7wP1XT3zGRPFX+71bZg==
X-Received: by 2002:adf:f508:: with SMTP id q8mr20503396wro.299.1560235698182;
        Mon, 10 Jun 2019 23:48:18 -0700 (PDT)
Received: from angus.unipv.it (angus.unipv.it. [193.206.67.163])
        by smtp.gmail.com with ESMTPSA id 74sm1554648wma.7.2019.06.10.23.48.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 23:48:17 -0700 (PDT)
Message-ID: <a0039fb3590832e4fbb0b036281411a846296fcc.camel@unipv.it>
Subject: Re: Slow I/O on USB media
From:   Andrea Vai <andrea.vai@unipv.it>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 11 Jun 2019 08:48:16 +0200
In-Reply-To: <20190610143821.GB30602@kroah.com>
References: <20190604054300.GE1588@kroah.com>
         <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
         <20190605145525.GA28819@kroah.com>
         <0c2adde7154b0a6c8b2ad7fc5258916731b78775.camel@unipv.it>
         <463fb315f901783543c3bd5284523912c3c31080.camel@unipv.it>
         <20190605173902.GE27700@kroah.com>
         <b159e1518b670d4b0126c7671c30c8c3cb8fffbc.camel@unipv.it>
         <20190606144757.GA12356@kroah.com>
         <CAOsYWL03ALs6xJxcbDeppwtY9Q3v-vW6ptjK18CzL0RtJfboBw@mail.gmail.com>
         <CAOsYWL2z=Rddvu62DP+QdQOf=4FwygmLrOPS0rJ8Uc+OzLKQvA@mail.gmail.com>
         <20190610143821.GB30602@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il giorno lun, 10/06/2019 alle 16.38 +0200, Greg KH ha scritto:
> On Sat, Jun 08, 2019 at 11:29:16AM +0200, Andrea Vai wrote:
> > Il giorno sab 8 giu 2019 alle ore 09:43 Andrea Vai
> > <andrea.vai@unipv.it> ha scritto:
> > >
> > >[...]
> > >
> > > Hi,
> > >   there is also something else I don't understand.
> > > Every time I build a kernel, then after booting it "uname -a"
> shows
> > > something like
> > >
> > > Linux [...] 4.19.0-rc5+ #12 SMP Sat Jun 8 00:26:42 CEST 2019
> x86_64
> > > x86_64 x86_64 GNU/Linux
> > >
> > > where the number after "#" increments by 1 from the previous
> build.
> > >
> > > Now I have the same number (#12) after a new build, is it
> normal?
> > > Furthermore, "ls -lrt /boot/v*" shows the last lines to be
> > >
> > > -rw-r--r--. 1 root root 8648656  8 giu 00.35 /boot/vmlinuz-
> 4.19.0-rc5+.old
> > > -rw-r--r--. 1 root root 8648656  8 giu 09.08 /boot/vmlinuz-
> 4.19.0-rc5+
> > >
> > > and "diff /boot/vmlinuz-4.19.0-rc5+.old /boot/vmlinuz-4.19.0-
> rc5+"
> > > shows they are identical. Why? I expected that each bisect would
> lead
> > > to a different kernel.
> > > Assuming that the opposite can happen, does it mean that when I
> say
> > > i.e. "git bisect bad", then build a new kernel and see that is
> > > identical to the previous one I can run "git bisect bad" without
> > > booting into the new one and even making the test?
> > >
> > > Another thing I don't understand is that I told 4.20.0 to be
> good, so
> > > I would expect that I don't need to test any older version, but
> as far
> > > as I know 4.19.0-rc5+ is older than 4.20.0, so why is it
> involved in
> > > the bisection?
> > >
> > > I had to "git bisect skip" one time (the kernel did not boot),
> but as
> > > far as I know I don't think this could be related to my doubts.
> > > [...]
> > 
> > Update:
> >   I have concluded the bisection, found that
> > "9cb5f4873b993497d462b9406f9a1d8a148e461b is the first bad
> commit",
> > reverted it, and the test still fails (btw, the final kernel file,
> > /boot/vmlinuz-4.19.0-rc5+, does not differ from the previous one).
> > 
> > So, all my doubts above are still there (and growing). What I am
> doing wrong?
> 
> Are you _SURE_ that a 4.20.0 release actually worked properly for
> you?
> Did you build one and do your tests?  Or are you just relying on
> your
> Fedora build still?

Yes, I am really sure of that, and the definitive proof is that since
I stopped bisecting I made the 4.20.0 the default boot kernel, and all
my backups are done "quickly" (12min to create a 12GB archive).
Furthermore, "uname -a" shows

Linux 4.20.0 #1 SMP Thu Jun 6 22:32:29 CEST 2019 x86_64 x86_64 x86_64
GNU/Linux

To have one more evidence, I started the test while writing down this
sentence, and it has just finished in one minute and a half (1 GB file
copy).

I will go on following your other suggestions; by the time, thank you
for pointing this out,

Andrea

