Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65746191361
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 15:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgCXOhl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 10:37:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38099 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727168AbgCXOhl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 10:37:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id c5so7962217lfp.5
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wOe/cwkgIM9Ab4hg3mczmIi4wh/0K818LHuirOHiJ4A=;
        b=URod6sSAasEBeJ7UfuCiMIlcvfkkmmZgypzB/5zXAFTWfHRahsHWewBjncbYea079c
         SmcUkFauuYKCzTJYp+pY5jNK8w8yvzCcJnLvjcCuDh0rdqlNDMA4aDzEmZOeheV6pUZh
         9WxWbs93NyNQcQTu2lzSartwXN2f5jMacelqkx5eYHNr2RorLXid4QjyUf4HNlYbfTrc
         iatkxTNrJQH5MqYmr2azDFe/snTXi56H7SU+2PeKKHRY0ybLYnUNdjtePQC40pST6MyQ
         9dvnU5AE/Mkw6IvAS3f9iHzso7pFclL29N4AWSAoYUf1iF5GGs1xDDiKK0BJklqwQP+3
         45kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wOe/cwkgIM9Ab4hg3mczmIi4wh/0K818LHuirOHiJ4A=;
        b=oS/bdoYcXPUo0rXQ1IegNkJZjMxOc6dcNufrtoFcnzr6/m0nWInP/9MN/dGL/dQTXx
         eIV7+eIbl74TB42BU8nXmkN0P6dgveMG7ypl+nJF4MfDxnANdNLVYYsFWNIW/o8hvDeg
         lujEGZC20BupsBIQVqKJk7lM974YIOqBYUIGgunFy6wvqFhg5hycmCwIPLRNmkxCO9Yf
         I46wqPW/388bB1Ui/iUdiELSVEtSd0+/AIPqvcbPH7KoZy74ceG5SJo1fknCXe5YA+Tf
         Fg114hj7IT7atZpeM2gKqzOeal8bS8TRID7L0Unmj99dghgJ6gq03Q4DC2e5zv19jAI1
         IbPg==
X-Gm-Message-State: ANhLgQ3Mi8OJXvYLqJf/xdas96F7EPBUY7Q97UkbvqZEyLXL06Ja+Qzh
        X/1Sigu4QwPztpIN7meCHlUIkRlWksiPAfjWUOY=
X-Google-Smtp-Source: ADFU+vsZC/jXY3DWAG9uq5f+7YhlDvIzgnDW5IikwmVU4Ij6DBBavpPGJpMHsoKVUxWEmUfvJu4weAVKU1KqduhRP0E=
X-Received: by 2002:ac2:548f:: with SMTP id t15mr16681025lfk.115.1585060658724;
 Tue, 24 Mar 2020 07:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAEAjamtTnn+BZAshQ7=DQ7QdRHO83AbHeZP3xY1CpSzmbaHPDQ@mail.gmail.com>
 <Pine.LNX.4.44L0.2003241011510.4640-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2003241011510.4640-100000@netrider.rowland.org>
From:   Kyungtae Kim <kt0755@gmail.com>
Date:   Tue, 24 Mar 2020 10:37:27 -0400
Message-ID: <CAEAjams75BP5tRoJ9Xkfk7qa5pFwAsHTr4j0OJjof7WM72gxrg@mail.gmail.com>
Subject: Re: Fwd: BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170 drivers/usb/core/hcd.c
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 24, 2020 at 10:14:39AM -0400, Alan Stern wrote:
> On Mon, 23 Mar 2020, Kyungtae Kim wrote:
>
> > We report a bug (in linux-5.5.11) found by FuzzUSB (a modified version
> > of syzkaller)
> >
> > In function usb_hcd_unlink_urb (driver/usb/core/hcd.c:1607), it tries to
> > read "urb->use_count". But it seems the instance "urb" was
> > already freed (right after urb->dev at line 1597) by the function "urb_destroy"
> > in a different thread, which caused memory access violation.
> > To solve, it may need to check if urb is valid before urb->use_count,
> > to avoid such freed memory access.
>
> No, the problem is "free while still in use", caused by the fact that
> usb_sg_cancel() fails to indicate it is using the data structures.
>
> > kernel config: https://kt0755.github.io/etc/config_v5.5.11
> >
> > ==================================================================
> > BUG: KASAN: use-after-free in atomic_read
> > include/asm-generic/atomic-instrumented.h:26 [inline]
> > BUG: KASAN: use-after-free in usb_hcd_unlink_urb+0x5f/0x170
> > drivers/usb/core/hcd.c:1607
> > Read of size 4 at addr ffff888065379610 by task kworker/u4:1/27
>
> Here is a patch which ought to fix the problem.  Can you test it?
>
> Alan Stern
>
>
> Index: usb-devel/drivers/usb/core/message.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/message.c
> +++ usb-devel/drivers/usb/core/message.c
> @@ -588,12 +588,13 @@ void usb_sg_cancel(struct usb_sg_request
>       int i, retval;
>
>       spin_lock_irqsave(&io->lock, flags);
> -     if (io->status) {
> +     if (io->status || io->count == 0) {
>               spin_unlock_irqrestore(&io->lock, flags);
>               return;
>       }
>       /* shut everything down */
>       io->status = -ECONNRESET;
> +     io->count++;            /* Keep the request alive until we're done */
>       spin_unlock_irqrestore(&io->lock, flags);
>
>       for (i = io->entries - 1; i >= 0; --i) {
> @@ -607,6 +608,12 @@ void usb_sg_cancel(struct usb_sg_request
>                       dev_warn(&io->dev->dev, "%s, unlink --> %d\n",
>                                __func__, retval);
>       }
> +
> +     spin_lock_irqsave(&io->lock, flags);
> +     io->count--;
> +     if (!io->count)
> +             complete(&io->complete);
> +     spin_unlock_irqrestore(&io->lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(usb_sg_cancel);
>
>

Thanks for the patch. Unfortunately, we don't have a repro program to
test right now.

Regards,
Kyungtae Kim
