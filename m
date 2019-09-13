Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB95B23E8
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2019 18:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730688AbfIMQOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Sep 2019 12:14:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56010 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730648AbfIMQOb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Sep 2019 12:14:31 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7CD1A3CA20
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2019 16:14:30 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id k9so839917wmb.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2019 09:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7nSN9wvhoKYdWon6QDIGqpWH+96lV7NFl/5Fkxot28g=;
        b=TqrLKHRSyimMlAYcgl/40NGhUPaTsTifKjckrEh30w7am5qJQDVoCvyI77PeCoqcOu
         4SFQ4c7GFl49rplAbTD3E260U26cnlgL0/QOo3vpOriEjlcOVZueNoJR6nD8Ilxs+yay
         lXtWfPqTVV4uQP2KwMuOi3MxiPnadP2J4C/kyxK+h+q2TbrYucFdSWl8RKxZVq0O8ehq
         pZelWwLQjz14xPW7UjL4X5pwgR1dx/v6Qt7XglJ/CPzzK6ricMrnLy6fSdWJr6mrNWTu
         SH3whJOrkuYH/ilFoPWI6mIIKtKf9sdxmNeMHBglO/fYMPjESUBojqxzJg89tA/oU/9f
         twKw==
X-Gm-Message-State: APjAAAW3SXqjhABdSB3QSxSscx7MEi71VNf8uPiz1wMKINc1q84LcVUE
        wyZYyVvWpe97Fgw3+OJ0izjwghEOeVK2qwyTIrykPrKPaBNE3y2LH/e3BsqWgVWaLEQjVKI2QEI
        xttkOVfcr3EdCbWY+w9BV
X-Received: by 2002:adf:f607:: with SMTP id t7mr38318025wrp.60.1568391268766;
        Fri, 13 Sep 2019 09:14:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQUnRDc3RyOrEaNGz0pukUMwipBT5o437e/Usb18JWbopoR0i0Q27Or8p94AssM2/2oIzM8A==
X-Received: by 2002:adf:f607:: with SMTP id t7mr38317997wrp.60.1568391268522;
        Fri, 13 Sep 2019 09:14:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c5d2:4bb2:a923:3a9a? ([2001:b07:6468:f312:c5d2:4bb2:a923:3a9a])
        by smtp.gmail.com with ESMTPSA id v6sm4816939wma.24.2019.09.13.09.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2019 09:14:28 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org,
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
References: <Pine.LNX.4.44L0.1909131129390.1466-100000@iolanthe.rowland.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <1a8a6449-2740-b0a3-805a-47466e0d71c6@redhat.com>
Date:   Fri, 13 Sep 2019 18:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.1909131129390.1466-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/09/19 17:36, Alan Stern wrote:
> On Fri, 13 Sep 2019, Paolo Bonzini wrote:
> 
>> On 13/09/19 15:02, Greg Kroah-Hartman wrote:
>>> Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
>>> not need this type of thing.  If we got it wrong, please let us know and
>>> then yes, a fix like this would be most appreciated :)
>>
>> I still see
>>
>> 	/* some USB hosts just use PIO */
>> 	if (!hcd_uses_dma(hcd)) {
>> 		*dma = ~(dma_addr_t) 0;
>> 		return kmalloc(size, mem_flags);
>> 	}
>>
>> in linux-next's hcd_buffer_alloc and also in usb.git's usb-next branch.
>>  I also see the same
>>
>> 	if (remap_pfn_range(vma, vma->vm_start,
>> 			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
>> 			size, vma->vm_page_prot) < 0) {
>> 		...
>> 	}
>>
>> in usbdev_mmap.  Of course it's possible that I'm looking at the wrong
>> branch, or just being dense.
> 
> Have you seen
> 
> 	https://marc.info/?l=linux-usb&m=156758511218419&w=2
> 
> ?  It certainly is relevant, although Greg hasn't replied to it.

It helps but it's not a full fix, since the address would fail
is_vmalloc_addr.  On top of that, hcd_buffer_alloc and hcd_buffer_free
need to switch from kmalloc to vmalloc.

> Also, just warning about a non-page-aligned allocation doesn't really 
> help.  It would be better to fix the misbehaving allocator.

Of course.  The above patch does not fix the issue, it should just allow
for an easier reproduction not involving KVM.  More long term, it points
out where the contracts mismatch (i.e. between hcd_buffer_alloc and
usb_alloc_coherent), and more selfishly whose bug it is when syzkaller
complains. :)

Paolo
