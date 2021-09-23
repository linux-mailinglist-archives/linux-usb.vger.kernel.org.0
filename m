Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319504162C0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Sep 2021 18:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242435AbhIWQJn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Sep 2021 12:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242372AbhIWQJm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Sep 2021 12:09:42 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026EBC061574
        for <linux-usb@vger.kernel.org>; Thu, 23 Sep 2021 09:08:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y28so28235867lfb.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Sep 2021 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLOxhnwH/JaVIhRbDcxcZPpiYGHLJbtd0CRIGAWnOsw=;
        b=QMXOiJ6n28J2emY/y7cY9+DD4h8Pn0KRvNWmJxYGi/2iw91Mhhsv5k4E/yi6SvFmH+
         cwsdxpHCcIaSp+pnaMQx9j8vfDg38b4ujoTb2lzS4jvwjrgaoWuJfcNbrdzMUshkRDfy
         wyxZpTZP4dsY0GDCSs5bbcT3wFiFu+kSB/Akk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLOxhnwH/JaVIhRbDcxcZPpiYGHLJbtd0CRIGAWnOsw=;
        b=xvOBOTt+GSx+LE7EPrMzlXUS7fveSMF+JjwJP9lNfo2XPwwTTlBuMh4Norz/VjIErG
         TIMekwFnZ6IYCSODJTz13T5V4Zo6Oa29Pz2C33/CJ19D2G76FLd4VrThLwpGtJkQ6Ip4
         h31WPaGl94jF0KU2+RDeyqvJOvF833t1GTiGLjRPmY/TGhvX0WUO5okRLGLT0kE1At9d
         Cf3LStadC0AID9K/azpWpoKbvIQnjJRtX7N+E+mSkq5rklwcumBCM2Pm7vI9lSgRe0nQ
         t559H33PGEyhCTcP8nZ8Bho+Jf165kEFXsZc2KUMBXmFICEQJ8lnR3xYZrVQY1fdGHmf
         w1Zw==
X-Gm-Message-State: AOAM532wbvHjasxN+lyyI2+Hp3V+1Q48bme2LjVXjROa3k+AdnebutNJ
        Y+4LX6Zu0JtJ65MCOffl/wbbq74U6WJMDnlwrv0=
X-Google-Smtp-Source: ABdhPJxprDVmjF9KRJJPLsPasLGjSQgHX34fG+L+ukguIxG1DgxjEQN9QOaJcr6NAQ+EgsdK2Zfeqg==
X-Received: by 2002:a19:700b:: with SMTP id h11mr4886839lfc.180.1632413289094;
        Thu, 23 Sep 2021 09:08:09 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id q11sm493739lfp.134.2021.09.23.09.08.08
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 09:08:08 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id u1so236456lje.12
        for <linux-usb@vger.kernel.org>; Thu, 23 Sep 2021 09:08:08 -0700 (PDT)
X-Received: by 2002:a2e:3309:: with SMTP id d9mr5950451ljc.249.1632412922441;
 Thu, 23 Sep 2021 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210923074335.12583-1-rppt@kernel.org>
In-Reply-To: <20210923074335.12583-1-rppt@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 23 Sep 2021 09:01:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
Message-ID: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
Subject: Re: [PATCH 0/3] memblock: cleanup memblock_free interface
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        devicetree <devicetree@vger.kernel.org>,
        iommu <iommu@lists.linux-foundation.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KVM list <kvm@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-usb@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-sparc <sparclinux@vger.kernel.org>,
        xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 23, 2021 at 12:43 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The core change is in the third patch that makes memblock_free() a
> counterpart of memblock_alloc() and adds memblock_phys_alloc() to be a

^^^^^^^^^^^^^^^^^^^
> counterpart of memblock_phys_alloc().

That should be 'memblock_phys_free()'

HOWEVER.

The real reason I'm replying is that this patch is horribly buggy, and
will cause subtle problems that are nasty to debug.

You need to be a LOT more careful.

From a trivial check - exactly because I looked at doing it with a
script, and decided it's not so easy - I found cases like this:

-               memblock_free(__pa(paca_ptrs) + new_ptrs_size,
+               memblock_free(paca_ptrs + new_ptrs_size,

which is COMPLETELY wrong.

Why? Because now that addition is done as _pointer_ addition, not as
an integer addition, and the end result is something completely
different.

pcac_ptrs is of type 'struct paca_struct **', so when you add
new_ptrs_size to it, it will add it in terms of that many pointers,
not that many bytes.

You need to use some smarter scripting, or some way to validate it.

And no, making the scripting just replace '__pa(x)' with '(void *)(x)'
- which _would_ be mindless and get the same result - is not
acceptable either, because it avoids one of the big improvements from
using the right interface, namely having compiler type checking (and
saner code that people understand).

So NAK. No broken automated scripting patches.

               Linus
