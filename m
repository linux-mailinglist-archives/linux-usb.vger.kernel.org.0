Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBFFB6FBB25
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 00:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbjEHWq5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 18:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbjEHWq4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 18:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4857EFA
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 15:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683585972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lD3YOAKvyxUhdHfZBJC1/c6hdLDImjbDSqv1KoUP1mg=;
        b=Vc858OALhzysfi3GNO8UaVGPcAlQiuDfbnKtHftw+1UvO31wkDAlrElOzrTFntZaoKq2y8
        cCBiyBgC1oKui3C1t655DKKXQDCXn372B8Iou0ef5UloZvfEyXeBxXC6dK0Br6El5GAgfX
        yTJ0L/13sTo/LYo3iDr+/2VlA2jkWzQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-tGhawubwPFq_j8P2AnFtAw-1; Mon, 08 May 2023 18:46:10 -0400
X-MC-Unique: tGhawubwPFq_j8P2AnFtAw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-24e02410034so5074376a91.0
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 15:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683585969; x=1686177969;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD3YOAKvyxUhdHfZBJC1/c6hdLDImjbDSqv1KoUP1mg=;
        b=ESbmMJeMZzJcqRrfVKbHIH4MK3rHlZniFeS0OucSH9Kt6Ld2wNF2jTxTNRq/wkJGA3
         twdHuqUohudIIZSH0Mpw+WGXpNk00dPoeUweEABfGyIx0VDD95weuV9QWgCYNgVw4Ay7
         Qcx6CIX1CzkeQyePpN0/K8rrCHI1jMJrjhLgCN/bJy2/XEACuI4+68BQ1lKVdta3KZqS
         A6luy63rIl9kNmffD2lrxun7niKuud2bACjKSwOc7zmh91if7zBP2buMgjaqG95BPjFo
         wvQ9B5ezkU7/Ga7Fy2Cs9TrTgE543jaYBhJQ3llGSqLxp2dizZohufPHDzyMPuCoda7D
         B8AQ==
X-Gm-Message-State: AC+VfDyYK+CO8Jke2e/KMMLQIB6YnDcST9S3+VVDjYByKnqYeONeNmIY
        mBI+wCEbHXNyzmH0LclhDj9729vAFy4BmaqLtPGy12myOV2XHdd7GeqGyTCaxcwJO0/Kv7cXtBX
        xU7IYgyZ9sTCimVaxOljx
X-Received: by 2002:a17:90a:fa5:b0:24d:f992:5286 with SMTP id 34-20020a17090a0fa500b0024df9925286mr286432pjz.36.1683585969505;
        Mon, 08 May 2023 15:46:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7FnOfreW+z3AaX729z6qwlAR8QXG4aIw5/xthNT3a/mfFk5Hic2Nt7MMEQFGP+gNNHLW2T8Q==
X-Received: by 2002:a17:90a:fa5:b0:24d:f992:5286 with SMTP id 34-20020a17090a0fa500b0024df9925286mr286418pjz.36.1683585969158;
        Mon, 08 May 2023 15:46:09 -0700 (PDT)
Received: from ?IPV6:2001:4958:15a0:30:5835:5bd3:f0c8:e5ef? ([2001:4958:15a0:30:5835:5bd3:f0c8:e5ef])
        by smtp.gmail.com with ESMTPSA id a1-20020a17090acb8100b0024e2980574asm10500510pju.4.2023.05.08.15.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 15:46:08 -0700 (PDT)
Message-ID: <fa1dac7a-406e-30ea-6aba-ded2e0e871fa@redhat.com>
Date:   Tue, 9 May 2023 00:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: usbdev_mmap causes type confusion in page_table_check
Content-Language: en-US
To:     Pasha Tatashin <pasha.tatashin@soleen.com>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Ruihan Li <lrh2000@pku.edu.cn>,
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
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CA+CK2bDC-FVv1tZg9MDn-N735Ak3OAtdZPf+LEYM-JHsO90YcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08.05.23 23:55, Pasha Tatashin wrote:
> On Mon, May 8, 2023 at 2:52 PM Matthew Wilcox <willy@infradead.org> wrote:
>>
>> On Mon, May 08, 2023 at 02:48:59PM -0700, Pasha Tatashin wrote:
>>> On Mon, May 8, 2023 at 2:36 PM Matthew Wilcox <willy@infradead.org> wrote:
>>>>
>>>> On Mon, May 08, 2023 at 05:27:10PM -0400, Pasha Tatashin wrote:
>>>>>> static void page_table_check_set(struct mm_struct *mm, unsigned long addr,
>>>>>>                                   unsigned long pfn, unsigned long pgcnt,
>>>>>>                                   bool rw)
>>>>>> {
>>>>>>          // ...
>>>>>>          anon = PageAnon(page);
>>>>>>          for (i = 0; i < pgcnt; i++) {
>>>>>>                  // ...
>>>>>>                  if (anon) {
>>>>>>                          BUG_ON(atomic_read(&ptc->file_map_count));
>>>>>>                          BUG_ON(atomic_inc_return(&ptc->anon_map_count) > 1 && rw);
>>>>>>                  } else {
>>>>>>                          BUG_ON(atomic_read(&ptc->anon_map_count));
>>>>>>                          BUG_ON(atomic_inc_return(&ptc->file_map_count) < 0);
>>>>>>                  }
>>>>>>                  // ...
>>>>>>          }
>>>>>>          // ...
>>>>>> }
>>>>>>
>>>>>> This call to PageAnon is invalid for slab pages because slab reuses the bits
>>>>>> in struct page/folio to store its internal states, and the anonymity bit only
>>>>>> exists in struct page/folio. As a result, the counters are incorrectly updated
>>>>>> and checked in page_table_check_set and page_table_check_clear, leading to the
>>>>>> bug being raised.
>>>>>
>>>>> We should change anon boolean to be:
>>>>>
>>>>> anon = !PageSlab(page) && PageAnon(page);
>>>>
>>>> No.  Slab pages are not elegible for mapping into userspace.  That's
>>>
>>> Sure, I can add BUG_ON(PageSlab(page)); to page_table_check_set.
>>>
>>>> all.  There should be a BUG() for that.  And I do mean BUG(), not
>>>> "return error to user".  Something has gone horribly wrong, and it's
>>>> time to crash.
>>>
>>>   It is just too easy to make slab available via remap_pfn_range(), but
>>> I do not think we want to add BUG() into the remap function, otherwise
>>> we will break devices such as /dev/mem.
>>
>> Slab pages can't be mmaped.  Really, no matter what interface you're
>> using.  page->_mapcount is necessarily incremented by mapping to
>> userspace, and slab uses that space for its own purposes (and has
>> for decades).  It's similar for page tables and other allocations that
>> use PageType.
> 
> Mapping random memory in /dev/mem can cause mapping slab pages in to
> userspace, the page->_mapcount is not incremented (and other fields
> are not accessed) in that case, as we are using VM_PFNMAP type VMA,
> which does not access "struct page".

We should be using vm_normal_page() to identify if we should be looking 
at the struct page or not, no?

-- 
Thanks,

David / dhildenb

