Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45559B1309
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 18:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbfILQta (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 12:49:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34872 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730509AbfILQta (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Sep 2019 12:49:30 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5BABC2A09CE
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2019 16:49:29 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id a4so10919763wrg.8
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2019 09:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p6UoFWsgsPkuQtSEESX9kkhleKRjVbh91vbkMxi8FIw=;
        b=X3aD+NcGhK14kWz3LgCcpE5dTdHht3HzSOAHQJx7Z8ZHq7Tv7evwzp4jGAKBDNLRFS
         zJ1Hx7x8aqCk6QF4isuQsrC9RDUFWADFw0YPnIKzSLLd+Ptio/8UVb8JY6w+2bGehg++
         N22W8iPQLcoXtXnArJkIMSO2W+eo12iUPk0lw/0m4LWukqBrosi/y2DVPSW13O+W/bWF
         2AQo+UnyQwvhGaQr7o6bAuZpwCqT17K8vB0Q8Kn/S6S2mw6O2Y28IGwYapYLBrG2pFo5
         aCyMBibbt3UkO1tQc+Y9ahELUXstmhHk9bFWKS4MqcLCsy0mdRfSC22bBU5lQeXxGFxp
         tOiQ==
X-Gm-Message-State: APjAAAXAznObmGUUmt0GfWZMk5eZKaGDk83mjMsW1g4tguDI4XrosuaQ
        +PRFHrnRlCUlXo9cHLmiDAuRsy1TabOlPMHcn1vGcggWWH4hI1FgcCpu6tm0+9KuUlKDV54MAkW
        Bj8us8amfRPHu5o9sfR8a
X-Received: by 2002:a5d:6811:: with SMTP id w17mr31804398wru.181.1568306967677;
        Thu, 12 Sep 2019 09:49:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxrL3VP6sAEDt0Bo0M7LVEBolaalUXmcE8h3jDG603x7fhGBgsss6KO8uKCmP0qnEKPpoX5oQ==
X-Received: by 2002:a5d:6811:: with SMTP id w17mr31804366wru.181.1568306967374;
        Thu, 12 Sep 2019 09:49:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3166:d768:e1a7:aab8? ([2001:b07:6468:f312:3166:d768:e1a7:aab8])
        by smtp.gmail.com with ESMTPSA id h17sm807220wme.6.2019.09.12.09.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2019 09:49:26 -0700 (PDT)
Subject: Re: KASAN: slab-out-of-bounds Read in handle_vmptrld
To:     Vitaly Kuznetsov <vkuznets@redhat.com>, kvm@vger.kernel.org
Cc:     bp@alien8.de, carlo@caione.org, catalin.marinas@arm.com,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
References: <000000000000a9d4f705924cff7a@google.com>
 <87lfutei1j.fsf@vitty.brq.redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5218e70e-8a80-7c5f-277b-01d9ab70692a@redhat.com>
Date:   Thu, 12 Sep 2019 18:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87lfutei1j.fsf@vitty.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[tl;dr: there could be a /dev/usb bug only affecting KASAN
configurations, jump to the end to skip the analysis and get to the bug
details]

On 12/09/19 15:54, Vitaly Kuznetsov wrote:
> Hm, the bisection seems bogus but the stack points us to the following
> piece of code:
> 
>  4776)              if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmptr), &map)) {
> <skip>
>  4783)                      return nested_vmx_failValid(vcpu,
>  4784)                              VMXERR_VMPTRLD_INCORRECT_VMCS_REVISION_ID);
>  4785)              }
>  4786) 
>  4787)              new_vmcs12 = map.hva;
>  4788) 
> *4789)              if (new_vmcs12->hdr.revision_id != VMCS12_REVISION ||
>  4790)                  (new_vmcs12->hdr.shadow_vmcs &&
>  4791)                   !nested_cpu_has_vmx_shadow_vmcs(vcpu))) {
> 
> the reported problem seems to be on VMCS12 region access but it's part
> of guest memory and we successfuly managed to map it. We're definitely
> within 1-page range. Maybe KASAN is just wrong here?

Here is the relevant part of the syzkaller repro:

syz_kvm_setup_cpu$x86(r1, 0xffffffffffffffff,
&(0x7f0000000000/0x18000)=nil, 0x0, 0x133, 0x0, 0x0, 0xff7d)
r3 = syz_open_dev$usb(&(0x7f0000000080)='/dev/bus/usb/00#/00#\x00',
0x40000fffffd, 0x200800000000042)
mmap$IORING_OFF_SQES(&(0x7f0000007000/0x2000)=nil, 0x2000, 0x4, 0x13,
r3, 0x10000000)
syz_kvm_setup_cpu$x86(0xffffffffffffffff, r2,
&(0x7f0000000000/0x18000)=nil, 0x0, 0xfefd, 0x40, 0x0, 0xfffffffffffffdd4)
ioctl$KVM_RUN(r2, 0xae80, 0x0)

The mmap$IORING_OFF_SQES is just a normal mmap from a device, which
replaces the previous mapping for guest memory and in particular
0x7f0000007000 which is the VMCS (from the C reproducer: "#define
ADDR_VAR_VMCS 0x7000").

The previous mapping is freed with do_munmap and then repopulated in
usbdev_mmap with remap_pfn_range.  In KVM this means that kvm_vcpu_map
goes through hva_to_pfn_remapped, which correctly calls get_page via
kvm_get_pfn.  (Note that although drivers/usb/core/devio.c's usbdev_mmap
sets VM_IO *after* calling remap_pfn_range, remap_pfn_range itself
helpfully sets it before calling remap_p4d_range.  And anyway KVM is
looking at vma->vm_flags under mmap_sem, which is held during mmap).

So, KVM should be doing the right thing.  Now, the error is:

> Read of size 4 at addr ffff888091e10000 by task syz-executor758/10006
> The buggy address belongs to the object at ffff888091e109c0 
> The buggy address is located 2496 bytes to the left of
>  8192-byte region [ffff888091e109c0, ffff888091e129c0) 

And given the use of remap_pfn_range in devusb_mmap, the simplest
explanation could be that USB expects kmalloc-8k to return 8k-aligned
values, but this is not true anymore with KASAN.  CCing Dmitry, Greg and
linux-usb.

Paolo
