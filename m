Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648732A2991
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 12:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgKBLbH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 06:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728542AbgKBLbG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Nov 2020 06:31:06 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AECC061A47
        for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2020 03:31:05 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id v123so3277781ooa.5
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2020 03:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAOiszuYUyIyWLQKIJG6bc55M3RXwlsKsxrmhc4uVW8=;
        b=RHq+P4QISBX4bWERbI32Xd6fFCiT1evuu26nesDDnjre/0R7UEXgt1be1gQR9BjPkh
         idJSK5mAMe+xk6rG5/lB1KsEHZ0Oe0XaC7T8lQCBUNGKH1gJL9gAmFOAY93Xa7n2fkfb
         JRWdzEF70nhdCmjgOrlXQYuI7njHj/tX/iWss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAOiszuYUyIyWLQKIJG6bc55M3RXwlsKsxrmhc4uVW8=;
        b=DlJ6FuNQoJ3hiThYilksUdKybyTuQXycGOBSoJL7sO/4tqe8R4tTaBQGQXFOo3SIHH
         UoT+gSyMRAzw7SPRmK4GmSPZpyDWQkzS+mzyEL88QzuGVfDQabryqWDTfcUeNHpw91Sc
         skw/zpkHt2EF9HclTpPqJg5to1zrCip9tLg8w/dkuDg988JsYy69osdWjZkhNvf8Xq7T
         lmX79/jI+NVnd8IXglDSbJkvwF03oWa3CMiKtaXJMmlZYKcwS0+jGJzlUgR6NLH4sUTJ
         le1rbuL4iNZE6Fr4y3me0FdmdadSvsezL/+sV7L8KLyuclK9KJ4J7DaRqGHuOVawzHNU
         XR5Q==
X-Gm-Message-State: AOAM5314+NZh36MFUM2cC7g/ze8UjMu6QfnBx8u1vcSQXH1lBmcYnOEK
        NV6FTwhgNgdN/Nop0bHqK4riUc+cc1rKEGC+2rbW+A==
X-Google-Smtp-Source: ABdhPJymTv/GY1o66DtI8nUb04RogVy4P/jau3IpWYQX9hL2oM8RWoh0Dt8euA0YAJD1frHT9NECvc2I9O/h/4i+Pzk=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr11571270ooo.28.1604316665320;
 Mon, 02 Nov 2020 03:31:05 -0800 (PST)
MIME-Version: 1.0
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
 <72c954371ed9b1d050901b2d498a979017de8a3c.1604306433.git.yepeilin.cs@gmail.com>
 <20201102101044.GM401619@phenom.ffwll.local> <20201102111248.GA1558630@PWN>
In-Reply-To: <20201102111248.GA1558630@PWN>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Mon, 2 Nov 2020 12:30:54 +0100
Message-ID: <CAKMK7uGPnNM_96DgtJx0qqocNcro2y_skT21J-CqF9oX8651fA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tty/vt: Avoid passing struct console_font_op to con_font_copy()
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        George Kennedy <george.kennedy@oracle.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 2, 2020 at 12:12 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Mon, Nov 02, 2020 at 11:10:44AM +0100, Daniel Vetter wrote:
> > I'm not sure switching from int to unsigned just here makes much sense.
> > All the console code is still using int con to index all the various
> > arrays (I just checked fbcon.c code), and using int to index arrays is
> > pretty standard. As long as we have the con < 0 check to catch evil
> > userspace.
> >
> > There's still the switch from op to int for con_font_copy, but I think
> > that's better done as part of the larger cleanup we already discussed. And
> > then maybe also include patch 1 from this series in that rework.
>
> I see. I think at the moment there's not much we can do for
> con_font_get/set/default(). _get() and _default() use *op, and _set()
> uses all except one field of *op. Maybe we can change the type of *op
> from console_font_op to font_desc, after cleaning up everything else?

Yeah, for these one of the arguments should be the new font_desc, so
that we can remove the op stuff properly. Opening up all the arguments
without the font_desc doesn't make sense imo.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
