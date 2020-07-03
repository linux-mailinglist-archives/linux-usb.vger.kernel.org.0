Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EDB213474
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgGCGrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgGCGrW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 02:47:22 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9452C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 23:47:21 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id r5so16541551vso.11
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 23:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DCUCaQLha6MIKVG2RQtcncTTFhAZtZEoEDQuEA89l6E=;
        b=X9PCdLgkKg9xunGcjsyr6Ydd9rHGv+CERVMDIjY05q5e8jpZX3G1MSy9Ytj34fkL7T
         1YJDee+/KxtQccMQfbckBu4dF96UuAfVV512gbfdZ+kOMBqXdKPM6K+a4hFBikvasjHD
         p+X7Y2R3cdYxJsPdqA076uQ13CoQmbqhyD1wvISSIxJyv0O8Bn+KahJB02s00oTF3jQq
         ASL0mV2HaLiO9XVQ4qw1dcAWhYDGVb8QvJ8048dWmQa1RplFDRJsSwevg4b0rb58FF3N
         TG4TIaL4aDCVt4l/STX/cwmEqljmE6m+03KzejpcelUPwjrIyD1JgQb/BN4f246tpcgs
         cznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DCUCaQLha6MIKVG2RQtcncTTFhAZtZEoEDQuEA89l6E=;
        b=IfjjMjGgJPoWH3WHwB5mUQAqCalAEcNx7SNVmvDxR7a+3QLk5/UpIakutuJIF/NoJq
         EMAKBogJmtWP1dXhVINi8Eh7O3MIh4d3BsabR5tTzV7lysZC3hjtyW7FLZe1uMgsKYdl
         tbfboshcgDORfQfJ7O4HUHn+56Refs+y35VR9ctoiC31zahLn7C2nSblkYVqnk9jAiTh
         xX6wHnsXkF0VCCCS5tzvaPBwJYZaAbkcGxh7nFbHpfNyFuVWr0gkIDoIAukku2uIBIKT
         Lvh8/UyyJLzvz/xz+B0e5ZKL2MHAIRZqtRKMj/meB7fUVsaf3GM3yYooV7i/q+ISZrnc
         tMtg==
X-Gm-Message-State: AOAM531Tf6j5lI3rOw/T5ETb2yAaSoIF/vkgwxvKGbxuDBG74gmfKswf
        LxDzWDhGVUU1fO4/8uTSyF0HhZpElShMzm5DH1c=
X-Google-Smtp-Source: ABdhPJyxJ0ozQdeHTPnRveDKqtownXDi73eYV9jch0kg2ZOyM0Gd92iBGjqquqLIqJgoSSr66gA/bUQyWgZufCVhj/M=
X-Received: by 2002:a05:6102:3002:: with SMTP id s2mr9674576vsa.2.1593758840977;
 Thu, 02 Jul 2020 23:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAL-1MmUi6OajEYNuP+OOEeekesZJjAGP-8VDSjGydXAMEFHhMA@mail.gmail.com>
 <20200703060013.GA6188@kroah.com>
In-Reply-To: <20200703060013.GA6188@kroah.com>
From:   Chris Dickens <christopher.a.dickens@gmail.com>
Date:   Thu, 2 Jul 2020 23:47:09 -0700
Message-ID: <CAL-1MmX7xKjYUUAgSGfJ7roi6W3ucD+oyQT4vmxAaDtJpjU07Q@mail.gmail.com>
Subject: Re: gadget: Why do Microsoft OS descriptors need their own USB request?
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, andrzej.p@samsung.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Well, the history shows it was there from the very beginning, so it is
unclear (at least to me) why it was needed.

Chris

On Thu, Jul 2, 2020 at 11:00 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 02, 2020 at 05:11:11PM -0700, Chris Dickens wrote:
> > Hi,
> >
> > I've never understood it, so I figure I might as well just ask.  Why
> > does the Microsoft OS descriptors support require the allocation of a
> > separate USB request for the composite gadget device?  Both the
> > default control request buffer and the "special" OS descriptors buffer
> > are the same size (4KB) and use the same completion handler.  As far
> > as I can tell there is nothing distinct between them.  There's only
> > ever one outstanding USB request queued to ep0, so can the dedicated
> > USB request be removed and just share the default one?  I'm happy to
> > provide a patch, unless of course I've missed something.
>
> Try it and see, I think it was needed for some reason, but look at git
> history to be sure.
>
> thanks,
>
> greg k-h
