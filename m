Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C175B72FF6
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 15:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfGXNdk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 09:33:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37211 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfGXNdk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jul 2019 09:33:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id 19so20975501pfa.4
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2019 06:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J0GhZpS0srXIOnUiUqnG1RMs2asMr9aCIfA9MEV0O0k=;
        b=VE6f3B/j/Hloq91g34w7cU6EJwSi1nIsFo5cpqcKPB4wSjLqKtCjrk6xV/Qo+dRQOj
         ustHBXwbg8hQtIVMrjFZDuKIMOWob41/CDoTVSQR15xSnaEqk3DSfWoxxEkNXfSiEuNB
         79J9NqA3VyqEPRGuxPUzsUAWpzzgTU8YTkYQLsfl7Q8uCiez7HeRd9MLqvNP/n8gPFEE
         z9mztfOCLm560W8DqpGZgC7TS/+uLCZMQsTPil2XheMQfCvJpd3L4u4uKlER48iLnFao
         vcyF62OzJgmLEUHKUAchb1ImUpaGkLw4B7CoaK6xFUvEB+Zmup6CFM7xKaT7zTKO4liY
         awHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J0GhZpS0srXIOnUiUqnG1RMs2asMr9aCIfA9MEV0O0k=;
        b=Uqy8IAOJ2V+Mn1AXjrnEGmWfgaJxZXZbmbd76OecwQkuFdMai71ODIUy1E2v0hTrvp
         ckoIYp63omAtZGPtfiYU0SE4D0U+lQLZwTjy+8iRXzNtAri4Vbih/yPBFS4u7d4QkSol
         Xk5bKmXbpM7DKF90ZLmAmfatGrWdR7XAG1CJItOg0LQ2u2f64JxJ1ZF3n8yb0qy0YW58
         gaQcOJkldeNGAn/Ny79DzsZg/pO1bIujfkEzCWeLxK43HcdHLgPSvn5Hr+DnhxzbRMdq
         G2iwr3pIIKmwm4Yrym8kHo1SEsdPk7/dQnNwkJRO1UaMAbLwFssNCYaf7+PouyFwl83g
         QCNw==
X-Gm-Message-State: APjAAAV2orVCEEOUgmX710H4DYnUgpsVF3A2fow7lxaa37rg8GkueEjs
        6/R9rUNcMr3aIiKyg/KU/bKzpt0LMMeIL1BlYH+GOw==
X-Google-Smtp-Source: APXvYqyIpN5q5sz17jm2tXisdxSgvqQnfx2AqqarX+pX6yvcEDL6Esp3HraF93WgvRR0H/jzRHcEuZasgMbwifhPGjY=
X-Received: by 2002:a63:c442:: with SMTP id m2mr82713180pgg.286.1563975213181;
 Wed, 24 Jul 2019 06:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000acb99a058b0d5741@google.com> <000000000000ac8f77058e0d11e9@google.com>
 <CAAeHK+zT+VhrxPDNFxCoVDrgBhmTiAuRjQv_A6SC91x8w0HmoQ@mail.gmail.com> <s5hlfwn376e.wl-tiwai@suse.de>
In-Reply-To: <s5hlfwn376e.wl-tiwai@suse.de>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 24 Jul 2019 15:33:21 +0200
Message-ID: <CAAeHK+x_P3WHxMmgimSKrHwew_HCyi9a67Tw3qPu5TTESAhL3w@mail.gmail.com>
Subject: Re: WARNING in snd_usb_motu_microbookii_communicate/usb_submit_urb
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Hillf Danton <hdanton@sina.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+d952e5e28f5fb7718d23@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 24, 2019 at 3:15 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 23 Jul 2019 19:03:29 +0200,
> Andrey Konovalov wrote:
> >
> > (Takashi, with your helper check syzkaller now generates a new bug
> > report (not reported by syzbot yet due to breakage during kernel boot
> > on 5.3-rc1, so see below) and I guess this has to do with a missing ep
> > != NULL check).
> >
> > kasan: CONFIG_KASAN_INLINE enabled
> > kasan: GPF could be caused by NULL-ptr deref or user memory access
> > general protection fault: 0000 [#1] SMP KASAN
> > CPU: 1 PID: 74 Comm: kworker/1:1 Not tainted 5.3.0-rc1+ #40
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> > Workqueue: usb_hub_wq hub_event
> > RIP: 0010:snd_usb_pipe_sanity_check+0x80/0x130 sound/usb/helper.c:75
> > Code: 48 c1 ea 03 80 3c 02 00 0f 85 b3 00 00 00 48 8b 6d 00 c1 eb 1e
> > 48 b8 00 00 00 00 00 fc ff df 48 8d 7d 03 48 89 fa 48 c1 ea 03 <0f> b6
> > 04 02 48 89 fa 83 e2 07 38 d0 7f 04 84 c0 75 7b 48 b8 00 00
> > RSP: 0018:ffff88806c33f0a8 EFLAGS: 00010246
> > RAX: dffffc0000000000 RBX: 0000000000000001 RCX: ffffffff833819c2
> > RDX: 0000000000000000 RSI: ffffffff833819dc RDI: 0000000000000003
> > RBP: 0000000000000000 R08: ffff88806c330000 R09: fffffbfff0d1a792
> > R10: fffffbfff0d1a791 R11: ffffffff868d3c8f R12: 0000000000000000
> > R13: dffffc0000000000 R14: ffff88806975cc80 R15: ffff88806975c4a0
> > FS:  0000000000000000(0000) GS:ffff88806d100000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007fcc3a48c000 CR3: 000000006861c003 CR4: 0000000000160ee0
> > Call Trace:
> >  snd_usb_accessmusic_boot_quirk sound/usb/quirks.c:835 [inline]
> >  snd_usb_apply_boot_quirk+0xa19/0xc60 sound/usb/quirks.c:1267
> >  usb_audio_probe+0x2ec/0x1f40 sound/usb/card.c:576
> (snip)
>
> So it's a NULL pointer returned from usb_pipe_endpoint() with an
> invalid pipe.  The fix patch is attached below.

Thanks for the fix! Do you think it makes sense to reuse the already
existing usb_urb_ep_type_check() function instead of
snd_usb_pipe_sanity_check() as Hillf suggested? They seem to be doing
essentially the same thing.

>
>
> thanks,
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: usb-audio: Fix NULL dereference at pipe sanity check
>
> The newly introduced helper for a sanity check of a pipe causes an
> Oops due to the NULL pointer returned from usb_pipe_endpoint() with an
> invalid pipe.  Let's fix it.
>
> Fixes: 801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and EP types")
> Reported-by: Andrey Konovalov <andreyknvl@google.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/usb/helper.c b/sound/usb/helper.c
> index 71d5f540334a..919d69e0aba3 100644
> --- a/sound/usb/helper.c
> +++ b/sound/usb/helper.c
> @@ -72,6 +72,8 @@ int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe)
>         struct usb_host_endpoint *ep;
>
>         ep = usb_pipe_endpoint(dev, pipe);
> +       if (!ep)
> +               return -EINVAL;
>         if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
>                 return -EINVAL;
>         return 0;
> --
> 2.16.4
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/s5hlfwn376e.wl-tiwai%40suse.de.
