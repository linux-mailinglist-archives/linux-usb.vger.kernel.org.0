Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD1E0B4290
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 22:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbfIPU6D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 16:58:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49706 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfIPU6C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 16:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=yeJayqOR9sbkuSoE2xkkfI48PIerp6/smkJ5wYd6VHo=; b=HACGFBeKT5pI2El5XJm2wRaxy
        4NzAYGacsQiBSEMLV48E2a8borqjI8BwHHRbsW6wzrSqUXk3pLIHNeJtYzwnHSCRELUd9zlsq7pgQ
        +8CN3XusJBI5lrtz5NufdBfaJXfoQod4jEXvtAcAqZwq7jmo7AC/xzXs9vITUj6AXAU2OOSlUhAGA
        vBt0tJ09fwkT6LoK1jv9AGl70cQOzqeGTt3iVzy8ylxmSzBxm32aWLHfgFZuD0HkYLqGNiEoaHnvn
        /6VjKlZp2e6g7xv6Lb/fuqkNRkP43WpHtG61o39zZE+9D9fp25WmToPQESE1/2DtJtasDEW64MWr2
        jNey2LZgw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red Hat Linux))
        id 1i9y4L-0001LW-Dy; Mon, 16 Sep 2019 20:57:57 +0000
Date:   Mon, 16 Sep 2019 13:57:57 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     David Rientjes <rientjes@google.com>
Cc:     syzbot <syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org, mhocko@suse.com,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz,
        yang.shi@linux.alibaba.com, zhongjiang@huawei.com
Subject: Re: WARNING in __alloc_pages_nodemask
Message-ID: <20190916205756.GR29434@bombadil.infradead.org>
References: <00000000000025ae690592b00fbd@google.com>
 <alpine.DEB.2.21.1909161258150.118156@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909161258150.118156@chino.kir.corp.google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 16, 2019 at 01:00:11PM -0700, David Rientjes wrote:
> On Mon, 16 Sep 2019, syzbot wrote:
> > HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=14b15371600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> > dashboard link: https://syzkaller.appspot.com/bug?extid=e38fe539fedfc127987e
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1093bed1600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1603cfc6600000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+e38fe539fedfc127987e@syzkaller.appspotmail.com
> > 
> > WARNING: CPU: 0 PID: 1720 at mm/page_alloc.c:4696
> > __alloc_pages_nodemask+0x36f/0x780 mm/page_alloc.c:4696
> > Kernel panic - not syncing: panic_on_warn set ...

> > alloc_pages_current+0xff/0x200 mm/mempolicy.c:2153
> > alloc_pages include/linux/gfp.h:509 [inline]
> > kmalloc_order+0x1a/0x60 mm/slab_common.c:1257
> > kmalloc_order_trace+0x18/0x110 mm/slab_common.c:1269
> > __usbhid_submit_report drivers/hid/usbhid/hid-core.c:588 [inline]
> > usbhid_submit_report+0x5b5/0xde0 drivers/hid/usbhid/hid-core.c:638
> > usbhid_request+0x3c/0x70 drivers/hid/usbhid/hid-core.c:1252
> > hid_hw_request include/linux/hid.h:1053 [inline]
> > hiddev_ioctl+0x526/0x1550 drivers/hid/usbhid/hiddev.c:735
> Adding Jiri and Benjamin.  The hid report length is simply too large for 
> the page allocator to allocate: this is triggering because the resulting 
> allocation order is > MAX_ORDER-1.  Any way to make this allocate less 
> physically contiguous memory?

The HID code should, presumably, reject reports which are larger than
PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER.  Particularly since it's using
GFP_ATOMIC.

