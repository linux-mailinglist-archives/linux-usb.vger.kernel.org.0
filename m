Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C526FE290
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 18:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235540AbjEJQfG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 12:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbjEJQfF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 12:35:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69F777D99
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 09:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683736459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c+QqxpiG1U+G+dOtpx1ITq0GjqRCMSQvjjIZjS6KV1Q=;
        b=ZhQGX7YTvxONRGleDVgUwDybyz19V1jj/PZH7B788V72mCh1KDLhBWdabCP4nS9nvEe6Ww
        uUCfCedtq6A7tgvc514JojPuMqiuPuwCqniWx9rpAGZZFuY4dp2/MPBX4Knu8yyggt7eLN
        J8M8AmmCEyHvN0CCuRvi/a7PvB50Qug=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-ADYlMlx5O1S1knixM7uNXQ-1; Wed, 10 May 2023 12:34:18 -0400
X-MC-Unique: ADYlMlx5O1S1knixM7uNXQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-24de504c5fcso7433217a91.2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 09:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683736457; x=1686328457;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c+QqxpiG1U+G+dOtpx1ITq0GjqRCMSQvjjIZjS6KV1Q=;
        b=AxmyEbDkapgwO2G8zeH/t6ebjrzsbR7i3NhNuU3YHtqIBl3yMbxBUCpZgIYv1WtPSn
         xgc4X49mUT+6JBTUbMe3ZhqoUVzV533WAXd2bKsbkNk5aSiIZGxSqpp/J8kew63M+6hv
         WjHjdTv58faFxy/Z4rQKi+ilwGhuo2oSNl1VwHz/dC5zp6+mRN9B+7EW8etgeJS4ZwCk
         SJDAp/off57nE2lizQ+9fxpvm637cXPB8CoG9wRoNn5cnHj3ua9sLXQ7NmBj9+lQiLJd
         8TZRyTrVoV7znYM1sVZJC2OxL7NRgWKP0ikElWSoCYlWrgLpWbJUWWm9F2/xqQA1Fq4k
         7BiQ==
X-Gm-Message-State: AC+VfDwu4aQ/5LbzYNnur4EHcopBCmQ06Ph2+Lmxoru8/KlXnjeYIGL8
        HUTTulU01DvS7f6wAK4mSfxjYaYnEomG55kbbHP8cZ9Zxs8yjLZuLJWahLfKDHs5DWnzD9VNuh6
        5B+TKtj69oCQqMATqFR4N
X-Received: by 2002:a17:90b:314e:b0:252:75ed:eff5 with SMTP id ip14-20020a17090b314e00b0025275edeff5mr1245112pjb.30.1683736457238;
        Wed, 10 May 2023 09:34:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7EdgNF0FnAHwSa6p1ZBdA+qjfDeebFN0AfPJYEoCiiN4duL77pDs94kbQ+vfFR/hWf3NeGtg==
X-Received: by 2002:a17:90b:314e:b0:252:75ed:eff5 with SMTP id ip14-20020a17090b314e00b0025275edeff5mr1245083pjb.30.1683736456926;
        Wed, 10 May 2023 09:34:16 -0700 (PDT)
Received: from ?IPV6:2001:4958:15a0:30:5835:5bd3:f0c8:e5ef? ([2001:4958:15a0:30:5835:5bd3:f0c8:e5ef])
        by smtp.gmail.com with ESMTPSA id gp24-20020a17090adf1800b0024e227828a9sm8880080pjb.24.2023.05.10.09.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 09:34:16 -0700 (PDT)
Message-ID: <48a47f2e-0506-ca0f-07d5-15918865cd19@redhat.com>
Date:   Wed, 10 May 2023 18:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] usb: usbfs: Use consistent mmap functions
Content-Language: en-US
To:     Ruihan Li <lrh2000@pku.edu.cn>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-mm@kvack.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org
References: <20230510085527.57953-1-lrh2000@pku.edu.cn>
 <20230510085527.57953-3-lrh2000@pku.edu.cn>
 <e197f549-0ee7-446e-86af-ac173d047df5@rowland.harvard.edu>
 <w6keszmqdkwsuw5k3dsyl67zgndorxsoeenysjyzlzf5v4p6bl@mvztdsgt7qjj>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <w6keszmqdkwsuw5k3dsyl67zgndorxsoeenysjyzlzf5v4p6bl@mvztdsgt7qjj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.05.23 17:41, Ruihan Li wrote:
> Hi Alan,
> 
> On Wed, May 10, 2023 at 10:38:48AM -0400, Alan Stern wrote:
>> On Wed, May 10, 2023 at 04:55:25PM +0800, Ruihan Li wrote:
>>> When hcd->localmem_pool is non-null, it is used to allocate DMA memory.
>>> In this case, the dma address will be properly returned (in dma_handle),
>>> and dma_mmap_coherent should be used to map this memory into the user
>>> space. However, the current implementation uses pfn_remap_range, which
>>> is supposed to map normal pages (instead of DMA pages).
>>>
>>> Instead of repeating the logic in the memory allocation function, this
>>> patch introduces a more robust solution. To address the previous issue,
>>> this patch checks the type of allocated memory by testing whether
>>> dma_handle is properly set. If dma_handle is properly returned, it means
>>> some DMA pages are allocated and dma_mmap_coherent should be used to map
>>> them. Otherwise, normal pages are allocated and pfn_remap_range should
>>> be called. This ensures that the correct mmap functions are used
>>> consistently, independently with logic details that determine which type
>>> of memory gets allocated.
>>>
>>> Fixes: a0e710a7def4 ("USB: usbfs: fix mmap dma mismatch")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
>>> ---
>>>   drivers/usb/core/devio.c | 10 ++++++++--
>>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
>>> index b4cf9e860..5067030b7 100644
>>> --- a/drivers/usb/core/devio.c
>>> +++ b/drivers/usb/core/devio.c
>>> @@ -235,7 +235,7 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>>>   	size_t size = vma->vm_end - vma->vm_start;
>>>   	void *mem;
>>>   	unsigned long flags;
>>> -	dma_addr_t dma_handle;
>>> +	dma_addr_t dma_handle = DMA_MAPPING_ERROR;
>>>   	int ret;
>>>   
>>>   	ret = usbfs_increase_memory_usage(size + sizeof(struct usb_memory));
>>> @@ -265,7 +265,13 @@ static int usbdev_mmap(struct file *file, struct vm_area_struct *vma)
>>>   	usbm->vma_use_count = 1;
>>>   	INIT_LIST_HEAD(&usbm->memlist);
>>>   
>>> -	if (hcd->localmem_pool || !hcd_uses_dma(hcd)) {
>>> +	/* In DMA-unavailable cases, hcd_buffer_alloc_pages allocates
>>> +	 * normal pages and assigns DMA_MAPPING_ERROR to dma_handle. Check
>>> +	 * whether we are in such cases, and then use remap_pfn_range (or
>>> +	 * dma_mmap_coherent) to map normal (or DMA) pages into the user
>>> +	 * space, respectively.
>>> +	 */
>>
>> Another stylistic issue.  For multi-line comments, the format we use is:
>>
>> 	/*
>> 	 * Blah, blah, blah
>> 	 * Blah, blah, blah
>> 	 */
>>
>> Alan Stern
> 
> Yeah, I am pretty sure it is another style difference with the net
> subsystem. Again, in the next version, I'll follow the coding style that
> you have pointed out.

Documentation/process/coding-style.rst

spells out that net/ and drivers/net/ are "special".

Regarding breaking long lines, it's just an inconsistent, undocumented 
mess IIRC ...

-- 
Thanks,

David / dhildenb

