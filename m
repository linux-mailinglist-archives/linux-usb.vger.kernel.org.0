Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9291FF0F4
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 13:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgFRLsc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 07:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbgFRLs3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 07:48:29 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BBBC06174E
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 04:48:29 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id n2so2322318pld.13
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 04:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6O/jSuCCGxuzXrkUBssTHv3Sz4+L6VKcr7RhqXtZPk=;
        b=CUdDzA3fXvAEGjYRT/giP4OS8nSY419KRd553ASyCVB8wsH0CkGzXUjZMHi/TDSdfy
         ku36GqLVLYMGUdjSss4AIhssq4NsV0n53dQ5bLG4VV3eDg0ei+AVOs1ro3Wu+MKGdWNB
         Q5BdSByZ6xw/rFpWD8SpplS7kSDRUDc6qfBrs6JaTX3dCSqijLTMCiK148UpLY0OlrKM
         sevZofuLOzytpcrcMZ1E/NXyN7DhbSb6bFO1ukpffBf+MXPEqkQTzEkbfPippMVtI8FF
         wTtqyKOdqMzL+hx5xHnARaQcKxZEVY4XyEFE3vFm1Z+PfCUMQi3RiBoVMfxbj4j7KRFb
         O5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6O/jSuCCGxuzXrkUBssTHv3Sz4+L6VKcr7RhqXtZPk=;
        b=YKT2FKoHc5Htx8IPexywMN/a6sWKZOkXrWqldS2Im4AHkjPga+9HGU+25N9o7TpIAj
         omdXg14p2tvpk87m8yb0rbiSUbIkbx5NsZRHgTumRud+soxY3iCwGBtX3FQlVlv02sqe
         d+kXWeDS1VtRYrJG2rRLM2XcWOwGkLmSDp2m76/9IPG515foHCclYHw2jqRfrQ8zgUE7
         Ayh6+DY6Eez4+OdwlCKM0T8OqsKs+Bx27Ud/NJzA/8Le2IyWGeiR1WctxrWcL8NxGR8B
         wAp/m07vc/fDgxR1WIjOGklO4qlZ6dRqGa+OEx3Gw9GljWajjcD7dG3ebgXgCi/+fhH8
         z4+Q==
X-Gm-Message-State: AOAM532ygjKruvxPdbKvRvX54hXHILR3AqB/rMTZZR/LsXmu8l43IYW+
        hC0DHYnyjlEO6QBY3YR+VDspjn3pYU4ITwcnBlxwqUOh
X-Google-Smtp-Source: ABdhPJxVDk3nrTjL+t07XaSOW4ynp8vx4kzkRYqW9uiu0taUC8G/MQumP46eatfdGRROAoE6zcRfSoYsTlm3p+5dALs=
X-Received: by 2002:a17:90a:c283:: with SMTP id f3mr3671819pjt.166.1592480909049;
 Thu, 18 Jun 2020 04:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z3tVrvWLa591rDZpbUFR0e_CicDmcgccco+KWyH9Yy1g@mail.gmail.com>
 <20200618083956.GB1073084@kroah.com>
In-Reply-To: <20200618083956.GB1073084@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 18 Jun 2020 13:48:18 +0200
Message-ID: <CAAeHK+y8GQkKYPR4sCU2RgKzZJFaVTyPmLYXJ4PfpwcBD3Ch7w@mail.gmail.com>
Subject: Re: syzbot USB fuzzing update
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     syzkaller <syzkaller@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Kostya Serebryany <kcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 18, 2020 at 10:40 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 16, 2020 at 04:28:22PM +0200, Andrey Konovalov wrote:
> > Hi,
> >
> > As of now all kernel changes required for USB fuzzing have been merged
> > into the mainline (the last one during the 5.8-rc1 merge window)
> > (woohoo! thanks for everyone's help :), so the USB fuzzing instance
> > [1] has been switched to target the Greg's usb-testing tree. As a
> > result, testing kernel patches on the USB fuzzing instance now follows
> > the same principle as on the mainline instances, with a few caveats
> > [2]:
> >
> > 1. You may specify any kernel tree for `syz test` as long as it
> > includes all mainline patches up to 5.8-rc1 (technically all dummy-hcd
> > and raw-gadget patches up to 5.8-rc1). (Specifying commit ids from the
> > usb-fuzzer branch still works too, for now.)
> >
> > 2. Some of the bugs have reproducers generated on kernel versions with
> > an old custom kernel (when fuzzing was performed with in-development
> > kernel patches), and therefore those reproducers might not work with
> > the mainline kernel. The recommended workflow is to: first, execute a
> > `syz test` command on a target tree to make sure that the bug
> > reproduces, and then execute a `syz test` command with a fix/debug
> > patch.
> >
> > On top of that, the USB fuzzing instance now has bisection enabled,
> > but it will only work for newly introduced bugs (as the old ones will
> > just bisect to raw-gadget patches).
> >
> > In time, as we get fresh bugs and reproducers, these issues should go away.
> >
> > At this point I think we can consider USB fuzzing support for
> > syzkaller completed. There are always some things to be improved of
> > course [3], but all the major parts are now in place.
>
> Very nice work, thanks for doing this!

Thank you, Greg! :)
