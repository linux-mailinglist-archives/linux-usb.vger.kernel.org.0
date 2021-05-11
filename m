Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03EB5379B0D
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 02:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhEKAHI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 20:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhEKAHH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 20:07:07 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5824BC061760
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 17:06:01 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id x8so17220229qkl.2
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
        b=KFj5l6zhdrS0fLCWMGjmr/xO4BlTFtZoz3C0X6f4yXPAPd4QFYCKQ6VCRUB/RhrcYc
         /aNljSGJlQqpYw9kb4Ei54tqu7LZbNffzPVR359jRbFKseto3PQlwou2i3Frh18gwxLZ
         83EJdcrxGqEoNBrlRvGIOn9J8VC7CuWrNZTlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUM6GCiWQ87fBmMe4R6b3VuwWCudO1qdVICMp3zaKIc=;
        b=ko7O8TaKa3zZzewhyGIRnXjFyawylJU9PqNM1ZELr3MjYT1NuEpDn3ffg+lt4xuVUg
         6U5YyAoWM3OlRWdXYjKIDnDxNt3IpzD0Zx9snWE7Tfh1ogvvKdKSO91FpMRz2ZBQX4W0
         EviN4xmseAm4Qp/Qtvzgp7h8QVtDdDm5MHOMSH16+fXUWnh/XWxfPZyn6ehpmaSHMH8t
         W4JIwMWV41LnGeN955/e0bt4fE8+lDOrpniF03zAensview3iizVYdDSQokAWybGiS/p
         JUt3DSSXtnygSlmS8pXh89J4L7T3RfMYs21dsYUgfpc3LQoXag7R+qxHLKHnGiAO0daP
         3Ybg==
X-Gm-Message-State: AOAM530j6kp8uwf2CwvwKoSC8AWD6PhYdTMr7FXF/trPt0ZKtwE19GwH
        VjFF8KSA8WP7O8IFQnkiCqBtfol2UVVpgA==
X-Google-Smtp-Source: ABdhPJyIB+Y8NTTG6w45yvHuEYsXlELGZQc+VYZVVQIts75ivUQGvnvdvezqr5cqUJ7eigtoi6u1bQ==
X-Received: by 2002:a37:30c:: with SMTP id 12mr25288225qkd.355.1620691560417;
        Mon, 10 May 2021 17:06:00 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id j9sm14872189qtl.15.2021.05.10.17.05.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 17:05:59 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id h202so23966130ybg.11
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 17:05:58 -0700 (PDT)
X-Received: by 2002:a5b:8cc:: with SMTP id w12mr37539122ybq.32.1620691558469;
 Mon, 10 May 2021 17:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210510150413.59356-1-andriy.shevchenko@linux.intel.com> <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210510150413.59356-2-andriy.shevchenko@linux.intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 10 May 2021 17:05:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Message-ID: <CAD=FV=VpuyYBv2tj5AHLx7U7vfCpH1A6hfG_amscZ6OupRwEHg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] kdb: Switch to use %ptTs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Petr Mladek <pmladek@suse.com>, JC Kuo <jckuo@nvidia.com>,
        Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-tegra@vger.kernel.org, linux-nilfs@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, May 10, 2021 at 8:04 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use %ptTs instead of open-coded variant to print contents
> of time64_t type in human readable form.
>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  kernel/debug/kdb/kdb_main.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

I kinda doubt anyone would really care if we just switched kdb to just
the old "%ptT". Probably no machines are parsing this string.

...but in any case, now that the nifty new format is there we might as
well use it. Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
