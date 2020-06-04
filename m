Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A2B1EE512
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jun 2020 15:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgFDNM1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 09:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgFDNM0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jun 2020 09:12:26 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F87C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2020 06:12:26 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id i16so5097941qtr.7
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2020 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=89Een71ToGdwCSxQd7tlHimfNZeLDiVl6kiUkYupQ58=;
        b=VGjKygj+nT8JZi4b1eBCX1UkbushZE6Pzi3GMF4NsDIqX0EkyMzcM1EbsY1qIXPjdw
         11tbZMikjqxVioi3gyUx+gITmgkecFi84R/xPee5s5evRH0hW0diJtYEVuPYrNxQtFJK
         ynF0wMBCxJrWjzjB8ZdVXJbkp34iRp2uXHS0R7AMnhHCot7ivPOGP7tG3ahiHgiexB69
         wrK3Pg6ML4yihSbDPaZmpwPEFEkVccUFL2Kc75waotdXNv0aqDT55zYtIjQvsFkEGkc3
         ddjvH6/hEhObYGJvOjHhh1i5UDkBWRWrJ2fk4X0Q26RlhHXgOXzjhPXRidUWbsj+tzpn
         iaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=89Een71ToGdwCSxQd7tlHimfNZeLDiVl6kiUkYupQ58=;
        b=BWjuPySS1nEAiiYoL/utKRrXtnblyGkTTBNFjHwwBxzh2LokjRk8REiMTfkGYffASR
         wVMmK7ejYpJQliVImuwuDSU97ad6MqzdTv5bwVxX+njW9Swf1tBjaUdgcoRbqdnLlItt
         9rbn//47vPSmX4q2XxWvpB2QTi9UtJGsDbeEWhn0iXJXD2b2w2UhHD5CEuLdx/7lLoST
         Tb2BpTiUF9Elm2sS/jYXodzQc7Z8g7YVGhsGp6v5p0AmGhwKxa+ROeLx9vMPowWTse8W
         HTpxyap3Vix3vuhOqi19YDZng77L3+Tx7prgWeQi1X+BWgYjMbTHJQr7TtY9KWshpQPe
         uyiw==
X-Gm-Message-State: AOAM531MvkDyJhIo1EDaMVv6n+uPmWsQdng5elBiMeQoU5SiN6voptlT
        WsWuO9QhyvEY+u4JWPsIhKwA8d4QqmQjBNsMEWZboA==
X-Google-Smtp-Source: ABdhPJwkT8Si1NcTs/fSSq13l0wzFSKlTqlYgWFjE5hDKDWZEjt94PH8nlQ4iRCoCMAAUc+/LW9TiQjIcsvgD39UtRM=
X-Received: by 2002:ac8:36c2:: with SMTP id b2mr4339323qtc.257.1591276345652;
 Thu, 04 Jun 2020 06:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com> <4520671eeb604adbc2432c248b0c07fbaa5519ef.1585233617.git.andreyknvl@google.com>
In-Reply-To: <4520671eeb604adbc2432c248b0c07fbaa5519ef.1585233617.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 4 Jun 2020 15:12:14 +0200
Message-ID: <CACT4Y+ZXXin5Vfa+YtByzh9=+ZpTuPnseTYKfFBOoqZw+8J3Ag@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] usb: core: kcov: collect coverage from usb
 complete callback
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 3:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> This patch adds kcov_remote_start/stop() callbacks around the urb
> complete() callback that is executed in softirq context when dummy_hcd
> is in use. As the result, kcov can be used to collect coverage from those
> callbacks, which is used to facilitate coverage-guided fuzzing with
> syzkaller.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  drivers/usb/core/hcd.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index aa45840d8273..de624c47e190 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -31,6 +31,7 @@
>  #include <linux/types.h>
>  #include <linux/genalloc.h>
>  #include <linux/io.h>
> +#include <linux/kcov.h>
>
>  #include <linux/phy/phy.h>
>  #include <linux/usb.h>
> @@ -1645,7 +1646,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
>
>         /* pass ownership to the completion handler */
>         urb->status = status;
> +       kcov_remote_start_usb((u64)urb->dev->bus->busnum);
>         urb->complete(urb);
> +       kcov_remote_stop();
>
>         usb_anchor_resume_wakeups(anchor);
>         atomic_dec(&urb->use_count);
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>
