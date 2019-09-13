Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02DBB18F8
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2019 09:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbfIMHef (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Sep 2019 03:34:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48694 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725817AbfIMHee (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Sep 2019 03:34:34 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6620688304
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2019 07:34:34 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id t11so2193798wrq.19
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2019 00:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0wZRdSHIeheVxa4DE7SyQMfDWHvTTN3LMA+T1b8qSjs=;
        b=JyfBG+VB+G9jCJ1BX4TmARghifEgD33hZT0uPOUfWWr+4zw6yLnK5BA6TqOIkxuh0t
         lc4ghsBc5hoHHYPTgWx2h1ee3JngogkFmUcbviipofORCkH9eEejWjpJUdifk0AhRpgs
         mM7hkv+ALq6ocHFrYWafhs6Tx2gi2SE5iQVkq6db+aDrVLlTV7xXtj1cBTb3btZwGn6Q
         U9o0UEhzGvnrSqsw1sIU+E9wYJB7d5krsV/u3ndAr6nEaAtzvP4+1xk36skccd4EvUxM
         MUf5ncEZnwONKouYH5V5z4MmCSSqab4I4OxZO91Ig4wpBRvuLXYxqo/m++/uUXwc3zDg
         Zttw==
X-Gm-Message-State: APjAAAX0A85gc4+M+nfpS995hKBQ+TuIFHKDNHM+zoRB6wAkiDbzTAis
        74EDxkdihy3fffkpwt2/lxckCmb/71gyItfkL4rli817iOlk5sR6FrLAhI6ANsfwpOJW93tb0PT
        gFFJQCtwQkTbuY3xBAXVt
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr6515887wrs.229.1568360072890;
        Fri, 13 Sep 2019 00:34:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXYHxfnOF9dKY5KYFw0qMwImUhJMX0+wKShi7tbwxtPLXAruWfIDZ1aSZJYxfR9HQPil13Fg==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr6515852wrs.229.1568360072601;
        Fri, 13 Sep 2019 00:34:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3166:d768:e1a7:aab8? ([2001:b07:6468:f312:3166:d768:e1a7:aab8])
        by smtp.gmail.com with ESMTPSA id l1sm33488980wrb.1.2019.09.13.00.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2019 00:34:32 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org,
        bp@alien8.de, carlo@caione.org, catalin.marinas@arm.com,
        devicetree@vger.kernel.org, hpa@zytor.com, jmattson@google.com,
        joro@8bytes.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, mingo@redhat.com, narmstrong@baylibre.com,
        rkrcmar@redhat.com, robh+dt@kernel.org,
        sean.j.christopherson@intel.com, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, wanpengli@tencent.com, will.deacon@arm.com,
        x86@kernel.org,
        syzbot <syzbot+46f1dd7dbbe2bfb98b10@syzkaller.appspotmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        USB list <linux-usb@vger.kernel.org>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
 <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
 <20190913044614.GA120223@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
Date:   Fri, 13 Sep 2019 09:34:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913044614.GA120223@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/09/19 06:46, Greg Kroah-Hartman wrote:
> USB drivers expect kmalloc to return DMA-able memory.  I don't know
> about specific alignment issues, that should only an issue for the host
> controller being used here, which you do not say in the above list.

I have no idea, this is just the analysis of a syzkaller report.  From 
the backtrace, it's one that ends up calling kmalloc; all of them should
have the same issue with KASAN.

The specific alignment requirement for this bug comes from this call in
usbdev_mmap:

	if (remap_pfn_range(vma, vma->vm_start,
			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
			size, vma->vm_page_prot) < 0) {

> We have had some reports that usbdev_mmap() does not do the "correct
> thing" for all host controllers, but a lot of the DMA work that is in
> linux-next for 5.4-rc1 should have helped resolve those issues.  What
> tree are you seeing these bug reports happening from?

It's in master, but the relevant code is the same in linux-next; in fact
in this case there is no DMA involved at all.  hcd_buffer_alloc hits
the case "some USB hosts just use PIO".

On those host controllers, it should be reproducible with just this:

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 7fcb9f782931..cc0460730bce 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -905,9 +905,12 @@ EXPORT_SYMBOL_GPL(__usb_get_extra_descriptor);
 void *usb_alloc_coherent(struct usb_device *dev, size_t size, gfp_t mem_flags,
 			 dma_addr_t *dma)
 {
+	void *buf;
 	if (!dev || !dev->bus)
 		return NULL;
-	return hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
+	buf = hcd_buffer_alloc(dev->bus, size, mem_flags, dma);
+	WARN_ON_ONCE(virt_to_phys(buf) & ~PAGE_MASK);
+	return buf;
 }
 EXPORT_SYMBOL_GPL(usb_alloc_coherent);
 

and CONFIG_KASAN=y or possibly just CONFIG_DEBUG_SLAB=y.  mmap-ing /dev/usb
should warn if my analysis is correct.

If you think the above patch makes sense, I can test it and submit it formally.

Paolo
