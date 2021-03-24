Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C4C348556
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 00:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbhCXXcU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 19:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238675AbhCXXcL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 19:32:11 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ECAC06175F
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 16:32:10 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id w21-20020a9d63950000b02901ce7b8c45b4so233051otk.5
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 16:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VDfCQ7mDypdFgGP02/nPELkWSb7fPDTztukepFJIbL4=;
        b=R5R6IU6+nf9PEwIxttXJNeB5ZogHzhLJHJrml1vx4ANHnSTbJr5si8JL2GS5gXC9zz
         BoXA1OBshfj+mFu8DeqHG6xH2Rx9ast2qbJHxh7lo1WE71fIXVAFberGCjKcQt7nK2Bj
         EWVESIQwh4APGF8BCbhVdysdv0xPZBe29wNt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VDfCQ7mDypdFgGP02/nPELkWSb7fPDTztukepFJIbL4=;
        b=qbhrGJ/XRU5RitPZeZMPXgCb/p0IDLz5DMky84F0f78HbufVVTI2u8+vxDNJ2mXyUj
         NJMhxVYmSCoeN3kL8x6NNO9DAXwwyibLHNnUbbei7ABquS0T6rxC6jOjU7p1nxe+GBZL
         IigiGfy/Kei+4NwnT1KGqu2OwOIlMdnA6E+2fB5u3zyw+UNaflX2lK2EMSHo727qNXTC
         18/u5MNr7iR9kWa++7GO7CcnM1cxC5JJM3eN6MoLxe2hE3poNXgo9Wqd0Jgkpuzxs10p
         Awqm7FS/wYAGq0SwVih7WQJYi7qwLhYdhuM1V0E02K1H/gZCp4G6nd29KNYEqlqK0VQX
         We5A==
X-Gm-Message-State: AOAM5322LWooFUk/qCxHrKFc4wXzmM9a2+tMJ2+YjbIK0SQ17+WDhYCy
        nyf84us3c/pX5HVjIYycEg4wKA==
X-Google-Smtp-Source: ABdhPJxjgjkcJJR2C6hsgUV8ZIiDU3Y1ioDMXbixrlz+0Mex/FrHQE2WAD6nRDh7anrod1IfmzoKEg==
X-Received: by 2002:a05:6830:2472:: with SMTP id x50mr4972223otr.69.1616628730037;
        Wed, 24 Mar 2021 16:32:10 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id v65sm732795oib.42.2021.03.24.16.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 16:32:09 -0700 (PDT)
Subject: Re: [PATCH] tools: usbip: list.h: fix kernel-doc for list_del()
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210324000223.22043-1-rdunlap@infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0af7bfad-fff7-84be-8e7c-2ad3e93fb785@linuxfoundation.org>
Date:   Wed, 24 Mar 2021 17:32:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324000223.22043-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/23/21 6:02 PM, Randy Dunlap wrote:
> In list.h, the kernel-doc for list_del() should be immediately
> preceding the implementation and not separated from it by
> another function implementation.
> 
> Eliminates this kernel-doc error:
> list.h:1: warning: 'list_del' not found
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
>   tools/usb/usbip/libsrc/list.h |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> --- linux-next-20210323.orig/tools/usb/usbip/libsrc/list.h
> +++ linux-next-20210323/tools/usb/usbip/libsrc/list.h
> @@ -77,17 +77,17 @@ static inline void __list_del(struct lis
>   #define LIST_POISON1  ((void *) 0x00100100 + POISON_POINTER_DELTA)
>   #define LIST_POISON2  ((void *) 0x00200200 + POISON_POINTER_DELTA)
>   
> +static inline void __list_del_entry(struct list_head *entry)
> +{
> +	__list_del(entry->prev, entry->next);
> +}
> +
>   /**
>    * list_del - deletes entry from list.
>    * @entry: the element to delete from the list.
>    * Note: list_empty() on entry does not return true after this, the entry is
>    * in an undefined state.
>    */
> -static inline void __list_del_entry(struct list_head *entry)
> -{
> -	__list_del(entry->prev, entry->next);
> -}
> -
>   static inline void list_del(struct list_head *entry)
>   {
>   	__list_del(entry->prev, entry->next);
> 

Thank you for fixing this.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
