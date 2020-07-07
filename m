Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A950F2165D3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 07:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgGGFOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 01:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgGGFOa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 01:14:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CC8C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 22:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=IHBr7YBioQFedRZMv+TnMAhr/zFXYnw6gYFvcL24IHY=; b=Y55GstxHv+JtheKCyz81yiZVVI
        +qGVcPRqmBjP++PGlpQ7RoFg//UbdjV5WzIIzWQgr2FL82IwDyGtqI7ij2yk6ncU7gARBq/Fd1aDR
        4a0uZ+JfJTQhaUG6OB7L9ccRns0hb96k287V7PPbKSLxiPA+nadnSRD7/lZY2pvfXxnyVCijgfKEo
        4dDNOP4i2YpseD5aFGQAHtqMd7m6x/hSMWenYjqMWVLcZuVwX2PgAfiPYgR2XC5qaGValiCe78vvw
        Jj33B71XTAPGO62Pm/xAiP7+ii/6gQxnFqe3RQXjpEcrg+caxE7CilaNph81Nd+TYkx200Ws/Qft0
        XekhKicg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jsfw3-0008VQ-UB; Tue, 07 Jul 2020 05:14:29 +0000
Subject: Re: [PATCH 1/2] usb: correct kernel-doc inconsistency
To:     Colton Lewis <colton.w.lewis@protonmail.com>,
        gregkh@linuxfoundation.og
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
References: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6c25acb6-f702-0ce0-508d-d55080fe469f@infradead.org>
Date:   Mon, 6 Jul 2020 22:14:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/6/20 9:52 PM, Colton Lewis wrote:
> Silence documentation  build warning by correcting  kernel-doc comment
> for sub_validate_langid function.
> 
> ./drivers/usb/gadget/usbstring.c:77: warning: Function parameter or member 'langid' not described in 'usb_validate_langid'
> ./drivers/usb/gadget/usbstring.c:77: warning: Excess function parameter 'lang' description in 'usb_validate_langid'
> 
> Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
> ---
>  drivers/usb/gadget/usbstring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.c
> index 58a4d3325090..119505fac777 100644
> --- a/drivers/usb/gadget/usbstring.c
> +++ b/drivers/usb/gadget/usbstring.c
> @@ -68,7 +68,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_get_string);
>  
>  /**
>   * usb_validate_langid - validate usb language identifiers
> - * @lang: usb language identifier
> + * @langid: usb language identifier
>   *
>   * Returns true for valid language identifier, otherwise false.
>   */
> 

Hi,
I sent a patch for this on June 28, but it has not yet been merged anywhere
AFAIK.

-- 
~Randy

