Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE163C6071
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 18:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233812AbhGLQ2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 12:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233815AbhGLQ2C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 12:28:02 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D67BC0613E8
        for <linux-usb@vger.kernel.org>; Mon, 12 Jul 2021 09:25:14 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id j14so8790005qvu.6
        for <linux-usb@vger.kernel.org>; Mon, 12 Jul 2021 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PmE/zTPLhqu2MwEFxlpoKgQwV3qppCypKqITXTNYSl0=;
        b=qjLc934IdZ6gPJR+v7nXbzJLAtJaHMy6Vig2rK9PbbnaHiag2CM0Qn41/zLFfVpWWQ
         uES1oo5NhjIY9MVf8NuG3Atq0AzPRbD8pg0OJ1Eu2OLk49cyG7fmX1a8I8e5ye4k88C3
         StaIQ08tPItlkkt9fSajpYYnd1NWJ2CaLW+rHgWR8O/cMQxJzqL03baqN6zWMuMQ2lIo
         gHZpGxFjdCo+h0F6BrH5bm9kAxko8vxXetZWytMGpFk2SYTV9V66odqLhAi5Dgh/dKDm
         EBCf9xhwqE0YCnL9k9LvAoJq4ilYMhXkW4HKSgPIqaGF/hNYmh7dm6V6mMo3jhOfYAsK
         W1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmE/zTPLhqu2MwEFxlpoKgQwV3qppCypKqITXTNYSl0=;
        b=ktA2O03SIzk2dTZVDn2/G0ZxlmLzDsEECprt6QKBO+DoSHiU+srdd8hqL6mv+GXP3l
         ZxzJXB7Dlt3YuckmO7EunVlTOYaKuqEG4uNzb+Jv/WRBc4iCE8oZUyyXTlzYl3v6UjXs
         YkGZbsthE/P25qcP0XRNYHFA13duRr+acrlUuU8kV4xmOosdJjf+FYAjdOhbgUlg1JT3
         s0erQ3Dahk1TL4vRfz6/7w4tZLKqO57a/Ys7SeJckePf1tS1rd05TPcLVFSHYhmihWP0
         vM0CruERUDMEOwEIliEKBn7i6alTnXxP3k5J6mF6m+zCy60GPHl5OVFre+l3mzFxXqCs
         0pgw==
X-Gm-Message-State: AOAM533PyW7t0DFSqTZh5AZkh05m/ehlDj9vNr66X8+7upJa+feltSiX
        JFBSxfutBhXyD1idpn3C/3giXoJ120wrzYorZZaf0Q==
X-Google-Smtp-Source: ABdhPJwhTrr+ozRbMtPevgV8w9OFMzoNPIsHXwmKh9Zr/tbizW3664354sf2TVwBpmW9IaEBDMcfTHJIoU8EvhWuJyE=
X-Received: by 2002:a0c:f745:: with SMTP id e5mr19244486qvo.44.1626107112990;
 Mon, 12 Jul 2021 09:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210711155345.GB293743@rowland.harvard.edu> <00000000000068b24405c6db3249@google.com>
 <20210712140004.GA316776@rowland.harvard.edu> <YOxf0OvoGOvWf14m@hovoldconsulting.com>
 <YOxk0URZrLYv8SNU@hovoldconsulting.com> <20210712161445.GA321728@rowland.harvard.edu>
In-Reply-To: <20210712161445.GA321728@rowland.harvard.edu>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 12 Jul 2021 18:24:43 +0200
Message-ID: <CACT4Y+biD8AdKncmvqmaz3dytV-zoeo==rdkTSJvaZ9=RUs=UA@mail.gmail.com>
Subject: Re: [syzbot] WARNING in do_proc_control/usb_submit_urb
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Johan Hovold <johan@kernel.org>,
        syzbot <syzbot+72af3105289dcb4c055b@syzkaller.appspotmail.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 12 Jul 2021 at 18:14, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > Hello,
> > > > >
> > > > > syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> > > > > WARNING in do_proc_control/usb_submit_urb
> >
> > > > I don't get this.  It shouldn't be possible.  The fact that the
> > > > direction bit is set in both bRequestType and pipe means that the URB
> > > > was submitted as a control-IN but had length 0.  But the patch addresses
> > > > exactly that case:
> > > >
> > > > --- usb-devel.orig/drivers/usb/core/devio.c
> > > > +++ usb-devel/drivers/usb/core/devio.c
> > > > @@ -1133,7 +1133,7 @@ static int do_proc_control(struct usb_de
> > > >           "wIndex=%04x wLength=%04x\n",
> > > >           ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
> > > >           ctrl->wIndex, ctrl->wLength);
> > > > - if (ctrl->bRequestType & 0x80) {
> > > > + if ((ctrl->bRequestType & USB_DIR_IN) && ctrl->wLength) {
> > > >           pipe = usb_rcvctrlpipe(dev, 0);
> > > >           snoop_urb(dev, NULL, pipe, ctrl->wLength, tmo, SUBMIT, NULL, 0);
> > > >
> > > > and causes the kernel to handle it as a control-OUT instead.
> > > >
> > > > Johan, any ideas?
> > >
> > > Did syzbot actually test the patch? I can't see how the direction bit of
> > > the pipe argument can be set with the above applied either.
> >
> > It looks like the second patch you submitted was hand-edited and still
> > quoted.
> >
> > And looking at the dashboard it seems like no patch was applied for your
> > second test attempt:
> >
> >       https://syzkaller.appspot.com/bug?extid=72af3105289dcb4c055b
>
> Yes, that explains it.  Funny how easy it is to miss those "> "
> markings -- you just get too used to them.
>
> > I've been bitten by something like this before when erroneously thinking
> > that a test command could be submitted as a reply to a patch.
> >
> > Perhaps the report mail could include the patch tested or something so
> > we don't spend time investigating syzbot interface failures.
>
> Good idea.

The email always include the patch tested (as syzbot parsed it), see
e.g. earlier reply in this thread:
https://lore.kernel.org/lkml/00000000000074f06705c6ccd2a4@google.com/



> Anyway, here's the patch again, this time properly formatted.  Hopefully
> now it will work.

syzbot parsed this patch successfully:
https://syzkaller.appspot.com/bug?extid=72af3105289dcb4c055b



> Alan Stern
>
>
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git ee268dee
>
> Index: usb-devel/drivers/usb/core/devio.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/devio.c
> +++ usb-devel/drivers/usb/core/devio.c
> @@ -1133,7 +1133,7 @@ static int do_proc_control(struct usb_de
>                 "wIndex=%04x wLength=%04x\n",
>                 ctrl->bRequestType, ctrl->bRequest, ctrl->wValue,
>                 ctrl->wIndex, ctrl->wLength);
> -       if (ctrl->bRequestType & 0x80) {
> +       if ((ctrl->bRequestType & USB_DIR_IN) && ctrl->wLength) {
>                 pipe = usb_rcvctrlpipe(dev, 0);
>                 snoop_urb(dev, NULL, pipe, ctrl->wLength, tmo, SUBMIT, NULL, 0);
>
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20210712161445.GA321728%40rowland.harvard.edu.
