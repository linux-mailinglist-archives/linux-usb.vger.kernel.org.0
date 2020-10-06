Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5870284F32
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 17:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgJFPoq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 11:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgJFPoq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Oct 2020 11:44:46 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154CAC061755
        for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2020 08:44:46 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id l126so9266821pfd.5
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2020 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bvPeygSRI48grLUqNULD5W+f3mhPyObVQKrAhFQNIS8=;
        b=vx+TAEpaWL989xTX2O3znU6AUP/8syf/G6qWeeQ9jW8jvLsF3Pa1BQJ+xVLpQx4iiM
         NDDOjNh/uEC48cIOE2dLgKZzSwdKoEFeX7Dt7nYu+fQSB62N3F+B/WTc4B7pkUNndi9v
         42KZvZYnrlLjmsaDZ7C9l9oE8/FTolU4RkTnKrtaEHcn3Yxts+MDm8zXw0VrafHcfhQ7
         20y3kr1QwJ6g3KWOFhVxQMnrBilp/8YuhnfenoIdE3yiyjPLqDoy+mA6tZKcC3/sEJjm
         kYLbUYscXFdJrULjlE4wTAEPOLnhHvsoQwB/GEVGqq3+r5+/RJhgggVgvreXOgwbCK5L
         Y32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bvPeygSRI48grLUqNULD5W+f3mhPyObVQKrAhFQNIS8=;
        b=sfDU1Z0rvWz6uVHFO2Vx6xGljiKr0cnSThXImiZelm2JTHD03FGp4DZKwBGJn4ErSU
         PEnl49vWu+Zpi5Yf8SwTqYp7JUUQUtflnFfKPwbc2aREb9INY1f4vlE3/11fE3WqLQ/s
         QyScQHdfoZMY/ojCml9wbwlQg0lopZ0ZBQIqJa/zVOvx0GW5zC0VgDAFmcWJ+/tgKghH
         SUHaep6VZI+ZGnagECD4Oti+Qw64y3qAqlnl3dvxHYStErD4iCdj1Jx54nadOdGh9Kg1
         mzb2sBsHmwJg8Crsbkp+q+1lsPHNBXOmd7oy4mVKdFTarxK2cykiEtolMTQCqKDcyPyv
         h8oQ==
X-Gm-Message-State: AOAM5310Z79+NYgjBaj/ZJuKjxMGoHeCiJtiiLIEr0+B6t4s3SPcWgDD
        OBG9e4R39PgEQRT0hEJPwPeRH6eowr9IuO+OP5iYDQ==
X-Google-Smtp-Source: ABdhPJxu8epATsAnVzNpcf9DQmiAD+l96Xpgn7WIfZOTDnvcg+MTv+IsH7tnMqOinZpjj62OnUSaG8BlODYz9bVMiJs=
X-Received: by 2002:a62:78d5:0:b029:154:ebc0:c92c with SMTP id
 t204-20020a6278d50000b0290154ebc0c92cmr1268030pfc.24.1601999084773; Tue, 06
 Oct 2020 08:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+wb4k-LGTjK9F5YbJNviF_+yU+wE_=Vpo9Rn7KFN8vG6Q@mail.gmail.com>
 <20201005151857.GA2309511@kroah.com> <CAAeHK+zes2Y00+EJ6SVtOHj8YCADw5WSXUEFHWCRgxi=H42+4w@mail.gmail.com>
 <20201005152540.GG376584@rowland.harvard.edu> <65b4ff62-f9c8-b9cf-50bb-c9b08cce7230@linuxfoundation.org>
 <20201006012333.GA399825@rowland.harvard.edu>
In-Reply-To: <20201006012333.GA399825@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 6 Oct 2020 17:44:33 +0200
Message-ID: <CAAeHK+w3hUbNO5PBcoZX2cJsmRPZ8bq+8j8-Xs7nZLFyKbdd+A@mail.gmail.com>
Subject: Re: Is usb_hcd_giveback_urb() allowed in task context?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>,
        syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 6, 2020 at 3:23 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Oct 05, 2020 at 05:38:22PM -0600, Shuah Khan wrote:
> > On 10/5/20 9:25 AM, Alan Stern wrote:
> > > On Mon, Oct 05, 2020 at 05:21:30PM +0200, Andrey Konovalov wrote:
> > > No, no -- it won't work right if it's called in process context.  Not
> > > only do the spinlock calls leave the interrupt flag unchanged, also the
> > > driver callback routines may expect to be invoked with interrupts
> > > disabled.  (We have tried to fix this, but I'm not at all certain that
> > > all the cases have been updated.)
> > >
> >
> > In the case of vhci case, usb_hcd_giveback_urb() is called from vhci's
> > urb_enqueue, when it determines it doesn't need to xmit the urb and can give
> > it back. This path runs in task context.
> >
> > Do you have any recommendation on how this case can be handled?
>
> Just call local_irq_disable() before usb_hcd_giveback_urb(), and
> local_irq_enable() afterward.

OK, so overall it's possible to call usb_hcd_giveback_urb() in task
context, but only with irqs disabled.

This means we do need a fix for kcov as well, thank you!
