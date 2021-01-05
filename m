Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9E32EB3A3
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 20:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731056AbhAETs1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 14:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbhAETs0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 14:48:26 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698DEC061796
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 11:47:46 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n25so582448pgb.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 11:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SYP7m953Sh1/b2c2QWHDIe0Jh5wcwMv/xNkLawK3758=;
        b=eh1wDbOjV5w7hs1P4onKpIUp9lE3rC9aYw93OThl4XBTbR//RXNgg1ddZHGUSJM+l8
         j5z6U3q4ZKBwpQCBQXtzZFNt8SFT3XJrsxxOIYVM9kiZ2bgTxgYJFtlm06WRzD2M5fPx
         unQkftE/IrnlHmk5qC4//Rf4LFireHYdA+aUFhjMTCK6iv05qt/2++Oq+dah0KOPJACU
         rJBNpSf7hoJ69FbDvgjQXRAJEPxh2TfzU4vf253RiLpb7Jx9RteITtpHQVdc59raQGwN
         Nhrbqb75pWi5SgDvRkGGnI5B8L/8PzAnOMcqJaUxDYkYKu2X+VVvIq3oIAx5odeCx7ro
         a+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SYP7m953Sh1/b2c2QWHDIe0Jh5wcwMv/xNkLawK3758=;
        b=fwdc5QSW1mSrag8WeBUtf3x6bbEAYdbsudBGTcNQqLa8TJ/eMHp57vAk9l9SZXM7N6
         EAqsTUXAHGG6fwzyKgaAZwO2H0giVXs/p5PqlZ0hCzfysyLNw4mMUsWEcF3mdcn2WeF4
         tary4X4SEnzjYf6UMpy5VNB8uDxK7MNooZ01U89QZEtZdW/xtp+0Ayd+37dxQWd0pe15
         uspGnU+Bb7YmMMOqyWlgfZraoRJKFQV+bETvCwi1Fy9ScFWoy4huFE5sW+So5GLKvyjs
         L6usOugeKDjmWvapNOuMJcL+BxZy9ZMxxXq/7JpSjbqVwt+866PoRz0JBwJgIMFHW8gq
         JLbg==
X-Gm-Message-State: AOAM533bzCJaa/syFyw5F2k7AeAo3XL5ayvBFrdUSR44Rn0HJXVKbUXg
        LT9sPLjrb05Is0c53RI9KLg3x+QiTUXcGz8EfWYxOnQQC6U=
X-Google-Smtp-Source: ABdhPJxhroH34+vSYSarAuRTjMCJ5S8MtNXWuVuKYQlAI+XBfJwbtK0ug3LB+EwIdTaSKXQ6HKiB4gm/5RKVI+n7SKM=
X-Received: by 2002:a63:4644:: with SMTP id v4mr851869pgk.440.1609876065848;
 Tue, 05 Jan 2021 11:47:45 -0800 (PST)
MIME-Version: 1.0
References: <d7035335fdfe7493067fbf7d677db57807a42d5d.1606175031.git.andreyknvl@google.com>
 <X+nxQo7q2n4dGzoy@kroah.com>
In-Reply-To: <X+nxQo7q2n4dGzoy@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 5 Jan 2021 20:47:35 +0100
Message-ID: <CAAeHK+xNDvauf-SFoBcUfcPA_6fL_FhP-w2mys+Z-heyd0-VEA@mail.gmail.com>
Subject: Re: [PATCH v5] kcov, usb: only collect coverage from
 __usb_hcd_giveback_urb in softirq
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <shuah@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Nazime Hande Harputluoglu <handeharput@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 28, 2020 at 3:51 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 24, 2020 at 12:47:25AM +0100, Andrey Konovalov wrote:
> > Currently there's a kcov remote coverage collection section in
> > __usb_hcd_giveback_urb(). Initially that section was added based on the
> > assumption that usb_hcd_giveback_urb() can only be called in interrupt
> > context as indicated by a comment before it. This is what happens when
> > syzkaller is fuzzing the USB stack via the dummy_hcd driver.
> >
> > As it turns out, it's actually valid to call usb_hcd_giveback_urb() in task
> > context, provided that the caller turned off the interrupts; USB/IP does
> > exactly that. This can lead to a nested KCOV remote coverage collection
> > sections both trying to collect coverage in task context. This isn't
> > supported by kcov, and leads to a WARNING.
> >
> > Change __usb_hcd_giveback_urb() to only call kcov_remote_*() callbacks
> > when it's being executed in a softirq. To avoid calling
> > in_serving_softirq() directly in the driver code, add a couple of new kcov
> > wrappers.
> >
> > As the result of this change, the coverage from USB/IP related
> > usb_hcd_giveback_urb() calls won't be collected, but the WARNING is fixed.
> >
> > A potential future improvement would be to support nested remote coverage
> > collection sections, but this patch doesn't address that.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > Acked-by: Marco Elver <elver@google.com>
> > ---
> >
> > Changes in v5:
> > - Don't call in_serving_softirq() in USB driver code directly, do that
> >   via kcov wrappers.
>
> Does not apply to 5.11-rc1 :(

Hm, I see version 4 in 5.11-rc1. Let me send a fix up.
