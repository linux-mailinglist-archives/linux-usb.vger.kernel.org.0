Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958E328396B
	for <lists+linux-usb@lfdr.de>; Mon,  5 Oct 2020 17:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgJEPVm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Oct 2020 11:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgJEPVm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Oct 2020 11:21:42 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD28C0613A7
        for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2020 08:21:42 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id i2so2488661pgh.7
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2020 08:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=937Ptb11fGFmzyl9v6Kwa0u1Svfnlf/stRz9hawR/O4=;
        b=qMnnFqSMr4fJCpey4L4k6a2H4F35DjX0pyqyxlya/gJ8car+ZAqZrQ2DpTPHi8z/4R
         KLjj/LJ/0v5rgr3mj71wV/jrSE77j9Ebd5NyBhVD/SjvoIkkCDu1YJMK+tt/3H3wyxvg
         5luAR4dZlrETngPPG9qwN62GO9SRVdlvyePj4/wY+/pUPPPQCidemk6RXziRNuLNr+aO
         bL1cfgY1WAOgwoVLyxXIZLvxbUSHsQqh8SZNqhgfZmLC9PWrOGjWBet817KoQwE45Uf3
         DnvkR24SAEuWfjvR43cTfaTbsaIKAhKDJnKFlEur4tbXvQTQQ/lVtJi6/X9PdKuqRKb0
         Im2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=937Ptb11fGFmzyl9v6Kwa0u1Svfnlf/stRz9hawR/O4=;
        b=eQ9OfK2LTROtyGNaIzaxXwZc2aPpKzHkj4FWG8bvIUEN/g+RXAWG94XWZIBkqNiJF8
         7F8D7SfKJxDaM/R6JInZ3hbrITZINvKMocwQDlF71qVPKFLK0giPc+JhhW45ypXCOVmQ
         dtyNwKH39kZ60oB9aO775rPVp+U01c+xIojHTldM88Ggd9aABMc5bqNDJZHykjBMv0NH
         7+IecmvouT3duBo8hrfMi8X2CvWSTyIy3aw3Gd9o5hQD/loWS/+YjiRNu5oKujoUZeq8
         YaIw3oamv2P2QAdJDSzEVm4npjoQQ9TbeWRPCINRwJyMvaSxK3mN8s2I0WxSCZ+kNL61
         ZLng==
X-Gm-Message-State: AOAM5306vWMElDSh93llKwq6bpVbLujNRzolK1wRUOV3iBCQRZiQJsGt
        JX4g0leXzT/CAh0CUHAF+BoUpP5Vop/d1oNvK7YqOw==
X-Google-Smtp-Source: ABdhPJz4zY+IBzHR+GiKPb4guWdmFBAZkvqJs3hA04gRsMWsgyj2kRM7yM31VklpMEiz2RG2sBCuZbCMtlUQ2ovZjig=
X-Received: by 2002:a63:2209:: with SMTP id i9mr9135pgi.130.1601911301531;
 Mon, 05 Oct 2020 08:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+wb4k-LGTjK9F5YbJNviF_+yU+wE_=Vpo9Rn7KFN8vG6Q@mail.gmail.com>
 <20201005151857.GA2309511@kroah.com>
In-Reply-To: <20201005151857.GA2309511@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 5 Oct 2020 17:21:30 +0200
Message-ID: <CAAeHK+zes2Y00+EJ6SVtOHj8YCADw5WSXUEFHWCRgxi=H42+4w@mail.gmail.com>
Subject: Re: Is usb_hcd_giveback_urb() allowed in task context?
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>,
        syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 5, 2020 at 5:18 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Oct 05, 2020 at 05:08:11PM +0200, Andrey Konovalov wrote:
> > Dear USB and USB/IP maintainers,
> >
> > While fuzzing the USB/IP stack with syzkaller we've stumbled upon an issue.
> >
> > Currently kcov (the subsystem that is used for coverage collection)
> > USB-related callbacks assume that usb_hcd_giveback_urb() can only be
> > called from interrupt context, as indicated by the comment before the
> > function definition. In the USB/IP code, however, it's called from the
> > task context (see the stack trace below).
> >
> > Is this something that is allowed and we need to fix kcov? Or is this
> > a bug in USB/IP?
>
> It's a bug in kcov, and is not true as you have found out :)

OK, I see, I'll work on a fix, thanks!

Should I also update the comment above usb_hcd_giveback_urb() to
mention that it can be called in_task()? Or is this redundant and is
assumed in general?
