Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D542CBB44
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 12:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgLBLLV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 06:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLBLLU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Dec 2020 06:11:20 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21590C0613CF
        for <linux-usb@vger.kernel.org>; Wed,  2 Dec 2020 03:10:40 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id y10so3065235ljc.7
        for <linux-usb@vger.kernel.org>; Wed, 02 Dec 2020 03:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yMpa0g7bdnvpjyAt8HBqSuhNsihM5GDKWAeSShasqWY=;
        b=PMZKlSHMnndy9zbglxDxWHAf8xDA19f+zluQMug1Pvdkrz1hwCZJsMuxwrgXKufqEH
         UDfJPZu2QnRxmxDBtot7jmt9d4tUJFZ/dpX0sAOptWM5CsSaTt2XCviDj2r7X74il28c
         4iuf3bhi/V0d3Ucs/aqeayIeZ4HAfp6Wd0sxHNlxuV4KYPf4WpwpKNVuHYwAR9hNCink
         iRhCZ2dnGR7OdWiVZJ+q7Y+ohFaFyUz2VMNxfeLVpNHaEmaBDlqJbEHHe2++5Bxoper0
         JSrssgAbKpYn4AgypNsjCVRc8iwToojGFbh+S+UWSjD8Jv5xaCfBATswdCrNXTKiwwPG
         9pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yMpa0g7bdnvpjyAt8HBqSuhNsihM5GDKWAeSShasqWY=;
        b=kesZEOgOg0T8ef/UZ/DKSeiQYC6SJOBvsGDK3lkY7ogea0xcz/xXBCyBbqQZXHUJZb
         hMuiG1D7cnWUfyeifmkd+NMjhMWvntpujX8JI7jOAhXkCPJ7sCROk/KyLzRpu9aUMknm
         Zyo895RTScumfqi6dNK0JN9XUOkAXzWY74EIPRCrpzOkULrxckWIh03RVNBJ9/Hq/lH9
         h2LQDGj8CGSdjiDZc7lj3bjyq0oA4dOXDDR4qR+B1vAeoaQIgMMgQbGE/To2Avf/KOaK
         2K9U0nWpNURH9H1hGnhL6k5maihlBLwFyRNU35c/9YqpVD1G2t0RT6rK1qZdQmmLpmCB
         Ll9Q==
X-Gm-Message-State: AOAM530zx850WL6HTXMKVIj34u3q+jh3xT0txHrgpyNeobXIpA8VEQb2
        AIt/xwy3LdKl8OgJYEfrl5nPkzah1KoPS6Vhg/OpeDNa
X-Google-Smtp-Source: ABdhPJxzy8xq471OJ+oJMA8l2c+m7gjfPmJt/iiD0bxPjpbCYZUbqCBWd7ZbxkLw2uZRMaWI1nuSV5vNT9qhsRH+/0s=
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr931766ljm.24.1606907438627;
 Wed, 02 Dec 2020 03:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20201130203453.28154-1-jackp@codeaurora.org>
In-Reply-To: <20201130203453.28154-1-jackp@codeaurora.org>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Wed, 2 Dec 2020 19:10:27 +0800
Message-ID: <CAL411-rtkBS=+cQVOR=pGuVCrHTavh-E8vEzNZeidX4OEZKehA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Use local copy of descriptors for
 userspace copy
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
>
> The function may be unbound causing the ffs_ep and its descriptors
> to be freed while userspace is in the middle of an ioctl requesting
> the same descriptors. Avoid dangling pointer reference by first
> making a local copy of desctiptors before releasing the spinlock.
>
> Fixes: c559a3534109 ("usb: gadget: f_fs: add ioctl returning ep descriptor")
> Signed-off-by: Vamsi Krishna Samavedam <vskrishn@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Reviewed-by: Peter Chen <peter.chen@nxp.com>

> ---
>  drivers/usb/gadget/function/f_fs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 046f770a76da..c727cb5de871 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1324,7 +1324,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
>         case FUNCTIONFS_ENDPOINT_DESC:
>         {
>                 int desc_idx;
> -               struct usb_endpoint_descriptor *desc;
> +               struct usb_endpoint_descriptor desc1, *desc;
>
>                 switch (epfile->ffs->gadget->speed) {
>                 case USB_SPEED_SUPER:
> @@ -1336,10 +1336,12 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
>                 default:
>                         desc_idx = 0;
>                 }
> +
>                 desc = epfile->ep->descs[desc_idx];
> +               memcpy(&desc1, desc, desc->bLength);
>
>                 spin_unlock_irq(&epfile->ffs->eps_lock);
> -               ret = copy_to_user((void __user *)value, desc, desc->bLength);
> +               ret = copy_to_user((void __user *)value, &desc1, desc1.bLength);
>                 if (ret)
>                         ret = -EFAULT;
>                 return ret;
> --
> 2.24.0
>
