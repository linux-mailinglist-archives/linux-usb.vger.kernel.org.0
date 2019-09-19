Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FCFB80D5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 20:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392035AbfISS3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 14:29:34 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43357 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391733AbfISS3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 14:29:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id u72so2343360pgb.10
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+egVsXTih8AcjpoFq8MrlR1R2OAn0r56wvvLUrVKT0=;
        b=lOeg7N6P6ratCco6cR2CzzUcEKxK7mbScFHDl0Wih4XkzRVA0DZCoOMNako11XW2Vd
         MxzWPyTkZ8Bi+/qkgoT0zULYBaDw2RH4BFLTGx4WqgjwROcUgj4OYk0jC+dEi0NThQlt
         sc8Mupj/1NU1kzHi44qDOc6ci1NFMZjTsChCeNYFIsjJ6trKnxmXsn3ToCiNs4bvkKQL
         uL+6/t8MWuUkknY7id7H6b4FN/ke1HthC1qwqsEIZ7MxZg+PbzgOtAoTXg8ceoQDNWbJ
         SosKfV3NcKbZxZlgSWNVd6qgUeXoAJHANe0+MmPQw6oWij2B9qreAWV+tuLAZewjv2dv
         02hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+egVsXTih8AcjpoFq8MrlR1R2OAn0r56wvvLUrVKT0=;
        b=S9F2kBxVmJ3jUM3dPTAnnPTfwGZ8sZrkdbUtuQZPDKUoXz2+xIgl9gkGYHMSQU06nn
         WsNOYRLh/lmH4gZ27RQekftqsCGR/Aewo7d8km1y4MMj5EDYWj5DAVrgbWm7J597JvZp
         dAU20dlZsx71EIBYS/0g1tvzSy/HAom5autiO5cUCOuLDKaXce9uPaCzVJPwj77kVoNk
         wqPQvgw539+qwpwSq8fD7t04vLgZXjkRoRM/GTn9W9TrH3gRqDgj+SOUGMte1ia5V6f0
         FQu+d5duTZq34O5zE9IMrMANRivn5US1CvJFpDb29cHONu1gkLQPbtF6nIxzbsla1n+l
         HRxw==
X-Gm-Message-State: APjAAAX3jGosLtaicpAqoOShnjehfz75PafM/mg5bWoyjinWRk+KoNpo
        BC25xot5sHeDcF2xnVIUuezFnc5jHK6o5+Z7sOuxwQ==
X-Google-Smtp-Source: APXvYqyw4DqS43DzKxjdvNSfsZpaFyQ29Bu0vG1o/hF4aRsRWpqEPFPS2O+6I98nB1YSgOflOq6EqdsPjem6w/kpufY=
X-Received: by 2002:a62:1cd2:: with SMTP id c201mr12126076pfc.51.1568917773162;
 Thu, 19 Sep 2019 11:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000025ae690592b00fbd@google.com> <alpine.DEB.2.21.1909161258150.118156@chino.kir.corp.google.com>
 <20190916205756.GR29434@bombadil.infradead.org>
In-Reply-To: <20190916205756.GR29434@bombadil.infradead.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 19 Sep 2019 20:29:22 +0200
Message-ID: <CAAeHK+zV6M8MOWUt8BUgmTO1Dr6+KMKR8yR65_O2HBVrwkg1MQ@mail.gmail.com>
Subject: Re: WARNING in __alloc_pages_nodemask
To:     Matthew Wilcox <willy@infradead.org>
Cc:     David Rientjes <rientjes@google.com>,
        syzbot <syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        USB list <linux-usb@vger.kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Vlastimil Babka <vbabka@suse.cz>, yang.shi@linux.alibaba.com,
        zhongjiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 16, 2019 at 10:58 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Sep 16, 2019 at 01:00:11PM -0700, David Rientjes wrote:
> > On Mon, 16 Sep 2019, syzbot wrote:
> > > HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=14b15371600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=e38fe539fedfc127987e
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1093bed1600000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1603cfc6600000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com
> > >
> > > WARNING: CPU: 0 PID: 1720 at mm/page_alloc.c:4696
> > > __alloc_pages_nodemask+0x36f/0x780 mm/page_alloc.c:4696
> > > Kernel panic - not syncing: panic_on_warn set ...
>
> > > alloc_pages_current+0xff/0x200 mm/mempolicy.c:2153
> > > alloc_pages include/linux/gfp.h:509 [inline]
> > > kmalloc_order+0x1a/0x60 mm/slab_common.c:1257
> > > kmalloc_order_trace+0x18/0x110 mm/slab_common.c:1269
> > > __usbhid_submit_report drivers/hid/usbhid/hid-core.c:588 [inline]
> > > usbhid_submit_report+0x5b5/0xde0 drivers/hid/usbhid/hid-core.c:638
> > > usbhid_request+0x3c/0x70 drivers/hid/usbhid/hid-core.c:1252
> > > hid_hw_request include/linux/hid.h:1053 [inline]
> > > hiddev_ioctl+0x526/0x1550 drivers/hid/usbhid/hiddev.c:735
> > Adding Jiri and Benjamin.  The hid report length is simply too large for
> > the page allocator to allocate: this is triggering because the resulting
> > allocation order is > MAX_ORDER-1.  Any way to make this allocate less
> > physically contiguous memory?
>
> The HID code should, presumably, reject reports which are larger than
> PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER.  Particularly since it's using
> GFP_ATOMIC.

This is an int underflow when doing report buffer size calculation, see here:

https://groups.google.com/d/msg/syzkaller-bugs/X0zVbh8aFEM/NsPcshjxBgAJ

#syz dup: KMSAN: kernel-usb-infoleak in hid_submit_ctrl

https://syzkaller.appspot.com/bug?extid=401d71a99cfca9fceb77
