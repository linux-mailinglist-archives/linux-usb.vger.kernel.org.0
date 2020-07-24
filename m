Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4676222CF08
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 22:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgGXUGH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 16:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgGXUGH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 16:06:07 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC40C0619D3
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 13:06:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m16so5139161pls.5
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 13:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mock4yITmusHCt/J+nz7q/uJJ5ezoPfjtI2UT2SuLXA=;
        b=iGdYuHzf3rp6kf1S5htt2sDxOZyrH8HX3ZNn+aW6ZhZpCrrl+qsBoXYzdJzHMPONAx
         ssBni3hhvPCJXIZ5byUcmgdVqC4JrP+K7HqypTjGOJiSCAC393mWyIjJRgc4Iyc1XaWC
         +Kz0z4sBNwiax+QwzGONM8wFicCZbG6TOACRDHpOLDovXniS3wTqcuvrudKc5HiL9nPf
         g5xJzdzF+3XcMS9/St1zg1AT6CV0HDEgPLPFkB6OqLCYKwC+dakbQo0f/aBUQvpuonxb
         ZNBNpQLK5RfIr/Q6KwIi7ugskTuydQehAl2pQTGi3lOYXoaIGqDBnisKBj5aZ9MOpr98
         jmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mock4yITmusHCt/J+nz7q/uJJ5ezoPfjtI2UT2SuLXA=;
        b=KOPVot37KshQOIKlVeTE1wl/3+N9ZN6i4kbyNCVA5BKjXjxJcmbiI8UdBaXj11DM45
         wNqLOFwIxFiojqNyyAOKn2DjAqS3qQcBtYu36wdXfxu9xdeIZgF/G2o5GO7Si3iJy3ux
         DHoRRFj8Nm+1x+6FsTTera+JLJQ3g3vQp3m04yIWepi3H0WLySKXVV+qWnUPlkkLRm6w
         kN24nbX42IUagIqEnlA30MYJS5h7Y8KdJR+FdDVcMJtzTvJJGcPvaGlLwKizb2qANNlz
         fAOBJ2u1CUFN8LeN1lpRgeYsaiIxBdeGL/AjOmlKurVBsbHIoloug1+s1qVd46HqJB2o
         /evg==
X-Gm-Message-State: AOAM532DQjIAzsj0e0OR2f/nhHInbx83E8DQhRL8J+CmucTurirbDhPC
        gDZhuCSLl/IyLJ2nrC5gVuqNIHV/NRQKUmXMaDY=
X-Google-Smtp-Source: ABdhPJzNRzCBg4az0hf7733SxLskNepRrUl1cIVqOQrY7tnK+NfX44H67+x8XnFEAHdtvOUI6d1PM88NLBeb9vqBC5o=
X-Received: by 2002:a17:90a:498b:: with SMTP id d11mr7365797pjh.129.1595621166679;
 Fri, 24 Jul 2020 13:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
 <CAHp75VeKY0FSdfza0E9Fz8=2dCyPXwPZYE0kjywiRQAsvmbiow@mail.gmail.com> <20200724152707.GB1388675@rowland.harvard.edu>
In-Reply-To: <20200724152707.GB1388675@rowland.harvard.edu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Jul 2020 23:05:50 +0300
Message-ID: <CAHp75VcPOQnOfiG5RyuwjjyUkyEz+u9RbwqNHBmG3tT2g3XJLg@mail.gmail.com>
Subject: Re: [PATCH v4] USB: Fix device driver race
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bastien Nocera <hadess@hadess.net>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 24, 2020 at 6:27 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> On Fri, Jul 24, 2020 at 01:32:40PM +0300, Andy Shevchenko wrote:
> > On Fri, Jul 24, 2020 at 12:03 PM Bastien Nocera <hadess@hadess.net> wrote:

...

> > What about
> >
> > static bool is_dev_usb_generic_driver(dev)
> > {
> >       struct usb_device_driver *udd = dev->driver ?
> > to_usb_device_driver(dev->driver) : NULL;
> >
> >       return udd == &usb_generic_driver;
> > }
> >
> >   if (!is_dev_usb_generic_driver)
> >     return 0;
> >
> > ?
>
> Why would you want to add more lines of code to do the same thing?
> Abstraction is fine up to point, but excessive abstraction only makes
> things more difficult.

At least to put into ternary will actually reduce LOCs in the original
code (if we drop helper).

The idea of a helper comes to mind that somebody else might reuse
(__check_usb_generic()?).

...

> The logic is wrong.  If usb_device_match_id() returns NULL then we want
> to go ahead with the second test, not give up right away.  But this
> could be written as:

Yes, sorry I didn't think well here.

>
>         if (usb_device_match_id(udev, new_udriver->id_table) == NULL &&
>                         (!new_udriver->match || new_udriver->match(udev) != 0))
>                 return 0;
>
>         device_reprobe(dev);
>
> This would make the overall flow of the routine more uniform.

Yes, my intention was to make all error cases go first.

-- 
With Best Regards,
Andy Shevchenko
