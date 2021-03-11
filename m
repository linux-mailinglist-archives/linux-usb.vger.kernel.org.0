Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4747933742A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 14:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhCKNkd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 08:40:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233609AbhCKNkK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 08:40:10 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF7F5C061574
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 05:40:09 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id hs11so46309775ejc.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G+1s5KGV++V1sIgFJo4kDbmoxnedI31bG/nEzuv6Vhk=;
        b=NY/CDd05y4IK6/hTpGU6nc7fzH3q2yHdWRdxjGcjFPTpAB9PjRZT6u1di7de5Lo4NM
         SgKtW6bRmNVVt43X33vZz4Md0S1Z7tLmdCInNecGk5+Lja04ihlOC20Z72J3caBUjALa
         VO+B1Z3XoV5HjE6XnZGaDTIPqIdl/sk8fyWPanFDkIOaiEJ8FufI2V4WfXXtbVDAgvJf
         7yEAcRTxWST3NPYuM3lEpG0mxbeNkhXEl3sdas42d8jUlZxqjQcBRWF5sFy+SxUeDYKc
         xAbnx4GfeRHtWHQpU+pc0oEHY1ssz7UGn0qNvkToWMr9szmfiTKDjmFznDN3+cWR3Ju+
         OQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G+1s5KGV++V1sIgFJo4kDbmoxnedI31bG/nEzuv6Vhk=;
        b=nfTCSXWBO0FwHAppFx2/8w+LnIkkYj6E/6OQqKNaNfD4eAg7coLPheCUKJBGspO4za
         52VhqvGlqtWVgbk4SasGkZ2JuCZ6CDvh/bprZGCh/jl91n00b+N48F5AZD/ublc2KJZG
         2/cAW5oJZkLApUK6k/LcEZO44U0+8xMg7ktRmViX1Gc6ituTw46a9nVIVOi4kiXjpJeb
         Ro2fAnnweS6uVlIIVwwm6aiZtb8vGRLakTkreGsTxRYPoanJnqe8hieE9W+PoC+v5DVv
         dc1KGkB2UL1v44mftWfRY9m3n11lymkj1SY46Mj4TrQd4eZo5uJa1ryeVpgA6/x5yxs3
         NLpA==
X-Gm-Message-State: AOAM532AQQ9XoE5ZX8Xrh7sj2/dQIeT9dBMTprSPwlBBYRQbY+mXuNXN
        Fc9dKrStCs6uz8tIe0yR/mI0al9i5ZwldX7MwDY=
X-Google-Smtp-Source: ABdhPJzV6LlrIV0vO0FbdSz6fBClLT1r+gV+G3JYclKy8xfu1eJzfXHwkeQjcT3E5WpfKSLW5JJoY1yPkCQJAc2rjIY=
X-Received: by 2002:a17:906:9501:: with SMTP id u1mr3198987ejx.324.1615470008464;
 Thu, 11 Mar 2021 05:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20210311130126.15972-1-oneukum@suse.com> <20210311130126.15972-2-oneukum@suse.com>
In-Reply-To: <20210311130126.15972-2-oneukum@suse.com>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Thu, 11 Mar 2021 14:39:52 +0100
Message-ID: <CAH+2xPDm9Y+6=G3cDtpVZEnBMyvBkdkWPFtYm=d8heo=OVob4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] CDC-ACM: downgrade message to debug
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg KH <gregKH@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Den tor. 11. mar. 2021 kl. 14.01 skrev Oliver Neukum <oneukum@suse.com>:
>
> This failure is so common that logging an error here amounts
> to spamming log files.
>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

I can confirm that this error message is very common on
embedded Linux systems.

/Bruno

> ---
>  drivers/usb/class/cdc-acm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
> index d684cf94b1c0..fd2fce072985 100644
> --- a/drivers/usb/class/cdc-acm.c
> +++ b/drivers/usb/class/cdc-acm.c
> @@ -659,7 +659,8 @@ static void acm_port_dtr_rts(struct tty_port *port, int raise)
>
>         res = acm_set_control(acm, val);
>         if (res && (acm->ctrl_caps & USB_CDC_CAP_LINE))
> -               dev_err(&acm->control->dev, "failed to set dtr/rts\n");
> +               /* This is broken in too many devices to spam the logs */
> +               dev_dbg(&acm->control->dev, "failed to set dtr/rts\n");
>  }
>
>  static int acm_port_activate(struct tty_port *port, struct tty_struct *tty)
> --
> 2.26.2
>
