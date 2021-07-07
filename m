Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700DA3BF1C5
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 23:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbhGGV7R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 17:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhGGV7I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jul 2021 17:59:08 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C85C061574
        for <linux-usb@vger.kernel.org>; Wed,  7 Jul 2021 14:56:27 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id k16so5565513ios.10
        for <linux-usb@vger.kernel.org>; Wed, 07 Jul 2021 14:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=6ZNGBLB6dNdKgWr5wbsb6WJQw3HnvPHA3uIojd+3zcw=;
        b=Zf6g+Sqps/YTwX7c0RPmN7UWHjN1ZQ8gk3fpGkXsH5Gpwhbst+Rf5Cx+foEBN3r4FL
         PG/qyB2gmzXk699qqIOMSaybbe2CC3PNy9H7/Nu9R56XholrQigpeWasHW3UFEBqpBhx
         lWY8mAH3qSbJL+S+YpfLLi9Hg3MxuMqDq1KreAnU7VQyybtS/GJpZoiP73DhPZc4Wfy7
         s1Bki4C9KKmbxm33HWSHiX2RocSpEMmUFkNgdt91zYELorHQ7NW7CYzODabE1JQoL1cb
         kKyAJmU0wDKdmAtjJ+CpR0tdbHojcI3BfSAYl3E4Y+n2RZRdrgxHpz/l4N1c5HpB4mGL
         36nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=6ZNGBLB6dNdKgWr5wbsb6WJQw3HnvPHA3uIojd+3zcw=;
        b=cgCxA71L7OjwETm1oy9no65n1FMLEe3d4vi4KMOqZ164YQCCgJTgV+g5yW2L6t9LSw
         WVIxn+ZfzF71XemXYTRAmE2MSBw7vXklJ+dQoe9Gvp3r0QoCpbLLDD1prENc2KGDamnS
         +uBWBH1hZLE2dDp55t55fyycrGFJWURG2JFQk9bU5PKjMrcfrECoe+LQ+/yPF8HGGmXM
         ggg8RhBStRN2gqtzd0fpD03tav/GEwu61EAzgTM0XHlSMydSZCRIumTh7F8TmSKY2Kjr
         QZ6uqSE7KeXp9lcX3KqxFE2zNT3jWGysGv7z2azcDZMgEp76DHxCrDPo64yno0WdJYbQ
         q8fg==
X-Gm-Message-State: AOAM532+gbs+cFyj+4ZdIQUbq3/uTKUbfNsT9sGu8ozS6Y1Qvk2Ax4zA
        bztPejrrGUm5eBOakrwUybJ2rqSR1vVmhbboPX6dGx6jiEM=
X-Google-Smtp-Source: ABdhPJwFEu8Q8KqlxBePdC6cbyNR4b/EmxjkQ0dB44XhZnlkdjzzB0VJ0PsxNXjwrjRwOV4zAKgwTiBDICQiulXPQOc=
X-Received: by 2002:a05:6638:3882:: with SMTP id b2mr11949399jav.15.1625694986927;
 Wed, 07 Jul 2021 14:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
 <20210707144525.GA177599@rowland.harvard.edu>
In-Reply-To: <20210707144525.GA177599@rowland.harvard.edu>
Reply-To: noloader@gmail.com
From:   Jeffrey Walton <noloader@gmail.com>
Date:   Wed, 7 Jul 2021 17:55:36 -0400
Message-ID: <CAH8yC8mZ1J9QZyZPfpsKdJ0NmfbACZOcUqzZ5EGWkyDoGddeFA@mail.gmail.com>
Subject: Re: CH341 driver and the 5.4 kernel
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 7, 2021 at 10:45 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Jul 07, 2021 at 03:33:52AM -0400, Jeffrey Walton wrote:
> > Hi Everyone,
> >
> > I'm trying to track down the cause of some garbage in a response when
> > using an ELM327 (https://www.elmelectronics.com/ic/elm327/) with a
> > CH341 serial controller.
> >
> > I see there's been a fair amount of activity with the CH341
> > (https://github.com/torvalds/linux/commits/master/drivers/usb/serial/ch341.c),
> > but I can't tell if its been backported to the 5.4 kernel.
> > Specifically, the 5.4.0-77 kernel supplied with Ubuntu 18.04 and Mint
> > 20.1.
> >
> > Does anyone know if the fixes and improvements for the CH341 have made
> > their way into the 5.4 kernel?
>
> If you're talking about the 5.4.y kernels from kernel.org (as opposed
> to the kernels supplied by Ubuntu, which might have goodness knows
> what in them), you can see for yourself easily enough:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/drivers/usb/serial/ch341.c?h=linux-5.4.y

Thanks Alan.

As far as I know, Ubuntu uses -oem kernels that track upstream. All
upstream changes should be merged into Ubuntu's gear. Also see
https://wiki.ubuntu.com/Kernel/OEMKernel.

Jeff
