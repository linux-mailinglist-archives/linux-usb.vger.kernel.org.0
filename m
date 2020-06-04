Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5335C1EE4F9
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jun 2020 15:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgFDNHY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 09:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgFDNHY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jun 2020 09:07:24 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8063FC08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2020 06:07:24 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id d27so5111496qtg.4
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2020 06:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ClLrIavOqOGDJWYrPRq16jGapJaGkyGJvYKPH8Mh8Y=;
        b=hAY6TZyUVLdwz5BG4D68XEohh0RwANhV9ipETDtzkliGovl5W+0bYcARhxU0/Rh4tg
         Cvqr17MrqBWl38Um1cwF9l4iaxAZGbZZyGAsHBTEf2lkSEmVBNePGowfVBYm1WIOQVZ0
         O2MG10e9I2akcCxna1eN2iTse4VgW3QaZ0Qvoo7xvvwJ2Bp0fjONh0JArZBHueoWmdZE
         LddK3d+yCLkBw4ukLnwHMKqdyS8u8HJW/VRnDqzwUASK0JOS5C3JrvADDMwWvlSUul26
         voh3frxAjPQnNGQMI6oPUYkOu6OMFXD6YttSDnm4FIlwMAJInUn6GnbhklJQnso3BP0i
         UpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ClLrIavOqOGDJWYrPRq16jGapJaGkyGJvYKPH8Mh8Y=;
        b=q1/VYreCa3P9P0r4dInBOKEKMbn7IV+dEObiqsuU0vTVJqRrp5vdCzyymHeRf4jkri
         1dB9SX0g2NBwUl45wITluZ4bpXHOpNcqNC5YrVSuztq9SSVk6o+GIEjpCggFoCbdwPfC
         oeKz0veIjTaM3jK9M3a/u/PDSNks03f6EJQvICirLRCUbN9jwYrVcDixQvxJrndksG/I
         ZpejQm8x/guUEsMhESW3muvFKsoJm5u+PorJRy7gM4ckS2vApzGSkYl4AmFt09uAcg10
         dmMhIj8nfefo5RNLjEVHhpOWckGKYhHpwL4gFMADFGtyd+Mfh3mrx4HcvSQ80eyLoBWE
         NOfw==
X-Gm-Message-State: AOAM532HRH/hb6cb/cIZjBX0fXKbWB2DDapy/6uvAe9W2QgvVLHGhxbg
        xV5IHH1HvpTR1Y/OnHoNEeQvdiRaPH3DxllMY7z50Q==
X-Google-Smtp-Source: ABdhPJzANH3aPPcoaGhaBOl/6Y4FjEYA167aD7BW2mye/1hE+No7niiOsusJLz1E0fH+Dh1MaO3Jd7aWqFfF+Hy+E/o=
X-Received: by 2002:ac8:7a87:: with SMTP id x7mr4566443qtr.50.1591276043290;
 Thu, 04 Jun 2020 06:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com> <5889efe35e0b300e69dba97216b1288d9c2428a8.1585233617.git.andreyknvl@google.com>
In-Reply-To: <5889efe35e0b300e69dba97216b1288d9c2428a8.1585233617.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 4 Jun 2020 15:07:11 +0200
Message-ID: <CACT4Y+ZR0FvQeRvfsTpwUMQ8gFfMT4BKPt79PdTN-_HCN8pdAw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] kcov: move t->kcov_sequence assignment
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
> Move t->kcov_sequence assignment before assigning t->kcov_mode
> for consistency.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  kernel/kcov.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 888d0a236b04..b985b7a72870 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -318,10 +318,10 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
>         /* Cache in task struct for performance. */
>         t->kcov_size = size;
>         t->kcov_area = area;
> +       t->kcov_sequence = sequence;
>         /* See comment in check_kcov_mode(). */
>         barrier();
>         WRITE_ONCE(t->kcov_mode, mode);
> -       t->kcov_sequence = sequence;
>  }
>
>  static void kcov_stop(struct task_struct *t)
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>
