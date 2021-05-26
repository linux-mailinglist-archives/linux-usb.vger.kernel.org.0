Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065AE391BFC
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 17:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbhEZPaM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 11:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhEZPaL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 11:30:11 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492EDC061574
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 08:28:39 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n4so1593081wrw.3
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DqGWzSetuJV5yU6UPV/mQ1JntSoPe9tC6OnrezMJZ1s=;
        b=CzjVtl2pHIqRyEzxlJBTKHFNfdZi85fSQipYLTp+y2ILFDF9Z5G5HqWmuqBLUimdDL
         thVRnXK+n9HEUIrzIpzS6RN16nbeww4sxqDbZcsmmOY3YXA0CZ0IrzhLTgMabtPNBQHC
         hc+2WDxXBoRvlgjjklhzEVLnf5t6DCwnjbjidqsDLUvEZ8KYQ06ifXcEw/td7GVVN/aR
         CyonnsjanQmr5KTeTN6IzioWXZeHhH8wvCjYcYl/7rw1NepziJjbNf1JBDCw5NdG+d/J
         qzNitKyW+Tg+DtBbAcdBlfVqH6SYHS7G7WD3wVPj/gXlDd4gMyPBqqzEWQYS4Xlyu4Kq
         fqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DqGWzSetuJV5yU6UPV/mQ1JntSoPe9tC6OnrezMJZ1s=;
        b=ZvE5CJqj6ukf88ZmYWe1QRdlK+f7+Vadu+S1b70ehIbdJ0qYkdpfR+uCQfgW1lZA9S
         vO4ISkLnl30xj9fxKfXUgGQixDzIXuXAJIme0E0u+VY7t99wUqrnwegEW1ZfXcFN6WR1
         EDclXtDnF/x+hT1eHi4CEj54J/OhT1EDvCyMhDA+xbIlolnobXYONLkSsLJd8rVOpvnS
         BRdhL+HYMVhcJKzFa5MWO9p14dV7M1NP7P7Kc71PPKXi9MxDhFtW79HMEs78tzswfAlM
         Meg9MmaAXFlh0U7Nl+vMCu72jDIlxy0mikUdW7NeDrRIGkhAxNzde/mokVvI0w+qOoUp
         FpMw==
X-Gm-Message-State: AOAM533A6pYPEFCDIKAAV5Uar/v7eYg/I65CIfwq3d7wZOiu7BOJs//T
        xaKL8xzdSvDCR+ELbcgDIv06Lw==
X-Google-Smtp-Source: ABdhPJzsAR+2ItQN3p3yxI8OUH7dyFhf6pOmXZtZKiXpGfslhAKxCUlmOQmJ4AbqiBvzIWi++8f5oA==
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr33077154wrn.85.1622042917923;
        Wed, 26 May 2021 08:28:37 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id g6sm7054803wmg.10.2021.05.26.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 08:28:37 -0700 (PDT)
Date:   Wed, 26 May 2021 16:28:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 21/24] usb: host: xhci: Move array of structs from the
 stack onto the heap
Message-ID: <20210526152835.GE543307@dell>
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-22-lee.jones@linaro.org>
 <8551978f-27b0-767e-f92b-e96ab3064b33@gmail.com>
 <20210526144451.GB543307@dell>
 <ad5d3a04-c065-675e-c53f-5d48b6367c89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad5d3a04-c065-675e-c53f-5d48b6367c89@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 26 May 2021, Sergei Shtylyov wrote:

> On 5/26/21 5:44 PM, Lee Jones wrote:
> 
> [...]
> >>> Fixes the following W=1 kernel build warning(s):
> >>>
> >>>  drivers/usb/host/xhci.c: In function ‘xhci_reserve_bandwidth’:
> >>>  drivers/usb/host/xhci.c:2859:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> >>>
> >>> Cc: Mathias Nyman <mathias.nyman@intel.com>
> >>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >>> Cc: linux-usb@vger.kernel.org
> >>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >>> ---
> >>>  drivers/usb/host/xhci.c | 8 +++++++-
> >>>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> >>> index ac2a7d4288883..40ce4b4eb12ad 100644
> >>> --- a/drivers/usb/host/xhci.c
> >>> +++ b/drivers/usb/host/xhci.c
> >> [...]
> >>> @@ -2788,6 +2788,10 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
> >>>  		return -ENOMEM;
> >>>  	}
> >>>  
> >>> +	ep_bw_info = kzalloc(sizeof(*ep_bw_info) * 31, GFP_KERNEL);
> >>
> >>    Why not kcalloc()?
> > 
> > No particular reason.  Muscle memory I guess.
> > 
> > Happy either way.
> 
>     kcalloc( is designed for allocatiung arrays and clearing them, like calloc(),
> so let's stick wuth it...

No problem.  Will fix.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
