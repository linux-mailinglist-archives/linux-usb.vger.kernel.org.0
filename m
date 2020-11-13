Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ED82B1C03
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 14:43:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgKMNm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 08:42:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726376AbgKMNm4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 08:42:56 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5850C0613D1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 05:42:55 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id h6so7115286pgk.4
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 05:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xeRteUYbLutGkQrrpi7H2enRNwMxf8nMPaFExxLpUmk=;
        b=A25bqIPX9jFZk1iMzFP0ddtBNLjKWWaHxxVsq74rjDyWqE139lDfn6UGug1+K9zZvR
         qLJrsCrI97d2UAIVKhY9MrsolfuQ2m1H5N9iZiplPvxKW+BCJWH+Kp8CB58Pye/CtRoa
         zKo1LI4D3ubRc4fYv8vYyyyh+xB0yMf04A3i00l+CRVkfF7l0EyzdQme6XLH2LaPzUsX
         C7rJoyE6fAhm5vYrT66fX6AM3QegDp1vgYyLkOuqNBS7iBYh3L2aiNN83Qliz5HI4wUb
         wM1VQycQi/hqZlLg5hZQ422NV7xJX7lt8amslmYYMY1pUzf0/OphNiKkV2i1N9R4l8eE
         o9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xeRteUYbLutGkQrrpi7H2enRNwMxf8nMPaFExxLpUmk=;
        b=Mo4ibT2a7sHsnurCTwgPXXG7NngsyqkadncUpDqIefbPT8KCtTbGZUTzSPVCVwsY6B
         uulfcrQncoayhSBH7rhkiOqWAlO34qG3r4vJQNn4ij2Iag64LRtYojh7hyUanAVuZPFt
         /6W1ZsAXQbYUQt9vuejYm+0GK20HTzWqEYMwoa+q3amxq54OMOLg/U1ugxlFz1cF88yi
         A8NUhABXWCZkc/Dtl2AvBvgO4tgHSWu8hafD4xfMWrqYWlKAacPhKejPFEvM3AKxUJj0
         XOVu9B1VvHAmtKYewxDx9sAHhvbRZMsjTq+dUvwxetCk+IulLhVZmCKD19ED/+KiWYSt
         oV9A==
X-Gm-Message-State: AOAM530AxyMnkLyJkN8CZbGNnPtMhZJgImLiYp3FHxJ8ZSsgWg6cYL8b
        YWlLua4+MHLzUrkxroQVqyM/g5uHukQEnlElVu8iCuOYj/8GDg==
X-Google-Smtp-Source: ABdhPJxEEff5q7MFEuv9XJLX+NqYpChvyXOK9HnYhOTDuUpjWQxD+GDapX1xLjPDWz6r9vbmj1gmK9DryNPwU9h0ij0=
X-Received: by 2002:a05:6a00:16c4:b029:162:bf9f:6458 with SMTP id
 l4-20020a056a0016c4b0290162bf9f6458mr2014799pfc.55.1605274975132; Fri, 13 Nov
 2020 05:42:55 -0800 (PST)
MIME-Version: 1.0
References: <f3a7a153f0719cb53ec385b16e912798bd3e4cf9.1602856358.git.andreyknvl@google.com>
 <20201113123035.tjllvijjzd54npsf@linutronix.de> <CAAeHK+zd0ucaj8EJ8ro+0ekubrxp5GiBMaBULHJB05dDrzpQGw@mail.gmail.com>
 <20201113132818.zhtdhzg6ukv4wgxl@linutronix.de>
In-Reply-To: <20201113132818.zhtdhzg6ukv4wgxl@linutronix.de>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 13 Nov 2020 14:42:44 +0100
Message-ID: <CAAeHK+yZEQ7r1bBWbUhdys8s1CntwpOyF+Fm+H=NiuK0g3KwYg@mail.gmail.com>
Subject: Re: [PATCH v4] kcov, usb: only collect coverage from
 __usb_hcd_giveback_urb in softirq
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 13, 2020 at 2:28 PM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2020-11-13 13:51:19 [+0100], Andrey Konovalov wrote:
> > Hi Sebastian,
>
> Hi Andrey,
>
> > Replaced with what and why?
>
> Linus requested in
>         https://lkml.kernel.org/r/CAHk-=wht7kAeyR5xEW2ORj7m0hibVxZ3t+2ie8vNHLQfdbN2_g@mail.gmail.com/
>
> that drivers should not change their behaviour on context magic like
> in_atomic(), in_interrupt() and so on.
> The USB bits were posted in
>         https://lkml.kernel.org/r/20201019100629.419020859@linutronix.de
>
> and merged (which is probably the same time as this patch).
>
> I haven't look what this code should do or does but there are HCDs for
> which this is never true like the UHCI/OHCI controller for instance.

We could go back to adding softirq-specific kcov callbacks. Perhaps
with a simpler implementation than what we had before to only cover
this case. Something like kcov_remote_start_usb_softirq() and
kcov_remote_stop_softirq() that do the softirq check internally.

Greg, what would you prefer?
