Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731BC215B7B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 18:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgGFQIh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 12:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729367AbgGFQIh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 12:08:37 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A28C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 09:08:36 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id f6so24357595ioj.5
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 09:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+WVm/HjSi2jf8uZdSi4EI9UGoOb7MLDK//YEI66B4Y=;
        b=V9WB+FMBApfWRAOK3ml3pRuHNo4W/Z3hfk6o39TVjedoqTDQo5Hs3G11HXHnwGRDYr
         besReQP6I6GKnr+UFpJYqJSbbHVb5Ngb9rBqslXn+ZsqgdHHYh6fTiscyFt/hT6BOaO3
         JTmyLT/I4f6npN92Yg4myQXZAZFN9CUw+fjsA672/KRW4eZvB9Aw5Idi9ppV0eSLQreO
         CVlE0fezsNFbIxk/Jg1AymJxx1uU5TlDMu9CJLFQ4zOzERx8L5fhnwI77KLChOn5gbvZ
         XjcgNcEqu2xiuFY2vZTZRxLZT0SKD5xfjaqR6pFKeQJRXGHbMjnV28U7yh/sKX+4A+lL
         HR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+WVm/HjSi2jf8uZdSi4EI9UGoOb7MLDK//YEI66B4Y=;
        b=saSPq+6VFHptASmeJ2oNNdaW1nLQfVpSVG7YPcP2TQb+B8XJlGE3DFvazR8fMMnoqQ
         j0kook8xmJO1fp6ciro0g1d/J4wjOj1+Z5xLkO1EqR3OSBv9F/H7reZ3SC3jFeYXVtU5
         hLGo7WU/PnZHhAvUW2K5UPYfbXCYnei5zTKA+xDPm5s9WQYYF1tq1zvdJIf4G4QfvW8f
         D/z+nqQQSOzOxwJXAxss5G2PUJkyJkk97DvJru2iOZu0WeG9kuPATLpOA0+Sg/Xi02IS
         Ckal0hCnqPRRt5qjNQU9EMJm3OKLE0Y0vmlKCu+0f5wetmVpvx+GNaJc7OYp55+wchcN
         PKjg==
X-Gm-Message-State: AOAM531MvlLT/tvDGXu5Z8Xi3MU1iRfxtgHWCpgq8CrJ98MKwyILR9K2
        8/bYhuMt9od1/FMcyOqlSYH/l7sTJPMeptZPMLzWpw==
X-Google-Smtp-Source: ABdhPJybFzSqqaU5Dc2CsDZhwwoSEtr9jFUO9cVopxHMAk/QFatZ7LOnS0l7obE1sXh+k1EtywMHmnAmF5m4W3EWjcw=
X-Received: by 2002:a02:a19c:: with SMTP id n28mr54037974jah.13.1594051716242;
 Mon, 06 Jul 2020 09:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200706133341.476881-1-lee.jones@linaro.org> <20200706133341.476881-24-lee.jones@linaro.org>
In-Reply-To: <20200706133341.476881-24-lee.jones@linaro.org>
From:   Jassi Brar <jaswinder.singh@linaro.org>
Date:   Mon, 6 Jul 2020 11:08:25 -0500
Message-ID: <CAJe_ZheZY-Vc+bZGGHKM7YkBxoOyf3CPBHY0=+cTw5Pp69FqEg@mail.gmail.com>
Subject: Re: [PATCH 23/32] usb: gadget: udc: max3420_udc: Remove set, but
 never checked variable 'addr'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB list <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 6 Jul 2020 at 08:34, Lee Jones <lee.jones@linaro.org> wrote:

> diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
> index 23f33946d80c4..52884bae4af11 100644
> --- a/drivers/usb/gadget/udc/max3420_udc.c
> +++ b/drivers/usb/gadget/udc/max3420_udc.c
> @@ -623,7 +623,6 @@ static void max3420_set_clear_feature(struct max3420_udc *udc)
>  static void max3420_handle_setup(struct max3420_udc *udc)
>  {
>         struct usb_ctrlrequest setup;
> -       u8 addr;
>
>         spi_rd_buf(udc, MAX3420_REG_SUDFIFO, (void *)&setup, 8);
>
> @@ -647,7 +646,7 @@ static void max3420_handle_setup(struct max3420_udc *udc)
>                                 USB_TYPE_STANDARD | USB_RECIP_DEVICE)) {
>                         break;
>                 }
> -               addr = spi_rd8_ack(udc, MAX3420_REG_FNADDR, 1);
> +               spi_rd8_ack(udc, MAX3420_REG_FNADDR, 1);
>                 dev_dbg(udc->dev, "Assigned Address=%d\n", udc->setup.wValue);
>                 return;
>         case USB_REQ_CLEAR_FEATURE:

Acked-by: Jassi Brar <jaswinder.singh@linaro.org>
