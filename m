Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 847B7704E5F
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 14:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233367AbjEPM5I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 May 2023 08:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233362AbjEPM4v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 May 2023 08:56:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59AEA18E
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684241706;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TcyEykK3oU2aR43SsclKXEYSiS1KO2O1iEjSHmGB+ZA=;
        b=ObBGmQatRxc7zwsrI1XlP/y3sr0CX/Ly3yuNRV5kjRNfnPpPHKW210WSnUp6KxSxQ+Bn8K
        t7gnIO3ao/yFJ3e+VSYDyUcHByzCHFAW9B4kA9ZaHIxjJjX9+CgRjAmxlohleVZy+Ti50C
        6rRjOWz9+JCwLd4hCTikkYBrKQamgww=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-w8flN_SaO2axRpCVNzy6tg-1; Tue, 16 May 2023 08:55:04 -0400
X-MC-Unique: w8flN_SaO2axRpCVNzy6tg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f422150893so65987385e9.2
        for <linux-usb@vger.kernel.org>; Tue, 16 May 2023 05:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684241703; x=1686833703;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcyEykK3oU2aR43SsclKXEYSiS1KO2O1iEjSHmGB+ZA=;
        b=KZpGh8sPoLEzo6d0TkA+GQbExkWrhZJZma0dwLKmiaolbFMXoe7dDL7KfQSMzjXhOt
         /ZLZsQsIcLDHqseZSTtkRBJciZ6o0DMEEMyVRuuDJuWhRLwGGOZWkWfKG2UhWNmQRBgk
         jsqxJmTrvQ2Mr8N3qW3E6iwC02pQiFsG9zgGCVZBU8iXMHFZldEZpDx8ucDEFAYORx0f
         0a5y/3PLGtJxtPP1fqQHW6SiAMDkE96LOxeHODCjXzh7wAAG/vAUqeE/Byatgp43vcih
         WdmgkT0jllkhbHDwKNXtlfqWJ+Nw78Chp0cYr4KDUwUHmyox2boMwzgREtrcNckfbx5p
         Axgw==
X-Gm-Message-State: AC+VfDyd4JJ+I/yVQx3JkcNhuEPJZ5Z2/hpiMddGRN4MYuLVry3TzPwQ
        dhZRQU48AADP8b68cc+be8B+9MwaO0DuQtZ/Bb+C6FhnAlG5niBCTB4Q8az++fw/j1GEew7afL3
        JHqM9meCmnVbH8GisLbp0
X-Received: by 2002:a7b:cc93:0:b0:3f4:2bb3:a5bb with SMTP id p19-20020a7bcc93000000b003f42bb3a5bbmr16864215wma.9.1684241703483;
        Tue, 16 May 2023 05:55:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O9DSGlObFp5mEh5qki+n58oAVDuOhHeEbfmxQ1l2nAU4LVaY/g/d7eIH3LFkvzUt+akGc6A==
X-Received: by 2002:a7b:cc93:0:b0:3f4:2bb3:a5bb with SMTP id p19-20020a7bcc93000000b003f42bb3a5bbmr16864199wma.9.1684241703121;
        Tue, 16 May 2023 05:55:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74f:2500:1e3a:9ee0:5180:cc13? (p200300cbc74f25001e3a9ee05180cc13.dip0.t-ipconnect.de. [2003:cb:c74f:2500:1e3a:9ee0:5180:cc13])
        by smtp.gmail.com with ESMTPSA id o2-20020a1c7502000000b003f195d540d9sm2256533wmc.14.2023.05.16.05.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 05:55:02 -0700 (PDT)
Message-ID: <72fc50da-c3b9-b71b-209b-9413a8693f13@redhat.com>
Date:   Tue, 16 May 2023 14:55:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/4] mm: page_table_check: Make it dependent on
 EXCLUSIVE_SYSTEM_RAM
Content-Language: en-US
To:     Ruihan Li <lrh2000@pku.edu.cn>, linux-mm@kvack.org,
        linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org
References: <20230515130958.32471-1-lrh2000@pku.edu.cn>
 <20230515130958.32471-4-lrh2000@pku.edu.cn>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230515130958.32471-4-lrh2000@pku.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15.05.23 15:09, Ruihan Li wrote:
> Without EXCLUSIVE_SYSTEM_RAM, users are allowed to map arbitrary
> physical memory regions into the userspace via /dev/mem. At the same
> time, pages may change their properties (e.g., from anonymous pages to
> named pages) while they are still being mapped in the userspace, leading
> to "corruption" detected by the page table check.
> 
> To avoid these false positives, this patch makes PAGE_TABLE_CHECK
> depends on EXCLUSIVE_SYSTEM_RAM. This dependency is understandable
> because PAGE_TABLE_CHECK is a hardening technique but /dev/mem without
> STRICT_DEVMEM (i.e., !EXCLUSIVE_SYSTEM_RAM) is itself a security
> problem.
> 
> Even with EXCLUSIVE_SYSTEM_RAM, I/O pages may be still allowed to be
> mapped via /dev/mem. However, these pages are always considered as named
> pages, so they won't break the logic used in the page table check.
> 
> Cc: <stable@vger.kernel.org> # 5.17
> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

