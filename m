Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4E2397047
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 11:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhFAJ1A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 05:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbhFAJ06 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Jun 2021 05:26:58 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366A9C06175F
        for <linux-usb@vger.kernel.org>; Tue,  1 Jun 2021 02:25:17 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso948454wmc.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Jun 2021 02:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lUvOHqo/Lw93HfZjg1cpwSyhO3hTI8CQC/Owemy4Ix0=;
        b=ve9tkK+lNU24xe7waJw5f+yzt3CYYqhvXm5AzQYRO3IS53DbhhG0eJuKx4TJPAjdhH
         tzbNVyMhXkfRTuGSmrJtODay1jVTwzcBKfNwLv17YRHCZkQHaNSF7+7G6BR6WsUSdeQT
         DYbmh2dnzXQXRaRtKU/Ck+hl7hjFwJmJSQLkeQQetJXD9QYBD/sFdCiYc5rRbZPUkTao
         PcfgS7n80IlV0my8h3d0WMUoe/TxJfJNWJQ8ILIGeojZzXreQcTg7ub4iXKl4qdmbaCw
         gnwCdbrLYSoMTs0f38OCbC6vUdCD8TgyNP2voPuGdvgh3bx6EfVDLdqQ7xUSfvZY10jA
         RKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lUvOHqo/Lw93HfZjg1cpwSyhO3hTI8CQC/Owemy4Ix0=;
        b=Oi+3dS+VlxVo8orwwWpGbjENGPp5YdpEbiUUJ7+Xuqyf4/AYzdxfJKJKx5a+0Wmzwj
         xvvcxxGdW6/NIXsxhi++eIuukJEL5QQfbuMqplfTNibdO6+8NRpZxzQovX4hE7k/ps5t
         n1ckHHLiUNKAHOyWcNXiePLkueCzIjOtwF2yPJjWdJBJjhABTYJ7ggKbpqfuQViIkvzm
         0IRpPnF8LKjq28/9Zivs7CZjtSZQEwDPCnO/Cyxvp190rqHJIbmvNJ+8XzBFgwUviKXP
         69R272i447QM0SymacUb/AOrFIfOzZbYld7EzxaG0bcTgQ1h+Ct1UTg2PIKqla1+kjdt
         X4bA==
X-Gm-Message-State: AOAM531cmO96ZMGRUG6+9LLVUIt5kko1puxJ3TeQswaz2vBFb0vVAqBW
        4kjeklCPByugDX03d10eUxsFkw==
X-Google-Smtp-Source: ABdhPJwogak5rFHzumPcquLkCKp2KsdlXeQ7KHJw9U/D6ZFGvVTht59amxTvQUij/hL/9Q7stCcuNg==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr3573089wmf.113.1622539515780;
        Tue, 01 Jun 2021 02:25:15 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id k82sm2042554wmf.11.2021.06.01.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 02:25:15 -0700 (PDT)
Date:   Tue, 1 Jun 2021 10:25:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 21/24] usb: host: xhci: Move array of structs from the
 stack onto the heap
Message-ID: <20210601092513.GC543307@dell>
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-22-lee.jones@linaro.org>
 <8551978f-27b0-767e-f92b-e96ab3064b33@gmail.com>
 <20210526144451.GB543307@dell>
 <ad5d3a04-c065-675e-c53f-5d48b6367c89@gmail.com>
 <20210526152835.GE543307@dell>
 <23bb1fc5-acff-74a6-c67a-11b0e0d85011@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23bb1fc5-acff-74a6-c67a-11b0e0d85011@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 27 May 2021, Mathias Nyman wrote:

> On 26.5.2021 18.28, Lee Jones wrote:
> > On Wed, 26 May 2021, Sergei Shtylyov wrote:
> > 
> >> On 5/26/21 5:44 PM, Lee Jones wrote:
> >>
> >> [...]
> >>>>> Fixes the following W=1 kernel build warning(s):
> >>>>>
> >>>>>  drivers/usb/host/xhci.c: In function ‘xhci_reserve_bandwidth’:
> >>>>>  drivers/usb/host/xhci.c:2859:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> >>>>>
> >>>>> Cc: Mathias Nyman <mathias.nyman@intel.com>
> >>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>>>> Cc: linux-usb@vger.kernel.org
> >>>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >>>>> ---
> >>>>>  drivers/usb/host/xhci.c | 8 +++++++-
> >>>>>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> >>>>> index ac2a7d4288883..40ce4b4eb12ad 100644
> >>>>> --- a/drivers/usb/host/xhci.c
> >>>>> +++ b/drivers/usb/host/xhci.c
> >>>> [...]
> >>>>> @@ -2788,6 +2788,10 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
> >>>>>  		return -ENOMEM;
> >>>>>  	}
> >>>>>  
> >>>>> +	ep_bw_info = kzalloc(sizeof(*ep_bw_info) * 31, GFP_KERNEL);
> 
> GFP_KERNEL might not be suitable for all cases.
> 
> xhci_reserve_bandwidth() is called from xhci_configure_endpoint(), which again
> is called from a lot of places.
> For example from xhci_update_hub_device() which can be called with GFP_NOIO mem_flags.

What do you suggest as an alternative?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
