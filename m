Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7271B3E4307
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 11:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234537AbhHIJmg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 05:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234408AbhHIJmg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 05:42:36 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BF7C0613D3
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 02:42:16 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id z3so15729039plg.8
        for <linux-usb@vger.kernel.org>; Mon, 09 Aug 2021 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A+KAi3dOJuuXd/Qn6cacTVo6xH3AW7xPjOFYRrz7Uok=;
        b=HymP0PD2B0cGVjnMKzIUkUNnIY+q8voQCdep9RSZJP0rhHG+lzU47AL/ksz8la8qDT
         ROPMbY8e9eOtI20PzVcxAUx7Z2MOEU0oxI5YdRQlekp97dEmylrRvQrzzmpiHwOK2CdZ
         0+e/b0xFJgPZRRRdDWQ1rAhnthQkeuCeTmaKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+KAi3dOJuuXd/Qn6cacTVo6xH3AW7xPjOFYRrz7Uok=;
        b=D7a7ilTftyu9CMbkgOX2gcv0abVRUXcY7N2viChvdYy9x0ayJMFtnqiFVOJxxefZAk
         ftgx6Tb+slujQXfakPUm5LxDnFnaD4iSYjxdeR8ZwolfyyeXu1k/Pl4R4RY0yQZ5SBn5
         0WZe3NufPObf8JOQ6aKvDFvMg/wyf4jGa3CHSs4NGh8dW/YxK9CVg3LFu2SHGJlUWuV0
         eouiTL/hzYNjDub+X6ZN7XNUFliEwYnYervpCDAwzvLFN8FeTuJJqDwRNaJDHBKdbVAl
         GmO73WfibfXk6QYiv11dlOKhIlLk+lRlFGCGpHDwHQstz0vORleA442het+s9GLAPTzS
         G3Uw==
X-Gm-Message-State: AOAM531LX4WGf3ev6Jawoq6aSbOxXEbfWFxXsN4gIFTwl8yUw6gKRMfD
        8AWk6jxbZTn4e6Nljsbf0CaFKT9MZCezA9LVJrzFBw==
X-Google-Smtp-Source: ABdhPJwRNv1bYkHAya2aLwiLdoTT5Z3Wow97kzaNiR834PT5Mj0uvowBEIf7DGlFoiv/Uu/Nnd6z8yYjrp74f4fs4XI=
X-Received: by 2002:a17:90b:102:: with SMTP id p2mr674822pjz.126.1628502135890;
 Mon, 09 Aug 2021 02:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
 <YRDxTodNNqtnpPpn@kroah.com>
In-Reply-To: <YRDxTodNNqtnpPpn@kroah.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Mon, 9 Aug 2021 17:42:05 +0800
Message-ID: <CAATdQgDSCzZtiDSQk94CYHfSb9Mq28OH7-RdaTZNv3oPrW3nkQ@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 9, 2021 at 5:11 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 09, 2021 at 04:59:29PM +0800, Ikjoon Jang wrote:
> > xhci-mtk has 64 slots for periodic bandwidth calculations and each
> > slot represents byte budgets on a microframe. When an endpoint's
> > allocation sits on the boundary of the table, byte budgets' slot
> > should be rolled over but the current implementation doesn't.
> >
> > This patch applies a 6 bits mask to the microframe index to handle
> > its rollover 64 slots and prevent out-of-bounds array access.
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> >
> >  drivers/usb/host/xhci-mtk-sch.c | 79 +++++++++------------------------
> >  drivers/usb/host/xhci-mtk.h     |  1 +
> >  2 files changed, 23 insertions(+), 57 deletions(-)
>
> Why is this "RFC"?  What needs to be addressed in this change before it
> can be accepted?

sorry, I had to mention why this is RFC:

I simply don't know about the details of the xhci-mtk internals.
It was okay from my tests with mt8173 and I think this will be harmless
as this is "better than before".

But when I removed get_esit_boundary(), I really have no idea why
it was there. I'm wondering if there was another reason of that function
other than just preventing out-of-bounds. Maybe chunfeng can answer this?

Thanks!

>
> thanks,
>
> greg k-h
