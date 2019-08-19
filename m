Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 188D69249D
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 15:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727643AbfHSNSx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 09:18:53 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:40743 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbfHSNSw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 09:18:52 -0400
Received: by mail-pf1-f169.google.com with SMTP id w16so1166150pfn.7
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2019 06:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dn9InbMlNJnP/J89PJdJOt0EB+x70LPPcG7wq045G3s=;
        b=N22DUSGhBDlWbHMnR6w1z04lS1LBWFs4fPVAaTZqLXDgQT8IvMkGp2xi0+EiV3T8fp
         xCV3ldf0MVXJpApwjvG+y/vUlIvIyU2l46R7Et5JGxJ+KzaNlEq2Pvxk2oXaWU9HY8+T
         pY6IWnciUxcAbxt1MW4QeOO135BbUfRmIMREAizlaMqvG1dC5AnJkwgXWrvZcqTCPyqK
         1MQ/BpP+CjFuk0VS2AXdD1IqNXwdso1oocrn6V3FYpHocSpBhxwciXk+qr0Ru6YJWPos
         mnCyItqku7LSyv3Ad73v9PlGCLCSZT11FwzjoReMNMJ2OZ/LftlWudvs0rCL065r8Tkp
         /T5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dn9InbMlNJnP/J89PJdJOt0EB+x70LPPcG7wq045G3s=;
        b=AGRiv7AYX7yo6H421xwW+N+Vuxsv1T+gWgU7fiNO5SQtKl0ZNskCXtKjKsfrGzTNzP
         hi7VCOjPqdYKGjaZhrHN8qdXkxhCt47ekTOJeWnteuBTi31dDGf2Ht2CZZ8nCbV5zlbk
         8Bd/MW6+124INONGRRD3wpwwf1O+K9/lvQfMr6LnfQ1szVGtQYTjZwosa0PuDIaSfMqD
         qAKS5eiuOf73wvWF7i0LptBN1ZezJwe+7rvxGvlSk/UK1GAq0oQAw+QGpd/qNzalRp8g
         3e6AuzxshraQ7BNYF1tC1F21rWrX6TQamwubIrxGKXFjN6N7AJOM2ugAgeGYrKED9Hwn
         kX8w==
X-Gm-Message-State: APjAAAWWwv0TDW+GXJMSIW7TovIievL9SD6oJsq9fk2adF8sL7Cm9mZ3
        WO1pDmoQ7AoJnkd/OvdyX9u4WO8LA8+QaRni8qFlGw==
X-Google-Smtp-Source: APXvYqyMcyAzIRnFdOP/rgmCKUSxmuUL1H1EyFd00dgoSjLnWko8eULfJIX0mmPYFGRf/nOVv0hUAzQXGYHlZUvR2wM=
X-Received: by 2002:a63:c442:: with SMTP id m2mr20371049pgg.286.1566220731865;
 Mon, 19 Aug 2019 06:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a59094059013dd63@google.com> <1565875886.5780.7.camel@suse.com>
 <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com>
 <1566218263.5663.22.camel@suse.com> <CAAeHK+xX3vk_JoJ=2tHF__LECxNmPXuPMkxWz6u+K6L-MdN=9g@mail.gmail.com>
 <1566220164.5663.25.camel@suse.com>
In-Reply-To: <1566220164.5663.25.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 19 Aug 2019 15:18:40 +0200
Message-ID: <CAAeHK+wGzWGvW0AVSr6qA+AcpLr7A3Xi8wR7f-rBQJmMmQgU2A@mail.gmail.com>
Subject: Re: divide error in usbtmc_generic_read
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        steve_bayless@keysight.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com,
        syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 19, 2019 at 3:09 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 19.08.2019, 14:43 +0200 schrieb Andrey Konovalov:
> > On Mon, Aug 19, 2019 at 2:37 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> > > The original error was a divide by zero. The first fix fixed that
> > > but still another error showed up. If I propose a fix there are
> > > other possibilities besides it working.
> > >
> > > I could have no effect on the original bug or my fix breaks
> > > something else and KASAN is making no difference between
> > > those cases.
> >
> > I think you mean syzbot here and not KASAN. Do I understand correctly,
> > that you're saying that the original report was
>
> Yes, sorry syzbot.
>
> > divide-by-zero, but
> > when you requested to test the patch the reproducer triggered a
> > use-after-free, and syzbot didn't treat the patch you provided as a
> > correct fix?
>
> No, obviously there is still a bug. What I would like syzbot to have
> would be a third category: inconclusive.
> Seeing another bug instead may also mean the first bug struck
> before the second could ever happen. We just lack data to tell.

OK, I see. The exact words that syzbot uses in this case are "syzbot
has tested the proposed patch but the reproducer still triggered
crash". What would you like to see instead?
