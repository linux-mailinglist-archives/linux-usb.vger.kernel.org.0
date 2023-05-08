Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 484A76FBB73
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 01:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjEHXh5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 19:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjEHXh4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 19:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0891E7
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683589026;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sHw0dcZ3TJiP+2hAhevqrsae4S2DerKf8toQzKblr+M=;
        b=BE5lzAd8cbG7vHq9FHaKq5UGpmTUWRQ+sLeqy9AI68FpfAGANn1oQafXdzXOxWSw/yHPTJ
        g+bQxcYYwxuEoD7srKjhp4Er3WqNSiogTMBSpaG2Ae9QZv0ST32oUT/kQSHYxt6NFjNTtH
        6jtqpSud+ZUyw0n/ZMJoqlh8S2RGpBA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-0metWg1QM5eiYVdqL7YCJQ-1; Mon, 08 May 2023 19:37:05 -0400
X-MC-Unique: 0metWg1QM5eiYVdqL7YCJQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-250109c729eso2686670a91.3
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 16:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683589024; x=1686181024;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHw0dcZ3TJiP+2hAhevqrsae4S2DerKf8toQzKblr+M=;
        b=cpLygdLbu279izl1GSMCKfGZLv6LmhbtY2v5hDcJ32vBBIVFR/Xls6b/5VCQZ+AG6p
         ucPmmCk4kR+IDfv3tIzFao1faPpXYpTaj45d8jy13bXhmx3yKpk7ZZ9QUvYvVuEMVUeh
         HxGwJ4IqQRVF0bkndphfhAVPbvEisd5Yh+DOM1T6p2QOs5kH92I5d86ZwBwumaSs2mtr
         6xgFsjpMXWU7Y7V/9ATa7I5Faht9JDyY6Wyi3JB+ShkHpDh2qttweHe8Q3ifKzI1EDe+
         3AhBnK98S1WOAiScuSklg8lVoqM4qJ6j7DgQGnMqhfNqH6f78+cKXTwKsBc/C7jnlxzZ
         EXAg==
X-Gm-Message-State: AC+VfDxUubzEKD5733KyoXmTg9enJ3OhFPvrJ6Yir91NShdTNVvuBxIm
        cIf0ZTONcpicHRxvhmOZlpFqN/z9NUpL5f6dr+fkNXULOKlqpst2e6pwSKaQAK7QGHzF9/8dPkF
        cQOTV/UCSle6XAWq+qMh68k2DhQFr
X-Received: by 2002:a17:902:b94c:b0:1a9:8769:36b7 with SMTP id h12-20020a170902b94c00b001a9876936b7mr12204918pls.5.1683589024518;
        Mon, 08 May 2023 16:37:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4X8+T9VIV0+w2ym+yJ6iL2lnqWuPkUZ1mXJ9TEjevEZjwzya7Qb3Y/35civQ+382IVFajw/g==
X-Received: by 2002:a17:902:b94c:b0:1a9:8769:36b7 with SMTP id h12-20020a170902b94c00b001a9876936b7mr12204902pls.5.1683589024209;
        Mon, 08 May 2023 16:37:04 -0700 (PDT)
Received: from ?IPV6:2001:4958:15a0:30:5835:5bd3:f0c8:e5ef? ([2001:4958:15a0:30:5835:5bd3:f0c8:e5ef])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902d70b00b001ac452bbe2asm26868ply.199.2023.05.08.16.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 16:37:03 -0700 (PDT)
Message-ID: <366ab078-1101-421c-691d-34f5efe006b5@redhat.com>
Date:   Tue, 9 May 2023 01:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: usbdev_mmap causes type confusion in page_table_check
To:     Pasha Tatashin <pasha.tatashin@soleen.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Ruihan Li <lrh2000@pku.edu.cn>,
        syzbot+fcf1a817ceb50935ce99@syzkaller.appspotmail.com,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <000000000000258e5e05fae79fc1@google.com>
 <20230507135844.1231056-1-lrh2000@pku.edu.cn>
 <CA+CK2bBe2YKYM3rUTCnZ0RF=NFUR9VqO-QYn3ygPsFJWLY1MUA@mail.gmail.com>
 <ZFlrbDft1QfMyIDc@casper.infradead.org>
 <CA+CK2bDVjovwB9v-Zv4Fn7EUfp5FV2XK36iJKYKY7pYNOFfOGA@mail.gmail.com>
 <ZFlvJEfs1ufh1UUD@casper.infradead.org>
 <CA+CK2bDC-FVv1tZg9MDn-N735Ak3OAtdZPf+LEYM-JHsO90YcQ@mail.gmail.com>
 <fa1dac7a-406e-30ea-6aba-ded2e0e871fa@redhat.com>
 <CA+CK2bAHbHHwLUoGJkz8n6mrM5dy7oMojeNksdVOMYn+qFYngA@mail.gmail.com>
 <CA+CK2bD=bv1vPGZaNcxDy-uUFj2ZAKkdPmAtJaweXhgTe91oEw@mail.gmail.com>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CA+CK2bD=bv1vPGZaNcxDy-uUFj2ZAKkdPmAtJaweXhgTe91oEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09.05.23 01:21, Pasha Tatashin wrote:
>> For normal Kernel-MM operations, vm_normal_page() should be used to
>> get "struct page" based on vma+addr+pte combination, but
>> page_table_check does not use vma for its operation in order to
>> strengthen the verification of no invalid page sharing. But, even

I'm not sure if that's the right approach for this case here, though.

>> vm_normal_page() can cause access to the "struct page" for VM_PFNMAP
>> if pfn_valid(pfn) is true. So, vm_normal_page() can return a struct
>> page for a user mapped slab page.
> 
> Only for !ARCH_HAS_PTE_SPECIAL case, otherwise NULL is returned.

That would violate VM_PFNMAP semantics, though. I remember that there 
was a trick to it.

Assuming we map /dev/mem, what stops a page we mapped and determined to 
be !anon to be freed and reused, such that we suddenly have an anon page 
mappped?

In that case, we really don't want to look at the "struct page" ever, no?

-- 
Thanks,

David / dhildenb

