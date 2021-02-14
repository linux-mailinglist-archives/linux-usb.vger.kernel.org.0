Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B49B31B226
	for <lists+linux-usb@lfdr.de>; Sun, 14 Feb 2021 20:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhBNTBt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Feb 2021 14:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbhBNTBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Feb 2021 14:01:48 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE195C0613D6
        for <linux-usb@vger.kernel.org>; Sun, 14 Feb 2021 11:01:07 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id k22so4611920ljg.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Feb 2021 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M+PrlagK3FXPEbDOZIY/ECRbDBZyE6NRnFmFq47XoKo=;
        b=e8vgrlaDAszZNUkNayc/bQhGtTDVv2JWQ2vcikOXiPfOvXZyT7o6vWAx5IiBM+Q5aK
         xdHDapKbzufyKmtn2WyIcyjmXvK9/AY/sW/TaHGzXucoZnioLMvlxwq5wCIBY1xjxt3H
         8t/fXMkN3hYAEKXFusstufxRxZGE6gAS/rk1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+PrlagK3FXPEbDOZIY/ECRbDBZyE6NRnFmFq47XoKo=;
        b=QbyL74/k6pPyZWhHEl0FZ7rPYLA2JxeagOyzUrj6ieMM4dECLywKbX7Jog62+o4ZTy
         Jq7M61rjNuYHRLaZHDjZsoCzrBCjVtObcNrD3UsbFlzAJYvs5x8aoMKf9J/EA2YX6X3X
         YKkJdLjk5RaDzfFNdQDNF4rIpjLuRJK2xUrn/Mxph8dO3j+gkBM1F4G9dAobjgDo1Me/
         UQsXF8YH2Cm39XQaPrv6KJJMzl2UYTb+uRBR9qWkhDqaAWlJOVGsgCQcrHhPL90GjX+o
         0GfBcmmNlQE+GV0yJvHbTWNcK/0LlKAuiPJgV90gABQiXoGyCAs9TDy5xDDfg04ku97I
         uDMg==
X-Gm-Message-State: AOAM531S6oXhQdk0Xgnsb+6/mh3HPcfSNRTGKaOXwvA5gEyFejx17cHO
        EC7pXJA4dvjbfUpO/FWqmppZ1tUxG0aApg==
X-Google-Smtp-Source: ABdhPJyCGIAAoI71dLj/qcjKz/PoPzuPwJUwJXKHZSDucnAUjSN5pRX1AzCwmMIYB5fd+j1uH7ow6Q==
X-Received: by 2002:a2e:b8c7:: with SMTP id s7mr7183355ljp.397.1613329265539;
        Sun, 14 Feb 2021 11:01:05 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id r18sm2573540lff.270.2021.02.14.11.01.04
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Feb 2021 11:01:04 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id f1so7074641lfu.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Feb 2021 11:01:04 -0800 (PST)
X-Received: by 2002:a19:7f44:: with SMTP id a65mr6579147lfd.41.1613329264262;
 Sun, 14 Feb 2021 11:01:04 -0800 (PST)
MIME-Version: 1.0
References: <651ac50b9ff6ed3db8cab9f176514900f6a02a0c.1613131413.git.agx@sigxcpu.org>
 <20210213031237.GP219708@shao2-debian> <YClYh7pqDlbXy8qh@bogon.m.sigxcpu.org> <6a8eb07f-16d5-f461-cf0b-6c4aaf93b014@ramsayjones.plus.com>
In-Reply-To: <6a8eb07f-16d5-f461-cf0b-6c4aaf93b014@ramsayjones.plus.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 14 Feb 2021 11:00:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjCAVj7J+KAC1pvtdeM-c76oXZq7k=v40-maKjTo6qfVw@mail.gmail.com>
Message-ID: <CAHk-=wjCAVj7J+KAC1pvtdeM-c76oXZq7k=v40-maKjTo6qfVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] usb: typec: tps6598x: Add trace event for status register
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org
Cc:     =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 14, 2021 at 10:42 AM Ramsay Jones
<ramsay@ramsayjones.plus.com> wrote:
>
> >
> > I looked around but didn't find any hints how to fix this. Any pointers
> > I missed (added the sparse list to cc:)?
>
> This is a limitation of sparse; when using the 'stringize' pre-processor
> operator #, the maximum size of the resulting string is about 8k (if I
> remember correctly).

Well, yes and no.

The C89 standard actually says that a string literal can be at most
509 characters to be portable. C99 increased it to 4095 characters.

Sparse makes the limit higher, and the limit could easily be expanded
way past 8kB - but the point is that large string literals are
actually not guaranteed to be valid C.

So honestly, it really sounds like that TRACE_EVENT() thing is doing
something it shouldn't be doing.

I don't think there's any fundamental limit why sparse does 8kB as a
limit (just a few random buffers). Making sparse accept larger ones
should be as simple as just increasing MAX_STRING, but I really don't
think the kernel should encourage that kind of excessive string sizes.

I wouldn't be surprised if tracing buffers etc make such strings useless anyway.

               Linus
