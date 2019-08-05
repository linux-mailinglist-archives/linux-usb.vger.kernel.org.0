Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA6781402
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 10:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbfHEISO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 04:18:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43255 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfHEISO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 04:18:14 -0400
Received: by mail-wr1-f68.google.com with SMTP id p13so8865349wru.10
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 01:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sB8/jBGNJ4eaU5+9Q8qg8iJSWRXJGL2eMDg9Gl235Vg=;
        b=HDdsCMNeSU7q97JB581wr1eSeNVqs9NDkXLae4swgVhW821ac/tiedO//wcWacWi3o
         1jL7ezBo89L7SolJkd232EfQpZN967kyJTnj0xlmx1vBUJX9KZCXQZLAFccP8hshwBPJ
         JsRhg2UtZXdq18b3Y9P+xLketz1CXSaBUNfBHw9iWEn08BXjYi02xOckJH5+yxPJ+KDO
         b6RrxLeBm9SPjKRgA9XXNvZwbEjpXd6pgVjrf0MhMCm3UUIqdjnaMDb9I6Kc9tsAcxa7
         42gzyaIkdiyUvbY3fuQSDjzmG5KcPZNIBYsZR8bzL9MI4117e8SlCU7vpMTK8OhPv0+R
         ZYvg==
X-Gm-Message-State: APjAAAWAyk7GIXMgku8pivNqwVhm8rZ444gOd8oeR1c+zOhIZ/lUsg01
        iqZcebZow+5eUNH7Ir7iQXgdDZGlpM7P6lxZRznZpW9OQ/A=
X-Google-Smtp-Source: APXvYqxhpxPP/VLIhgdtQDI06Wld14lq1x8s8f5mhricS0ulDNKUr3cxxhbcx1GG8Bxlgs7XsyzUQbpqd0Rq0ggwb3I=
X-Received: by 2002:adf:f851:: with SMTP id d17mr25211663wrq.77.1564993091686;
 Mon, 05 Aug 2019 01:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190802053843.GZ1131@ZenIV.linux.org.uk> <20190802065743.GB7786@lst.de>
 <20190802160327.GA1131@ZenIV.linux.org.uk> <20190802171321.GA2860@ZenIV.linux.org.uk>
 <20190803161619.GA484@ZenIV.linux.org.uk> <CAHk-=wjV+opOWSw4zhaZRJ6uL9mKTZmYrkUH+y0KH=5v4OCa5g@mail.gmail.com>
 <20190803175154.GB1131@ZenIV.linux.org.uk> <20190803185630.GA11310@ZenIV.linux.org.uk>
 <CAHk-=wgYPKdtdbShrGueytoLi3ZpG99gzSx5ijgEVxcX=zz3nQ@mail.gmail.com>
 <20190804203143.GD1131@ZenIV.linux.org.uk> <20190804204809.GA29474@ZenIV.linux.org.uk>
In-Reply-To: <20190804204809.GA29474@ZenIV.linux.org.uk>
From:   Felipe Balbi <balbi@kernel.org>
Date:   Mon, 5 Aug 2019 11:18:00 +0300
Message-ID: <CAH8TKc8kAR2iKETnh5RH1qVUiFUH2BSnirKg_RSbUEZ9ui8FuA@mail.gmail.com>
Subject: Re: [heads-up] deadlock in configfs_symlink()
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, Aug 4, 2019 at 11:48 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Sun, Aug 04, 2019 at 09:31:43PM +0100, Al Viro wrote:
>
> > FWIW, the following reproduces the deadlock on mainline:
> >
> > dd if=/dev/zero of=/tmp/image bs=1M count=20
> > modprobe dummy_hcd
> > modprobe configfs
> > mount -t configfs none /sys/kernel/config
> > modprobe g_mass_storage file=/tmp/image ro=y
> > cd /sys/kernel/config/usb_gadget/
> > mkdir blah
> > cd blah/configs
> > mkdir foo.1
> > cd foo.1
> > ln -s /sys/kernel/config/usb_gadget/blah/configs/foo.1/no-such-dir/ barf
>
> So does the following, actually - mass_storage is irrelevant here; it just
> brings libcomposite in.
>
> modprobe dummy_hcd
> modprobe libcomposite
> mount -t configfs none /sys/kernel/config
> cd /sys/kernel/config/usb_gadget/
> mkdir blah
> cd blah/configs
> mkdir foo.1
> cd foo.1
> ln -s /sys/kernel/config/usb_gadget/blah/configs/foo.1/no-such-dir/ barf

I'll try to reproduce on my end. Added linux-usb to the loop

-- 
balbi
