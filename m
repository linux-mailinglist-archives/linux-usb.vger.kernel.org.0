Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACEC2E7DA0
	for <lists+linux-usb@lfdr.de>; Thu, 31 Dec 2020 02:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgLaByg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Dec 2020 20:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgLaByf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Dec 2020 20:54:35 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C38FC061573
        for <linux-usb@vger.kernel.org>; Wed, 30 Dec 2020 17:53:55 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ga15so23945658ejb.4
        for <linux-usb@vger.kernel.org>; Wed, 30 Dec 2020 17:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l5RnW5MfeIeSRSrKh76K7AjTpXxgx5uRGRT87Sb/M7k=;
        b=GmSv+VBBi3t2aFfvIArlLItl/50GVmlDot1OCgNqQIHfYU5C15sC7e1T6Ya9L0lcmX
         +NTX+nOo1CbjyS0dfavEgXI1Amni1F2lLX+zHfG07R0A7ISSUzUWrjxxa/A89CZnrsRM
         sC9IDmQyyY7regbTLT/M3xoZ3Ch0cnmhWLqSExNyqhoC8OSconT4hIciXU6akPBywyiT
         NPronYSAsn+XBAnzDzhtMLkd13hBg9W5qYfThzintsPqaPhDFWy7X3LM24pRWwlSV/4G
         CmYIcLDZwKfBj+fgd/eU8whq14eGHV/M8sCDkJz6nB9UzuP4bcc6dTaVp/EwTb3+X7YM
         Ldvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l5RnW5MfeIeSRSrKh76K7AjTpXxgx5uRGRT87Sb/M7k=;
        b=PhIPha40bxJluaY5f53XNwaCYRjGAFchbI5wNJA8zYuD5qr1haaX8f6TBsyHBb4grP
         2Lz7c8DpUiu+fWTSDa1ZtgT/4EQseHUJK0TpSkFEZbj8mUErKqdgu3OIhILoIJaLIwfr
         ay9PtZaZNLsIgGM42CDIDXp7R4nBNdjqiVdWTKIVntP3tL8hKGDPae+mUiv+KwHLw/1s
         /S+3/xXcveK/wrj/u2pMbJZTWeeiq9cQ0DGFtauz/eQxkcLo5ukuN3lNsRYuVYE9TfQF
         unS2u/4afwc894Yzhq0VFrXRDNUhR2Emz7im9vKicyuGCLgQo+t/rIQlpQmXgfVmSHQt
         VxEg==
X-Gm-Message-State: AOAM530fmeesDzWNMMohuGGIo13RW1nyVekECb6WKL282dNp3lwMxfJI
        kv4Gej3wpwNeifIKUpGjl/azmlXA6f5Y4BUgJPT3gg==
X-Google-Smtp-Source: ABdhPJxz6GHroCCd8RghHLfGAMqA4gDhhU6xQITNRnw+X4rDzpgCfFD62pdQH9DV4Nfbq7UP1ZrCOzgTmUzAi+XiOdo=
X-Received: by 2002:a17:906:5182:: with SMTP id y2mr52769429ejk.92.1609379633910;
 Wed, 30 Dec 2020 17:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20201230211918.63508-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201230211918.63508-1-andriy.shevchenko@linux.intel.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Wed, 30 Dec 2020 22:53:42 -0300
Message-ID: <CAAEAJfCiUx+NepjxBvoupShks9MTpN9ihzBywqt0at4ekkFASQ@mail.gmail.com>
Subject: Re: [RFT][PATCH v1] media: zr364xx: Fix memory leak in ->probe()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        royale@zerezo.com, USB <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey Andy,

Thank you for the patch.

On Wed, 30 Dec 2020 at 18:22, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> When ->probe() fails in some cases it may not free resources.
> Replace few separated calls by v4l2_device_put() to clean up
> everything.
>
> Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> I have no hardware and hadn't done any test of this.
>

For bugs with reproducers such as this one, syzbot will test your
patches really quickly.
Just push the patch somewhere and then reply to syzbot bug report mail with

#syz test: git://repo/address.git commit-hash

You can experiment with syzbot by replying only to syzbot's mail address.

See https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches
for more details.

Cheers,
Ezequiel


>  drivers/media/usb/zr364xx/zr364xx.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
> index 1e1c6b4d1874..5b9e31af57cf 100644
> --- a/drivers/media/usb/zr364xx/zr364xx.c
> +++ b/drivers/media/usb/zr364xx/zr364xx.c
> @@ -1533,9 +1533,7 @@ static int zr364xx_probe(struct usb_interface *intf,
>         return 0;
>
>  fail:
> -       v4l2_ctrl_handler_free(hdl);
> -       v4l2_device_unregister(&cam->v4l2_dev);
> -       kfree(cam);
> +       v4l2_device_put(&cam->v4l2_dev);
>         return err;
>  }
>
> --
> 2.29.2
>
