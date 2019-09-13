Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D0FB22CE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2019 17:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390363AbfIMPB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Sep 2019 11:01:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59882 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390354AbfIMPB2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Sep 2019 11:01:28 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C343C89AD0
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2019 15:01:26 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id q10so600673wro.22
        for <linux-usb@vger.kernel.org>; Fri, 13 Sep 2019 08:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zuzwEhDdM8nFD/eqeUMdkZbahAvWuck1YuH/cdNiv9o=;
        b=UljrnDckI6kd1f8McM+zeI4CXjXKLK78IJEedBn2WYV8NUCkz/A/B926CLDuGPTHnM
         PMjeq8+yDM78u2gg7h/aQOCswOdn6t0w/bHGbMKKKJFWLnKSzyJGt7JzYgagttf6M/SS
         UZQJhy/cgR5H5K71rZNTkowxwqPcQX/B1MSYfbiPRUbKax9dENGFgji0co2zvR24NBhs
         XLFh1dlkTCHB7ek26EKtaT7gNFrzmyg64gLvgBa4Hsf/enqgONunG1oKFBUEM3sB1ihb
         mk7zTeI9ZUqiF34bPB5M4/IAHNr8KzU0oFYeyYTuN73FdX3GGCfaLTi4k/1sSBlUC2hW
         02LA==
X-Gm-Message-State: APjAAAXHGiTxZQd8IFbbp7TWrdaBWX4ppe91RKnXzkZPlcdc2XAWtEXh
        NjW0QDeqeEobfgTe7QBdBrr7Rw2PHWC54vIESC0Oq1XZeDnDoFN+k74PlIpetX7s39WCA+OtKKq
        OjUAy/OAlqyfOy/sq75nB
X-Received: by 2002:a1c:c013:: with SMTP id q19mr3447801wmf.87.1568386884926;
        Fri, 13 Sep 2019 08:01:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVmkhicWbX9sM2V6LPnr+xLUUrZU9HvAJMzAOfyJJVoRtNarvooFR4sjG8yibYs2ccdb68wg==
X-Received: by 2002:a1c:c013:: with SMTP id q19mr3447762wmf.87.1568386884662;
        Fri, 13 Sep 2019 08:01:24 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c5d2:4bb2:a923:3a9a? ([2001:b07:6468:f312:c5d2:4bb2:a923:3a9a])
        by smtp.gmail.com with ESMTPSA id y15sm1949532wmj.32.2019.09.13.08.01.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2019 08:01:24 -0700 (PDT)
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
 <db02a285-ad1d-6094-6359-ba80e6d3f2e0@redhat.com>
 <20190913130226.GB403359@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6a0ec3a2-2a52-f67a-6140-e0a60874538a@redhat.com>
Date:   Fri, 13 Sep 2019 17:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190913130226.GB403359@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13/09/19 15:02, Greg Kroah-Hartman wrote:
> Look at linux-next, we "should" have fixed up hcd_buffer_alloc() now to
> not need this type of thing.  If we got it wrong, please let us know and
> then yes, a fix like this would be most appreciated :)

I still see

	/* some USB hosts just use PIO */
	if (!hcd_uses_dma(hcd)) {
		*dma = ~(dma_addr_t) 0;
		return kmalloc(size, mem_flags);
	}

in linux-next's hcd_buffer_alloc and also in usb.git's usb-next branch.
 I also see the same

	if (remap_pfn_range(vma, vma->vm_start,
			virt_to_phys(usbm->mem) >> PAGE_SHIFT,
			size, vma->vm_page_prot) < 0) {
		...
	}

in usbdev_mmap.  Of course it's possible that I'm looking at the wrong
branch, or just being dense.

Paolo
