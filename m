Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 064A1B8CBD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 10:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395256AbfITI0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 04:26:36 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33394 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393491AbfITI0g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Sep 2019 04:26:36 -0400
Received: by mail-lj1-f196.google.com with SMTP id a22so6285131ljd.0;
        Fri, 20 Sep 2019 01:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fdZ5HvIuPAhLyOkWuGcwvBz11Qizv3lmaxqWfjEpQIg=;
        b=Uo2v7zHQohL5k8y3afgUkHpm12JblVG7SV1KHR6VguqWuwe7l7sz5NJOsmbuhF9r2t
         ii3R13Ai+LdnW4cFwgJi4putacBphj8lxZ4aV9FEsugnD5gk7h+KDTwlD+2KS0+J78Iy
         LpT3j7BdIunoLQdzSv0TuDUP+Jyj1O16UP9Tpu1itL2LY5/AeYTtivkNVnRVVv5lYjqR
         mOQ3BCnt+huiCza2I8I/d3vfmtDX3/EEB61KhkF9sOn21Vn167jBnIKXskP7sIAtBv20
         0CSkUBpIysvBChPJ1n2f2GSFjfysqg0JZ6Yo9QpD90u0w35a9HloGj9ydSRgL76nSvWg
         zaxQ==
X-Gm-Message-State: APjAAAVXKhvg3XVQ0LAz8h1SXsDQXgl0zSHzonbYYqpA2DAqrrjsuzej
        LFpk48n1CJ+Dey1jrMRxVPQ=
X-Google-Smtp-Source: APXvYqyjRvgwdjOc+j3FPuLa4K5+hLxfHX8rsN8LzxEh4gyoVC++I90hz0W6G96TCRxUgx/gxrmZiw==
X-Received: by 2002:a2e:9585:: with SMTP id w5mr8352208ljh.220.1568967992591;
        Fri, 20 Sep 2019 01:26:32 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id o19sm290922ljj.99.2019.09.20.01.26.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 01:26:31 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iBEFL-0001Bf-Te; Fri, 20 Sep 2019 10:26:31 +0200
Date:   Fri, 20 Sep 2019 10:26:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     syzbot <syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, dmg@turingmachine.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in adu_disconnect
Message-ID: <20190920082631.GL30545@localhost>
References: <000000000000d12d24058f5d6b65@google.com>
 <000000000000a12822058fb4f408@google.com>
 <20190919103504.GC30545@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190919103504.GC30545@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 19, 2019 at 12:35:04PM +0200, Johan Hovold wrote:
> On Fri, Aug 09, 2019 at 01:24:04PM -0700, syzbot wrote:
> > syzbot has found a reproducer for the following crash on:
> > 
> > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13871a4a600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0243cb250a51eeefb8cc
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c4c8e2600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11d80d2c600000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
> > 
> > usb 1-1: USB disconnect, device number 4
> > ==================================================================
> > BUG: KASAN: use-after-free in atomic64_read  
> > include/asm-generic/atomic-instrumented.h:836 [inline]
> > BUG: KASAN: use-after-free in atomic_long_read  
> > include/asm-generic/atomic-long.h:28 [inline]
> > BUG: KASAN: use-after-free in __mutex_unlock_slowpath+0x96/0x670  
> > kernel/locking/mutex.c:1211
> > Read of size 8 at addr ffff8881d1d0aa00 by task kworker/0:1/12
> 
> Should be fixed by the below patch.
> 
> #syz test: https://github.com/google/kasan.git f0df5c1b

Hmm. Let's try that again with the commit id from the report...

#syz test: https://github.com/google/kasan.git e96407b4

Johan

> From 6f09430ae18085a1552fc641e53d3a3e678db6f3 Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Thu, 19 Sep 2019 11:48:38 +0200
> Subject: [PATCH] USB: adutux: fix use-after-free on disconnect
> 
> The driver was clearing its struct usb_device pointer, which it uses as
> an inverted disconnected flag, before deregistering the character device
> and without serialising against racing release().
> 
> This could lead to a use-after-free if a racing release() callback
> observes the cleared pointer and frees the driver data before
> disconnect() is finished with it.
> 
> This could also lead to NULL-pointer dereferences in a racing open().
> 
> Fixes: f08812d5eb8f ("USB: FIx locks and urb->status in adutux (updated)")
> Reported-by: syzbot+0243cb250a51eeefb8cc@syzkaller.appspotmail.com
> Cc: stable <stable@vger.kernel.org>     # 2.6.24
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> 
>  drivers/usb/misc/adutux.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> index 344d523b0502..bcc138990e2f 100644
> --- a/drivers/usb/misc/adutux.c
> +++ b/drivers/usb/misc/adutux.c
> @@ -762,14 +762,15 @@ static void adu_disconnect(struct usb_interface *interface)
>  
>  	dev = usb_get_intfdata(interface);
>  
> -	mutex_lock(&dev->mtx);	/* not interruptible */
> -	dev->udev = NULL;	/* poison */
>  	usb_deregister_dev(interface, &adu_class);
> -	mutex_unlock(&dev->mtx);
>  
>  	mutex_lock(&adutux_mutex);
>  	usb_set_intfdata(interface, NULL);
>  
> +	mutex_lock(&dev->mtx);	/* not interruptible */
> +	dev->udev = NULL;	/* poison */
> +	mutex_unlock(&dev->mtx);
> +
>  	/* if the device is not opened, then we clean up right now */
>  	if (!dev->open_count)
>  		adu_delete(dev);
