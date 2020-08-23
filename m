Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4407B24EEF5
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 19:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgHWRTW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 13:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgHWRTU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Aug 2020 13:19:20 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB210C061573
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 10:19:19 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q93so2363291pjq.0
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jtx84NHnOo1lt1iC9Reos0iIfV8G9wjY+VqA8Hm1o9s=;
        b=VIgvqxmdXQu0VUPw1uBT17ZshQuBMO6dj71nbntBuQx8rEGu9CaZ/cl8DkNiOgFG2C
         JesNV04CJQy4DgKbc0fA4Uvau+f3tbPNWM/gdmJphYRBxFuuIUgTJblttN2RgLSd4UUu
         IQDjYSmHAYHn/hsa03ifP5HL+M3mZ3byxDjnxLDhlb/uiFeH4ZwWk6OGLON9bIQxwNDr
         uDaTS2FvgDGR+fvm9r/Vb1d68G6mI3JZvleRei5J8FG/Hiua8z4AOOYCiacGj9XqkpEH
         5v608ktui87SQ2ktP2D9XTBS6y3kS06uqlA1RL9+zPBQuRj4QzA2C7y6da0eu36YVLuW
         8v0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jtx84NHnOo1lt1iC9Reos0iIfV8G9wjY+VqA8Hm1o9s=;
        b=s31wWMUAsysrPi8IBkfaocPAEmoqHBP72Um4y0fxR0+1F2MUHescH+v4lZsda7s5GT
         Nx1FY1HRuWnKci9kJr6fYJbNV+Zfuf0eelEZ4oUBvcBam8jZGsPyQbvW0XFqCu4RHMD5
         OGq3zpbavk/VlskdSLyl5qFNrNLx7zxYQEszo5DeV4o0OHwdFihKaFl68NONzkV+gEwe
         bvAhjfFzR9/McO7UjzkP+05OKBd1cQEo5gH6qN25HMV2+l1GOUTCOOZGrZU/3tldpEZ8
         sH+9z8wo3FiNykhtWPbl9F7jRIgrzeovuGkjP4tVOi6g5S2MaCJZ9OMCK95QJzcKOdA+
         umiA==
X-Gm-Message-State: AOAM5338KXq1JFg8xyX/JUrgDxG9E1K1BqHFoOS+8kGXyZxczHfD0PUF
        trsVzAiStRMX2UEG6rfvzwvALouAKZnEye8fmEXwEXc5bDg=
X-Google-Smtp-Source: ABdhPJySEZl3PemTzmmghTt+H5k96bDZ+zvQOCRH8rG1vj8Xz/V5gfhUBuAUDHxaCKKZwBGs00zTJP8VqUKgTVkN484=
X-Received: by 2002:a17:902:e78d:: with SMTP id cp13mr1349072plb.105.1598203159248;
 Sun, 23 Aug 2020 10:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
 <20200822200107.GA288350@rowland.harvard.edu> <CAMqbrUiRfk7uy+oPwwsvjL+CZNGEFGonGRx5LMGyQ7UTwrPA8A@mail.gmail.com>
 <20200822204107.GC288350@rowland.harvard.edu> <CAMqbrUhtoZxg--Gp0un=sKYBWfmtmNMYR+8rvyRHxdKsjWY73w@mail.gmail.com>
 <20200823004316.GA292576@rowland.harvard.edu>
In-Reply-To: <20200823004316.GA292576@rowland.harvard.edu>
From:   yunhua li <yunhual@gmail.com>
Date:   Sun, 23 Aug 2020 10:19:01 -0700
Message-ID: <CAMqbrUiRir-JU2WWk=dbH9u_Qgd6NVtXCr8e80Bk+bx=YFXmcw@mail.gmail.com>
Subject: Re: XCHI bulk transaction latency, data lost, NAK stats
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks, I'll check it out.

On Sat, Aug 22, 2020 at 5:43 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sat, Aug 22, 2020 at 02:03:02PM -0700, yunhua li wrote:
> > Thanks, Alan, your answers are really helpful.
> > one more question:
> > > It depends on what other devices are attached to the USB bus.  They may
> > > or may not require some reserved bandwidth.
> > Is there any tool/method I can dump reserved or allocated bandwidth
> > info of each  USB device?
>
> You can run "lsusb -v" and you can examine the contents of
> /sys/kernel/debug/usb/devices.  There's more information available
> under /sys/kernel/debug/usb/xhci/* but I don't know what the format is
> or if it includes bandwidth reservations.
>
> Alan Stern
