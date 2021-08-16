Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8AD43ECD5A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 05:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhHPDxB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Aug 2021 23:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbhHPDw5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Aug 2021 23:52:57 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88782C061764
        for <linux-usb@vger.kernel.org>; Sun, 15 Aug 2021 20:52:24 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id k8so2651359wrn.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Aug 2021 20:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rtst-co-kr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OjBS7XowESFiWJsSGjvLZ4RydtkVdz+gLxobSU99QqY=;
        b=1VR0YyL8mVg6rKKOILDpgv7EDbYYU86poGMz/6F9wEqYvxw+b2z9wNhF3eFjy0y+85
         9hJY8q0d8EDulGLjfMSHCeyr8zpAXIIlMF0jXJo7WWzigkGV4ucQixq5wxSltayK2iPI
         Fq3B9COtGlc/1hDEAo8EGNQGzwPsXAU3rldMa3XU7cyM5Eu+XFDAN2A4TFKnk8da7MaF
         lc2npQRwn67kI94GPallAg0vE+ixg++/CAbLsE0zxAujOZhtHR19Fb2WanPQ2cEhrbQF
         HvcLQfIMGF8gEM4Ng3o+3shPsWOAG01N9oSNSU5gd4ZM5370U2HxDL8Hy0CmniEenQbR
         K5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OjBS7XowESFiWJsSGjvLZ4RydtkVdz+gLxobSU99QqY=;
        b=BZkZnq5kVj+oXjZpw8ac0vUP8BcLjlL6fCArzaRMWzdsEuAqF9KHQnZ0yA5CyVE+qB
         O96O5Pa8/pLAjxFs2WOoP5yppZNMCD7qMFwIwx3i6g4xk3cout3ulStlQmdNGOmwUN+2
         XoXJM8z8VUFcMCB+Jdax8IhtbyzB/bdxDg58mch7HqASr6Nv7yRFBufQib0lCuIDs53n
         ncZNGFb90T1ygreHlSUHZZx8H1EVm0oCjUNKeolS9Nuz/lSZg8qJbTTHOxW81hXnDhPC
         KUxLJak2hE/HRY++zXY5op7An+x5j6kOyZm43ahKyok4SDXNrUvjqfF4N7Lt5MmFRSFP
         HGEQ==
X-Gm-Message-State: AOAM530dMqC4vceTL0p0DwSMJrGxshLvBBfFj5DM9GJNlxqShrsrZ+iS
        iqxJPrQ1MJF1DGoWik4m8T23KfklsOd2eXFRYFKfCA==
X-Google-Smtp-Source: ABdhPJxT4hGC6JmsQpk3KerNYVeb5MKH9QfKpgMHKFcQHwwRwCU8psp42eZZ3UOH2LOj1yla/fm/qfX2T13Mph+nxOE=
X-Received: by 2002:adf:e7d1:: with SMTP id e17mr13018367wrn.151.1629085943115;
 Sun, 15 Aug 2021 20:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210810060228.GA3326442@ubuntu> <20210816005205.GA3907@nchen> <20210816010327.GA106658@rowland.harvard.edu>
In-Reply-To: <20210816010327.GA106658@rowland.harvard.edu>
From:   Jeaho Hwang <jhhwang@rtst.co.kr>
Date:   Mon, 16 Aug 2021 12:52:12 +0900
Message-ID: <CAJk_X9gYggnz729k0vT5Lcv1J=i16HkEjZY045FXzFZTGhNW4A@mail.gmail.com>
Subject: Re: [PATCH] usb: chipidea: fix RT issue for udc
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

2021=EB=85=84 8=EC=9B=94 16=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 10:03, =
Alan Stern <stern@rowland.harvard.edu>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> On Mon, Aug 16, 2021 at 08:52:06AM +0800, Peter Chen wrote:
> > On 21-08-10 15:02:28, Jeaho Hwang wrote:
> > > hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
> > > to prevent local_irq_save should keep the function from irqs.
> > >
> > > I am not sure where is the best to submit this patch, between RT and =
USB
> > > community so sending to both. thanks.
> >
> > Greg, do you have any suggestions about it, the RT kernel schedules the=
 interrupt
> > handler (top-half) out which causes the USB hardware atomic sequences a=
re broken,
> > these hardware operations needs to be executed within limited time.
>
> The RT kernel does its scheduling based on priorities.  If the
> interrupt handler is scheduled out, it's because some other process
> with a higher priority needs to run.  The answer should be to increase
> the handler's priority.

It is not a schedule issue. Priority does not prevent atomic sequences from=
 irq
handlers which run in interrupt context. So we added local_irq_save to prot=
ect
explicitly and asked if it is the right approach.

In addition, I've checked if all functions in udc.c, which have the comment
"execute without interruption", need to be protected from irqs. And I think=
 no
need for the others since they don't seem to have any contention between
tasks and the chip as hw_ep_prime has.

Thanks.
>
> Alan Stern
