Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA99831C6
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 14:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbfHFMtw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 08:49:52 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39724 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfHFMtw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 08:49:52 -0400
Received: by mail-pg1-f193.google.com with SMTP id u17so41552748pgi.6
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7t8k26ZyJOyP0tk9GV3EhOOd2hY1UvvGYHY/58DpNC8=;
        b=fmIN8gyUtbePfCLYc5ToH3UH1r1HnrRZrHznkbh2l6sKSSEBBIp8jBe1+5v+BdEpIg
         xSZtp8hZEMzjJ1e4Immi+24ztpsu6MPJUzPzxUV9yfvAkWJeWeRJGAUa/tawGQyNZkiF
         mnHqwmoP0m8K0NKV7l84JXhjxkFlpehdm04sS+gGp1WKzWrtirWF3d40ptDE2VgOvKLv
         TpGcx9cCHo85oiSO6ZeRRDjAeNR0hJjyBdaAf6OIy/TQlf2DOLq9t7lVB/zT5JNtasAz
         2xrj6hSQPDOBM7MLzY3TZ3NQCjE9iQ2Sa/O08UUtivGxUX/1/PTpWhezjdga4AExqjKo
         S8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7t8k26ZyJOyP0tk9GV3EhOOd2hY1UvvGYHY/58DpNC8=;
        b=telkTIZWs7Dl08V2WdJyyfvFrGJq4YgldfjeDKQkIKbhfYrWAvGUQkZY9wvHguVo7d
         kX1pQKJBnu3INYs52cbK2/PkBrAT0TR1uoAvvJS5eeywhjlCOA7G1t9C2SUti4Y6R0ty
         l4wyUTeafG65oGFlUXk7bh4N3Emf5ODAqZRmgSB+UdYo2xC4UzO5c+qZxyKyC2FL/UDf
         8zUTKrMsDd76dxna6v2ak8rNYsPcaoAFukeq1B+xY5IuB5qOic8+IJcUssldH2AF7AgB
         Ox2SBwEFpjkgZVyR+iCfkRLw8VO/sDTF6Kq8HilwdyJKy/wjwvKUtCFNGRoVgPSq0GMX
         nxKQ==
X-Gm-Message-State: APjAAAWPgCxNv/0SNEEQCSh9iU4GHPS8iruq8h9OktIiNdQTZfR9sy9h
        VEc3/gM6XGTDo81Qnt//jJ6xa37DtUrcLl5rGhsofQ==
X-Google-Smtp-Source: APXvYqwcn6lLPorgil14SW+0V6x8JYc+GKFyGlYB0eXqRuFtjaLKawuO2tj3LbfGordiPx/gUUdBOjjUgr3sm42UFNs=
X-Received: by 2002:aa7:86c6:: with SMTP id h6mr3555149pfo.51.1565095791799;
 Tue, 06 Aug 2019 05:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000014c877058ee2c4a6@google.com> <1565095525.8136.22.camel@suse.com>
In-Reply-To: <1565095525.8136.22.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 6 Aug 2019 14:49:40 +0200
Message-ID: <CAAeHK+xrCX61XE6YBnGBKgAuwC1LEbGFDFr5KO2i2O5r11UP5A@mail.gmail.com>
Subject: Re: KMSAN: kernel-usb-infoleak in pcan_usb_pro_send_req
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Alexander Potapenko <glider@google.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 6, 2019 at 2:45 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Dienstag, den 30.07.2019, 02:38 -0700 schrieb syzbot:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    41550654 [UPSTREAM] KVM: x86: degrade WARN to pr_warn_rate..
> > git tree:       kmsan
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13e95183a00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
> > dashboard link: https://syzkaller.appspot.com/bug?extid=513e4d0985298538bf9b
> > compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> > 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eafa1ba00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b87983a00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com
>
> #syz test: https://github.com/google/kasan.git 41550654

Hi Oliver,

For KMSAN bugs you'll need to use the kmsan tree (syz test:
https://github.com/google/kmsan.git COMMIT_ID). I've updated the
testing instructions some time ago to reflect this. Sorry for the
complexity, this is caused by USB fuzzing and KMSAN not being upstream
yet.

Thanks!

>
> From 6de76fa3df8aedc7a76dc0ecdea8308e38d4dccc Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 6 Aug 2019 14:41:52 +0200
> Subject: [PATCH] pcan_usb_fd: zero out the common command buffer
>
> Lest we leak kernel memory to a device we better zero out buffers.
>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/net/can/usb/peak_usb/pcan_usb_fd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c b/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
> index 34761c3a6286..47cc1ff5b88e 100644
> --- a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
> +++ b/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
> @@ -841,7 +841,7 @@ static int pcan_usb_fd_init(struct peak_usb_device *dev)
>                         goto err_out;
>
>                 /* allocate command buffer once for all for the interface */
> -               pdev->cmd_buffer_addr = kmalloc(PCAN_UFD_CMD_BUFFER_SIZE,
> +               pdev->cmd_buffer_addr = kzalloc(PCAN_UFD_CMD_BUFFER_SIZE,
>                                                 GFP_KERNEL);
>                 if (!pdev->cmd_buffer_addr)
>                         goto err_out_1;
> --
> 2.16.4
>
>
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/1565095525.8136.22.camel%40suse.com.
