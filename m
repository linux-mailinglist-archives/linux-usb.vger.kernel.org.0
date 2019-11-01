Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2D79EC908
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2019 20:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbfKATZQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Nov 2019 15:25:16 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42031 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbfKATZQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Nov 2019 15:25:16 -0400
Received: by mail-lj1-f195.google.com with SMTP id n5so299062ljc.9
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYxjqcv/PYLPJKobOoHtNXOrj3psbjFOHnMYal58y3I=;
        b=c+Gs+TI8cuAjd4kd2hWlKLPAsPgXseDnrsUcVlBiA4ySvAjVj2n7unbZVDl4mRhd8k
         QGeff69FovwuouMkPqWploEvqGg2xz0OwyPfdogz9QpK6BaN9Ka9RJgzEVo5nEiWZyg/
         /eJ1qfcbNdodLUDZDnlwBOGgeV6KiV/t48RJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYxjqcv/PYLPJKobOoHtNXOrj3psbjFOHnMYal58y3I=;
        b=I7B3vV+nl7fuUPjpOFIdtQlgg+SMu1XxFWaDuXqWsKcYbWjMiQnW6+llHomxsI9jcs
         jpWd1vtC0BVi9vlk0+F0jfGbGh9feTIihSgbhpHmN+VGUclsNMUWbgKUyVv19kdU/VfA
         pHAqf+cGLYLqEUzLbK/7tOaywqbUOQ4Igvif7qy679DRBUg9xD5GLEPhEExxpj7yA+ap
         +O/7rIonRN1xzHfYWfTPLl4p8pRHS4RontaatQgdpGwb3wA5KChM3sQKMZRaiMb4rXJ5
         E17KSjvd3GevLvOGVJviP4treYICkjtj+UJP+WPXzkwr4dGDziTSmNjRNqoxC7n+zdfe
         ayBg==
X-Gm-Message-State: APjAAAVL/GlkYhK+ayt6TudRbUzTPZjGpjqoqXN7iCFT2UXhY/R0AEdx
        i9bEhTlkEhIwFbfTwi3438rgYkUqnI8=
X-Google-Smtp-Source: APXvYqzdrcPuogOfjPl4Dnoz5sERmfNBuSdYUvuza5gOj0GBjdPm1bxuE19QRZ1tEn2z6h9tXMr++w==
X-Received: by 2002:a2e:91ca:: with SMTP id u10mr7595583ljg.208.1572636312874;
        Fri, 01 Nov 2019 12:25:12 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id r19sm2820448lfm.61.2019.11.01.12.25.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2019 12:25:11 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id y23so399671ljh.10
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2019 12:25:11 -0700 (PDT)
X-Received: by 2002:a05:651c:154:: with SMTP id c20mr9282919ljd.1.1572636310860;
 Fri, 01 Nov 2019 12:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <157262963995.13142.5568934007158044624.stgit@warthog.procyon.org.uk>
In-Reply-To: <157262963995.13142.5568934007158044624.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Nov 2019 12:24:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqx4j2vqg-tAwthNP1gcAcj1x4B7sq6Npbi8QJTUMd-A@mail.gmail.com>
Message-ID: <CAHk-=wjqx4j2vqg-tAwthNP1gcAcj1x4B7sq6Npbi8QJTUMd-A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] pipe: Notification queue preparation [ver #3]
To:     David Howells <dhowells@redhat.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 1, 2019 at 10:34 AM David Howells <dhowells@redhat.com> wrote:
>  (1) It removes the nr_exclusive argument from __wake_up_sync_key() as this
>      is always 1.  This prepares for step 2.
>
>  (2) Adds wake_up_interruptible_sync_poll_locked() so that poll can be
>      woken up from a function that's holding the poll waitqueue spinlock.

Side note: we have a couple of cases where I don't think we should use
the "sync" version at all.

Both pipe_read() and pipe_write() have that

        if (do_wakeup) {
                wake_up_interruptible_sync_poll(&pipe->wait, ...

code at the end, outside the loop. But those two wake-ups aren't
actually synchronous.

A sync wake is supposedly something where the waker is just about to
go to sleep, telling the scheduler that "don't bother trying to pick
another cpu, this process is going to sleep and you can stay here".

I'm not sure how much this matters, but it does strike me that it's
wrong. We're not going to sleep at all in that case - this is not the
"I filled the whole buffer, so I'm going to sleep" case (or the "I've
read all the data, I'm waiting for more".

It's entirely possible that we always wake pipe wakeups to be sync
just because it's a common pattern (and a common benchmark), but this
series made me look at it again. Particularly since David has
benchmarks that don't seem to show a lot of fluctuation with his
changes - I wonder how much the sync logic buys us (or hurts us)?

               Linus
